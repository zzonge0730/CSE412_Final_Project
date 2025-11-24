# 2025-11-24 진행 상황 리포트 (LLVM 17 Porting)

## 1. 개요
이 문서는 LLVM 17 포팅 작업 중 발생한 인터넷 연결 문제로 중단된 시점까지의 분석 내용과 수정 사항, 그리고 향후 작업 가이드를 정리한 것입니다.

## 2. 해결하려던 문제
### A. 루프 내부 Safe Check 미검출 (MoveC-2mm.ll)
- **증상**: `MoveC-2mm.ll` 파일에는 루프 내부에 `__RV_check_dpv_ss` 호출이 존재하지만, `Loops` Pass가 이를 감지하지 못함.
- **원인 분석**:
  - `Loops.cpp`의 `getLoopStructures` 함수가 `main` 함수에서 도달 가능한(reachable) 함수만 분석 대상으로 삼음.
  - `MoveC` 계측 과정에서 `kernel_2mm` 함수 호출이 래퍼 함수나 간접 호출로 변경되어, `CallGraph` 분석에서 도달 불가능한 것으로 잘못 판단되었을 가능성 높음.
- **조치 사항 (완료)**:
  - `Catamaran-llvm-17/llvm/lib/Transforms/CMPass/Loops.cpp` 파일 수정 완료.
  - `reachable` 함수만 필터링하는 로직을 제거하고, **모듈 내의 모든 함수**를 순회하도록 변경함.
  - `delete functions;` (포인터 해제) 코드 제거함.

### B. MoveC γ 실행 시 즉시 종료 (MoveC-2mm)
- **증상**: 병렬화된 바이너리를 Docker에서 실행하면 아무런 출력 없이 즉시 종료됨.
- **원인 분석 (강한 추정)**:
  - **Loop-Free Task의 스택 변수 관리 문제 (Use-After-Return)**
  - `LoopFreeTask::genSpawnArgs`에서 `spawn` 함수에 전달할 환경 변수(`env`) 배열을 `AllocaInst`를 사용하여 **스택**에 할당함.
  - `spawn` 함수는 비동기 실행을 위해 태스크를 큐에 넣고 즉시 리턴할 수 있음.
  - 원본 함수(예: `kernel_2mm`)가 리턴하면 스택 프레임이 파괴되지만, 백그라운드 태스크는 이후에 실행되어 파괴된 스택 메모리(`env`)를 참조함.
  - `MoveC` 런타임(`_RV_memsafe.c`)의 스레드 안전성 문제일 수도 있음.

## 3. 향후 작업 가이드 (집에서 진행 시)

### 1단계: 환경 구축 (빌드)
인터넷 문제로 중단된 Docker 이미지를 다시 빌드해야 합니다.
```bash
# 1. 도커 이미지 빌드 (오래 걸림)
docker build -f docker/Dockerfile.llvm17 -t catamaran:llvm17 .

# 2. 컨테이너 실행
./scripts/run-docker-llvm17.sh
```

### 2단계: Catamaran 빌드 및 검증
컨테이너 내부(`/workspace`)에서 진행합니다.
```bash
# 1. 빌드 디렉토리 이동 및 빌드
cd build-catamaran-17
# cmake는 이미 설정되어 있다고 가정 (안되어 있으면 cmake .. -G Ninja ...)
ninja CMPass

# 2. DOALL 병렬화 활성화 확인 (로그 확인)
# Loops.cpp 수정 효과를 확인하는 단계
/opt/llvm-17/bin/opt \
  -load-pass-plugin=llvm/lib/Transforms/CMPass/CMPass.so \
  -passes='Loops' \
  -disable-output \
  ../../examples/llvm17/MoveC-2mm.ll 2>&1 | grep "DEBUG"
# 기대 결과: "Total functions count" 로그가 보이고, kernel_2mm 내부의 루프를 분석하는 로그가 보여야 함.
```

### 3단계: 실행 테스트 및 디버깅
```bash
# 1. 병렬화된 비트코드 생성
/opt/llvm-17/bin/opt \
  -load-pass-plugin=llvm/lib/Transforms/CMPass/CMPass.so \
  -passes='Loops' \
  -S ../../examples/llvm17/MoveC-2mm.ll \
  -o CM-MoveC-2mm.ll

# 2. 바이너리 컴파일
/opt/llvm-17/bin/clang++ \
  -O3 -pthread -std=c++17 \
  CM-MoveC-2mm.ll \
  ../../Catamaran-llvm-17/runtime/ThreadPool.cpp \
  -o CM-MoveC-2mm

# 3. 실행
./CM-MoveC-2mm
```

### 4단계: 문제 해결 시나리오
**시나리오 A: 여전히 즉시 종료되는 경우**
- `Loops.cpp`에서 `#define ENABLELOOPFREE 0`으로 설정하여 **Loop-Free 기능을 끄고** 다시 빌드(`ninja CMPass`) -> 실행 테스트.
- 만약 Loop-Free를 끄고 잘 돌아간다면, Loop-Free Task의 메모리 관리 문제가 확실함.
  - 해결책: `env` 변수를 힙(`malloc`)에 할당하고, 태스크 종료 시 해제(`free`)하도록 `LoopFreeTask.cpp` 수정 필요.

**시나리오 B: DOALL 병렬화가 여전히 안 되는 경우**
- `Loops.cpp`의 `IsSafeCheckCallForMovec` 함수에 `__RV_check_dpv_ss`가 잘 등록되어 있는지 재확인.
- `MoveC-2mm.ll` 파일의 루프 구조가 `LoopInfo`에 의해 잘 파악되는지 디버깅 필요.

## 4. 기타 참고 사항
- **ASAN**: MoveC 작업이 완료된 후 진행. LLVM 17 Native ASAN을 활용하는 방향으로 검토.
- **파일 수정 상태**: `Catamaran-llvm-17/llvm/lib/Transforms/CMPass/Loops.cpp` 파일은 이미 수정된 상태로 저장되어 있음.


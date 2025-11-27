# Catamaran 테스트 가이드

## 목차
1. [LLVM 3.4 환경 테스트](#llvm-34-환경-테스트)
2. [LLVM 17 환경 테스트](#llvm-17-환경-테스트)
3. [빠른 검증 테스트](#빠른-검증-테스트)

---

## LLVM 3.4 환경 테스트

### 1. Docker 컨테이너 진입

```bash
docker compose run --rm dev
```

### 2. Baseline 테스트 (α 버전)

```bash
cd /workspace

# 컴파일
./build-catamaran-3.4.0/bin/clang -O3 ./examples/2mm.c -o 2mm-baseline

# 실행 및 성능 측정
time ./2mm-baseline 1000 1000 1000 1000 0
```

### 3. SoftBoundCETS 테스트 (β 버전)

```bash
# SoftBoundCETS로 계측된 바이너리 컴파일
./softboundcets-34/softboundcets-llvm-clang34/Release+Asserts/bin/clang \
  -fsoftboundcets ./examples/2mm.c \
  -o SBCETS-2mm \
  -L./softboundcets-34/softboundcets-lib -lm -lrt

# 실행
time ./SBCETS-2mm 1000 1000 1000 1000 0
```

### 4. SoftBoundCETS + Catamaran 테스트 (γ 버전)

```bash
# 1. SoftBoundCETS로 IR 생성
./softboundcets-34/softboundcets-llvm-clang34/Release+Asserts/bin/clang \
  -S -emit-llvm -fsoftboundcets ./examples/2mm.c -o SBCETS-2mm.ll

# 2. Catamaran Pass 적용
./build-catamaran-3.4.0/bin/opt \
  -load ./build-catamaran-3.4.0/lib/libCMPass.so \
  -PDGAnalysis -catamaran-pdg-reaching-analysis -Loops \
  -S SBCETS-2mm.ll -o CM-SBCETS-2mm.ll

# 3. 바이너리 컴파일 (ThreadPool 런타임 링크)
./build-catamaran-3.4.0/bin/clang++ \
  -pthread -std=c++11 -DNUM_THREADS=3 \
  CM-SBCETS-2mm.ll ./runtime/ThreadPool.cpp \
  -o CM-SBCETS-2mm \
  -L./softboundcets-34/softboundcets-lib -lm -lrt

# 4. 실행
time ./CM-SBCETS-2mm 1000 1000 1000 1000 0
```

### 5. MoveC 테스트 (β 버전)

**참고**: MoveC 바이너리가 Docker 컨테이너에서 실행 불가하므로, 기존 IR 파일 사용

```bash
# 기존 IR 파일이 있다면 사용
# MoveC-2mm.ll 또는 MoveC-movec.bc 파일 사용
```

### 6. MoveC + Catamaran 테스트 (γ 버전)

```bash
# 1. 기존 MoveC IR 파일 사용 (MoveC-movec.bc 또는 MoveC-2mm.ll)
# 또는 호스트에서 MoveC 실행하여 IR 생성 후 사용

# 2. Catamaran Pass 적용
./build-catamaran-3.4.0/bin/opt \
  -load ./build-catamaran-3.4.0/lib/libCMPass.so \
  -movec -PDGAnalysis -catamaran-pdg-reaching-analysis -LoopsMovec \
  < MoveC-movec.bc -o CM-MoveC-2mm.bc

# 3. 바이너리 컴파일
./build-catamaran-3.4.0/bin/clang++ \
  -pthread -std=c++11 -DNUM_THREADS=3 \
  CM-MoveC-2mm.bc ./runtime/ThreadPool.cpp \
  -o CM-MoveC-2mm

# 4. 실행
time ./CM-MoveC-2mm 1000 1000 1000 1000 0
```

### 7. Pass 단독 테스트 (디버깅용)

```bash
# PDGAnalysis만 실행
./build-catamaran-3.4.0/bin/opt \
  -load ./build-catamaran-3.4.0/lib/libCMPass.so \
  -PDGAnalysis \
  < MoveC-movec.bc -o /dev/null

# Loops Pass만 실행
./build-catamaran-3.4.0/bin/opt \
  -load ./build-catamaran-3.4.0/lib/libCMPass.so \
  -Loops \
  < SBCETS-2mm.ll -o CM-SBCETS-2mm.ll
```

---

## LLVM 17 환경 테스트

### 1. Docker 컨테이너 진입

```bash
./setup-llvm17-port.sh
# 또는
./run-docker-llvm17.sh
```

### 2. 빌드 확인

```bash
cd /workspace/build-catamaran-17
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release ../Catamaran-llvm-17
ninja CMPass
```

### 3. Baseline 테스트 (α 버전)

```bash
cd /workspace

# 컴파일
/opt/llvm-17/bin/clang -O3 ./examples/2mm.c -o 2mm

# 실행
time ./2mm 1000 1000 1000 1000 0
```

### 4. MoveC + Catamaran 테스트 (γ 버전)

```bash
cd /workspace/build-catamaran-17

# 1. 테스트 IR 파일 사용 (또는 MoveC로 생성한 IR)
# examples/llvm17/test_llvm17_movec.ll 사용

# 2. Catamaran Pass 적용
/opt/llvm-17/bin/opt \
  -load-pass-plugin=./llvm/lib/Transforms/CMPass/CMPass.so \
  -passes='Loops' \
  -S ../../examples/llvm17/test_llvm17_movec.ll \
  -o CM-MoveC-2mm.ll

# 3. 바이너리 컴파일
/opt/llvm-17/bin/clang++ \
  -O3 -pthread -std=c++17 \
  CM-MoveC-2mm.ll \
  ../../Catamaran-llvm-17/runtime/ThreadPool.cpp \
  -o CM-MoveC-2mm

# 4. 실행
time ./CM-MoveC-2mm
```

### 5. ASAN + Catamaran 테스트 (γ 버전)

```bash
cd /workspace/build-catamaran-17

# 1. ASAN 계측 IR 생성
/opt/llvm-17/bin/clang \
  -S -emit-llvm -fsanitize=address -O1 \
  ../../examples/2mm.c \
  -o ASAN-2mm.ll

# 또는 테스트 IR 파일 사용
# ../../examples/llvm17/test_llvm17_asan.ll

# 2. Catamaran Pass 적용
/opt/llvm-17/bin/opt \
  -load-pass-plugin=./llvm/lib/Transforms/CMPass/CMPass.so \
  -passes='Loops' \
  -S ../../examples/llvm17/test_llvm17_asan.ll \
  -o CM-ASAN-2mm.ll

# 3. 바이너리 컴파일 (dummy ASAN runtime 링크)
/opt/llvm-17/bin/clang++ \
  -O3 -pthread -std=c++17 \
  CM-ASAN-2mm.ll \
  ../../Catamaran-llvm-17/runtime/ThreadPool.cpp \
  ../../Catamaran-llvm-17/runtime/dummy_asan.cpp \
  -o CM-ASAN-2mm

# 4. 실행
time ./CM-ASAN-2mm 1000 1000 1000 1000 0
```

---

## 빠른 검증 테스트

### LLVM 3.4: Pass 로드 확인

```bash
docker compose run --rm dev bash -c "cd /workspace && \
  ./build-catamaran-3.4.0/bin/opt \
  -load ./build-catamaran-3.4.0/lib/libCMPass.so \
  -help | grep -i 'PDGAnalysis\|Loops'"
```

### LLVM 17: Pass 로드 확인

```bash
./setup-llvm17-port.sh
# 컨테이너 안에서:
/opt/llvm-17/bin/opt \
  -load-pass-plugin=./llvm/lib/Transforms/CMPass/CMPass.so \
  -passes='help' | grep -i 'loops'
```

### 간단한 IR 파일로 테스트

```bash
# LLVM 3.4
cat > /tmp/test.ll << 'EOF'
define i32 @main() {
  entry:
    ret i32 0
}
EOF

./build-catamaran-3.4.0/bin/opt \
  -load ./build-catamaran-3.4.0/lib/libCMPass.so \
  -PDGAnalysis < /tmp/test.ll -o /dev/null
```

---

## 성능 비교 예시

### LLVM 3.4 (PolyBench 2mm, N=1000)

| 버전 | 실행 시간 | 메모리 |
|------|----------|--------|
| Baseline (α) | ~2.86초 | 16640KB |
| SoftBoundCETS (β) | ~16.92초 | 17408KB |
| SoftBoundCETS + Catamaran (γ) | ~15-18초 | - |
| MoveC (β) | ~94.68초 | 16768KB |
| MoveC + Catamaran (γ) | ~103초 | - |

### LLVM 17 (작은 입력값 128×128)

| 버전 | 실행 시간 | 비고 |
|------|----------|------|
| MoveC Sequential | ~0.018초 | - |
| MoveC + Catamaran | ~0.018초 | 146 tasks 생성 |

---

## 문제 해결

### 1. "undefined reference to spawn" 에러

**원인**: `spawn` 함수 인자 개수가 ThreadPool 제한(33개) 초과

**해결**: LLVM 3.4에서는 배치 크기를 2개로 제한 (이미 적용됨)
- `Loops.cpp`에서 `BATCH_SIZE = 2` 설정 확인

### 2. "Instruction does not dominate all uses" 에러

**원인**: 명령어 순서 불일치

**해결**: LLVM 3.4에서는 이미 수정됨
- `Loops.cpp`에서 BasicBlock 순서대로 수집
- `LoopFreeTask.cpp`에서 `multiCheckStartPt` 우선 사용

### 3. GLIBC 버전 불일치

**증상**: 호스트에서 빌드한 바이너리가 Docker에서 실행 불가

**해결**: 모든 빌드는 Docker 컨테이너 내에서 수행

### 4. Pass 로드 실패

**LLVM 3.4**:
```bash
# 라이브러리 경로 확인
ls -lh ./build-catamaran-3.4.0/lib/libCMPass.so

# 의존성 확인
ldd ./build-catamaran-3.4.0/lib/libCMPass.so
```

**LLVM 17**:
```bash
# 라이브러리 경로 확인
ls -lh ./llvm/lib/Transforms/CMPass/CMPass.so

# LD_LIBRARY_PATH 설정 (필요시)
export LD_LIBRARY_PATH=/opt/llvm-17/lib:$LD_LIBRARY_PATH
```

---

## 참고 파일

- `README.md`: 기본 사용법
- `docs/reproduction.md`: LLVM 3.4 재현 가이드
- `docs/llvm17-port/STATUS.md`: LLVM 17 포팅 상태
- `docs/PROJECT_STATUS.md`: 프로젝트 상태 및 알려진 이슈

# LLVM 14 이식 작업 진행 상황

## 작업 개요
Catamaran 프로젝트를 LLVM 3.4에서 LLVM 14로 이식하는 작업

## 완료된 작업

### 1. Docker 환경 구축 ✅
- **파일**: `Dockerfile.llvm14`
- **내용**: 
  - Multi-stage 빌드 (LLVM 14 빌드 + 런타임 이미지)
  - LLVM 14.0.6 소스 빌드
  - MoveC 설치
  - 필요한 의존성 설치 (cmake, ninja, boost 등)
- **수정 사항**:
  - `libncurses6-dev` → `libncurses-dev` (Ubuntu 22.04 호환)
  - 런타임 스테이지에 `build-essential` 추가 (ThreadPool.cpp 컴파일용)
  - 작업 디렉토리를 `/workspace`로 변경 (docker-compose.yml과 일치)

### 2. 빌드/실행 스크립트 ✅
- **파일**: 
  - `build-docker.sh` - Docker 이미지 빌드
  - `run-docker-llvm14.sh` - 컨테이너 실행
- **기능**: 볼륨 마운트, 환경 변수 설정

### 3. 이식 가이드 문서 ✅
- **파일**: `LLVM14_PORTING_GUIDE.md`
- **내용**: LLVM 14 이식 방법, API 변경사항, 작업 순서

### 4. 작업 워크플로우 문서 ✅
- **파일**: `LLVM14_WORKFLOW.md`
- **내용**: 단계별 작업 순서, 반복 작업 팁

### 5. 소스 코드 복사 ✅
- **디렉토리**: `Catamaran-llvm-14/`
- **작업**: `Catamaran-llvm-3.4.0` 전체를 복사하여 LLVM 14 이식 작업용으로 준비

### 6. 빌드 환경 설정 ✅
- **디렉토리**: `build-catamaran-14/`
- **CMake 설정**:
  ```bash
  -DCMAKE_BUILD_TYPE=Release
  -DLLVM_DIR=$LLVM14/lib/cmake/llvm
  -DCMAKE_CXX_STANDARD=17
  -DLLVM_ENABLE_WERROR=OFF
  -DLLVM_ENABLE_WARNINGS=OFF
  -DCMAKE_CXX_FLAGS="-Wno-class-memaccess -Wno-narrowing"
  -DLLVM_BUILD_RUNTIME=OFF  # compiler-rt 제외
  ```

### 7. 빌드 에러 수정 ✅
- **문제**: `sys/ustat.h` 없음 (Ubuntu 22.04)
- **해결**: `sanitizer_platform_limits_posix.cc`에서 조건부 include 추가
- **문제**: `std::accumulate` 미정의
- **해결**: `Decider.cpp`에 `#include <numeric>` 추가
- **문제**: compiler-rt 빌드 에러 (`ipc_perm` 구조체 레이아웃 불일치)
- **해결**: `-DLLVM_BUILD_RUNTIME=OFF`로 compiler-rt 빌드 제외

### 8. CMakeLists.txt 수정 ✅
- **파일**: `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/CMakeLists.txt`
- **상태**: 현재는 LLVM 3.4 스타일 유지 (SHARED, add_dependencies)
- **참고**: 나중에 LLVM 14 스타일로 변경 예정 (MODULE, target_link_libraries)

### 9. 빌드 성공 ✅
- **결과**: `lib/libCMPass.so` 생성 완료
- **경고**: 일부 함수에서 return 경고 (기능상 문제 없음)

## 현재 상태

### 빌드 가능한 상태
- ✅ LLVM 14 SDK 설치 완료
- ✅ Catamaran 소스 코드 복사 완료
- ✅ CMPass 빌드 성공 (LLVM 3.4 코드를 LLVM 14 SDK로 빌드)

### 다음 단계
- ⏳ C++ 소스 코드를 LLVM 14 API로 이식
  - PassManager 전환 (구 → 새)
  - API 업데이트 (`getNumUses()` → `use_empty()` 등)
  - 헤더 파일 경로 수정
- ⏳ CMakeLists.txt를 LLVM 14 스타일로 업데이트
- ⏳ 테스트 및 검증

## 주요 파일 위치

### Docker 관련
- `Dockerfile.llvm14` - LLVM 14 Docker 이미지 정의
- `build-docker.sh` - 이미지 빌드 스크립트
- `run-docker-llvm14.sh` - 컨테이너 실행 스크립트

### 문서
- `LLVM14_PORTING_GUIDE.md` - 상세 이식 가이드
- `LLVM14_WORKFLOW.md` - 작업 워크플로우
- `LLVM14_PORTING_PROGRESS.md` - 이 파일 (진행 상황)

### 소스 코드
- `Catamaran-llvm-14/` - LLVM 14 이식 작업용 소스
  - `llvm/lib/Transforms/CMPass/` - CMPass 소스 코드
  - `llvm/lib/Transforms/CMPass/CMakeLists.txt` - 빌드 설정

### 빌드 결과
- `build-catamaran-14/` - 빌드 디렉토리
  - `lib/libCMPass.so` - 빌드된 CMPass 라이브러리

## 알려진 이슈

1. **경고 메시지**: 일부 함수에서 return 경고 (기능상 문제 없음)
   - `AccumulatorOpInfo.cpp:73` - `accumOpForType()` 함수
   - `Utils.cpp:416` - `instHappensBefore()` 함수

2. **compiler-rt 제외**: 현재 compiler-rt는 빌드하지 않음
   - Catamaran은 CMPass만 필요하므로 문제 없음
   - 나중에 필요하면 별도로 처리

## 작업 일지

### 2024-11-18
- Docker 환경 구축 완료
- 빌드 환경 설정 완료
- CMPass 빌드 성공
- CMakeLists.txt 기본 수정 완료

## 다음 작업 우선순위

1. **Loops.cpp** - Pass 등록 코드 수정 (가장 중요)
2. **PDGAnalysis.cpp** - API 업데이트
3. **LoopsMovec.cpp** - Pass 등록 방식 변경
4. 나머지 파일들 순차적 수정


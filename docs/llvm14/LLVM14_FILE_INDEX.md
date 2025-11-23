# LLVM 14 이식 작업 파일 인덱스

이 문서는 LLVM 14 이식 작업과 관련된 모든 파일의 위치와 역할을 정리합니다.

## 루트 디렉토리 파일

### Docker 관련
| 파일 | 설명 | 상태 |
|------|------|------|
| `Dockerfile.llvm14` | LLVM 14 Docker 이미지 정의 (multi-stage) | ✅ 완료 |
| `build-docker.sh` | Docker 이미지 빌드 스크립트 | ✅ 완료 |
| `run-docker-llvm14.sh` | Docker 컨테이너 실행 스크립트 | ✅ 완료 |
| `docker-compose.yml` | 기존 LLVM 3.4용 docker-compose 설정 | 참고용 |

### 문서
| 파일 | 설명 | 상태 |
|------|------|------|
| `LLVM14_PORTING_GUIDE.md` | LLVM 14 이식 상세 가이드 | ✅ 완료 |
| `LLVM14_WORKFLOW.md` | 작업 워크플로우 및 순서 | ✅ 완료 |
| `LLVM14_PORTING_PROGRESS.md` | 작업 진행 상황 및 완료 내역 | ✅ 완료 |
| `LLVM14_FILE_INDEX.md` | 이 파일 (파일 인덱스) | ✅ 완료 |

### 스크립트
| 파일 | 설명 | 상태 |
|------|------|------|
| `setup-llvm14-port.sh` | 이식 환경 자동 설정 스크립트 | ✅ 완료 (선택사항) |

## 디렉토리 구조

### Catamaran-llvm-14/
LLVM 14 이식 작업용 소스 코드 디렉토리

#### llvm/lib/Transforms/CMPass/
CMPass 소스 코드

| 파일/디렉토리 | 설명 | 수정 상태 |
|--------------|------|----------|
| `CMakeLists.txt` | 빌드 설정 파일 | ✅ LLVM 3.4 스타일로 수정 완료 (나중에 LLVM 14 스타일로 변경 예정) |
| `*.cpp` | CMPass 구현 파일들 | ⏳ LLVM 14 API로 이식 필요 |
| `*.h` | CMPass 헤더 파일들 | ⏳ LLVM 14 API로 이식 필요 |

**주요 파일 목록:**
- `Loops.cpp` - Pass 등록 및 실행 로직 (우선 수정 필요)
- `LoopsMovec.cpp` - MoveC용 Pass 등록
- `PDGAnalysis.cpp` - PDG 분석 (API 업데이트 필요)
- `PDG.cpp` - PDG 구현
- 기타 30+ 파일들

#### llvm/lib/Analyses/
분석 관련 파일들

| 파일 | 설명 | 수정 상태 |
|------|------|----------|
| `Decider.cpp` | 의사결정 로직 | ✅ `#include <numeric>` 추가 완료 |
| 기타 파일들 | | ⏳ 확인 필요 |

#### llvm/projects/
프로젝트 관련 파일들

| 디렉토리 | 설명 | 상태 |
|----------|------|------|
| `compiler-rt.disabled/` | compiler-rt (비활성화됨) | ⚠️ 빌드에서 제외됨 |

**수정된 파일:**
- `compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.cc`
  - `sys/ustat.h` 조건부 include 추가
  - Ubuntu 22.04 호환성 수정

### build-catamaran-14/
빌드 디렉토리

| 파일/디렉토리 | 설명 | 상태 |
|--------------|------|------|
| `lib/libCMPass.so` | 빌드된 CMPass 라이브러리 | ✅ 빌드 완료 |
| `CMakeCache.txt` | CMake 캐시 | 자동 생성 |
| 기타 빌드 산출물 | | 자동 생성 |

### Catamaran-llvm-14-sample/
샘플 Hello Pass (참고용)

| 파일 | 설명 | 상태 |
|------|------|------|
| `llvm/lib/Transforms/Hello/Hello.cpp` | LLVM 14 스타일 Hello Pass 예제 | ✅ 완료 |
| `llvm/lib/Transforms/Hello/CMakeLists.txt` | LLVM 14 스타일 CMakeLists.txt 예제 | ✅ 완료 |

## 수정 이력

### Dockerfile.llvm14
- 초기 생성: LLVM 14 빌드 환경 구축
- 수정 1: `libncurses6-dev` → `libncurses-dev` (Ubuntu 22.04 호환)
- 수정 2: 런타임 스테이지에 `build-essential` 추가
- 수정 3: 작업 디렉토리를 `/workspace`로 변경

### Catamaran-llvm-14/llvm/lib/Transforms/CMPass/CMakeLists.txt
- 초기: LLVM 3.4 스타일 (SHARED, add_dependencies)
- 수정 1: 주석 추가, 포맷 정리
- 향후: LLVM 14 스타일로 변경 예정 (MODULE, target_link_libraries)

### Catamaran-llvm-14/llvm/lib/Analyses/Decider.cpp
- 수정: `#include <numeric>` 추가 (std::accumulate 사용)

### Catamaran-llvm-14/llvm/projects/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.cc
- 수정: `sys/ustat.h` 조건부 include 추가 (Ubuntu 22.04 호환)

## 파일 찾기 가이드

### 특정 작업을 찾고 싶을 때

- **Docker 관련**: 루트 디렉토리의 `Dockerfile.llvm14`, `build-docker.sh`, `run-docker-llvm14.sh`
- **이식 가이드**: `LLVM14_PORTING_GUIDE.md`
- **작업 순서**: `LLVM14_WORKFLOW.md`
- **진행 상황**: `LLVM14_PORTING_PROGRESS.md`
- **CMPass 소스**: `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/`
- **빌드 결과**: `build-catamaran-14/lib/libCMPass.so`

### 수정이 필요한 파일

1. **우선순위 높음**:
   - `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/Loops.cpp`
   - `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/PDGAnalysis.cpp`
   - `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/LoopsMovec.cpp`

2. **우선순위 중간**:
   - `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/CMakeLists.txt` (LLVM 14 스타일로 변경)
   - 기타 CMPass 소스 파일들

3. **우선순위 낮음**:
   - 기타 분석 파일들

## 참고 파일

### 기존 프로젝트 (참고용)
- `Catamaran-llvm-3.4.0/` - 원본 LLVM 3.4 기반 Catamaran
- `Catamaran-llvm-3.5.2/` - LLVM 3.5.2 기반 Catamaran (ASAN용)
- `build-catamaran-3.4.0/` - 기존 빌드 결과

### 문서
- `README.md` - 프로젝트 전체 README
- `PROJECT_STATUS.md` - 프로젝트 상태 (기존 작업 내역)
- `BUILD_SUMMARY.md` - 빌드 요약


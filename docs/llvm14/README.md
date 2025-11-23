# LLVM 14 포팅 문서 디렉토리

이 디렉토리는 Catamaran을 LLVM 3.4에서 LLVM 14로 포팅하는 작업과 관련된 모든 문서를 포함합니다.

## 문서 목록

### 작업 일지
- **`2024-11-18_SESSION_LOG.md`** - 2024년 11월 18일 작업 일지
  - 작업 위치: `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/`
  - 오늘 해결한 모든 문제와 변경 사항 기록

### 가이드 문서
- **`LLVM14_PORTING_GUIDE.md`** - LLVM 14 이식 상세 가이드
  - 작업 위치: `Catamaran-llvm-14/`
  - PassManager 변경, API 업데이트 방법 등

- **`LLVM14_WORKFLOW.md`** - 작업 워크플로우
  - 작업 위치: 전체 프로젝트
  - 단계별 작업 순서 및 반복 작업 팁

### 진행 상황
- **`LLVM14_PORTING_PROGRESS.md`** - 전체 진행 상황
  - 작업 위치: 전체 프로젝트
  - 완료된 작업, 현재 상태, 다음 단계

- **`LLVM14_FILE_INDEX.md`** - 파일 인덱스
  - 작업 위치: 전체 프로젝트
  - 모든 관련 파일의 위치와 역할 정리

### 빌드 및 테스트
- **`BUILD_SUCCESS_SUMMARY.md`** - 빌드 성공 요약
  - 작업 위치: `build-catamaran-14/`
  - 해결된 문제와 빌드 설정

- **`OPT_LOAD_TEST_STEPS.md`** - opt 로드 테스트 단계
  - 작업 위치: `build-catamaran-14/`
  - opt에 CMPass 로드하는 방법

- **`OPT_LOAD_TEST_GUIDE.md`** - opt 로드 가이드
  - 작업 위치: `build-catamaran-14/`
  - 상세한 로드 테스트 가이드

- **`TEST_CMPASS_LOAD.md`** - CMPass 로드 테스트 가이드
  - 작업 위치: `build-catamaran-14/`
  - 종합적인 로드 테스트 가이드

## 문서 구조

각 문서는 다음 정보를 포함합니다:
- **작업 위치**: 해당 작업이 수행된 디렉토리/파일 경로
- **문제 설명**: 해결한 문제의 상세 설명
- **해결 방법**: 적용한 해결책
- **변경 파일**: 수정된 파일 목록

## 빠른 참조

### 오늘의 작업을 확인하려면
→ `2024-11-18_SESSION_LOG.md`

### 이식 방법을 알고 싶다면
→ `LLVM14_PORTING_GUIDE.md`

### 전체 진행 상황을 확인하려면
→ `LLVM14_PORTING_PROGRESS.md`

### 특정 파일의 위치를 찾으려면
→ `LLVM14_FILE_INDEX.md`

### 빌드 및 테스트 방법을 알고 싶다면
→ `BUILD_SUCCESS_SUMMARY.md`, `OPT_LOAD_TEST_GUIDE.md`


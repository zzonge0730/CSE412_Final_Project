# 2024-11-18 작업 요약

## 완료된 작업

### 1. LLVM 14 Segmentation Fault 문제 분석
- **문제**: `opt -load-pass-plugin=libCMPass.so` 실행 시 Segmentation Fault 발생
- **원인**: 플러그인 로드 시 LLVM 라이브러리에 포함된 레거시 PassManager 전역 생성자가 실행되면서 충돌
- **증상**: `_GLOBAL__sub_I_LegacyPassManager.cpp` → `cl::Option::addArgument()` 충돌
- **결과**: LLVM 14에서 근본적인 해결 불가능 확인

### 2. 해결 시도 (모두 실패)
시도한 방법들:
1. 라이브러리 링크 최소화 (`LLVMAnalysis` 제거)
2. 심볼 가시성 변경 및 링커 옵션 (`-znodelete`, `constructor(101)`)
3. `--enable-new-pm=0` 옵션 시도
4. `-passes=` 옵션 없이 레거시 PassManager 방식으로 로드

**결론**: 플러그인 로드 시마다 동일한 충돌 발생

### 3. LLVM 버전 업그레이드 결정
- **분석**: LLVM 15, 16, 17 비교
- **결정**: **LLVM 17 (또는 16)**
- **이유**:
  - Legacy PassManager 완전 퇴출 (충돌 문제 근본 해결)
  - Opaque Pointers 강제 적용 (코드 단순화)
  - 풍부한 최신 예제 및 튜토리얼
- **문서**:
  - `LLVM_VERSION_UPGRADE_ANALYSIS.md` - 상세 분석
  - `LLVM17_UPGRADE_DECISION.md` - 결정 사항 기록

### 4. LLVM 17 Docker 환경 구축
- **파일 생성**:
  - `Dockerfile.llvm17` - LLVM 17.0.6 빌드 및 설치
  - `run-docker-llvm17.sh` - 컨테이너 실행 스크립트
  - `DOCKER_LLVM17_SETUP.md` - 설정 가이드
- **빌드 완료**:
  - Docker 이미지: `catamaran:llvm17`
  - LLVM 17.0.6 설치 확인: ✅
  - `clang version 17.0.6` 정상 작동: ✅
  - `LLVM version 17.0.6` 정상 작동: ✅

## 생성된 파일

### Docker 관련
- `Dockerfile.llvm17` - LLVM 17 빌드 및 설치
- `run-docker-llvm17.sh` - 컨테이너 실행 스크립트

### 문서
- `LLVM_VERSION_UPGRADE_ANALYSIS.md` - 버전 비교 분석
- `LLVM17_UPGRADE_DECISION.md` - 업그레이드 결정 문서
- `DOCKER_LLVM17_SETUP.md` - Docker 설정 가이드
- `2024-11-18_SESSION_LOG.md` - 작업 일지 (업데이트됨)

## 다음 세션 시작 지점

### 현재 상태
- ✅ LLVM 17 Docker 환경 구축 완료
- ✅ LLVM 17.0.6 설치 및 확인 완료
- ⏳ Catamaran 소스 포팅 준비 완료

### 다음 작업 (우선순위 순)
1. **Catamaran 소스 준비**
   - `Catamaran-llvm-14` → `Catamaran-llvm-17` 복사
   - 빌드 디렉토리 생성: `/workspace/build-catamaran-17`

2. **CMakeLists.txt 업데이트**
   - LLVM 17 API 변경사항 반영
   - New PassManager 플러그인 설정

3. **Pass 플러그인 재작성**
   - Legacy `RegisterPass` 제거
   - `llvmGetPassPluginInfo()` 방식으로 재작성
   - `Loops.cpp`에 예제 코드 참고하여 구현

4. **Opaque Pointers 전환**
   - `PointerType::getUnqual()` 제거 (47개 발견)
   - `getPointerElementType()` 제거
   - 타입 캐스팅 코드 단순화
   - 주요 파일: `InterTask.cpp`, `LoopFreeTask.cpp`, `DOALLTask.cpp`, `EnvBuilder.cpp`

5. **빌드 및 테스트**
   - 빌드 테스트
   - 플러그인 로드 테스트: `opt -load-pass-plugin=libCMPass.so -passes="Loops"`
   - Pass 동작 검증

## 참고 자료

### LLVM 17 관련
- LLVM 17 공식 문서: https://llvm.org/docs/
- Opaque Pointers: https://llvm.org/docs/OpaquePointers.html
- New PassManager: https://llvm.org/docs/NewPassManager.html

### 예제 코드
- `LLVM17_UPGRADE_DECISION.md`에 Pass 플러그인 예제 코드 포함
- `opt -load-pass-plugin=libCMPass.so -passes="Loops"` 형태로 실행

## 작업 시간
- 시작: 2024-11-18
- 종료: 2024-11-18
- 주요 작업: 문제 분석 → 업그레이드 결정 → Docker 환경 구축

## 다음 세션 체크리스트

다음 세션 시작 시:
- [ ] Docker 컨테이너 실행 확인 (`./run-docker-llvm17.sh`)
- [ ] LLVM 17 설치 확인 (`/opt/llvm-17/bin/clang --version`)
- [ ] 작업 디렉토리 확인 (`/workspace`)
- [ ] Catamaran 소스 복사 시작


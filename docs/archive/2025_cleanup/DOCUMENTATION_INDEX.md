# 문서 인덱스 및 정리 가이드

## 문서 분류

### 🔵 원본/외부 프로젝트 문서 (삭제 금지)
이 문서들은 외부 프로젝트의 원본 README이므로 **절대 삭제하지 마세요**.

- `movec/README.md` - MoveC 프로젝트 원본 문서 (Copyright: Zhe Chen)
- `softboundcets-34/README.md` - SoftBoundCETS 원본 문서
- `compiler-wrapper/README.md` - 컴파일러 래퍼 원본 문서

### 🟢 핵심 문서 (유지 권장)
프로젝트 이해와 사용에 필수적인 문서들

#### 루트 레벨
- `README.md` - 프로젝트 메인 README (LLVM 17 포팅 상태)
- `TEST_GUIDE.md` - 테스트 실행 가이드 (방금 생성)

#### 프로젝트 상태
- `docs/PROJECT_STATUS.md` - 현재 프로젝트 상태 및 알려진 이슈
- `docs/reproduction.md` - LLVM 3.4 재현 가이드 (상세)

#### LLVM 3.4 재현 (완료)
- `docs/llvm34-reproduction/LLVM34_REPRODUCTION_LOG.md` - 재현 작업 상세 로그
- `docs/llvm34-reproduction/CHANGES_SUMMARY.md` - 변경 사항 요약
- `docs/llvm34-reproduction/TECHNICAL_DETAILS.md` - 기술적 세부 사항

#### LLVM 17 포팅 (완료)
- `docs/llvm17-port/STATUS.md` - LLVM 17 포팅 상태 요약
- `docs/llvm17-port/LLVM17_PORTING_DETAILED_LOG.md` - 상세 포팅 로그

### 🟡 작업 과정 문서 (정리 가능)
작업 과정에서 생성된 문서들. 핵심 정보는 위 문서에 통합됨.

#### LLVM 14 포팅 관련 (작업 중단/미완료)
- `docs/llvm14/README.md` - LLVM 14 문서 인덱스
- `docs/llvm14/LLVM14_PORTING_GUIDE.md` - 포팅 가이드
- `docs/llvm14/LLVM14_PORTING_PROGRESS.md` - 진행 상황
- `docs/llvm14/LLVM14_WORKFLOW.md` - 작업 워크플로우
- `docs/llvm14/LLVM14_PORTING_SESSION_LOG.md` - 세션 로그
- `docs/llvm14/LLVM14_Porting_Summary.md` - 포팅 요약
- `docs/llvm14/BUILD_SUCCESS_SUMMARY.md` - 빌드 성공 요약
- `docs/llvm14/OPT_LOAD_TEST_GUIDE.md` - opt 로드 가이드
- `docs/llvm14/OPT_LOAD_TEST_STEPS.md` - opt 로드 단계
- `docs/llvm14/TEST_CMPASS_LOAD.md` - CMPass 로드 테스트
- `docs/llvm14/LLVM14_FILE_INDEX.md` - 파일 인덱스
- `docs/llvm14/*SESSION_LOG*.md` - 작업 일지 모음
- `docs/llvm14/*SESSION_SUMMARY*.md` - 작업 요약
- `docs/llvm14/LLVM17_PORTING_START.md` - LLVM 17 포팅 시작
- `docs/llvm14/LLVM17_PORTING_SUMMARY.md` - LLVM 17 포팅 요약
- `docs/llvm14/LLVM17_UPGRADE_DECISION.md` - LLVM 17 업그레이드 결정
- `docs/llvm14/LLVM17_DIRECT_INSTANTIATION_FIX.md` - 직접 인스턴스화 수정
- `docs/llvm14/LLVM_VERSION_UPGRADE_ANALYSIS.md` - 버전 업그레이드 분석
- `docs/llvm14/DIFFICULTY_ASSESSMENT.md` - 난이도 평가
- `docs/llvm14/CATAMARAN_ORIGINAL_STRUCTURE.md` - 원본 구조 분석
- `docs/llvm14/REPRODUCTION_EXTENSION_STRATEGY.md` - 재현 확장 전략
- `docs/llvm14/WHY_DIFFERENT_APPROACH.md` - 다른 접근 방법 이유
- `docs/llvm14/NEXT_STEPS_FUNCTIONANALYSISMANAGER.md` - 다음 단계
- `LLVM14-docs/DIFFICULTY_ASSESSMENT.md` - 난이도 평가 (중복)

#### 백업/디버깅 문서
- `backup_patches/movec_gamma_progress.md` - MoveC γ 진행 상황
- `backup_patches/movec_gamma_debug.md` - MoveC γ 디버깅
- `backup_patches/stable_workflow.md` - 안정적인 워크플로우
- `backup_patches/docker_build_solution.md` - Docker 빌드 해결책
- `backup_patches/test_results.md` - 테스트 결과
- `backup_patches/docker_test_results.md` - Docker 테스트 결과

## 정리 제안

### 옵션 1: 보수적 정리 (권장)
핵심 문서만 유지하고 작업 과정 문서는 아카이브

**유지할 문서:**
- 루트: `README.md`, `TEST_GUIDE.md`
- `docs/PROJECT_STATUS.md`
- `docs/reproduction.md`
- `docs/llvm34-reproduction/` (3개 파일)
- `docs/llvm17-port/` (2개 파일)

**아카이브할 문서 (삭제 대신 `docs/archive/`로 이동):**
- `docs/llvm14/` 전체 (LLVM 14 작업은 중단되어 LLVM 17로 전환)
- `LLVM14-docs/` 전체
- `backup_patches/`의 일부 (핵심 정보는 `docs/reproduction.md`에 통합됨)

### 옵션 2: 적극적 정리
중복 제거 및 통합

**통합 가능한 문서들:**
- LLVM 14 관련 문서들 → 하나의 `docs/llvm14/SUMMARY.md`로 통합
- 백업 패치 문서들 → 핵심 정보만 `docs/reproduction.md`에 통합

**삭제 가능:**
- 세션 로그들 (날짜 기반 파일명) - 작업 과정 기록만 있고 핵심 정보는 다른 문서에 있음
- 중복된 가이드들 (OPT_LOAD_TEST_GUIDE, OPT_LOAD_TEST_STEPS, TEST_CMPASS_LOAD)

### 옵션 3: 현재 상태 유지
모든 문서 유지 (기여 내용을 명확히 보여주기 위해)

**장점:**
- 작업 과정이 상세히 기록됨
- 기여 내용이 명확히 드러남

**단점:**
- 문서가 많아서 찾기 어려움
- 중복 정보가 많음

## 추천 방안

**옵션 1 (보수적 정리)을 추천합니다.**

이유:
1. **기여 내용 보존**: 작업 과정 문서를 아카이브로 보존하여 기여 내용을 증명
2. **가독성 향상**: 핵심 문서만 남겨서 프로젝트 이해가 쉬움
3. **안전성**: 삭제 대신 아카이브로 이동하여 필요시 복구 가능

### 실행 계획

1. **아카이브 디렉토리 생성**
   ```bash
   mkdir -p docs/archive/llvm14-work docs/archive/backup-patches
   ```

2. **문서 이동**
   ```bash
   # LLVM 14 작업 문서 이동
   mv docs/llvm14/* docs/archive/llvm14-work/
   mv LLVM14-docs/* docs/archive/llvm14-work/
   
   # 백업 패치 문서 이동 (선택적)
   # 핵심 정보는 이미 docs/reproduction.md에 있음
   ```

3. **README 업데이트**
   - `docs/README.md` 생성하여 문서 구조 설명
   - 아카이브 위치 명시

## 문서 작성 가이드라인 (향후)

1. **세션 로그는 별도 파일로 유지하지 말고** 핵심 정보만 메인 문서에 통합
2. **중복 가이드는 하나로 통합** (예: 테스트 가이드 여러 개 → 하나)
3. **작업 완료 후** 작업 과정 문서는 아카이브로 이동
4. **핵심 문서는 최신 상태 유지**

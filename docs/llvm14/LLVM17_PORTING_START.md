# LLVM 17 포팅 시작 가이드

## 오늘 작업 계획 (2024-11-19)

### Phase 1: 환경 설정 및 소스 준비 ✅
- [x] LLVM 17 Docker 환경 확인
- [x] `setup-llvm17-port.sh` 스크립트 생성
- [ ] Docker 컨테이너 실행
- [ ] 소스 복사 (`Catamaran-llvm-14` → `Catamaran-llvm-17`)

### Phase 2: CMakeLists.txt 업데이트
- [ ] LLVM 17 API 반영
- [ ] New PassManager 플러그인 설정 확인
- [ ] 레거시 PassManager 관련 코드 제거

### Phase 3: Pass 플러그인 재작성
- [ ] `llvmGetPassPluginInfo()` LLVM 17 스타일로 업데이트
- [ ] `constructor(101)` 속성 제거 (LLVM 17에서는 불필요)
- [ ] `visibility` 속성 확인

### Phase 4: Opaque Pointers 전환
- [ ] `PointerType::getUnqual()` 제거 (47개)
- [ ] `getPointerElementType()` 제거
- [ ] 타입 캐스팅 코드 단순화

### Phase 5: 빌드 및 테스트
- [ ] 빌드 테스트
- [ ] 플러그인 로드 테스트
- [ ] Pass 동작 검증

## 시작하기

### 1. Docker 컨테이너 실행

```bash
# 루트 디렉토리에서
./run-docker-llvm17.sh
```

### 2. 컨테이너 내부에서 소스 복사

```bash
# 컨테이너 내부에서
cd /workspace
./setup-llvm17-port.sh
```

또는 수동으로:

```bash
mkdir -p Catamaran-llvm-17/llvm/lib/Transforms/CMPass
cp -r Catamaran-llvm-14/llvm/lib/Transforms/CMPass/* \
      Catamaran-llvm-17/llvm/lib/Transforms/CMPass/
```

### 3. 빌드 디렉토리 생성

```bash
mkdir -p build-catamaran-17
cd build-catamaran-17
```

## LLVM 17 주요 변경사항

### 1. Legacy PassManager 완전 제거
- `RegisterPass` 방식 사용 불가
- `llvmGetPassPluginInfo()` 방식만 사용
- `constructor` 속성 불필요 (레거시 충돌 없음)

### 2. Opaque Pointers 강제
- `PointerType::getUnqual()` 제거 필수
- `getPointerElementType()` 제거 필수
- 타입 캐스팅 단순화

### 3. New PassManager 표준
- `PassInfoMixin` 방식 사용
- `ModulePassManager` / `FunctionPassManager` 사용
- `PreservedAnalyses` 반환 필수

## 참고 자료

- `LLVM17_UPGRADE_DECISION.md` - 업그레이드 결정 문서
- `LLVM_VERSION_UPGRADE_ANALYSIS.md` - 버전 비교 분석
- `2024-11-19_SESSION_LOG.md` - 오늘의 작업 일지
- LLVM 17 공식 문서: https://llvm.org/docs/


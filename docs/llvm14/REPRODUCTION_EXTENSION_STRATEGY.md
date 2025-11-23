# 논문 재현 + 확장 전략

## 목표
1. **논문 재현**: 원본 Catamaran (LLVM 3.4) 방식 그대로 구현
2. **확장**: 현대적인 LLVM 17 환경에서 개선 및 확장

## 최적 전략: 단계적 접근

### Phase 1: 논문 재현 (우선순위 높음) ✅

**목표**: 원본 Catamaran의 `LoopFreeTask` 구조를 LLVM 17로 포팅

**작업 내용**:
1. `LoopFreeTask` 클래스를 LLVM 17 API로 포팅
   - `SafeCheckTobeMerged()` - wrapper 함수 생성 로직
   - `genCtorForSpawn()` - spawn 함수 생성 로직
   - `genSpawnArgs()` - spawn 호출 인자 생성 로직
   
2. LLVM 3.4 → LLVM 17 API 변환
   - `PointerType::getUnqual()` → `PointerType::get(ctx, 0)`
   - `Function->getArgumentList()` → `Function->args()`
   - `ArgumentList::begin()` → iterator 방식 변경

3. 런타임 시스템 구현
   - `spawn(id, func, ...args)` 함수
   - `join(id)` 함수
   - 태스크 풀 또는 워커 스레드 풀

**예상 시간**: 2-3일 (API 포팅 + 테스트)

**결과**: 논문에 설명된 Catamaran 방식과 동일하게 작동 ✅

### Phase 2: 확장 (Phase 1 완료 후)

**목표**: 현대적 개선 및 추가 기능

**가능한 확장 방향**:
1. **더 효율적인 그룹화**
   - 원본: BasicBlock 단위 + cost model
   - 확장: PDG 기반 더 정교한 그룹화
   - 확장: 함수 단위 병렬화 고려

2. **성능 최적화**
   - 원본: 단순 스레드 풀
   - 확장: 워크스틸링 (work-stealing) 큐
   - 확장: NUMA-aware 태스크 스케줄링

3. **추가 분석 기능**
   - 원본: 기본 PDG 분석
   - 확장: 더 정교한 의존성 분석
   - 확장: 자동 최적 그룹 크기 결정

**예상 시간**: 1-2주 (확장 내용에 따라 다름)

## 현재 상황 평가

### 현재 구현 (`tryParallelizeMetadataCalls`)의 위치
- ❌ **논문 재현 목표에 부적합**: 원본 방식과 다름
- ✅ **확장 목표에는 유용**: 현대적인 접근 방식
- ⚠️ **하지만**: 원본 구조를 먼저 재현하는 게 우선

### 권장 조치
1. **Phase 1 (재현)**: `tryParallelizeMetadataCalls`는 일시 보류
   - 원본 `LoopFreeTask` 구조 포팅에 집중
   - 논문 재현 완료 후 평가

2. **Phase 2 (확장)**: `tryParallelizeMetadataCalls` 재활용 고려
   - Phase 1 완료 후
   - 확장 목표에 맞는 개선 방향 평가
   - 원본 방식과의 비교 분석

## 구체적 계획

### Step 1: 원본 `LoopFreeTask` 분석 ✅ (완료)
- [x] `LoopFreeTask` 클래스 구조 파악
- [x] `SafeCheckTobeMerged()` 로직 이해
- [x] spawn/join 시스템 이해

### Step 2: LLVM 17 포팅 계획
- [ ] LLVM 3.4 → LLVM 17 API 매핑표 작성
- [ ] 변경사항 문서화
- [ ] 테스트 계획 수립

### Step 3: 포팅 구현
- [ ] `LoopFreeTask.h` 포팅
- [ ] `LoopFreeTask.cpp` 포팅
  - `SafeCheckTobeMerged()` 포팅
  - `genCtorForSpawn()` 포팅
  - `genSpawnArgs()` 포팅
- [ ] 런타임 시스템 구현
  - `spawn()` 함수
  - `join()` 함수
- [ ] `Loops.cpp`에서 `LoopFreeTask` 사용 확인

### Step 4: 테스트 및 검증
- [ ] 단위 테스트
- [ ] 통합 테스트
- [ ] 성능 벤치마크 (논문과 비교)

### Step 5: 확장 기능 (Phase 2)
- [ ] `tryParallelizeMetadataCalls` 재평가
- [ ] 확장 기능 추가
- [ ] 성능 비교 분석

## 결론

**우선순위**:
1. **Phase 1 (재현) 먼저**: 원본 `LoopFreeTask` 구조를 LLVM 17로 포팅
2. **Phase 2 (확장) 나중**: 재현 완료 후 확장 기능 추가

**이유**:
- 논문 재현이 우선 목표
- 재현 완료 후 확장 방향이 명확해짐
- 원본과의 비교 분석이 가능해짐

**현재 `tryParallelizeMetadataCalls`는**:
- 일시 보류 (재현 완료 후 재평가)
- 또는 Phase 2 확장 기능으로 활용


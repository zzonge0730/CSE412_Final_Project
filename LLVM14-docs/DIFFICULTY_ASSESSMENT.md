# 원본 Catamaran 방식 포팅 난이도 평가

## 현재 구현 vs 원본 방식

### 현재 (LLVM 17) - 약 50줄
- 각 메타데이터 호출을 개별적으로 처리
- 간단한 async runner 함수 사용
- 방향: **각 호출 → 개별 스레드**

### 원본 (LLVM 3.4) - 약 400줄 (LoopFreeTask 전체)
- 여러 호출을 하나의 wrapper 함수로 묶음
- spawn/join 태스크 시스템 사용
- 방향: **여러 호출 → wrapper 함수 → 하나의 태스크**

## 난이도 평가

### ✅ **쉬운 부분 (재사용 가능)**
1. **그룹화 로직**: BasicBlock 단위로 묶기만 하면 됨 (원본의 cost model은 선택사항)
2. **Wrapper 함수 생성**: 원본 코드 재사용 가능, LLVM 17 API만 수정 필요
   - `SafeCheckTobeMerged()` 로직 (150줄)
   - `genCtorForSpawn()` 로직 (40줄)
   - `genSpawnArgs()` 로직 (30줄)
3. **런타임 시스템**: spawn/join 함수 구현만 추가

### ⚠️ **주의해야 할 부분 (API 차이)**
1. **LLVM 3.4 → LLVM 17 API 차이**:
   - `PointerType::getUnqual()` → `PointerType::get(ctx, 0)` (Opaque Pointer)
   - `Function->getArgumentList()` → `Function->args()` (iterator 변경)
   - `ArgumentList::begin()` → 직접 iterator 사용 불가
2. **인자 처리**: 정수 타입을 void*로 변환하는 로직이 복잡함

### 📊 **예상 작업량**
- **최소 버전** (BasicBlock 단위 묶기): **약 2-3시간**
  - Wrapper 함수 생성: 150줄 포팅
  - spawn/join 런타임: 50줄 추가
  - API 수정: 20-30줄 수정
- **완전한 버전** (cost model 포함): **약 1-2일**
  - 위 작업 + 원본의 cost model 로직 포팅 (100줄)

## 추천 방안

### 옵션 1: **간단한 버전 먼저** (추천)
- BasicBlock 단위로 묶기
- Wrapper 함수 생성
- spawn/join 런타임 추가
- **예상 시간**: 2-3시간
- **장점**: 빠르게 원본 방식 구현 가능, 이후 확장 용이

### 옵션 2: **현재 구현 유지**
- 각 호출을 개별 스레드로 실행 (현재 방식)
- **장점**: 간단하고 동작 확인됨
- **단점**: 스레드 생성 오버헤드가 큼

### 옵션 3: **하이브리드**
- 현재 방식 유지하되, 같은 BasicBlock의 호출은 묶어서 처리
- **장점**: 두 방식의 장점 결합
- **단점**: 코드가 복잡해짐

## 결론

**원본 Catamaran 방식으로 전환하는 것은 어렵지 않습니다.**
- 원본 코드가 이미 있고 대부분 재사용 가능
- LLVM 17 API 차이만 수정하면 됨
- **방향은 비슷하지만 구조가 더 정교함** (여러 호출을 묶어서 처리)

**추천**: 옵션 1 (간단한 버전)로 시작


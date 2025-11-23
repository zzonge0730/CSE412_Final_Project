# LLVM 버전 업그레이드 분석

## 현재 상황

- **원본 버전**: LLVM 3.4
- **현재 포팅 버전**: LLVM 14
- **주요 문제**: 레거시 PassManager와 새 PassManager 간의 충돌로 인한 Segmentation Fault

## LLVM 버전별 PassManager 상태

### LLVM 14 (현재)
- ✅ 새 PassManager가 기본
- ❌ 레거시 PassManager도 여전히 포함되어 있음
- ❌ 플러그인 로드 시 레거시 PassManager 전역 생성자 충돌 발생
- ❌ 근본적인 해결이 어려움

### LLVM 15
- ✅ 레거시 PassManager 대부분 제거
- ✅ 새 PassManager가 기본이자 유일한 방식
- ✅ 플러그인 충돌 문제 해결 가능
- ✅ 안정적이고 널리 사용됨
- ✅ LLVM 14 대비 API 변경이 적당함

### LLVM 16
- ✅ 레거시 PassManager 완전 제거
- ✅ 추가 기능 및 최적화 포함
- ⚠️ LLVM 15 대비 일부 API 변경 가능
- ✅ 안정적이고 생산 환경에서 사용됨

### LLVM 17 이상
- ✅ 최신 기능 및 최적화
- ❌ API 변경이 많을 수 있음
- ❌ 문서와 자료가 상대적으로 적음
- ⚠️ 포팅 작업량 증가 가능

## 추천 업그레이드 버전

### 🏆 1순위: **LLVM 17 (또는 16)** ⭐⭐⭐ (최우선 추천)

**핵심 이유: "가장 깔끔하고, 고민할 거리가 적습니다."**

#### 장점 1: Legacy PassManager 완전 퇴출
- ✅ LLVM 14에서 겪은 `RegisterPass`, `cl::opt` 충돌 문제가 **아예 발생하지 않습니다**
- ✅ 개발자는 오직 **"새 PassManager (New Pass Manager)" 방식 하나만** 신경 쓰면 됨
- ✅ 선택 장애 해결: "레거시 vs 새 PassManager" 고민 불필요

#### 장점 2: Opaque Pointers 강제 적용
- ✅ LLVM 17부터 Opaque Pointers가 **강제 적용**됨
- ✅ **코드가 오히려 단순해짐**: LLVM 3.4 시절 코드(`Type*`를 매번 지정하던 방식)를 억지로 살리려다 고생할 필요 없음
- ✅ "아, 이건 그냥 주소(Pointer)구나" 하고 넘어가면 되므로 Pass 작성이 훨씬 단순해짐
- ✅ `PointerType::getUnqual()`, `getPointerElementType()` 같은 복잡한 타입 처리 코드 제거 가능
- ✅ 현재 코드베이스의 많은 타입 캐스팅 코드(`InterTask.cpp`, `LoopFreeTask.cpp`, `DOALLTask.cpp` 등) 단순화 가능

#### 장점 3: 풍부한 최신 예제
- ✅ 현재 인터넷의 "How to write LLVM Pass 2024/2025" 튜토리얼들이 **대부분 LLVM 15~17 기준**
- ✅ Stack Overflow, GitHub 예제가 최신 버전 기준
- ✅ 문제 해결 시 참고 자료가 많음

#### 예상 작업량
- LLVM 14 → 17: 중간~큼 (하지만 Opaque Pointers로 인해 타입 관련 코드는 오히려 단순해질 수 있음)
- Legacy PassManager 관련 코드 제거로 인한 작업량 감소

### 2순위: **LLVM 16** (LLVM 17의 대안)

**이유:**
- 레거시 PassManager 완전 제거
- Opaque Pointers 표준화 완료
- LLVM 17보다 약간 더 안정적일 수 있음

**추천 시나리오:**
- LLVM 17이 너무 최신이라 우려될 때

### ❌ 비추천: **LLVM 15**

**이유 (반박):**
- ⚠️ LLVM 15는 **"Opaque Pointer"로 넘어가는 과도기의 시작점**
- ⚠️ 어떤 코드는 Typed Pointer를 쓰고, 어떤 코드는 Opaque Pointer를 써서 **혼란스러울 수 있음**
- ⚠️ 굳이 지금 시점에 선택할 이유가 없음
- ⚠️ LLVM 16/17에서 완전히 표준화된 것을 다시 고민할 필요 없음

## 업그레이드 전략

### 🏆 일괄 업그레이드 (강력 권장)

**LLVM 14 → LLVM 17 (또는 16)로 직접 업그레이드**

**이유:**
1. **Opaque Pointers 혼란 방지**: LLVM 15의 과도기 상황을 피하고, 표준화된 버전에서 바로 시작
2. **중간 단계 불필요**: LLVM 15 → 17로 두 번 포팅할 필요 없음
3. **코드 단순화**: 타입 관련 복잡한 코드를 한 번에 정리
4. **최신 예제 활용**: 바로 최신 튜토리얼과 예제 참고 가능

**전략:**
- LLVM 17 기준으로 완전히 새로 작성하는 관점으로 접근
- LLVM 14 포팅 경험을 바탕으로 LLVM 17에 맞게 재구성

### 단계적 접근 (비권장)

- LLVM 14 → 15 → 17: 불필요한 중간 단계
- Opaque Pointers 혼란 기간만 늘어남

## 예상 작업 항목 (LLVM 17 기준)

### Phase 1: 빌드 환경 설정
1. **Dockerfile 업데이트**
   - LLVM 17 소스 다운로드 및 빌드 설정

2. **CMakeLists.txt 검토**
   - LLVM 17 API 변경사항 반영

### Phase 2: Pass 플러그인 재작성
1. **Pass 등록 방식 변경**
   - Legacy `RegisterPass` 방식 완전 제거
   - `llvmGetPassPluginInfo()` 방식으로 재작성 (예제 코드 참고)

2. **Opaque Pointers 전환**
   - `PointerType::getUnqual()`, `getPointerElementType()` 제거
   - 타입 캐스팅 코드 단순화
   - `InterTask.cpp`, `LoopFreeTask.cpp`, `DOALLTask.cpp` 등 타입 관련 코드 정리

3. **API 업데이트**
   - Deprecated 함수 교체
   - 최신 API 사용

### Phase 3: 테스트 및 검증
1. **플러그인 로드 테스트**
   - `opt -load-pass-plugin=libCMPass.so -passes="Loops"` 형태로 테스트
   - Legacy PassManager 충돌이 발생하지 않는지 확인

2. **Pass 동작 검증**
   - 실제 IR 파일로 테스트
   - 기능 정확성 확인

### 🔨 LLVM 17 Pass 플러그인 예제 코드

```cpp
#include "llvm/Pass.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

namespace {
// Pass 클래스 정의 (상속 필요 없음!)
struct CatamaranPass : public PassInfoMixin<CatamaranPass> {
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM) {
    // 여기에 Catamaran 로직 구현
    errs() << "Catamaran running on function: " << F.getName() << "\n";
    return PreservedAnalyses::all(); // 코드를 안 바꿨으면 all, 바꿨으면 none
  }
};
} // end anonymous namespace

// 플러그인 등록 (이 부분이 RegisterPass를 대체함)
extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
  return {
    LLVM_PLUGIN_API_VERSION,
    "CatamaranPass",
    "v0.1",
    [](PassBuilder &PB) {
      // 최적화 파이프라인에 내 패스를 등록
      PB.registerPipelineParsingCallback(
        [](StringRef Name, FunctionPassManager &FPM,
           ArrayRef<PassBuilder::PipelineElement>) {
          if (Name == "catamaran") { // opt -passes="catamaran" 으로 실행
            FPM.addPass(CatamaranPass());
            return true;
          }
          return false;
        });
    }
  };
}
```

**실행 방법:**
```bash
# 더 이상 복잡한 옵션이 필요 없습니다
opt -load-pass-plugin=libCatamaranPass.so -passes="catamaran" input.ll -o output.bc
```

## 비교표

| 항목 | LLVM 15 | LLVM 16 | LLVM 17 |
|------|---------|---------|---------|
| 레거시 PassManager 제거 | ✅ 완료 | ✅ 완료 | ✅ 완료 |
| Opaque Pointers 상태 | ⚠️ 과도기 | ✅ 표준화 | ✅ 강제 적용 |
| 타입 코드 단순화 | ❌ 혼란 | ✅ 가능 | ✅ 완전히 단순화 |
| 최신 튜토리얼/예제 | ⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 안정성 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| API 변경량 | 적음 | 중간 | 많음 (하지만 단순화됨) |
| 코드 단순화 효과 | ⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 작업량 | 중간 | 중간~큼 | 중간~큼 (하지만 단순화로 상쇄) |
| 장기 유지보수 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **종합 추천도** | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | **⭐⭐⭐⭐⭐** |

## 결론

### 🏆 최우선 추천: **LLVM 17 (또는 16)**

**핵심 이유:**
1. **Legacy PassManager 충돌 문제 근본 해결** - 더 이상 고민할 필요 없음
2. **Opaque Pointers 강제로 코드 단순화** - LLVM 3.4의 복잡한 타입 코드를 정리할 기회
3. **최신 예제와 튜토리얼 활용 가능** - 문제 해결이 쉬움
4. **장기적 유지보수성** - 미래에도 계속 사용할 수 있는 최신 표준

**비추천: LLVM 15**
- Opaque Pointers 과도기로 인한 혼란만 증가
- 굳이 중간 단계를 거칠 필요 없음

### 결정 사항

**LLVM 17로 업그레이드 진행** (또는 LLVM 16이 더 안정적으로 보이면 16 선택 가능)

**작업 접근 방식:**
- LLVM 14 포팅 경험을 바탕으로 LLVM 17 기준으로 재구성
- Opaque Pointers를 활용해 타입 관련 코드 단순화
- 최신 Pass 플러그인 예제 코드 참고하여 깔끔하게 작성


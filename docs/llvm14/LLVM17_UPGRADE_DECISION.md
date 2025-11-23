# LLVM 17 업그레이드 결정 문서

## 결정 사항

**LLVM 17 (또는 16)로 업그레이드 진행**

- **결정 일자**: 세션 로그 참고
- **이전 추천**: LLVM 15 (반박 후 수정)
- **최종 결정**: LLVM 17

## 결정 이유

### 1. Legacy PassManager 완전 퇴출
- LLVM 14에서 겪은 `RegisterPass`, `cl::opt` 충돌 문제가 **아예 발생하지 않음**
- 개발자는 오직 **"새 PassManager" 방식 하나만** 신경 쓰면 됨
- 선택 장애 해결: "레거시 vs 새 PassManager" 고민 불필요

### 2. Opaque Pointers 강제 적용
- LLVM 17부터 Opaque Pointers가 **강제 적용**됨
- **코드가 오히려 단순해짐**: LLVM 3.4 시절 코드(`Type*`를 매번 지정하던 방식)를 억지로 살리려다 고생할 필요 없음
- `PointerType::getUnqual()`, `getPointerElementType()` 같은 복잡한 타입 처리 코드 제거 가능

**현재 코드베이스 분석:**
- `PointerType::getUnqual()` 사용: **47개 발견**
- 주요 파일:
  - `InterTask.cpp`: 6개
  - `LoopFreeTask.cpp`: 6개
  - `DOALLTask.cpp`: 13개
  - `EnvBuilder.cpp`: 16개
  - `Loops.cpp`: 3개
  - 기타

- 이러한 코드들이 LLVM 17의 Opaque Pointers로 **단순해질 수 있음**

### 3. 풍부한 최신 예제
- 현재 인터넷의 "How to write LLVM Pass 2024/2025" 튜토리얼들이 **대부분 LLVM 15~17 기준**
- Stack Overflow, GitHub 예제가 최신 버전 기준
- 문제 해결 시 참고 자료가 많음

## 왜 LLVM 15를 선택하지 않았는가?

**반박 요약:**
- ⚠️ LLVM 15는 **"Opaque Pointer"로 넘어가는 과도기의 시작점**
- ⚠️ 어떤 코드는 Typed Pointer를 쓰고, 어떤 코드는 Opaque Pointer를 써서 **혼란스러울 수 있음**
- ⚠️ 굳이 지금 시점에 선택할 이유가 없음
- ⚠️ LLVM 16/17에서 완전히 표준화된 것을 다시 고민할 필요 없음

## 업그레이드 전략

### 일괄 업그레이드 (강력 권장)
**LLVM 14 → LLVM 17 (또는 16)로 직접 업그레이드**

**이유:**
1. **Opaque Pointers 혼란 방지**: LLVM 15의 과도기 상황을 피하고, 표준화된 버전에서 바로 시작
2. **중간 단계 불필요**: LLVM 15 → 17로 두 번 포팅할 필요 없음
3. **코드 단순화**: 타입 관련 복잡한 코드를 한 번에 정리
4. **최신 예제 활용**: 바로 최신 튜토리얼과 예제 참고 가능

**접근 방식:**
- LLVM 17 기준으로 완전히 새로 작성하는 관점으로 접근
- LLVM 14 포팅 경험을 바탕으로 LLVM 17에 맞게 재구성

## 예상 작업 항목

### Phase 1: 빌드 환경 설정
1. **Dockerfile 업데이트**
   - LLVM 17 소스 다운로드 및 빌드 설정
   - `llvm-project-17.x.x.src.tar.xz` 다운로드

2. **CMakeLists.txt 검토**
   - LLVM 17 API 변경사항 반영
   - 새 PassManager 플러그인 설정

### Phase 2: Pass 플러그인 재작성
1. **Pass 등록 방식 변경**
   - Legacy `RegisterPass` 방식 완전 제거
   - `llvmGetPassPluginInfo()` 방식으로 재작성

2. **Opaque Pointers 전환**
   - `PointerType::getUnqual()` 제거 (47개)
   - `getPointerElementType()` 제거
   - 타입 캐스팅 코드 단순화
   - 주요 파일: `InterTask.cpp`, `LoopFreeTask.cpp`, `DOALLTask.cpp`, `EnvBuilder.cpp` 등

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

## LLVM 17 Pass 플러그인 예제

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

## 참고 자료

- `LLVM_VERSION_UPGRADE_ANALYSIS.md` - 상세 분석 문서
- `docs/llvm14/*SESSION_LOG*.md` - 작업 일지
- LLVM 17 공식 문서: https://llvm.org/docs/
- Opaque Pointers 문서: https://llvm.org/docs/OpaquePointers.html

## 결론

**LLVM 17로 업그레이드 진행** (또는 LLVM 16이 더 안정적으로 보이면 16 선택 가능)

**작업 접근 방식:**
- LLVM 14 포팅 경험을 바탕으로 LLVM 17 기준으로 재구성
- Opaque Pointers를 활용해 타입 관련 코드 단순화
- 최신 Pass 플러그인 예제 코드 참고하여 깔끔하게 작성


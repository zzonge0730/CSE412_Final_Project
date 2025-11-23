# LLVM 17 Direct Instantiation Fix

## 문제
- `LoopAnalysis::run()` 실행 시 `DominatorTreeAnalysis`를 찾지 못하는 에러 발생
- AnalysisKey 주소 불일치 문제로 인해 `FunctionAnalysisManager`를 통한 분석 등록이 작동하지 않음

## 해결 방법
`FunctionAnalysisManager`를 우회하고 필요한 분석 객체를 직접 생성하는 방식으로 전환

## 변경된 파일

### `Catamaran-llvm-17/llvm/lib/Transforms/CMPass/Loops.cpp`

#### 1. 헤더 추가
```cpp
#include "llvm/Analysis/TargetLibraryInfo.h"
#include "llvm/Analysis/AssumptionCache.h"
```

#### 2. `getLoopStructures(ModuleAnalysisManager &AM)` 수정
```cpp
// 이전: FAM.getResult<LoopAnalysis>(*func)
// 이후:
DominatorTree DT(*func);
LoopInfo LI(DT);
```

#### 3. `getLoopStructures(Function * func, FunctionAnalysisManager &FAM)` 수정
```cpp
// 이전: FAM.getResult<LoopAnalysis>(*func)
// 이후:
DominatorTree DT(*func);
LoopInfo LI(DT);
```

#### 4. `getDominators()` 수정
```cpp
// 이전: FAM.getResult<DominatorTreeAnalysis>(*f)
// 이후:
DominatorTree DT(*f);
```

#### 5. `selectTheOrderOfLoopsToParallelize()` 내부 lambda 수정
```cpp
// 이전: 
// auto& LI = FAM.getResult<LoopAnalysis>(*function);
// auto& SE = FAM.getResult<ScalarEvolutionAnalysis>(*function);

// 이후:
DominatorTree DT(*function);
LoopInfo LI(DT);

TargetLibraryInfoImpl TLII;
TargetLibraryInfo TLI(TLII);
AssumptionCache AC(*function);
ScalarEvolution SE(*function, TLI, AC, DT, LI);
```

## 테스트 결과
- ✅ 간단한 루프가 있는 테스트에서 루프 정상 감지
- ✅ `LoopAnalysis` 관련 에러 해결됨
- ⚠️ 새로운 에러: `PDG::copyEdgesInto()` (다음 단계에서 해결 필요)

## 참고
- 이 변경으로 `FunctionAnalysisManager`를 통한 분석 등록 대신 직접 생성 방식을 사용
- 성능 최적화보다는 동작 확실성에 중점을 둔 해결책


# 다음 단계: FunctionAnalysisManagerModuleProxy 문제 해결

## 현재 상황

✅ **완료된 작업:**
- LLVM 17로 포팅 시작
- PDGAnalysis를 New PassManager 방식으로 전환 완료
- 빌드 성공

❌ **현재 문제:**
- `FunctionAnalysisManagerModuleProxy`가 등록되지 않아서 에러 발생
- `Loops::getLoopStructures()`에서 `AM.getResult<FunctionAnalysisManagerModuleProxy>()` 호출 실패
- 에러 메시지: "Analysis passes must be registered prior to being queried!"

## 문제 분석

`FunctionAnalysisManagerModuleProxy`는 `opt`가 자동으로 등록해야 하는 표준 프록시입니다. 하지만 플러그인 로드 시점과 분석 등록 시점의 순서 문제로 등록되지 않은 것으로 보입니다.

이는 LLVM 17의 `opt` 도구가 PassBuilder를 사용하여 플러그인을 로드하고, PassBuilder가 분석 매니저를 초기화하는 과정에서 발생하는 것으로 추정됩니다.

## 해결 방안

### 방안 1: Loops::run()에서 FunctionAnalysisManager 직접 생성 (권장)

`FunctionAnalysisManagerModuleProxy`를 사용하지 않고, `Loops::run()`에서 `FunctionAnalysisManager`를 직접 생성하여 멤버 변수로 저장하는 방법입니다.

**장점:**
- `FunctionAnalysisManagerModuleProxy`에 의존하지 않음
- 각 함수에 대해 분석을 재사용할 수 있음
- 간단하고 명확한 구현

**단점:**
- `opt`가 제공하는 `FunctionAnalysisManager`와 독립적임
- 분석 결과가 다른 Pass와 공유되지 않음

**구현 방법:**
1. `Loops.h`에 `FunctionAnalysisManager * fam;` 멤버 변수 추가
2. `Loops::run()`에서 `FunctionAnalysisManager` 생성 및 분석 등록
3. `getLoopStructures()`에서 멤버 변수 사용

### 방안 2: 각 함수에 대해 독립적으로 분석 생성

`FunctionAnalysisManager` 없이 각 함수에 대해 직접 분석을 생성하는 방법입니다.

**장점:**
- 가장 간단한 구현
- `FunctionAnalysisManagerModuleProxy`에 의존하지 않음

**단점:**
- 분석 재사용 불가 (비효율적)
- 각 함수마다 분석을 생성해야 함

**구현 방법:**
1. `getLoopStructures()`에서 각 함수에 대해 `LoopAnalysis` 직접 생성
2. `getDominators()`에서 각 함수에 대해 `DominatorTreeAnalysis` 직접 생성

### 방안 3: opt의 분석 매니저 초기화 순서 확인

`opt` 도구가 `FunctionAnalysisManagerModuleProxy`를 등록하는 시점을 확인하고, 플러그인 로드 시점과의 순서 문제를 해결하는 방법입니다.

**장점:**
- 표준 방식 유지
- 분석 결과가 다른 Pass와 공유됨

**단점:**
- `opt` 소스 코드 확인 필요 (복잡)
- LLVM 17의 `opt` 구현 의존

**구현 방법:**
1. LLVM 17 소스 코드에서 `opt`의 PassBuilder 초기화 과정 확인
2. `registerAnalysisRegistrationCallback` 호출 시점 확인
3. `FunctionAnalysisManagerModuleProxy` 등록 시점 확인

## 권장 사항

**방안 1 (Loops::run()에서 FunctionAnalysisManager 직접 생성)을 권장합니다.**

이유:
1. 가장 간단하고 명확한 구현
2. `FunctionAnalysisManagerModuleProxy`에 의존하지 않음
3. 각 함수에 대해 분석을 재사용할 수 있음
4. `opt`의 내부 구현에 의존하지 않음

## 구현 예시

### Loops.h 수정

```cpp
class Loops : public PassInfoMixin<Loops> {
private:
    Module * program;
    PDG * pdg;
    ModuleAnalysisManager * am;
    FunctionAnalysisManager * fam;  // 추가
    std::unordered_map<BasicBlock*, uint32_t> loopHeaderToLoopIndexMap;
};
```

### Loops::run() 수정

```cpp
PreservedAnalyses Loops::run(Module &M, ModuleAnalysisManager &AM) {
    this->program = &M;
    this->am = &AM;
    
    // FunctionAnalysisManager 직접 생성
    this->fam = new FunctionAnalysisManager();
    
    // 필요한 분석 등록
    this->fam->registerPass([]() { return LoopAnalysis(); });
    this->fam->registerPass([]() { return DominatorTreeAnalysis(); });
    this->fam->registerPass([]() { return PostDominatorTreeAnalysis(); });
    this->fam->registerPass([]() { return ScalarEvolutionAnalysis(); });
    
    // ... 나머지 코드
}
```

### getLoopStructures() 수정

```cpp
std::vector<LoopStructure *> * Loops::getLoopStructures(ModuleAnalysisManager &AM) {
    // FunctionAnalysisManagerModuleProxy 사용하지 않음
    // 멤버 변수 사용
    FunctionAnalysisManager &FAM = *this->fam;
    
    auto allLoops = new std::vector<LoopStructure *> ();
    // ... 나머지 코드 동일
}
```

## 다음 작업

1. `Loops.h`에 `FunctionAnalysisManager * fam;` 멤버 변수 추가
2. `Loops::run()`에서 `FunctionAnalysisManager` 생성 및 분석 등록
3. `getLoopStructures()`, `getDominators()`, `selectTheOrderOfLoopsToParallelize()`에서 멤버 변수 사용
4. 빌드 및 테스트


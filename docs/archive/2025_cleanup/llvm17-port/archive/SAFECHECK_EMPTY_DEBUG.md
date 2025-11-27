# safecheckCallInst가 비어있는 문제 디버깅 가이드

## 핵심 문제

**`safecheckCallInst` 벡터가 비어있어서 "Loop Rejected - No safe check insts found" 발생**

## 문제 발생 위치

### 672번 줄: safecheckCallInst 체크

```cpp
if (allInstsToOneCallInstInLoopBodyFinal.size() == 0 || 
    safeCheckInstsInLoopBodyFinal.size() == 0 || 
    safecheckCallInst.size() == 0) {  // ← 여기서 실패
    delete task;
    errs() << "this task we can not handle, because of non safe call inst...\n";
    continue;
}
```

## 디버그 로그 추가 위치

### 1. safecheckCallInst 수집 부분 (363-386번 줄)

```cpp
// 363번 줄 전에
errs() << "DEBUG: Starting safe check collection for loop\n";
errs() << "DEBUG: loopBody size: " << loopBody.size() << "\n";

int countCoin = 0;
bool tryGiveUpFlag = false; 
//identify which safe checks need to be parallellized
for (auto body : loopBody) {
    errs() << "DEBUG: Checking loop body BB: " << body->getName() << "\n";
    errs() << "DEBUG: BB instruction count: " << body->size() << "\n";
    
    countCoin = 0;
    for (auto& I : *body) {
        if (CallInst *CI = dyn_cast<CallInst>(&I)) {
            errs() << "DEBUG: Checking call in loop: " << *CI << "\n";
            
            StringRef funcName = CI->getCalledFunction() ? 
                CI->getCalledFunction()->getName() : StringRef("null");
            errs() << "DEBUG: Call function name: " << funcName << "\n";
            
            if (IsSafeCheckCallForMovec(CI)) {
                errs() << "DEBUG: ✓ Found safe check: " << funcName << "\n";
                if (countCoin < 3 && IsIntraTaskConsideredForMC(CI)) {
                    safecheckCallInstDoNotInLoopBody.insert(&I);
                    countCoin++;
                    errs() << "DEBUG: Added to DoNotInLoopBody (countCoin: " << countCoin << ")\n";
                }
                safecheckCallInst.push_back(&I);
                errs() << "DEBUG: Added to safecheckCallInst, total: " << safecheckCallInst.size() << "\n";
            } else {
                errs() << "DEBUG: ✗ Not a safe check: " << funcName << "\n";
            }

            if (IsSafeCheckCallStoreForMC(CI)) {
                tryGiveUpFlag = true;
                errs() << "DEBUG: Found safe check store, setting tryGiveUpFlag\n";
            }
        }
    }
}

errs() << "DEBUG: ===== Safe check collection complete =====\n";
errs() << "DEBUG: Total safecheckCallInst found: " << safecheckCallInst.size() << "\n";
errs() << "DEBUG: tryGiveUpFlag: " << (tryGiveUpFlag ? "true" : "false") << "\n";
```

### 2. IsSafeCheckCallForMovec 함수 확인

`Utils.cpp`의 `IsSafeCheckCallForMovec` 함수에 로그 추가:

```cpp
bool IsSafeCheckCallForMovec(CallInst *CI) {
    if (!CI->getCalledFunction()) {
        return false;
    }
    
    StringRef callName = CI->getCalledFunction()->getName();
    errs() << "DEBUG: IsSafeCheckCallForMovec checking: " << callName << "\n";
    
    if (callName.equals("_RV_check_dpv_ss") ||
        callName.equals("_RV_check_dpc_ss") ||
        callName.equals("_RV_check_dpv")) {
        errs() << "DEBUG: ✓ Match found: " << callName << "\n";
        return true;
    }
    
    errs() << "DEBUG: ✗ No match: " << callName << "\n";
    return false;
}
```

### 3. 451번 줄 전에 확인

```cpp
errs() << "DEBUG: ===== Before processing safecheckCallInst =====\n";
errs() << "DEBUG: safecheckCallInst size: " << safecheckCallInst.size() << "\n";
if (safecheckCallInst.empty()) {
    errs() << "DEBUG: ⚠️ WARNING: safecheckCallInst is EMPTY!\n";
    errs() << "DEBUG: This will cause task rejection at line 672\n";
}

//get safeCheck callInst related instructions
//TODO: need optimized
for (auto callInst : safecheckCallInst) {
    errs() << "DEBUG: Processing safe check: " << *callInst << "\n";
    // ... 기존 코드 ...
}
```

### 4. 672번 줄 전에 확인

```cpp
errs() << "DEBUG: ===== Before task validation =====\n";
errs() << "DEBUG: allInstsToOneCallInstInLoopBodyFinal.size(): " 
       << allInstsToOneCallInstInLoopBodyFinal.size() << "\n";
errs() << "DEBUG: safeCheckInstsInLoopBodyFinal.size(): " 
       << safeCheckInstsInLoopBodyFinal.size() << "\n";
errs() << "DEBUG: safecheckCallInst.size(): " 
       << safecheckCallInst.size() << "\n";

// if there is no safecheck call inst , don't do that 
if (allInstsToOneCallInstInLoopBodyFinal.size() == 0 || 
    safeCheckInstsInLoopBodyFinal.size() == 0 || 
    safecheckCallInst.size() == 0) {
    errs() << "DEBUG: ❌ Task rejected - one of the conditions is zero\n";
    delete task;
    errs() << "this task we can not handle, because of non safe call inst...\n";
    continue;
}
```

### 5. 732-735번 줄 디버깅

```cpp
errs() << "DEBUG: ===== Before brInstRelated loop =====\n";
errs() << "DEBUG: brInstRelated size: " << brInstRelated.size() << "\n";
errs() << "DEBUG: customedFunRelatedCodeInLoop size: " 
       << customedFunRelatedCodeInLoop.size() << "\n";

for (auto inst : brInstRelated) {
    errs() << "DEBUG: Processing brInstRelated inst: " << *inst << "\n";
    
    if (CallInst * brCall = dyn_cast<CallInst>(inst)) {
        // ... 기존 코드 ...
    }

    for (auto in : customedFunRelatedCodeInLoop) {
        if (in == inst) {
            filterFlag = true;
            errs() << "DEBUG: Found customedFunRelatedCodeInLoop match, setting filterFlag\n";
            break;  // 732번 줄
        }
    }
    errs() << "DEBUG: AFTER_SET_BITCAST - After inner for loop, filterFlag: " 
           << (filterFlag ? "true" : "false") << "\n";  // 735번 줄 위치
}

errs() << "DEBUG: AFTER_SET_BITCAST - After outer for loop, filterFlag: " 
       << (filterFlag ? "true" : "false") << "\n";  // 736번 줄 다음
```

## 예상되는 원인

### 원인 1: 루프 body에 safe check가 실제로 없음

**확인 방법**:
```bash
# IR 파일에서 직접 확인
grep -A 50 "define.*kernel_2mm" examples/llvm17/MoveC-2mm.ll | grep "__RV_check_dpv_ss"
```

### 원인 2: IsSafeCheckCallForMovec가 false 반환

**확인 방법**:
- 함수 이름이 정확히 일치하는지 확인
- double underscore vs single underscore 확인

### 원인 3: loopBody가 비어있거나 잘못 인식됨

**확인 방법**:
```cpp
errs() << "DEBUG: loopBody size: " << loopBody.size() << "\n";
for (auto body : loopBody) {
    errs() << "DEBUG: Loop body BB: " << body->getName() << "\n";
}
```

## 즉시 실행할 디버그 코드

다음 코드를 `LoopsMovec.cpp`의 적절한 위치에 추가:

```cpp
// 363번 줄 전에
errs() << "\n========== DEBUG: Safe Check Collection Start ==========\n";
errs() << "Loop body BB count: " << loopBody.size() << "\n";

// 378번 줄 후에 (safecheckCallInst.push_back 후)
errs() << "DEBUG: Added safe check, current total: " << safecheckCallInst.size() << "\n";

// 386번 줄 후에
errs() << "========== DEBUG: Safe Check Collection End ==========\n";
errs() << "Total safecheckCallInst: " << safecheckCallInst.size() << "\n";
if (safecheckCallInst.empty()) {
    errs() << "⚠️ WARNING: No safe checks found in loop body!\n";
}
errs() << "\n";
```

## 다음 단계

1. 위의 디버그 로그 추가
2. opt 실행하여 로그 확인
3. 어느 단계에서 safecheckCallInst가 비어있는지 확인
4. 원인에 맞는 해결책 적용

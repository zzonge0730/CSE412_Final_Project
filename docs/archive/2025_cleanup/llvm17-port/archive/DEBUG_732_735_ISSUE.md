# 732-735번 줄 디버깅 문제 분석

## 문제 상황

- ✅ **732번 줄 실행됨**: `break;` (728-733번 줄의 for 루프)
- ❌ **735번 줄 실행 안 됨**: `AFTER_SET_BITCAST` 로그가 없음
- ❌ **결과**: `safecheckCallInst` 벡터가 비어있어서 "Loop Rejected - No safe check insts found" 발생

## 코드 구조 분석

### 713-736번 줄 구조

```cpp
for (auto inst : brInstRelated) {  // 713번 줄: 외부 for 루프
    if (CallInst * brCall = dyn_cast<CallInst>(inst)) {  // 714번 줄
        // ... thread safe 체크 ...
        if (조건) {
            filterFlag = true;
            break;  // 724번 줄: 713번 줄 for 루프를 빠져나감
        }
    }
    
    for (auto in : customedFunRelatedCodeInLoop) {  // 728번 줄: 내부 for 루프
        if (in == inst) {
            filterFlag = true;
            break;  // 732번 줄: 728번 줄 for 루프만 빠져나감 (713번 줄 for는 계속)
        }
    }
    // 735번 줄: 728번 줄 for 루프의 닫는 괄호
}  // 736번 줄: 713번 줄 for 루프의 닫는 괄호
```

## 문제 분석

### 시나리오 1: filterFlag가 true가 되어 task가 삭제됨

**흐름**:
1. 732번 줄에서 `break` 실행 → 728번 줄 for 루프만 빠져나감
2. 713번 줄 for 루프는 계속 실행됨
3. 다른 `inst`에 대해 체크하면서 `filterFlag`가 true가 될 수 있음
4. 738번 줄에서 `if (filterFlag)` 조건이 true
5. 739번 줄에서 `delete task;`
6. 740번 줄에서 `continue;` → 루프의 다음 iteration으로
7. **결과**: 735번 줄 다음의 코드가 실행되지 않음

### 시나리오 2: brInstRelated가 비어있음

**흐름**:
1. `brInstRelated`가 비어있으면 713번 줄 for 루프가 실행되지 않음
2. 735번 줄도 실행되지 않음 (for 루프가 실행되지 않으므로)

### 시나리오 3: 732번 줄에서 break 후 다른 경로

**흐름**:
1. 732번 줄에서 `break` 실행
2. 728번 줄 for 루프만 빠져나감
3. 713번 줄 for 루프는 계속 실행
4. 하지만 다른 조건으로 인해 735번 줄 다음 코드가 실행되지 않음

## 해결 방안

### 방안 1: 디버그 로그 추가로 경로 확인

```cpp
for (auto inst : brInstRelated) {  // 713번 줄
    errs() << "DEBUG: Processing brInstRelated inst: " << *inst << "\n";
    
    if (CallInst * brCall = dyn_cast<CallInst>(inst)) {
        // ... 기존 코드 ...
    }
    
    for (auto in : customedFunRelatedCodeInLoop) {  // 728번 줄
        if (in == inst) {
            filterFlag = true;
            errs() << "DEBUG: Found customedFunRelatedCodeInLoop match, setting filterFlag\n";
            break;  // 732번 줄
        }
    }
    errs() << "DEBUG: AFTER_SET_BITCAST - After inner for loop\n";  // 735번 줄 위치
    
}  // 736번 줄

errs() << "DEBUG: AFTER_SET_BITCAST - After outer for loop\n";  // 736번 줄 다음
```

### 방안 2: filterFlag 체크 위치 확인

```cpp
// 738번 줄 전에 로그 추가
errs() << "DEBUG: filterFlag value: " << (filterFlag ? "true" : "false") << "\n";
errs() << "DEBUG: safecheckCallInst size: " << safecheckCallInst.size() << "\n";

if (filterFlag) {
    errs() << "DEBUG: Task deleted due to filterFlag\n";
    delete task;
    continue;
}
```

### 방안 3: brInstRelated 내용 확인

```cpp
errs() << "DEBUG: brInstRelated size: " << brInstRelated.size() << "\n";
for (auto inst : brInstRelated) {
    errs() << "DEBUG: brInstRelated inst: " << *inst << "\n";
    // ... 기존 코드 ...
}
```

### 방안 4: safecheckCallInst가 비어있는 원인 확인

**문제**: `safecheckCallInst` 벡터가 비어있음

**확인할 위치**: 363-386번 줄 (safe check 수집 부분)

```cpp
// 363번 줄: 루프 body 순회
for (auto body : loopBody) {
    errs() << "DEBUG: Checking loop body BB: " << body->getName() << "\n";
    
    for (auto& I : *body) {
        if (CallInst *CI = dyn_cast<CallInst>(&I)) {
            errs() << "DEBUG: Checking call in loop: " << *CI << "\n";  // 883번 줄 로그
            
            if (IsSafeCheckCallForMovec(CI)) {
                errs() << "DEBUG: Found safe check: " << CI->getCalledFunction()->getName() << "\n";
                safecheckCallInst.push_back(&I);
            }
        }
    }
}

errs() << "DEBUG: Total safecheckCallInst found: " << safecheckCallInst.size() << "\n";
```

## 즉시 확인할 사항

### 1. brInstRelated가 비어있는지 확인

```cpp
errs() << "DEBUG: brInstRelated size before loop: " << brInstRelated.size() << "\n";
```

### 2. filterFlag가 언제 true가 되는지 확인

```cpp
// 728번 줄 전에
errs() << "DEBUG: Before customedFunRelatedCodeInLoop check, filterFlag: " << filterFlag << "\n";

// 732번 줄 후에
errs() << "DEBUG: After break, filterFlag: " << filterFlag << "\n";
```

### 3. safecheckCallInst 수집 확인

```cpp
// 378번 줄 후에
errs() << "DEBUG: Added safe check, total: " << safecheckCallInst.size() << "\n";

// 451번 줄 전에
errs() << "DEBUG: Before processing safecheckCallInst, size: " << safecheckCallInst.size() << "\n";
```

## 예상되는 문제

### 가장 가능성 높은 시나리오

1. **safecheckCallInst가 비어있음** (363-386번 줄에서 수집 실패)
   - 루프 body에 safe check가 실제로 없음
   - 또는 `IsSafeCheckCallForMovec`가 false 반환

2. **filterFlag가 true가 되어 task 삭제**
   - 732번 줄에서 `break` 후에도 713번 줄 for 루프가 계속 실행
   - 다른 `inst`에서 `filterFlag = true` 설정
   - 738번 줄에서 task 삭제

3. **brInstRelated가 비어있어서 713번 줄 for 루프가 실행 안 됨**
   - 735번 줄도 실행 안 됨

## 다음 단계

1. **디버그 로그 추가**: 위의 방안 1-4 적용
2. **로그 출력 확인**: 어느 경로로 실행되는지 확인
3. **원인 특정**: safecheckCallInst가 비어있는 원인 또는 filterFlag가 true가 되는 원인
4. **해결 방안 적용**: 원인에 맞는 해결책 적용

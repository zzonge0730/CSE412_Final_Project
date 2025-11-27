# 원본 Catamaran (LLVM 3.4) 병렬화 구조 분석

## 핵심 메커니즘

### 1. Wrapper 함수 생성 (`LoopFreeTask::SafeCheckTobeMerged()`)

원본 Catamaran은 여러 메타데이터 체크 호출을 **하나의 wrapper 함수로 묶어서** 병렬화합니다:

```cpp
// 1. Wrapper 함수 생성
Function * wrapperFunc = Function::Create(
    wrapperFuncType,  // 모든 인자를 void*로 받는 시그니처
    Function::InternalLinkage, 
    "_spawn_loop_free_func_" + ID, 
    Module
);

// 2. Wrapper 함수 내부에서 모든 체크 함수를 순차 호출
for (auto checkFunc : checkFuncVec) {
    // 인자들을 void*에서 원래 타입으로 캐스팅
    CallInst::Create(checkFunc, groupedCastArgs, "", entryBB);
}
```

**인자 처리:**
- 포인터: `void*` → BitCast → 원래 포인터 타입
- 정수: `void*` → PtrToInt → 원래 정수 타입

### 2. 런타임 `spawn` 함수 호출

```cpp
// spawn 함수 시그니처: spawn(uint32_t id, void (*func)(void*, ...), void* arg0, ...)
std::string ctorName = "_Z5spawnjPFv..."; // C++ mangled name
Function *spawnFunc = Module->getOrInsertFunction(ctorName, ...);

// spawn 호출 생성
CallInst::Create(spawnFunc, {taskID, wrapperFunc, arg0, arg1, ...}, "", beforeInst);
```

### 3. Join 동기화

```cpp
// join 함수 호출
CallInst::Create(joinFunc, taskID, "", joinPoint);
```

## 현재 구현 (LLVM 17)과의 차이점

| 항목 | 원본 Catamaran (3.4) | 현재 구현 (LLVM 17) |
|------|---------------------|-------------------|
| 병렬화 단위 | 여러 체크를 하나의 태스크로 묶음 | 각 체크를 개별 스레드로 실행 |
| 인자 처리 | Wrapper 함수에서 void*로 통일 | 각 함수 시그니처별 특화된 async 함수 |
| 런타임 | `spawn/join` 기반 태스크 시스템 | `std::thread` 직접 사용 |
| 효율성 | 태스크 생성 오버헤드 적음 | 스레드 생성 오버헤드 큼 (체크 개수만큼) |

## 개선 방향

현재 구현을 원본 Catamaran 방식에 더 가깝게 만들려면:

1. **Wrapper 함수 생성 로직 추가**
   - 여러 체크를 하나의 wrapper로 묶기
   - 인자를 `void*`로 통일하여 처리

2. **런타임 라이브러리 확장**
   - `spawn(id, func, ...args)` 함수 추가
   - `join(id)` 함수 추가
   - 태스크 풀 또는 워커 스레드 풀 구현

3. **Join Point 처리**
   - PDG 분석을 통한 의존성 파악
   - 적절한 위치에 `join` 호출 삽입

## 참고 파일

- `Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMPass/LoopFreeTask.cpp:149` - `SafeCheckTobeMerged()` 구현
- `Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMPass/LoopFreeTask.cpp:262` - `genCtorForSpawn()` 구현  
- `Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMPass/LoopFreeTask.cpp:299` - `genSpawnArgs()` 구현


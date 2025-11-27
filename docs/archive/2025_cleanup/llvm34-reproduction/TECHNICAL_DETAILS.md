# LLVM 3.4 재현 기술 상세 문서

이 문서는 LLVM 3.4 환경에서 Catamaran 병렬화를 재현하기 위한 기술적 세부 사항을 다룹니다.

## 핵심 문제 및 해결책

### 문제 1: ENABLELOOPFREE 비활성화

#### 증상
- `opt` 실행 후 `spawn` 함수 호출이 생성되지 않음
- 로그에 "this task we can not handle, because of non safe call inst..." 출력
- 병렬화가 전혀 수행되지 않음

#### 원인
```cpp
// Loops.cpp line 7
#define ENABLELOOPFREE 0  // 비활성화됨
```

`ENABLELOOPFREE` 매크로가 `0`으로 설정되어 있어, LoopFreeTask 병렬화 로직이 컴파일 타임에 제외됨.

#### 해결
```cpp
// Loops.cpp line 7
#define ENABLELOOPFREE 1  // 활성화
```

**효과**: `#if ENABLELOOPFREE` 블록 내의 코드가 컴파일 및 실행됨.

**코드 위치**: `Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMPass/Loops.cpp:780-1098`

---

### 문제 2: spawn 인자 개수 초과

#### 증상
```
undefined reference to spawn(unsigned int, void (*)(void*, void*, ...))
```
링크 에러 발생. 인자 개수가 100개 이상으로 매우 많음.

#### 원인 분석

**ThreadPool.cpp 제약**:
- `ThreadPool.cpp`에는 최대 33개 인자를 받는 `spawn` 함수만 정의됨
- 예: `spawn(unsigned int, void (*)(void*, void*, ...), void*, void*, ...)` (최대 33개)

**Loops.cpp 배치 로직**:
```cpp
// 기존 코드 (1024번 줄 근처)
if (minCostPairVec.empty()) {
    std::vector<Instruction*> instSet{vec};  // vec 전체를 하나로 묶음
    // ...
}
```

**문제 시나리오**:
- 한 BasicBlock에 MoveC 체크 함수가 15개 있다고 가정
- MoveC 체크 함수 하나당 8개 인자 (`_RV_check_dpv` 등)
- `vec` 전체를 하나의 `instSet`으로 묶으면:
  - 15개 체크 × 8 인자 = 120개 데이터 인자
  - `spawn` 인자: 120 + 2 (task ID, function pointer) = 122개
  - → `ThreadPool`의 한계(33개) 초과

#### 해결 방법: 배치 크기 제한

**수정 내용** (`Loops.cpp:1024-1042`):

```cpp
if (minCostPairVec.empty()) {//use baseline version (modified to batch by 2)
    const int BATCH_SIZE = 2;
    for (size_t i = 0; i < vec.size(); i += BATCH_SIZE) {
        std::vector<Instruction*> instSet;
        for (size_t j = 0; j < BATCH_SIZE && i + j < vec.size(); ++j) {
            instSet.push_back(vec[i + j]);
        }

        LoopFreeTask * lftask = new LoopFreeTask(loopFreeId++, this->program);
        lftask->setSafeCheckCodesForOneTask(instSet);
        
        Instruction * lastInst = instSet.back();
        if (safeCheckCallInstJoinPoint.find(lastInst) != safeCheckCallInstJoinPoint.end()) {
            Instruction * jpt = safeCheckCallInstJoinPoint.at(lastInst);
            lftask->setJoinPoint(jpt);
            lftask->setCreatePt(lastInst);
            lftask->setJoinFunc(joinFunc);
            loopFreeTasks.push_back(lftask);
        } else {
            delete lftask;
        }
    }
}
```

**효과**:
- `vec`을 `BATCH_SIZE`(2개)씩 묶어서 여러 개의 `LoopFreeTask`로 분할
- MoveC 체크 2개 × 8 인자 = 16 데이터 인자
- `spawn` 인자: 16 + 2 (task ID, function pointer) = 18개
- → `ThreadPool`의 `spawn18` 함수 범위 내로 제한

**배치 크기 선택 이유**:
- MoveC 체크 함수 인자: 8개
- 2개 묶으면: 16 + 2 = 18개 → `ThreadPool` 지원 범위
- 3개 묶으면: 24 + 2 = 26개 → 가능하지만 여유가 적음
- 보수적으로 2개 선택

---

### 문제 3: 명령어 순서 불일치

#### 증상
```
Instruction does not dominate all uses!
  %zybc_108 = bitcast %struct._RV_pmd* %_RV_pmd_D_42917920 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(...)
```

LLVM IR 검증기에서 발생하는 에러. 명령어가 정의되기 전에 사용됨.

#### 원인 분석

**순서 보장 문제**:
```cpp
// 기존 코드 (977번 줄)
std::vector<Instruction*> vec;
vec.assign(safeCheckNonLoop.begin(), safeCheckNonLoop.end());
```

- `safeCheckNonLoop`는 `std::unordered_set<Instruction*>` 타입
- `unordered_set`은 **순서가 보장되지 않음** (해시 테이블 기반)
- `vec[0]`이 실제로는 `vec[1]`보다 나중에 실행될 수 있음

**문제 시나리오**:
1. BB 내 명령어 순서: `check1` → `...` → `check2`
2. `unordered_set`에 넣으면 순서 무작위화: `{check2, check1}`
3. `vec.assign()` 결과: `vec = [check2, check1]`
4. 배치 로직이 `vec[0]`을 기준으로 `spawn` 위치 결정
5. `spawn` 인자 준비 코드(`genSpawnArgs`)가 `check1` 앞에 삽입
6. 하지만 `check2`의 인자 준비 코드는 `check2` 앞에 삽입됨
7. → `spawn`이 `check2`의 인자 준비 코드보다 앞에 오게 되어 에러 발생

#### 해결 방법: BasicBlock 순서대로 수집

**수정 내용** (`Loops.cpp:977-985`):

```cpp
// 기존
std::vector<Instruction*> vec;
vec.assign(safeCheckNonLoop.begin(), safeCheckNonLoop.end());

// 수정 후
std::vector<Instruction*> vec;
// Ensure instructions are in order to avoid dominance issues
for (Instruction &I : BB) {
    if (safeCheckNonLoop.count(&I)) {
        vec.push_back(&I);
    }
}
```

**효과**:
- BasicBlock을 순회하면서 Safe Check 명령어를 **순서대로** `vec`에 추가
- `vec[0]`이 항상 첫 번째 체크, `vec[1]`이 두 번째 체크가 됨
- 명령어 간 의존성 순서 보장

---

### 문제 4: spawn 삽입 위치 오류

#### 증상
여전히 "Instruction does not dominate all uses!" 에러 발생

#### 원인 분석

**LoopFreeTask.cpp의 로직**:
```cpp
// LoopFreeTask.cpp:153-161
if (checksGroup.size() <= 2) {
    if (this->mergedirection == 0 || this->mergedirection == 2) {
        locToInsertBefore = checksGroup[0];  // 첫 번째 체크 앞에 삽입
    } else {
        locToInsertBefore = checksGroup[1];  // 두 번째 체크 앞에 삽입
    }
} else {
    locToInsertBefore = this->multiCheckStartPt;  // 우리가 설정한 값
}
```

**문제점**:
- `checksGroup.size() <= 2`일 때 `multiCheckStartPt`가 무시됨
- `Loops.cpp`에서 `setCreatePt(lastInst)`로 설정한 값이 무시됨

**문제 시나리오**:
1. `instSet = [check1, check2]` (순서 보장됨)
2. `Loops.cpp`에서 `setCreatePt(check2)` 호출 → `multiCheckStartPt = check2`
3. `LoopFreeTask.cpp`에서 `checksGroup.size() = 2` → `locToInsertBefore = check1`
4. `spawn`을 `check1` 앞에 삽입
5. `genSpawnArgs`가 `check2`의 인자 준비 코드를 `check2` 앞에 삽입
6. → `spawn`이 `check2`의 인자 준비 코드보다 앞에 오게 되어 에러

#### 해결 방법: multiCheckStartPt 우선 사용

**수정 내용** (`LoopFreeTask.cpp:153-161`):

```cpp
// 기존
if (checksGroup.size() <= 2) {
    if (this->mergedirection == 0 || this->mergedirection == 2) {
        locToInsertBefore = checksGroup[0];
    } else {
        locToInsertBefore = checksGroup[1];
    }
} else {
    locToInsertBefore = this->multiCheckStartPt;
}

// 수정 후
if (this->multiCheckStartPt != nullptr) {
    locToInsertBefore = this->multiCheckStartPt;
} else if (checksGroup.size() <= 2) {
    if (this->mergedirection == 0 || this->mergedirection == 2) {
        locToInsertBefore = checksGroup[0];
    } else {
        locToInsertBefore = checksGroup[1];
    }
} else {
    locToInsertBefore = this->multiCheckStartPt;
}
```

**효과**:
- `multiCheckStartPt`가 설정되어 있으면 **무조건 우선 사용**
- `Loops.cpp`에서 설정한 삽입 위치(`instSet.back()` = `check2`)를 존중
- `spawn`이 `check2` 앞에 삽입되어 모든 인자 준비 코드가 먼저 생성됨

---

## 코드 흐름 분석

### 정상 동작 흐름

1. **Loops::runOnModule** (Module 패스)
   - 함수별로 LoopFreeTask 분석 시작
   - BasicBlock 단위로 Safe Check 수집

2. **Safe Check 수집** (`Loops.cpp:831-853`)
   ```cpp
   for (BasicBlock& BB : F) {
       if (allLoopBasicBlocksForLF.count(&BB) > 0) continue;  // Loop BB 제외
       
       for (Instruction& I : BB) {
           if (CallInst *CI = dyn_cast<CallInst>(&I)) {
               if (IsSafeCheckCallForLoopFree(CI)) {
                   safeCheckCallInstInNonLoopBody.push_back(&I);
                   safeCheckNonLoop.insert(&I);
               }
           }
       }
   }
   ```

3. **순서 보장된 vec 생성** (`Loops.cpp:977-985`)
   ```cpp
   std::vector<Instruction*> vec;
   for (Instruction &I : BB) {  // BB 순서대로 순회
       if (safeCheckNonLoop.count(&I)) {
           vec.push_back(&I);
       }
   }
   ```

4. **배치 분할** (`Loops.cpp:1024-1042`)
   ```cpp
   const int BATCH_SIZE = 2;
   for (size_t i = 0; i < vec.size(); i += BATCH_SIZE) {
       std::vector<Instruction*> instSet;
       // 2개씩 묶기
       // ...
       lftask->setCreatePt(lastInst);  // instSet.back() 설정
   }
   ```

5. **LoopFreeTask::transform** 호출
   - `SafeCheckTobeMerged()` 실행

6. **SafeCheckTobeMerged** (`LoopFreeTask.cpp:149`)
   - `locToInsertBefore = multiCheckStartPt` (우선 사용)
   - `genSpawnArgs()` 호출하여 인자 준비 코드 생성

7. **genSpawnArgs** (`LoopFreeTask.cpp:296-326`)
   - 각 체크 함수의 인자를 순회하며 `bitcast` 생성
   - 각 `bitcast`를 해당 체크 함수 **앞에** 삽입

8. **spawn 호출 생성** (`LoopFreeTask.cpp:246`)
   - `CallInst::Create(ctorIt->second, needArgs, "", locToInsertBefore)`
   - `locToInsertBefore` (즉, `instSet.back()`) **앞에** 삽입

9. **최종 순서**:
   ```
   check1의 인자 준비 코드 (bc1)
   check2의 인자 준비 코드 (bc2)
   spawn(bc1, bc2)  ← instSet.back() 앞에 삽입
   check1 (원본, 나중에 삭제됨)
   check2 (원본, 나중에 삭제됨)
   ```

---

## 성능 분석

### 작은 입력값 (32×32×32×32)

#### Sequential MoveC
```
real    0m0.606s
user    0m0.603s
sys     0m0.004s
```

#### Catamaran MoveC
```
real    0m1.081s
user    0m0.575s
sys     0m3.626s
```

#### 분석

**실행 시간**: Catamaran이 약 78% 느림 (0.606s → 1.081s)

**이유 분석**:
1. **작은 작업량**: 입력 크기가 작아 실제 병렬화 이익이 거의 없음
2. **스레드 오버헤드**: `sys` 시간이 매우 높음 (3.626s)
   - 스레드 생성/동기화 비용
   - 컨텍스트 스위칭 오버헤드
   - 메모리 접근 패턴 악화 (false sharing 등)

3. **`spawn` 호출 빈도**: 작은 입력값에서도 많은 `spawn` 호출이 생성되어 오버헤드가 누적

**결론**: 작은 입력값에서는 **오버헤드가 병렬화 이익을 크게 상쇄**

### 대규모 입력값 (1000×1000×1000×1000)

**상태**: 측정 중 (너무 오래 걸림, 미완료)

**예상**:
- 대규모 입력값에서는 실제 병렬화 이익이 오버헤드를 초과할 가능성
- 하지만 현재 측정 결과가 없어 확정 불가

---

## ThreadPool 구조 분석

### spawn 함수 오버로딩

`ThreadPool.cpp`에는 인자 개수별로 `spawn` 함수가 오버로딩되어 있음:

```cpp
void spawn(unsigned int, void (*)(void*), void*);  // 1개 인자
void spawn(unsigned int, void (*)(void*, void*), void*, void*);  // 2개 인자
// ...
void spawn(unsigned int, void (*)(void*, void*, ...), void*, void*, ...);  // 최대 33개
```

**제한**: 최대 33개 인자까지만 지원

**우리 사용**: 18개 (task ID + function pointer + 16개 데이터 인자)

### genCtorForSpawn 함수

`LoopFreeTask.cpp:263-295`에서 인자 개수에 따라 `spawn` 함수를 자동으로 선택:

```cpp
void LoopFreeTask::genCtorForSpawn(Function * wrapperFunc) {
    // wrapperFunc의 인자 개수에 따라 적절한 spawn 함수 선택
    // 예: 16개 인자면 _Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ 
    // (매글된 함수명)
}
```

---

## LLVM 3.4 빌드 시 수정 사항

### 1. C++ 표준 라이브러리 헤더 누락

**파일**: `Catamaran-llvm-3.4.0/llvm/lib/Analyses/Decider.cpp`

**에러**:
```
error: 'accumulate' is not a member of 'std'
error: 'algorithm' file not found
```

**해결**: 
```cpp
#include <numeric>
#include <algorithm>
```

### 2. sys/ustat.h 제거

**파일**: `sanitizer_platform_limits_posix.cc`

**에러**: 최신 Linux 커널에서 `struct ustat`이 제거됨

**해결**: 관련 코드 주석 처리

### 3. signal.h 누락

**파일**: `asan_linux.cc`, `sanitizer_stoptheworld_linux_libcdep.cc`

**해결**: `#include <signal.h>` 추가

### 4. sigaltstack 타입 불일치

**파일**: `sanitizer_stoptheworld_linux_libcdep.cc`

**해결**: `reinterpret_cast<struct sigaltstack*>` 사용

### 5. Python 2 → Python 3 변환

**파일**: `gen_dynamic_list.py`

**변경**:
```python
# Python 2
print 'something'
nm_out = nm_proc.communicate()[0].split('\n')

# Python 3
print('something')
nm_out = nm_proc.communicate()[0].decode().split('\n')
```

### 6. 네트워크 헤더 누락

**파일**: `tsan_platform_linux.cc`

**해결**: 
```cpp
#include <netinet/in.h>
#include <arpa/nameser.h>
```

---

## 향후 개선 방안

### 1. 동적 배치 크기 조정

현재는 고정값(2개)을 사용하지만, 체크 함수의 인자 개수에 따라 동적으로 조정 가능:

```cpp
int BATCH_SIZE = 1;
if (checkFuncArgCount == 8) {
    BATCH_SIZE = 2;  // 2 × 8 = 16 + 2 = 18
} else if (checkFuncArgCount == 4) {
    BATCH_SIZE = 4;  // 4 × 4 = 16 + 2 = 18
}
```

### 2. 최소 작업량 임계값

작은 입력값에서도 효율적인 병렬화를 위해, 작업량이 일정 임계값 이하면 병렬화를 건너뛰도록:

```cpp
if (vec.size() < MIN_BATCH_SIZE) {
    // 병렬화 건너뛰기
    return;
}
```

### 3. 스레드 풀 최적화

- `NUM_THREADS` 값 튜닝 (현재 4개)
- 워크 스틸링 알고리즘 개선
- 메모리 접근 패턴 최적화 (false sharing 방지)

---

**작성일**: 2024년 11월 22일  
**최종 업데이트**: 2024년 11월 22일



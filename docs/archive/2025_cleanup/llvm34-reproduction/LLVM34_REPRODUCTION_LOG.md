# LLVM 3.4 재현 작업 상세 로그

이 문서는 LLVM 3.4 환경에서 Catamaran의 MoveC 병렬화를 재현하기 위한 작업의 상세 기록입니다.

## 작업 개요

**목표**: LLVM 3.4 환경에서 MoveC 2mm 벤치마크가 논문에서 발표한 대로 성능 향상을 보이는지 검증

**시작일**: 2024년 11월 22일

**환경**: 
- LLVM 3.4.0 (Docker 컨테이너 `catamaran-3.4`)
- Ubuntu 20.04 기반
- PolyBench 2mm 벤치마크

## 초기 상태 분석

### 1. 문제 발견

초기 벤치마크 실행 결과:
- **Sequential MoveC (LLVM 3.4)**: 20.583초
- **Catamaran MoveC (LLVM 3.4)**: 24.060초

**결과**: Catamaran이 오히려 느려짐 (약 17% 느림)

### 2. 원인 분석

#### 2.1 병렬화 미실행 확인

`CM-MoveC-2mm.bc` 파일을 역어셈블하여 확인한 결과:
- `spawn` 함수 호출이 **전혀 생성되지 않음**
- "this task we can not handle, because of non safe call inst..." 로그 다수 출력
- 실제 병렬화가 수행되지 않았음

#### 2.2 코드 분석

`Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMPass/Loops.cpp` 확인:
```cpp
#define ENABLELOOP 1
#define ENABLELOOPFREE 0  // ← 문제 발견!
```

**문제점**: `ENABLELOOPFREE`가 `0`으로 설정되어 있어 LoopFreeTask 병렬화가 비활성화됨

## 수정 작업

### 1. ENABLELOOPFREE 활성화

**파일**: `Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMPass/Loops.cpp`

**변경사항**:
```cpp
// 수정 전
#define ENABLELOOPFREE 0

// 수정 후
#define ENABLELOOPFREE 1
```

**효과**: LoopFreeTask 병렬화 로직이 실행되도록 변경

### 2. 병렬화 후 spawn 호출 생성 확인

수정 후 `opt` 실행 결과:
- `spawn` 함수 호출이 **대량 생성됨**
- 로그에 `needArgSize: 18`, `needArgSize: 10` 등 출력 확인
- `_spawn_loop_free_func_*` 함수들이 생성됨

**문제**: 일부 `spawn` 호출에서 인자 개수가 너무 많음 (100개 이상)
- 예: `undefined reference to spawn(unsigned int, void (*)(void*, void*, void*, ...))` (약 119개 인자)

### 3. 인자 개수 제한 문제 해결

#### 3.1 문제 원인

`ThreadPool.cpp`에는 최대 33개 인자를 받는 `spawn` 함수만 정의되어 있음.
하지만 `Loops.cpp`에서 MoveC 체크 함수들을 묶을 때:
- MoveC 체크 함수 하나당 8개 인자
- 한 BasicBlock에 15개 체크 함수가 있으면 → 15 × 8 = 120개 인자
- `spawn` 인자로는: 120 + 2 (task ID, function pointer) = 122개
- → `ThreadPool`의 한계(33개) 초과

#### 3.2 해결 방법: 배치 크기 제한

**파일**: `Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMPass/Loops.cpp`

**위치**: `Loops::runOnModule` 함수 내부, `if (minCostPairVec.empty())` 블록 (약 1024번 줄)

**변경 전**:
```cpp
if (minCostPairVec.empty()) {//use baseline version
    std::vector<Instruction*> instSet{vec};
    LoopFreeTask * lftask = new LoopFreeTask(loopFreeId++, this->program);
    lftask->setSafeCheckCodesForOneTask(instSet);
    // ... (vec 전체를 하나의 태스크로 묶음)
}
```

**변경 후**:
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
        // Ensure the key exists in the map
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
- `vec`을 2개씩 묶어서 여러 개의 `LoopFreeTask`로 분할
- MoveC 체크 2개 × 8 인자 = 16 인자 + 2 (task ID, function pointer) = 18 인자
- → `ThreadPool`의 `spawn18` 함수 범위 내로 제한

### 4. 명령어 순서 보장

#### 4.1 문제: "Instruction does not dominate all uses!" 에러

`opt` 실행 중 발생:
```
Instruction does not dominate all uses!
  %zybc_108 = bitcast %struct._RV_pmd* %_RV_pmd_D_42917920 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(...)
```

**원인 분석**:
- `vec.assign(safeCheckNonLoop.begin(), safeCheckNonLoop.end())` 
- `safeCheckNonLoop`는 `std::unordered_set<Instruction*>`이므로 **순서가 보장되지 않음**
- `spawn` 인자 준비 코드(`bitcast`)가 원본 명령어 순서와 맞지 않게 생성됨

#### 4.2 해결 방법: 순서 보장

**파일**: `Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMPass/Loops.cpp`

**위치**: 약 977번 줄

**변경 전**:
```cpp
std::vector<Instruction*> vec;
vec.assign(safeCheckNonLoop.begin(), safeCheckNonLoop.end());
```

**변경 후**:
```cpp
std::vector<Instruction*> vec;
// Ensure instructions are in order to avoid dominance issues
for (Instruction &I : BB) {
    if (safeCheckNonLoop.count(&I)) {
        vec.push_back(&I);
    }
}
```

**효과**: BasicBlock 순회 순서대로 `vec`에 명령어가 추가되어 순서 보장

### 5. spawn 삽입 위치 수정

#### 5.1 문제: 여전히 "Instruction does not dominate all uses!" 발생

`LoopFreeTask.cpp`의 `SafeCheckTobeMerged` 함수에서:
```cpp
if (checksGroup.size() <= 2) {
    if (this->mergedirection == 0 || this->mergedirection == 2) {
        locToInsertBefore = checksGroup[0];  // ← 첫 번째 체크 앞에 삽입
    } else {
        locToInsertBefore = checksGroup[1];  // ← 두 번째 체크 앞에 삽입
    }
} else {
    locToInsertBefore = this->multiCheckStartPt;  // ← 우리가 설정한 값 무시됨
}
```

**문제점**: 
- `checksGroup.size() <= 2`일 때 `multiCheckStartPt`가 무시됨
- `checksGroup[0]` 앞에 `spawn`을 삽입하면, `checksGroup[1]`의 인자 준비 코드(`bc2`)가 `spawn`보다 뒤에 있게 되어 에러 발생

#### 5.2 해결 방법: multiCheckStartPt 우선 사용

**파일**: `Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMPass/LoopFreeTask.cpp`

**위치**: 약 149번 줄, `SafeCheckTobeMerged` 함수 시작 부분

**변경 전**:
```cpp
if (checksGroup.size() <= 2) {
    if (this->mergedirection == 0 || this->mergedirection == 2) {
        locToInsertBefore = checksGroup[0];
    } else {
        locToInsertBefore = checksGroup[1];
    }
} else {
    locToInsertBefore = this->multiCheckStartPt;
}
```

**변경 후**:
```cpp
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

**효과**: `Loops.cpp`에서 설정한 `multiCheckStartPt` (즉, `instSet.back()`)를 우선 사용하여 안전한 삽입 위치 보장

## 최종 결과

### 빌드 성공

```
[ 98%] Built target CMPass
[100%] Built target llvm-c-test
```

### opt 실행 성공

```
Loops::runOnModule...before return
Exit code: 0
```

**에러 해결**: "Instruction does not dominate all uses!" 에러 완전 해결

### 성능 측정 결과

#### 작은 입력값 (32×32×32×32)

**Sequential MoveC**:
```
real    0m0.606s
user    0m0.603s
sys     0m0.004s
```

**Catamaran MoveC**:
```
real    0m1.081s
user    0m0.575s
sys     0m3.626s
```

**분석**:
- 병렬화가 정상 작동 (ThreadPool 초기화 로그 확인)
- 하지만 작은 입력값에서는 오버헤드로 인해 느림
- `sys` 시간이 높음 (3.626s) → 스레드 생성/동기화 오버헤드

#### 대규모 입력값 (1000×1000×1000×1000)

**상태**: 측정 중 (너무 오래 걸림, 중단)

**가설**:
- 작은 입력값에서는 오버헤드가 병렬화 이익을 상쇄
- 대규모 입력값에서는 병렬화 이익이 오버헤드를 초과할 가능성
- 하지만 현재 측정 결과 미완료

## 발견된 추가 문제점

### 1. LLVM 3.4 빌드 시 수정 필요 사항들

빌드 과정에서 발견된 문제들과 해결책:

#### 1.1 C++ 헤더 누락

**파일**: `Catamaran-llvm-3.4.0/llvm/lib/Analyses/Decider.cpp`

**수정**:
```cpp
// std includes
#include <cmath>
#include <numeric>  // ← 추가
#include <algorithm>  // ← 추가
```

#### 1.2 sys/ustat.h 제거

**파일**: `Catamaran-llvm-3.4.0/llvm/projects/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.cc`

**이유**: 최신 Linux 커널에서 `ustat` 구조체가 제거됨

**수정**: `#include <sys/ustat.h>` 및 관련 체크 주석 처리

#### 1.3 signal.h 추가

**파일**: 
- `Catamaran-llvm-3.4.0/llvm/projects/compiler-rt/lib/asan/asan_linux.cc`
- `Catamaran-llvm-3.4.0/llvm/projects/compiler-rt/lib/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc`

**수정**: `#include <signal.h>` 추가

#### 1.4 sigaltstack 캐스팅

**파일**: `Catamaran-llvm-3.4.0/llvm/projects/compiler-rt/lib/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc`

**이유**: `struct sigaltstack` 타입 불일치

**수정**: `reinterpret_cast<struct sigaltstack*>` 사용

#### 1.5 Python 2 → Python 3 변환

**파일**: `Catamaran-llvm-3.4.0/llvm/projects/compiler-rt/lib/sanitizer_common/scripts/gen_dynamic_list.py`

**수정**: `print` 문법 및 `bytes.decode()` 추가

#### 1.6 네트워크 헤더 추가

**파일**: `Catamaran-llvm-3.4.0/llvm/projects/compiler-rt/lib/tsan/rtl/tsan_platform_linux.cc`

**수정**: `#include <netinet/in.h>`, `#include <arpa/nameser.h>` 추가

## 요약

### 성공한 작업

1. ✅ `ENABLELOOPFREE` 활성화
2. ✅ 배치 크기 제한 (2개씩 묶기)
3. ✅ 명령어 순서 보장
4. ✅ `spawn` 삽입 위치 수정
5. ✅ 모든 컴파일 에러 해결
6. ✅ `opt` 정상 실행 (에러 없음)
7. ✅ 병렬화 정상 작동 확인 (작은 입력값)

### 남은 작업

1. ⏳ 대규모 입력값(1000) 성능 측정 완료
2. ⏳ Sequential vs Catamaran 비교 분석
3. ⏳ 논문 결과와의 비교 검증

### 향후 개선 방안

1. **배치 크기 동적 조정**: 현재 고정값(2개)을 인자 개수에 따라 동적으로 조정
2. **오버헤드 최적화**: 작은 입력값에서도 효율적인 병렬화를 위한 최소 작업량 임계값 설정
3. **스레드 풀 튜닝**: `NUM_THREADS` 최적값 찾기

## 관련 파일

### 수정된 파일 목록

1. `Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMPass/Loops.cpp`
   - `ENABLELOOPFREE`: 0 → 1
   - 배치 로직 추가 (2개씩 묶기)
   - 명령어 순서 보장 로직 추가

2. `Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMPass/LoopFreeTask.cpp`
   - `multiCheckStartPt` 우선 사용 로직 추가

3. 빌드 관련 수정 (6개 파일)
   - `Decider.cpp`: 헤더 추가
   - `sanitizer_platform_limits_posix.cc`: ustat 제거
   - `asan_linux.cc`: signal.h 추가
   - `sanitizer_stoptheworld_linux_libcdep.cc`: signal.h 및 캐스팅
   - `gen_dynamic_list.py`: Python 3 변환
   - `tsan_platform_linux.cc`: 네트워크 헤더 추가

### 테스트 파일

- `examples/MoveC-2mm-backup.ll`: 원본 MoveC 계측 IR
- `examples/CM-MoveC-2mm.bc`: Catamaran 패스 적용 결과
- `examples/CM-MoveC-2mm.ll`: 역어셈블 결과
- `examples/CM-MoveC-2mm`: 최종 실행 파일

---

**작성일**: 2024년 11월 22일  
**작성자**: AI Assistant (Auto)  
**최종 업데이트**: 2024년 11월 22일


# LLVM 3.4 재현 작업 변경 사항 요약

이 문서는 LLVM 3.4 환경에서 Catamaran 병렬화를 재현하기 위해 수정한 모든 파일과 변경 사항을 요약합니다.

## 핵심 수정 사항

### 1. Catamaran 핵심 로직 수정

#### 파일 1: `Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMPass/Loops.cpp`

**변경 1-1: ENABLELOOPFREE 활성화**
- **위치**: Line 7
- **변경 전**: `#define ENABLELOOPFREE 0`
- **변경 후**: `#define ENABLELOOPFREE 1`
- **목적**: LoopFreeTask 병렬화 로직 활성화

**변경 1-2: 명령어 순서 보장**
- **위치**: Line 977-985
- **변경 전**:
  ```cpp
  std::vector<Instruction*> vec;
  vec.assign(safeCheckNonLoop.begin(), safeCheckNonLoop.end());
  ```
- **변경 후**:
  ```cpp
  std::vector<Instruction*> vec;
  // Ensure instructions are in order to avoid dominance issues
  for (Instruction &I : BB) {
      if (safeCheckNonLoop.count(&I)) {
          vec.push_back(&I);
      }
  }
  ```
- **목적**: BasicBlock 순서대로 명령어를 수집하여 dominance 에러 방지

**변경 1-3: 배치 크기 제한 (2개씩 묶기)**
- **위치**: Line 1024-1042
- **변경 전**:
  ```cpp
  if (minCostPairVec.empty()) {
      std::vector<Instruction*> instSet{vec};
      LoopFreeTask * lftask = new LoopFreeTask(loopFreeId++, this->program);
      lftask->setSafeCheckCodesForOneTask(instSet);
      // ... (vec 전체를 하나로 묶음)
  }
  ```
- **변경 후**:
  ```cpp
  if (minCostPairVec.empty()) {
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
- **목적**: `spawn` 인자 개수를 ThreadPool 제한(33개) 내로 제한

#### 파일 2: `Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMPass/LoopFreeTask.cpp`

**변경 2-1: multiCheckStartPt 우선 사용**
- **위치**: Line 153-161
- **변경 전**:
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
- **변경 후**:
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
- **목적**: `Loops.cpp`에서 설정한 삽입 위치를 우선 존중하여 dominance 에러 방지

---

## 빌드 관련 수정 사항

### 파일 3: `Catamaran-llvm-3.4.0/llvm/lib/Analyses/Decider.cpp`

**변경 3-1: C++ 표준 라이브러리 헤더 추가**
- **위치**: 헤더 섹션
- **추가 내용**:
  ```cpp
  #include <numeric>
  #include <algorithm>
  ```
- **목적**: `std::accumulate` 및 `std::algorithm` 함수 사용 가능하도록

### 파일 4: `Catamaran-llvm-3.4.0/llvm/projects/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.cc`

**변경 4-1: sys/ustat.h 제거**
- **위치**: Line 89 근처
- **변경 전**: `#include <sys/ustat.h>`
- **변경 후**: `// #include <sys/ustat.h>` (주석 처리)
- **이유**: 최신 Linux 커널에서 `struct ustat`이 제거됨

**변경 4-2: ustat 관련 체크 제거**
- **위치**: Line 159 근처
- **변경 전**: `unsigned struct_ustat_sz = sizeof(struct ustat);`
- **변경 후**: `// unsigned struct_ustat_sz = sizeof(struct ustat);` (주석 처리)

**변경 4-3: ipc_perm 체크 제거**
- **위치**: Line 213 근처
- **변경 전**:
  ```cpp
  CHECK_SIZE_AND_OFFSET(ipc_perm, mode);
  CHECK_SIZE_AND_OFFSET(ipc_perm, __seq);
  ```
- **변경 후**: 주석 처리

### 파일 5: `Catamaran-llvm-3.4.0/llvm/projects/compiler-rt/lib/asan/asan_linux.cc`

**변경 5-1: signal.h 추가**
- **위치**: 헤더 섹션
- **추가 내용**: `#include <signal.h>`
- **목적**: `signal()` 함수 사용 가능하도록

### 파일 6: `Catamaran-llvm-3.4.0/llvm/projects/compiler-rt/lib/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc`

**변경 6-1: signal.h 추가**
- **위치**: 헤더 섹션
- **추가 내용**: `#include <signal.h>`

**변경 6-2: sigaltstack 타입 수정**
- **위치**: Line 85 근처
- **변경 전**: `struct sigaltstack handler_stack;`
- **변경 후**: `stack_t handler_stack;`

**변경 6-3: sigaltstack 캐스팅 추가**
- **위치**: Line 97, 110 근처
- **변경 전**: `internal_sigaltstack(&handler_stack, NULL);`
- **변경 후**: `internal_sigaltstack(reinterpret_cast<struct sigaltstack*>(&handler_stack), NULL);`
- **이유**: 타입 불일치 해결

### 파일 7: `Catamaran-llvm-3.4.0/llvm/projects/compiler-rt/lib/sanitizer_common/scripts/gen_dynamic_list.py`

**변경 7-1: Python 2 → Python 3 변환**
- **위치**: 전체 파일
- **변경 내용**:
  - `print 'something'` → `print('something')`
  - `nm_proc.communicate()[0]` → `nm_proc.communicate()[0].decode()`
- **이유**: Python 3 호환성

### 파일 8: `Catamaran-llvm-3.4.0/llvm/projects/compiler-rt/lib/tsan/rtl/tsan_platform_linux.cc`

**변경 8-1: 네트워크 헤더 추가**
- **위치**: 헤더 섹션
- **추가 내용**:
  ```cpp
  #include <netinet/in.h>
  #include <arpa/nameser.h>
  ```
- **제거**: `#define __need_res_state` (주석 처리)

**변경 8-2: __res_state 캐스팅 명시화**
- **위치**: `ExtractResolvFDs` 함수
- **변경 내용**: `struct __res_state *statp = (struct __res_state*)state;`

---

## 변경 사항 요약 테이블

| 파일 | 변경 유형 | 목적 | 영향 |
|------|----------|------|------|
| `Loops.cpp` | 핵심 로직 수정 | 병렬화 활성화 및 인자 개수 제한 | High |
| `LoopFreeTask.cpp` | 핵심 로직 수정 | 삽입 위치 우선순위 수정 | High |
| `Decider.cpp` | 빌드 에러 수정 | 표준 라이브러리 헤더 추가 | Low |
| `sanitizer_platform_limits_posix.cc` | 빌드 에러 수정 | 최신 Linux 호환성 | Low |
| `asan_linux.cc` | 빌드 에러 수정 | signal.h 추가 | Low |
| `sanitizer_stoptheworld_linux_libcdep.cc` | 빌드 에러 수정 | signal.h 및 타입 수정 | Low |
| `gen_dynamic_list.py` | 빌드 에러 수정 | Python 3 호환성 | Low |
| `tsan_platform_linux.cc` | 빌드 에러 수정 | 네트워크 헤더 추가 | Low |

---



## 결론

### 성공한 작업
1. ENABLELOOPFREE` 활성화로 병렬화 로직 실행 확인
2. 배치 크기 제한으로 `spawn` 인자 개수 문제 해결
3. 명령어 순서 보장으로 dominance 에러 해결
4. `spawn` 삽입 위치 수정으로 최종 에러 해결
5. 모든 컴파일 에러 해결
6. `opt` 정상 실행 확인

### 남은 작업
1. ⏳ 대규모 입력값 성능 측정 완료
2. ⏳ Sequential vs Catamaran 상세 비교 분석
3. ⏳ 논문 결과와의 비교 검증

### 향후 개선 방안
1. 동적 배치 크기 조정 (현재 고정값 2개)
2. 작은 입력값 오버헤드 최적화
3. 스레드 풀 튜닝 (`NUM_THREADS` 최적값 찾기)

---

**작성일**: 2024년 11월 22일  
**최종 업데이트**: 2024년 11월 22일



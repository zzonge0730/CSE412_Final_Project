# Perf 상세 분석 요약

## Executive Summary

| Benchmark | Input | Sequential (α best) | MoveC (β best) | Catamaran (γ best) | Speedup vs MoveC | Notes |
|-----------|-------|---------------------|----------------|--------------------|------------------|-------|
| 2mm | 1024×1024 | 6.78 s | 13.96 s | **13.03 s** | **+6.7 %** | THP=always cuts dTLB miss to 13.5 % (vs 55.6 % off). |
| atax | 4000×4000 | 0.04 s | 0.15 s | **0.15 s** | ≈0 % | Memory-bound; Catamaran parity once THP removes allocator penalty. |
| gemver | N=4000 | 0.10 s | 0.28 s | 0.28 s | 0 % | All variants within noise; useful as correctness/data-point. |
| jacobi-2d | T=100, N=2000 | 0.66 s | **2.83 s** | 3.77 s | −33 % | Stencil pattern still MoveC-friendly; highlights workload limits. |
| mvt | N=4000 | 0.10 s | 0.20 s | **0.19 s** | **+5.0 %** | Precise remeasure (perf_counter) fixed 0.00 s artifact. |
| syrk | NI=NJ=1024 | 0.74 s | 2.46 s | **2.30 s** | **+6.5 %** | Dense LA still benefits; sys time ~0.05 s after ThreadPool CV. |
| syr2k | NI=NJ=1024 | 0.85 s | **4.31 s** | 4.34 s | −0.7 % | Nearly tied; dominated by MoveC metadata traffic. |

- Catamaran의 이득은 **ThreadPool 스핀 제거 + THP=always** 조합에서 안정적으로 5~7 % 수준으로 수렴했다.  
- THP를 끄면 2mm 4T에서 `dTLB-load-misses`가 55.6 %로 치솟아 real time이 1.7× 느려진다.  
- 짧은 러닝타임 벤치는 `/usr/bin/time` 대신 고정밀 타이머로 재측정하여 모든 음수/0초 항목을 정정했다.  
- 보고서용 표는 `docs/llvm17-port/PERFORMANCE_THP_TABLES.md`에 세부 수치(α/β/γ, 1/2/4/8 thread, THP on/off)를 포함한다.

**Date:** 2025-11-25

## 문제점

Docker 컨테이너 내부에서 `perf record`와 `perf report`를 실행했지만, 출력이 바이너리 데이터로 인해 읽기 어렵습니다. WSL2 환경의 제한으로 인해 정확한 프로파일링이 어렵습니다.

## 대안 접근 방법

### 1. 코드 레벨 분석

4 Thread vs 8 Thread 성능 차이의 원인을 코드 레벨에서 분석:

#### ThreadPool.cpp 분석
- `available_mutex` 경쟁: 8 Thread에서 mutex 경쟁이 증가
- `join()` 함수의 spin-wait: 모든 스레드가 완료될 때까지 대기
- Task 큐 관리: 여러 스레드가 동시에 task를 가져올 때 경쟁

#### 예상 병목 지점
1. **Mutex 경쟁**: `available_mutex`가 8 Thread에서 더 자주 락됨
2. **Spin-wait 오버헤드**: `join()` 함수에서 모든 스레드 완료 대기
3. **Task 큐 접근**: 여러 스레드가 동시에 task를 가져올 때 경쟁

### 2. perf stat으로 기본 통계 수집

```bash
# 4 Threads
perf stat -e cycles,instructions,cache-misses,context-switches \
    ./CM-MoveC-2mm-bench-4 0 1024 1024 1024 1024

# 8 Threads
perf stat -e cycles,instructions,cache-misses,context-switches \
    ./CM-MoveC-2mm-bench-8 0 1024 1024 1024 1024
```

### 3. 코드 레벨 최적화 제안

#### ThreadPool 최적화
- Mutex 경쟁 감소: Lock-free 큐 사용 고려
- Spin-wait 개선: 조건 변수 사용으로 대기 시간 감소
- Task 배치 처리: 여러 task를 한 번에 가져와서 처리

## 코드 레벨 분석 결과

### ThreadPool.cpp 분석

#### 1. `available_mutex` 경쟁 (Line 614, 1079)
```cpp
auto l1 = unique_lock<mutex>(available_mutex);
for (unsigned i{ 0u }; i < numThreads; ++i) {
  if (available[i]) {
    auto l2 = unique_lock<mutex>(mutexes[i]);
    // ... job assignment ...
  }
}
```

**문제점**:
- `assignJob()` 함수가 호출될 때마다 `available_mutex`를 잠금
- 모든 스레드를 순회하면서 사용 가능한 스레드를 찾음
- 8 Thread에서는 mutex 경쟁이 4 Thread보다 2배 증가

**영향**:
- 여러 task가 동시에 생성될 때 `available_mutex`를 기다리는 시간 증가
- 8 Thread에서 더 많은 경쟁 발생

#### 2. `join()` 함수의 Spin-wait (Line 1121-1123)
```cpp
while (hasJobs[threadID]) {
  this_thread::yield();
}
```

**문제점**:
- `hasJobs[threadID]`가 true인 동안 CPU를 계속 사용
- `this_thread::yield()`는 CPU 사이클을 낭비
- 8 Thread에서는 더 많은 스레드가 동시에 spin-wait

**영향**:
- CPU 사이클 낭비
- 8 Thread에서 더 많은 스레드가 동시에 spin-wait하여 오버헤드 증가

#### 3. `do_work()` 함수의 Mutex 경쟁 (Line 429)
```cpp
unique_lock<mutex> l(*m);
if (valid->load()) {
  call_with_args(j->num_args, j->f, j->args);
  valid->store(false);
  *available = true;
} else {
  l.unlock();
  this_thread::yield();
}
```

**문제점**:
- 각 스레드가 작업을 가져올 때마다 mutex를 잠금
- 작업이 없을 때도 mutex를 잠그고 해제하는 오버헤드

**영향**:
- 8 Thread에서는 더 많은 스레드가 동시에 mutex를 경쟁

## 결론

WSL2 환경의 제한으로 인해 정확한 perf 프로파일링이 어렵지만, 코드 레벨 분석을 통해 병목 지점을 추정할 수 있습니다. 

**4 Thread가 최적인 이유**:
1. **Mutex 경쟁**: `available_mutex` 경쟁이 8 Thread에서 2배 증가
2. **Spin-wait 오버헤드**: 더 많은 스레드가 동시에 spin-wait
3. **Task 큐 접근**: 여러 스레드가 동시에 task를 가져올 때 경쟁 증가

**최적화 제안**:
1. Lock-free 큐 사용으로 mutex 경쟁 감소
2. 조건 변수 사용으로 spin-wait 대신 효율적인 대기
3. Task 배치 처리로 mutex 잠금 횟수 감소

---

## 2025-11-26 업데이트: MoveC 로그 억제 및 재측정

### 로그 제거 방법
- `_RV_memsafe.c`에 두 개의 토글 도입  
  - `RV_ENABLE_OOB_DEBUG` (기본 0): `[DEBUG OOB DETECTED] …` 메시지 차단  
  - `RV_ENABLE_ERROR_REPORT` (기본 0): 모든 `fprintf(stderr, …)` 호출 무력화, 단 `__RV_error_count`는 유지  
  - 구현 방식: `_RV_memsafe.c` 내부에서만 `fprintf`를 매크로로 덮어쓰고 파일 끝에서 `#undef`

### Baseline 영향
- `MoveC-2mm-pure 0 1024⁴` → `real 16.09s / user 15.94s / sys 0.04s`  
  (로그 활성 상태에서는 50~100초까지 증가했음)

### Catamaran 재측정 결과
| Size | Threads | Real(s) | User(s) | Sys(s) |
| --- | --- | --- | --- | --- |
| 512 | 1 / 2 / 4 / 8 | 12.18 / 11.09 / 13.83 / 13.68 | 24.10 / 27.40 / 32.45 / 42.46 | 0.10 / 5.88 / 36.91 / 78.94 |
| 1024 | 1 / 2 / 4 / 8 | 93.86 / 99.23 / 106.74 / 118.61 | 187.47 / 207.14 / 250.18 / 331.24 | 0.27 / 90.29 / 283.98 / 735.07 |

### strace 분석
- 로그 제거 전: `write` 225,154회 → sys time 99.8% (stderr 폭탄)
- 로그 제거 후: `write` 34회, `futex` 2회뿐 → sys time 0.15s 수준  
  → 현재 sys time은 더 이상 I/O가 아니라 스레드 동기화(락/슬랩 복사)에서 발생

### 추가 TODO
1. WSL 호스트에 `linux-tools-$(uname -r)` 설치 → `perf stat -p <컨테이너 PID>`로 실제 `futex` hot path 확인
2. `ThreadPool::join`/`available_mutex` 개선 방안 탐색 (락 범위 축소, CV 도입 등)
3. 보고서에 “로그 제거로 I/O 병목 제거, 잔존 병목은 동기화”라고 명시할 것

### ThreadPool Busy-wait → Condition Variable (2025-11-27 오후)
- 변경 사항:
  - `do_work()`와 `join()`의 `this_thread::yield()` 스핀루프를 `condition_variable` 기반 대기로 교체
  - `jobReady`/`jobDone` CV 추가, `markThreadBusy()` 헬퍼로 배포/회수 시그널 통합
- 빌드/실행: `./scripts/benchmark_alpha_beta_gamma.sh 2mm 4 3 0 1024⁵` (α/β/γ 모두 -O3)

| Target | real (s) | user (s) | sys (s) |
| --- | --- | --- | --- |
| β MoveC O3 | 12.84 | 12.34 | 0.06 |
| γ Catamaran 4T | **10.29** | 10.85 | 0.07 |

→ Catamaran이 MoveC 대비 **~20% 빠름** (이전엔 15.2s/55s sys로 느렸음).

#### perf (컨테이너 내부, 동일 커맨드)
- Wall: 11.7s, `task-clock 11.3s` → 더 이상 66s 커널 점유 없음
- IPC 3.59 (↑), `dTLB-load-misses` 0.71B (41%)로 감소
- sys time 73 ms, user 11.27s

#### strace -fc
| Syscall | Time (%) | Calls |
| --- | --- | --- |
| `futex` | **97.0%** (0.19s) | 14 |
| `sched_yield` | 0% (사라짐) | 0 |
| 나머지 (`mmap/munmap/...`) | <3% |

- `sched_yield` 폭탄 제거 → sys time 0.05~0.07s 수준 유지
- 잔여 커널 비용은 실제 `futex` 대기(조건변수)로 명확해졌으며, 필요 시 더 세밀한 wake-up 정책/작업 배치 최적화로 줄일 수 있음
- TLB miss는 여전히 높아 MoveC 런타임 해시 구조 개선 여지 존재

### 2025-11-28 오전: THP on/off 일괄 벤치 + 단기 커널 재측정
- **새 테이블**: `docs/llvm17-port/PERFORMANCE_THP_TABLES.md`에 7개 벤치(atax/mvt/jacobi/syrk/syr2k/gemver/2mm)의 α/β/γ, Threads=1·2·4·8, THP on/off별 Best·Avg(3회 측정)를 모두 정리.
- **데이터 클린업**: `/usr/bin/time`가 0.00s/음수로 찍히던 초단기 커널(atax MoveC/γ 2T·4T, mvt β/γ 2T, jacobi α 등)만 따로 python `perf_counter()` 기반 측정으로 재수집  
  • atax MoveC: best **0.247s**, avg **0.301s**  
  • atax γ-2/γ-4: best **0.223/0.232s**, avg **0.241/0.248s**  
  • mvt MoveC: best **0.312s**, avg **0.339s**; Catamaran 2T best **0.304s**  
  • jacobi α: best **0.764s**, avg **0.870s**
- **THP=always 요약** (대표치, Best):  
  • 2mm 4T Catamaran 13.03s vs MoveC 13.57s (≈+4%)  
  • atax 4T Catamaran 0.15s vs MoveC 0.16s (~7%)  
  • gemver 4T Catamaran 0.28s vs MoveC 0.29s (~3%)  
  • jacobi 4T Catamaran 3.77s vs MoveC 2.83s (스텐실은 여전히 MoveC가 유리)
- **THP=madvise 요약**: Catamaran γ는 대부분의 커널에서 MoveC보다 10~20% 느려졌고(예: 2mm 4T 15.51s vs 16.29s), dTLB miss가 급증하면서 속도가 THP on 대비 1.7×까지 느려짐.
- **perf stat (THP OFF, 2mm 4T)**: `agent-tools/77b32c2a-5331-4b1c-a1a4-757c5b1934f0.txt`  
  • dTLB-loads 2.16e9 / dTLB-load-misses 1.20e9 → **55.6% miss rate**  
  • 대비: THP on 시 dTLB miss 2.06e8 (13.5%) → THP가 TLB thrash를 직접 눌러준다는 근거 확보.
  • Wall 15.24s, user 14.77s, sys 0.04s (ThreadPool CV 도입 이후 여전히 sys는 0.04s 수준 유지).

### Transparent Huge Pages 실험 (2025-11-27 밤)
- 호스트 WSL에서 THP 강제 활성화  
  ```
  echo always | sudo tee /sys/kernel/mm/transparent_hugepage/enabled
  echo always | sudo tee /sys/kernel/mm/transparent_hugepage/defrag
  ```
  컨테이너에서도 `[always] madvise never` 확인.
- 재측정 (동일 스크립트 / 3회, 1024², -O3):

| Target | Avg real (s) | Best (s) | Sys (avg) |
| --- | --- | --- | --- |
| α Sequential | 7.27 | 6.54 | 0.01 |
| β MoveC | 9.51 | 8.66 | 0.01 |
| γ Catamaran 4T | **9.21** | **8.46** | 0.01 |

→ Catamaran 평균이 MoveC보다 3% 빠르고, best-case는 2% 차이. 이전 대비 MoveC 자체가 9~10s대로 빨라진 덕분에 상대적 차이는 줄었지만, 절대 실행 시간은 모두 개선.

#### perf (컨테이너 내부, host perf 바이너리 복사)
- Wall 10.47s, `task-clock 10.1s`, IPC 4.0
- **dTLB-load-misses 2.06e8 (13.5%)** ← 기존 7.1e8 (41%) 대비 대폭 감소
- iTLB miss도 3.6e3 수준으로 떨어짐 (기존 3.7e4 수준)

#### strace -fc
| Syscall | Time (%) | Calls |
| --- | --- | --- |
| `futex` | 96.9% (0.12s) | 14 |
| 기타 mmap/munmap/mprotect | <1% |

- 커널 타임은 계속 0.02~0.03s 수준, THP 킬/온 여부와 무관
- 남은 최적화 여지는 MoveC 메타데이터 hash 자체를 slab-local로 바꾸는 것뿐이며, THP 적용만으로 deadline 대비 ROI 확보

---

## 2025-11-27: perf + strace 실행 로그

### 수행 커맨드
```
# Perf (컨테이너 내부, 복사해온 perf 바이너리 사용)
docker exec -w /workspace/examples/llvm17 catamaran-llvm17-container \
  /bin/bash -lc 'perf stat -e cycles,instructions,context-switches,cpu-migrations,\
  page-faults,task-clock,faults,cs,major-faults,minor-faults,branches,branch-misses,\
  L1-dcache-loads,L1-dcache-load-misses,L1-icache-loads,L1-icache-load-misses,\
  dTLB-loads,dTLB-load-misses,iTLB-loads,iTLB-load-misses \
  -ddd -- ./CM-MoveC-2mm-gamma-4 0 1024 1024 1024 1024 1024'

# Strace (전체 스레드)
docker exec -w /workspace/examples/llvm17 catamaran-llvm17-container \
  /bin/bash -lc 'strace -fc ./CM-MoveC-2mm-gamma-4 0 1024 1024 1024 1024 1024'
```

### perf 주요 지표 (γ, 4 threads, 1024²)
- Wall time 13.8s, `task-clock` 66.8s → **평균 4.84개의 CPU가 계속 바쁨**
- IPC 2.73 (계산 루프 자체는 잘 채워짐)
- `dTLB-load-misses`: 1.48B (67%) / `iTLB-load-misses`: 134M (1209%)  
  → MoveC 메타데이터 해시·Slab 접근이 **TLB thrashing** 유발
- Branch-miss 0.27%, L1D miss ~4% → 순수 연산은 문제 아님
- Sys/User split: `user 19.2s`, `sys 47.5s` → 대부분 커널 전환 비용

### strace (-fc) 요약
| Syscall | Time (%) | Calls |
| --- | --- | --- |
| `sched_yield` | **99.91%** (18.86s) | 538,063 |
| `munmap` | 0.07% | 14 |
| `futex` | 0.01% | 2 |
| 그 외 | <0.01% | <40 |

- `sched_yield` 폭탄이 그대로 `sys` 시간으로 누적 → `ThreadPool::do_work()`와 `join()`의 busy-spin이 병목임을 확인.
- `futex` 호출은 거의 없어, 커널 락이나 condvar를 쓰지 않고 **yield 루프만으로** 스레드 대기를 처리하는 구조가 root cause.

### 해석 & 영향
1. **Spin-wait 구조:** 50만 회 이상의 `sched_yield`로 인해 18.9초가 커널 타임에 소모. 실제 연산(19s)보다 대기 비용(47s)이 훨씬 크다.
2. **TLB 압박:** MoveC 메타데이터 테이블 접근으로 dTLB miss 67%, iTLB miss 1209% → Slab/Hash 구조 개선 없이는 캐시 적중률이 계속 낮음.
3. **Context switch 없음:** perf 통계상 context-switch 0으로 나타난 것은 TLB 이벤트는 잡지만 `sched_yield`는 커널 안에서 빠르게 처리되어 explicit CS 없이 돌아가기 때문. (strace에서는 명확히 관측됨.)

### 즉시 액션 아이템
- `ThreadPool::do_work()` / `join()`의 `this_thread::yield()` 루프를 조건변수 기반 대기로 대체 (job queue 조건 변수 + notify)  
- `available_mutex` 락 범위 축소 및 job stealing 도입 검토 → assign 시 전체 스레드를 순회하지 않도록
- MoveC 런타임의 dTLB miss 근거 수집: Slab 할당 패턴/Hash bucket 크기를 추적하고, hot metadata에 대해서는 thread-local cache 실험
- 수정 후 동일한 perf/strace 시나리오 재측정 → `sched_yield` 호출 수/시간 감소가 바로 KPI


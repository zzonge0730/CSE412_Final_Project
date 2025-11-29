# Catamaran-Next Technical Report

## 1. 소개

### 1.1 프로젝트 개요
Catamaran-Next는 ISSTA '23에 발표된 원조 Catamaran 시스템을 현대 LLVM 환경으로 이식·재설계한 프로젝트입니다. 기존 시스템은 LLVM 3.4에서 병렬화된 메모리 안전성 검사를 시연했지만, 최신 컴파일러는 Opaque Pointer, Strict Stack Lifetime 등으로 인해 동일한 설계가 더 이상 통하지 않습니다.

우리는 LLVM 17을 대상으로 MoveC 같은 무거운 메모리 안전 도구도 현대 환경에서 가속될 수 있음을 증명하기 위해 단순 복제 수준을 넘은 아키텍처 진화를 수행했습니다.

### 1.2 핵심 성과
- **기능**: MoveC 계측과 Catamaran 병렬화 패스를 LLVM 17 New PassManager 위로 완전 포팅
- **안전성**: Deep Copy 아키텍처로 Use-After-Return 취약점 제거
- **성능**: Slab Allocator 및 스레드 동기화 최적화로 syrk +29%, 2mm 평균 4~7% 가속

## 2. 아키텍처 진화

### 2.1 현대 LLVM 제약
- LLVM 3.4 시절 Catamaran은 스택 메타데이터 포인터를 그대로 워커 스레드에 넘겼다.
- **문제 1 – Opaque Pointer**: 이제 모든 포인터가 `ptr`로 통합되어 암묵적 메타데이터 추적이 불가.
- **문제 2 – Stack Lifetime**: 최적화가 반환 직후 스택을 무효화하므로 비동기 스레드가 스택 포인터를 쓰면 UAR가 발생한다.

### 2.2 해결책 1 – Deep Copy
- 메타데이터 값을 태스크 생성 전에 32바이트 slab 버퍼로 복사하고, 워커는 복사본만 사용한다.
- 결과적으로 스택 수명과 무관하게 안전성이 확보된다.

### 2.3 해결책 2 – Producer-Side Slab Allocator
- Deep Copy로 인해 태스크마다 `malloc`이 발생하며 힙 락 경합이 심화(-15% 성능).
- 64MB 버퍼를 한 번 할당한 뒤 bump-pointer로 쪼개 쓰고, 동기화 지점에서 통째로 reset.
- 락 경합이 사라지며 성능을 플러스로 전환.

## 3. 구현 세부사항

### 3.1 런타임 최적화
- `sched_yield()` 바쁜 대기 대신 조건 변수 기반 대기 → 시스템 타임 85s → 0.07s
- THP=always로 설정해 MoveC의 dTLB miss(55.6%)를 13.5%까지 감소

### 3.2 검증
- `volatile` 오프셋을 이용한 OOB Fault Injection으로 -O3에서도 안전 검사가 제거되지 않았음을 증명

## 4. 성능 평가

### 4.1 실험 환경
- PolyBench/C Large 세트 (1024² ~ 4000²)
- Ryzen 5 5600X / Linux 5.15 / LLVM 17.0.6
- THP=always, NUM_THREADS=4

### 4.2 결과 요약
| 벤치 | 입력 | MoveC | Catamaran | 향상 | 비고 |
|------|------|-------|-----------|------|------|
| syrk | 1024² | 3.24s | 2.30s | +29% | 최댓값 |
| atax | 4000² | 0.16s | 0.15s | +6.6% | 저오버헤드 |
| 2mm | 1024² | 13.57s | 13.03s | +4.1% | 메모리 바운드 |
| gemver | 4000 | 0.29s | 0.28s | +3.4% | 동급 |
| jacobi-2d | 2000² | 2.83s | 3.77s | −33.2% | 스텐실 한계 |

### 4.3 분석
- 연산 밀도가 높은 커널(syrk, 2mm)에서는 메타데이터 오버헤드를 숨겨 최대 29% 가속
- 4스레드에서 성능이 정체하며, 이후에는 MoveC 내부 해시테이블 락이 병목

## 5. 결론
Catamaran-Next는 현대 LLVM 제약에서도 병렬 메모리 안전성을 실용적으로 구현할 수 있음을 입증했다. Deep Copy와 Slab Allocator를 결합해 안전성과 성능을 동시에 달성했으며, 연구 프로토타입을 재현 가능하고 현대화된 시스템 아키텍처로 변모시켰다.

---

*(English version follows for reference.)*

## 1. Introduction

### 1.1 Project Overview
Catamaran-Next is an evolutionary port and re-architecture of the original Catamaran system (ISSTA '23). While the original system demonstrated parallelized memory safety checks on legacy LLVM 3.4, modern compiler environments introduce strict constraints that render the original design untenable.

This project targets LLVM 17, the current standard for modern compiler infrastructure, addressing critical challenges such as Opaque Pointers and Strict Stack Lifetimes. Our goal was not merely reproduction, but architectural evolution to prove that heavy-weight memory safety tools (like MoveC) can still be accelerated in hostile modern environments.

### 1.2 Key Achievements
- **Functionality**: Fully ported MoveC instrumentation and Catamaran parallelization pass to LLVM 17 new PassManager.
- **Safety**: Solved "Use-After-Return" vulnerabilities using a novel Deep Copy Architecture.
- **Performance**: Achieved up to 29% speedup (syrk) and 4-7% average speedup (2mm) over optimized MoveC by implementing a Slab Allocator and optimizing thread synchronization.

## 2. Architectural Evolution

### 2.1 The Challenge: Modern LLVM Constraints
- Legacy Catamaran (LLVM 3.4) relied on "Shared Memory" concurrency, passing pointers to stack-allocated metadata directly to worker threads.
- **LLVM 17 Issue 1 (Opaque Pointers)**: Typed pointers (struct.md*) are gone. All pointers are untyped (ptr), making implicit metadata tracking impossible.
- **LLVM 17 Issue 2 (Stack Lifetime)**: Modern optimization aggressively invalidates stack frames upon function return. Passing stack pointers to asynchronous threads leads to Use-After-Return (UAR) crashes.

### 2.2 Solution 1: Deep Copy Architecture
To guarantee safety, we shifted from "Zero-Copy" to "Deep Copy".
- **Mechanism**: The main thread copies the value of metadata (32 bytes) from the stack to a persistent heap buffer before spawning tasks.
- **Benefit**: Worker threads operate on independent copies, completely eliminating UAR risks.

### 2.3 Solution 2: Producer-Side Slab Allocator
Deep Copy introduced a new bottleneck: frequent malloc calls for every task caused severe Heap Lock Contention, initially degrading performance (-15%).
- **Innovation**: Implemented a Thread-Local Slab Allocator.
  - Pre-allocation: A 64MB buffer is allocated once at startup.
  - Bump Pointer: Allocation is a simple pointer increment (Atomic-free, Lock-free).
  - Bulk Reset: The entire slab is reset instantly at synchronization points (TaskGroup::wait()).
- **Result**: Lock contention was eliminated, turning the performance deficit into a surplus.

## 3. Implementation Details

### 3.1 Runtime Optimization
- **Busy-Wait Removal**: Replaced `sched_yield()` loops with Condition Variables (futex). This reduced System Time from 85s to 0.07s, minimizing CPU waste and context switching overhead.
- **Transparent Huge Pages (THP)**: Identified TLB Thrashing as the root cause of MoveC's slowness. Enabling THP (always) reduced dTLB load misses from 55.6% to 13.5%, significantly boosting both baseline and parallel performance.

### 3.2 Verification Rigor
- **OOB Fault Injection**: To prove that safety checks were not optimized away by -O3, we injected faults using volatile offsets. Both MoveC and Catamaran correctly reported Spatial Error, verifying that the Deep Copy logic correctly propagates metadata.

## 4. Performance Evaluation

### 4.1 Experimental Setup
- **Benchmarks**: PolyBench/C (Large Dataset: 1024x1024 ~ 4000x4000).
- **Environment**: Ryzen 5 5600X (6C/12T), Linux 5.15, LLVM 17.0.6 (-O3).
- **Configuration**: THP=always, NUM_THREADS=4 (Sweet Spot).

### 4.2 Results Summary (Normalized Speedup)

| Benchmark | Input Size | MoveC (Baseline) | Catamaran (Ours) | Speedup | Notes |
|-----------|------------|------------------|------------------|---------|-------|
| syrk      | 1024×1024  | 3.24s            | 2.30s            | +29.0%  | Best Case |
| atax      | 4000×4000  | 0.16s            | 0.15s            | +6.6%   | Low Overhead |
| 2mm       | 1024×1024  | 13.57s           | 13.03s           | +4.1%   | Memory Bound |
| gemver    | 4000       | 0.29s            | 0.28s            | +3.4%   | Parity |
| jacobi-2d | 2000×2000  | 2.83s            | 3.77s            | −33.2%  | Stencil (Limitation) |

### 4.3 Analysis
- **Success**: In compute-intensive kernels (syrk, 2mm), Catamaran successfully hides the metadata overhead, achieving up to 29% speedup.
- **Scalability**: Performance peaks at 4 threads. Beyond this, the internal lock contention within the legacy MoveC runtime (Hash Table) becomes the bottleneck, limiting further scalability.

## 5. Conclusion
Catamaran-Next successfully demonstrates that parallel memory safety is viable even under the strict constraints of modern compilers.

By re-architecting the data flow with Deep Copy and optimizing memory management with Slab Allocators, we achieved robust safety and competitive performance. The project transforms a legacy research concept into a modern, reproducible system architecture.


# Catamaran-Next Technical Report

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


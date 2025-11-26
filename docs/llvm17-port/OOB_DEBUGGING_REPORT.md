# OOB Verification Report

**Date:** 2025-11-25
**Target:** `examples/llvm17/MoveC-2mm-oob.c` (Sequential Baseline)
**Status:** **SUCCESS** (Verified with -O3)

## 1. Objective
To verify that the sequential MoveC baseline correctly detects a deliberately injected Out-of-Bounds (OOB) access, **even under aggressive compiler optimizations (-O3)**.

## 2. Methodology: The "Volatile Offset" Trick
Simply injecting `k + 99999999` allowed Clang/LLVM's optimizer to identify the access as Undefined Behavior (UB) at compile-time and eliminate the code path (Dead Code Elimination).

To force the compiler to generate the check logic, we must hide the OOB nature of the access until runtime.

### Modified Injection Code
```c
// examples/llvm17/MoveC-2mm-oob.c
{
    volatile int bad_offset = 99999999; // Hidden from compile-time constant folding
    // Access using the volatile variable
    double oob_val = tmp[__RV_check_...][__RV_check_...(..., k + bad_offset, ...)];
    oob_guard += oob_val; // Force usage of result
}
```

### Instrumentation
- **Optimization Level**: `-O3` (Production Standard)
- **Runtime**: `_RV_memsafe.c` (Standard MoveC Runtime)

## 3. Findings

### Success with -O3
With the `volatile` offset, the `-O3` optimized binary correctly executed the check and reported the error.

```
[DEBUG] Program started
...
[DEBUG] Second loop about to start
...
--- BEFORE OOB ACCESS i=0, j=0 ---
[DEBUG OOB DETECTED] tmp[i][k+bad_offset]: Ptr: 0x5fda98dd6b58, Base: 0x5fda692e6360, Bound: 0x5fda692ee360, Stat: 4, Size: 8
examples/2mm.c: In function 'kernel_2mm':
examples/2mm.c:89:27: error: dereferenced pointer 'tmp[i][k+bad_offset]' (val = 0x5fda98dd6b58, size = 8) is out of the block [0x5fda692e6360, 0x5fda692ee360). [spatial error]
```

## 4. Conclusion
We have established a **robust, optimization-resistant baseline**. MoveC's spatial safety logic is sound and active. We can now fairly compare Catamaran's spatial safety capabilities against this baseline using the same `-O3` optimization level.

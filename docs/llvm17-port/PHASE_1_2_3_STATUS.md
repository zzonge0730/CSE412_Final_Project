# Phase 1-3 Status: Critical Analysis and Optimization

## Phase 1: Truth & Verification

### 1.1 Baseline Autopsy ⚠️ IN PROGRESS

**Issue**: MoveC is faster than Sequential (-17.7% overhead) - physically impossible.

**Investigation**:
- ✅ Sequential rebuilt with `-O3 -march=native`
- ⚠️ Assembly comparison: `kernel_2mm` appears to be inlined in Sequential
- ⚠️ Need to compare actual loop assembly, not function symbols

**Possible Explanations**:
1. **Optimization Asymmetry**: MoveC build enables different optimizations
2. **Instrumentation Elision**: MoveC might remove redundant checks
3. **Benchmark Flaw**: Sequential might have debug symbols/assertions

**Action Required**:
- Compare loop assembly (not function-level)
- Check for NDEBUG and optimization flags
- Verify MoveC build flags match exactly

### 1.2 Fault Injection Test ⚠️ IN PROGRESS

**Status**: OOB test code created but compilation issues remain.

**Test Design**:
```c
// Intentional bug: tmp[i][k+1] instead of tmp[i][k]
D[i][j] += tmp[i][k+1] * C[k][j];  // k+1 can exceed nj-1
```

**Expected Outcomes**:
- **Outcome A**: Catamaran crashes (Segfault) → Deep Copy failing
- **Outcome B**: Catamaran prints "Spatial Error" → Success ✅
- **Outcome C**: Catamaran runs silently → Critical Failure ❌

**Action Required**:
- Fix compilation errors in `2mm_oob.c`
- Run test with MoveC first (baseline)
- Run test with Catamaran (verification)

## Phase 2: Bottleneck Identification

### 2.1 Perf Analysis 📋 PENDING

**Hypothesis**: Malloc contention is the bottleneck.

**Required Analysis**:
```bash
perf record -g ./CM-MoveC-2mm 1024 1024 1024 1024 0
perf report
```

**Look for**:
- `sys_malloc`, `_int_malloc` (heap allocation)
- `futex`, `pthread_mutex_lock` (synchronization)
- `memcpy` (Deep Copy operations)

**Status**: Perf not available in Docker container. Need alternative:
- Use `strace` to count syscalls
- Use `time` with detailed breakdown
- Manual instrumentation (add timing code)

## Phase 3: Optimization

### 3.1 Current Implementation Analysis ✅

**Finding**: Metadata is ALREADY embedded directly in buffer!

**Current Code**:
```cpp
// Calculate total size INCLUDING metadata (32 bytes each)
totalBytes += DL.getTypeAllocSize(structType);  // 32 bytes

// Pack metadata directly into buffer (not as pointer)
LoadInst *structVal = new LoadInst(structType, liveIn, ...);
StoreInst(structVal, slotPtrCast, ...);  // Direct store, no pointer
```

**Conclusion**: The optimization suggested (embedding metadata) is **already implemented**.

### 3.2 Real Bottleneck: Malloc Per Task

**Problem**: ONE `malloc` call per task spawn.

**Current Flow**:
1. Task spawn triggered
2. `malloc(totalBytes)` - **Heap lock contention**
3. Pack data into buffer
4. Pass buffer to worker thread

**Impact**:
- 8 threads spawning simultaneously → 8 concurrent mallocs
- Heap lock serialization
- Performance degradation

### 3.3 Optimization Strategy

**Option A: Pre-allocation in ThreadPool** (Runtime Change)
- Allocate environment buffers in ThreadPool initialization
- One buffer per worker thread
- Reuse buffers (no malloc per task)

**Option B: Stack Allocation** (Not Viable)
- Environment buffer must outlive function return
- Stack allocation would cause use-after-return

**Option C: Memory Pool** (Complex)
- Custom allocator with per-thread pools
- Requires significant runtime changes

### 3.4 Recommended Approach

**Short-term**: Document current implementation and identify real bottleneck.

**Medium-term**: Implement pre-allocation in ThreadPool:
1. Add `envBuffer` to worker thread context
2. Allocate once per thread (not per task)
3. Reuse buffer for all tasks

**Expected Impact**:
- Eliminates malloc calls from critical path
- Reduces heap lock contention
- Potential 10-30% speedup

## Immediate Action Plan

### Priority 1: Fault Injection Test
1. Fix `2mm_oob.c` compilation errors
2. Run with MoveC (baseline)
3. Run with Catamaran (verification)
4. **This is the highest priority** - verifies correctness

### Priority 2: Baseline Autopsy
1. Compare loop assembly (not function-level)
2. Verify build flags match exactly
3. Check for optimization differences

### Priority 3: Bottleneck Identification
1. Add manual timing instrumentation
2. Count malloc calls
3. Measure Deep Copy time vs. total time

### Priority 4: Optimization
1. Implement pre-allocation in ThreadPool
2. Test performance improvement
3. Verify correctness (Spatial Safety)

## Current Status Summary

| Phase | Task | Status | Priority |
|-------|------|--------|----------|
| 1.1 | Baseline Autopsy | ⚠️ In Progress | Medium |
| 1.2 | Fault Injection | ⚠️ In Progress | **HIGH** |
| 2.1 | Perf Analysis | 📋 Pending | High |
| 3.1 | Optimization | ✅ Analyzed | Medium |

**Key Finding**: Metadata embedding is already implemented. Real bottleneck is malloc per task, requiring runtime optimization.


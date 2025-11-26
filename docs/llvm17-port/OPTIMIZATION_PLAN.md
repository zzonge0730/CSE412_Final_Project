# Deep Copy Optimization Plan: Eliminate Malloc

## Current Implementation

**Problem**: Deep Copy uses `malloc` for each task, causing:
- Heap lock contention in multi-threaded environment
- Memory allocation overhead
- Potential performance bottleneck

**Current Code** (DOALLTask.cpp:352-399):
```cpp
// Use malloc instead of alloca to prevent use-after-return in async tasks
FunctionCallee mallocFunc = this->M->getOrInsertFunction("malloc", ...);
CallInst *envMalloc = CallInst::Create(mallocFunc, {sizeVal}, ...);

// Pack metadata structs with deep copy
for (auto &pair : metadataLiveIns) {
    // Load struct from stack alloca
    LoadInst *structVal = new LoadInst(structType, liveIn, ...);
    
    // Store into malloc'd buffer
    new StoreInst(structVal, slotPtrCast, ...);
    currentOffset += DL.getTypeAllocSize(structType);  // 32 bytes
}
```

## Proposed Optimization

### Strategy: Embed Metadata in Environment Struct

Instead of:
```
struct Env {
    void* meta_ptr;  // Points to malloc'd 32-byte buffer
};
```

Use:
```
struct Env {
    char meta_buffer[32];  // Direct embedding, no malloc
};
```

### Implementation Steps

1. **Calculate total size with embedded metadata**:
   - Regular pointers: 8 bytes each
   - Metadata structs: 32 bytes each (embedded, not pointer)

2. **Pack metadata directly**:
   - No malloc needed
   - Direct memcpy into environment buffer
   - Eliminates heap lock contention

3. **Unpack in spawned function**:
   - Load directly from environment buffer offset
   - No change needed (already loading from buffer)

### Expected Impact

- **Eliminates malloc calls**: No heap allocation per task
- **Reduces lock contention**: No heap locks
- **Improves cache locality**: Metadata in same buffer as other data
- **Potential speedup**: 10-30% based on malloc overhead elimination

## Code Changes Required

### File: DOALLTask.cpp

**Location 1: genSpawnArgs (Pack)**
- Change: Calculate `totalBytes` including embedded metadata size (32 bytes each)
- Change: Store metadata directly into buffer (no malloc for metadata)

**Location 2: Spawned function unpacking**
- No change needed: Already loads from buffer offset

## Testing Plan

1. **Build optimized version**
2. **Test 1024×1024 input**
3. **Compare performance**:
   - Before: 9.780s (with malloc)
   - After: Target < 8.474s (faster than MoveC)

## Risk Assessment

**Low Risk**: 
- Metadata is immutable during loop execution
- Embedding doesn't change semantics
- Only affects allocation mechanism

**Verification**:
- Spatial Safety: Should remain 0 errors
- Correctness: Results should match previous version


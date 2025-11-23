# Catamaran LLVM 17 Porting Status

## Status: Passes Build; Runtime Validation In Progress

Catamaran’s LLVM 17 pass compiles cleanly (New PassManager + opaque pointers) and emits IR for both loop and loop-free tasks. Runtime validation is partially complete: baseline and MoveC β executions succeeded, but the MoveC γ binary still exits immediately and ASAN tests have not yet been re-run on LLVM 17.

### Key Achievements
- Core passes (`Loops.cpp`, `DOALLTask.cpp`, `LoopFreeTask.cpp`) use LLVM 17 APIs end to end.
- DOALL and Loop-Free tasks now pack their live-in arguments into a single environment pointer, which keeps `spawn()` calls within the ThreadPool ABI limits.
- `opt` runs cleanly with verification enabled; no manual module dump is required anymore.
- ThreadPool runtime operates unchanged; only the call interface from the generated wrappers was updated.

### MoveC / ASAN Status
- **MoveC α/β**: `2mm` baseline (`clang -O3`) runs in `real 0.71s`; MoveC-instrumented binary runs in `real 25.34s` on `1000 1000 1000 1000 0`. MoveC runtime warnings persist but match the original tool.
- **MoveC γ**: `opt -passes=Loops` and the subsequent `clang++` link both succeed (`CM-MoveC-2mm.bc`/`CM-MoveC-2mm`). Running the binary inside Docker terminates immediately (no stdout/stderr, exit due to host-side stop). Additional debugging (smaller inputs, `dmesg`, ThreadPool logs) is pending.
- **ASAN**: Loop-free detection is implemented, but no LLVM 17 ASAN run has been executed yet. DOALL for ASAN remains disabled until the type-mismatch fixes land.

### Recent Test Runs (LLVM 17, Docker `catamaran:llvm17`)
| Variant | Command (summary) | Result |
| --- | --- | --- |
| Baseline α | `clang -O3 examples/2mm.c -o 2mm && ./2mm 1000 1000 1000 1000 0` | `real 0.71s`, completed |
| MoveC β | `clang -O3 examples/llvm17/MoveC-2mm.c -o MoveC-2mm && ./MoveC-2mm ...` | `real 25.34s`, MoveC warnings only |
| MoveC γ | `opt -passes=Loops MoveC-2mm.ll → CM-MoveC-2mm.bc`, `clang++ ... -o CM-MoveC-2mm`, `./CM-MoveC-2mm ...` | Build OK, runtime exits immediately (needs investigation) |
| ASAN β/γ | — | Not run yet (LLVM 3.5.2 toolchain hookup pending) |

### Known Issues
- **MoveC runtime errors**: The MoveC reference binary raises spatial warnings regardless of input size. Treat timing numbers as reference data until upstream fixes land.
- **MoveC γ execution**: Binary currently terminates immediately (no output). Potential causes include MoveC runtime aborting before prints or host-side OOM killer. Capture logs/`dmesg` on next run.
- **Host execution**: Only Docker-contained runs are validated. Host execution may fail because glibc/LLVM paths differ.
- **ASAN DOALL path**: Type mismatches occur when enabling DOALL for ASAN-instrumented loops. Loop-free tasks build, but loop tasks remain disabled. Full LLVM 17 ASAN tests have yet to run.

### Next Steps
- Capture the exact reason why `CM-MoveC-2mm` exits (smaller inputs, `strace`, kernel logs) and, if needed, bisect MoveC’s runtime helpers.
- Bring up the LLVM 3.5.2 ASAN toolchain inside the LLVM 17 container and re-run the β/γ pipeline.
- Once the above complete, add regression scripts for multiple PolyBench kernels and thread counts.

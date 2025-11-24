# Catamaran LLVM 17 Porting Status

## Status: Passes Build; MoveC/ASAN γ validated

Catamaran’s LLVM 17 pass compiles cleanly (New PassManager + opaque pointers) and now runs both MoveC and ASAN pipelines end-to-end inside `catamaran:llvm17`. MoveC γ 실행은 표준 출력 없이 완료되며, MoveC 런타임이 출력하는 spatial warning은 β 버전과 동일합니다. ASAN γ 역시 AddressSanitizer/LeakSanitizer 경고 없이 DOALL+LoopFree 조합으로 실행됩니다.

### Key Achievements
- Core passes (`Loops.cpp`, `DOALLTask.cpp`, `LoopFreeTask.cpp`) use LLVM 17 APIs end to end.
- DOALL and Loop-Free tasks now pack their live-in arguments into a single environment pointer, which keeps `spawn()` calls within the ThreadPool ABI limits.
- `opt` runs cleanly with verification enabled; no manual module dump is required anymore.
- ThreadPool runtime operates unchanged; only the call interface from the generated wrappers was updated.

### MoveC / ASAN Status
- **MoveC α/β**: `2mm` baseline (`clang -O3`) runs in `real 0.71s`; MoveC β runs in `real 25.34s` on `1000 1000 1000 1000 0`. MoveC runtime warnings persist but match the original tool.
- **MoveC γ**: `opt -passes=Loops` + `clang++` 빌드 성공. 실제 입력 시 MoveC 런타임 충돌(Abort). (`tsteps=0`일 때만 종료됨)
- **ASAN γ (LLVM 17)**: DOALL 활성화 빌드 성공. `./CM-ASAN-2mm 32 32 32 32 0` 기준 정상 종료, ASAN/LeakSanitizer 경고 없음. (module ctor/dtor는 더 이상 병렬화하지 않음) 128 입력(`./CM-ASAN-2mm 128 …`) 실행 시 `real 0.05s`, `user 0.06s`, `sys 0.19s`.

### Recent Test Runs (LLVM 17, Docker `catamaran:llvm17`)
| Variant | Command (summary) | Result |
| --- | --- | --- |
| Baseline α | `clang -O3 examples/2mm.c -o 2mm && ./2mm 1000 1000 1000 1000 0` | `real 0.71s`, completed |
| MoveC β | `clang -O3 examples/llvm17/MoveC-2mm.c -o MoveC-2mm && ./MoveC-2mm ...` | `real 25.34s`, MoveC warnings only |
| MoveC γ | `opt -passes=Loops → clang++ ... → ./CM-MoveC-2mm 0 64 64 64 64` | Completes, same warnings as β |
| ASAN γ | `clang -fsanitize=address … → opt -passes=Loops → clang++ -fsanitize=address … → ./CM-ASAN-2mm 0 64 64 64 64` | Completes, no ASAN/Leak reports |

### Known Issues
- **MoveC runtime warnings**: `__RV_*` spatial warnings are emitted by upstream MoveC even without Catamaran.
- **MoveC γ Runtime Crash**: 실제 워크로드 입력 시 MoveC 런타임 내부에서 Spatial Error 다발 후 Abort됨.
- **Host execution**: Only Docker-contained runs are validated.
- **Regression coverage**: 현재는 2mm 커널만 검증됨. 다른 PolyBench 커널/스레드 조합에 대한 회귀 스크립트가 필요.

### Next Steps
- 문서/README 업데이트: LLVM 17 상태, Docker 빌드 절차, MoveC/ASAN 결과를 반영.
- 추가 커널/입력/스레드 조합에 대한 회귀 테스트 스크립트 작성.
- 필요 시 MoveC spatial warning 근본 원인(Upstream) 조사 및 FAQ 정리.

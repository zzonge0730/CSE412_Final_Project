# Catamaran LLVM17 Evolution Notes

이 문서는 **원본 Catamaran artifact**(LLVM 17 포팅 직후 상태)와 **현재 우리 프로젝트**가 어떻게 다른지, 어떤 최적화/운영 절차가 추가되었는지를 한눈에 볼 수 있도록 정리한 요약본입니다. 보고서/재현 가이드를 작성할 때 아래 섹션만 참조해도 전체 변화 폭을 설명할 수 있습니다.

## 1. 빌드 & 런타임 파이프라인 변경

| 영역 | 기존 Catamaran | 현재 프로젝트 |
|------|----------------|----------------|
| LLVM 빌드 트리 | `catamaran-llvm-17` (vanilla) | 현재는 `Catamaran-Next`로 리네임, 동일 소스 기반이지만 아래 런타임/스크립트 커스터마이징 포함. |
| 벤치 드라이버 | 수동 명령 위주 | `scripts/benchmark_alpha_beta_gamma.sh`로 α/β/γ(-O3) 일괄 빌드+3회 반복 측정, best/avg 자동 산출. |
| 결과 집계 | ad-hoc log | `docs/llvm17-port/PERFORMANCE_THP_TABLES.md`, `PERF_ANALYSIS_SUMMARY.md`에 THP on/off, thread sweep, perf/strace까지 정리. |
| 짧은 벤치 타이밍 | `/usr/bin/time` 단일 실행 | `python3 perf_counter()` 루프(10회)로 초단기 런 안정화, 음수/0초 데이터 제거. |

## 2. MoveC 런타임 / 안전 검사 관련 수정

1. `_RV_memsafe.c`에 두 개의 토글 매크로 추가  
   - `RV_ENABLE_OOB_DEBUG`, `RV_ENABLE_ERROR_REPORT`를 0으로 두어 로그 폭탄 억제.  
   - `fprintf(stderr, …)`를 매크로로 감싸고 파일 끝에서 `#undef` 처리 → 체크 로직은 유지하되 출력만 제거.
2. PolyBench 소스들의 `POLYBENCH_ARRAY_DECL`을 `malloc/free` 기반으로 대체(atax/mvt/jacobi/syrk/syr2k/gemver 등)  
   - MoveC가 `polybench_alloc_data` VLA를 오Instrument하지 못하던 문제 해결.  
   - `argc/argv` 파라미터를 노출해 입력 크기를 스크립트에서 제어 가능.

## 3. ThreadPool 및 실행 런타임 개선

| 변경 항목 | 설명 | 파일 |
|-----------|------|------|
| Busy-wait 제거 | `do_work()` / `join()`의 `this_thread::yield()` 스핀을 `condition_variable` 기반 대기로 교체. | `runtime/ThreadPool.cpp` |
| Job signaling | `jobReady[]`, `jobDone[]` CV 배열 + `markThreadBusy()` 헬퍼로 분리. | 동일 |
| Debug 출력 제거 | Slab allocator/metadata 복제의 `fprintf` 제거. | `ThreadPool.cpp`, `_RV_memsafe.c` |
| 2mm 등 대형 벤치 기본 스레드 | NUM_THREADS 매크로 대신 `-DNUM_THREADS` 플래그와 스크립트 인자 연동. | 빌드 스크립트 |

이 결과, Catamaran 4-thread 실행 시 sys time이 0.05~0.07 s 수준으로 떨어졌고 `sched_yield` 기반 커널 오버헤드가 사실상 사라졌습니다.

## 4. THP / 성능 계측 전략

1. **Transparent Huge Pages(THP)**  
   - 호스트 WSL에서 `echo always | sudo tee /sys/kernel/mm/transparent_hugepage/{enabled,defrag}` 실행 → 컨테이너에서도 `[always] madvise never` 확인.  
   - THP off 데이터도 확보(`madvise`)하여 두 모드 모두를 표로 제시.
2. **perf & strace 절차**  
   - `perf stat`은 호스트에서 컨테이너 명령을 감싸는 방식으로 실행 (`perf stat -- docker exec ...`).  
   - 추가로 컨테이너 내부 perf (`-ddd`)와 `strace -fc` 로그도 `agent-tools/*.txt`에 저장, Summary 문서에 핵심 값 인용.
3. **결과 문서화**  
   - `PERFORMANCE_THP_TABLES.md`: THP on/off × 7개 벤치 × Threads {1,2,4,8} × α/β/γ(3회) best/avg.  
   - `PERF_ANALYSIS_SUMMARY.md`: perf/strace 비교, ThreadPool 변경, THP 효과, Executive Summary 표.

## 5. 기타 운영상의 차별점

- **벤치 확장성**: 2mm 외에도 atax/mvt/jacobi/syrk/syr2k/gemver를 모두 MoveC/Catamaran 파이프라인에 올려 “데이터 뷔페” 제공.  
- **Log/자료 보관**: 모든 실행 로그를 `~/.cursor/.../agent-tools/`에 자동 저장하여 재현/감사 용도로 남김.  
- **보고서 지향 문서 구조**: STATUS, THREAD_SCALING_RESULTS, PERFORMANCE_THP_TABLES 등 목적별 MD 파일을 분리해 친구분이 필요 부분만 바로 가져갈 수 있게 정리.

---

이 문서는 차후 README/보고서에서 “우리가 기존 Catamaran을 어떻게 발전시켰는가”를 요약할 때 그대로 인용해도 됩니다. 필요한 변경점이 추가되면 섹션을 보강해 주세요.


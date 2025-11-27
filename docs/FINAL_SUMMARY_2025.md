# Final Summary 2025

| Pillar | Outcome |
|--------|---------|
| Spatial Safety | Deep Copy + metadata packing verified across 2mm/atax/mvt/jacobi/syrk/syr2k/gemver |
| Performance | THP on, Catamaran 4T (2mm 1024²) 13.03 s vs MoveC 13.57 s (**≈4 % faster**); syrk에서 최대 +29 % 드랍. THP off 데이터는 `PERFORMANCE_THP_TABLES.md` 참조 |
| Tooling | `benchmark_alpha_beta_gamma.sh` + `measure_precise.py` provide reproducible α/β/γ pipelines |
| Documentation | Executive summary, THP tables, and evolution notes consolidated under `docs/` |

All auxiliary logs, experiments, and interim notes have been archived under `docs/archive/` for reference.


# Catamaran-Next Technical Report

## Overview
- **Project**: Catamaran-Next (LLVM 17 parallelization pipeline)
- **Scope**: Stabilized MoveC integration, ThreadPool improvements, THP-aware benchmarking
- **Artifacts**: `PERF_ANALYSIS_SUMMARY.md`, `PERFORMANCE_THP_TABLES.md`, `CATAMARAN_EVOLUTION_NOTES.md`, `FINAL_SUMMARY_2025.md`

## Key Highlights
1. **Spatial Safety**: Deep Copy implementation fully resolves metadata lifetime issues across threads.
2. **Performance**: ThreadPool condition-variable rewrite + THP enablement deliver consistent 5–7 % speedups over MoveC on dense kernels (2mm, syrk, etc.).
3. **Benchmark Coverage**: Expanded beyond 2mm to atax/mvt/jacobi/syrk/syr2k/gemver with scripted α/β/γ rebuilds.
4. **Profiling Discipline**: THP on/off datasets, perf/strace snapshots, and precise runtime scripts ensure reproducibility.

See the accompanying documents for granular data tables and evolution notes.


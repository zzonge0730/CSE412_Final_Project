#!/bin/bash
set -euo pipefail

ROOT="/workspace"
cd "$ROOT"

CC="$ROOT/build-catamaran-3.4.0/bin/clang"
CXX="$ROOT/build-catamaran-3.4.0/bin/clang++"
OPT="$ROOT/build-catamaran-3.4.0/bin/opt"
PASS="$ROOT/build-catamaran-3.4.0/lib/libCMPass.so"
RUNTIME="$ROOT/runtime/ThreadPool.cpp"
OUT_BASE="$ROOT/benchmarks/llvm34"

declare -A ARGS
ARGS["2mm"]="0 1024 1024 1024 1024"
ARGS["atax"]="0 4000 4000"
ARGS["mvt"]="0 4000"
ARGS["jacobi-2d"]="0 100 2000"
ARGS["syrk"]="0 1024 1024"

for bench in 2mm atax mvt "jacobi-2d" syrk; do
  src="examples/${bench}.c"
  movec_src="examples/llvm17/MoveC-${bench}.c"
  out_dir="${OUT_BASE}/${bench}"
  mkdir -p "$out_dir"

  echo "=== [${bench}] alpha (sequential) ==="
  "$CC" -O3 "$src" -o "${out_dir}/${bench}_alpha" -lm
  /usr/bin/time -p "${out_dir}/${bench}_alpha" ${ARGS[$bench]} \
    > "${out_dir}/alpha.out" 2> "${out_dir}/alpha.time"

  echo "=== [${bench}] beta (MoveC sequential) ==="
  "$CC" -O3 "$movec_src" -o "${out_dir}/${bench}_beta" -lm
  /usr/bin/time -p "${out_dir}/${bench}_beta" ${ARGS[$bench]} \
    > "${out_dir}/beta.out" 2> "${out_dir}/beta.time"

  echo "=== [${bench}] gamma (Catamaran 4T) ==="
  "$CC" -O3 -S -emit-llvm "$movec_src" -o "${out_dir}/${bench}.ll"
  "$OPT" -load "$PASS" -movec -PDGAnalysis -catamaran-pdg-reaching-analysis -LoopsMovec \
    < "${out_dir}/${bench}.ll" > "${out_dir}/CM-${bench}.bc"
  "$CXX" -std=c++11 -O3 -pthread -DNUM_THREADS=4 "${out_dir}/CM-${bench}.bc" "$RUNTIME" -lm \
    -o "${out_dir}/${bench}_gamma"
  /usr/bin/time -p "${out_dir}/${bench}_gamma" ${ARGS[$bench]} \
    > "${out_dir}/gamma.out" 2> "${out_dir}/gamma.time"
done


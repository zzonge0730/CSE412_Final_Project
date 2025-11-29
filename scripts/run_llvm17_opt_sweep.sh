#!/bin/bash
set -euo pipefail

ROOT="/workspace"
EX_DIR="$ROOT/examples/llvm17"
CLANG="/opt/llvm-17/bin/clang"
CLANGXX="/opt/llvm-17/bin/clang++"
OPT_BIN="/opt/llvm-17/bin/opt"
PASS_SO="$ROOT/build-catamaran-17/llvm/lib/Transforms/CMPass/CMPass.so"
THREADPOOL="$ROOT/runtime/ThreadPool.cpp"
OUT_BASE="$ROOT/benchmarks/llvm17_opt"

BENCHES=("2mm" "atax" "mvt" "syrk" "gemver" "jacobi-2d")
declare -A BENCH_ARGS
BENCH_ARGS["2mm"]="0 1024 1024 1024 1024 0"
BENCH_ARGS["atax"]="0 4000 4000"
BENCH_ARGS["mvt"]="0 4000"
BENCH_ARGS["syrk"]="0 1024 1024"
BENCH_ARGS["gemver"]="0 4000"
BENCH_ARGS["jacobi-2d"]="0 100 2000"

mkdir -p "$OUT_BASE"

if [[ ! -f "$PASS_SO" ]]; then
  echo "CMPass.so not found at $PASS_SO; build Catamaran LLVM17 first." >&2
  exit 1
fi

for bench in "${BENCHES[@]}"; do
  seq_src="$ROOT/examples/${bench}.c"
  movec_src="$EX_DIR/MoveC-${bench}.c"

  if [[ ! -f "$seq_src" || ! -f "$movec_src" ]]; then
    echo "Skipping ${bench}: missing sources." >&2
    continue
  fi

  IFS=' ' read -r -a INPUT_ARGS <<< "${BENCH_ARGS[$bench]}"

  for opt_level in 0 1 2 3; do
    echo "=== [${bench}] -O${opt_level} ==="
    level_dir="$OUT_BASE/${bench}/O${opt_level}"
    mkdir -p "$level_dir"

    alpha_bin="$level_dir/${bench}_alpha_O${opt_level}"
    beta_bin="$level_dir/MoveC_${bench}_beta_O${opt_level}"
    ll_file="$level_dir/MoveC_${bench}_O${opt_level}.ll"
    bc_file="$level_dir/CM_${bench}_O${opt_level}.bc"
    gamma_bin="$level_dir/CM_${bench}_gamma_O${opt_level}"

    # α build/run
    $CLANG -O${opt_level} "$seq_src" -o "$alpha_bin" -lm
    (/usr/bin/time -p "$alpha_bin" "${INPUT_ARGS[@]}" > "$level_dir/alpha.out") \
      2> "$level_dir/alpha.time"

    # β build/run
    $CLANG -O${opt_level} "$movec_src" -o "$beta_bin" -lm
    (/usr/bin/time -p "$beta_bin" "${INPUT_ARGS[@]}" > "$level_dir/beta.out") \
      2> "$level_dir/beta.time"

    # γ build/run
    $CLANG -O${opt_level} -S -emit-llvm "$movec_src" -o "$ll_file"
    $OPT_BIN -load-pass-plugin="$PASS_SO" -passes=Loops "$ll_file" -o "$bc_file" \
      > "$level_dir/opt.log" 2>&1 || true
    $CLANGXX -std=c++17 -O${opt_level} -pthread -DNUM_THREADS=8 \
      "$bc_file" "$THREADPOOL" -lm -o "$gamma_bin"
    (/usr/bin/time -p "$gamma_bin" "${INPUT_ARGS[@]}" > "$level_dir/gamma.out") \
      2> "$level_dir/gamma.time"
  done
done

echo "Sweep complete. Results stored under $OUT_BASE."


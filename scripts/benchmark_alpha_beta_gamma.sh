#!/bin/bash
# Rebuild + benchmark (α, β, γ) with -O3

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
EX_DIR="$ROOT_DIR/examples/llvm17"
CLANG_BIN="/opt/llvm-17/bin/clang"
CLANGXX_BIN="/opt/llvm-17/bin/clang++"
OPT_BIN="/opt/llvm-17/bin/opt"
PASS_SO="$ROOT_DIR/build-catamaran-17/llvm/lib/Transforms/CMPass/CMPass.so"
THREADPOOL_CPP="$ROOT_DIR/runtime/ThreadPool.cpp"

BENCHMARK="2mm"
THREADS="4"
RUNS="3"

if [[ $# -gt 0 ]]; then
  BENCHMARK="$1"
  shift
fi

if [[ $# -gt 0 ]]; then
  THREADS="$1"
  shift
fi

if [[ $# -gt 0 ]]; then
  RUNS="$1"
  shift
fi

if [[ $# -gt 0 ]]; then
  INPUT_ARGS="$*"
else
  INPUT_ARGS="0 1024 1024 1024 1024 1024"
fi

IFS=' ' read -r -a INPUT_ARRAY <<< "$INPUT_ARGS"

SEQ_SRC="$ROOT_DIR/examples/${BENCHMARK}.c"
MOVEC_SRC="$EX_DIR/MoveC-${BENCHMARK}.c"
LL_FILE="$EX_DIR/MoveC-${BENCHMARK}.ll"
BC_FILE="$EX_DIR/CM-MoveC-${BENCHMARK}.bc"
ALPHA_BIN="$EX_DIR/${BENCHMARK}-alpha-O3"
BETA_BIN="$EX_DIR/MoveC-${BENCHMARK}-beta-O3"
GAMMA_BIN="$EX_DIR/CM-MoveC-${BENCHMARK}-gamma-${THREADS}"

if [[ ! -f "$SEQ_SRC" ]]; then
  echo "Sequential source not found: $SEQ_SRC"
  exit 1
fi

if [[ ! -f "$MOVEC_SRC" ]]; then
  echo "MoveC source not found: $MOVEC_SRC"
  exit 1
fi

echo "=========================================="
echo "α/β/γ Benchmark Rebuild Script (-O3)"
echo "Benchmark : $BENCHMARK"
echo "Threads   : $THREADS"
echo "Runs      : $RUNS"
echo "Input     : $INPUT_ARGS"
echo "=========================================="

cd "$EX_DIR"

echo "[build] α  -> $ALPHA_BIN"
"$CLANG_BIN" -O3 "$SEQ_SRC" -o "$ALPHA_BIN" -lm

echo "[build] β  -> $BETA_BIN"
"$CLANG_BIN" -O3 "$MOVEC_SRC" -o "$BETA_BIN" -lm

echo "[build] γ  -> $GAMMA_BIN"
"$CLANG_BIN" -S -emit-llvm -O3 "$MOVEC_SRC" -o "$LL_FILE"
"$OPT_BIN" -load-pass-plugin="$PASS_SO" -passes=Loops "$LL_FILE" -o "$BC_FILE"
"$CLANGXX_BIN" -std=c++17 -O3 -pthread -DNUM_THREADS="$THREADS" \
  "$BC_FILE" "$THREADPOOL_CPP" -lm -o "$GAMMA_BIN"

run_target() {
  local label="$1"
  local binary="$2"
  local times=()

  echo "=== $label ($binary) ==="
  for i in $(seq 1 "$RUNS"); do
    echo -n "Run $i: "
    local timing
    if ! timing=$({ /usr/bin/time -p "$binary" "${INPUT_ARRAY[@]}" 1>/dev/null; } 2>&1); then
      echo "failed"
      continue
    fi
    local real=$(awk '/^real/ {print $2}' <<< "$timing")
    local user=$(awk '/^user/ {print $2}' <<< "$timing")
    local sys=$(awk '/^sys/ {print $2}' <<< "$timing")
    printf "real=%s user=%s sys=%s\n" "$real" "$user" "$sys"
    times+=("$real")
  done

  if [[ ${#times[@]} -eq 0 ]]; then
    echo "No successful runs."
    echo ""
    return
  fi

  IFS=$'\n' sorted=($(sort -n <<<"${times[*]}"))
  unset IFS

  local sum=0
  for value in "${times[@]}"; do
    sum=$(echo "$sum + $value" | bc -l)
  done

  local avg=$(echo "scale=4; $sum / ${#times[@]}" | bc -l)
  local best=${sorted[0]}
  local worst=${sorted[${#sorted[@]}-1]}

  echo "Best : $best s"
  echo "Avg  : $avg s"
  echo "Worst: $worst s"
  echo ""
}

run_target "α  Sequential" "$ALPHA_BIN"
run_target "β  MoveC O3" "$BETA_BIN"
run_target "γ  Catamaran" "$GAMMA_BIN"


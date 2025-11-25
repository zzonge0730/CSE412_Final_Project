#!/bin/bash
# Quick LLVM 17 smoke tests for MoveC and ASAN loop-free tasks

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD_DIR="/workspace/build-catamaran-17"
PLUGIN="$BUILD_DIR/llvm/lib/Transforms/CMPass/CMPass.so"
OPT_BIN="/opt/llvm-17/bin/opt"

if [ ! -x "$OPT_BIN" ]; then
  echo "❌ LLVM 17 toolchain not found at $OPT_BIN"
  echo "   Run inside the llvm17 Docker image or install the toolchain."
  exit 1
fi

if [ ! -d "$BUILD_DIR" ]; then
  echo "❌ Build directory $BUILD_DIR not found."
  echo "   Run scripts/build-llvm17.sh first."
  exit 1
fi

cd "$BUILD_DIR"

echo "Building CMPass (ninja CMPass)..."
ninja CMPass

echo ""
if [ ! -f "$PLUGIN" ]; then
  echo "❌ CMPass plugin not found at $PLUGIN"
  exit 1
fi

echo "Using plugin: $PLUGIN"

run_smoke() {
  local label="$1"
  local ir_path="$2"

  if [ ! -f "$ir_path" ]; then
    echo "❌ [$label] IR file missing: $ir_path"
    exit 1
  fi

  echo "=========================================="
  echo "[$label] Running opt -passes='Loops'"
  echo "IR: $ir_path"

  local output
  local status=0
  output=$("$OPT_BIN" \
    -load-pass-plugin="$PLUGIN" \
    -passes='Loops' \
    -disable-output \
    "$ir_path" 2>&1) || status=$?

  echo "$output"

  if [ $status -ne 0 ]; then
    echo "❌ [$label] opt execution failed with status $status"
    exit $status
  fi

  local spawn_count
  spawn_count=$(grep -ci "spawn" <<< "$output" || true)
  local task_count
  task_count=$(grep -ci "task" <<< "$output" || true)

  echo "[$label] spawn log count: $spawn_count"
  echo "[$label] task log count:  $task_count"
  echo "[$label] opt completed successfully"
}

run_smoke "MoveC loop-free" "../../examples/llvm17/test_llvm17_movec.ll"
run_smoke "ASAN loop-free" "../../examples/llvm17/test_llvm17_asan.ll"

echo "=========================================="
echo "LLVM 17 MoveC + ASAN smoke tests finished successfully"
echo "=========================================="

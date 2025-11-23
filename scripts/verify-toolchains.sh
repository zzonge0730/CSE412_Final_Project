#!/usr/bin/env bash
set -euo pipefail

echo "== Versions =="
which gcc && gcc --version | head -n1 || true
which g++ && g++ --version | head -n1 || true
which cmake && cmake --version | head -n1 || true
which clang && clang --version | head -n1 || true

echo "\n== Paths =="
echo "SOFTBOUNDCETS: ${SOFTBOUNDCETS_DIR:-not set}"
echo "MOVEC: ${MOVEC_DIR:-not set}"
echo "LLVM 3.5.2: ${LLVM352_DIR:-not set}"

echo "\n== SoftBoundCETS check =="
if [ -x "${SOFTBOUNDCETS_DIR:-}/softboundcets-llvm-clang34/Release+Asserts/bin/clang" ]; then
  echo "SoftBoundCETS clang OK"
else
  echo "SoftBoundCETS clang missing"; exit 1
fi

echo "\n== MoveC check =="
if command -v movec >/dev/null 2>&1; then
  movec -h | head -n1 || true
else
  echo "movec missing"; exit 1
fi

echo "\n== ASAN check =="
if [ -x "${LLVM352_DIR:-}/build/bin/clang" ]; then
  "${LLVM352_DIR}/build/bin/clang" --version | head -n1
else
  echo "ASAN clang missing"; exit 1
fi

echo "\nAll checks passed."



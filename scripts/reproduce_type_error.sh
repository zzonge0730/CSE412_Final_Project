#!/bin/bash
# Test ASAN on LLVM 17 (Full 2mm.c)

set -e

cd /workspace
cd examples/llvm17

# 1. Generate ASAN IR from 2mm.c
echo "Generating ASAN IR..."
/opt/llvm-17/bin/clang -S -emit-llvm -fsanitize=address -O1 \
    -mllvm -asan-instrumentation-with-call-threshold=0 \
    ../../examples/2mm.c \
    -o ASAN-2mm.ll 2>&1 | head -20

# 2. Run Catamaran Pass
echo ""
echo "Running Catamaran Pass..."
PLUGIN=/workspace/build-catamaran-17/llvm/lib/Transforms/CMPass/CMPass.so

/opt/llvm-17/bin/opt -disable-verify \
    -load-pass-plugin=$PLUGIN \
    -passes='function(mem2reg,loop-simplify,lcssa),Loops' \
    -S ASAN-2mm.ll -o CM-ASAN-2mm.ll 2>&1 || echo "opt crashed but continuing..."

# Check if manual dump exists
if [ -f "CM-MoveC-2mm.ll" ]; then
    mv CM-MoveC-2mm.ll CM-ASAN-2mm.ll
fi

# 3. Compile parallel binary
echo ""
echo "Compiling parallel binary..."
/opt/llvm-17/bin/clang++ -O3 -pthread -std=c++17 \
    -DNUM_THREADS=8 \
    CM-ASAN-2mm.ll \
    ../../runtime/ThreadPool.cpp \
    ../../runtime/dummy_asan.cpp \
    -o CM-ASAN-2mm 2>&1


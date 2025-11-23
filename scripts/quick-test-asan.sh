#!/bin/bash
# Quick rebuild and test script for ASAN Loop Task debugging

set -e

cd /workspace/build-catamaran-17

# Fast incremental build
echo "Building CMPass..."
ninja CMPass

cd /workspace/examples/llvm17

echo "Generating ASAN IR..."
/opt/llvm-17/bin/clang -S -emit-llvm -fsanitize=address -O1 \
    -mllvm -asan-instrumentation-with-call-threshold=0 \
    ../../examples/2mm.c \
    -o ASAN-2mm.ll 2>&1 | head -20

echo "Running Catamaran Pass..."
PLUGIN=/workspace/build-catamaran-17/llvm/lib/Transforms/CMPass/CMPass.so

# Allow crash (known issue)
/opt/llvm-17/bin/opt -disable-verify \
    -load-pass-plugin=$PLUGIN \
    -passes='function(mem2reg,loop-simplify,lcssa),Loops' \
    -S ASAN-2mm.ll -o CM-ASAN-2mm.ll 2>&1 || echo "opt crashed but continuing..."

# Use manual dump if exists
if [ -f "CM-MoveC-2mm.ll" ]; then
    echo "Using manually dumped IR file"
    mv CM-MoveC-2mm.ll CM-ASAN-2mm.ll
fi

echo "Compiling parallel binary..."
/opt/llvm-17/bin/clang++ -O3 -pthread -std=c++17 \
    -DNUM_THREADS=8 \
    CM-ASAN-2mm.ll \
    ../../runtime/ThreadPool.cpp \
    ../../runtime/dummy_asan.cpp \
    -o CM-ASAN-2mm


#!/bin/bash
# Test ASAN on LLVM 3.5.2 (original)

set -e

echo "=========================================="
echo "Testing ASAN on LLVM 3.5.2 (Original)"
echo "=========================================="

cd /workspace

# Check if LLVM 3.5.2 is built
if [ ! -d "build-catamaran-3.5.2" ]; then
    echo "ERROR: LLVM 3.5.2 not built. Please build first."
    echo "  cd build-catamaran-3.5.2"
    echo "  cmake ..."
    exit 1
fi

# Check if TransferForAsan pass exists
if [ ! -f "build-catamaran-3.5.2/lib/libCMPass.so" ]; then
    echo "ERROR: CMPass not found. Please build first."
    exit 1
fi

cd examples

# 1. Generate ASAN IR from 2mm.c
echo "Generating ASAN IR with LLVM 3.5.2..."
./build-catamaran-3.5.2/bin/clang -S -emit-llvm -fsanitize=address -O1 \
    2mm.c \
    -o ASAN-2mm-352.ll 2>&1 | head -20

if [ ! -f "ASAN-2mm-352.ll" ]; then
    echo "ERROR: Failed to generate ASAN IR"
    exit 1
fi

echo "✓ ASAN IR generated: ASAN-2mm-352.ll"

# 2. Run TransferForAsan Pass
echo ""
echo "Running TransferForAsan Pass..."
./build-catamaran-3.5.2/bin/opt \
    -load ./build-catamaran-3.5.2/lib/libCMPass.so \
    -PDGAnalysis -TFAsan \
    -S ASAN-2mm-352.ll -o CM-ASAN-2mm-352.ll 2>&1 | tail -20

if [ ! -f "CM-ASAN-2mm-352.ll" ]; then
    echo "ERROR: Failed to generate parallel IR"
    exit 1
fi

echo "✓ Parallel IR generated: CM-ASAN-2mm-352.ll"

# 3. Compile parallel binary
echo ""
echo "Compiling parallel binary..."
./build-catamaran-3.5.2/bin/clang++ -O3 -pthread -std=c++11 \
    -DNUM_THREADS=8 \
    CM-ASAN-2mm-352.ll \
    ../runtime/ThreadPool.cpp \
    -o CM-ASAN-2mm-352 2>&1

if [ ! -f "CM-ASAN-2mm-352" ]; then
    echo "ERROR: Failed to compile parallel binary"
    exit 1
fi

echo "✓ Binary compiled: CM-ASAN-2mm-352"

# 4. Run sequential baseline
echo ""
echo "=========================================="
echo "Running Sequential Baseline..."
echo "=========================================="
if [ -f "ASAN-2mm-352-seq" ]; then
    echo "Run 1:"
    time ./ASAN-2mm-352-seq 128 128 128 128 0 2>&1 || echo "Sequential run failed"
else
    echo "Compiling sequential..."
    ./build-catamaran-3.5.2/bin/clang++ -O3 -fsanitize=address \
        2mm.c \
        -o ASAN-2mm-352-seq 2>&1 || echo "Failed to compile sequential"
fi

# 5. Run parallel version
echo ""
echo "=========================================="
echo "Running Parallel Version (Catamaran)..."
echo "=========================================="
echo "Run 1:"
time ./CM-ASAN-2mm-352 128 128 128 128 0 2>&1
EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
    echo ""
    echo "✓ SUCCESS: Parallel ASAN execution completed"
    echo ""
    echo "Run 2:"
    time ./CM-ASAN-2mm-352 128 128 128 128 0 2>&1
    echo ""
    echo "Run 3:"
    time ./CM-ASAN-2mm-352 128 128 128 128 0 2>&1
else
    echo "✗ FAILED: Exit code $EXIT_CODE"
    exit 1
fi

echo ""
echo "=========================================="
echo "ASAN Test Complete (LLVM 3.5.2)!"
echo "=========================================="


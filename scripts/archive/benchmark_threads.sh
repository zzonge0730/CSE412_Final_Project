#!/bin/bash
set -e

INPUT="0 1024 1024 1024 1024"
THREADS_LIST="1 2 4 8 16"
RESULT_FILE="docs/llvm17-port/THREAD_SCALING_RESULTS.md"

mkdir -p docs/llvm17-port

echo "# Thread Scaling Benchmark Results (1024x1024)" > $RESULT_FILE
echo "**Date:** $(date)" >> $RESULT_FILE
echo "**Input:** $INPUT" >> $RESULT_FILE
echo "" >> $RESULT_FILE
echo "| Threads | Real (s) | User (s) | Sys (s) |" >> $RESULT_FILE
echo "|---------|----------|----------|---------|" >> $RESULT_FILE

# 1. Prepare Clean Versions (No OOB)
echo "Preparing clean binaries..."
cd examples/llvm17

# MoveC Baseline
if [ ! -f "./MoveC-2mm" ]; then
    echo "Compiling MoveC-2mm..."
    /opt/llvm-17/bin/clang -O3 MoveC-2mm.c -o MoveC-2mm -lm
fi

# Generate Catamaran Bitcode (Clean)
echo "Generating Catamaran IR..."
/opt/llvm-17/bin/clang -S -emit-llvm -O3 MoveC-2mm.c -o MoveC-2mm.ll
/opt/llvm-17/bin/opt -load-pass-plugin=/workspace/build-catamaran-17/llvm/lib/Transforms/CMPass/CMPass.so     -passes=Loops MoveC-2mm.ll -o CM-MoveC-2mm.bc

# 2. Measure MoveC Baseline
echo "Measuring MoveC Baseline..."
# Redirect stderr to null to avoid IO overhead from potential warnings
TIME_OUTPUT=$(/usr/bin/time -p ./MoveC-2mm $INPUT 2> /dev/null)
MOVEC_REAL=$(echo "$TIME_OUTPUT" | grep real | awk '{print $2}')
echo "MoveC Baseline: $MOVEC_REAL s"

# 3. Run Thread Scaling
for THREADS in $THREADS_LIST; do
    echo "========================================"
    echo "Benchmarking with NUM_THREADS=$THREADS"
    echo "========================================"
    
    # Recompile Catamaran Binary
    /opt/llvm-17/bin/clang++ -std=c++17 -O3 -pthread -DNUM_THREADS=$THREADS         CM-MoveC-2mm.bc /workspace/runtime/ThreadPool.cpp -lm         -o CM-MoveC-2mm-bench-$THREADS
    
    # Run Benchmark
    echo "Running..."
    # Redirect stderr to null to avoid IO overhead
    TIME_OUTPUT=$(/usr/bin/time -p ./CM-MoveC-2mm-bench-$THREADS $INPUT 2> /dev/null)
    REAL=$(echo "$TIME_OUTPUT" | grep real | awk '{print $2}')
    USER=$(echo "$TIME_OUTPUT" | grep user | awk '{print $2}')
    SYS=$(echo "$TIME_OUTPUT" | grep sys | awk '{print $2}')
    
    echo "Result: $REAL s"
    echo "| $THREADS | $REAL | $USER | $SYS |" >> $RESULT_FILE
    
    # Clean up
    rm CM-MoveC-2mm-bench-$THREADS
done

echo "" >> $RESULT_FILE
echo "## Comparison" >> $RESULT_FILE
echo "- **MoveC Baseline**: $MOVEC_REAL s" >> $RESULT_FILE
echo "" >> $RESULT_FILE

cat $RESULT_FILE


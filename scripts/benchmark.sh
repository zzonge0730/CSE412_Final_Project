#!/bin/bash
# Performance Benchmarking Script for Catamaran LLVM 17 Port

set -e

# Configuration
INPUT_SIZE="${1:-64 64 64 64 0}"
NUM_RUNS="${2:-5}"
BENCHMARK="${3:-2mm}"

echo "=========================================="
echo "Catamaran Performance Benchmark"
echo "=========================================="
echo "Benchmark: $BENCHMARK"
echo "Input: $INPUT_SIZE"
echo "Runs: $NUM_RUNS"
echo ""

# Function to run and measure time
run_benchmark() {
    local name=$1
    local cmd=$2
    local times=()
    
    echo "=== $name ==="
    for i in $(seq 1 $NUM_RUNS); do
        echo -n "Run $i: "
        local start=$(date +%s.%N)
        $cmd > /dev/null 2>&1 || true
        local end=$(date +%s.%N)
        local elapsed=$(echo "$end - $start" | bc)
        times+=($elapsed)
        printf "%.3f seconds\n" $elapsed
    done
    
    # Calculate average
    local sum=0
    for t in "${times[@]}"; do
        sum=$(echo "$sum + $t" | bc)
    done
    local avg=$(echo "scale=3; $sum / $NUM_RUNS" | bc)
    echo "Average: $avg seconds"
    echo ""
}

# Check if binaries exist
if [ ! -f "examples/llvm17/$BENCHMARK" ]; then
    echo "Error: Sequential binary not found: examples/llvm17/$BENCHMARK"
    exit 1
fi

if [ ! -f "examples/llvm17/MoveC-$BENCHMARK" ]; then
    echo "Error: MoveC sequential binary not found: examples/llvm17/MoveC-$BENCHMARK"
    exit 1
fi

if [ ! -f "examples/llvm17/CM-MoveC-$BENCHMARK" ]; then
    echo "Error: Catamaran parallel binary not found: examples/llvm17/CM-MoveC-$BENCHMARK"
    exit 1
fi

cd examples/llvm17

# Run benchmarks
run_benchmark "Sequential (α)" "./$BENCHMARK $INPUT_SIZE"
run_benchmark "MoveC Sequential (β)" "./MoveC-$BENCHMARK $INPUT_SIZE"
run_benchmark "Catamaran Parallel (γ)" "./CM-MoveC-$BENCHMARK $INPUT_SIZE"

echo "=========================================="
echo "Benchmark Complete"
echo "=========================================="


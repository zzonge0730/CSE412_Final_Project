#!/bin/bash
# Improved Performance Benchmarking Script
# Addresses: I/O bottleneck, input size, internal timing, overhead calculation

set -e

# Configuration
INPUT_SIZE="${1:-256 256 256 256 0}"
NUM_RUNS="${2:-5}"
BENCHMARK="${3:-2mm}"
THREAD_COUNT="${4:-8}"

echo "=========================================="
echo "Improved Catamaran Performance Benchmark"
echo "=========================================="
echo "Benchmark: $BENCHMARK"
echo "Input: $INPUT_SIZE"
echo "Runs: $NUM_RUNS"
echo "Threads: $THREAD_COUNT"
echo ""
echo "Note: stderr redirected to /dev/null to avoid I/O bottleneck"
echo ""

# Function to run and measure time (with proper I/O redirection)
run_benchmark() {
    local name=$1
    local cmd=$2
    local times=()
    
    echo "=== $name ==="
    for i in $(seq 1 $NUM_RUNS); do
        echo -n "Run $i: "
        # Redirect both stdout and stderr to /dev/null to avoid I/O bottleneck
        # time outputs to stderr, so we capture it separately
        local output=$( { time $cmd > /dev/null 2>&1; } 2>&1 )
        local elapsed=$(echo "$output" | grep real | awk '{print $2}')
        if [ -z "$elapsed" ]; then
            echo "Failed to measure"
            continue
        fi
        # Convert to seconds (handle mm:ss.ss format)
        local seconds=$(echo "$elapsed" | awk -F: '{if(NF==2) print $1*60+$2; else print $1}')
        times+=($seconds)
        printf "%.3f seconds\n" $seconds
    done
    
    # Calculate statistics
    if [ ${#times[@]} -eq 0 ]; then
        echo "No valid measurements"
        return
    fi
    
    # Sort times
    IFS=$'\n' sorted=($(sort -n <<<"${times[*]}"))
    unset IFS
    
    # Calculate average
    local sum=0
    for t in "${times[@]}"; do
        sum=$(echo "$sum + $t" | bc -l)
    done
    local avg=$(echo "scale=3; $sum / ${#times[@]}" | bc -l)
    
    # Get min (best case)
    local min=${sorted[0]}
    
    # Get max (worst case)
    local max=${sorted[${#sorted[@]}-1]}
    
    echo "Average: $avg seconds"
    echo "Best:    $min seconds"
    echo "Worst:   $max seconds"
    echo ""
}

# Check if binaries exist
cd examples/llvm17

if [ ! -f "$BENCHMARK" ]; then
    echo "Error: Sequential binary not found: $BENCHMARK"
    exit 1
fi

if [ ! -f "MoveC-$BENCHMARK" ]; then
    echo "Error: MoveC sequential binary not found: MoveC-$BENCHMARK"
    exit 1
fi

if [ ! -f "CM-MoveC-$BENCHMARK" ]; then
    echo "Error: Catamaran parallel binary not found: CM-MoveC-$BENCHMARK"
    exit 1
fi

# Set thread count
export NUM_THREADS=$THREAD_COUNT

# Run benchmarks
run_benchmark "Sequential (α)" "./$BENCHMARK $INPUT_SIZE"
run_benchmark "MoveC Sequential (β)" "./MoveC-$BENCHMARK $INPUT_SIZE"
run_benchmark "Catamaran Parallel (γ)" "./CM-MoveC-$BENCHMARK $INPUT_SIZE"

echo "=========================================="
echo "Overhead Analysis"
echo "=========================================="
echo "Note: Calculate overhead reduction using:"
echo "  MoveC Overhead = (β - α) / α × 100%"
echo "  Catamaran Overhead = (γ - α) / α × 100%"
echo "  Overhead Reduction = (MoveC_Overhead - Catamaran_Overhead) / MoveC_Overhead × 100%"
echo ""


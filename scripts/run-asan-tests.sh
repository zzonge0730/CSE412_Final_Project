#!/bin/bash
# Run ASAN tests in Docker

set -e

echo "=========================================="
echo "ASAN Test Suite"
echo "=========================================="

# Test LLVM 17
echo ""
echo "1. Testing LLVM 17..."
docker build -f docker/Dockerfile.llvm17 -t catamaran:llvm17 . 2>&1 | tail -5
docker run --rm -v $(pwd):/workspace catamaran:llvm17 bash -c "
    cd /workspace
    ./scripts/test-asan-llvm17.sh
" 2>&1 | tee asan-llvm17-test.log

echo ""
echo "=========================================="
echo "2. Testing LLVM 3.5.2 (if available)..."
echo "=========================================="
# Note: LLVM 3.5.2 may need separate Docker setup
# docker run --rm -v $(pwd):/workspace catamaran:llvm34 bash -c "
#     cd /workspace
#     ./scripts/test-asan-llvm352.sh
# " 2>&1 | tee asan-llvm352-test.log

echo ""
echo "=========================================="
echo "Test Complete! Check logs:"
echo "  - asan-llvm17-test.log"
echo "=========================================="

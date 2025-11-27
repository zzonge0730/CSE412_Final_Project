#!/bin/bash
# 벤치마크 빌드 및 테스트 스크립트
# Usage: ./scripts/build_benchmark.sh <benchmark_name> [threads]
# Example: ./scripts/build_benchmark.sh 3mm 4

set -e

BENCHMARK=$1
THREADS=${2:-4}

if [ -z "$BENCHMARK" ]; then
    echo "Usage: $0 <benchmark_name> [threads]"
    echo "Example: $0 3mm 4"
    exit 1
fi

cd /workspace/examples/llvm17

echo "=========================================="
echo "Building benchmark: $BENCHMARK"
echo "Threads: $THREADS"
echo "=========================================="

# 벤치마크별 소스 경로 및 파라미터 설정
case $BENCHMARK in
    3mm)
        SOURCE="../../polybench-c-3.2/linear-algebra/kernels/3mm/3mm.c"
        HEADER_DIR="../../polybench-c-3.2/linear-algebra/kernels/3mm"
        UTILS="../../polybench-c-3.2/utilities"
        INPUT_PARAMS="1024 1024 1024 1024 1024"
        ;;
    correlation)
        SOURCE="../../polybench-c-3.2/datamining/correlation/correlation.c"
        HEADER_DIR="../../polybench-c-3.2/datamining/correlation"
        UTILS="../../polybench-c-3.2/utilities"
        INPUT_PARAMS="1024 1024"
        ;;
    covariance)
        SOURCE="../../polybench-c-3.2/datamining/covariance/covariance.c"
        HEADER_DIR="../../polybench-c-3.2/datamining/covariance"
        UTILS="../../polybench-c-3.2/utilities"
        INPUT_PARAMS="1024 1024"
        ;;
    doitgen)
        SOURCE="../../polybench-c-3.2/linear-algebra/kernels/doitgen/doitgen.c"
        HEADER_DIR="../../polybench-c-3.2/linear-algebra/kernels/doitgen"
        UTILS="../../polybench-c-3.2/utilities"
        INPUT_PARAMS="256 256 256"
        ;;
    *)
        echo "Unknown benchmark: $BENCHMARK"
        echo "Supported: 3mm, correlation, covariance, doitgen"
        exit 1
        ;;
esac

if [ ! -f "$SOURCE" ]; then
    echo "Error: Source file not found: $SOURCE"
    exit 1
fi

echo ""
echo "Step 1: MoveC 계측..."
echo "Note: MoveC 계측은 수동으로 수행해야 합니다."
echo "      각 벤치마크를 MoveC 형식으로 변환한 후 계속 진행하세요."
echo ""
echo "Step 2: IR 생성 및 Catamaran Pass 적용..."
echo "Step 3: 컴파일 및 빌드..."
echo "Step 4: 성능 측정..."
echo ""

# TODO: 실제 빌드 로직은 MoveC 계측 버전이 준비된 후 진행



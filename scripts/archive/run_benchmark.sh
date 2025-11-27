#!/bin/bash
# 벤치마크 실행 및 성능 측정 스크립트

set -e

BENCHMARK="${1:-2mm}"
INPUT_SIZE="${2:-1000}"
ITERATIONS="${3:-5}"

echo "=========================================="
echo "Catamaran 벤치마크 실행 스크립트"
echo "=========================================="
echo "벤치마크: $BENCHMARK"
echo "입력 크기: $INPUT_SIZE"
echo "반복 횟수: $ITERATIONS"
echo ""

# 결과 저장 디렉토리
RESULTS_DIR="benchmark_results"
mkdir -p "$RESULTS_DIR"

# 타임스탬프
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
RESULT_FILE="$RESULTS_DIR/${BENCHMARK}_${INPUT_SIZE}_${TIMESTAMP}.txt"

echo "결과 파일: $RESULT_FILE"
echo ""

# Baseline 테스트
echo "1. Baseline (α) 테스트..."
BASELINE_TIMES=()
for i in $(seq 1 $ITERATIONS); do
    echo "   실행 $i/$ITERATIONS..."
    TIME_OUTPUT=$(time -p ./2mm-baseline $INPUT_SIZE $INPUT_SIZE $INPUT_SIZE $INPUT_SIZE 0 2>&1)
    REAL_TIME=$(echo "$TIME_OUTPUT" | grep "^real" | awk '{print $2}')
    BASELINE_TIMES+=($REAL_TIME)
    echo "   실행 시간: ${REAL_TIME}초"
done

# 평균 계산
BASELINE_AVG=$(echo "${BASELINE_TIMES[@]}" | awk '{sum=0; for(i=1;i<=NF;i++) sum+=$i; print sum/NF}')
BASELINE_MIN=$(echo "${BASELINE_TIMES[@]}" | tr ' ' '\n' | sort -n | head -1)
BASELINE_MAX=$(echo "${BASELINE_TIMES[@]}" | tr ' ' '\n' | sort -n | tail -1)

echo "   평균: ${BASELINE_AVG}초 (최소: ${BASELINE_MIN}초, 최대: ${BASELINE_MAX}초)"
echo ""

# 결과 저장
{
    echo "=========================================="
    echo "Catamaran 벤치마크 결과"
    echo "=========================================="
    echo "벤치마크: $BENCHMARK"
    echo "입력 크기: $INPUT_SIZE"
    echo "반복 횟수: $ITERATIONS"
    echo "실행 시간: $(date)"
    echo ""
    echo "Baseline (α):"
    echo "  평균: ${BASELINE_AVG}초"
    echo "  최소: ${BASELINE_MIN}초"
    echo "  최대: ${BASELINE_MAX}초"
    echo "  개별 결과: ${BASELINE_TIMES[@]}"
    echo ""
} > "$RESULT_FILE"

# SoftBoundCETS 테스트 (있는 경우)
if [ -f "./SBCETS-2mm" ]; then
    echo "2. SoftBoundCETS (β) 테스트..."
    SBCETS_TIMES=()
    for i in $(seq 1 $ITERATIONS); do
        echo "   실행 $i/$ITERATIONS..."
        TIME_OUTPUT=$(time -p ./SBCETS-2mm $INPUT_SIZE $INPUT_SIZE $INPUT_SIZE $INPUT_SIZE 0 2>&1)
        REAL_TIME=$(echo "$TIME_OUTPUT" | grep "^real" | awk '{print $2}')
        SBCETS_TIMES+=($REAL_TIME)
        echo "   실행 시간: ${REAL_TIME}초"
    done
    
    SBCETS_AVG=$(echo "${SBCETS_TIMES[@]}" | awk '{sum=0; for(i=1;i<=NF;i++) sum+=$i; print sum/NF}')
    SBCETS_MIN=$(echo "${SBCETS_TIMES[@]}" | tr ' ' '\n' | sort -n | head -1)
    SBCETS_MAX=$(echo "${SBCETS_TIMES[@]}" | tr ' ' '\n' | sort -n | tail -1)
    
    echo "   평균: ${SBCETS_AVG}초 (최소: ${SBCETS_MIN}초, 최대: ${SBCETS_MAX}초)"
    echo "   오버헤드: $(echo "scale=2; $SBCETS_AVG / $BASELINE_AVG" | bc)x"
    echo ""
    
    {
        echo "SoftBoundCETS (β):"
        echo "  평균: ${SBCETS_AVG}초"
        echo "  최소: ${SBCETS_MIN}초"
        echo "  최대: ${SBCETS_MAX}초"
        echo "  오버헤드: $(echo "scale=2; $SBCETS_AVG / $BASELINE_AVG" | bc)x"
        echo "  개별 결과: ${SBCETS_TIMES[@]}"
        echo ""
    } >> "$RESULT_FILE"
fi

# Catamaran 테스트 (있는 경우)
if [ -f "./CM-SBCETS-2mm" ]; then
    echo "3. SoftBoundCETS + Catamaran (γ) 테스트..."
    CATAMARAN_TIMES=()
    for i in $(seq 1 $ITERATIONS); do
        echo "   실행 $i/$ITERATIONS..."
        TIME_OUTPUT=$(time -p ./CM-SBCETS-2mm $INPUT_SIZE $INPUT_SIZE $INPUT_SIZE $INPUT_SIZE 0 2>&1)
        REAL_TIME=$(echo "$TIME_OUTPUT" | grep "^real" | awk '{print $2}')
        CATAMARAN_TIMES+=($REAL_TIME)
        echo "   실행 시간: ${REAL_TIME}초"
    done
    
    CATAMARAN_AVG=$(echo "${CATAMARAN_TIMES[@]}" | awk '{sum=0; for(i=1;i<=NF;i++) sum+=$i; print sum/NF}')
    CATAMARAN_MIN=$(echo "${CATAMARAN_TIMES[@]}" | tr ' ' '\n' | sort -n | head -1)
    CATAMARAN_MAX=$(echo "${CATAMARAN_TIMES[@]}" | tr ' ' '\n' | sort -n | tail -1)
    
    echo "   평균: ${CATAMARAN_AVG}초 (최소: ${CATAMARAN_MIN}초, 최대: ${CATAMARAN_MAX}초)"
    if [ -n "$SBCETS_AVG" ]; then
        SPEEDUP=$(echo "scale=2; $SBCETS_AVG / $CATAMARAN_AVG" | bc)
        echo "   성능 향상: ${SPEEDUP}x (SoftBoundCETS 대비)"
    fi
    echo ""
    
    {
        echo "SoftBoundCETS + Catamaran (γ):"
        echo "  평균: ${CATAMARAN_AVG}초"
        echo "  최소: ${CATAMARAN_MIN}초"
        echo "  최대: ${CATAMARAN_MAX}초"
        if [ -n "$SBCETS_AVG" ]; then
            echo "  성능 향상: ${SPEEDUP}x (SoftBoundCETS 대비)"
        fi
        echo "  개별 결과: ${CATAMARAN_TIMES[@]}"
        echo ""
    } >> "$RESULT_FILE"
fi

echo "=========================================="
echo "결과 요약"
echo "=========================================="
cat "$RESULT_FILE"
echo ""
echo "상세 결과는 $RESULT_FILE 에 저장되었습니다."

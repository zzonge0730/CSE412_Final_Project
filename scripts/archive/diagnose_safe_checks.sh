#!/bin/bash
# Safe Check 진단 스크립트
# kernel_2mm 함수 내부의 루프에 safe check가 있는지 확인

set -e

DEFAULT_IR_FILES=(
  "examples/llvm17/MoveC-2mm_dis.ll"
  "examples/llvm17/MoveC-2mm.ll"
)

IR_FILE="${1:-${DEFAULT_IR_FILES[0]}}"
FUNC_NAME="${2:-kernel_2mm}"

if [ ! -f "$IR_FILE" ]; then
  for candidate in "${DEFAULT_IR_FILES[@]}"; do
    if [ -f "$candidate" ]; then
      IR_FILE="$candidate"
      break
    fi
  done
fi

if [ ! -f "$IR_FILE" ]; then
  echo "❌ IR 파일을 찾을 수 없습니다. 첫 번째 인자로 IR 파일 경로를 전달하세요." >&2
  exit 1
fi

echo "=========================================="
echo "Safe Check 진단 스크립트"
echo "=========================================="
echo "IR 파일: $IR_FILE"
echo "함수 이름: $FUNC_NAME"
echo ""

# 1. 전체 파일에서 __RV_check_dpv_ss 개수 확인
echo "1. 전체 파일에서 __RV_check_dpv_ss 호출 개수:"
TOTAL_COUNT=$(grep -c "__RV_check_dpv_ss" "$IR_FILE" 2>/dev/null || echo "0")
echo "   총 $TOTAL_COUNT 개"
echo ""

# 2. kernel_2mm 함수 정의 찾기
echo "2. $FUNC_NAME 함수 위치 확인:"
FUNC_START=$(grep -n "define.*$FUNC_NAME" "$IR_FILE" | head -1 | cut -d: -f1)
if [ -z "$FUNC_START" ]; then
    echo "   ❌ 함수를 찾을 수 없습니다!"
    exit 1
fi
echo "   함수 시작 라인: $FUNC_START"
echo ""

# 3. 함수 내부의 __RV_check_dpv_ss 찾기
echo "3. $FUNC_NAME 함수 내부의 __RV_check_dpv_ss 호출:"
# 다음 함수 정의까지 찾기 (또는 파일 끝까지)
FUNC_END=$(awk "NR > $FUNC_START && /^define / {print NR-1; exit}" "$IR_FILE" || wc -l < "$IR_FILE")
echo "   함수 끝 라인 (추정): $FUNC_END"
echo ""

# 함수 내부의 safe check 찾기
sed -n "${FUNC_START},${FUNC_END}p" "$IR_FILE" | grep -n "__RV_check_dpv_ss" | head -10
FUNC_COUNT=$(sed -n "${FUNC_START},${FUNC_END}p" "$IR_FILE" | grep -c "__RV_check_dpv_ss" || echo "0")
echo "   함수 내부 총 $FUNC_COUNT 개"
echo ""

# 4. 루프 관련 BasicBlock 찾기
echo "4. 루프 관련 BasicBlock 확인:"
sed -n "${FUNC_START},${FUNC_END}p" "$IR_FILE" | grep -E "^[[:space:]]*;[[:space:]]*(for\.|loop|header|latch|body)" | head -10
echo ""

# 5. 실제 CallInst로 나타나는 safe check 찾기
echo "5. CallInst로 나타나는 __RV_check_dpv_ss:"
sed -n "${FUNC_START},${FUNC_END}p" "$IR_FILE" | grep -B 2 -A 2 "call.*@__RV_check_dpv_ss" | head -20
CALL_COUNT=$(sed -n "${FUNC_START},${FUNC_END}p" "$IR_FILE" | grep -c "call.*@__RV_check_dpv_ss" || echo "0")
echo "   CallInst로 나타나는 것: $CALL_COUNT 개"
echo ""

# 6. GetElementPtrInst의 피연산자로 사용되는 경우 찾기
echo "6. GetElementPtrInst의 피연산자로 사용되는 경우:"
sed -n "${FUNC_START},${FUNC_END}p" "$IR_FILE" | grep -B 5 -A 5 "getelementptr" | grep "__RV_check_dpv_ss" | head -10
echo ""

# 7. 함수 내부의 모든 CallInst 나열
echo "7. $FUNC_NAME 함수 내부의 모든 CallInst (처음 20개):"
sed -n "${FUNC_START},${FUNC_END}p" "$IR_FILE" | grep -n "call " | head -20
echo ""

# 8. 루프 헤더와 body BasicBlock 찾기
echo "8. 루프 구조 분석:"
sed -n "${FUNC_START},${FUNC_END}p" "$IR_FILE" | awk '
    /^[[:space:]]*;[[:space:]]*for\./ {print "  루프 라벨: " $0}
    /^[[:space:]]*;[[:space:]]*loop/ {print "  루프 정보: " $0}
    /^[[:space:]]*;[[:space:]]*header/ {print "  헤더: " $0}
    /^[[:space:]]*;[[:space:]]*body/ {print "  바디: " $0}
' | head -20
echo ""

echo "=========================================="
echo "진단 완료"
echo "=========================================="

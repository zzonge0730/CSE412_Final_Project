#!/bin/bash
# 빌드 오류 확인 스크립트

echo "=========================================="
echo "CMPass Build Error Check"
echo "=========================================="
echo ""

BUILD_DIR="/workspace/build-catamaran-14"
if [ ! -d "$BUILD_DIR" ]; then
    BUILD_DIR="build-catamaran-14"
    if [ ! -d "$BUILD_DIR" ]; then
        echo "Error: build-catamaran-14 디렉토리를 찾을 수 없습니다."
        exit 1
    fi
fi

cd "$BUILD_DIR"

echo "1. CMPass 관련 오류만 추출:"
echo "-------------------------------------------"
echo "다음 명령어를 실행하세요:"
echo "  cd $BUILD_DIR"
echo "  ninja CMPass 2>&1 | grep -E '(error|Error|ERROR|FAILED)' | head -50"
echo ""

echo "2. 실패한 파일 찾기:"
echo "-------------------------------------------"
echo "  ninja CMPass 2>&1 | grep 'FAILED:' | head -20"
echo ""

echo "3. 전체 빌드 로그에서 오류만:"
echo "-------------------------------------------"
echo "  ninja CMPass 2>&1 | grep -B 5 -A 10 'error:' | head -100"
echo ""

echo "4. CMPass 관련 파일의 컴파일 오류:"
echo "-------------------------------------------"
echo "  ninja CMPass 2>&1 | grep -E '(CMPass|error:)' | head -50"
echo ""


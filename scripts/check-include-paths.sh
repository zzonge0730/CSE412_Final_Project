#!/bin/bash
# CMPass 빌드 시 사용되는 include 경로 확인 스크립트

echo "=========================================="
echo "CMPass Include Paths Check"
echo "=========================================="
echo ""

# 빌드 디렉토리 확인
BUILD_DIR="/workspace/build-catamaran-14"
if [ ! -d "$BUILD_DIR" ]; then
    BUILD_DIR="build-catamaran-14"
    if [ ! -d "$BUILD_DIR" ]; then
        echo "Error: build-catamaran-14 디렉토리를 찾을 수 없습니다."
        exit 1
    fi
fi

cd "$BUILD_DIR"

echo "1. Loops.cpp 컴파일 명령어의 include 경로만 추출:"
echo "-------------------------------------------"
if [ -f "build.ninja" ]; then
    # build.ninja에서 Loops.cpp의 컴파일 명령어 찾기
    grep -A 10 "Loops.cpp.o:" build.ninja | grep -E "^\s+-I" | sed 's/^[[:space:]]*//' | sort -u
else
    echo "build.ninja 파일을 찾을 수 없습니다. 먼저 cmake를 실행하세요."
fi

echo ""
echo "2. 실제 빌드 시 사용되는 모든 include 경로 (CMPass만):"
echo "-------------------------------------------"
echo "다음 명령어를 실행하세요:"
echo "  cd $BUILD_DIR"
echo "  ninja -v CMPass 2>&1 | grep -E '^-I' | sort -u"
echo ""

echo "3. 오래된 include 경로 확인:"
echo "-------------------------------------------"
echo "다음 경로가 포함되어 있으면 문제입니다:"
echo "  ✗ /workspace/Catamaran-llvm-14/llvm/include"
echo "  ✗ /workspace/build-catamaran-14/include (오래된 LLVM 3.4 헤더)"
echo ""
echo "다음 경로만 있어야 합니다:"
echo "  ✓ /opt/llvm-14/include (LLVM 14 SDK)"
echo "  ✓ /workspace/Catamaran-llvm-14/llvm/lib/Transforms/CMPass (소스 디렉토리)"
echo ""

echo "4. 빠른 확인 방법:"
echo "-------------------------------------------"
echo "빌드 중에 다음 명령어로 실시간 확인:"
echo "  cd $BUILD_DIR"
echo "  ninja -v CMPass 2>&1 | grep 'Loops.cpp' | head -1 | grep -oE '-I[^ ]+' | sort"
echo ""

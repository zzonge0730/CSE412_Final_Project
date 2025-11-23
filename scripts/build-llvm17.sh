#!/bin/bash
# Build script for Catamaran LLVM 17

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$SCRIPT_DIR"

echo "=========================================="
echo "Building Catamaran for LLVM 17"
echo "=========================================="
echo ""

# Check if we're inside Docker container
if [ -d "/opt/llvm-17" ]; then
    echo "✓ Running inside Docker container"
    LLVM_DIR="/opt/llvm-17"
    BUILD_DIR="/workspace/build-catamaran-17"
    SOURCE_DIR="/workspace/Catamaran-llvm-17"
else
    echo "⚠ Not inside Docker container. Using environment variables."
    if [ -z "$LLVM17" ]; then
        echo "Error: LLVM17 environment variable not set."
        echo "Please run inside Docker container or set LLVM17 environment variable."
        exit 1
    fi
    LLVM_DIR="$LLVM17"
    BUILD_DIR="$(pwd)/build-catamaran-17"
    SOURCE_DIR="$(pwd)/Catamaran-llvm-17/llvm"
fi

# Create build directory
echo "Creating build directory: $BUILD_DIR"
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

# CMake configuration
echo ""
echo "Configuring CMake..."
cmake -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_DIR="$LLVM_DIR/lib/cmake/llvm" \
    -DCMAKE_CXX_STANDARD=17 \
    "$SOURCE_DIR"

# Build
echo ""
echo "Building CMPass..."
ninja CMPass

# Check result
echo ""
if [ -f "$BUILD_DIR/lib/libCMPass.so" ]; then
    echo "✓ Build successful: $BUILD_DIR/lib/libCMPass.so"
    ls -lh "$BUILD_DIR/lib/libCMPass.so"
    echo ""
    echo "Next steps:"
    echo "1. Test plugin loading: /opt/llvm-17/bin/opt -load-pass-plugin=lib/libCMPass.so -passes=\"Loops\" -disable-output /tmp/test.ll"
    echo "2. Check symbols: nm -D lib/libCMPass.so | grep llvmGetPassPluginInfo"
else
    echo "✗ Build failed - libCMPass.so not found"
    exit 1
fi


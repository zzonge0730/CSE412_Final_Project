#!/bin/bash
# Build script for Catamaran Docker container with LLVM 14

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

IMAGE_NAME="catamaran:llvm14"
CONTAINER_NAME="catamaran-llvm14-container"

echo "=========================================="
echo "Building Catamaran Docker Image (LLVM 14)"
echo "=========================================="
echo "Image name: $IMAGE_NAME"
echo "This may take 1-2 hours depending on your system..."
echo "LLVM 14 will be built from source."
echo ""

# Build the Docker image
docker build -f Dockerfile.llvm14 -t "$IMAGE_NAME" .

echo ""
echo "=========================================="
echo "Build completed successfully!"
echo "=========================================="
echo ""
echo "To run the container interactively:"
echo "  docker run -it --rm --name $CONTAINER_NAME \\"
echo "    -v \"$SCRIPT_DIR:/workspace:delegated\" \\"
echo "    -w /workspace \\"
echo "    $IMAGE_NAME"
echo ""
echo "Or to run a command:"
echo "  docker run --rm --name $CONTAINER_NAME \\"
echo "    -v \"$SCRIPT_DIR:/workspace:delegated\" \\"
echo "    -w /workspace \\"
echo "    $IMAGE_NAME smoke_test.sh"
echo ""
echo "Note: CMPass needs to be ported to LLVM 14 APIs before building Catamaran!"
echo ""


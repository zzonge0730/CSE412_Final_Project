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
echo "To run the container:"
echo "  docker run -it --name $CONTAINER_NAME $IMAGE_NAME"
echo ""
echo "Or use the run-docker-llvm14.sh script for convenience."
echo ""
echo "Note: CMPass needs to be ported to LLVM 14 APIs before building Catamaran!"
echo ""


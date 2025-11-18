#!/bin/bash
# Run script for Catamaran Docker container with LLVM 14

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IMAGE_NAME="catamaran:llvm14"
CONTAINER_NAME="catamaran-llvm14-container"

echo "=========================================="
echo "Running Catamaran Container (LLVM 14)"
echo "=========================================="

# Check if container already exists
if docker ps -a --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    echo "Container $CONTAINER_NAME already exists."
    read -p "Remove and recreate? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        docker rm -f "$CONTAINER_NAME"
    else
        echo "Starting existing container..."
        docker start -ai "$CONTAINER_NAME"
        exit 0
    fi
fi

# Run the container
docker run -it --name "$CONTAINER_NAME" \
    -v "$SCRIPT_DIR:/workspace" \
    -w /opt/catamaran \
    "$IMAGE_NAME" \
    /bin/bash


#!/bin/bash
# Run script for Catamaran Docker container with LLVM 17

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$SCRIPT_DIR"

IMAGE_NAME="catamaran:llvm17"
CONTAINER_NAME="catamaran-llvm17-container"

# Check if image exists
if ! docker image inspect "$IMAGE_NAME" >/dev/null 2>&1; then
    echo "Error: Docker image '$IMAGE_NAME' not found."
    echo "Please build it first using:"
    echo "  docker build -f docker/Dockerfile.llvm17 -t $IMAGE_NAME ."
    exit 1
fi

# Remove existing container if it exists (stopped)
if docker ps -a --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    echo "Removing existing container: $CONTAINER_NAME"
    docker rm "$CONTAINER_NAME" >/dev/null 2>&1 || true
fi

echo "=========================================="
echo "Starting Catamaran LLVM 17 Container"
echo "=========================================="
echo "Image: $IMAGE_NAME"
echo "Working directory: $SCRIPT_DIR -> /workspace"
echo ""
echo "To exit, type 'exit' or press Ctrl+D"
echo ""

# Run the container interactively
# Always explicitly run /bin/bash to get an interactive shell
# Check if we have a TTY, if not use -i instead of -it
if [ -t 0 ]; then
    # We have a TTY, use -it
    docker run -it --rm \
        --name "$CONTAINER_NAME" \
        -v "$SCRIPT_DIR:/workspace:delegated" \
        -w /workspace \
        "$IMAGE_NAME" /bin/bash
else
    # No TTY, use -i only
    echo "Warning: No TTY detected. Running without -t flag."
    echo "For interactive shell, please run this script from a terminal."
    docker run -i --rm \
        --name "$CONTAINER_NAME" \
        -v "$SCRIPT_DIR:/workspace:delegated" \
        -w /workspace \
        "$IMAGE_NAME" /bin/bash
fi


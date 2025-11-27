#!/bin/bash
# Fix file permissions for Catamaran-llvm-17
# Files created inside Docker container are owned by root

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Fixing permissions for Catamaran-llvm-17..."
echo "This requires sudo access."

# Get the current user's UID and GID
USER_ID=$(id -u)
GROUP_ID=$(id -g)

# Run inside Docker container if it's running, otherwise use sudo
if docker ps --format '{{.Names}}' | grep -q "catamaran-llvm17-container"; then
    echo "Docker container is running. Fixing permissions inside container..."
    docker exec catamaran-llvm17-container chown -R root:root /workspace/Catamaran-llvm-17
    echo "Note: Files are owned by root inside container. To fix on host:"
    echo "  sudo chown -R $USER_ID:$GROUP_ID Catamaran-llvm-17"
else
    echo "Docker container is not running."
    echo "To fix permissions on host, run:"
    echo "  sudo chown -R $USER_ID:$GROUP_ID Catamaran-llvm-17"
fi


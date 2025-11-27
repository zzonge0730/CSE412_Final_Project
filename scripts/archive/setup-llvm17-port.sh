#!/bin/bash
# Setup script for LLVM 17 porting - Creates directory structure and copies CMPass

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "=========================================="
echo "Setting up LLVM 17 Porting Environment"
echo "=========================================="
echo ""

# Check if source directory exists
if [ ! -d "Catamaran-llvm-14/llvm/lib/Transforms/CMPass" ]; then
    echo "Error: Catamaran-llvm-14 not found!"
    echo "Please make sure you're in the project root directory."
    exit 1
fi

# Create directory structure
echo "Creating directory structure..."
mkdir -p Catamaran-llvm-17/llvm/lib/Transforms/CMPass
mkdir -p Catamaran-llvm-17/llvm/include
mkdir -p Catamaran-llvm-17/llvm/lib/Transforms

echo "✓ Directories created"

# Copy CMPass source files from LLVM 14
echo ""
echo "Copying CMPass source files from Catamaran-llvm-14..."
cp -r Catamaran-llvm-14/llvm/lib/Transforms/CMPass/* \
      Catamaran-llvm-17/llvm/lib/Transforms/CMPass/ 2>/dev/null || true

# Count files copied
FILE_COUNT=$(find Catamaran-llvm-17/llvm/lib/Transforms/CMPass -type f | wc -l)
echo "✓ Copied $FILE_COUNT files"

# Copy CMakeLists.txt from Transforms directory (to add CMPass subdirectory)
echo ""
echo "Creating base CMakeLists.txt structure..."
cat > Catamaran-llvm-17/llvm/lib/Transforms/CMakeLists.txt << 'EOF'
add_subdirectory(Utils)
add_subdirectory(Instrumentation)
add_subdirectory(InstCombine)
add_subdirectory(Scalar)
add_subdirectory(IPO)
add_subdirectory(Vectorize)
add_subdirectory(Hello)
add_subdirectory(ObjCARC)
add_subdirectory(CMPass)
EOF
echo "✓ Created CMakeLists.txt"

echo ""
echo "=========================================="
echo "Setup Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "1. Run Docker container: ./run-docker-llvm17.sh"
echo "2. Update CMakeLists.txt for LLVM 17"
echo "3. Update Pass plugin code for LLVM 17"
echo "4. Convert to Opaque Pointers"


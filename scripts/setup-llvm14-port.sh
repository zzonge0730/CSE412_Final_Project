#!/bin/bash
# Setup script for LLVM 14 porting - Creates directory structure and copies CMPass

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "=========================================="
echo "Setting up LLVM 14 Porting Environment"
echo "=========================================="
echo ""

# Check if source directory exists
if [ ! -d "Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMPass" ]; then
    echo "Error: Catamaran-llvm-3.4.0 not found!"
    echo "Please make sure you're in the project root directory."
    exit 1
fi

# Create directory structure
echo "Creating directory structure..."
mkdir -p Catamaran-llvm-14/llvm/lib/Transforms/CMPass
mkdir -p Catamaran-llvm-14/llvm/include
mkdir -p Catamaran-llvm-14/llvm/lib/Transforms

echo "✓ Directories created"

# Copy CMPass source files
echo ""
echo "Copying CMPass source files..."
cp -r Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMPass/* \
      Catamaran-llvm-14/llvm/lib/Transforms/CMPass/ 2>/dev/null || true

# Count files copied
FILE_COUNT=$(find Catamaran-llvm-14/llvm/lib/Transforms/CMPass -type f | wc -l)
echo "✓ Copied $FILE_COUNT files"

# Copy CMakeLists.txt from Transforms directory (to add CMPass subdirectory)
if [ -f "Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMakeLists.txt" ]; then
    echo ""
    echo "Creating base CMakeLists.txt structure..."
    cat > Catamaran-llvm-14/llvm/lib/Transforms/CMakeLists.txt << 'EOF'
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
fi

echo ""
echo "=========================================="
echo "Setup Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "1. Review LLVM14_PORTING_GUIDE.md for detailed instructions"
echo "2. Start modifying CMPass source files for LLVM 14 API compatibility"
echo "3. Update CMakeLists.txt in CMPass directory"
echo "4. Build and test:"
echo "   cd build-catamaran-14"
echo "   cmake -G Ninja -DCMAKE_BUILD_TYPE=Release \\"
echo "     -DLLVM_DIR=\$LLVM14/lib/cmake/llvm \\"
echo "     -DCMAKE_CXX_STANDARD=17 \\"
echo "     ../Catamaran-llvm-14/llvm"
echo "   ninja"
echo ""
echo "Location: Catamaran-llvm-14/llvm/lib/Transforms/CMPass/"
echo ""


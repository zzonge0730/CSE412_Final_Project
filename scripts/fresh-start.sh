#!/bin/bash
# Fresh start: Remove all history and start clean

set -e

echo "=========================================="
echo "Fresh Start: Removing Git History"
echo "=========================================="
echo ""
echo "⚠️  WARNING: This will delete all Git history!"
echo "Press Ctrl+C to cancel, or Enter to continue..."
read

# Remove .git directory
echo "Removing .git directory..."
rm -rf .git

# Initialize new repository
echo "Initializing new Git repository..."
git init

# Create initial commit with current state
echo "Creating initial commit..."
git add .
git commit -m "Initial commit: Catamaran LLVM 17 port

- Port Catamaran from LLVM 3.4 to LLVM 17
- Support Loop-Free Metadata Parallelization
- Support MoveC and ASAN
- ~7.1x speedup on MoveC-2mm (128x128)
- Add comprehensive documentation
- Add Docker support for multiple LLVM versions
- Exclude large files (>50MB) via .gitignore"

echo ""
echo "=========================================="
echo "Done! New repository initialized."
echo "=========================================="
echo ""
echo "Next steps:"
echo "1. Add remote: git remote add origin <YOUR_REPO_URL>"
echo "2. Push: git push -u origin main"
echo ""


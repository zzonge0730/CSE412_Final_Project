#!/bin/bash
# Remove large files from Git history

set -e

echo "=========================================="
echo "Removing large files from Git history"
echo "=========================================="
echo ""

# Files to remove from history
LARGE_FILES=(
    "examples/llvm17/MoveC-2mm_opt.ll"
    "movec/bin/movec"
    "softboundcets-34/softboundcets-llvm-clang34/Release+Asserts/bin/clang"
    "softboundcets-34/softboundcets-llvm-clang34/Release+Asserts/bin/clang++"
    "softboundcets-34/softboundcets-llvm-clang34/Release+Asserts/bin/clang-check"
    "softboundcets-34/softboundcets-llvm-clang34/Release+Asserts/bin/clang-format"
    "softboundcets-34/softboundcets-llvm-clang34/Release+Asserts/bin/clang-tblgen"
    "examples/llvm17/opt_debug.log"
    "examples/llvm17/opt_debug_flush.log"
    "examples/llvm17/opt_debug_fix.log"
)

# Create filter command
FILTER_CMD="git rm --cached --ignore-unmatch"
for file in "${LARGE_FILES[@]}"; do
    FILTER_CMD="$FILTER_CMD '$file'"
done

echo "Removing large files from all commits..."
echo "This may take a while..."
echo ""

# Use git filter-branch to remove files from history
git filter-branch --force --index-filter "$FILTER_CMD" --prune-empty --tag-name-filter cat -- --all

echo ""
echo "=========================================="
echo "Cleanup..."
echo "=========================================="

# Clean up backup refs
git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d 2>/dev/null || true

# Expire reflog and garbage collect
git reflog expire --expire=now --all
git gc --prune=now --aggressive

echo ""
echo "Done! Large files have been removed from Git history."
echo "You can now push with: git push -u origin main --force"


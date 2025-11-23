# GitHub 업로드 가이드 / GitHub Upload Guide

[English below]

## 사전 준비

### 1. GitHub 레포지토리 생성

1. GitHub에 로그인
2. "New repository" 클릭
3. 저장소 이름: `Catamaran-LLVM17` (또는 원하는 이름)
4. 설명: "Catamaran: Memory Safety Acceleration System - LLVM 17 Port"
5. Public 선택 (또는 Private)
6. **README, .gitignore, LICENSE는 추가하지 않음** (이미 프로젝트에 있음)
7. "Create repository" 클릭

### 2. SSH 키 설정 (필요한 경우)

```bash
# SSH 키 확인
ls -la ~/.ssh/id_*.pub

# 없다면 생성
ssh-keygen -t ed25519 -C "your_email@example.com"

# 공개키 복사
cat ~/.ssh/id_ed25519.pub

# GitHub에 추가:
# Settings > SSH and GPG keys > New SSH key
```

### 3. 원격 저장소 연결

```bash
# 기존 origin 제거 (다른 프로젝트용이면)
git remote remove origin

# 새로운 origin 추가 (SSH)
git remote add origin git@github.com:YOUR_USERNAME/Catamaran-LLVM17.git

# 또는 HTTPS
git remote add origin https://github.com/YOUR_USERNAME/Catamaran-LLVM17.git

# 확인
git remote -v
```

## 업로드 전 체크리스트

### 필수 확인 사항

- [ ] `.gitignore`가 제대로 작동하는지 확인
- [ ] 빌드 아티팩트가 제외되는지 확인 (`build-*`, `*.so`, `*.o` 등)
- [ ] 불필요한 파일이 포함되지 않는지 확인
- [ ] 모든 문서가 최신 상태인지 확인
- [ ] README.md가 올바른지 확인

### 파일 상태 확인

```bash
# 추가될 파일 확인
git status

# .gitignore가 제대로 작동하는지 확인
git status --ignored | head -20

# 큰 파일 확인 (50MB 이상)
find . -type f -size +50M -not -path "./.git/*" 2>/dev/null
```

## 업로드 절차

### 1. 변경사항 스테이징

```bash
# 모든 변경사항 추가
git add .

# 또는 선택적으로 추가
git add README.md LICENSE .gitignore
git add docker/ scripts/ docs/
git add Catamaran-llvm-*/
git add runtime/ examples/
```

### 2. 커밋

```bash
git commit -m "Initial commit: Catamaran LLVM 17 port

- Port Catamaran from LLVM 3.4 to LLVM 17
- Support Loop-Free Metadata Parallelization
- Support MoveC and ASAN
- ~7.1x speedup on MoveC-2mm (128x128)
- Add comprehensive documentation
- Add Docker support for multiple LLVM versions"
```

### 3. 업로드

```bash
# 메인 브랜치로 푸시
git push -u origin main

# 또는 master 브랜치인 경우
git push -u origin master
```

## 업로드 후 확인

1. GitHub 웹사이트에서 저장소 확인
2. README.md가 제대로 표시되는지 확인
3. 파일 구조가 올바른지 확인
4. 문서 링크가 작동하는지 확인

## 문제 해결

### 충돌 발생 시

```bash
# 원격 변경사항 가져오기
git pull origin main --rebase

# 충돌 해결 후
git add .
git commit
git push
```

### 큰 파일 업로드 실패 시

```bash
# Git LFS 사용 (필요한 경우)
git lfs install
git lfs track "*.so"
git lfs track "*.bin"
git add .gitattributes
```

### 권한 오류 시

```bash
# SSH 연결 테스트
ssh -T git@github.com

# HTTPS 사용 시
git remote set-url origin https://github.com/YOUR_USERNAME/Catamaran-LLVM17.git
```

---

## Pre-upload Preparation

### 1. Create GitHub Repository

1. Log in to GitHub
2. Click "New repository"
3. Repository name: `Catamaran-LLVM17` (or your preferred name)
4. Description: "Catamaran: Memory Safety Acceleration System - LLVM 17 Port"
5. Select Public (or Private)
6. **Do NOT add README, .gitignore, LICENSE** (already in project)
7. Click "Create repository"

### 2. SSH Key Setup (if needed)

```bash
# Check SSH key
ls -la ~/.ssh/id_*.pub

# Generate if not exists
ssh-keygen -t ed25519 -C "your_email@example.com"

# Copy public key
cat ~/.ssh/id_ed25519.pub

# Add to GitHub:
# Settings > SSH and GPG keys > New SSH key
```

### 3. Connect Remote Repository

```bash
# Remove existing origin (if it's for another project)
git remote remove origin

# Add new origin (SSH)
git remote add origin git@github.com:YOUR_USERNAME/Catamaran-LLVM17.git

# Or HTTPS
git remote add origin https://github.com/YOUR_USERNAME/Catamaran-LLVM17.git

# Verify
git remote -v
```

## Pre-upload Checklist

### Required Checks

- [ ] Verify `.gitignore` works correctly
- [ ] Verify build artifacts are excluded (`build-*`, `*.so`, `*.o`, etc.)
- [ ] Verify unnecessary files are not included
- [ ] Verify all documentation is up to date
- [ ] Verify README.md is correct

### Check File Status

```bash
# Check files to be added
git status

# Verify .gitignore works correctly
git status --ignored | head -20

# Check for large files (50MB+)
find . -type f -size +50M -not -path "./.git/*" 2>/dev/null
```

## Upload Procedure

### 1. Stage Changes

```bash
# Add all changes
git add .

# Or add selectively
git add README.md LICENSE .gitignore
git add docker/ scripts/ docs/
git add Catamaran-llvm-*/
git add runtime/ examples/
```

### 2. Commit

```bash
git commit -m "Initial commit: Catamaran LLVM 17 port

- Port Catamaran from LLVM 3.4 to LLVM 17
- Support Loop-Free Metadata Parallelization
- Support MoveC and ASAN
- ~7.1x speedup on MoveC-2mm (128x128)
- Add comprehensive documentation
- Add Docker support for multiple LLVM versions"
```

### 3. Upload

```bash
# Push to main branch
git push -u origin main

# Or if using master branch
git push -u origin master
```

## Post-upload Verification

1. Check repository on GitHub website
2. Verify README.md displays correctly
3. Verify file structure is correct
4. Verify documentation links work

## Troubleshooting

### If Conflicts Occur

```bash
# Fetch remote changes
git pull origin main --rebase

# After resolving conflicts
git add .
git commit
git push
```

### If Large File Upload Fails

```bash
# Use Git LFS (if needed)
git lfs install
git lfs track "*.so"
git lfs track "*.bin"
git add .gitattributes
```

### If Permission Error Occurs

```bash
# Test SSH connection
ssh -T git@github.com

# Use HTTPS if needed
git remote set-url origin https://github.com/YOUR_USERNAME/Catamaran-LLVM17.git
```


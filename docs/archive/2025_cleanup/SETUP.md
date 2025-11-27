# Installation Guide / 설치 가이드

[English below]

## Docker를 사용한 설치 (권장)

### 사전 요구사항

- Docker 설치됨
- 최소 10GB 디스크 공간
- 최소 4GB RAM

### LLVM 17 버전

```bash
# Docker 이미지 빌드
docker build -f docker/Dockerfile.llvm17 -t catamaran:llvm17 .

# 컨테이너 실행
./scripts/run-docker-llvm17.sh
```

컨테이너 내부에서:

```bash
# Catamaran 빌드
cd /workspace
./scripts/build-llvm17.sh

# 또는 수동으로
cd build-catamaran-17
cmake -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_DIR=/opt/llvm-17/lib/cmake/llvm \
    -DCMAKE_CXX_STANDARD=17 \
    ../Catamaran-llvm-17/llvm
ninja CMPass
```

### LLVM 14 버전

```bash
# Docker 이미지 빌드
docker build -f docker/Dockerfile.llvm14 -t catamaran:llvm14 .

# 컨테이너 실행
./scripts/run-docker-llvm14.sh
```

### LLVM 3.4 버전

```bash
# Docker 이미지 빌드
docker build -f docker/Dockerfile.llvm34 -t catamaran:llvm34 .

# 컨테이너 실행 (스크립트가 있다면)
# 또는 직접 docker run
```

## Docker 없이 설치

### LLVM 17 설치

1. **LLVM 17 다운로드 및 빌드**

```bash
# LLVM 17 소스 다운로드
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-17.0.6/llvm-project-17.0.6.src.tar.xz
tar -xf llvm-project-17.0.6.src.tar.xz
mv llvm-project-17.0.6.src llvm-17

# LLVM 17 빌드
mkdir -p llvm-17/build
cd llvm-17/build
cmake -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_ENABLE_PROJECTS="clang;lld" \
    -DLLVM_TARGETS_TO_BUILD="X86" \
    -DCMAKE_INSTALL_PREFIX=/opt/llvm-17 \
    ../llvm
ninja
ninja install
```

2. **Catamaran 빌드**

```bash
cd /path/to/Catamaran_artifact_issta23
mkdir -p build-catamaran-17
cd build-catamaran-17
cmake -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_DIR=/opt/llvm-17/lib/cmake/llvm \
    -DCMAKE_CXX_STANDARD=17 \
    ../Catamaran-llvm-17/llvm
ninja CMPass
```

### 의존성

- **컴파일러**: GCC 10+ 또는 Clang 10+ (C++17 지원)
- **CMake**: 3.20+ (LLVM 17용), 3.13+ (LLVM 14용)
- **Ninja**: 빌드 시스템
- **Python 3**: LLVM 빌드에 필요

### 환경 변수 설정

```bash
export LLVM17=/opt/llvm-17
export PATH=$LLVM17/bin:$PATH
```

## 검증

빌드가 성공했는지 확인:

```bash
# CMPass 플러그인 확인
ls -lh build-catamaran-17/llvm/lib/Transforms/CMPass/CMPass.so

# 플러그인 로드 테스트
/opt/llvm-17/bin/opt -load-pass-plugin=build-catamaran-17/llvm/lib/Transforms/CMPass/CMPass.so -help | grep Loops
```

## 문제 해결

자세한 내용은 [TROUBLESHOOTING.md](TROUBLESHOOTING.md)를 참고하세요.

---

## Installation with Docker (Recommended)

### Prerequisites

- Docker installed
- At least 10GB disk space
- At least 4GB RAM

### LLVM 17 Version

```bash
# Build Docker image
docker build -f docker/Dockerfile.llvm17 -t catamaran:llvm17 .

# Run container
./scripts/run-docker-llvm17.sh
```

Inside the container:

```bash
# Build Catamaran
cd /workspace
./scripts/build-llvm17.sh

# Or manually
cd build-catamaran-17
cmake -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_DIR=/opt/llvm-17/lib/cmake/llvm \
    -DCMAKE_CXX_STANDARD=17 \
    ../Catamaran-llvm-17/llvm
ninja CMPass
```

### LLVM 14 Version

```bash
# Build Docker image
docker build -f docker/Dockerfile.llvm14 -t catamaran:llvm14 .

# Run container
./scripts/run-docker-llvm14.sh
```

### LLVM 3.4 Version

```bash
# Build Docker image
docker build -f docker/Dockerfile.llvm34 -t catamaran:llvm34 .
```

## Installation without Docker

### Install LLVM 17

1. **Download and build LLVM 17**

```bash
# Download LLVM 17 source
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-17.0.6/llvm-project-17.0.6.src.tar.xz
tar -xf llvm-project-17.0.6.src.tar.xz
mv llvm-project-17.0.6.src llvm-17

# Build LLVM 17
mkdir -p llvm-17/build
cd llvm-17/build
cmake -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_ENABLE_PROJECTS="clang;lld" \
    -DLLVM_TARGETS_TO_BUILD="X86" \
    -DCMAKE_INSTALL_PREFIX=/opt/llvm-17 \
    ../llvm
ninja
ninja install
```

2. **Build Catamaran**

```bash
cd /path/to/Catamaran_artifact_issta23
mkdir -p build-catamaran-17
cd build-catamaran-17
cmake -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_DIR=/opt/llvm-17/lib/cmake/llvm \
    -DCMAKE_CXX_STANDARD=17 \
    ../Catamaran-llvm-17/llvm
ninja CMPass
```

### Dependencies

- **Compiler**: GCC 10+ or Clang 10+ (C++17 support)
- **CMake**: 3.20+ (for LLVM 17), 3.13+ (for LLVM 14)
- **Ninja**: Build system
- **Python 3**: Required for LLVM build

### Environment Variables

```bash
export LLVM17=/opt/llvm-17
export PATH=$LLVM17/bin:$PATH
```

## Verification

Check if build succeeded:

```bash
# Check CMPass plugin
ls -lh build-catamaran-17/llvm/lib/Transforms/CMPass/CMPass.so

# Test plugin loading
/opt/llvm-17/bin/opt -load-pass-plugin=build-catamaran-17/llvm/lib/Transforms/CMPass/CMPass.so -help | grep Loops
```

## Troubleshooting

See [TROUBLESHOOTING.md](TROUBLESHOOTING.md) for details.


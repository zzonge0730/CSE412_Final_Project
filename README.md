# Catamaran: Memory Safety Acceleration System

[English below]

## 개요

Catamaran은 메모리 안전성 검사(MoveC, ASAN 등)를 병렬화하여 성능을 향상시키는 시스템입니다. 이 프로젝트는 ISSTA'23 논문 "Catamaran: Low-Overhead Memory Safety Enforcement via Parallel Acceleration"의 아티팩트를 LLVM 17로 포팅한 버전입니다.

## 주요 기능

- **Loop-Free Metadata Parallelization**: 루프 외부의 메타데이터 검사를 병렬화
- **Loop Parallelization (DOALL)**: 루프 내부의 검사를 병렬화
- **MoveC 지원**: ~7.1x 성능 향상 (MoveC-2mm, 128x128 기준)
- **ASAN 지원**: AddressSanitizer 검사 병렬화
- **LLVM 3.4, 17 지원**: 다양한 LLVM 버전 지원

## 빠른 시작

### 요구사항

- Docker (권장)
- 또는 LLVM 17, C++17 컴파일러

### Docker로 실행 (권장)

```bash
# LLVM 17 버전
docker build -f docker/Dockerfile.llvm17 -t catamaran:llvm17 .
./scripts/run-docker-llvm17.sh

# LLVM 14 버전
docker build -f docker/Dockerfile.llvm14 -t catamaran:llvm14 .
./scripts/run-docker-llvm14.sh

# LLVM 3.4 버전
docker build -f docker/Dockerfile.llvm34 -t catamaran:llvm34 .
```

### 빌드 및 테스트

자세한 내용은 [설치 가이드](docs/SETUP.md)와 [테스트 방법](docs/TESTING.md)을 참고하세요.

## 문서

- [설치 가이드](docs/SETUP.md) - 환경 설정 및 빌드 방법
- [테스트 방법](docs/TESTING.md) - 예제 실행 및 성능 측정
- [코드 구조](docs/ARCHITECTURE.md) - 주요 파일 및 코드 구조
- [문제 해결](docs/TROUBLESHOOTING.md) - 자주 발생하는 문제 및 해결 방법
- [LLVM 17 포팅 상태](docs/llvm17-port/STATUS.md) - 포팅 진행 상황

## 성능 결과

MoveC-2mm (128x128 입력):
- **순차 실행**: ~0.198s (평균)
- **병렬 실행**: ~0.028s (평균)
- **속도 향상**: **~7.1x**

## 알려진 이슈

⚠️ **`opt` 실행 시 크래시 (Exit code 134)**: LLVM 17에서 `opt` 종료 시 크래시가 발생할 수 있지만, IR 파일은 정상적으로 생성됩니다. 자세한 내용은 [문제 해결 가이드](docs/TROUBLESHOOTING.md)를 참고하세요.

## 프로젝트 구조

```
Catamaran_artifact_issta23/
├── Catamaran-llvm-3.4/      # LLVM 3.4 버전
├── Catamaran-llvm-17/       # LLVM 17 버전 (포트됨)
├── Catamaran-llvm-3.5.2/    # LLVM 3.5.2 버전 (ASAN용)
├── docker/                  # Docker 파일들
├── scripts/                 # 빌드 및 실행 스크립트
├── runtime/                 # 런타임 라이브러리 (ThreadPool)
├── examples/                # 예제 파일들
└── docs/                    # 문서
```

## 라이선스

이 프로젝트는 LLVM 라이선스(Apache 2.0)를 따릅니다.

## 기여

이슈나 풀 리퀘스트를 환영합니다!

---

## Overview

Catamaran is a system that parallelizes memory safety checks (MoveC, ASAN, etc.) to improve performance. This project is a port of the ISSTA'23 artifact "Catamaran: Low-Overhead Memory Safety Enforcement via Parallel Acceleration" to LLVM 17.

## Key Features

- **Loop-Free Metadata Parallelization**: Parallelizes metadata checks outside loops
- **Loop Parallelization (DOALL)**: Parallelizes checks inside loops
- **MoveC Support**: ~7.1x speedup (MoveC-2mm, 128x128)
- **ASAN Support**: Parallelizes AddressSanitizer checks
- **LLVM 3.4, 17 Support**: Multiple LLVM versions supported

## Quick Start

### Requirements

- Docker (recommended)
- Or LLVM 17, C++17 compiler

### Run with Docker (Recommended)

```bash
# LLVM 17 version
docker build -f docker/Dockerfile.llvm17 -t catamaran:llvm17 .
./scripts/run-docker-llvm17.sh

# LLVM 14 version
docker build -f docker/Dockerfile.llvm14 -t catamaran:llvm14 .
./scripts/run-docker-llvm14.sh

# LLVM 3.4 version
docker build -f docker/Dockerfile.llvm34 -t catamaran:llvm34 .
```

### Build and Test

See [Installation Guide](docs/SETUP.md) and [Testing Guide](docs/TESTING.md) for details.

## Documentation

- [Installation Guide](docs/SETUP.md) - Environment setup and build instructions
- [Testing Guide](docs/TESTING.md) - Running examples and performance measurement
- [Code Structure](docs/ARCHITECTURE.md) - Key files and code structure
- [Troubleshooting](docs/TROUBLESHOOTING.md) - Common issues and solutions
- [LLVM 17 Porting Status](docs/llvm17-port/STATUS.md) - Porting progress

## Performance Results

MoveC-2mm (128x128 input):
- **Sequential**: ~0.198s (average)
- **Parallel**: ~0.028s (average)
- **Speedup**: **~7.1x**

## Known Issues

⚠️ **Crash when running `opt` (Exit code 134)**: A crash may occur when `opt` exits in LLVM 17, but the IR file is generated successfully. See [Troubleshooting Guide](docs/TROUBLESHOOTING.md) for details.

## Project Structure

```
Catamaran_artifact_issta23/
├── Catamaran-llvm-3.4/      # LLVM 3.4 version
├── Catamaran-llvm-17/       # LLVM 17 version (ported)
├── Catamaran-llvm-3.5.2/    # LLVM 3.5.2 version (for ASAN)
├── docker/                  # Docker files
├── scripts/                 # Build and run scripts
├── runtime/                 # Runtime library (ThreadPool)
├── examples/                # Example files
└── docs/                    # Documentation
```

## License

This project follows the LLVM license (Apache 2.0).

## Contributing

Issues and pull requests are welcome!

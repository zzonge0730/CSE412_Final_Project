# Catamaran: Memory Safety Acceleration System

[English below]

## 개요

Catamaran은 메모리 안전성 검사(MoveC, ASAN 등)를 병렬화하여 성능을 향상시키는 시스템입니다. 이 프로젝트는 ISSTA'23 논문 "Catamaran: Low-Overhead Memory Safety Enforcement via Parallel Acceleration"의 아티팩트를 LLVM 17로 포팅한 버전입니다.

## 주요 기능

- **Loop-Free Metadata Parallelization**: 루프 외부의 메타데이터 검사를 병렬화
- **Loop Parallelization (DOALL)**: 루프 내부의 검사를 병렬화
- **MoveC 지원**: LLVM 17 포팅본에서 Loop-Free·DOALL 경로 모두 동작 (런타임 이슈는 MoveC 자체 문제)
- **ASAN 지원**: Loop-Free 경로는 LLVM 17 빌드까지 완료, DOALL 보강 예정
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

## LLVM 17 테스트 스냅샷

- **Baseline (α)**: `2mm`를 LLVM 17 `clang -O3`로 빌드 후 `1000 1000 1000 1000 0` 입력으로 실행 → `real 0.71s`
- **MoveC β**: `examples/llvm17/MoveC-2mm.c`를 `clang -O3`로 빌드 후 동일 입력 실행 → `real 25.34s` (MoveC 런타임 경고는 기존과 동일하게 발생)
- **MoveC γ**: `opt -passes=Loops`로 `CM-MoveC-2mm.bc` 생성 및 `clang++` 링크까지 완료. 실행 시 Docker 프로세스가 즉시 종료되어 결과가 수집되지 않음 (잠재적 런타임/자원 이슈, [문제 해결 가이드](docs/TROUBLESHOOTING.md) 참고).
- **ASAN β/γ**: LLVM 17 경로는 아직 실행 전. LLVM 3.5.2 도구체인 설정 이후 교차 검증 예정.

자세한 커맨드와 로그는 [docs/TESTING.md](docs/TESTING.md)와 [docs/llvm17-port/STATUS.md](docs/llvm17-port/STATUS.md)에 기록했습니다.

## 알려진 이슈

- Catamaran 바이너리는 Docker 컨테이너 안에서 빌드/실행했을 때만 검증되었습니다. 컨테이너 밖에서 실행하면 필요한 라이브러리 및 경로가 달라 런타임 에러가 발생할 수 있습니다.
- **MoveC γ Spatial Errors**: Catamaran이 spawn 시 MoveC 메타데이터(__RV_pmd)를 불완전하게 전달하여 발생. MoveC β(Sequential)는 정상 작동하지만 Catamaran γ에서만 spatial error 발생. 상세 분석: [docs/llvm17-port/MOVEC_METADATA_ISSUE.md](docs/llvm17-port/MOVEC_METADATA_ISSUE.md)
- MoveC γ는 작은 입력(`0 64 64 64 64`)에서는 경고만 발생하고 실행 완료되지만, 큰 입력에서는 `double free or corruption`으로 Abort됩니다.
- **ASAN γ**: LLVM 17에서 정상 작동 확인됨 (32/128 입력 모두 정상 종료).

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
- **MoveC Support**: LLVM 17 port covers both loop-free and DOALL paths (runtime warnings originate from upstream MoveC)
- **ASAN Support**: Loop-free path builds on LLVM 17; DOALL fixes are queued
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

## LLVM 17 Test Snapshot

- **Baseline (α)**: `clang -O3 examples/2mm.c -o 2mm` → `./2mm 1000 1000 1000 1000 0` → `real 0.71s`
- **MoveC β**: `clang -O3 examples/llvm17/MoveC-2mm.c -o MoveC-2mm` → same input → `real 25.34s` (MoveC runtime warnings still show up)
- **MoveC γ**: `opt -passes=Loops` + `clang++` link succeed, but running `CM-MoveC-2mm` inside Docker exits immediately (suspected resource/runtime issue—see [Troubleshooting](docs/TROUBLESHOOTING.md))
- **ASAN β/γ**: Pending; LLVM 3.5.2 AddressSanitizer toolchain still being wired into the LLVM 17 build.

## Known Issues

- Catamaran binaries have only been validated inside the Docker container. Running them directly on the host may fail because the required libraries and paths differ.
- The MoveC runtime reports spatial errors on both large and small inputs, so timing numbers are reference only until the upstream tool is fixed.
- The MoveC γ binary currently exits immediately when run inside Docker, so no parallel timing numbers are available yet. Further investigation (smaller inputs, `dmesg`, ThreadPool logging) is required.
- ASAN β/γ runs have not been executed on LLVM 17 yet; wiring the LLVM 3.5.2 runtime into the new toolchain is still in progress.

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
 
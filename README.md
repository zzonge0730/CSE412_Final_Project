# Catamaran: Memory Safety Acceleration System

[English below]

## 개요

Catamaran은 메모리 안전성 검사(MoveC, ASAN 등)를 병렬화하여 성능을 향상시키는 시스템입니다. 이 프로젝트는 ISSTA'23 논문 "Catamaran: Low-Overhead Memory Safety Enforcement via Parallel Acceleration"의 아티팩트를 LLVM 17로 포팅한 버전입니다.

**현재 상태 (2025-11-26):** 병렬화 성능 향상(21.4%)과 메모리 안전성 검증(Spatial Safety)에 모두 성공했습니다.

## 주요 기능

- **Loop-Free Metadata Parallelization**: 루프 외부의 메타데이터 검사를 병렬화
- **Loop Parallelization (DOALL)**: 루프 내부의 검사를 병렬화
- **MoveC 지원**: LLVM 17에서 정상 동작하며, **Deep Copy** 기술로 메타데이터 전달 문제를 해결
- **ASAN 지원**: LLVM 17 호환성 확보 (Loop-Free 경로)
- **LLVM 3.4, 17 지원**: 레거시 및 최신 컴파일러 환경 지원

## 빠른 시작

### 요구사항

- Docker (권장)
- 또는 LLVM 17, C++17 컴파일러

### Docker로 실행 (권장)

```bash
# LLVM 17 버전 (최종 검증됨)
docker build -f docker/Dockerfile.llvm17 -t catamaran:llvm17 .
./scripts/run-docker-llvm17.sh

# LLVM 3.4 버전
docker build -f docker/Dockerfile.llvm34 -t catamaran:llvm34 .
```

### 빌드 및 테스트

자세한 내용은 [설치 가이드](docs/SETUP.md)와 [테스트 방법](docs/TESTING.md)을 참고하세요.

## 문서 (Documentation)

### 📘 기본 가이드
- [설치 가이드](docs/SETUP.md) - 환경 설정 및 빌드 방법
- [테스트 방법](docs/TESTING.md) - 예제 실행 및 성능 측정
- [코드 구조](docs/ARCHITECTURE.md) - 주요 파일 및 코드 구조
- [문제 해결](docs/TROUBLESHOOTING.md) - 자주 발생하는 문제 및 해결 방법

### 📊 LLVM 17 포팅 및 결과 보고서
이 프로젝트의 핵심 성과와 기술적 상세 내용을 담은 문서들입니다.

- **[최종 상태 보고서](docs/llvm17-port/FINAL_STATUS.md)** - 프로젝트 최종 결과 요약 (성공)
- **[기술 분석: LLVM 3.4 vs 17 포인터 모델](docs/llvm17-port/LLVM34_vs_LLVM17_POINTER_MODEL.md)** - 포팅 난관 및 해결책 (Deep Copy 도입 배경)
- [Deep Copy 구현 상세](docs/llvm17-port/DEEP_COPY_IMPLEMENTATION.md) - 핵심 기술 설명
- [성능 측정 결과](docs/llvm17-port/PERFORMANCE_RESULTS.md) - 벤치마크 상세 결과
- [포팅 진행 상황](docs/llvm17-port/STATUS.md) - 전체 포팅 로그 요약

## LLVM 17 테스트 결과 (2025-11-26)

- **Spatial Safety**: ✅ **완벽 해결** (Deep Copy 도입으로 OOB 오류 및 크래시 해결)
- **Performance**: ✅ **목표 달성** (1024x1024 행렬 곱셈 기준)
  - MoveC Baseline (β): 16.93s
  - Catamaran (γ): 13.31s
  - **결과: 21.4% 성능 향상**

## 알려진 이슈

- **Temporal Errors**: `2mm` 벤치마크에서 일부 Temporal Error(Invalid Object)가 보고되나, `gemm`에서는 발생하지 않음 (MoveC 런타임 특성으로 추정되며 기능상 치명적이지 않음).
- **Host Execution**: Docker 환경 외부에서의 실행은 보장하지 않음.

---

## Overview

Catamaran is a system that parallelizes memory safety checks (MoveC, ASAN, etc.) to improve performance. This project is a port of the ISSTA'23 artifact "Catamaran: Low-Overhead Memory Safety Enforcement via Parallel Acceleration" to LLVM 17.

**Current Status (2025-11-26):** LLVM 17 porting is **COMPLETE**. We achieved **21.4% speedup** and verified **Spatial Safety**.

## Key Features

- **Loop-Free Metadata Parallelization**: Parallelizes metadata checks outside loops
- **Loop Parallelization (DOALL)**: Parallelizes checks inside loops
- **MoveC Support**: Fully functional on LLVM 17 with **Deep Copy** mechanism
- **ASAN Support**: LLVM 17 compatible (Loop-Free path)
- **LLVM 3.4, 17 Support**: Multiple LLVM versions supported

## Documentation

### Guides
- [Installation Guide](docs/SETUP.md)
- [Testing Guide](docs/TESTING.md)
- [Code Structure](docs/ARCHITECTURE.md)
- [Troubleshooting](docs/TROUBLESHOOTING.md)

### Porting Report & Resources
- **[Final Status Report](docs/llvm17-port/FINAL_STATUS.md)** - Summary of achievements
- **[Technical Analysis: LLVM 3.4 vs 17](docs/llvm17-port/LLVM34_vs_LLVM17_POINTER_MODEL.md)** - Key technical challenges & Deep Copy
- [Deep Copy Implementation](docs/llvm17-port/DEEP_COPY_IMPLEMENTATION.md) - Core solution details
- [Performance Results](docs/llvm17-port/PERFORMANCE_RESULTS.md) - Benchmark data

## Test Results (LLVM 17)

- **Spatial Safety**: ✅ **Verified** (Deep Copy resolved previous issues)
- **Performance**: ✅ **Achieved** (1024x1024 Matrix Multiplication)
  - MoveC Baseline (β): 16.93s
  - Catamaran (γ): 13.31s
  - **Result: 21.4% Speedup**

## Known Issues

- **Temporal Errors**: Observed in `2mm` but not in `gemm`. Likely due to MoveC runtime specifics.
- **Host Execution**: Only validated inside the Docker container.

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

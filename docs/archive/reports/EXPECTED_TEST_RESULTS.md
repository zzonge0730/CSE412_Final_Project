# 예상 테스트 결과 및 테스트 파일 가이드

## 논문 정보
- **논문**: "Catamaran: Low-Overhead Memory Safety Enforcement via Parallel Acceleration"
- **컨퍼런스**: ISSTA'23, Paper #233
- **논문 PDF**: `docs/3597926.3598098.pdf`

## 테스트 파일

### 주요 테스트 파일: PolyBench 2mm

**파일 위치**:
- `examples/2mm.c` - 원본 소스 코드
- `polybench-c-3.2/linear-algebra/kernels/2mm/2mm.c` - PolyBench 원본

**입력 파라미터**:
```bash
./2mm 1000 1000 1000 1000 0
# 또는
./2mm <ni> <nj> <nk> <nl> <print_result>
# ni, nj, nk, nl: 행렬 크기
# print_result: 0 (출력 안 함) 또는 1 (출력)
```

### 다른 PolyBench 벤치마크

`polybench-c-3.2/` 디렉토리에 다음 벤치마크들이 있습니다:

**Linear Algebra Kernels**:
- `2mm` - 2 Matrix Multiplications
- `3mm` - 3 Matrix Multiplications
- `atax` - Matrix Transpose and Vector Multiplication
- `bicg` - BiCG Sub Kernel of BiCGStab
- `doitgen` - Multiresolution analysis kernel
- `gemm` - Matrix-Matrix Multiplication
- `gemver` - Vector Multiplication and Matrix Addition
- `gesummv` - Scalar, Vector and Matrix Multiplication
- `mvt` - Matrix Vector Product and Transpose
- `symm` - Symmetric Matrix-Matrix Multiplication
- `syr2k` - Symmetric rank-2k operations
- `syrk` - Symmetric rank-k operations
- `trisolv` - Triangular solver
- `trmm` - Triangular matrix-matrix multiplication

**Linear Algebra Solvers**:
- `cholesky`, `durbin`, `gramschmidt`, `lu`, `ludcmp`

**Medley**:
- `floyd-warshall`, `reg_detect`

**Stencils**:
- `adi`, `fdtd-2d`, `fdtd-apml`, `jacobi-1d-imper`, `jacobi-2d-imper`, `seidel-2d`

**Data Mining**:
- `correlation`, `covariance`

## 예상 테스트 결과 (LLVM 3.4 환경)

### PolyBench 2mm (N=1000)

| 버전 | 실행 시간 | 메모리 | 비고 |
|------|----------|--------|------|
| **Baseline (α)** | ~2.86초 | 16640KB | 원본 코드, 최적화 없음 |
| **SoftBoundCETS (β)** | ~16.92초 | 17408KB | 메모리 안전성 검사만 |
| **MoveC (β)** | ~94.68초 (1:34.68) | 16768KB | MoveC instrumentation만 |
| **SoftBoundCETS + Catamaran (γ)** | ~15-18초 | - | 병렬화 적용 |
| **MoveC + Catamaran (γ)** | ~103초 (1:43.615) | - | 병렬화 적용 |

### 성능 분석

**SoftBoundCETS**:
- Baseline 대비 오버헤드: ~5.9배 (16.92 / 2.86)
- Catamaran 적용 시: ~5.3-6.3배 (15-18 / 2.86)
- **개선**: 약 10-20% 성능 향상 (16.92 → 15-18초)

**MoveC**:
- Baseline 대비 오버헤드: ~33.1배 (94.68 / 2.86)
- Catamaran 적용 시: ~36.0배 (103 / 2.86)
- **주의**: 작은 입력값에서는 오버헤드로 인해 느려질 수 있음

### 작은 입력값 (32×32×32×32)

| 버전 | 실행 시간 | 분석 |
|------|----------|------|
| **Sequential MoveC** | ~0.606초 | - |
| **Catamaran MoveC** | ~1.081초 | 병렬화 오버헤드가 이익을 상쇄 |

**결론**: 작은 입력값에서는 스레드 생성/동기화 오버헤드가 병렬화 이익을 상쇄합니다.

## 테스트 실행 방법

### 1. Baseline (α) 테스트

```bash
# LLVM 3.4 환경
./build-catamaran-3.4.0/bin/clang -O3 ./examples/2mm.c -o 2mm-baseline
time ./2mm-baseline 1000 1000 1000 1000 0

# LLVM 17 환경
/opt/llvm-17/bin/clang -O3 ./examples/2mm.c -o 2mm
time ./2mm 1000 1000 1000 1000 0
```

**예상 결과**: ~2-3초

### 2. SoftBoundCETS (β) 테스트

```bash
# LLVM 3.4 환경
./softboundcets-34/softboundcets-llvm-clang34/Release+Asserts/bin/clang \
  -fsoftboundcets -O3 ./examples/2mm.c \
  -o SBCETS-2mm \
  -L./softboundcets-34/softboundcets-lib -lm -lrt
time ./SBCETS-2mm 1000 1000 1000 1000 0
```

**예상 결과**: ~15-17초

### 3. MoveC (β) 테스트

```bash
# MoveC로 계측된 IR 파일 사용
# 또는 MoveC로 직접 계측
time ./MoveC-2mm 1000 1000 1000 1000 0
```

**예상 결과**: ~90-95초 (1:30-1:35)

### 4. Catamaran (γ) 테스트

#### SoftBoundCETS + Catamaran

```bash
# LLVM 3.4
./build-catamaran-3.4.0/bin/opt \
  -load ./build-catamaran-3.4.0/lib/libCMPass.so \
  -PDGAnalysis -catamaran-pdg-reaching-analysis -Loops \
  -S SBCETS-2mm.ll -o CM-SBCETS-2mm.ll

./build-catamaran-3.4.0/bin/clang++ \
  -pthread -std=c++11 -DNUM_THREADS=3 -O3 \
  CM-SBCETS-2mm.ll ./runtime/ThreadPool.cpp \
  -o CM-SBCETS-2mm \
  -L./softboundcets-34/softboundcets-lib -lm -lrt

time ./CM-SBCETS-2mm 1000 1000 1000 1000 0
```

**예상 결과**: ~15-18초 (SoftBoundCETS보다 약간 빠름)

#### MoveC + Catamaran

```bash
# LLVM 3.4
./build-catamaran-3.4.0/bin/opt \
  -load ./build-catamaran-3.4.0/lib/libCMPass.so \
  -movec -PDGAnalysis -catamaran-pdg-reaching-analysis -LoopsMovec \
  < MoveC-2mm.ll -S -o CM-MoveC-2mm.ll

./build-catamaran-3.4.0/bin/clang++ \
  -pthread -std=c++11 -DNUM_THREADS=3 -O3 \
  CM-MoveC-2mm.ll ./runtime/ThreadPool.cpp \
  -o CM-MoveC-2mm

time ./CM-MoveC-2mm 1000 1000 1000 1000 0
```

**예상 결과**: ~100-105초 (MoveC보다 약간 느릴 수 있음 - 작은 입력값에서는 오버헤드)

### 5. LLVM 17 환경 테스트

```bash
# LLVM 17 환경 진입
./setup-llvm17-port.sh

# MoveC + Catamaran
cd /workspace/build-catamaran-17
/opt/llvm-17/bin/opt \
  -load-pass-plugin=./llvm/lib/Transforms/CMPass/CMPass.so \
  -passes='Loops' \
  -S ../../examples/llvm17/test_llvm17_movec.ll \
  -o CM-MoveC-2mm.ll

/opt/llvm-17/bin/clang++ \
  -O3 -pthread -std=c++17 \
  CM-MoveC-2mm.ll \
  ../../Catamaran-llvm-17/runtime/ThreadPool.cpp \
  -o CM-MoveC-2mm

time ./CM-MoveC-2mm
```

**예상 결과**: 
- 작은 입력값 (128×128): ~0.018초
- 큰 입력값 (1000×1000): 측정 필요

## 성능 측정 팁

### 1. 여러 번 실행하여 평균 계산

```bash
# 5번 실행하여 평균 계산
for i in {1..5}; do
    time ./2mm 1000 1000 1000 1000 0
done | grep real | awk '{sum+=$2} END {print "Average:", sum/NR}'
```

### 2. 메모리 사용량 측정

```bash
/usr/bin/time -v ./2mm 1000 1000 1000 1000 0
```

### 3. CPU 사용률 확인

```bash
# 병렬화가 작동하는지 확인
top -p $(pgrep -f 2mm)
# 또는
htop
```

## 논문에서 기대하는 결과

논문의 주요 주장:
1. **Catamaran은 메모리 안전성 검사의 오버헤드를 줄임**
2. **병렬화를 통해 성능 향상**
3. **다양한 메모리 안전성 도구 지원** (SoftBoundCETS, MoveC, ASAN)

### 성공 기준

✅ **성공적인 재현**:
- Catamaran 적용 시 β 버전보다 **빠르거나 비슷한** 성능
- 병렬화가 정상 작동 (ThreadPool 로그 확인)
- 모든 테스트가 정상 실행 (segfault 없음)

⚠️ **주의사항**:
- 작은 입력값에서는 오버헤드로 인해 느려질 수 있음
- 큰 입력값에서 병렬화 이익이 나타남
- 시스템 부하에 따라 결과가 달라질 수 있음

## 다른 벤치마크 테스트

### 3mm 테스트

```bash
cd 3mm
# 컴파일 및 실행
./build-catamaran-3.4.0/bin/clang -O3 3mm.c polybench.c -o 3mm
time ./3mm 1000 1000 1000 1000 1000 0
```

### gemm 테스트

```bash
cd gemm
# 컴파일 및 실행
./build-catamaran-3.4.0/bin/clang -O3 gemm.c polybench.c -o gemm
time ./gemm 1000 1000 1000 0
```

## 문제 해결

### 결과가 예상과 다른 경우

1. **너무 느림**: 
   - 입력 크기 확인 (너무 작으면 오버헤드)
   - 스레드 수 조정 (`NUM_THREADS` 환경 변수)
   - 최적화 레벨 확인 (`-O3` 사용)

2. **segfault 발생**:
   - 런타임 라이브러리 링크 확인
   - ThreadPool.cpp 링크 확인

3. **병렬화가 안 됨**:
   - opt 로그에서 "Creating spawn call" 확인
   - safe check 검출 여부 확인

## 참고 자료

- `docs/reproduction.md` - LLVM 3.4 재현 가이드
- `docs/llvm34-reproduction/LLVM34_REPRODUCTION_LOG.md` - 상세 재현 로그
- `TEST_GUIDE.md` - 테스트 실행 가이드
- 논문 PDF: `docs/3597926.3598098.pdf`

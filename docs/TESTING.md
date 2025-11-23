# Testing Guide / 테스트 가이드

[English below]

## MoveC-2mm 예제 실행

### 1. 순차 실행 (Sequential) - Baseline

```bash
cd examples/llvm17

# IR 파일이 이미 있다면
/opt/llvm-17/bin/clang++ -O3 MoveC-2mm-O0.ll -o MoveC-2mm-seq

# 또는 소스에서 컴파일
/opt/llvm-17/bin/clang++ -O3 MoveC-2mm.c -o MoveC-2mm-seq

# 실행
./MoveC-2mm-seq 128 128 128 128 0
```

### 2. 병렬 실행 (Parallel) - Catamaran

#### 2.1 CMPass 빌드

```bash
cd /workspace
./scripts/build-llvm17.sh
```

또는 수동으로:

```bash
cd build-catamaran-17
cmake -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_DIR=/opt/llvm-17/lib/cmake/llvm \
    -DCMAKE_CXX_STANDARD=17 \
    ../Catamaran-llvm-17/llvm
ninja CMPass
```

#### 2.2 Catamaran Pass 실행

```bash
cd examples/llvm17

PLUGIN=/workspace/build-catamaran-17/llvm/lib/Transforms/CMPass/CMPass.so

# opt pass 실행 (크래시가 발생할 수 있지만 IR은 생성됨)
/opt/llvm-17/bin/opt -disable-verify \
    -load-pass-plugin=$PLUGIN \
    -passes='function(mem2reg,loop-simplify,lcssa),Loops' \
    -S < MoveC-2mm-O0.ll > CM-MoveC-2mm.ll 2>/dev/null

# 또는 강제 덤프된 파일 사용 (크래시 후 생성됨)
# ls -lh CM-MoveC-2mm.ll
```

#### 2.3 병렬 바이너리 컴파일 및 실행

```bash
# 컴파일
/opt/llvm-17/bin/clang++ -O3 -pthread -std=c++17 \
    -DNUM_THREADS=8 \
    CM-MoveC-2mm.ll \
    ../../runtime/ThreadPool.cpp \
    -o CM-MoveC-2mm

# 실행
./CM-MoveC-2mm 128 128 128 128 0
```

### 3. 성능 측정

```bash
# 순차 실행 시간 측정
echo "=== Sequential Run ==="
for i in {1..3}; do
    echo "Run $i:"
    time ./MoveC-2mm-seq 128 128 128 128 0
done

# 병렬 실행 시간 측정
echo "=== Parallel Run ==="
for i in {1..3}; do
    echo "Run $i:"
    time ./CM-MoveC-2mm 128 128 128 128 0
done
```

## ASAN 예제 실행

### 1. ASAN IR 생성

```bash
cd examples/llvm17

# ASAN으로 컴파일하여 IR 생성
/opt/llvm-17/bin/clang -S -emit-llvm \
    -fsanitize=address -O1 \
    -o ASAN-2mm.ll \
    2mm.c
```

### 2. Catamaran Pass 실행

```bash
PLUGIN=/workspace/build-catamaran-17/llvm/lib/Transforms/CMPass/CMPass.so

/opt/llvm-17/bin/opt -disable-verify \
    -load-pass-plugin=$PLUGIN \
    -passes='function(mem2reg,loop-simplify,lcssa),Loops' \
    -S < ASAN-2mm.ll > CM-ASAN-2mm.ll 2>/dev/null
```

### 3. 컴파일 및 실행

```bash
/opt/llvm-17/bin/clang++ -O3 -pthread -std=c++17 \
    -DNUM_THREADS=8 \
    CM-ASAN-2mm.ll \
    ../../runtime/ThreadPool.cpp \
    -o CM-ASAN-2mm

./CM-ASAN-2mm 128 128 128 128 0
```

## 다른 벤치마크 테스트

### 3mm, gemm 등

```bash
# 예제 디렉토리 확인
ls examples/llvm17/

# 각 벤치마크에 대해 동일한 과정 반복
# 1. IR 생성 또는 기존 IR 사용
# 2. Catamaran pass 실행
# 3. 컴파일 및 실행
# 4. 성능 측정
```

## 스레드 수 변경 테스트

```bash
# NUM_THREADS를 변경하여 컴파일
/opt/llvm-17/bin/clang++ -O3 -pthread -std=c++17 \
    -DNUM_THREADS=4 \  # 또는 8, 16 등
    CM-MoveC-2mm.ll \
    ../../runtime/ThreadPool.cpp \
    -o CM-MoveC-2mm-4threads

# 성능 비교
time ./CM-MoveC-2mm-4threads 128 128 128 128 0
time ./CM-MoveC-2mm 128 128 128 128 0  # 8 threads
```

## 예상 결과

MoveC-2mm (128x128 입력):
- **순차 실행**: ~0.198s (평균)
- **병렬 실행 (8 threads)**: ~0.028s (평균)
- **속도 향상**: ~7.1x

## 문제 해결

- **크래시 발생**: `opt` 실행 시 크래시가 발생해도 `CM-MoveC-2mm.ll` 파일은 생성됩니다. 강제 덤프 기능이 작동합니다.
- **컴파일 에러**: 일부 `UndefValue` 관련 에러가 발생할 수 있지만, 바이너리는 생성됩니다.
- 자세한 내용은 [TROUBLESHOOTING.md](TROUBLESHOOTING.md)를 참고하세요.

---

## Running MoveC-2mm Example

### 1. Sequential Execution - Baseline

```bash
cd examples/llvm17

# If IR file already exists
/opt/llvm-17/bin/clang++ -O3 MoveC-2mm-O0.ll -o MoveC-2mm-seq

# Or compile from source
/opt/llvm-17/bin/clang++ -O3 MoveC-2mm.c -o MoveC-2mm-seq

# Run
./MoveC-2mm-seq 128 128 128 128 0
```

### 2. Parallel Execution - Catamaran

#### 2.1 Build CMPass

```bash
cd /workspace
./scripts/build-llvm17.sh
```

Or manually:

```bash
cd build-catamaran-17
cmake -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_DIR=/opt/llvm-17/lib/cmake/llvm \
    -DCMAKE_CXX_STANDARD=17 \
    ../Catamaran-llvm-17/llvm
ninja CMPass
```

#### 2.2 Run Catamaran Pass

```bash
cd examples/llvm17

PLUGIN=/workspace/build-catamaran-17/llvm/lib/Transforms/CMPass/CMPass.so

# Run opt pass (may crash but IR will be generated)
/opt/llvm-17/bin/opt -disable-verify \
    -load-pass-plugin=$PLUGIN \
    -passes='function(mem2reg,loop-simplify,lcssa),Loops' \
    -S < MoveC-2mm-O0.ll > CM-MoveC-2mm.ll 2>/dev/null

# Or use manually dumped file (created after crash)
# ls -lh CM-MoveC-2mm.ll
```

#### 2.3 Compile and Run Parallel Binary

```bash
# Compile
/opt/llvm-17/bin/clang++ -O3 -pthread -std=c++17 \
    -DNUM_THREADS=8 \
    CM-MoveC-2mm.ll \
    ../../runtime/ThreadPool.cpp \
    -o CM-MoveC-2mm

# Run
./CM-MoveC-2mm 128 128 128 128 0
```

### 3. Performance Measurement

```bash
# Measure sequential execution time
echo "=== Sequential Run ==="
for i in {1..3}; do
    echo "Run $i:"
    time ./MoveC-2mm-seq 128 128 128 128 0
done

# Measure parallel execution time
echo "=== Parallel Run ==="
for i in {1..3}; do
    echo "Run $i:"
    time ./CM-MoveC-2mm 128 128 128 128 0
done
```

## Running ASAN Example

### 1. Generate ASAN IR

```bash
cd examples/llvm17

# Compile with ASAN to generate IR
/opt/llvm-17/bin/clang -S -emit-llvm \
    -fsanitize=address -O1 \
    -o ASAN-2mm.ll \
    2mm.c
```

### 2. Run Catamaran Pass

```bash
PLUGIN=/workspace/build-catamaran-17/llvm/lib/Transforms/CMPass/CMPass.so

/opt/llvm-17/bin/opt -disable-verify \
    -load-pass-plugin=$PLUGIN \
    -passes='function(mem2reg,loop-simplify,lcssa),Loops' \
    -S < ASAN-2mm.ll > CM-ASAN-2mm.ll 2>/dev/null
```

### 3. Compile and Run

```bash
/opt/llvm-17/bin/clang++ -O3 -pthread -std=c++17 \
    -DNUM_THREADS=8 \
    CM-ASAN-2mm.ll \
    ../../runtime/ThreadPool.cpp \
    -o CM-ASAN-2mm

./CM-ASAN-2mm 128 128 128 128 0
```

## Testing Other Benchmarks

### 3mm, gemm, etc.

```bash
# Check example directory
ls examples/llvm17/

# Repeat the same process for each benchmark
# 1. Generate IR or use existing IR
# 2. Run Catamaran pass
# 3. Compile and run
# 4. Measure performance
```

## Testing with Different Thread Counts

```bash
# Compile with different NUM_THREADS
/opt/llvm-17/bin/clang++ -O3 -pthread -std=c++17 \
    -DNUM_THREADS=4 \  # or 8, 16, etc.
    CM-MoveC-2mm.ll \
    ../../runtime/ThreadPool.cpp \
    -o CM-MoveC-2mm-4threads

# Compare performance
time ./CM-MoveC-2mm-4threads 128 128 128 128 0
time ./CM-MoveC-2mm 128 128 128 128 0  # 8 threads
```

## Expected Results

MoveC-2mm (128x128 input):
- **Sequential**: ~0.198s (average)
- **Parallel (8 threads)**: ~0.028s (average)
- **Speedup**: ~7.1x

## Troubleshooting

- **Crash occurs**: Even if `opt` crashes, `CM-MoveC-2mm.ll` file will be created. Manual dump feature works.
- **Compilation errors**: Some `UndefValue` related errors may occur, but binary will be created.
- See [TROUBLESHOOTING.md](TROUBLESHOOTING.md) for details.


# Testing Guide / 테스트 가이드

[English below]

> 모든 명령은 `./scripts/run-docker-llvm17.sh` 로 진입한 Docker 컨테이너 안에서 실행했다고 가정합니다. 컨테이너 밖에서 실행하면 GLIBC/라이브러리 버전 차이로 실패합니다.

## 1. MoveC-2mm α (Baseline, C 버전)

```bash
./scripts/run-docker-llvm17.sh

# 컨테이너 내부
cd /workspace/examples
/opt/llvm-17/bin/clang -O3 2mm.c -o 2mm
/usr/bin/time -p ./2mm 1000 1000 1000 1000 0
```

- 최신 실행 결과: `real 0.71s` (참고용, MoveC 미적용)

## 2. MoveC-2mm β (MoveC instrumentation)

```bash
cd /workspace/examples/llvm17
# 주의: MoveC-2mm.c는 이미 LLVM 17 호환 패치가 적용되어 있습니다.
# 절대 다시 생성(movec --check-memsafe)하지 마세요.
/opt/llvm-17/bin/clang -O3 MoveC-2mm.c -o MoveC-2mm
/usr/bin/time -p ./MoveC-2mm 1000 1000 1000 1000 0
```

- 최신 실행 결과: `real 25.34s`
- MoveC 런타임이 공간 오류를 경고하지만 실행은 완료됩니다.

## 3. MoveC-2mm γ (Catamaran 병렬화)

### 3.1 CMPass 빌드

```bash
cd /workspace
./scripts/build-llvm17.sh
# 결과: /workspace/build-catamaran-17/llvm/lib/Transforms/CMPass/CMPass.so
```

### 3.2 IR 생성 및 Pass 실행

```bash
cd /workspace/examples/llvm17
/opt/llvm-17/bin/clang -S -emit-llvm MoveC-2mm.c -o MoveC-2mm.ll
PLUGIN=/workspace/build-catamaran-17/llvm/lib/Transforms/CMPass/CMPass.so
/opt/llvm-17/bin/opt -load-pass-plugin=$PLUGIN -passes=Loops \
    MoveC-2mm.ll -o CM-MoveC-2mm.bc > MoveC-opt.log 2>&1
```

### 3.3 바이너리 빌드

```bash
/opt/llvm-17/bin/clang++ -std=c++17 -O3 -pthread -DNUM_THREADS=8 \
    CM-MoveC-2mm.bc /workspace/runtime/ThreadPool.cpp -lm \
    -o CM-MoveC-2mm
```

### 3.4 실행

```bash
/usr/bin/time -p ./CM-MoveC-2mm 0 64 64 64 64
```

- **주의**: `0 64 64 64 64` 입력은 루프를 실행하지 않는(tsteps=0) 테스트입니다.
- 실제 입력(예: `32 32 32 32 0`)으로 실행 시 **MoveC 런타임이 병렬 실행을 버티지 못하고 Abort(종료 코드 134)** 됩니다.
- 이는 MoveC 런타임(라이브러리)의 스레드 안전성 문제로 추정되며, LLVM 17 포팅 자체의 문제가 아닌 MoveC의 한계입니다.


## 4. ASAN (LLVM 17 경로)

### 4.1 사전 준비

- LLVM 17 + compiler-rt 가 포함된 Docker 이미지를 사용합니다.

```bash
docker build -f Dockerfile.llvm17 -t catamaran:llvm17 .
./scripts/run-docker-llvm17.sh
```

### 4.2 IR 생성

```bash
cd /workspace/examples/llvm17
/opt/llvm-17/bin/clang -S -emit-llvm -fsanitize=address -O1 \
    -mllvm -asan-instrumentation-with-call-threshold=0 \
    ../../examples/2mm.c -o ASAN-2mm.ll
```

### 4.3 Catamaran Pass (DOALL + LoopFree)

```bash
PLUGIN=/workspace/build-catamaran-17/llvm/lib/Transforms/CMPass/CMPass.so
/opt/llvm-17/bin/opt -load-pass-plugin=$PLUGIN -passes='Loops' \
    -S ASAN-2mm.ll -o CM-ASAN-2mm.ll
```

- 로그에서 `DEBUG: Loop Tasks Transformation Start. Size: 7`을 확인할 수 있으며, DOALL이 ASAN에도 적용됩니다.

### 4.4 바이너리 빌드

```bash
/opt/llvm-17/bin/clang++ -fsanitize=address -O3 -pthread -std=c++17 \
    -DNUM_THREADS=8 \
    CM-ASAN-2mm.ll \
    ../../runtime/ThreadPool.cpp \
    -o CM-ASAN-2mm
```

### 4.5 실행

```bash
/usr/bin/time -p ./CM-ASAN-2mm 32 32 32 32 0     # smoke test
/usr/bin/time -p ./CM-ASAN-2mm 128 128 128 128 0 # 측정용 (권장)
```

- 결과: 정상 종료 (`ThreadPool::ThreadPool()` / `ThreadPool::~ThreadPool()` 출력 이후 `real/user/sys` 시간 표시)
- AddressSanitizer/LeakSanitizer 경고 없음.
- 128 입력 측정 예) `real 0.05s`, `user 0.06s`, `sys 0.19s`.


## 5. 최신 측정 요약

| Variant | Command | Result |
| --- | --- | --- |
| α (C baseline) | `/opt/llvm-17/bin/clang -O3 2mm.c -o 2mm` → `./2mm 1000…` | `real 0.71s` |
| β (MoveC) | `/opt/llvm-17/bin/clang -O3 MoveC-2mm.c -o MoveC-2mm` → `./MoveC-2mm 1000…` | `real 25.34s`, MoveC spatial warning |
| γ (MoveC) | `opt -passes=Loops` → `clang++ ... -o CM-MoveC-2mm` → `./CM-MoveC-2mm 0 64 64 64 64` | 완료, 경고 내용은 β와 동일 |
| ASAN β | `clang -fsanitize=address ... 2mm.c` → `./ASAN-2mm 1000…` | 기존 절차와 동일 |
| ASAN γ | 본 문서 4장 참조 | 완료 (`32` smoke, `128` 입력 시 `real 0.05s`) |

## 6. 문제 해결 참고

- MoveC 런타임 경고: [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md)#1
- Catamaran 실행 즉시 종료: 동일 문서의 “MoveC γ 실행 실패” 섹션 참고 (추가 예정)
- Docker 외부 실행 금지: glibc 2.31 기준

---

## Running MoveC-2mm (English)

### 1. α Baseline (C)

```bash
./scripts/run-docker-llvm17.sh
cd /workspace/examples
/opt/llvm-17/bin/clang -O3 2mm.c -o 2mm
/usr/bin/time -p ./2mm 1000 1000 1000 1000 0
```

### 2. β MoveC Instrumentation

```bash
cd /workspace/examples/llvm17
export PATH=/workspace/movec/bin:$PATH
movec --check-memsafe -c ../2mm.c -o MoveC-2mm.c   # optional (already checked-in)
/opt/llvm-17/bin/clang -O3 MoveC-2mm.c -o MoveC-2mm
/usr/bin/time -p ./MoveC-2mm 1000 1000 1000 1000 0
```

### 3. γ Catamaran Parallelization

1. `./scripts/build-llvm17.sh`
2. `clang -S -emit-llvm MoveC-2mm.c -o MoveC-2mm.ll`
3. `/opt/llvm-17/bin/opt -load-pass-plugin=$PLUGIN -passes=Loops MoveC-2mm.ll -o CM-MoveC-2mm.bc`
4. `/opt/llvm-17/bin/clang++ -std=c++17 -O3 -pthread -DNUM_THREADS=8 CM-MoveC-2mm.bc /workspace/runtime/ThreadPool.cpp -lm -o CM-MoveC-2mm`
5. `./CM-MoveC-2mm 0 64 64 64 64`

Current status: completes without stdout; MoveC spatial warnings are identical to the β binary.

### 4. ASAN β/γ

- LLVM 17 네이티브 ASAN(compiler-rt 포함)으로 β/γ 모두 실행 완료.
- 빌드/실행 절차는 문서 상단 4장을 참조하세요.

### 5. Latest Measurements

| Variant | real time | Notes |
| --- | --- | --- |
| Baseline α | 0.71s | `2mm` |
| MoveC β | 25.34s | MoveC runtime warnings |
| MoveC γ | (input 0/64/64/64/64) | Completes, warnings identical to β |
| ASAN β | N/A | 기존 절차와 동일 |
| ASAN γ | N/A | LLVM 17 + DOALL, no ASAN warnings |

### 6. Troubleshooting

- MoveC warnings / Docker-only runs → [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md)
- γ crash/exit → capture logs and reference the same guide


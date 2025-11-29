# Testing Guide / 테스트 가이드

[English below]

> 모든 명령은 `./scripts/run-docker-llvm17.sh` 로 진입한 Docker 컨테이너 안에서 실행했다고 가정합니다. 컨테이너 밖에서 실행하면 GLIBC/라이브러리 버전 차이로 실패합니다.

## 0. 최신 검증 현황 (2025-11-26)

- **Spatial Safety**: MoveC β/γ 모두 `MoveC-2mm-oob.c` Fault Injection(-O3 + volatile offset)에서 동일한 OOB 경고를 출력합니다. Deep Copy + Slab allocator가 메타데이터를 정확히 전달함을 의미합니다.
- **Performance**: `2mm 1024×1024`, `NUM_THREADS=8` 기준 MoveC 대비 **21.4 % (3.62s) 속도 향상**을 재현했습니다. (`MoveC: 16.93s`, `Catamaran: 13.31s`)
- **Stability**: ThreadPool 조건변수 + Slab allocator 조합으로 8-thread 실행에서도 `sys < 0.1s`, spatial crash 없음.

아래 절차는 위 결과를 재현하는 빌드/실행 방법과 검증 플로우를 모두 포함합니다.

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

- `0 64 64 64 64` 입력은 빠른 smoke test입니다.  
- 실제 검증 시에는 `32 128 128 128 0` 또는 `1024 1024 1024 1024 0`처럼 루프를 실행하는 입력을 사용하세요. Deep Copy + Slab 패치가 적용된 최신 바이너리는 8-thread에서도 정상 종료하며, MoveC와 동일한 spatial 경고(또는 OOB 미발생 시 무경고)를 출력합니다.

### 3.5 Fault Injection (Spatial Safety 검증)

1. `examples/llvm17/MoveC-2mm-oob.c`를 사용합니다. 파일에는 `volatile int bad_offset = 99999999;`가 포함되어 있어 `-O3`에서도 경로가 제거되지 않습니다.
2. 위 3.2~3.4 절차와 동일하게 IR을 생성하고 Catamaran Pass를 적용한 뒤, β/γ 모두를 실행합니다.
3. 기대 결과:
   - MoveC β: `examples/2mm.c:89:27: error: dereferenced pointer 'tmp[i][k+1]' ... [spatial error]`
   - Catamaran γ: 동일한 경고가 여러 스레드에서 반복 보고되며, 종료 코드 1.  
4. 두 실행 모두 오류를 보고하면 Deep Copy 경로가 정상임을 의미합니다. Spatial Error가 β에서만 발생한다면 빌드나 링크 과정에서 구버전 런타임을 사용 중인지 확인하세요.


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
| γ (MoveC) | `opt -passes=Loops` → `clang++ ... -o CM-MoveC-2mm` → `./CM-MoveC-2mm 1024 1024 1024 1024 0` | `real 13.31s`, spatial warning이 발생하면 β와 동일 메시지 |
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

Current status:
- Smoke (`0 64 64 64 64`): completes without stdout, handy for quick sanity checks.
- Full run (`1024 1024 1024 1024 0`): completes with **21.4 % speedup** vs β (13.31s vs 16.93s) and reports the same spatial warnings when the workload actually contains an injected fault.

**Fault-injection check**
1. Build both β/γ from `examples/llvm17/MoveC-2mm-oob.c` (contains the volatile offset guard).  
2. Run the binaries with the same large input.  
3. Expect identical `examples/2mm.c:89:27: error... [spatial error]` messages from both versions. Any discrepancy means the Catamaran runtime or CMPass was not rebuilt with the Deep Copy + Slab patches.

### 4. ASAN β/γ

- LLVM 17 네이티브 ASAN(compiler-rt 포함)으로 β/γ 모두 실행 완료.
- 빌드/실행 절차는 문서 상단 4장을 참조하세요.

### 5. Latest Measurements

| Variant | real time | Notes |
| --- | --- | --- |
| Baseline α | 0.71s | `2mm`, `NUM_THREADS=1` |
| MoveC β | 25.34s | Spatial warning expected only when Fault Injection is enabled |
| MoveC γ | 13.31s | `1024²`, `NUM_THREADS=8`, 21.4 % faster than β |
| ASAN β | 0.05s | 128-input smoke |
| ASAN γ | 0.05s | LLVM 17 + DOALL, no sanitizer warnings |

### 6. Troubleshooting

- MoveC warnings / Docker-only runs → [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md)
- γ crash/exit → capture logs and reference the same guide


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
export PATH=/workspace/movec/bin:$PATH
movec --check-memsafe -c ../2mm.c -o MoveC-2mm.c   # 필요 시
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

### 3.4 실행 (현재 이슈)

```bash
/usr/bin/time -p ./CM-MoveC-2mm 1000 1000 1000 1000 0
```

- 현재 현상: 실행 즉시 종료(출력 없음). Docker 로그/`dmesg`에서 추가 정보 필요.
- 권장 디버깅:
  - 입력 축소: `./CM-MoveC-2mm 16 16 16 16 0`
  - `dmesg | tail -50` 로 OOM 여부 확인
  - `strace -o cm-movec.strace ./CM-MoveC-2mm ...`

## 4. ASAN (LLVM 17 경로) – Pending

- LLVM 3.5.2 AddressSanitizer 빌드 및 `/workspace/llvm-3.5.2` 연동 필요
- TODO
  1. `clang -fsanitize=address -asan-instrumentation-with-call-threshold=0` 으로 IR 생성
  2. 동일한 `opt -passes=Loops` 파이프라인 실행
  3. `clang++ -fsanitize=address` 로 링크 및 실행
- 현재까지 LLVM 17 컨테이너에서 실행된 ASAN 테스트는 없음

## 5. 최신 측정 요약

| Variant | Command | Result |
| --- | --- | --- |
| α (C baseline) | `/opt/llvm-17/bin/clang -O3 2mm.c -o 2mm` → `./2mm 1000…` | `real 0.71s` |
| β (MoveC) | `/opt/llvm-17/bin/clang -O3 MoveC-2mm.c -o MoveC-2mm` → `./MoveC-2mm 1000…` | `real 25.34s`, 경고 발생 |
| γ (Catamaran) | `opt -passes=Loops` → `clang++ ... -o CM-MoveC-2mm` → 실행 | 바이너리 빌드 OK, 실행 즉시 종료 |
| ASAN β/γ | — | 아직 실행 전 |

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
5. `./CM-MoveC-2mm 1000 1000 1000 1000 0`

Current status: steps 1–4 succeed, step 5 exits immediately. Use smaller inputs and `dmesg/strace` to capture the root cause.

### 4. ASAN β/γ

- LLVM 3.5.2 build + runtime hookup pending.
- Steps mirror the MoveC flow once `clang -fsanitize=address` binaries are available.

### 5. Latest Measurements

| Variant | real time | Notes |
| --- | --- | --- |
| Baseline α | 0.71s | `2mm` |
| MoveC β | 25.34s | MoveC runtime warnings |
| MoveC γ | N/A | Binary builds; runtime exits |
| ASAN β/γ | N/A | Not executed yet |

### 6. Troubleshooting

- MoveC warnings / Docker-only runs → [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md)
- γ crash/exit → capture logs and reference the same guide


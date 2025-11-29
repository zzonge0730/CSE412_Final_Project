# Troubleshooting Guide / 문제 해결 가이드

[English below]

## 자주 발생하는 문제

### 1. MoveC 런타임이 공간 오류를 보고함

**증상**:
```bash
examples/2mm.c:82:35: error: dereferenced pointer 'A[i][k]' ... [spatial error]
double free or corruption (!prev)
```

**현재 상태 (2025-11-25 이후 빌드)**  
Deep Copy + Slab Allocator 패치가 기본 적용되어 `__RV_pmd` 메타데이터가 태스크별 전용 버퍼에 복사됩니다. 따라서 최신 CMPass와 런타임을 사용한다면 MoveC의 Spatial Error는 **실제 OOB/Temporal 오류**를 의미합니다.

**원인이 될 수 있는 경우**
1. **구버전 빌드 사용**: 2025-11-24 이전에 빌드된 CMPass.so 또는 ThreadPool을 사용 중.  
2. **런타임/패스 버전 불일치**: 최신 `__catamaran_alloc_env`/`__catamaran_reset_slab` 심볼이 없는 ThreadPool과 새 CMPass를 혼합 링크.  
3. **실제 버그**: OOB 인젝션 테스트처럼 진짜 오류가 존재.

**확인 절차**
1. `nm runtime/ThreadPool.cpp.o | grep __catamaran_alloc_env` 로 Slab Allocator 심볼이 있는지 확인.  
2. `opt -load-pass-plugin ... -passes=Loops --version` 을 실행해 2025-11-25 이후 커밋인지 확인.  
3. `examples/llvm17/MoveC-2mm-oob.c` + `volatile` 오프셋 테스트를 돌려 Catamaran이 Fault Injection을 잡는지 확인 (성공 시 Deep Copy 정상 동작).  
4. 여전히 Spatial Error가 뜬다면 IR에서 대상 포인터와 메타데이터 쌍이 모두 `env`에 들어갔는지 (`grep "_RV_pmd" CM-*.ll`) 점검.

**과거 이슈 기록**  
이전 버전에서는 DOALL 태스크가 메타데이터를 전달하지 못해 모든 접근이 거짓 양성으로 판정되었습니다. 자세한 배경은 [docs/llvm17-port/MOVEC_METADATA_ISSUE.md](llvm17-port/MOVEC_METADATA_ISSUE.md)에서 확인할 수 있습니다.

### 2. MoveC γ 실행이 즉시 종료됨

**증상**:
```bash
/usr/bin/time -p ./CM-MoveC-2mm 1000 1000 1000 1000 0
# 출력 없이 종료, 때때로 컨테이너가 바로 빠져나옴
```

**가능한 원인**:
- MoveC 런타임이 내부에서 `exit()` 호출 (공간 오류 후)
- 입력 크기가 커서 OOM Killer 개입
- ThreadPool 초기화 중 단 asserted (로그 미출력)

**진단 절차**:
1. 입력 축소: `./CM-MoveC-2mm 16 16 16 16 0`
2. `dmesg | tail -50` 로 OOM/EVENT 확인
3. `strace -f -o cm-movec.strace ./CM-MoveC-2mm ...`
4. ThreadPool에 임시 로그 추가 (`ThreadPool.cpp`) 후 재빌드

**우회**:
- 먼저 α/β 타이밍을 확보하고, γ는 위 단계를 진행 중이라고 README/STATUS에 명시한다.
- 필요 시 MoveC 대신 다른 PolyBench 커널로 교차 검증한다.

### 2. Docker 밖에서 실행 시 라이브러리 오류

**증상**:
```bash
./CM-MoveC-2mm: error while loading shared libraries: libc++.so: cannot open shared object file
```

**원인**: Catamaran 바이너리는 Docker 이미지 안의 `/opt/llvm-17` 및 GLIBC 버전에 맞춰 빌드된다. 호스트 환경에서 직접 실행하면 필요한 라이브러리를 찾지 못한다.

**해결 방법**:
- `./scripts/run-docker-llvm17.sh` 로 컨테이너에 진입한 뒤 모든 명령을 실행한다.
- 실행 파일을 호스트로 복사해야 한다면 동일한 LLVM/GLIBC 조합을 갖춘 환경에서만 실행한다.

### 3. Docker 이미지 빌드 실패

**증상**:
```bash
docker build failed
```

**가능한 원인 및 해결**:
- **디스크 공간 부족**: 최소 10GB 필요
- **메모리 부족**: 최소 4GB RAM 필요
- **네트워크 문제**: LLVM 소스 다운로드 실패 시 재시도

**해결 방법**:
```bash
# 디스크 공간 확인
df -h

# Docker 이미지 정리
docker system prune -a

# 재빌드
docker build -f docker/Dockerfile.llvm17 -t catamaran:llvm17 .
```

### 4. CMPass 플러그인 로드 실패

**증상**:
```bash
Failed to load passes from 'CMPass.so'
```

**원인 및 해결**:
- **경로 문제**: 절대 경로 사용 확인
- **빌드 실패**: CMPass가 제대로 빌드되었는지 확인
- **의존성 문제**: LLVM 라이브러리 경로 확인

**해결 방법**:
```bash
# 빌드 확인
ls -lh build-catamaran-17/llvm/lib/Transforms/CMPass/CMPass.so

# 플러그인 로드 테스트
/opt/llvm-17/bin/opt -load-pass-plugin=/workspace/build-catamaran-17/llvm/lib/Transforms/CMPass/CMPass.so -help | grep Loops
```

### 5. Safe Check가 감지되지 않음

**증상**: 루프 내부의 safe check가 감지되지 않음

**원인**:
- 함수 이름 불일치 (예: `__RV_check_dpv_ss` vs `_RV_check_dpv_ss`)
- 최적화로 인한 safe check 제거

**해결 방법**:
- `-O0` 옵션으로 컴파일하여 IR 생성
- `Utils.cpp`의 감지 함수 확인
- 디버그 로그 확인

### 6. 성능 향상이 없음

**가능한 원인**:
- 입력 크기가 너무 작음
- 스레드 수가 적음
- 태스크 오버헤드가 작업량보다 큼

**해결 방법**:
- 더 큰 입력 크기로 테스트 (256x256, 512x512 등)
- 스레드 수 증가 (4, 8, 16)
- 성능 프로파일링

### 7. 런타임 에러: Segmentation fault

**증상**:
```bash
Segmentation fault (core dumped)
```

**가능한 원인**:
- MoveC 메모리 접근 오류
- ThreadPool 초기화 문제
- 배열 크기 문제

**해결 방법**:
- 입력 크기 감소하여 테스트
- MoveC 오류 메시지 확인
- 디버거 사용 (`gdb`)

## 디버깅 팁

### 1. 디버그 로그 활성화

`Loops.cpp`에서 디버그 출력 확인:
```cpp
errs() << "DEBUG: ..." << "\n";
```

### 2. IR 파일 검사

```bash
# 생성된 IR 파일 확인
cat CM-MoveC-2mm.ll | grep -E "(call|@__RV_check|@__asan_)"

# Safe check 개수 확인
grep -c "__RV_check_dpv_ss" CM-MoveC-2mm.ll
```

### 3. 플러그인 심볼 확인

```bash
nm -D build-catamaran-17/llvm/lib/Transforms/CMPass/CMPass.so | grep llvmGetPassPluginInfo
```

### 4. LLVM 버전 확인

```bash
/opt/llvm-17/bin/opt --version
/opt/llvm-17/bin/clang++ --version
```

## 성능 문제

### 병렬화가 제대로 작동하지 않음

**확인 사항**:
1. 태스크가 생성되었는지 확인
2. ThreadPool이 초기화되었는지 확인
3. 스레드 수 설정 확인 (`NUM_THREADS`)

**디버깅**:
```bash
# ThreadPool 로그 확인
export NUM_THREADS=8
./CM-MoveC-2mm 128 128 128 128 0
```

## 환경 문제

### GLIBC 버전 불일치

**증상**: MoveC 바이너리가 실행되지 않음

**해결**: Docker 컨테이너 내에서 실행 (권장)

### 권한 문제

**증상**: 파일 생성/실행 권한 오류

**해결**:
```bash
chmod +x scripts/*.sh
chmod +x CM-MoveC-2mm
```

## 추가 도움말

- [LLVM 17 포팅 상태](llvm17-port/STATUS.md) - 알려진 이슈 확인
- [Safe Check 감지 분석](llvm17-port/SAFE_CHECK_DETECTION_ANALYSIS.md) - Safe Check 관련 문제
- [테스트 가이드](TESTING.md) - 예제 실행 방법

---

## Common Issues

### 1. MoveC runtime reports spatial errors

**Symptom**
```bash
examples/2mm.c:82:35: error: dereferenced pointer 'A[i][k]' ... [spatial error]
double free or corruption (!prev)
```

**Current expectation (post Deep Copy + Slab)**
The LLVM 17 port now deep-copies every `__RV_pmd` struct into a task-local buffer before launching workers. When built from the 2025-11-25 tag (`v1.0-spatial-safety-complete`), a spatial error indicates either an actual bug or a stale binary.

**Checklist**
1. Ensure `runtime/ThreadPool.cpp` exports `__catamaran_alloc_env` / `__catamaran_reset_slab`.  
2. Rebuild CMPass (`./scripts/build-llvm17.sh`) so `opt -passes=Loops --version` shows the latest date.  
3. Re-run the official OOB fault-injection sample (`MoveC-2mm-oob.c` with the volatile offset). Catamaran γ should emit the same spatial error as β, proving metadata propagation works.  
4. If errors persist, diff `CM-MoveC-2mm.ll` to confirm each pointer argument has a matching `_RV_pmd` live-in slot.

**Legacy note**
Older documentation referenced a DOALL metadata omission that caused thousands of false positives. That bug has been resolved; keep the note only for archaeology (see `llvm17-port/MOVEC_METADATA_ISSUE.md`).

### 2. MoveC γ binary exits immediately

**Symptom**:
```bash
/usr/bin/time -p ./CM-MoveC-2mm 1000 1000 1000 1000 0
# no output, process exits instantly (sometimes killed)
```

**Possible causes**:
- MoveC runtime calling `exit()` after raising spatial errors
- OOM killer due to large allocations
- ThreadPool initialization failure without stderr

**Debug steps**:
1. Try smaller inputs (`16 16 16 16 0`)
2. Check `dmesg | tail -50`
3. Run with `strace -f -o cm-movec.strace ...`
4. Add temporary logging inside `runtime/ThreadPool.cpp` and rebuild

**Workaround**:
- Record α/β timing first, mark γ as “pending investigation” in docs.
- Use an alternate kernel/ASAN test for cross-validation while MoveC debugging continues.

### 2. Binary fails to run outside Docker

**Symptom**:
```bash
./CM-MoveC-2mm: error while loading shared libraries: libc++.so: cannot open shared object file
```

**Cause**: The binaries are linked against the libraries shipped in the Docker images (`/opt/llvm-17`, matching glibc). Running them directly on the host misses those dependencies.

**Solution**:
- Enter the container via `./scripts/run-docker-llvm17.sh` and run all commands there.
- If the binary must run on the host, replicate the exact LLVM/glibc combination used inside the container.

### 3. Docker Image Build Failure

**Symptom**:
```bash
docker build failed
```

**Possible Causes and Solutions**:
- **Insufficient disk space**: Need at least 10GB
- **Insufficient memory**: Need at least 4GB RAM
- **Network issues**: Retry if LLVM source download fails

**Solution**:
```bash
# Check disk space
df -h

# Clean Docker images
docker system prune -a

# Rebuild
docker build -f docker/Dockerfile.llvm17 -t catamaran:llvm17 .
```

### 4. CMPass Plugin Load Failure

**Symptom**:
```bash
Failed to load passes from 'CMPass.so'
```

**Causes and Solutions**:
- **Path issue**: Check absolute path usage
- **Build failure**: Verify CMPass was built correctly
- **Dependency issue**: Check LLVM library path

**Solution**:
```bash
# Check build
ls -lh build-catamaran-17/llvm/lib/Transforms/CMPass/CMPass.so

# Test plugin loading
/opt/llvm-17/bin/opt -load-pass-plugin=/workspace/build-catamaran-17/llvm/lib/Transforms/CMPass/CMPass.so -help | grep Loops
```

### 5. Safe Check Not Detected

**Symptom**: Safe checks inside loops are not detected

**Causes**:
- Function name mismatch (e.g., `__RV_check_dpv_ss` vs `_RV_check_dpv_ss`)
- Safe checks removed by optimization

**Solution**:
- Compile with `-O0` to generate IR
- Check detection functions in `Utils.cpp`
- Check debug logs

### 6. No Performance Improvement

**Possible Causes**:
- Input size too small
- Too few threads
- Task overhead larger than workload

**Solution**:
- Test with larger input sizes (256x256, 512x512, etc.)
- Increase thread count (4, 8, 16)
- Performance profiling

### 7. Runtime Error: Segmentation fault

**Symptom**:
```bash
Segmentation fault (core dumped)
```

**Possible Causes**:
- MoveC memory access error
- ThreadPool initialization issue
- Array size issue

**Solution**:
- Test with reduced input size
- Check MoveC error messages
- Use debugger (`gdb`)

## Debugging Tips

### 1. Enable Debug Logs

Check debug output in `Loops.cpp`:
```cpp
errs() << "DEBUG: ..." << "\n";
```

### 2. Inspect IR Files

```bash
# Check generated IR file
cat CM-MoveC-2mm.ll | grep -E "(call|@__RV_check|@__asan_)"

# Count safe checks
grep -c "__RV_check_dpv_ss" CM-MoveC-2mm.ll
```

### 3. Check Plugin Symbols

```bash
nm -D build-catamaran-17/llvm/lib/Transforms/CMPass/CMPass.so | grep llvmGetPassPluginInfo
```

### 4. Check LLVM Version

```bash
/opt/llvm-17/bin/opt --version
/opt/llvm-17/bin/clang++ --version
```

## Performance Issues

### Parallelization Not Working Properly

**Check**:
1. Verify tasks were created
2. Verify ThreadPool was initialized
3. Check thread count setting (`NUM_THREADS`)

**Debugging**:
```bash
# Check ThreadPool logs
export NUM_THREADS=8
./CM-MoveC-2mm 128 128 128 128 0
```

## Environment Issues

### GLIBC Version Mismatch

**Symptom**: MoveC binary won't run

**Solution**: Run inside Docker container (recommended)

### Permission Issues

**Symptom**: File creation/execution permission errors

**Solution**:
```bash
chmod +x scripts/*.sh
chmod +x CM-MoveC-2mm
```

## Additional Help

- [LLVM 17 Porting Status](llvm17-port/STATUS.md) - Check known issues
- [Safe Check Detection Analysis](llvm17-port/SAFE_CHECK_DETECTION_ANALYSIS.md) - Safe Check related issues
- [Testing Guide](TESTING.md) - Example execution methods


# Troubleshooting Guide / 문제 해결 가이드

[English below]

## 자주 발생하는 문제

### 1. `opt` 실행 시 크래시 (Exit code 134)

**증상**:
```bash
opt: ... Assertion `materialized_use_empty() && "Uses remain when a value is destroyed!"' failed.
Aborted (core dumped)
```

**원인**: LLVM 17의 엄격한 검증으로 인해 `eraseSafeCheckCodes`에서 발생하는 use-after-free 문제

**해결 방법**:
- 크래시가 발생해도 `CM-MoveC-2mm.ll` 파일은 생성됩니다 (강제 덤프 기능)
- 생성된 IR 파일을 사용하여 컴파일 진행
- 이는 알려진 이슈이며 기능에는 영향을 주지 않습니다

**임시 해결책**:
```bash
# -disable-verify 옵션 사용
opt -disable-verify -load-pass-plugin=$PLUGIN -passes='...' ...
```

### 2. 컴파일 에러: `use of undefined value`

**증상**:
```bash
error: use of undefined value '%cmp14'
```

**원인**: `UndefValue`로 교체된 값이 여전히 사용되고 있음

**해결 방법**:
- 일부 에러가 발생해도 바이너리는 생성됩니다
- 생성된 바이너리로 실행 가능
- 완전한 해결을 위해서는 `eraseSafeCheckCodes` 로직 개선 필요

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

### 1. Crash when running `opt` (Exit code 134)

**Symptom**:
```bash
opt: ... Assertion `materialized_use_empty() && "Uses remain when a value is destroyed!"' failed.
Aborted (core dumped)
```

**Cause**: Use-after-free issue in `eraseSafeCheckCodes` due to LLVM 17's strict validation

**Solution**:
- Even if crash occurs, `CM-MoveC-2mm.ll` file will be created (manual dump feature)
- Use the generated IR file to compile
- This is a known issue and does not affect functionality

**Workaround**:
```bash
# Use -disable-verify option
opt -disable-verify -load-pass-plugin=$PLUGIN -passes='...' ...
```

### 2. Compilation Error: `use of undefined value`

**Symptom**:
```bash
error: use of undefined value '%cmp14'
```

**Cause**: Value replaced with `UndefValue` is still being used

**Solution**:
- Binary will be created despite some errors
- Generated binary can be executed
- Full solution requires improving `eraseSafeCheckCodes` logic

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


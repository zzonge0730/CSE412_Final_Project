# CMPass 로드 테스트 가이드

## 빌드 완료 ✅

빌드가 성공적으로 완료되었습니다:
- `lib/CMPass.so` 파일이 생성됨

## 다음 단계: opt에 로드 테스트

### 1. 라이브러리 위치 확인

```bash
ls -lh /workspace/build-catamaran-14/lib/libCMPass.so
file /workspace/build-catamaran-14/lib/libCMPass.so
```

### 2. 의존성 확인

```bash
ldd /workspace/build-catamaran-14/lib/libCMPass.so
```

### 3. 간단한 테스트 IR 파일 생성

```bash
cat > /tmp/test.ll << 'EOF'
define i32 @main() {
  entry:
    ret i32 0
}
EOF
```

### 4. opt에 로드 테스트

```bash
/opt/llvm-14/bin/opt -load-pass-plugin=/workspace/build-catamaran-14/lib/libCMPass.so \
  -passes="Loops" \
  -disable-output \
  /tmp/test.ll
```

### 5. Pass 등록 확인

```bash
/opt/llvm-14/bin/opt -load-pass-plugin=/workspace/build-catamaran-14/lib/libCMPass.so \
  -passes="help" \
  -disable-output \
  /tmp/test.ll 2>&1 | grep -i "loops\|cmpass"
```

## 예상 결과

### 성공 시:
- 오류 없이 실행 완료
- Pass가 등록되어 사용 가능

### 실패 시:
- **의존성 오류**: `LD_LIBRARY_PATH` 설정 필요
  ```bash
  export LD_LIBRARY_PATH=/opt/llvm-14/lib:$LD_LIBRARY_PATH
  ```
- **심볼 오류**: 빌드 시 링크 문제일 수 있음
- **Pass 등록 오류**: `llvmGetPassPluginInfo()` 구현 확인 필요

## 해결된 문제들

1. ✅ `RegisterPass` 충돌 - 비활성화됨
2. ✅ `cl::opt` 충돌 - 일반 변수로 대체됨
3. ✅ CMake MODULE 타입 링크 오류 - `add_library` 사용으로 해결


# opt에 CMPass 로드 가이드

## 개요

LLVM 14로 포팅된 CMPass를 `opt` 도구에 로드하여 테스트하는 방법입니다.

## 사전 요구사항

1. CMPass 빌드 완료
2. LLVM 14 설치 완료
3. Docker 컨테이너 실행 중

## 단계별 가이드

### 1. 라이브러리 확인

```bash
# 파일 존재 확인
ls -lh /workspace/build-catamaran-14/lib/libCMPass.so

# 파일 타입 확인
file /workspace/build-catamaran-14/lib/libCMPass.so
```

### 2. 의존성 확인

```bash
ldd /workspace/build-catamaran-14/lib/libCMPass.so
```

**예상 출력:**
- `libstdc++.so.6`
- `libm.so.6`
- `libgcc_s.so.1`
- `libc.so.6`

LLVM 라이브러리는 런타임에 동적으로 로드되므로 `ldd`에 표시되지 않을 수 있습니다.

### 3. 테스트 IR 파일 생성

```bash
cat > /tmp/test.ll << 'EOF'
define i32 @main() {
  entry:
    ret i32 0
}
EOF
```

### 4. 기본 로드 테스트

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

## 문제 해결

### 의존성 오류

**증상:**
```
error while loading shared libraries: libLLVM-14.so: cannot open shared object file
```

**해결:**
```bash
export LD_LIBRARY_PATH=/opt/llvm-14/lib:$LD_LIBRARY_PATH
```

### Segmentation fault

**원인:**
- 전역 생성자 충돌 (RegisterPass, cl::opt)
- 이미 해결됨 ✅

### Pass 등록 실패

**확인 사항:**
- `llvmGetPassPluginInfo()` 함수 구현 확인
- `Loops.cpp`에 올바르게 구현되어 있는지 확인

## 성공 기준

1. ✅ 오류 없이 실행 완료
2. ✅ Pass가 등록되어 `-passes="help"`에 표시됨
3. ✅ 실제 IR 파일 처리 가능


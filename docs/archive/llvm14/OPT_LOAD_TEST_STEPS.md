# opt에 CMPass 로드 테스트 단계

## 1. 파일 위치 확인 ✅

실제 파일 위치: `/workspace/build-catamaran-14/lib/libCMPass.so`

## 2. 의존성 확인

Docker 컨테이너 안에서 다음 명령 실행:

```bash
# 라이브러리 의존성 확인
ldd /workspace/build-catamaran-14/lib/libCMPass.so

# 누락된 의존성이 있는지 확인
# 특히 LLVM 라이브러리들이 제대로 링크되어 있는지 확인
```

## 3. 올바른 경로로 로드 테스트

```bash
# 올바른 경로 사용
/opt/llvm-14/bin/opt -load-pass-plugin=/workspace/build-catamaran-14/lib/libCMPass.so \
  -passes="Loops" \
  -disable-output \
  /tmp/test.ll
```

## 4. LD_LIBRARY_PATH 설정 (필요시)

의존성 문제가 있다면:

```bash
export LD_LIBRARY_PATH=/opt/llvm-14/lib:$LD_LIBRARY_PATH
/opt/llvm-14/bin/opt -load-pass-plugin=/workspace/build-catamaran-14/lib/libCMPass.so \
  -passes="Loops" \
  -disable-output \
  /tmp/test.ll
```

## 5. MODULE 타입으로 재빌드 (선택사항)

CMakeLists.txt를 MODULE로 변경했으므로, 다시 빌드할 수도 있습니다:

```bash
cd /workspace/build-catamaran-14
ninja CMPass
```

## 예상 결과

성공하면:
- 오류 없이 실행 완료
- Pass가 등록되어 사용 가능

실패하면:
- 의존성 오류: `ldd`로 확인 후 `LD_LIBRARY_PATH` 설정
- 심볼 오류: 빌드 시 링크 문제일 수 있음
- Pass 등록 오류: `llvmGetPassPluginInfo()` 구현 확인 필요


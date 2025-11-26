# LLVM 14 포팅 세션 로그

## 날짜: 2024년 11월 18일

### 주요 작업 내용

#### 1. CMakeLists.txt 수정 및 빌드 오류 해결

**문제:**
- `add_llvm_library(CMPass MODULE ...)` 사용 시 CMake 오류 발생
- 오류: "Target 'CMPass' of type MODULE_LIBRARY may not be linked into another target"

**해결:**
- `add_llvm_library` 대신 `add_library(CMPass MODULE ...)` 사용
- MODULE 타입은 독립 플러그인이므로 `llvm_config` 호출을 피해야 함
- `LLVM_PLUGIN_EXT` 변수 기본값 설정 (`.so`)
- `add_dependencies` 제거 (MODULE 타입은 독립 플러그인이므로 불필요)

**변경 파일:**
- `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/CMakeLists.txt`

#### 2. RegisterPass 및 cl::opt 충돌 해결

**문제:**
- `opt`에 로드 시 Segmentation fault 발생
- 스택 트레이스: `_GLOBAL__sub_I_LegacyPassManager.cpp`에서 `cl::Option::addArgument()` 충돌

**원인:**
- 레거시 PassManager의 `RegisterPass`와 `cl::opt`가 전역 생성자에서 충돌
- 새 PassManager를 사용할 때는 레거시 등록이 필요 없음

**해결:**
- `RegisterPass<PDGAnalysis>` 비활성화
- `RegisterPass<LoopsMovec>` 비활성화
- `RegisterPass<InterTask>` 비활성화
- `cl::opt<bool> PDGDump` → `static bool PDGDump = false`
- `cl::opt<bool> PDGRA` → `static bool PDGRA = false`
- `cl::opt<bool> MCSelected` → `static bool MCSelected = false`
- `CommandLine.h` include 제거

**변경 파일:**
- `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/PDGAnalysis.cpp`
- `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/LoopsMovec.cpp`
- `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/InterTask.cpp`
- `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/PDG.cpp`

#### 3. 빌드 성공

**결과:**
```
[72/72] Linking CXX shared module lib/CMPass.so
```

**빌드 명령:**
```bash
cd /workspace/build-catamaran-14
cmake -G Ninja \
  -DCMAKE_BUILD_TYPE=Release \
  -DLLVM_DIR=$LLVM14/lib/cmake/llvm \
  -DCMAKE_CXX_STANDARD=17 \
  ../Catamaran-llvm-14/llvm
ninja CMPass
```

### 해결된 주요 이슈

1. ✅ CMake MODULE 타입 링크 오류
2. ✅ RegisterPass 전역 생성자 충돌
3. ✅ cl::opt 전역 생성자 충돌
4. ✅ 빌드 성공 확인

### 다음 단계

- [ ] `opt`에 CMPass 로드 테스트
- [ ] Pass 등록 확인
- [ ] 실제 IR 파일로 테스트

### 참고 사항

- LLVM 14의 새 PassManager는 `llvmGetPassPluginInfo()`를 통해 등록
- MODULE 타입 라이브러리는 독립 플러그인으로 빌드되어야 함
- 레거시 PassManager와 새 PassManager는 동시에 사용할 수 없음


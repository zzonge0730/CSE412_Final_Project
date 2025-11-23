# CMPass LLVM 14 빌드 성공 요약

## 빌드 완료: 2024년 11월 18일

### 빌드 결과

```
[72/72] Linking CXX shared module lib/CMPass.so
```

**출력 파일:**
- `/workspace/build-catamaran-14/lib/libCMPass.so`

### 해결된 주요 문제

#### 1. CMake MODULE 타입 오류

**문제:**
```
CMake Error: Target "CMPass" of type MODULE_LIBRARY may not be linked into another target.
```

**해결:**
- `add_llvm_library(CMPass MODULE ...)` → `add_library(CMPass MODULE ...)`
- MODULE 타입은 독립 플러그인이므로 `llvm_config` 호출을 피해야 함

#### 2. 전역 생성자 충돌

**문제:**
- `opt` 로드 시 Segmentation fault
- `RegisterPass`와 `cl::opt`가 전역 생성자에서 충돌

**해결:**
- 모든 `RegisterPass` 비활성화
- 모든 `cl::opt`를 일반 변수로 대체
- `CommandLine.h` include 제거

### 빌드 설정

**CMake 명령:**
```bash
cmake -G Ninja \
  -DCMAKE_BUILD_TYPE=Release \
  -DLLVM_DIR=$LLVM14/lib/cmake/llvm \
  -DCMAKE_CXX_STANDARD=17 \
  ../Catamaran-llvm-14/llvm
```

**빌드 명령:**
```bash
ninja CMPass
```

### 변경된 파일

1. `CMakeLists.txt`
   - `add_llvm_library` → `add_library`
   - `LLVM_PLUGIN_EXT` 기본값 설정
   - `add_dependencies` 제거

2. `PDGAnalysis.cpp`
   - `RegisterPass` 비활성화
   - `cl::opt` → 일반 변수

3. `LoopsMovec.cpp`
   - `RegisterPass` 비활성화

4. `InterTask.cpp`
   - `RegisterPass` 비활성화

5. `PDG.cpp`
   - `cl::opt` → 일반 변수
   - `CommandLine.h` include 제거

### 다음 단계

1. `opt`에 로드 테스트
2. Pass 등록 확인
3. 실제 IR 파일로 테스트


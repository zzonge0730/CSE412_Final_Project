# Catamaran LLVM 14 이식 가이드

## 개요

CMPass는 Catamaran의 **핵심 LLVM Pass**입니다. LLVM 3.4/3.5에서 LLVM 14로 이식하려면 다음 작업이 필요합니다:

1. **CMPass 소스 코드를 LLVM 14 API에 맞게 수정**
2. **새로운 PassManager 시스템으로 전환** (LLVM 14는 새 PassManager 사용)
3. **CMakeLists.txt 업데이트**
4. **빌드 및 테스트**

## CMPass란?

CMPass는 Catamaran의 핵심 컴포넌트로:
- **PDG (Program Dependence Graph) 분석** 수행
- **루프 병렬화** 최적화
- **메모리 안전성 검사 가속화** (SoftBoundCETS, MoveC, ASAN)

현재 위치: `Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMPass/`

## 이식 작업 단계

### 1단계: 디렉토리 구조 준비 (스크립트 없이 직접)

```bash
# Docker 컨테이너 실행
docker run -it --rm \
  -v "$(pwd):/workspace:delegated" \
  -w /workspace \
  catamaran:llvm14

# 컨테이너 내부에서
cd /workspace

# 디렉토리 생성 및 소스 복사 (한 번에)
mkdir -p Catamaran-llvm-14/llvm/lib/Transforms/CMPass
cp -r Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMPass/* \
      Catamaran-llvm-14/llvm/lib/Transforms/CMPass/
```

**또는 스크립트 사용 (선택사항):**
```bash
./setup-llvm14-port.sh
```

### 2단계: CMakeLists.txt 생성

```bash
# Transforms 디렉토리의 CMakeLists.txt 생성
cat > Catamaran-llvm-14/llvm/lib/Transforms/CMakeLists.txt << 'EOF'
add_subdirectory(Utils)
add_subdirectory(Instrumentation)
add_subdirectory(InstCombine)
add_subdirectory(Scalar)
add_subdirectory(IPO)
add_subdirectory(Vectorize)
add_subdirectory(Hello)
add_subdirectory(ObjCARC)
add_subdirectory(CMPass)
EOF
```

### 3단계: 주요 API 변경사항

#### 3.1 PassManager 변경

**LLVM 3.4/3.5 (구 PassManager):**
```cpp
#include "llvm/Pass.h"
#include "llvm/PassManager.h"

struct MyPass : public FunctionPass {
    static char ID;
    MyPass() : FunctionPass(ID) {}
    bool runOnFunction(Function &F) override { ... }
};
char MyPass::ID = 0;
INITIALIZE_PASS(MyPass, "mypass", "My Pass", false, false)
```

**LLVM 14 (새 PassManager):**
```cpp
#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"

struct MyPass : public PassInfoMixin<MyPass> {
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM) {
        ...
        return PreservedAnalyses::all();
    }
};
```

#### 3.2 주요 API 변경

| LLVM 3.4/3.5 | LLVM 14 |
|--------------|---------|
| `getNumUses()` | `use_empty()`, `use_size()` |
| `getType()->getPointerElementType()` | `getType()->getPointerElementType()` (deprecated) → `PointerType::getElementType()` |
| `PassManager` | `PassBuilder`, `FunctionPassManager` |
| `AnalysisUsage` | `AnalysisManager` |
| `getContext()` | `getContext()` (동일) |

#### 3.3 헤더 파일 변경

```cpp
// LLVM 3.4/3.5
#include "llvm/Pass.h"
#include "llvm/PassManager.h"
#include "llvm/Analysis/LoopInfo.h"

// LLVM 14
#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Analysis/LoopInfo.h"
```

### 4단계: CMakeLists.txt 수정

`Catamaran-llvm-14/llvm/lib/Transforms/CMPass/CMakeLists.txt`:

```cmake
# LLVM 14 스타일
add_llvm_library(CMPass SHARED
    AccumulatorOpInfo.cpp
    BitMatrix.cpp
    # ... 모든 소스 파일
)

# LLVM 14에서는 PassManager가 기본이므로 별도 설정 불필요
target_link_libraries(CMPass PRIVATE
    LLVMCore
    LLVMSupport
    LLVMAnalysis
    LLVMTransformUtils
)
```

### 5단계: Pass 등록 방식 변경

LLVM 14에서는 Pass 등록이 다릅니다:

**기존 (LLVM 3.4):**
```cpp
// Pass 등록
INITIALIZE_PASS(PDGAnalysis, "PDGAnalysis", "PDG Analysis", false, false)
```

**LLVM 14:**
```cpp
// PassBuilder에 등록
PassBuilder PB;
PB.registerPipelineParsingCallback(
    [](StringRef Name, FunctionPassManager &FPM,
       ArrayRef<PassBuilder::PipelineElement>) {
        if (Name == "PDGAnalysis") {
            FPM.addPass(PDGAnalysis());
            return true;
        }
        return false;
    });
```

### 6단계: 빌드 설정

```bash
cd /workspace/build-catamaran-14

cmake -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_DIR=$LLVM14/lib/cmake/llvm \
    -DCMAKE_CXX_STANDARD=17 \
    ../Catamaran-llvm-14/llvm

ninja
```

## 주요 수정이 필요한 파일

### 우선순위 높음:
1. **PDGAnalysis.cpp** - 이미 `use_empty()`로 수정됨 (PROJECT_STATUS.md 참고)
2. **Loops.cpp, LoopsMovec.cpp** - Pass 등록 및 실행 로직
3. **CMakeLists.txt** - 빌드 설정

### 우선순위 중간:
4. **PDG.cpp** - Value 사용 관련 API
5. **LoopStructure.cpp** - Loop API 변경
6. **ScalarEvolutionReferencer.cpp** - ScalarEvolution API

### 우선순위 낮음:
7. 나머지 헤더/구현 파일들

## 체크리스트

- [ ] Catamaran-llvm-14 디렉토리 구조 생성
- [ ] CMPass 소스 코드 복사
- [ ] PassManager를 새 PassManager로 전환
- [ ] 모든 `getNumUses()` → `use_empty()` 또는 `use_size()` 변경
- [ ] 헤더 파일 include 경로 수정
- [ ] CMakeLists.txt 업데이트
- [ ] Pass 등록 코드 수정
- [ ] 빌드 테스트
- [ ] 기본 컴파일 테스트 (`smoke_test.sh`)
- [ ] 실제 예제 실행 테스트

## 참고 자료

1. **LLVM 14 PassManager 문서**: 
   - https://llvm.org/docs/NewPassManager.html

2. **LLVM API 변경사항**:
   - https://llvm.org/docs/ReleaseNotes.html#changes-to-the-llvm-ir

3. **기존 프로젝트 이식 사례**:
   - LLVM 3.4 → 14는 큰 변경이므로 단계적으로 진행

## 다음 단계

1. **먼저 Docker 이미지 빌드 완료 확인**
   ```bash
   ./build-docker.sh
   ```

2. **컨테이너 실행 후 소스 복사**
   ```bash
   docker run -it --rm -v "$(pwd):/workspace:delegated" -w /workspace catamaran:llvm14
   # 컨테이너 내부에서:
   mkdir -p Catamaran-llvm-14/llvm/lib/Transforms/CMPass
   cp -r Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMPass/* Catamaran-llvm-14/llvm/lib/Transforms/CMPass/
   ```

3. **단계별로 수정하며 빌드 테스트**

## 주의사항

⚠️ **LLVM 3.4 → 14는 매우 큰 버전 차이**입니다:
- PassManager 시스템이 완전히 변경됨
- 많은 API가 deprecated 되거나 변경됨
- C++ 표준이 11 → 17로 변경

💡 **권장 접근 방법**:
1. 먼저 간단한 Pass 하나만 이식하여 빌드 성공 확인
2. 점진적으로 다른 Pass 추가
3. 각 단계마다 빌드 테스트

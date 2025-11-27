# LLVM 14 포팅 작업 일지 - 2024년 11월 18일

## 작업 위치
- **소스 코드**: `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/`
- **빌드 디렉토리**: `build-catamaran-14/`
- **Docker**: 루트 디렉토리의 `Dockerfile.llvm14`

## 전체 작업 요약

오늘은 Catamaran의 CMPass를 LLVM 3.4에서 LLVM 14로 포팅하는 작업을 진행했습니다.
주요 목표는 CMPass가 LLVM 14에서 컴파일되고 `opt`에 로드될 수 있도록 하는 것이었습니다.

## 작업 타임라인

### 1. CMakeLists.txt 수정 및 빌드 오류 해결

**시간**: 오전
**위치**: `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/CMakeLists.txt`

**문제:**
```
CMake Error: Target "CMPass" of type MODULE_LIBRARY may not be linked into another target.
```

**원인:**
- `add_llvm_library(CMPass MODULE ...)` 사용 시 LLVM의 `llvm_config`가 자동으로 호출되어 다른 타겟에 링크하려고 시도
- MODULE 타입은 독립 플러그인이므로 링크되면 안 됨

**해결:**
- `add_llvm_library` → `add_library(CMPass MODULE ...)` 변경
- `LLVM_PLUGIN_EXT` 변수 기본값 설정 (`.so`)
- `add_dependencies` 제거 (MODULE 타입은 독립 플러그인이므로 불필요)

**변경 내용:**
```cmake
# 변경 전
add_llvm_library(CMPass MODULE ...)

# 변경 후
add_library(CMPass MODULE ...)
# LLVM_PLUGIN_EXT 기본값 설정
if(NOT DEFINED LLVM_PLUGIN_EXT)
    set(LLVM_PLUGIN_EXT ".so")
endif()
```

### 2. RegisterPass 및 cl::opt 충돌 해결

**시간**: 오후 초반
**위치**: 
- `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/PDGAnalysis.cpp`
- `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/LoopsMovec.cpp`
- `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/InterTask.cpp`
- `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/PDG.cpp`

**문제:**
- `opt`에 로드 시 Segmentation fault 발생
- 스택 트레이스: `_GLOBAL__sub_I_LegacyPassManager.cpp`에서 `cl::Option::addArgument()` 충돌

**원인:**
- 레거시 PassManager의 `RegisterPass`와 `cl::opt`가 전역 생성자에서 충돌
- 새 PassManager를 사용할 때는 레거시 등록이 필요 없음

**해결:**
1. 모든 `RegisterPass` 비활성화:
   - `RegisterPass<PDGAnalysis>` → 주석 처리
   - `RegisterPass<LoopsMovec>` → 주석 처리
   - `RegisterPass<InterTask>` → 주석 처리

2. 모든 `cl::opt`를 일반 변수로 대체:
   - `cl::opt<bool> PDGDump` → `static bool PDGDump = false`
   - `cl::opt<bool> PDGRA` → `static bool PDGRA = false`
   - `cl::opt<bool> MCSelected` → `static bool MCSelected = false`

3. `CommandLine.h` include 제거:
   - `PDGAnalysis.cpp`에서 `#include "llvm/Support/CommandLine.h"` 제거
   - `PDG.cpp`에서 `#include "llvm/Support/CommandLine.h"` 제거

4. 사용처 수정:
   - `PDGDump.getNumOccurrences()` → `PDGDump` (직접 값 사용)
   - `PDGRA.getNumOccurrences()` → `PDGRA` (직접 값 사용)
   - `MCSelected.getNumOccurrences()` → `MCSelected` (직접 값 사용)

**변경 파일 목록:**
1. `PDGAnalysis.cpp`: RegisterPass, cl::opt 제거, CommandLine.h 제거
2. `LoopsMovec.cpp`: RegisterPass 제거
3. `InterTask.cpp`: RegisterPass 제거
4. `PDG.cpp`: cl::opt 제거, CommandLine.h 제거

### 3. 레거시 PassManager 클래스 비활성화

**시간**: 오후 중반
**위치**: 
- `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/PDGAnalysis.h/cpp`
- `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/LoopsMovec.h/cpp`
- `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/InterTask.h/cpp`

**문제:**
- `#include "llvm/Pass.h"`가 여전히 포함되어 레거시 PassManager가 로드됨
- `ModulePass`를 상속하는 클래스들이 전역 생성자에서 충돌

**해결:**
- `PDGAnalysis`, `LoopsMovec`, `InterTask` 클래스를 `#if 0`으로 전체 비활성화
- 헤더와 구현 파일 모두 조건부 컴파일로 감쌈
- Forward declaration만 남김

**변경 내용:**
```cpp
// 헤더 파일
#if 0
class PDGAnalysis : public ModulePass {
    // ... 전체 클래스 정의
};
#else
class PDGAnalysis {
    // Forward declaration only
};
#endif

// 구현 파일
#if 0
// ... 전체 구현
#endif
```

### 4. PDGAnalysis static 메서드 이동

**시간**: 오후 후반
**위치**: 
- `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/Utils.h/cpp`
- `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/InvariantManager.cpp`
- `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/LoopDependenceInfo.cpp`
- `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/Loops.cpp`

**문제:**
- `PDGAnalysis::isTheLibraryFunctionPure()` 사용
- `PDGAnalysis::isTheLibraryFunctionThreadSafe()` 사용
- `PDGAnalysis::getFunctionPDG()` 사용
- `PDGAnalysis`가 비활성화되어 있어서 접근 불가

**해결:**
1. `Utils.h/cpp`에 함수 추가:
   - `isTheLibraryFunctionPure()` - `libraryFunction` 정의 포함
   - `isTheLibraryFunctionThreadSafe()` - `externalThreadSafeFunctions` 정의 포함

2. 사용처 수정:
   - `InvariantManager.cpp`: `PDGAnalysis::isTheLibraryFunctionPure()` → `isTheLibraryFunctionPure()`
   - `LoopDependenceInfo.cpp`: `PDGAnalysis::isTheLibraryFunctionThreadSafe()` → `isTheLibraryFunctionThreadSafe()`
   - `Loops.cpp`: `pdgAnalysis->getFunctionPDG()` → `nullptr` (임시)

3. Include 추가:
   - `InvariantManager.cpp`: `#include "Utils.h"` 추가
   - `LoopDependenceInfo.cpp`: `#include "Utils.h"` 추가

### 5. 빌드 성공

**시간**: 오후 후반
**위치**: `build-catamaran-14/`

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

**결과:**
```
[27/27] Linking CXX shared module lib/CMPass.so
```

**출력 파일:**
- `/workspace/build-catamaran-14/lib/libCMPass.so` (약 3.8MB)

## 해결된 주요 이슈

1. ✅ **CMake MODULE 타입 링크 오류**
   - `add_llvm_library` → `add_library` 변경으로 해결

2. ✅ **RegisterPass 전역 생성자 충돌**
   - 모든 RegisterPass 비활성화로 해결

3. ✅ **cl::opt 전역 생성자 충돌**
   - cl::opt를 일반 변수로 대체하여 해결

4. ✅ **레거시 PassManager 클래스 충돌**
   - PDGAnalysis, LoopsMovec, InterTask를 `#if 0`으로 비활성화

5. ✅ **PDGAnalysis static 메서드 접근 오류**
   - Utils.h/cpp로 이동하여 해결

6. ✅ **빌드 성공 확인**
   - CMPass.so 파일 생성 완료

7. ✅ **CMakeLists.txt에서 레거시 PassManager 파일 제거**
   - PDGAnalysis.cpp, LoopsMovec.cpp, InterTask.cpp 제거

8. ✅ **PDGAnalysis.h의 모든 include를 #if 0으로 감싸기**
   - 레거시 PassManager 헤더 포함 방지

9. ✅ **여러 헤더 파일에서 PDGAnalysis.h include를 forward declaration으로 변경**
   - 6개 헤더 파일 수정

10. ✅ **Utils.h include 추가**
    - Loops.cpp, LoopFreeTask.cpp에 추가

11. ❌ **레거시 PassManager 충돌 문제 (미해결)**
    - opt 로드 시 여전히 Segmentation fault 발생
    - 추가 조사 필요

### 6. CMakeLists.txt에서 레거시 PassManager 파일 제거

**시간**: 오후 후반
**위치**: `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/CMakeLists.txt`

**문제:**
- `PDGAnalysis.cpp`, `LoopsMovec.cpp`, `InterTask.cpp`가 빌드 목록에 포함되어 있음
- 이 파일들은 `#if 0`으로 감싸져 있지만, 전처리 과정에서 레거시 PassManager 헤더가 포함될 수 있음

**해결:**
- `CMakeLists.txt`의 `add_library` 목록에서 해당 파일들 제거
- 주석으로 이유 명시

**변경 내용:**
```cmake
add_library(CMPass MODULE
    # ... 다른 파일들 ...
    # InterTask.cpp - LLVM 14: 레거시 PassManager 사용으로 인해 임시 비활성화
    # LoopsMovec.cpp - LLVM 14: 레거시 PassManager 사용으로 인해 임시 비활성화
    # PDGAnalysis.cpp - LLVM 14: 레거시 PassManager 사용으로 인해 임시 비활성화
    # ... 다른 파일들 ...
)
```

### 7. PDGAnalysis.h의 모든 include를 #if 0으로 감싸기

**시간**: 오후 후반
**위치**: `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/PDGAnalysis.h`

**문제:**
- `PDGAnalysis.h`의 `#include "llvm/Analysis/AliasAnalysis.h"`가 `#if 0` 블록 밖에 있음
- 헤더가 include되면 전처리 과정에서 레거시 PassManager가 포함될 수 있음

**해결:**
- 모든 include와 클래스 정의를 `#if 0` 블록 안으로 이동
- Forward declaration만 `#else` 블록에 유지

**변경 내용:**
```cpp
#ifndef PDGANALYSIS_H
#define PDGANALYSIS_H

// LLVM 14: PDGAnalysis는 레거시 PassManager를 사용하므로 임시로 완전히 비활성화
// 모든 include와 클래스 정의를 #if 0으로 감싸서 전역 생성자 충돌 방지
#if 0
#include "PDG.h"
#include "./DataFlowAnalysis.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/ADT/StringSet.h"
#include "Utils.h"
// ... 전체 클래스 정의 ...
#else
// Forward declaration only - include 없이 최소한의 선언만
class PDGAnalysis {
    // Empty forward declaration
};
#endif

#endif
```

### 8. 여러 헤더 파일에서 PDGAnalysis.h include를 forward declaration으로 변경

**시간**: 오후 후반
**위치**: 
- `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/Loops.h`
- `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/LoopDependenceInfo.h`
- `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/SCCDAG.h`
- `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/LoopEnvironment.h`
- `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/InvariantManager.h`
- `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/SCCDAGAttrs.h`

**문제:**
- 여러 헤더 파일에서 `#include "PDGAnalysis.h"`를 사용
- `PDGAnalysis.h`가 include되면 레거시 PassManager 관련 헤더가 포함될 수 있음

**해결:**
- 모든 `#include "PDGAnalysis.h"`를 주석 처리
- `class PDGAnalysis;` forward declaration으로 대체

**변경 내용:**
```cpp
// 변경 전
#include "PDGAnalysis.h"

// 변경 후
// LLVM 14: PDGAnalysis는 레거시 PassManager를 사용하므로 임시로 forward declaration만 사용
// #include "PDGAnalysis.h"
class PDGAnalysis; // Forward declaration
```

### 9. Utils.h include 추가

**시간**: 오후 후반
**위치**: 
- `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/Loops.cpp`
- `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/LoopFreeTask.cpp`

**문제:**
- `Loops.cpp`에서 `IsSafeCheckCall`, `IsIntraTaskConsideredForSB`, `IsSafeCheckCallStore`, `IsSafeCheckCallForLoopFree`, `IsMemAccessInst`, `getSafeCheckCost`, `getSpawnableCost` 함수 사용
- `LoopFreeTask.cpp`에서 `instHappensBefore` 함수 사용
- 이 함수들은 `Utils.h`에 선언되어 있지만 include되지 않음

**해결:**
- `Loops.cpp`에 `#include "Utils.h"` 추가
- `LoopFreeTask.cpp`에 `#include "Utils.h"` 추가

**변경 내용:**
```cpp
// Loops.cpp
#include "Loops.h"
#include "llvm/IR/Dominators.h"
// LLVM 14: Utils.h에 선언된 유틸리티 함수들 사용
#include "Utils.h"

// LoopFreeTask.cpp
#include "LoopFreeTask.h"
// LLVM 14: Utils.h에 선언된 유틸리티 함수들 사용
#include "Utils.h"
```

### 10. 여전히 해결되지 않은 레거시 PassManager 충돌 문제

**시간**: 오후 후반
**위치**: `opt` 로드 시

**문제:**
- `opt`에 `libCMPass.so` 로드 시 Segmentation fault 발생
- 스택 트레이스: `_GLOBAL__sub_I_LegacyPassManager.cpp`에서 `cl::Option::addArgument()` 충돌
- 모든 레거시 PassManager 관련 코드를 제거했지만 여전히 충돌 발생

**시도한 해결 방법:**
1. ✅ `PDGAnalysis.cpp`, `LoopsMovec.cpp`, `InterTask.cpp`를 `CMakeLists.txt`에서 제거
2. ✅ `PDGAnalysis.h`의 모든 include를 `#if 0`으로 감싸기
3. ✅ 모든 헤더 파일에서 `PDGAnalysis.h` include를 forward declaration으로 변경
4. ✅ 빌드 캐시 정리 후 재빌드

**현재 상태:**
- 빌드는 성공 (`libCMPass.so` 생성 완료)
- `opt` 로드 시 여전히 Segmentation fault 발생
- 레거시 PassManager 관련 코드가 어딘가에 남아있는 것으로 추정

**추가 조사 필요:**
- 다른 헤더 파일에서 레거시 PassManager를 간접적으로 포함하는지 확인
- 빌드된 라이브러리에서 레거시 PassManager 심볼 확인
- `DataFlowAnalysis.h`나 다른 헤더에서 레거시 PassManager 포함 여부 확인

### 11. InterTask.h와 LoopsMovec.h에서 PDGAnalysis.h include 제거

**시간**: 오후 후반 (추가)
**위치**: 
- `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/InterTask.h`
- `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/LoopsMovec.h`

**문제:**
- `InterTask.h`와 `LoopsMovec.h`에 여전히 `#include "PDGAnalysis.h"`가 있음
- 이 파일들은 `CMakeLists.txt`에서 제거되어 빌드되지 않지만, 헤더 파일 자체가 존재하므로 문제가 될 수 있음

**해결:**
- `InterTask.h`의 `#include "PDGAnalysis.h"`를 주석 처리하고 forward declaration으로 변경
- `LoopsMovec.h`의 `#include "PDGAnalysis.h"`를 주석 처리하고 forward declaration으로 변경

**변경 내용:**
```cpp
// 변경 전
#include "PDGAnalysis.h"

// 변경 후
// LLVM 14: PDGAnalysis는 레거시 PassManager를 사용하므로 임시로 forward declaration만 사용
// #include "PDGAnalysis.h"
class PDGAnalysis; // Forward declaration
```

**변경 파일 목록:**
1. `InterTask.h`: PDGAnalysis.h include 제거, forward declaration 추가
2. `LoopsMovec.h`: PDGAnalysis.h include 제거, forward declaration 추가

### 12. 레거시 PassManager 심볼 확인 및 충돌 문제 지속

**시간**: 오후 후반 (추가)
**위치**: 빌드된 라이브러리 및 opt 로드 테스트

**문제:**
- `opt`에 로드 시 여전히 Segmentation fault 발생
- 스택 트레이스: `_GLOBAL__sub_I_LegacyPassManager.cpp`에서 `cl::Option::addArgument()` 충돌
- `nm` 명령어로 확인한 결과 레거시 PassManager 심볼들이 라이브러리에 포함됨:
  - `PassRegistry::registerPass`
  - `legacy::PassManager`
  - `legacy::PassManagerBase`
  - `legacy::PassManagerImpl`
  - `legacy::FunctionPassManager`

**원인 분석:**
- LLVM 라이브러리(`LLVMCore`, `LLVMSupport`, `LLVMAnalysis`)를 링크할 때 레거시 PassManager 코드가 포함됨
- LLVM 14는 레거시 PassManager를 지원하지만, 플러그인 로드 시 전역 생성자 충돌 발생
- 우리 코드에서는 레거시 PassManager를 사용하지 않지만, LLVM 라이브러리 자체에 포함되어 있음

**빌드 결과:**
- 빌드 성공: `[69/69] Linking CXX shared module lib/CMPass.so`
- 라이브러리 크기: 3.8MB
- 의존성 정상: `ldd` 명령어로 확인한 결과 LLVM 라이브러리 링크 정상

**시도한 해결 방법:**
1. ✅ `PDGAnalysis.cpp`, `LoopsMovec.cpp`, `InterTask.cpp`를 `CMakeLists.txt`에서 제거
2. ✅ `PDGAnalysis.h`의 모든 include를 `#if 0`으로 감싸기
3. ✅ 모든 헤더 파일에서 `PDGAnalysis.h` include를 forward declaration으로 변경
4. ✅ `InterTask.h`와 `LoopsMovec.h`에서 `PDGAnalysis.h` include 제거
5. ✅ Dockerfile에 개발 헤더 패키지 추가 (`zlib1g-dev`, `libxml2-dev` 등)

**현재 상태:**
- 빌드는 성공 (`libCMPass.so` 생성 완료)
- `opt` 로드 시 여전히 Segmentation fault 발생
- 레거시 PassManager 심볼이 LLVM 라이브러리에 포함되어 충돌 발생

**추가 조사 필요:**
- LLVM 14에서 레거시 PassManager를 완전히 비활성화하는 방법
- 플러그인에서 레거시 PassManager 심볼을 제외하는 방법
- 또는 다른 LLVM 라이브러리 링크 방법

### 13. 1단계 및 2단계 시도 - 라이브러리 링크 최소화 및 심볼 가시성 변경

**시간**: 오후 후반 (추가)
**위치**: `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/CMakeLists.txt`, `Loops.cpp`

**시도한 방법:**
1. ✅ **1단계: 라이브러리 링크 최소화**
   - `LLVMAnalysis` 제거 (레거시 PassManager 포함 가능성)
   - `LLVMTransformUtils` 제거
   - `LLVMInstrumentation` 제거
   - `LLVMCore`, `LLVMSupport`만 유지
   - 결과: 빌드 성공, 하지만 레거시 PassManager 심볼이 여전히 포함됨

2. ✅ **2단계: 심볼 가시성 변경 및 링커 옵션**
   - `llvmGetPassPluginInfo`에 `__attribute__((constructor(101)))` 추가 (전역 생성자 우선순위 조정)
   - `llvmGetPassPluginInfo`에 `__attribute__((visibility("default")))` 추가
   - 링커 옵션 `-Wl,-znodelete` 추가 (플러그인 언로드 방지)
   - 링커 옵션 `-Wl,--as-needed` 추가
   - 결과: 빌드 성공, 하지만 여전히 Segmentation fault 발생

**문제 지속:**
- `nm` 명령어 결과: 레거시 PassManager 심볼이 여전히 포함됨
- 스택 트레이스: `_GLOBAL__sub_I_LegacyPassManager.cpp`에서 `cl::Option::addArgument()` 충돌
- 원인: `LLVMCore`나 `LLVMSupport` 라이브러리 자체에 레거시 PassManager 전역 생성자가 포함되어 있음

**현재 상태:**
- 빌드는 성공 (`libCMPass.so` 생성 완료)
- `opt` 로드 시 여전히 Segmentation fault 발생
- 링커 옵션과 전역 생성자 우선순위 조정으로는 해결되지 않음
- 근본 원인: 링크된 LLVM 라이브러리의 전역 생성자를 제어할 수 없음

**다음 접근 방법 고려:**
1. ❌ LLVM 버전 확인 및 알려진 이슈 확인 - 웹 검색 결과로는 근본적인 해결책 없음
2. ❌ LLVM 빌드 옵션 변경 (레거시 PassManager 비활성화) - LLVM 14는 레거시 PassManager 포함이 기본
3. ❓ 다른 LLVM 버전 시도 - LLVM 15+에서 레거시 PassManager 제거되었을 수 있음
4. ❓ 플러그인 로드 방식 변경 - `-passes=` 없이 레거시 방식 시도 (하지만 플러그인이 새 PassManager로 구현되어 있음)
5. ❓ 또는 레거시 PassManager 방식으로 플러그인 재구현 - 큰 작업이 필요함

**시도하지 않은 방법:**
- `--enable-new-pm` 옵션: LLVM 14 opt에서 존재 확인 (하지만 이는 새 PassManager를 활성화하는 옵션임)
- `--enable-new-pm=0` 옵션: 시도 완료 - 여전히 Segmentation fault 발생
- `-passes=` 옵션 없이 레거시 PassManager 방식으로 로드: 시도 완료 - 여전히 Segmentation fault 발생
- LLVM 재빌드: `-DLLVM_ENABLE_NEW_PASS_MANAGER=OFF`로 레거시 PassManager만 활성화 (하지만 이미 빌드된 LLVM 사용 중)
- **LLVM 버전 업그레이드**: LLVM 15+로 업그레이드 (레거시 PassManager 완전 제거된 버전)

**근본적인 문제:**
- LLVM 14는 레거시 PassManager와 새 PassManager를 모두 포함하고 있음
- 플러그인이 LLVM 라이브러리를 링크할 때 레거시 PassManager 전역 생성자가 포함됨
- 플러그인 로드 시 (`dlopen`) 레거시 PassManager 전역 생성자가 실행되면서 `cl::Option::addArgument()` 충돌 발생
- 링커 옵션이나 전역 생성자 우선순위 조정으로는 링크된 라이브러리의 전역 생성자를 제어할 수 없음
- `-passes=` 옵션 사용 여부와 관계없이 플러그인 로드 시 충돌 발생 (플러그인 자체가 문제)

## 다음 단계

### 🏆 옵션 1: LLVM 버전 업그레이드 (최우선 추천 - 결정됨)

**결정: LLVM 17 (또는 16)로 업그레이드 진행**

**핵심 이유: "가장 깔끔하고, 고민할 거리가 적습니다."**
- ✅ **Legacy PassManager 완전 퇴출** - LLVM 14의 `RegisterPass`, `cl::opt` 충돌 문제가 아예 발생하지 않음
- ✅ **Opaque Pointers 강제 적용** - 코드가 오히려 단순해짐 (`PointerType::getUnqual()`, `getPointerElementType()` 같은 복잡한 타입 코드 제거 가능)
- ✅ **풍부한 최신 예제** - 2024/2025 튜토리얼들이 대부분 LLVM 15~17 기준
- ✅ **선택 장애 해결** - 새 PassManager 방식 하나만 신경 쓰면 됨

**비추천: LLVM 15**
- ⚠️ Opaque Pointer 과도기로 인한 혼란만 증가
- ⚠️ LLVM 16/17에서 완전히 표준화된 것을 다시 고민할 필요 없음

**작업 항목:**
- [x] Dockerfile 업데이트 (LLVM 17 소스 다운로드 및 빌드) - **완료**
  - `Dockerfile.llvm17` 생성 완료
  - `run-docker-llvm17.sh` 실행 스크립트 생성 완료
  - Docker 이미지 빌드 완료: `catamaran:llvm17`
  - LLVM 17.0.6 설치 확인: `clang version 17.0.6`, `LLVM version 17.0.6`
- [ ] Catamaran 소스 준비 (Catamaran-llvm-17 디렉토리 생성 또는 복사)
- [ ] CMakeLists.txt 검토 및 업데이트 (LLVM 17 API 변경사항 반영)
- [ ] Pass 플러그인 재작성 (`llvmGetPassPluginInfo()` 방식)
- [ ] Opaque Pointers 전환 (`PointerType::getUnqual()` 등 제거, 타입 코드 단순화)
- [ ] API 업데이트 (Deprecated 함수 교체)
- [ ] 빌드 테스트
- [ ] 플러그인 로드 테스트 (`opt -load-pass-plugin=libCMPass.so -passes="Loops"`)
- [ ] Pass 동작 검증 (실제 IR 파일로 테스트)

**참고:**
- 현재 코드베이스에서 `PointerType::getUnqual()` 사용: 47개 발견
- `InterTask.cpp`, `LoopFreeTask.cpp`, `DOALLTask.cpp`, `EnvBuilder.cpp` 등에서 타입 캐스팅 코드가 많음
- LLVM 17의 Opaque Pointers로 이러한 코드들이 단순해질 수 있음

**진행 상황 요약:**

### 오늘 완료한 작업

1. **LLVM 14 Segmentation Fault 문제 분석**
   - 플러그인 로드 시 레거시 PassManager 전역 생성자 충돌 확인
   - 스택 트레이스 분석: `_GLOBAL__sub_I_LegacyPassManager.cpp` → `cl::Option::addArgument()` 충돌
   - `nm`, `objdump`로 레거시 PassManager 심볼 존재 확인

2. **해결 시도 (모두 실패)**
   - 라이브러리 링크 최소화 (`LLVMAnalysis` 제거)
   - 심볼 가시성 변경 및 링커 옵션 (`-znodelete`, `constructor(101)`)
   - `--enable-new-pm=0` 옵션 시도
   - `-passes=` 옵션 없이 레거시 PassManager 방식으로 로드 시도

3. **LLVM 버전 업그레이드 결정**
   - LLVM 15, 16, 17 비교 분석
   - **최종 결정: LLVM 17** (또는 16)
   - 결정 이유:
     - Legacy PassManager 완전 퇴출 (충돌 문제 근본 해결)
     - Opaque Pointers 강제 적용 (코드 단순화)
     - 풍부한 최신 예제 및 튜토리얼
   - 분석 문서 작성: `LLVM_VERSION_UPGRADE_ANALYSIS.md`, `LLVM17_UPGRADE_DECISION.md`

4. **LLVM 17 Docker 환경 구축 완료**
   - `Dockerfile.llvm17` 생성 완료
   - `run-docker-llvm17.sh` 실행 스크립트 생성 완료
   - Docker 이미지 빌드 성공: `catamaran:llvm17`
   - LLVM 17.0.6 설치 확인 완료
     - `clang version 17.0.6` 정상 작동
     - `LLVM version 17.0.6` 정상 작동
   - 컨테이너 내부 환경 설정 완료: `/opt/llvm-17`, `LLVM17=/opt/llvm-17`
   - 설정 가이드 작성: `DOCKER_LLVM17_SETUP.md`

### 다음 세션 시작 지점

**현재 위치:**
- Docker 컨테이너 내부 (`catamaran:llvm17`)
- LLVM 17.0.6 설치 완료 및 확인 완료
- 다음 작업 준비 완료

**다음 단계:**
1. Catamaran 소스 준비 (`Catamaran-llvm-14` → `Catamaran-llvm-17` 복사)
2. CMakeLists.txt 업데이트 (LLVM 17 API 반영)
3. Pass 플러그인 재작성 (New PassManager 방식)
4. Opaque Pointers 전환 (`PointerType::getUnqual()` 등 제거)

### 옵션 2: LLVM 14에서 해결 시도 (비권장)
- [x] `InterTask.h`와 `LoopsMovec.h`에서 `PDGAnalysis.h` include 제거 (완료)
- [x] 빌드된 라이브러리에서 레거시 PassManager 심볼 확인 (완료 - 심볼 존재 확인)
- [x] 1단계: 라이브러리 링크 최소화 (`LLVMAnalysis` 제거) - 시도 완료, 빌드 성공하지만 충돌 지속
- [x] 2단계: 심볼 가시성 변경 및 링커 옵션 (`-znodelete`, `constructor(101)`) - 시도 완료, 충돌 지속
- [x] `--enable-new-pm=0` 옵션 시도 - 시도 완료, 여전히 충돌 발생
- [x] `-passes=` 옵션 없이 레거시 PassManager 방식으로 로드 시도 - 시도 완료, 여전히 충돌 발생
- [ ] LLVM 14 재빌드 (레거시 PassManager 비활성화 옵션 시도) - 하지만 이미 빌드된 LLVM 사용 중
- [ ] `opt`에 CMPass 로드 테스트 성공
- [ ] Pass 등록 확인 (`-passes="help"`)
- [ ] 실제 IR 파일로 테스트
- [ ] Phase 2: 비활성화된 기능 복구 (Delinearization, SCCDAG 등)
- [ ] Phase 2: 새 PassManager로 완전 전환 (PDGAnalysis, LoopsMovec, InterTask)

## 참고 사항

### LLVM 14의 새 PassManager
- 새 PassManager는 `llvmGetPassPluginInfo()`를 통해 등록
- 레거시 PassManager와 새 PassManager는 동시에 사용할 수 없음
- MODULE 타입 라이브러리는 독립 플러그인으로 빌드되어야 함

### 변경된 파일 요약

**CMakeLists.txt:**
- `add_llvm_library` → `add_library`
- `LLVM_PLUGIN_EXT` 기본값 설정
- `add_dependencies` 제거

**소스 파일:**
- `PDGAnalysis.h/cpp`: 전체 비활성화 (`#if 0`)
- `LoopsMovec.h/cpp`: 전체 비활성화 (`#if 0`)
- `InterTask.h/cpp`: 전체 비활성화 (`#if 0`)
- `PDGAnalysis.cpp`: RegisterPass, cl::opt 제거
- `PDG.cpp`: cl::opt 제거
- `Utils.h/cpp`: `isTheLibraryFunctionPure`, `isTheLibraryFunctionThreadSafe` 추가
- `InvariantManager.cpp`: Utils 함수 사용
- `LoopDependenceInfo.cpp`: Utils 함수 사용
- `Loops.cpp`: `getFunctionPDG()` 임시로 `nullptr` 반환, `Utils.h` include 추가
- `LoopFreeTask.cpp`: `Utils.h` include 추가
- `PDGAnalysis.h`: 모든 include를 `#if 0`으로 감싸기
- `Loops.h`: `PDGAnalysis.h` include를 forward declaration으로 변경
- `LoopDependenceInfo.h`: `PDGAnalysis.h` include를 forward declaration으로 변경
- `SCCDAG.h`: `PDGAnalysis.h` include를 forward declaration으로 변경
- `LoopEnvironment.h`: `PDGAnalysis.h` include를 forward declaration으로 변경
- `InvariantManager.h`: `PDGAnalysis.h` include를 forward declaration으로 변경
- `SCCDAGAttrs.h`: `PDGAnalysis.h` include를 forward declaration으로 변경

**CMakeLists.txt:**
- `PDGAnalysis.cpp`, `LoopsMovec.cpp`, `InterTask.cpp` 제거

**추가 헤더 파일:**
- `InterTask.h`: `PDGAnalysis.h` include 제거, forward declaration으로 변경
- `LoopsMovec.h`: `PDGAnalysis.h` include 제거, forward declaration으로 변경

## 작업 환경

### LLVM 14 환경 (이전 작업)
- **Docker 이미지**: `catamaran:llvm14`
- **LLVM 버전**: 14.0.6
- **컴파일러**: GCC 12
- **빌드 시스템**: CMake + Ninja
- **C++ 표준**: C++17
- **상태**: Segmentation Fault 문제로 업그레이드 결정

### LLVM 17 환경 (현재 작업)
- **Docker 이미지**: `catamaran:llvm17`
- **LLVM 버전**: 17.0.6
- **컴파일러**: GCC 12
- **빌드 시스템**: CMake + Ninja
- **C++ 표준**: C++17
- **상태**: 환경 구축 완료, 포팅 작업 준비 완료

## 관련 문서

- `LLVM14_PORTING_GUIDE.md` - 상세 이식 가이드
- `LLVM14_PORTING_PROGRESS.md` - 전체 진행 상황
- `LLVM14_FILE_INDEX.md` - 파일 인덱스

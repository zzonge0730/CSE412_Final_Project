# Code Structure / 코드 구조

[English below]

## 프로젝트 구조

```
Catamaran_artifact_issta23/
├── Catamaran-llvm-3.4/          # LLVM 3.4 원본 버전
│   └── llvm/lib/Transforms/CMPass/
├── Catamaran-llvm-17/            # LLVM 17 포팅 버전 (주요 작업)
│   └── llvm/lib/Transforms/CMPass/
├── Catamaran-llvm-3.5.2/         # LLVM 3.5.2 버전 (ASAN용)
├── runtime/                      # 런타임 라이브러리
│   └── ThreadPool.cpp            # 병렬 실행을 위한 스레드 풀
├── examples/                     # 예제 파일들
│   ├── llvm17/                   # LLVM 17 예제
│   └── llvm34/                   # LLVM 3.4 예제
├── docker/                       # Docker 파일들
│   ├── Dockerfile.llvm34
│   ├── Dockerfile.llvm14
│   └── Dockerfile.llvm17
└── scripts/                      # 빌드 및 실행 스크립트
    ├── build-llvm17.sh
    ├── run-docker-llvm17.sh
    └── ...
```

## 주요 파일 설명

### 핵심 Pass 파일

#### `Loops.cpp` / `Loops.h`
- **역할**: 메인 LLVM Pass. 루프를 분석하고 병렬화 태스크를 생성
- **주요 기능**:
  - 루프 구조 분석
  - Safe Check 감지 (MoveC, ASAN)
  - Loop-Free Task 및 DOALL Task 생성
  - 병렬화 변환 실행
- **LLVM 17 변경사항**:
  - New PassManager 사용 (`PassInfoMixin<Loops>`)
  - `PreservedAnalyses` 반환
  - Opaque Pointers 지원

#### `LoopFreeTask.cpp` / `LoopFreeTask.h`
- **역할**: 루프 외부의 메타데이터 검사를 병렬화하는 태스크
- **주요 기능**:
  - Safe Check 수집
  - 병렬 태스크 생성
  - 원본 코드 정리 (`eraseSafeCheckCodes`)

#### `DOALLTask.cpp` / `DOALLTask.h`
- **역할**: 루프 내부의 검사를 병렬화하는 태스크 (DOALL)
- **주요 기능**:
  - 루프 분리 (`splitLoop`)
  - Live-in/Live-out 변수 관리
  - 병렬 함수 생성
  - 원본 코드 정리 (`eraseSafeCheckCodes`)

#### `Utils.cpp` / `Utils.h`
- **역할**: 유틸리티 함수들
- **주요 함수**:
  - `IsSafeCheckCallForMovec`: MoveC safe check 함수 감지
  - `IsSafeCheckCallForLoopFree`: Loop-Free용 safe check 감지
  - `IsIntraTaskConsideredForMC`: MoveC 내부 태스크 고려

### 분석 및 의존성 파일

#### `PDGAnalysis.cpp` / `PDGAnalysis.h`
- **역할**: Program Dependence Graph (PDG) 분석
- **용도**: 데이터 의존성 및 제어 의존성 분석

#### `LoopDependenceInfo.cpp` / `LoopDependenceInfo.h`
- **역할**: 루프 의존성 정보 관리
- **용도**: 루프 병렬화 가능성 판단

#### `LoopStructure.cpp` / `LoopStructure.h`
- **역할**: 루프 구조 표현
- **용도**: 루프 헤더, 바디, 래치 등 정보 저장

### 런타임

#### `runtime/ThreadPool.cpp`
- **역할**: 병렬 태스크 실행을 위한 스레드 풀
- **주요 기능**:
  - 태스크 스케줄링
  - 스레드 관리
  - 동기화 (join 함수)

## 코드 흐름

### 1. Pass 실행 흐름

```
Loops::run()
  ├── getLoopStructures()          # 루프 구조 수집
  ├── PDGAnalysis::run()           # PDG 분석
  ├── Loop-Free Task 생성
  │   └── LoopFreeTask::transform()
  └── DOALL Task 생성
      └── DOALLTask::splitLoop()
```

### 2. Loop-Free 병렬화

```
1. Safe Check 감지 (Utils.cpp)
2. LoopFreeTask 생성
3. 태스크 그룹화
4. 병렬 함수 생성
5. 원본 코드 정리 (eraseSafeCheckCodes)
```

### 3. DOALL 병렬화

```
1. 루프 내부 Safe Check 감지
2. 의존성 분석 (PDG)
3. DOALLTask 생성
4. 루프 분리 (splitLoop)
   ├── 새 함수 생성
   ├── Live-in 변수 처리
   └── Live-out 변수 처리
5. 원본 코드 정리 (eraseSafeCheckCodes)
```

## LLVM 17 포팅 주요 변경사항

### 1. New PassManager

**이전 (LLVM 3.4)**:
```cpp
class Loops : public ModulePass {
    bool runOnModule(Module &M) override;
};
```

**현재 (LLVM 17)**:
```cpp
class Loops : public PassInfoMixin<Loops> {
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM);
};
```

### 2. Opaque Pointers

**이전**:
```cpp
PointerType::getUnqual(Type::getInt8Ty(ctx))
```

**현재**:
```cpp
PointerType::get(ctx, 0)  // address space 0
```

### 3. API 변경

- `getArgumentList()` → `args()`
- `getOrInsertFunction()` → `FunctionCallee` 반환
- `CallInst::Create()` → `FunctionCallee` 사용

## 주요 알고리즘

### Safe Check 감지

MoveC와 ASAN의 safe check 함수를 감지하여 병렬화 대상으로 식별:

```cpp
bool IsSafeCheckCallForMovec(CallInst *CI) {
    StringRef callName = CI->getCalledFunction()->getName();
    return callName.equals("_RV_check_dpv") ||
           callName.equals("__RV_check_dpv_ss") ||
           // ... 기타 MoveC 함수들
}
```

### 태스크 그룹화

의존성이 없는 safe check들을 그룹화하여 하나의 병렬 태스크로 생성.

### 루프 분리

DOALL 병렬화를 위해 루프를 독립적인 함수로 분리하고, Live-in/Live-out 변수를 처리.

## 디버깅 팁

### 주요 디버그 출력

- `Loops::run` 시작/종료
- Safe Check 감지 로그
- 태스크 생성 로그
- 루프 분석 로그

### 주요 체크포인트

1. **Safe Check 감지**: `Utils.cpp`의 감지 함수들
2. **태스크 생성**: `LoopFreeTask.cpp`, `DOALLTask.cpp`
3. **코드 정리**: `eraseSafeCheckCodes` 함수들

## 참고 자료

- [LLVM 17 포팅 상세 로그](llvm17-port/LLVM17_PORTING_DETAILED_LOG.md)
- [LLVM 17 포팅 상태](llvm17-port/STATUS.md)
- [Safe Check 감지 분석](llvm17-port/SAFE_CHECK_DETECTION_ANALYSIS.md)

---

## Project Structure

```
Catamaran_artifact_issta23/
├── Catamaran-llvm-3.4/          # Original LLVM 3.4 version
│   └── llvm/lib/Transforms/CMPass/
├── Catamaran-llvm-17/            # LLVM 17 ported version (main work)
│   └── llvm/lib/Transforms/CMPass/
├── Catamaran-llvm-3.5.2/         # LLVM 3.5.2 version (for ASAN)
├── runtime/                      # Runtime library
│   └── ThreadPool.cpp            # Thread pool for parallel execution
├── examples/                     # Example files
│   ├── llvm17/                   # LLVM 17 examples
│   └── llvm34/                   # LLVM 3.4 examples
├── docker/                       # Docker files
│   ├── Dockerfile.llvm34
│   ├── Dockerfile.llvm14
│   └── Dockerfile.llvm17
└── scripts/                      # Build and run scripts
    ├── build-llvm17.sh
    ├── run-docker-llvm17.sh
    └── ...
```

## Key Files

### Core Pass Files

#### `Loops.cpp` / `Loops.h`
- **Role**: Main LLVM Pass. Analyzes loops and creates parallelization tasks
- **Key Features**:
  - Loop structure analysis
  - Safe Check detection (MoveC, ASAN)
  - Loop-Free Task and DOALL Task creation
  - Parallelization transformation
- **LLVM 17 Changes**:
  - Uses New PassManager (`PassInfoMixin<Loops>`)
  - Returns `PreservedAnalyses`
  - Opaque Pointers support

#### `LoopFreeTask.cpp` / `LoopFreeTask.h`
- **Role**: Task that parallelizes metadata checks outside loops
- **Key Features**:
  - Safe Check collection
  - Parallel task creation
  - Original code cleanup (`eraseSafeCheckCodes`)

#### `DOALLTask.cpp` / `DOALLTask.h`
- **Role**: Task that parallelizes checks inside loops (DOALL)
- **Key Features**:
  - Loop splitting (`splitLoop`)
  - Live-in/Live-out variable management
  - Parallel function creation
  - Original code cleanup (`eraseSafeCheckCodes`)

#### `Utils.cpp` / `Utils.h`
- **Role**: Utility functions
- **Key Functions**:
  - `IsSafeCheckCallForMovec`: Detects MoveC safe check functions
  - `IsSafeCheckCallForLoopFree`: Detects safe checks for Loop-Free
  - `IsIntraTaskConsideredForMC`: Considers MoveC intra-task

### Analysis and Dependency Files

#### `PDGAnalysis.cpp` / `PDGAnalysis.h`
- **Role**: Program Dependence Graph (PDG) analysis
- **Purpose**: Data and control dependence analysis

#### `LoopDependenceInfo.cpp` / `LoopDependenceInfo.h`
- **Role**: Loop dependence information management
- **Purpose**: Determines loop parallelization feasibility

#### `LoopStructure.cpp` / `LoopStructure.h`
- **Role**: Loop structure representation
- **Purpose**: Stores loop header, body, latch information

### Runtime

#### `runtime/ThreadPool.cpp`
- **Role**: Thread pool for parallel task execution
- **Key Features**:
  - Task scheduling
  - Thread management
  - Synchronization (join function)

## Code Flow

### 1. Pass Execution Flow

```
Loops::run()
  ├── getLoopStructures()          # Collect loop structures
  ├── PDGAnalysis::run()           # PDG analysis
  ├── Loop-Free Task creation
  │   └── LoopFreeTask::transform()
  └── DOALL Task creation
      └── DOALLTask::splitLoop()
```

### 2. Loop-Free Parallelization

```
1. Safe Check detection (Utils.cpp)
2. LoopFreeTask creation
3. Task grouping
4. Parallel function creation
5. Original code cleanup (eraseSafeCheckCodes)
```

### 3. DOALL Parallelization

```
1. Safe Check detection inside loops
2. Dependence analysis (PDG)
3. DOALLTask creation
4. Loop splitting (splitLoop)
   ├── Create new function
   ├── Handle Live-in variables
   └── Handle Live-out variables
5. Original code cleanup (eraseSafeCheckCodes)
```

## LLVM 17 Porting Key Changes

### 1. New PassManager

**Before (LLVM 3.4)**:
```cpp
class Loops : public ModulePass {
    bool runOnModule(Module &M) override;
};
```

**Now (LLVM 17)**:
```cpp
class Loops : public PassInfoMixin<Loops> {
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM);
};
```

### 2. Opaque Pointers

**Before**:
```cpp
PointerType::getUnqual(Type::getInt8Ty(ctx))
```

**Now**:
```cpp
PointerType::get(ctx, 0)  // address space 0
```

### 3. API Changes

- `getArgumentList()` → `args()`
- `getOrInsertFunction()` → Returns `FunctionCallee`
- `CallInst::Create()` → Uses `FunctionCallee`

## Key Algorithms

### Safe Check Detection

Detects safe check functions from MoveC and ASAN to identify parallelization targets:

```cpp
bool IsSafeCheckCallForMovec(CallInst *CI) {
    StringRef callName = CI->getCalledFunction()->getName();
    return callName.equals("_RV_check_dpv") ||
           callName.equals("__RV_check_dpv_ss") ||
           // ... other MoveC functions
}
```

### Task Grouping

Groups safe checks without dependencies into a single parallel task.

### Loop Splitting

Splits loops into independent functions for DOALL parallelization and handles Live-in/Live-out variables.

## Debugging Tips

### Key Debug Outputs

- `Loops::run` start/end
- Safe Check detection logs
- Task creation logs
- Loop analysis logs

### Key Checkpoints

1. **Safe Check Detection**: Detection functions in `Utils.cpp`
2. **Task Creation**: `LoopFreeTask.cpp`, `DOALLTask.cpp`
3. **Code Cleanup**: `eraseSafeCheckCodes` functions

## References

- [LLVM 17 Porting Detailed Log](llvm17-port/LLVM17_PORTING_DETAILED_LOG.md)
- [LLVM 17 Porting Status](llvm17-port/STATUS.md)
- [Safe Check Detection Analysis](llvm17-port/SAFE_CHECK_DETECTION_ANALYSIS.md)


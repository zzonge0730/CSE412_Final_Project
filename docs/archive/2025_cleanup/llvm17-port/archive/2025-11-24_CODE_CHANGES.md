# 2025-11-24 코드 수정 리포트: 런타임 안정성 및 루프 검출 개선

이 문서는 2025년 11월 24일에 수행된 주요 코드 수정 사항, 수정 배경(문제 원인), 그리고 의도를 상세히 기록합니다.

## 1. 비동기 태스크 환경 변수 할당 방식 변경 (Stack → Heap)

### 대상 파일
- `llvm/lib/Transforms/CMPass/LoopFreeTask.cpp` (`genSpawnArgs` 함수)
- `llvm/lib/Transforms/CMPass/DOALLTask.cpp` (`genSpawnArgs` 함수)

### 문제 상황 (Problem)
- 병렬화된 태스크는 `spawn` API를 통해 비동기적으로 실행됩니다.
- 기존 코드는 태스크에 전달할 환경 변수 배열(`env`)을 **스택(`alloca`)에 할당**했습니다.
- 메인 스레드(부모 함수)가 `spawn` 호출 후 태스크가 완료되기 전에 함수를 리턴해버리는 경우, 스택 프레임이 파괴됩니다.
- 실행 중인 태스크가 파괴된 스택 메모리의 `env` 포인터를 참조하려고 하면 **Use-After-Return** 버그가 발생하며, 이는 정의되지 않은 동작(쓰레기 값 읽기, 세그멘테이션 폴트 등)으로 이어집니다.
- 특히 MoveC 벤치마크(`2mm` 등) 실행 시 바이너리가 즉시 종료되거나 오동작하는 원인으로 지목되었습니다.

### 수정 내용 (Solution)
- `IRBuilder::CreateAlloca` 대신 `malloc` 함수 호출을 생성하도록 변경했습니다.
- 환경 변수 배열을 **힙(Heap) 영역에 할당**하여, 부모 함수의 리턴 여부와 관계없이 메모리가 유지되도록 했습니다.

### 코드 변경 예시
```cpp
// Before (Stack Allocation)
AllocaInst *envAlloca = envBuilder.CreateAlloca(arrTy, nullptr, "lf_spawn_env");

// After (Heap Allocation)
FunctionCallee mallocFunc = M->getOrInsertFunction("malloc", ...);
CallInst *envMalloc = envBuilder.CreateCall(mallocFunc, {sizeVal}, "lf_spawn_env_malloc");
```

### 남은 과제
- 현재 `malloc`으로 할당된 메모리에 대한 `free` 로직이 추가되지 않았습니다. (Memory Leak 발생)
- 단기 실행되는 벤치마크에서는 문제가 없으나, 장기 실행 프로그램에서는 태스크 종료 시점에 `free`를 호출하도록 래퍼 함수(`wrapperFunc`)를 수정해야 합니다.

---

## 2. 루프 검출 범위 확대 (Reachable → All Functions)

### 대상 파일
- `llvm/lib/Transforms/CMPass/Loops.cpp` (`getLoopStructures` 함수)

### 문제 상황 (Problem)
- 기존 코드는 `main` 함수에서 시작하여 호출 그래프(Call Graph)를 타고 도달 가능한(Reachable) 함수들만 분석 대상으로 삼았습니다.
- MoveC 등의 도구가 코드를 계측(Instrumentation)하는 과정에서 호출 관계를 변경하거나, 간접 호출(Indirect Call)이 많은 경우 일부 함수가 Reachable 집합에서 누락되었습니다.
- 그 결과, 핵심 연산 커널(예: `MoveC-2mm.ll`의 `kernel_2mm`)에 존재하는 루프들이 `Loops` 패스에서 감지되지 않고 병렬화 대상에서 제외되었습니다.

### 수정 내용 (Solution)
- Reachable 분석 로직을 제거하고, **모듈 내의 모든 함수를 순회**하는 방식으로 변경했습니다.
- 이를 통해 호출 그래프의 연결 상태와 무관하게 모든 함수 내의 루프를 빠짐없이 검출할 수 있게 되었습니다.

### 코드 변경 예시
```cpp
// Before (Reachable only)
// getReachableFunctions(functions, mainFunction);

// After (All functions)
for (auto &F : *this->program) {
    functions.push_back(&F);
}
```

---

## 3. 기타 검토 사항 및 향후 계획

### ASAN 호환성
- `Utils.cpp`의 `IsSafeCheckFun` 등에서 ASAN 함수(`__asan_...`)를 감지하는 로직을 확인했습니다.
- LLVM 17에서도 `__asan_` 접두사는 유효하나, 초기화 함수(`__asan_init`) 등 병렬화하면 안 되는 함수들까지 포함될 위험이 있어 추후 필터링 로직 보강이 필요합니다.

### DOALLTask LLVM 17 포팅
- `DOALLTask.cpp`에서 `PointerType::getUnqual` 등의 구형 API 사용을 확인했으나, 일부는 `PointerType::get(ctx, 0)` (Opaque Pointer) 호환 코드로 수정된 것으로 보입니다.
- 컴파일 에러 발생 시 추가적인 타입 관련 수정이 필요할 수 있습니다.


# 논문 원본 아티팩트 검증 결과

## 검증 목적

논문에서 제시한 아티팩트 코드가 정말로 LoopFreeTask만 사용했는지, 아니면 DOALLTask를 사용했는지 확인하여 메타데이터 누락 문제가 원래부터 있던 설계 문제인지 검증.

## 검증 방법

1. 논문 원본 아티팩트 tar 파일 압축 해제 (`/home/rkddngpr/paper_artifact_verification/`)
2. `LoopsMovec.cpp`와 `Loops.cpp`의 `ENABLELOOP`, `ENABLELOOPFREE` 설정 확인
3. `DOALLTask::genSpawnArgs`와 `DOALLTask::splitLoop` 코드 확인

## 검증 결과

### 1. 논문 원본 아티팩트 설정

**파일**: `Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMPass/LoopsMovec.cpp`

```cpp
#define ENABLELOOP 1
#define ENABLELOOPFREE 0
```

**파일**: `Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMPass/Loops.cpp`

```cpp
#define ENABLELOOP 1
#define ENABLELOOPFREE 0
```

**결론**: 논문 원본 아티팩트는 **DOALLTask만 사용** (`ENABLELOOPFREE 0`)

### 2. DOALLTask::genSpawnArgs 분석

**논문 원본 코드** (`DOALLTask.cpp:274-311`):

```cpp
std::vector<Value *> DOALLTask::genSpawnArgs(Module *M, Function * wrapperFunc) {
    // ...
    for (auto liveIn : this->liveInVars) {
        if (this->isLocalVarLiveIn(liveIn)) continue;
        // ... bitcast 처리 ...
        args.push_back(bcInst);  // liveInVars만 전달
    }
    return args;
}
```

**특징**:
- `liveInVars`만 전달
- 메타데이터 자동 추가 로직 **없음**
- 환경 포인터 사용 안 함 (직접 인자로 전달)

### 3. DOALLTask::splitLoop 분석

**논문 원본 코드** (`DOALLTask.cpp:480-510`):

```cpp
void DOALLTask::splitLoop() {
    // ...
    std::vector<Value *> nonLocalLiveIn;
    for (auto livein : this->liveInVars) {
        if (this->isLocalVarLiveIn(livein)) continue;
        nonLocalLiveIn.push_back(livein); 
    }
    // 메타데이터 자동 추가 로직 없음
    // ...
}
```

**특징**:
- `liveInVars`에서 `nonLocalLiveIn` 생성
- 메타데이터 자동 추가 로직 **없음**
- 원본 함수 인자 분석하여 메타데이터 매핑하는 로직 **없음**

## 결론

### 1. 논문 원본 아티팩트도 같은 문제가 있었음

- **논문 원본**: `ENABLELOOP 1`, `ENABLELOOPFREE 0` → **DOALLTask만 사용**
- **메타데이터 자동 추가 로직 없음**: `splitLoop`에서 메타데이터를 `liveInVars`에 자동 추가하는 로직이 없음
- **결과**: 논문 원본 아티팩트도 MoveC 메타데이터 누락 문제가 있었을 가능성이 높음

### 2. 왜 논문에서 문제가 드러나지 않았을까?

가능한 이유:
1. **테스트 입력이 작았을 수 있음**: 작은 입력에서는 spatial error가 드러나지 않을 수 있음
2. **MoveC β만 테스트했을 수 있음**: Catamaran γ 테스트를 하지 않았을 수 있음
3. **문제를 인지하지 못했을 수 있음**: Spatial error가 발생해도 논문에 언급하지 않았을 수 있음
4. **다른 벤치마크 사용**: MoveC 대신 다른 메모리 안전성 도구(예: SoftBoundCETS)를 주로 사용했을 수 있음

### 3. LLVM 3.4 재현 로그와의 차이

- **LLVM 3.4 재현 로그** (`docs/llvm34-reproduction/`): `ENABLELOOPFREE`를 1로 변경하여 LoopFreeTask 사용
- **논문 원본**: `ENABLELOOPFREE 0`으로 DOALLTask만 사용
- **차이점**: 재현 로그에서는 LoopFreeTask를 사용했기 때문에 메타데이터 문제가 없었음 (LoopFreeTask는 체크 함수의 모든 인자를 전달하므로)

### 4. 최종 결론

**이 문제는 LLVM 17 포팅 과정에서 만든 문제가 아니라, 원래부터 DOALLTask에 있던 설계 문제입니다.**

- 논문 원본 아티팩트도 DOALLTask만 사용했고, 메타데이터 자동 추가 로직이 없었음
- LLVM 3.4 재현 로그에서는 LoopFreeTask를 사용했기 때문에 문제가 드러나지 않았음
- LLVM 17에서는 DOALLTask와 LoopFreeTask를 모두 사용하면서 문제가 드러남

## 검증 파일 위치

- 논문 원본 아티팩트: `/home/rkddngpr/paper_artifact_verification/Catamaran_artifact_issta23/`
- 검증 날짜: 2024년 11월 25일


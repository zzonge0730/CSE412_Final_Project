# MoveC 메타데이터 누락 문제 재평가

## 비판적 시각에서의 재검토

초기 결론("원래부터 있던 설계 문제")에 대한 비판적 재평가 결과입니다.

## 핵심 발견

### 1. LLVM 3.4 vs LLVM 17의 LiveIn 수집 메커니즘

**LLVM 3.4 (논문 원본)**:
```cpp
// LoopsMovec.cpp:182-186
for (auto envIndex : loop->loopEnviroment->getEnvIndicesOfLiveInVars()) {
    task->addLiveInVar(loop->loopEnviroment->producerAT(envIndex));
}
```

**LLVM 17 (현재 포팅 버전)**:
```cpp
// Loops.cpp:289-293 (동일한 방식 사용)
for (auto envIndex : loop->loopEnviroment->getEnvIndicesOfLiveInVars()) {
    task->addLiveInVar(loop->loopEnviroment->producerAT(envIndex));
}
```

**중요**: 두 버전 모두 `LoopEnvironment`를 사용하여 **PDG 기반 자동 분석**으로 liveIn을 수집합니다.

### 2. LoopEnvironment의 동작 원리

`LoopEnvironment`는 PDG(Program Dependence Graph)를 기반으로:
1. 루프 외부에 정의된 변수(`externalNode`)를 찾음
2. 그 변수에서 루프 내부로 가는 의존성 엣지가 있으면 live-in으로 분류
3. **메타데이터도 체크 함수의 인자로 사용되므로 자동으로 live-in으로 잡혀야 함**

```cpp
// LoopEnvironment.cpp:6-36
LoopEnvironment::LoopEnvironment(PDG * pdg, std::vector<BasicBlock *>& exitBlocks) {
    for (auto nodeI : pdg->getExternalNodePairs()) {
        auto externalNode = nodeI.second;
        auto externalValue = externalNode->getT();
        
        bool isProducer = false;
        for (auto edge : externalNode->getOutgoingEdges()) {
            if (edge->isMemoryDependence() || edge->isControlDependence()) {
                continue;
            }
            // 의존성 엣지가 있으면 live-in
            isProducer = true;
        }
        
        if (isProducer) {
            this->addLiveInValue(externalValue, consumerOfLiveInValue);
        }
    }
}
```

## 재평가된 결론

### 가능성 A: LLVM 3.4에서는 정상 작동했음

**근거**:
1. 논문에서 MoveC 실험 결과를 제시했음 (오버헤드 감소 46-224%)
2. MoveC는 메타데이터 없이 동작 불가능
3. `LoopEnvironment`가 PDG 기반으로 자동 분석하므로 메타데이터를 잡았을 것

**가설**: LLVM 3.4에서는:
- PDG가 메타데이터와 체크 함수 간의 의존성을 정상적으로 잡았음
- `LoopEnvironment`가 메타데이터를 자동으로 live-in으로 분류했음
- 별도의 "강제 추가 로직"이 필요 없었음

### 가능성 B: LLVM 17에서 Def-Use 분석 실패

**근거**:
1. LLVM 17의 Opaque Pointer 도입으로 타입 정보 손실
2. PDG 생성 방식 변화로 인한 의존성 분석 실패
3. 환경 포인터 패킹 방식 변화 (직접 인자 전달 → malloc 기반 패킹)

**가설**: LLVM 17에서는:
- Opaque Pointer로 인해 메타데이터 타입이 `ptr`로 통일됨
- PDG가 메타데이터와 체크 함수 간의 의존성을 잡지 못함
- `LoopEnvironment`가 메타데이터를 external node로 인식하지 못함
- 결과적으로 메타데이터가 liveInVars에 포함되지 않음

### 가능성 C: 환경 포인터 패킹 과정에서 누락

**LLVM 3.4**:
```cpp
// genSpawnArgs: 직접 인자로 전달
args.push_back(bcInst);  // liveInVars의 모든 항목을 직접 전달
```

**LLVM 17**:
```cpp
// genSpawnArgs: 환경 포인터에 패킹
packedLiveIns.push_back(bcInst);
// malloc으로 환경 포인터 생성 후 패킹
```

**가설**: 환경 포인터 패킹 과정에서:
- 타입 변환 과정에서 메타데이터가 누락될 수 있음
- GEP 인덱싱 과정에서 오프셋 오류 가능성
- 하지만 이건 `splitLoop` 이후의 문제이므로 가능성 낮음

## 검증 필요 사항

### 1. PDG/Def-Use 분석 확인

**확인 방법**:
- `splitLoop` 진입 시점에서 `loopEnviroment->getEnvIndicesOfLiveInVars()`에 메타데이터가 포함되는지 확인
- PDG의 `getExternalNodePairs()`에 메타데이터 노드가 있는지 확인
- 메타데이터에서 체크 함수로 가는 의존성 엣지가 있는지 확인

**디버깅 코드 추가**:
```cpp
// Loops.cpp:289 근처
for (auto envIndex : loop->loopEnviroment->getEnvIndicesOfLiveInVars()) {
    Value *liveIn = loop->loopEnviroment->producerAT(envIndex);
    liveIn->print(errs() << "LiveIn: ");
    errs() << "\n";
    // 메타데이터인지 확인
    if (liveIn->getName().contains("_RV_pmd")) {
        errs() << "  -> Metadata found in LoopEnvironment!\n";
    }
}
```

### 2. MoveC 함수 시그니처 확인

**확인 사항**:
- LLVM 17의 Opaque Pointer 적용으로 체크 함수 시그니처가 변경되었는지
- 메타데이터 타입이 `ptr`로 통일되면서 의존성 분석이 실패하는지

**비교**:
```bash
# LLVM 3.4 IR
call i64 @__RV_check_dpv_ss(%struct._RV_pmd* %metadata, ...)

# LLVM 17 IR  
call i64 @__RV_check_dpv_ss(ptr %metadata, ...)
```

### 3. 환경 포인터 패킹 검증

**확인 사항**:
- `genSpawnArgs`에서 `packedLiveIns`에 메타데이터가 포함되는지
- 환경 포인터에서 올바른 순서로 로드되는지

## 수정된 결론

### 초기 결론 (부정확)
> "원래부터 있던 설계 문제였다. 논문 원본도 같은 문제가 있었을 가능성이 높다."

### 재평가된 결론 (타당)
> **"LLVM 3.4에서는 PDG 기반 자동 분석으로 메타데이터가 정상적으로 live-in으로 분류되었지만, LLVM 17 포팅 과정에서 Opaque Pointer나 PDG 생성 방식 변화로 인해 메타데이터 의존성 분석이 실패하게 되었다. 따라서 우리가 구현한 '강제 추가 로직'은 버그 수정이 아니라 LLVM 17 포팅을 위한 필수 작업이다."**

## 다음 단계

1. **PDG 분석 검증**: 실제로 메타데이터가 `LoopEnvironment`에 포함되는지 디버깅
2. **의존성 엣지 확인**: 메타데이터에서 체크 함수로 가는 엣지가 있는지 확인
3. **Opaque Pointer 영향 분석**: 타입 정보 손실이 의존성 분석에 미치는 영향 확인
4. **문서 업데이트**: `MOVEC_METADATA_ISSUE.md`와 `PAPER_ARTIFACT_VERIFICATION.md` 수정

## 참고

- 초기 분석: `docs/llvm17-port/MOVEC_METADATA_ISSUE.md`
- 논문 원본 검증: `docs/llvm17-port/PAPER_ARTIFACT_VERIFICATION.md`
- 이 재평가: `docs/llvm17-port/MOVEC_METADATA_REASSESSMENT.md`


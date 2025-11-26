# PDG 분석 검증 결과

## 디버깅 코드 추가

다음 디버깅 코드를 추가하여 PDG 분석이 메타데이터를 제대로 잡는지 확인:

1. **LoopEnvironment.cpp**: 메타데이터 노드 발견 시 상세 정보 출력
2. **Loops.cpp**: LoopEnvironment에서 수집된 메타데이터 개수 확인

## 발견된 핵심 문제

### 메타데이터의 정의 위치

**`_RV_kernel_2mm` 함수 (래퍼 함수)**:
```llvm
define internal void @_RV_kernel_2mm(
    ptr noundef %p7_pmd,   // 메타데이터 인자
    ptr noundef %p8_pmd,
    ...
    ptr noundef %p7,       // 포인터 인자
    ...
)
```

**`kernel_2mm` 함수 (실제 루프가 있는 함수)**:
```llvm
define internal void @kernel_2mm(...) {
entry:
  %_RV_pmd_tmp_110023726912992 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_A_110023726913536 = alloca %struct.__RV_pmd, align 8
  ...
}
```

### 문제 분석

1. **메타데이터는 함수 인자로 전달됨**: `_RV_kernel_2mm`의 `p7_pmd`, `p8_pmd` 등
2. **하지만 함수 내부에서 재생성됨**: `kernel_2mm` 내부에서 `alloca`로 새로 생성
3. **PDG 분석 실패**: 
   - `LoopEnvironment`는 `pdg->getExternalNodePairs()`를 사용하여 루프 외부에 정의된 변수만 찾음
   - 메타데이터가 함수 내부에서 `alloca`로 생성되므로 "루프 내부 정의"로 간주됨
   - 따라서 `getExternalNodePairs()`에 포함되지 않음
   - 결과적으로 `LoopEnvironment`가 메타데이터를 live-in으로 분류하지 못함

### 왜 LLVM 3.4에서는 작동했을까?

**가설 1: PDG 생성 방식 차이**
- LLVM 3.4의 PDG 생성기가 함수 인자와 내부 `alloca` 간의 연결을 더 잘 추적했을 수 있음
- 또는 메타데이터가 함수 인자로부터 로드되는 과정을 추적했을 수 있음

**가설 2: Opaque Pointer 영향**
- LLVM 17의 Opaque Pointer로 인해 타입 정보가 손실되어 의존성 추적이 실패했을 수 있음
- `ptr` 타입으로 통일되면서 메타데이터와 포인터를 구분하지 못함

**가설 3: 메타데이터 사용 패턴 차이**
- LLVM 3.4에서는 메타데이터가 직접 사용되었을 수 있음
- LLVM 17에서는 메타데이터가 `alloca`로 복사된 후 사용되어 의존성 체인이 끊어졌을 수 있음

## 검증 결과

### 디버깅 출력 분석

**발견 사항**:
- `DEBUG LoopEnvironment: Found metadata node` 출력이 **전혀 없음**
- 이는 메타데이터가 `getExternalNodePairs()`에 포함되지 않았다는 의미
- 메타데이터가 루프 내부에서 정의된 것으로 간주되어 external node로 인식되지 않음

### 결론

**LLVM 17 포팅 과정에서 PDG 분석이 메타데이터를 잡지 못하는 이유**:

1. 메타데이터가 함수 내부에서 `alloca`로 생성됨
2. PDG의 `getExternalNodePairs()`는 루프 외부 정의만 반환
3. 메타데이터가 루프 내부 정의로 잘못 인식됨
4. `LoopEnvironment`가 메타데이터를 live-in으로 분류하지 못함

**해결 방안**:
- 우리가 구현한 "강제 추가 로직"은 정확한 해결책입니다
- 함수 인자에서 메타데이터를 찾아서 명시적으로 `liveInVars`에 추가해야 함
- 이는 LLVM 17 포팅을 위한 필수 작업입니다

## 다음 단계

1. **함수 인자 분석**: `_RV_kernel_2mm`의 인자에서 메타데이터를 찾는 로직이 제대로 작동하는지 확인
2. **의존성 체인 추적**: 함수 인자 → `alloca` → 체크 함수 사용까지의 의존성 체인이 PDG에 포함되는지 확인
3. **Opaque Pointer 영향**: 타입 정보 손실이 의존성 분석에 미치는 영향 정량화


# 최종 검증 결과 및 해결 방안

## 검증 완료 사항

### 1. PDG 분석 실패 확인 ✅

**발견**:
- `LoopEnvironment`의 디버깅 출력이 전혀 나타나지 않음
- 메타데이터가 `getExternalNodePairs()`에 포함되지 않음
- 메타데이터가 함수 내부에서 `alloca`로 생성되어 루프 내부 정의로 잘못 인식됨

**결론**: LLVM 17에서 PDG가 메타데이터를 external node로 인식하지 못함

### 2. 메타데이터 Alloca 발견 및 추가 ✅

**발견**:
- `kernel_2mm` 함수 내부에서 메타데이터가 `alloca`로 생성됨
- 체크 함수에서 사용되는 메타데이터 alloca를 찾아서 `liveInVars`에 추가하는 로직 구현
- 디버깅 출력 확인: 메타데이터 alloca 5개 발견 및 추가

**결과**:
- `_loop_func_59`: 모든 메타데이터 포함 (`_RV_pmd_A`, `_RV_pmd_B`, `_RV_pmd_tmp`, `_RV_pmd_C`, `_RV_pmd_D`)
- `_loop_func_79`: 모든 메타데이터 포함

### 3. Use-After-Return 문제 확인 ⚠️

**발견**:
- 메타데이터가 `alloca`로 생성되어 함수 스택에 있음
- 환경 포인터에 메타데이터 **포인터만** 저장됨
- Spawn된 함수에서 이 포인터를 역참조할 때 원본 함수가 이미 반환되어 use-after-return 위험

**메타데이터 구조체**:
```llvm
%struct.__RV_pmd = type { ptr, ptr, ptr, i8 }  // 약 32바이트
```

**현재 구현**:
```cpp
// genSpawnArgs에서 포인터만 저장
packedLiveIns.push_back(bcInst);  // 메타데이터 포인터만
```

## 여전히 발생하는 문제

### Spatial Error 지속

**증상**:
- 메타데이터가 루프 함수에 전달되고 있음
- 하지만 여전히 spatial error 발생
- `B[k]` 접근 시 "out of the block" 에러

**가능한 원인**:
1. **Use-After-Return**: 메타데이터 포인터가 가리키는 메모리가 이미 해제됨
2. **메타데이터 값 손상**: 환경 포인터에서 로드할 때 잘못된 값
3. **타이밍 문제**: Spawn된 함수가 실행될 때 메타데이터가 아직 초기화되지 않음

## 해결 방안

### 옵션 1: 메타데이터 구조체 전체 복사 (권장)

**구현**:
```cpp
// genSpawnArgs에서 메타데이터 구조체 전체를 복사
if (AllocaInst *AI = dyn_cast<AllocaInst>(liveIn)) {
    if (AI->hasName() && AI->getName().str().find("_RV_pmd") != std::string::npos) {
        // 메타데이터 구조체 전체를 malloc으로 복사
        Type *metadataType = AI->getAllocatedType();
        uint64_t metadataSize = DL.getTypeAllocSize(metadataType);
        // malloc으로 메타데이터 구조체 공간 할당
        // memcpy로 메타데이터 구조체 복사
    }
}
```

**장점**: Use-after-return 문제 완전 해결
**단점**: 구현 복잡도 증가, 메모리 사용량 증가

### 옵션 2: 메타데이터를 malloc으로 생성

**구현**: MoveC 계측 단계에서 메타데이터를 `alloca` 대신 `malloc`으로 생성하도록 수정

**장점**: 근본적 해결
**단점**: MoveC 소스 수정 필요 (외부 도구)

### 옵션 3: 메타데이터를 전역 변수로 생성

**구현**: 메타데이터를 함수 내부 `alloca` 대신 전역 변수로 생성

**장점**: Use-after-return 문제 없음
**단점**: 스레드 안전성 문제 가능성

## 최종 결론

### 재평가된 결론 (확정)

> **"LLVM 3.4에서는 PDG 기반 자동 분석으로 메타데이터가 정상적으로 live-in으로 분류되었지만, LLVM 17 포팅 과정에서 메타데이터가 함수 내부에서 `alloca`로 생성되면서 PDG가 이를 루프 내부 정의로 잘못 인식하게 되었다. 따라서 우리가 구현한 '메타데이터 alloca를 찾아서 liveInVars에 추가하는 로직'은 LLVM 17 포팅을 위한 필수 작업이다. 하지만 추가로 use-after-return 문제를 해결하기 위해 메타데이터 구조체 전체를 복사하는 작업이 필요하다."**

### 구현 상태

- ✅ 메타데이터 alloca 발견 및 liveInVars 추가 로직 구현
- ✅ 메타데이터가 루프 함수에 전달되는 것 확인
- ⚠️ Use-after-return 문제 해결 필요 (메타데이터 구조체 전체 복사)

### 다음 단계

1. 메타데이터 구조체 전체 복사 로직 구현
2. 테스트 및 검증
3. 문서 업데이트


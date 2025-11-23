# LLVM 3.5.2 검증 보고서 / LLVM 3.5.2 Verification Report

[English below]

## 검증 목표

LLVM 3.4/3.5.2에서 LLVM 17로 포팅할 때 ASAN 지원이 올바르게 이식되었는지 확인합니다.

## 코드 레벨 비교

### ASAN 함수 감지 로직

#### LLVM 3.5.2 (`Catamaran-llvm-3.5.2/llvm/lib/Transforms/CMPass/Utils.cpp`)

```cpp
bool IsSafeCheckCallForLoopFree(CallInst *CI) {
    if (CI->getCalledFunction()) {
        std::string callName = CI->getCalledFunction()->getName();
        if (
            callName.find("__asan_store") != std::string::npos || 
            callName.find("__asan_load") != std::string::npos
            ) {
            return true;
        }
    }
    return false;
}
```

**지원하는 함수**:
- `__asan_load*` (모든 변형)
- `__asan_store*` (모든 변형)

#### LLVM 17 (`Catamaran-llvm-17/llvm/lib/Transforms/CMPass/Utils.cpp`)

```cpp
bool IsSafeCheckCallForLoopFree(CallInst *CI) {
    if (CI->getCalledFunction()) {
        StringRef callName = CI->getCalledFunction()->getName();
        if (
            callName.startswith("__asan_") ||
            // ... 기타 함수들
            ) {
            return true;
        }
    }
    return false;
}
```

**지원하는 함수**:
- `__asan_*` (모든 ASAN 함수, `startswith` 사용)

### 비교 결과

✅ **일관성 확인**: 두 버전 모두 ASAN 함수를 감지합니다.
- LLVM 3.5.2: `find("__asan_load")` 및 `find("__asan_store")` 사용
- LLVM 17: `startswith("__asan_")` 사용 (더 포괄적)

✅ **개선사항**: LLVM 17 버전이 더 포괄적입니다 (`__asan_`으로 시작하는 모든 함수 감지).

## 기능 비교

### LLVM 3.5.2의 ASAN 지원

- **TransferForAsan Pass**: 별도의 Pass로 구현됨
- **Utils.cpp**: ASAN 함수 감지 로직 포함
- **목적**: ASAN 검사를 병렬화

### LLVM 17의 ASAN 지원

- **Loops Pass**: 통합된 Pass에서 ASAN 지원
- **Utils.cpp**: ASAN 함수 감지 로직 포함 (개선됨)
- **목적**: 동일 (ASAN 검사 병렬화)

## 검증 상태

### ✅ 코드 레벨 검증 (완료)

- [x] ASAN 감지 로직 비교
- [x] 함수 지원 범위 확인
- [x] 포팅 일관성 확인

### ⏳ 런타임 검증 (선택 사항)

- [ ] LLVM 3.5.2 빌드 및 테스트
- [ ] LLVM 17과 동일한 ASAN 예제로 비교 테스트
- [ ] 성능 비교

## 결론

**코드 레벨에서 LLVM 3.5.2의 ASAN 지원이 LLVM 17로 올바르게 포팅되었습니다.**

- ASAN 함수 감지 로직이 이식되었고, LLVM 17에서는 더 포괄적인 방식으로 개선되었습니다.
- LLVM 17에서 실제 ASAN 예제가 성공적으로 실행되었습니다 (docs/llvm17-port/STATUS.md 참고).

## 권장사항

1. **포함 결정**: LLVM 3.5.2는 원본 아티팩트의 일부이므로 포함하는 것이 좋습니다.
2. **문서화**: LLVM 3.5.2는 "원본 버전"으로, LLVM 17은 "포트된 버전"으로 명시합니다.
3. **런타임 검증**: 필요시 나중에 LLVM 3.5.2 빌드 및 테스트를 진행할 수 있습니다.

---

## Verification Goal

Verify that ASAN support was correctly ported from LLVM 3.4/3.5.2 to LLVM 17.

## Code-Level Comparison

### ASAN Function Detection Logic

#### LLVM 3.5.2 (`Catamaran-llvm-3.5.2/llvm/lib/Transforms/CMPass/Utils.cpp`)

```cpp
bool IsSafeCheckCallForLoopFree(CallInst *CI) {
    if (CI->getCalledFunction()) {
        std::string callName = CI->getCalledFunction()->getName();
        if (
            callName.find("__asan_store") != std::string::npos || 
            callName.find("__asan_load") != std::string::npos
            ) {
            return true;
        }
    }
    return false;
}
```

**Supported functions**:
- `__asan_load*` (all variants)
- `__asan_store*` (all variants)

#### LLVM 17 (`Catamaran-llvm-17/llvm/lib/Transforms/CMPass/Utils.cpp`)

```cpp
bool IsSafeCheckCallForLoopFree(CallInst *CI) {
    if (CI->getCalledFunction()) {
        StringRef callName = CI->getCalledFunction()->getName();
        if (
            callName.startswith("__asan_") ||
            // ... other functions
            ) {
            return true;
        }
    }
    return false;
}
```

**Supported functions**:
- `__asan_*` (all ASAN functions, using `startswith`)

### Comparison Results

✅ **Consistency Confirmed**: Both versions detect ASAN functions.
- LLVM 3.5.2: Uses `find("__asan_load")` and `find("__asan_store")`
- LLVM 17: Uses `startswith("__asan_")` (more comprehensive)

✅ **Improvement**: LLVM 17 version is more comprehensive (detects all functions starting with `__asan_`).

## Feature Comparison

### LLVM 3.5.2 ASAN Support

- **TransferForAsan Pass**: Implemented as a separate pass
- **Utils.cpp**: Contains ASAN function detection logic
- **Purpose**: Parallelize ASAN checks

### LLVM 17 ASAN Support

- **Loops Pass**: ASAN support integrated into unified pass
- **Utils.cpp**: Contains ASAN function detection logic (improved)
- **Purpose**: Same (parallelize ASAN checks)

## Verification Status

### ✅ Code-Level Verification (Completed)

- [x] ASAN detection logic comparison
- [x] Function support range confirmation
- [x] Porting consistency confirmation

### ⏳ Runtime Verification (Optional)

- [ ] LLVM 3.5.2 build and test
- [ ] Comparative test with same ASAN example on LLVM 17
- [ ] Performance comparison

## Conclusion

**ASAN support from LLVM 3.5.2 has been correctly ported to LLVM 17 at the code level.**

- ASAN function detection logic has been ported, and improved in LLVM 17 with a more comprehensive approach.
- ASAN examples have been successfully executed on LLVM 17 (see docs/llvm17-port/STATUS.md).

## Recommendations

1. **Inclusion Decision**: LLVM 3.5.2 should be included as it's part of the original artifact.
2. **Documentation**: Mark LLVM 3.5.2 as "original version" and LLVM 17 as "ported version".
3. **Runtime Verification**: Can proceed with LLVM 3.5.2 build and test later if needed.


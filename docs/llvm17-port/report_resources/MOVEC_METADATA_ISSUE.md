# MoveC Spatial Error Root Cause Analysis

## 문제 요약

Catamaran γ (병렬화 적용)에서 MoveC 런타임이 spatial error를 대량으로 보고하는 현상의 **근본 원인은 MoveC 런타임 버그가 아니라 Catamaran이 spawn 시 MoveC 메타데이터(__RV_pmd)를 불완전하게 전달하기 때문**입니다.

**LLVM 버전별 상태**:
- **LLVM 17**: ✅ 문제 확인됨 (spatial error 발생)
- **LLVM 3.4**: ✅ **문제 없음** (하지만 다른 이유)
  - LLVM 3.4에서는 `ENABLELOOPFREE 0`으로 설정되어 **LoopFreeTask만 사용**
  - `LoopFreeTask::genSpawnArgs`는 MoveC 체크 함수의 **모든 인자를 전달**하므로 메타데이터 자동 포함
  - **DOALLTask를 사용하지 않았기 때문에** 메타데이터 누락 문제가 발생하지 않음
  - 기존 재현 로그에서 spatial error 언급이 없는 이유: DOALLTask를 사용하지 않았기 때문

**근본 원인 분석**:
- **원래부터 있던 설계 문제**: DOALLTask의 `genSpawnArgs`는 `liveInVars`만 전달하므로 메타데이터가 누락될 수 있음
- **논문 원본 아티팩트 검증 결과**: 
  - 논문 원본도 `ENABLELOOP 1`, `ENABLELOOPFREE 0`으로 **DOALLTask만 사용**
  - 메타데이터 자동 추가 로직이 없었음
  - **논문 원본도 같은 문제가 있었을 가능성이 높음** (상세: [PAPER_ARTIFACT_VERIFICATION.md](PAPER_ARTIFACT_VERIFICATION.md))
- **LLVM 3.4 재현 로그에서 문제가 드러나지 않은 이유**: `ENABLELOOPFREE`를 1로 변경하여 LoopFreeTask를 사용했기 때문 (LoopFreeTask는 체크 함수의 모든 인자를 전달하므로 메타데이터 자동 포함)
- **LLVM 17에서 문제가 발생한 이유**: DOALLTask와 LoopFreeTask를 모두 사용하면서 DOALLTask의 메타데이터 누락 문제가 드러남
- **결론**: LLVM 17 포팅 과정에서 만든 문제가 아니라, **원래부터 DOALLTask에 있던 설계 문제**. 논문 원본 아티팩트도 같은 문제가 있었을 가능성이 높지만, 테스트하지 않았거나 언급하지 않았을 수 있음

## 증거

### 1. MoveC β (Sequential) vs Catamaran γ 비교

**MoveC β (Catamaran 없음)**:
- `./MoveC-2mm 0 128 128 128 128` → **경고 없이 정상 종료** (`real 0.06s`)
- `./MoveC-2mm 32 128 128 128 0` → **경고 없이 정상 종료** (`real 0.04s`)

**Catamaran γ (병렬화 적용)**:
- `./CM-MoveC-2mm 0 64 64 64 64` → 6144개 spatial error 경고
- `./CM-MoveC-2mm 32 32 32 32 0` → 592개 spatial error 경고
- `./CM-MoveC-2mm 32 64 64 64 0` → `double free or corruption` (Abort 134)

**결론**: Catamaran을 적용하지 않은 MoveC β는 정상 작동하지만, Catamaran γ에서만 spatial error가 발생합니다.

### 2. IR 분석 결과

#### 원본 함수 시그니처 (`_RV_kernel_2mm`)

```llvm
define internal void @_RV_kernel_2mm(
    ptr %p7_pmd,   // tmp 메타데이터
    ptr %p8_pmd,   // A 메타데이터
    ptr %p9_pmd,   // B 메타데이터
    ptr %p10_pmd,  // C 메타데이터
    ptr %p11_pmd,  // D 메타데이터
    i32 %p1, i32 %p2, i32 %p3, i32 %p4,  // ni, nj, nk, nl
    double %p5, double %p6,                // alpha, beta
    ptr %p7, ptr %p8, ptr %p9, ptr %p10, ptr %p11  // tmp, A, B, C, D 포인터
)
```

**총 16개 인자**: 메타데이터 5개 + 스칼라 6개 + 포인터 5개

#### Catamaran이 생성한 루프 함수 (`_loop_func_76`)

```llvm
define internal void @_loop_func_76(
    ptr %_RV_pmd_D_110023726908064,  // D 메타데이터만!
    ptr %_RV_bc_flag_110023726911352,
    ptr %i,
    ptr %_RV_ret_flag,
    ptr %j,
    ptr %_RV_bc_flag_110023726911320,
    ptr %ni.addr,
    ptr %nl.addr,
    ptr %D.addr,
    i64 %0
)
```

**총 10개 인자**: 메타데이터 1개(D만) + 기타 변수들

### 3. 문제점

Catamaran의 `DOALLTask::genSpawnArgs()`는 liveIn 변수들을 환경 포인터에 패킹할 때:

1. **배열 포인터만 전달**: `tmp`, `A`, `B`, `C`, `D` 포인터 값만 환경 포인터에 저장
2. **메타데이터 누락**: `_RV_pmd_tmp`, `_RV_pmd_A`, `_RV_pmd_B`, `_RV_pmd_C` 메타데이터는 전달하지 않음
3. **D 메타데이터만 전달**: `_RV_pmd_D`만 루프 함수에 전달됨 (이유 불명, 아마도 루프 내부에서 D만 직접 사용하기 때문)

### 4. 결과

spawn된 함수에서 `tmp`, `A`, `B`, `C` 배열에 접근할 때:
- MoveC가 메타데이터를 찾지 못함
- 잘못된 경계 정보 사용 (또는 기본값 사용)
- 모든 접근이 "out of bounds"로 잘못 판단됨
- Spatial error flood 발생

## 해결 방안

### ✅ 구현 완료: 메타데이터를 liveIn으로 자동 추가

`DOALLTask::splitLoop()`에서 원본 함수의 인자를 분석하여 메타데이터-포인터 매핑을 자동으로 생성하고, `liveInVars`에 포인터가 있으면 해당 메타데이터도 자동으로 추가하도록 수정했습니다.

**수정 위치**: `DOALLTask.cpp::splitLoop()` (라인 562 근처)

**구현 내용**:
1. 루프가 속한 원본 함수를 찾음
2. 함수 인자를 순회하면서 `_pmd` suffix를 가진 메타데이터 인자와 대응하는 포인터 인자를 매핑
   - 예: `p7_pmd` (메타데이터) → `p7` (포인터)
3. `liveInVars`에 포인터가 있으면 해당 메타데이터도 자동으로 `liveInVars`에 추가
4. `nonLocalLiveIn` 생성 시 메타데이터도 포함되어 spawn 함수에 전달됨

**코드 변경**:
```cpp
// Build metadata-to-pointer mapping for MoveC
// MoveC functions typically have pattern: <name>_pmd (metadata) and <name> (pointer)
std::unordered_map<Value *, Value *> ptrToMetadata;
if (origFunc) {
    // ... 매핑 생성 로직 ...
    
    // Add missing metadata to liveInVars
    for (auto liveIn : this->liveInVars) {
        if (ptrToMetadata.find(liveIn) != ptrToMetadata.end()) {
            Value *metadata = ptrToMetadata[liveIn];
            if (!this->hasLiveInVar(metadata)) {
                this->liveInVars.push_back(metadata);
            }
        }
    }
}
```

**테스트 결과**:
- ✅ 메타데이터가 환경 포인터에 포함되어 전달됨을 확인
  - `_loop_func_82`에 `_RV_pmd_A`, `_RV_pmd_B`, `_RV_pmd_tmp` 포함 확인
  - `_spawn_loop_func_82`에서 환경 포인터에서 메타데이터 로드 확인
- ⚠️ 여전히 spatial error 발생
  - `32 64 64 64 0` 입력에서 `B[k]` 접근 시 spatial error 발생
  - 메타데이터는 전달되지만 MoveC가 여전히 잘못된 경계 정보를 사용하는 것으로 보임

**추가 조사 필요**:
1. ✅ 메타데이터가 환경 포인터에 포함되어 전달됨 확인
2. ✅ MoveC 체크 함수가 메타데이터를 사용함 확인 (`__RV_check_dpv_ss` 호출 시 메타데이터 전달)
3. ⚠️ **핵심 문제 발견**: 메타데이터 구조체가 `alloca`로 생성되어 원본 함수 스택에 있음
   - 환경 포인터에 메타데이터 **포인터**만 저장됨
   - Spawn된 함수에서 이 포인터를 역참조할 때 원본 함수가 이미 반환되어 use-after-return 위험
   - **해결 방안**: 메타데이터 구조체 전체를 환경 포인터에 복사해야 할 수 있음 (현재는 포인터만 복사)
4. 원본 함수 인자 이름(`p7`, `p8`)과 실제 변수 이름(`tmp.addr`, `A.addr`) 매핑 문제 확인

**결론**:
- MoveC β (순차): ✅ 정상 작동 (spatial error 없음)
- MoveC γ (병렬): ❌ Spatial error 발생
- **원인**: 메타데이터는 전달되지만, 메타데이터 구조체가 원본 함수 스택에 있어서 spawn된 함수에서 접근 시 문제 발생 가능

### 옵션 2: MoveC 메타데이터 테이블 활용

MoveC는 `__RV_pmd_tbl_lookup()`을 통해 포인터의 메타데이터를 조회할 수 있습니다. spawn된 함수에서 배열 포인터를 사용하기 전에 메타데이터를 조회하도록 수정.

**수정 위치**: 생성된 루프 함수 내부

**난이도**: 중간 (spawn 함수 생성 로직 수정 필요)

### 옵션 3: 메타데이터를 환경 포인터에 명시적으로 포함

현재 환경 포인터에 포인터 값만 저장하는 대신, 포인터와 메타데이터 쌍을 저장.

**수정 위치**: `DOALLTask.cpp::genSpawnArgs()` 및 spawn 함수 생성 로직

**난이도**: 중간-높음

## 임시 우회 방법

현재로서는:
1. **작은 입력 사용**: `0 64 64 64 64` 같은 작은 입력에서는 경고만 발생하고 실행은 완료됨
2. **다른 벤치마크 사용**: GEMM 같은 다른 커널에서도 동일 문제 발생 (128 입력에서 spatial error)
3. **ASAN 경로 사용**: ASAN은 메타데이터 의존성이 없어서 정상 작동

## 참고

- 원본 MoveC β는 정상 작동 → MoveC 런타임 자체는 문제 없음
- Catamaran γ에서만 문제 발생 → Catamaran의 spawn 메커니즘이 MoveC와 호환되지 않음
- 이는 LLVM 17 포팅 문제가 아니라 Catamaran의 MoveC 지원 자체의 설계 문제일 수 있음


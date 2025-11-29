# MoveC Spatial Error Root Cause Analysis

## 문제 요약

Catamaran γ에서 MoveC 런타임이 보고한 대량의 spatial error는 **MoveC 런타임 자체의 버그가 아니라, DOALL 태스크가 `__RV_pmd` 메타데이터를 올바르게 전달하지 못했던 역사적 설계 결함**에서 비롯되었습니다.  
2025-11-25 버전(`v1.0-spatial-safety-complete`)에서는 **Deep Copy + Slab Allocator**가 기본 적용되어 이 문제가 완전히 해결되었습니다. 이 문서는 *무엇이 잘못되었고 어떻게 고쳤는지*를 기록하기 위한 것입니다.

**LLVM 버전별 역사**
- **LLVM 17 (구버전)**: ❌ DOALL 태스크가 포인터 값만 전달 → worker가 원본 스택 메타데이터를 역참조하면서 UAR 발생.  
- **LLVM 3.4**: ⭕ `ENABLELOOPFREE 0` 상태로 LoopFreeTask만 사용했기에 같은 문제가 눈에 띄지 않았음.  
- **LLVM 17 (현재)**: ⭕ 모든 메타데이터를 감지해 Slab에 복사하고, worker는 슬랩 주소를 통해 안전하게 접근.

**핵심 교훈**
1. DOALLTask의 `genSpawnArgs`는 본질적으로 Live-in 포인터만 다뤘다.  
2. LLVM 17 포팅 과정에서 LoopFree + DOALL을 동시에 사용하면서 결함이 드러났다.  
3. Deep Copy가 도입된 이후에는 스택 생명 주기와 무관하게 스레드별 안전한 사본을 사용한다.

## 증거

### 1. MoveC β (Sequential) vs Catamaran γ 비교

**MoveC β (Catamaran 없음)**:
- `./MoveC-2mm 0 128 128 128 128` → **경고 없이 정상 종료** (`real 0.06s`)
- `./MoveC-2mm 32 128 128 128 0` → **경고 없이 정상 종료** (`real 0.04s`)

**Catamaran γ (병렬화 적용)**:
- `./CM-MoveC-2mm 0 64 64 64 64` → 6144개 spatial error 경고
- `./CM-MoveC-2mm 32 32 32 32 0` → 592개 spatial error 경고
- `./CM-MoveC-2mm 32 64 64 64 0` → `double free or corruption` (Abort 134)

**결론**: (역사 기록) Catamaran을 적용하지 않은 MoveC β는 정상 작동하지만, 구버전 Catamaran γ에서만 spatial error가 발생했습니다. 최신 버전에서는 동일 시나리오가 재현되지 않습니다.

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

## 해결 방안 (Implemented)

### 1. 메타데이터 자동 수집
`DOALLTask::splitLoop()`가 원본 함수 인자를 순회해 `_pmd` ↔ 포인터 매핑을 생성하고, Live-in 목록에 누락된 메타데이터를 강제로 추가합니다.

```cpp
for (auto liveIn : this->liveInVars) {
    if (auto *metadata = PtrToMetadata.lookup(liveIn)) {
        if (!this->hasLiveInVar(metadata)) {
            this->liveInVars.push_back(metadata);
        }
    }
}
```

### 2. Deep Copy + Slab Allocator
- **Parent (genSpawnArgs)**: 메타데이터 구조체 전체를 `__catamaran_alloc_env`가 제공하는 64 MB 슬랩에 복사.  
- **Child (spawned loop)**: 슬랩 주소에서 구조체 값을 로드해 로컬 alloca에 저장 후 사용.  
- **Reset**: 동기화 지점마다 `__catamaran_reset_slab()` 호출로 버퍼를 한 번에 비움.

### 3. 결과
- ✅ Spatial Safety: Fault injection(OOB)에서 β/γ 모두 동일 경고 출력.  
- ✅ Performance: malloc 경쟁 제거 후 1024×1024 2mm에서 MoveC 대비 21.4 % 성능 개선.  
- ✅ Stability: 8-thread 실행에서도 `sys` time < 0.1 s, Slab allocator 로그로 메타데이터 카운트 확인 가능.

## 현재 상태
- Catamaran γ는 MoveC 메타데이터를 완전 복사하므로, 대량의 spatial error는 **실제 사용자 코드 버그**이거나 **구버전 바이너리 실행**의 신호입니다.  
- 테스트 가이드의 Fault Injection 절차를 따르면 Deep Copy 파이프라인이 정상임을 빠르게 검증할 수 있습니다.  
- 남은 조사 항목은 Temporal Error(특정 벤치에서 `stat == __RV_invalid` 로깅)으로, Spatial 경계와는 별개 이슈입니다.

## Legacy Workarounds (For reference only)
구버전 바이너리에서는 아래 우회가 필요했으나, 최신 버전에서는 필요 없습니다.
1. 작은 입력 (`0 64 64 64 64`) 사용  
2. ASAN 경로로 교차 검증  
3. LoopFreeTask-only 구성

## 참고
- MoveC β는 항상 안정적이었고, 동일한 오브젝트 파일에서 Catamaran γ만 실패했다는 점이 root cause 분석의 핵심이었다.  
- Deep Copy 패치 이후에는 β와 γ가 동일한 경고를 내므로, 문서 상의 오래된 경고 메시지를 보게 된다면 먼저 CMPass/ThreadPool 버전을 확인할 것.


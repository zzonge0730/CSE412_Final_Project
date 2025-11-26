# 메타데이터 vs 다른 변수의 결정적 차이점 분석

## 핵심 발견

### 포인터 변수들 (tmp, A, B, C, D)

**`kernel_2mm` 함수에서**:
```llvm
define internal void @kernel_2mm(..., ptr noundef %tmp, ptr noundef %A, ...) {
  %tmp.addr = alloca ptr, align 8
  %A.addr = alloca ptr, align 8
  store ptr %tmp, ptr %tmp.addr, align 8
  store ptr %A, ptr %A.addr, align 8
  ...
}
```

**특징**:
- 함수 **인자로 전달**됨
- alloca에 **인자 값을 저장** (포인터 값 자체를 저장)
- 실제 포인터는 **힙에 할당된 메모리**를 가리킴 (malloc으로 할당)
- alloca는 단지 **포인터 값을 보관하는 변수**

### 메타데이터 변수들 (_RV_pmd_tmp, _RV_pmd_A 등)

**`kernel_2mm` 함수에서**:
```llvm
define internal void @kernel_2mm(...) {
  %_RV_pmd_tmp_110023726912992 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_A_110023726913536 = alloca %struct.__RV_pmd, align 8
  ...
  %call1 = call ptr @__RV_fmd_tbl_lookup_fpmd(ptr noundef @kernel_2mm, i8 noundef zeroext 0)
  %call2 = call ptr @__RV_pmd_cp_fmd_pmd(ptr noundef %_RV_pmd_tmp_110023726912992, ptr noundef %call1)
  ...
}
```

**특징**:
- 함수 **인자로 전달되지 않음**
- alloca로 **구조체 전체를 스택에 생성**
- 전역 테이블에서 값을 **복사**하여 alloca에 저장
- alloca 자체가 **실제 데이터를 담고 있는 메모리**

## 결정적 차이점

### 1. 메모리 위치

**포인터 변수들**:
- alloca는 포인터 **값**만 저장 (8바이트)
- 실제 데이터는 **힙**에 있음
- alloca가 파괴되어도 실제 데이터는 안전

**메타데이터**:
- alloca가 **구조체 전체**를 저장 (32바이트)
- 실제 데이터가 **스택**에 있음
- alloca가 파괴되면 데이터도 사라짐

### 2. 전달 방식

**포인터 변수들**:
- 함수 인자로 전달 → LoopEnvironment가 자동으로 인식
- 포인터 값만 전달하면 됨 (8바이트)

**메타데이터**:
- 함수 내부에서 생성 → LoopEnvironment가 인식하지 못함
- 구조체 전체를 전달해야 함 (32바이트)
- 현재는 포인터만 전달 → 스택 주소를 전달 → 함수 반환 시 무효화

## 문제의 핵심

### 현재 구현의 문제

1. **메타데이터 alloca를 liveInVars에 추가함** ✅
2. **하지만 포인터 값만 전달함** ❌
   - 메타데이터 alloca의 **주소**를 전달
   - Spawned 함수에서 이 주소를 역참조
   - 원본 함수가 반환되면 스택이 파괴되어 주소가 무효화됨

### 왜 포인터 변수는 괜찮은가?

- 포인터 변수는 **힙 메모리의 주소**를 전달
- 힙 메모리는 함수 반환 후에도 유효
- 따라서 문제 없음

### 왜 메타데이터는 문제인가?

- 메타데이터는 **스택 메모리의 주소**를 전달
- 스택 메모리는 함수 반환 시 파괴됨
- Barrier가 있어도, **스택 프레임 자체는 함수 반환 시 정리됨**
- Spawned 함수가 실행될 때는 원본 함수가 이미 반환되었을 수 있음

## 해결 방안

### 옵션 1: 메타데이터 구조체 전체 복사 (Deep Copy)

**구현**:
- 환경 포인터에 메타데이터 포인터 대신 **구조체 전체를 복사**
- Spawned 함수에서 복사본을 사용

**장점**: Use-After-Return 문제 완전 해결
**단점**: 
- 데이터 일관성 문제 (메타데이터가 Read-Write일 경우)
- 메모리 사용량 증가

### 옵션 2: 메타데이터를 malloc으로 생성

**구현**: MoveC 계측 단계에서 메타데이터를 `alloca` 대신 `malloc`으로 생성

**장점**: 근본적 해결, 데이터 일관성 유지
**단점**: MoveC 소스 수정 필요 (외부 도구)

### 옵션 3: 메타데이터를 함수 인자로 전달

**구현**: `kernel_2mm` 함수에 메타데이터를 인자로 추가

**장점**: LoopEnvironment가 자동으로 인식
**단점**: MoveC 계측 로직 수정 필요

## 재평가된 결론

**UAR 가설이 다시 강화됨**:
- Barrier가 있어도, **스택 프레임은 함수 반환 시 정리됨**
- 메타데이터 alloca는 **스택에 있는 실제 데이터**
- 포인터 변수는 **힙에 있는 데이터를 가리키는 포인터**
- 이 차이가 문제의 핵심

**하지만 사용자의 비판도 타당함**:
- Deep Copy는 데이터 일관성 문제를 야기할 수 있음
- 먼저 메타데이터가 Read-Only인지 확인 필요
- MoveC 런타임의 Thread Safety도 확인 필요

## 다음 단계

1. 메타데이터가 Read-Only인지 확인 (MoveC 소스 분석)
2. 메타데이터 구조체 전체 복사 구현 (임시 해결책)
3. MoveC 계측 단계에서 malloc 사용하도록 수정 (근본적 해결)


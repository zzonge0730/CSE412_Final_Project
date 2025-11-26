# Use-After-Return 가설 반박 및 재검증

## 사용자 비판 요약

사용자가 제시한 3가지 결정적 반박:

1. **Barrier 부재설**: 부모 스레드가 자식을 기다리지 않는가?
2. **Deep Copy는 데이터 일관성 파괴**: 메타데이터가 Read-Only가 아닐 수 있음
3. **ABI/Struct Packing 불일치**: Marshalling 과정에서 오프셋 계산 오류 가능성

## 검증 결과

### 1. Barrier 확인 ✅

**발견**:
- `runtime/ThreadPool.cpp`에 `join()` 메커니즘이 존재
- 생성된 코드에서 `call void @_Z4joinj(i32 ...)` 호출 확인
- 부모 스레드가 모든 자식 작업이 끝날 때까지 대기함

**결론**: **UAR 가설 약화** - 부모 스레드가 기다리므로 스택 프레임이 파괴되지 않음

**추가 검증 필요**:
- 다른 스택 변수들(tmp, A, B)도 스택에 있는데 왜 메타데이터만 문제인지 확인
- 만약 UAR이 원인이라면 모든 스택 변수가 문제여야 함

### 2. Struct Packing/ABI 확인 ✅

**Packing (genSpawnArgs)**:
```cpp
Value *slotPtr = GetElementPtrInst::Create(voidStarTy, envMalloc, idxVal, ...);
```

**Unpacking (spawned function)**:
```llvm
%cm_env_slot = getelementptr ptr, ptr %cm_env_base, i32 0
```

**실제 생성된 코드**:
```llvm
; Packing
%cm_spawn_slot = getelementptr ptr, ptr %cm_spawn_env_malloc, i32 0
store ptr %yy_, ptr %cm_spawn_slot, align 8

; Unpacking  
%cm_env_slot = getelementptr ptr, ptr %cm_env_base, i32 0
%1 = load ptr, ptr %cm_env_slot, align 8
```

**결론**: Packing과 Unpacking 모두 `ptr` 타입을 사용하므로 **타입 일치 확인**

**주의사항**:
- 코드에서는 `voidStarTy`를 사용하지만 실제 생성된 코드는 `ptr` 타입
- LLVM 17의 Opaque Pointer 최적화로 인한 타입 조정 가능성
- 오프셋 계산이 정확한지 추가 검증 필요

### 3. Deep Copy 문제점 인식 ⚠️

**사용자 지적**:
- 메타데이터가 Read-Only가 아닐 수 있음
- Deep Copy 시 워커 스레드가 복사본을 수정하면 원본이 업데이트되지 않음
- 루프 종료 후 구형(Stale) 메타데이터로 인한 추가 오류 가능

**결론**: Deep Copy는 최후의 수단으로, 먼저 다른 원인 확인 필요

## 재평가된 가설

### 가설 1: 주소는 정확하지만 값이 잘못됨 (ABI 문제)

**가능성**: 높음

**증거**:
- Packing/Unpacking 타입은 일치
- 하지만 실제 메타데이터 구조체의 필드 접근이 잘못되었을 수 있음
- Opaque Pointer로 인한 타입 정보 손실이 구조체 필드 접근에 영향

**검증 필요**:
- 메타데이터 포인터 주소 비교 (Parent vs Child)
- 메타데이터 구조체 첫 번째 필드(base pointer) 값 비교

### 가설 2: 다른 스택 변수는 괜찮은데 메타데이터만 문제

**가능성**: 중간

**증거**:
- tmp, A, B 같은 포인터 변수들은 정상 작동
- 메타데이터만 spatial error 발생

**가능한 원인**:
- 메타데이터 구조체가 특별한 방식으로 접근됨
- MoveC 런타임의 Thread Local Storage 사용
- 메타데이터가 전역 테이블에서 로드되는 방식의 문제

### 가설 3: MoveC 런타임의 Thread Safety 문제

**가능성**: 중간

**증거**:
- 메타데이터가 전역 테이블(`__RV_fmd_tbl_*`)에서 관리됨
- 여러 스레드에서 동시 접근 시 동기화 문제 가능

**검증 필요**:
- MoveC 런타임의 Thread Local Storage 사용 여부
- 전역 테이블 접근의 동기화 메커니즘 확인

## 다음 단계 (저비용 검증)

### Step 1: 주소 및 값 비교 (Sanity Check)

**구현**:
- Parent 함수에서 메타데이터 alloca 주소와 첫 번째 필드(base) 값 출력
- Spawned 함수에서 전달받은 메타데이터 포인터 주소와 base 값 출력
- 비교하여 주소/값 일치 여부 확인

**예상 결과**:
- 주소가 다름: Deep Copy가 이미 일어났거나, 엉뚱한 오프셋을 읽고 있음 (ABI 문제)
- 주소는 같은데 내용이 쓰레기: UAR 또는 Race Condition
- 주소도 같고 내용도 같음: MoveC 런타임 내부의 로직 문제

### Step 2: 다른 스택 변수 확인

**구현**:
- tmp, A, B 같은 포인터 변수들도 스택에 있는지 확인
- 이들이 정상 작동하는 이유 확인
- 메타데이터와의 차이점 분석

### Step 3: MoveC 런타임 확인

**구현**:
- MoveC의 Thread Local Storage 사용 여부 확인
- 전역 테이블 접근의 동기화 메커니즘 확인
- 메타데이터 접근 패턴 분석

## 최종 결론

**UAR 가설은 약화되었지만 완전히 기각할 수는 없음**:
- Barrier가 존재하므로 UAR 가능성은 낮음
- 하지만 다른 스택 변수와의 차이점이 명확하지 않음

**우선순위**:
1. 주소 및 값 비교 (Sanity Check) - 가장 저비용
2. 다른 스택 변수와의 차이점 분석
3. MoveC 런타임 Thread Safety 확인
4. Deep Copy는 최후의 수단


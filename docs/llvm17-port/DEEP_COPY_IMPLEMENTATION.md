# Deep Copy 구현 완료

## 구현 내용

### 1. 메타데이터 구조체 식별

**헬퍼 함수 추가**:
- `isMetadataStruct(Value *liveIn, Type *&structType)`: 메타데이터 alloca인지 확인
- `getLiveInSize(Value *liveIn, const DataLayout &DL)`: LiveIn 변수의 크기 반환

### 2. 환경 구조체 레이아웃 변경

**Packing (genSpawnArgs)**:
- 메타데이터 구조체와 일반 포인터를 분리
- 환경 구조체 크기 계산:
  - 일반 포인터: 8바이트 (포인터 크기)
  - 메타데이터 구조체: 32바이트 (구조체 크기)
- Byte offset을 사용하여 정확한 위치에 저장

**Unpacking (spawned function)**:
- 메타데이터 구조체인 경우:
  1. 자식 스택에 local alloca 생성
  2. 환경 포인터에서 구조체 전체 로드
  3. local alloca에 저장
  4. local alloca를 인자로 사용
- 일반 포인터인 경우: 기존 로직 유지

### 3. Deep Copy 수행

**Parent Side (genSpawnArgs)**:
```cpp
// Load the entire struct from stack alloca
LoadInst *structVal = new LoadInst(structType, liveIn, "meta.load", ...);
// Store to environment buffer
new StoreInst(structVal, slotPtrCast, ...);
```

**Child Side (spawned function)**:
```cpp
// Create local alloca
AllocaInst *localMeta = new AllocaInst(structType, ...);
// Load struct from environment
LoadInst *structVal = new LoadInst(structType, slotPtrCast, ...);
// Store to local alloca
new StoreInst(structVal, localMeta, ...);
```

## 검증 결과

### 디버깅 출력:
```
DEBUG: Packed 17 regular pointers and 5 metadata structs (total 296 bytes)
```

**계산 확인**:
- 17 포인터 × 8바이트 = 136바이트
- 5 메타데이터 × 32바이트 = 160바이트
- 총 296바이트 ✅

### 예상 효과:
- Use-After-Return 문제 해결: 메타데이터 구조체가 환경 버퍼에 복사되어 스택과 독립적
- Spatial Error 해결: 메타데이터가 올바르게 전달되어 MoveC가 정상 작동

## 다음 단계

1. 실제 실행 테스트로 Spatial Error 해결 확인
2. 성능 오버헤드 측정 (Deep Copy 비용)
3. 다른 벤치마크에서도 검증


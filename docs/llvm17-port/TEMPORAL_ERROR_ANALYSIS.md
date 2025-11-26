# Temporal Error 분석

## 1단계: 패턴 확인 결과

### 2mm 벤치마크
- **Spatial Error**: 0개 ✅
- **Temporal Error**: 발생 ("points to an invalid object")
- **증상**: `B[k]`, `B[k][j]` 접근 시 temporal error

### gemm 벤치마크
- **Spatial Error**: 0개 ✅
- **Temporal Error**: 0개 ✅
- **상태**: 정상 실행 완료

## 분석

### 패턴 차이점

**2mm**: Temporal Error 발생
**gemm**: Temporal Error 없음

이것은 **벤치마크별로 다른 문제**임을 시사합니다.

### 가능한 원인

1. **메모리 할당 패턴 차이**
   - 2mm: 특정 메모리 레이아웃이나 할당 순서가 문제
   - gemm: 다른 메모리 패턴으로 문제 없음

2. **포인터 사용 패턴 차이**
   - 2mm: 특정 포인터 접근 패턴이 MoveC의 temporal check와 충돌
   - gemm: 다른 접근 패턴으로 문제 없음

3. **입력 크기 의존성**
   - 2mm: 특정 입력 크기에서만 문제 발생 가능
   - gemm: 테스트한 입력 크기에서는 문제 없음

## 다음 단계

### 옵션 1: 2mm의 입력 크기 변경 테스트
- 더 작은/큰 입력으로 테스트하여 패턴 확인

### 옵션 2: Temporal Check 비활성화 테스트
- MoveC 옵션이나 소스 수정으로 temporal check만 비활성화
- Spatial Safety가 완벽히 해결되었는지 확인

### 옵션 3: MoveC 런타임 소스 분석
- `__RV_check_*` 함수에서 "invalid object" 에러를 발생시키는 조건 확인
- TLS 사용 여부 확인

## 결론

**Spatial Error 해결 확인**: ✅
- 2mm: Spatial Error 0개
- gemm: Spatial Error 0개

**Temporal Error**: 
- 2mm에서만 발생 (gemm에서는 없음)
- 벤치마크별 차이가 있음
- MoveC 런타임의 특정 조건에서만 발생하는 것으로 보임

**우선순위**:
1. 2mm의 다른 입력 크기로 테스트
2. Temporal Check 비활성화로 Spatial Safety 완벽성 확인
3. MoveC 런타임 소스 분석 (필요시)


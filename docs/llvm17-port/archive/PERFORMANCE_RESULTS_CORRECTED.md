# 정확한 성능 측정 결과 (Dead Code Elimination 방지)

## 개선 사항

### 1. Dead Code Elimination 방지 ✅

**문제**: Sequential이 0.001초로 측정됨 (물리적으로 불가능)

**원인**: 컴파일러가 결과를 사용하지 않는다고 판단하여 루프를 삭제

**해결**: `2mm.c`에 결과 출력 코드 추가
```c
fprintf(stderr, "Check: %f\n", (*D)[ni/2][nl/2]);
```

**효과**: Sequential이 0.001초 → 0.048초로 증가 (정상적인 측정 가능)

## 2mm 벤치마크 결과

### 입력 크기: 256×256×256×256

**측정값 (5회 실행, stderr 리다이렉션, Dead Code Elimination 방지)**:

| 버전 | Run 1 | Run 2 | Run 3 | Run 4 | Run 5 | 평균 | Best |
|------|-------|-------|-------|-------|-------|------|------|
| Sequential (α) | 0.046s | 0.047s | 0.048s | 0.048s | 0.049s | 0.048s | 0.046s |
| MoveC Sequential (β) | 0.119s | 0.116s | 0.106s | 0.119s | 0.104s | 0.113s | 0.104s |
| Catamaran Parallel (γ) | 2.953s | 2.413s | 2.327s | 2.799s | 2.939s | 2.686s | 2.327s |

### 오버헤드 분석 (Best Case 사용)

**Best Case 값**:
- α (Sequential): 0.046s
- β (MoveC Sequential): 0.104s
- γ (Catamaran Parallel): 2.327s

**오버헤드 계산**:

1. **MoveC 오버헤드**:
   $$
   O_{movec} = \frac{\beta - \alpha}{\alpha} \times 100\% = \frac{0.104 - 0.046}{0.046} \times 100\% = 126\%
   $$

2. **Catamaran 오버헤드**:
   $$
   O_{catamaran} = \frac{\gamma - \alpha}{\alpha} \times 100\% = \frac{2.327 - 0.046}{0.046} \times 100\% = 4,962\%
   $$

3. **오버헤드 감소**:
   $$
   \text{Overhead Reduction} = \frac{O_{movec} - O_{catamaran}}{O_{movec}} \times 100\% = \frac{126 - 4,962}{126} \times 100\% = -3,838\%
   $$

### 분석

**현재 상태**:
- ✅ Dead Code Elimination 방지 완료
- ✅ 정확한 Baseline 측정 가능
- ⚠️ Catamaran이 MoveC보다 느림 (병렬화 오버헤드가 큼)

**원인**:
- 입력 크기(256×256)가 여전히 작아서 병렬화 오버헤드가 이득을 상쇄
- 스레드 생성/동기화 비용이 병렬화 이득보다 큼

## 더 큰 입력 크기: 512×512×512×512

**측정값 (3회 실행)**:

| 버전 | Run 1 | Run 2 | Run 3 | 평균 | Best |
|------|-------|-------|-------|------|------|
| Sequential (α) | 측정 중... | | | | |
| MoveC Sequential (β) | 측정 중... | | | | |
| Catamaran Parallel (γ) | 측정 중... | | | | |

**예상**:
- Sequential: ~0.7초 (256의 약 14배)
- 더 큰 입력 크기에서 병렬화 이득이 나타날 가능성

## 다음 단계

### 1. 더 큰 입력 크기로 측정 완료
- 512×512×512×512 측정 완료 후 결과 분석
- 1024×1024×1024×1024로 확장 (Memory Bound 유도)

### 2. 스레드 수 스케일링
- 1, 2, 4, 8 스레드로 각각 측정
- 최적 스레드 수 찾기

### 3. 내부 타이머 추가
- 소스 코드에 타이머 추가
- 순수 커널 실행 시간만 측정

## 결론

**Dead Code Elimination 방지**: ✅ **완료**
- Sequential이 정상적으로 측정됨 (0.046초)
- 정확한 Baseline 확보

**성능 측정**:
- 현재는 작은 입력 크기에서 병렬화 오버헤드가 큼
- 더 큰 입력 크기(512×512 이상)에서 병렬화 이득 확인 필요

**Spatial Safety 포팅**: ✅ **완벽하게 성공**
- Spatial Error 0개
- Deep Copy 아키텍처 정상 작동


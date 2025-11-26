# 개선된 벤치마킹 가이드

## 사용자 피드백 반영

학술적 엄밀성을 위해 다음 4가지 문제점을 해결했습니다:

### 1. I/O 병목 문제 해결 ✅

**문제**: Temporal Error 로그 출력이 I/O 병목을 일으킴

**해결**:
```bash
# stderr를 /dev/null로 리다이렉션
./CM-MoveC-2mm 256 256 256 256 0 > /dev/null 2>&1
```

**효과**: 에러 메시지 출력 시간이 측정에서 제외됨

### 2. 입력 크기 최적화 ✅

**문제**: 64×64는 L3 캐시에 들어가서 병렬화 오버헤드만 부각됨

**해결**:
- 최소 256×256부터 측정
- 512×512, 1024×1024까지 확장
- Memory Bound 영역에서 병렬화 이득 측정

**권장 입력 크기**:
- **2mm**: 256×256×256×256, 512×512×512×512
- **gemm**: 256×256×256, 512×512×512

### 3. 내부 타이머 사용 권장 ✅

**문제**: `time` 명령어는 프로세스 시작/종료 시간까지 포함

**해결책**:
1. **즉시 적용**: 여러 번 실행하고 Best Case (최소값) 사용
2. **장기적**: 소스 코드에 내부 타이머 추가

**내부 타이머 예시**:
```c
#include <time.h>
#include <sys/time.h>

struct timespec start, end;
clock_gettime(CLOCK_MONOTONIC, &start);

// Kernel execution
kernel_2mm(...);

clock_gettime(CLOCK_MONOTONIC, &end);
double elapsed = (end.tv_sec - start.tv_sec) + 
                 (end.tv_nsec - start.tv_nsec) / 1e9;
printf("Kernel time: %.6f seconds\n", elapsed);
```

### 4. 오버헤드 계산 공식 재정의 ✅

**기존 (잘못된) 공식**:
- γ - β: 병렬화 오버헤드 (용어가 모호함)

**개선된 공식**:

1. **MoveC 오버헤드**:
   $$
   O_{movec} = \frac{\beta - \alpha}{\alpha} \times 100\%
   $$

2. **Catamaran 오버헤드**:
   $$
   O_{catamaran} = \frac{\gamma - \alpha}{\alpha} \times 100\%
   $$

3. **오버헤드 감소**:
   $$
   \text{Overhead Reduction} = \frac{O_{movec} - O_{catamaran}}{O_{movec}} \times 100\%
   $$

**목표**: 
- $O_{catamaran} < O_{movec}$ (Catamaran이 MoveC보다 오버헤드가 작아야 함)
- 예: MoveC 오버헤드 400%, Catamaran 오버헤드 100% → 75% 감소

## 개선된 벤치마킹 스크립트

### 사용법

```bash
# 기본 사용 (256×256×256×256, 5회 실행, 8 스레드)
./scripts/benchmark_improved.sh

# 커스텀 입력 크기
./scripts/benchmark_improved.sh "512 512 512 512 0" 5 2mm 8

# 다른 벤치마크
./scripts/benchmark_improved.sh "256 256 256 0" 5 gemm 8
```

### 출력 예시

```
=== Sequential (α) ===
Run 1: 0.123 seconds
Run 2: 0.120 seconds
Run 3: 0.125 seconds
Average: 0.123 seconds
Best:    0.120 seconds
Worst:   0.125 seconds

=== MoveC Sequential (β) ===
...

=== Catamaran Parallel (γ) ===
...

==========================================
Overhead Analysis
==========================================
Note: Calculate overhead reduction using:
  MoveC Overhead = (β - α) / α × 100%
  Catamaran Overhead = (γ - α) / α × 100%
  Overhead Reduction = (MoveC_Overhead - Catamaran_Overhead) / MoveC_Overhead × 100%
```

## 추가 권장 사항

### 1. 스레드 수 스케일링

```bash
# 1, 2, 4, 8 스레드로 각각 측정
for threads in 1 2 4 8; do
    echo "=== $threads threads ==="
    NUM_THREADS=$threads ./scripts/benchmark_improved.sh "256 256 256 256 0" 5 2mm $threads
done
```

### 2. 입력 크기 스케일링

```bash
# 128, 256, 512, 1024로 각각 측정
for size in 128 256 512 1024; do
    echo "=== Size: $size ==="
    ./scripts/benchmark_improved.sh "$size $size $size $size 0" 5 2mm 8
done
```

### 3. Best Case 사용

여러 번 실행 중 **최소값(Best Case)**을 사용하면:
- 프로세스 시작/종료 노이즈 최소화
- 최적의 성능 측정
- 논문 재현에 적합

### 4. 통계 분석

```bash
# 평균, 표준편차, 최소값, 최대값 계산
# Python 스크립트로 자동화 가능
python3 scripts/analyze_results.py benchmark_results.csv
```

## 예상 결과 해석

### 성공적인 경우

- **$O_{catamaran} < O_{movec}$**: Catamaran이 MoveC보다 오버헤드가 작음
- **Overhead Reduction > 0%**: 오버헤드 감소 달성
- **입력 크기가 클수록 이득 증가**: Memory Bound 영역에서 병렬화 효과

### 주의사항

- **작은 입력 크기**: 병렬화 오버헤드가 이득을 상쇄할 수 있음
- **스레드 수**: 최적 스레드 수는 입력 크기와 시스템에 따라 다름
- **캐시 효과**: L3 캐시 내에서는 병렬화 이득이 제한적

## 결론

이 개선된 가이드를 따르면:
1. ✅ I/O 병목 제거
2. ✅ 적절한 입력 크기로 측정
3. ✅ 정확한 오버헤드 계산
4. ✅ 학술적 엄밀성 확보

논문 재현 결과의 신뢰도가 크게 향상됩니다.


# 성능 벤치마킹 가이드

## 목적

Spatial Safety 포팅이 완료되었으므로, 이제 원래 목적이었던 **"오버헤드 감소"**를 측정할 때입니다.

Deep Copy(메모리 복사) 비용이 추가되었지만, 병렬화 이득이 이를 상쇄하는지 확인하는 것이 논문 재현의 핵심 결론입니다.

## 벤치마크 준비

### 사용 가능한 벤치마크

1. **2mm**: Temporal Error 발생하지만 Spatial Error 없음
2. **gemm**: 완벽하게 작동 (Spatial + Temporal 모두 통과)

### 측정 항목

1. **Sequential (α)**: 원본 코드 실행 시간
2. **MoveC Sequential (β)**: MoveC 계측된 순차 실행 시간
3. **Catamaran Parallel (γ)**: Catamaran 병렬화된 실행 시간

### 오버헤드 분석

- **β - α**: MoveC 계측 오버헤드
- **γ - β**: 병렬화 오버헤드 (Deep Copy 포함)
- **γ - α**: 전체 오버헤드

## 벤치마킹 스크립트

### 기본 측정

```bash
# Sequential (α)
time ./2mm 64 64 64 64 0

# MoveC Sequential (β)
time ./MoveC-2mm 64 64 64 64 0

# Catamaran Parallel (γ)
time ./CM-MoveC-2mm 64 64 64 64 0
```

### 자동화 스크립트

```bash
#!/bin/bash
# benchmark.sh

INPUT_SIZE="64 64 64 64 0"
NUM_RUNS=5

echo "=== Sequential (α) ==="
for i in $(seq 1 $NUM_RUNS); do
    time ./2mm $INPUT_SIZE
done

echo "=== MoveC Sequential (β) ==="
for i in $(seq 1 $NUM_RUNS); do
    time ./MoveC-2mm $INPUT_SIZE
done

echo "=== Catamaran Parallel (γ) ==="
for i in $(seq 1 $NUM_RUNS); do
    time ./CM-MoveC-2mm $INPUT_SIZE
done
```

## 예상 결과

### Deep Copy 오버헤드

- **메타데이터 구조체 크기**: 32바이트 × 메타데이터 개수
- **복사 비용**: 메모리 복사 + 환경 버퍼 할당
- **예상 오버헤드**: 수 마이크로초 ~ 수십 마이크로초 (벤치마크 크기에 따라)

### 병렬화 이득

- **스레드 수**: NUM_THREADS (기본 8)
- **이상적 속도 향상**: 최대 NUM_THREADS배
- **실제 속도 향상**: 스레드 생성 오버헤드, 동기화 비용, Deep Copy 오버헤드 고려

## 논문 재현 목표

논문에서 보고한 오버헤드 감소:
- **MoveC**: 46-224% 오버헤드 감소

현재 구현에서 기대할 수 있는 것:
- **Spatial Error**: 0개 (완벽)
- **병렬화 성능**: Deep Copy 오버헤드를 고려한 실제 측정값

## 주의사항

1. **2mm Temporal Error**: 
   - Temporal Error가 발생하지만 프로그램은 계속 실행됨
   - 시간 측정에는 영향이 적을 수 있음
   - gemm으로 교차 검증 권장

2. **입력 크기**:
   - 너무 작으면 병렬화 오버헤드가 이득을 상쇄할 수 있음
   - 너무 크면 메모리 부족 가능성
   - 권장: 64×64×64×64 이상

3. **스레드 수**:
   - NUM_THREADS 환경 변수 또는 컴파일 옵션으로 조정
   - CPU 코어 수에 맞게 조정 권장

## 다음 단계

1. **기본 측정**: 각 벤치마크의 실행 시간 측정
2. **통계 분석**: 여러 실행의 평균 및 표준편차 계산
3. **오버헤드 분석**: Deep Copy 비용 vs 병렬화 이득
4. **논문 비교**: 원본 논문 결과와 비교


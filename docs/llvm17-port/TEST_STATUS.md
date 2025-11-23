# LLVM 17 테스트 상태

## ✅ 작동하는 테스트

### 1. MoveC - Loop-Free Task 병렬화 (성공)

**테스트 파일**: `examples/llvm17/test_llvm17_movec.ll`

**실행 방법**:
```bash
# LLVM 17 환경 진입
./setup-llvm17-port.sh

# 컨테이너 안에서
cd /workspace/build-catamaran-17

# Catamaran Pass 적용
/opt/llvm-17/bin/opt \
  -load-pass-plugin=./llvm/lib/Transforms/CMPass/CMPass.so \
  -passes='Loops' \
  -S ../../examples/llvm17/test_llvm17_movec.ll \
  -o CM-MoveC-2mm.ll

# 바이너리 컴파일
/opt/llvm-17/bin/clang++ \
  -O3 -pthread -std=c++17 \
  CM-MoveC-2mm.ll \
  ../../Catamaran-llvm-17/runtime/ThreadPool.cpp \
  -o CM-MoveC-2mm

# 실행
time ./CM-MoveC-2mm
```

**결과**:
- ✅ **Tasks Created**: 146 LoopFreeTasks
- ✅ **Execution**: Successful (exit code 0)
- ✅ **Time**: ~0.018s (입력 크기 128×128)
- ✅ **Observation**: `Creating spawn call` 로그 확인됨

### 2. ASAN - Loop-Free Task 병렬화 (성공)

**테스트 파일**: `examples/llvm17/test_llvm17_asan.ll`

**실행 방법**:
```bash
cd /workspace/build-catamaran-17

# Catamaran Pass 적용
/opt/llvm-17/bin/opt \
  -load-pass-plugin=./llvm/lib/Transforms/CMPass/CMPass.so \
  -passes='Loops' \
  -S ../../examples/llvm17/test_llvm17_asan.ll \
  -o CM-ASAN-2mm.ll

# 바이너리 컴파일 (dummy ASAN runtime 링크)
/opt/llvm-17/bin/clang++ \
  -O3 -pthread -std=c++17 \
  CM-ASAN-2mm.ll \
  ../../Catamaran-llvm-17/runtime/ThreadPool.cpp \
  ../../Catamaran-llvm-17/runtime/dummy_asan.cpp \
  -o CM-ASAN-2mm

# 실행
time ./CM-ASAN-2mm 1000 1000 1000 1000 0
```

**결과**:
- ✅ **Tasks Created**: 2 LoopFreeTasks (main 함수 내)
- ✅ **Execution**: Successful (exit code 0)
- ✅ **Time**: ~4.055s (입력 크기 1000×1000)
- ✅ **Observation**: ASAN checks가 정상적으로 식별되고 그룹화됨 (5개씩 배치)

## ⚠️ 부분 작동 / 수정 중인 테스트

### 3. MoveC-2mm.ll - 루프 내부 Safe Check 검출 문제

**테스트 파일**: `examples/llvm17/MoveC-2mm.ll`

**현재 상태**:
- ✅ **컴파일**: 성공
- ✅ **opt 실행**: 성공 (크래시 해결됨)
- ✅ **루프 처리**: kernel_2mm 함수의 루프들이 정상 처리됨
- ❌ **Safe Check 검출**: 루프 내부에 `__RV_check_dpv_ss` 호출이 검출되지 않음

**문제**:
- `.bc` 파일에는 31개의 `__RV_check_dpv_ss` 호출이 존재
- 하지만 `kernel_2mm` 함수 내부의 루프에는 safe check가 없음

**가능한 원인**:
1. MoveC instrumentation이 루프 외부에만 있음
2. LLVM 17의 최적화로 인해 루프 내부의 safe check가 제거됨
3. Loop body 인식 문제 (LLVM 3.4와 다른 방식)

**해결 진행 중**:
- 진단 스크립트 작성: `scripts/diagnose_safe_checks.sh`
- 분석 문서 작성: `docs/llvm17-port/SAFE_CHECK_DETECTION_ANALYSIS.md`
- LLVM 3.4와 비교 분석 진행 중

## 테스트 파일 목록

### ✅ 검증된 테스트 파일

1. **test_llvm17_movec.ll**
   - 상태: ✅ 완전 작동
   - 결과: 146 LoopFreeTasks 생성
   - 용도: MoveC Loop-Free Task 병렬화 검증

2. **test_llvm17_asan.ll**
   - 상태: ✅ 완전 작동
   - 결과: 2 LoopFreeTasks 생성
   - 용도: ASAN Loop-Free Task 병렬화 검증

### ⚠️ 수정 중인 테스트 파일

3. **MoveC-2mm.ll**
   - 상태: ⚠️ 부분 작동 (루프 내부 safe check 검출 문제)
   - 문제: 루프 내부의 safe check가 검출되지 않음
   - 진행: 진단 및 해결 중

### 기타 테스트 파일

4. **test_llvm17_meta.ll** - 메타데이터 테스트
5. **test_llvm17_asan_opt.ll** - 최적화된 ASAN 테스트
6. **ASAN-2mm.ll** - ASAN 계측된 2mm

## 빠른 테스트 실행

### 작동하는 테스트만 빠르게 확인

```bash
# 1. LLVM 17 환경 진입
./setup-llvm17-port.sh

# 2. 빌드 확인
cd /workspace/build-catamaran-17
ninja CMPass

# 3. MoveC 테스트 (작동함)
/opt/llvm-17/bin/opt \
  -load-pass-plugin=./llvm/lib/Transforms/CMPass/CMPass.so \
  -passes='Loops' \
  -disable-output \
  ../../examples/llvm17/test_llvm17_movec.ll 2>&1 | grep -i "task\|spawn"

# 4. ASAN 테스트 (작동함)
/opt/llvm-17/bin/opt \
  -load-pass-plugin=./llvm/lib/Transforms/CMPass/CMPass.so \
  -passes='Loops' \
  -disable-output \
  ../../examples/llvm17/test_llvm17_asan.ll 2>&1 | grep -i "task\|spawn"
```

## 현재 개발 상태

### 완료된 작업 ✅
1. Loop-Free Task 병렬화 포팅 완료
2. New PassManager로 전환 완료
3. Opaque Pointers 지원 완료
4. MoveC 및 ASAN 함수 인식 추가
5. test_llvm17_movec.ll 검증 완료
6. test_llvm17_asan.ll 검증 완료

### 진행 중인 작업 ⚠️
1. MoveC-2mm.ll의 루프 내부 safe check 검출 문제 해결
2. Loop body 인식 방식 개선 (LLVM 3.4와 비교)
3. 성능 측정 및 최적화

### 향후 작업 📋
1. DOALL (루프 병렬화) 완전 지원
2. SPEC 벤치마크 적용
3. 성능 비교 분석 (LLVM 3.4 vs LLVM 17)

## 요약

**LLVM 17 환경은 기본적으로 테스트가 돌아가는 상태입니다!**

- ✅ **Loop-Free Task 병렬화**: 완전 작동 (test_llvm17_movec.ll, test_llvm17_asan.ll)
- ⚠️ **특정 파일 문제**: MoveC-2mm.ll에서 루프 내부 safe check 검출 문제 (수정 중)
- 🔧 **계속 수정 중**: Loop body 인식 및 검출 로직 개선 진행 중

**즉시 테스트 가능**:
- `test_llvm17_movec.ll` → ✅ 작동
- `test_llvm17_asan.ll` → ✅ 작동
- `MoveC-2mm.ll` → ⚠️ 부분 작동 (루프 내부 검출 문제)

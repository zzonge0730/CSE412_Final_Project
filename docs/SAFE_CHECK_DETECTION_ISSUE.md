# Safe Check 미검출 문제 진단 및 해결 방안

## 현재 상황

### ✅ 해결된 문제
1. **크래시 해결**: GDB로 주소 0x88963 확인, early preheader check 추가로 해결
2. **루프 처리**: kernel_2mm 함수의 루프들이 정상 처리됨
3. **컴파일 성공**: opt가 정상 실행되고 IR 생성

### ❌ 현재 문제
**Safe check 미검출**: 루프 내부에 `__RV_check_dpv_ss` 호출이 없어 병렬화되지 않음

## 문제 분석

### MoveC Instrumentation 패턴

MoveC가 생성한 C 코드를 보면:
```c
tmp[__RV_check_dpv_ss(&_RV_pmd_tmp_110023726912992, tmp, i, sizeof(double [nj]), ...)][__RV_check_dpv_ss(...)] = 0;
```

`__RV_check_dpv_ss`가 **배열 인덱스 안에 직접 삽입**되어 있습니다.

### LLVM IR 변환 시 문제 가능성

1. **GetElementPtrInst의 피연산자로 변환**
   - `__RV_check_dpv_ss`가 `CallInst`로 생성되지만, `GetElementPtrInst`의 피연산자로만 사용될 수 있음
   - 현재 검출 로직은 `BasicBlock` 내의 직접적인 `CallInst`만 찾음

2. **다른 Instruction의 피연산자로만 사용**
   - `CallInst`로 생성되지만 다른 instruction의 피연산자로만 사용되어 검출되지 않을 수 있음

3. **루프 구조 인식 문제**
   - 루프 body가 제대로 인식되지 않아 검출이 안 될 수 있음

## 진단 방법

### 1. IR 파일 직접 확인

```bash
# IR 파일에서 __RV_check_dpv_ss 검색
grep -n "__RV_check_dpv_ss" examples/llvm17/MoveC-2mm.ll | head -20

# kernel_2mm 함수 부분 확인
grep -A 50 "define.*kernel_2mm" examples/llvm17/MoveC-2mm.ll | grep -A 10 "__RV_check_dpv_ss"
```

### 2. 디버그 출력 추가

`LoopsMovec.cpp`의 369-386줄에 디버그 출력 추가:

```cpp
for (auto& I : *body) {
    if (CallInst *CI = dyn_cast<CallInst>(&I)) {
        // 디버그: 모든 CallInst 출력
        errs() << "Found CallInst in loop body: " << *CI << "\n";
        
        if (IsSafeCheckCallForMovec(CI)) {
            errs() << ">>> Safe check detected: " << CI->getCalledFunction()->getName() << "\n";
            // ... 기존 코드
        }
    }
}
```

### 3. 루프 body 확인

```cpp
errs() << "Loop body BasicBlocks:\n";
for (auto body : loopBody) {
    errs() << "  BB: " << body->getName() << "\n";
    for (auto& I : *body) {
        if (CallInst *CI = dyn_cast<CallInst>(&I)) {
            errs() << "    Call: " << *CI << "\n";
        }
    }
}
```

## 해결 방안

### 옵션 1: LLVM 3.4와 비교 (권장)

**목적**: LLVM 3.4에서 동일한 파일로 병렬화가 되는지 확인

**단계**:
1. 동일한 MoveC IR 파일을 LLVM 3.4 환경에서 테스트
2. `LoopsMovec` pass 실행 후 safe check 검출 여부 확인
3. 검출되는 경우: LLVM 버전 차이로 인한 문제
4. 검출 안 되는 경우: MoveC instrumentation 패턴 문제

**실행**:
```bash
# LLVM 3.4 환경에서
docker compose run --rm dev bash -c "cd /workspace && \
  ./build-catamaran-3.4.0/bin/opt \
  -load ./build-catamaran-3.4.0/lib/libCMPass.so \
  -movec -PDGAnalysis -catamaran-pdg-reaching-analysis -LoopsMovec \
  < MoveC-2mm.ll -S -o CM-MoveC-2mm-test.ll 2>&1 | grep -i 'safe\|check\|__RV'"
```

### 옵션 2: 다른 테스트 파일 사용

**목적**: 루프 내부에 safe check가 확실히 있는 다른 파일로 테스트

**참고 파일**:
- `examples/llvm17/test_llvm17_movec.ll` - 이미 검증된 테스트 파일
- 다른 PolyBench 벤치마크 (3mm, gemm 등)

**실행**:
```bash
# test_llvm17_movec.ll로 테스트
/opt/llvm-17/bin/opt \
  -load-pass-plugin=./llvm/lib/Transforms/CMPass/CMPass.so \
  -passes='Loops' \
  -S examples/llvm17/test_llvm17_movec.ll \
  -o CM-test.ll 2>&1 | grep -i 'safe\|check\|task'
```

### 옵션 3: 검출 로직 개선

**문제**: 현재 로직은 `BasicBlock` 내의 직접적인 `CallInst`만 찾음

**개선 방안**:
1. **Use-Def 체인 추적**: `GetElementPtrInst`의 피연산자를 추적하여 `CallInst` 찾기
2. **PDG 활용**: PDG를 통해 safe check와 관련된 모든 instruction 찾기
3. **Recursive 검색**: 모든 instruction의 피연산자를 재귀적으로 검색

**코드 예시**:
```cpp
// GetElementPtrInst의 피연산자에서 CallInst 찾기
if (GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(&I)) {
    for (unsigned i = 0; i < GEP->getNumOperands(); ++i) {
        if (CallInst *CI = dyn_cast<CallInst>(GEP->getOperand(i))) {
            if (IsSafeCheckCallForMovec(CI)) {
                safecheckCallInst.push_back(CI);
            }
        }
    }
}
```

### 옵션 4: 보고서 작성

**목적**: 현재까지의 진행 상황과 해결한 문제들을 문서화

**포함 내용**:
1. 해결한 문제들 (크래시, 루프 처리, 컴파일)
2. 현재 문제 (Safe check 미검출)
3. 진단 결과
4. 다음 단계

## 추천 진행 순서

1. **옵션 1 (LLVM 3.4 비교)** - 가장 빠르게 원인 파악 가능
2. **옵션 2 (다른 테스트 파일)** - 문제가 파일 특정적인지 확인
3. **옵션 3 (검출 로직 개선)** - 근본 해결 (시간 소요)
4. **옵션 4 (보고서 작성)** - 진행 상황 문서화

## 즉시 실행 가능한 진단 명령어

```bash
# 1. IR 파일에서 __RV_check_dpv_ss 위치 확인
grep -n "__RV_check_dpv_ss" examples/llvm17/MoveC-2mm.ll | wc -l

# 2. kernel_2mm 함수 내부 확인
grep -A 200 "define.*kernel_2mm" examples/llvm17/MoveC-2mm.ll | grep "__RV_check_dpv_ss" | head -5

# 3. 루프 관련 함수 확인
grep -E "for\.|loop|kernel" examples/llvm17/MoveC-2mm.ll | head -10

# 4. 디버그 출력으로 opt 실행
/opt/llvm-17/bin/opt \
  -load-pass-plugin=./llvm/lib/Transforms/CMPass/CMPass.so \
  -passes='Loops' \
  -S examples/llvm17/MoveC-2mm.ll \
  -o CM-MoveC-2mm.ll 2>&1 | tee opt_output.log
```

## 다음 단계 결정

어떤 옵션으로 진행할지 결정:
- **빠른 진단**: 옵션 1 (LLVM 3.4 비교)
- **근본 해결**: 옵션 3 (검출 로직 개선)
- **문서화 우선**: 옵션 4 (보고서 작성)

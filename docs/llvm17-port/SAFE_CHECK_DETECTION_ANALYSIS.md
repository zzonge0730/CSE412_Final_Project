# Safe Check 미검출 문제 상세 분석

## 발견 사항 요약

### 1. Loop Body 계산 방식 차이

**LLVM 3.4**:
```cpp
std::unordered_set<BasicBlock *> loopBody = ls->getLoopBody();
for (auto body : loopBody) {
    // 루프 body 순회
}
```

**LLVM 17**:
```cpp
// ls->BBs 직접 접근하지만, 실제 순회는 ls->orderedBBs 사용
for (auto BB : ls->orderedBBs) {
    // orderedBBs 순회
}
```

**영향**: Loop body 인식 방식이 달라서 safe check 검출에 영향을 줄 수 있음

### 2. Safe Check 함수 이름 차이

**LLVM 3.4**: `_RV_check_dpv_ss` (single underscore) 체크
**LLVM 17**: `__RV_check_dpv_ss` (double underscore) 체크, single underscore도 지원

**현재 코드** (`Utils.cpp`):
```cpp
bool IsSafeCheckCallForLoopFree(CallInst *CI) {
    if (CI->getCalledFunction()) {
        StringRef callName = CI->getCalledFunction()->getName();
        if (
            callName.equals("_RV_check_dpv") || 
            callName.equals("_RV_check_dpv_ss") ||  // single underscore
            callName.equals("__RV_check_dpv_ss") || // double underscore (추가됨)
            // ...
        ) {
            return true;
        }
    }
    return false;
}
```

**상태**: ✅ 함수 이름 체크는 이미 양쪽 모두 지원됨

### 3. 핵심 문제

**발견**:
- `.bc` 파일에는 **31개의 `__RV_check_dpv_ss` 호출**이 존재
- 하지만 **`kernel_2mm` 함수 내부의 루프에는 safe check가 없음**

**가능한 원인**:

#### 원인 1: MoveC Instrumentation이 루프 외부에만 있음
- MoveC가 루프 내부가 아닌 루프 전/후에만 instrumentation을 수행했을 가능성
- C 코드 레벨에서는 루프 내부에 있지만, LLVM IR로 변환 시 최적화로 인해 이동됨

#### 원인 2: LLVM 17의 최적화로 인해 제거됨
- `-O1` 이상의 최적화 레벨에서 safe check가 제거되었을 가능성
- 또는 루프 최적화로 인해 safe check가 루프 외부로 이동

#### 원인 3: Loop Body 인식 문제
- `ls->orderedBBs`가 실제 루프 body를 제대로 포함하지 않을 수 있음
- 또는 루프 헤더/프리헤더만 포함하고 body는 제외

## 진단 방법

### 1. IR 레벨에서 직접 확인

**스크립트 실행**:
```bash
./scripts/diagnose_safe_checks.sh examples/llvm17/MoveC-2mm.ll kernel_2mm
```

**확인 사항**:
1. `kernel_2mm` 함수 내부에 실제로 `__RV_check_dpv_ss`가 있는지
2. CallInst로 직접 나타나는지, 아니면 다른 instruction의 피연산자로만 사용되는지
3. 루프 body BasicBlock에 포함되어 있는지

### 2. 다른 테스트 파일 사용

**이미 검증된 파일**:
- `examples/llvm17/test_llvm17_movec.ll` - 이미 146개의 LoopFreeTask가 생성됨
- 이 파일은 루프 내부에 safe check가 확실히 있음

**비교 분석**:
```bash
# test_llvm17_movec.ll 분석
./scripts/diagnose_safe_checks.sh examples/llvm17/test_llvm17_movec.ll <함수명>

# MoveC-2mm.ll과 비교
diff <(./scripts/diagnose_safe_checks.sh examples/llvm17/test_llvm17_movec.ll) \
     <(./scripts/diagnose_safe_checks.sh examples/llvm17/MoveC-2mm.ll)
```

### 3. MoveC Instrumentation 재검토

**C 소스 코드 확인**:
```bash
# MoveC가 생성한 C 코드 확인
grep -A 10 "for (i = 0" MoveC-2mm.c.patched | grep "__RV_check_dpv_ss"
```

**확인 사항**:
- C 코드 레벨에서 루프 내부에 safe check가 있는지
- 있다면 LLVM IR 변환 시 어디로 이동했는지

## 해결 방안

### 방안 1: IR 레벨 진단 후 문제 특정

**단계**:
1. 진단 스크립트 실행하여 정확한 위치 파악
2. 문제가 확인되면:
   - **루프 body 인식 문제**: `ls->orderedBBs` 대신 다른 방법 사용
   - **최적화 문제**: `-O0`로 컴파일하여 확인
   - **Instrumentation 문제**: MoveC 옵션 변경

### 방안 2: 검출 로직 개선

**문제**: 현재는 `BasicBlock` 내의 직접적인 `CallInst`만 찾음

**개선**:
```cpp
// GetElementPtrInst의 피연산자에서도 찾기
void findSafeChecksInOperands(Instruction *I, std::vector<CallInst*> &safeChecks) {
    for (unsigned i = 0; i < I->getNumOperands(); ++i) {
        Value *op = I->getOperand(i);
        if (CallInst *CI = dyn_cast<CallInst>(op)) {
            if (IsSafeCheckCallForMovec(CI)) {
                safeChecks.push_back(CI);
            }
        }
        // 재귀적으로 검색
        if (Instruction *opInst = dyn_cast<Instruction>(op)) {
            findSafeChecksInOperands(opInst, safeChecks);
        }
    }
}
```

### 방안 3: 최적화 레벨 조정

**테스트**:
```bash
# -O0으로 재컴파일
/opt/llvm-17/bin/clang -S -emit-llvm -O0 MoveC-2mm.c -o MoveC-2mm-O0.ll

# Catamaran pass 적용
/opt/llvm-17/bin/opt \
  -load-pass-plugin=./llvm/lib/Transforms/CMPass/CMPass.so \
  -passes='Loops' \
  -S MoveC-2mm-O0.ll -o CM-MoveC-2mm-O0.ll
```

### 방안 4: Loop Body 인식 개선

**문제**: `ls->orderedBBs`가 실제 루프 body를 제대로 포함하지 않을 수 있음

**해결**:
```cpp
// LoopStructure의 실제 body BasicBlock 가져오기
std::unordered_set<BasicBlock *> getActualLoopBody(LoopStructure *ls) {
    std::unordered_set<BasicBlock *> body;
    
    // 방법 1: LoopInfo 활용
    if (Loop *L = ls->getLoop()) {
        for (BasicBlock *BB : L->blocks()) {
            body.insert(BB);
        }
    }
    
    // 방법 2: orderedBBs에서 헤더/프리헤더 제외
    for (BasicBlock *BB : ls->orderedBBs) {
        if (ls->isHeader(BB) || ls->isPreHeader(BB)) {
            continue;
        }
        body.insert(BB);
    }
    
    return body;
}
```

## 다음 단계 우선순위

### 1단계: IR 레벨 진단 (즉시 실행)
```bash
./scripts/diagnose_safe_checks.sh examples/llvm17/MoveC-2mm.ll kernel_2mm
```

### 2단계: 검증된 파일과 비교
```bash
# test_llvm17_movec.ll은 이미 작동함
# 이 파일과 MoveC-2mm.ll의 차이점 분석
```

### 3단계: 문제 특정 후 해결
- 루프 body 인식 문제 → 방안 4
- 최적화 문제 → 방안 3
- Instrumentation 문제 → MoveC 옵션 변경

## 예상 결과

### 시나리오 1: 루프 body에 safe check가 없는 경우
- **원인**: MoveC instrumentation이 루프 외부에만 있음
- **해결**: 다른 테스트 파일 사용 또는 MoveC 옵션 변경

### 시나리오 2: 루프 body에 safe check가 있지만 검출 안 되는 경우
- **원인**: Loop body 인식 문제 또는 검출 로직 문제
- **해결**: 방안 2 또는 방안 4 적용

### 시나리오 3: 최적화로 인해 제거된 경우
- **원인**: LLVM 17의 최적화
- **해결**: `-O0`로 컴파일하거나 최적화 패스 순서 조정

## 관련 파일

- `scripts/diagnose_safe_checks.sh`: IR 진단 스크립트
- `docs/SAFE_CHECK_DETECTION_ISSUE.md`: 초기 문제 분석
- `Catamaran-llvm-17/llvm/lib/Transforms/CMPass/Loops.cpp`: 메인 Pass 로직
- `Catamaran-llvm-17/llvm/lib/Transforms/CMPass/Utils.cpp`: Safe check 검출 함수

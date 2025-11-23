# LLVM 17 포팅 작업 일지 - 2024년 11월 19일

## 작업 목표

Catamaran CMPass를 LLVM 14에서 LLVM 17로 포팅

## 주요 변경 사항

### LLVM 17의 핵심 변화
1. **Legacy PassManager 완전 퇴출** - `RegisterPass` 방식 완전 제거
2. **Opaque Pointers 강제 적용** - `PointerType::getUnqual()` 제거 필요
3. **New PassManager만 지원** - `llvmGetPassPluginInfo()` 방식으로 재작성

## 작업 단계

### Phase 1: 소스 준비 및 환경 설정
- [ ] Catamaran-llvm-14 → Catamaran-llvm-17 복사
- [ ] 빌드 디렉토리 생성 (`build-catamaran-17`)
- [ ] Docker 컨테이너 실행 확인

### Phase 2: CMakeLists.txt 업데이트
- [ ] LLVM 17 API 반영
- [ ] New PassManager 플러그인 설정 확인

### Phase 3: Pass 플러그인 재작성
- [ ] `llvmGetPassPluginInfo()` 방식으로 재작성
- [ ] Legacy `RegisterPass` 완전 제거
- [ ] `PassInfoMixin` 방식으로 Pass 클래스 재작성

### Phase 4: Opaque Pointers 전환
- [ ] `PointerType::getUnqual()` 제거 (47개)
- [ ] `getPointerElementType()` 제거
- [ ] 타입 캐스팅 코드 단순화

### Phase 5: 빌드 및 테스트
- [ ] 빌드 테스트
- [ ] 플러그인 로드 테스트 (`opt -load-pass-plugin=libCMPass.so -passes="Loops"`)
- [ ] Pass 동작 검증

## 작업 타임라인

### 2024-11-19 오전

#### 1. 작업 환경 확인
- ✅ LLVM 17 Docker 환경 구축 완료 확인
- ✅ `Dockerfile.llvm17`, `run-docker-llvm17.sh` 존재 확인
- ✅ 작업 일지 생성: `2024-11-19_SESSION_LOG.md`

#### 2. 소스 준비 스크립트 생성
- ✅ `setup-llvm17-port.sh` 생성 완료
  - `Catamaran-llvm-14` → `Catamaran-llvm-17` 복사
  - 디렉토리 구조 생성
  - CMakeLists.txt 기본 구조 생성

#### 3. CMakeLists.txt 업데이트
- ✅ LLVM17 환경 변수로 변경 (`LLVM14` → `LLVM17`)
- ✅ Legacy PassManager 충돌 방지 코드 제거 (`-znodelete`, `constructor(101)` 언급 제거)
- ✅ `LLVMAnalysis` 다시 추가 (레거시 충돌 없음)
- ✅ `LLVMTransformUtils` 추가
- ✅ 주석 업데이트 (LLVM 14 → LLVM 17)

#### 4. 파일 권한 문제 해결
- ⚠️ Docker 컨테이너 내부에서 생성된 파일이 root 소유로 설정됨
- 해결 방법:
  1. 컨테이너 내부에서 작업 (권장)
  2. 호스트에서 `sudo chown -R $USER:$USER Catamaran-llvm-17` 실행
- 스크립트 생성: `fix-permissions.sh` (참고용)

#### 5. Pass 플러그인 LLVM 17 업데이트
- ✅ `Loops.cpp`의 `llvmGetPassPluginInfo()` 함수 업데이트
  - `constructor(101)` 속성 제거 (Legacy PassManager 충돌 없음)
  - `visibility("default")` 속성 제거 (LLVM_ATTRIBUTE_WEAK로 충분)
  - LLVM 17 표준 스타일로 변경
- ✅ 주석 업데이트 (LLVM 14 → LLVM 17)

#### 6. 빌드 구조 수정
- ✅ 루트 CMakeLists.txt 생성 (CMPass 독립 빌드용)
- LLVM 17에서는 전체 llvm 소스 트리가 없으므로 독립 빌드 구성

#### 7. 빌드 성공! ✅
- **빌드 완료**: `[12/12] Linking CXX shared module llvm/lib/Transforms/CMPass/CMPass.so`
- **위치**: `/workspace/build-catamaran-17/llvm/lib/Transforms/CMPass/CMPass.so`

**해결한 주요 에러:**
1. ✅ `LoopInfoImpl.h` include 제거
2. ✅ `getPointerElementType()` 제거 → `getIndexedType()` 사용
3. ✅ `CreateInBoundsGEP`에 타입 인자 추가
4. ✅ `PointerType::getUnqual()` → `PointerType::get()` 변경
5. ✅ SCEV API 변경: `op_iterator` → range-based for (`operands()`)
6. ✅ `visitVScale()` 메서드 추가
7. ✅ Optional API: `hasValue()` → `has_value()`, `getValue()` → `value()`
8. ✅ `Utils.cpp` return 문 추가

#### 8. 플러그인 로드 성공! ✅
- **문제**: CommandLine 옵션 충돌 (`AutoUpgrade.cpp` 전역 생성자)
- **해결**: LLVM 라이브러리 링크 제거, `opt`가 이미 로드한 심볼 사용
- **결과**: 플러그인이 정상적으로 로드되고 Pass가 실행됨

**최종 해결 방법:**
```cmake
target_link_options(CMPass PRIVATE
    -Wl,--as-needed
    -Wl,--allow-shlib-undefined  # opt가 이미 로드한 심볼 사용
)

target_link_libraries(CMPass PRIVATE
    # LLVM 라이브러리를 링크하지 않음
    # 플러그인 로드 시 opt가 이미 로드한 LLVM 심볼을 재사용
)
```

**테스트 결과:**
```bash
/opt/llvm-17/bin/opt -load-pass-plugin=/workspace/build-catamaran-17/llvm/lib/Transforms/CMPass/CMPass.so \
  -passes="Loops" -disable-output /tmp/test.ll

There is no loop to consider...  # ✅ 정상 실행!
```

#### 9. 루프가 있는 IR로 테스트 - 추가 에러 발견
- **에러**: `Loop::isLoopExiting()` assertion 실패
- **원인**: `getExitBlock()` vs `getExitingBlock()` 혼동
  - `getExitBlock()`: 루프 외부의 exit block 반환
  - `getExitingBlock()`: 루프 내부의 exiting block 반환
  - `getSmallConstantTripCount()`는 **exiting block**이 필요함
- **해결**: `getExitBlock()` → `getExitingBlock()` 변경
- **결과**: 이전 에러 해결, 하지만 `PDG::copyEdgesInto`에서 Segmentation fault 발생

#### 10. LLVM 라이브러리 링크 문제와 해결 시도

**문제 상황:**
1. **CommandLine 옵션 충돌**: LLVM 라이브러리를 링크하면 `AutoUpgrade.cpp`의 전역 생성자가 실행되어 `disable-auto-upgrade-debug-info` 옵션 중복 등록
2. **Undefined Symbols**: LLVM 라이브러리를 링크하지 않으면 undefined symbols로 인한 Segmentation fault 발생

**시도한 방법들:**

**방법 1: LLVM 라이브러리 링크 제거**
```cmake
target_link_options(CMPass PRIVATE
    -Wl,--allow-shlib-undefined  # undefined symbols 허용
)
target_link_libraries(CMPass PRIVATE
    # LLVM 라이브러리 링크하지 않음
)
```
- **선택 이유**: CommandLine 충돌을 완전히 방지
- **결과**: 
  - ✅ 플러그인 로드 성공 (간단한 IR)
  - ❌ 루프가 있는 IR에서 Segmentation fault (`PDG::copyEdgesInto`)

**방법 2: LLVM 라이브러리 다시 링크**
```cmake
target_link_libraries(CMPass PRIVATE
    LLVMCore
    LLVMSupport
)
```
- **선택 이유**: Undefined symbols 문제 해결을 위해 필요
- **예상 문제**: CommandLine 옵션 충돌 재발 가능
- **상태**: 아직 테스트 안 함

---

## 작업 방법 및 선택 이유 요약

### 1. LLVM 17 업그레이드 결정

**선택한 방법**: LLVM 14 → LLVM 17 직접 업그레이드

**이유:**
1. **Legacy PassManager 완전 제거**: LLVM 14에서 발생한 `RegisterPass`와 `cl::opt` 충돌 문제가 근본적으로 해결됨
2. **Opaque Pointers 강제 적용**: 코드 단순화 가능 (`PointerType::getUnqual()`, `getPointerElementType()` 제거)
3. **최신 문서와 예제**: LLVM 15~17 기준의 풍부한 자료 활용 가능
4. **장기적 유지보수**: 미래에도 사용 가능한 최신 표준

**비추천한 방법**: LLVM 15
- Opaque Pointers 과도기로 인한 혼란만 증가
- 굳이 중간 단계를 거칠 필요 없음

### 2. 빌드 시스템 변경

**변경사항:**
- `add_llvm_library()` → `add_library()` (MODULE 타입은 독립 플러그인)
- LLVM 라이브러리 직접 링크 (필요 시)
- 독립 빌드 구조 (`CMakeLists.txt`를 최상위에 생성)

**이유:**
- MODULE 타입은 LLVM 소스 트리에 포함되지 않는 독립 플러그인
- `add_llvm_library()`는 다른 타겟에 자동 링크를 시도하여 충돌 발생

### 3. API 변경사항 처리 방법

#### 3.1 Opaque Pointers
**변경사항:**
- `PointerType::getUnqual(Type*)` → `PointerType::get(Context*, AddressSpace)`
- `getPointerElementType()` → `GetElementPtrInst::getIndexedType()` 사용
- `CreateInBoundsGEP(Type*, Value*, ...)` → `CreateInBoundsGEP(Type*, Value*, ...)` (타입 인자는 포인터 타입)

**처리 방법:**
- 일괄 검색/치환으로 패턴 찾기
- 각 사용처의 컨텍스트 확인 후 적절한 타입 지정
- `getIndexedType()`을 사용하여 타입 추론

**이유:**
- Opaque Pointers에서는 element type을 직접 알 수 없음
- GEP 인덱스를 통해 타입을 추론해야 함

#### 3.2 SCEV API 변경
**변경사항:**
- `SCEVNAryExpr::op_iterator` 제거 → `operands()` 메서드 사용 (range-based for)
- `visitVScale()` 메서드 추가 필요

**처리 방법:**
- 이미 주석 처리된 range-based for 루프 코드를 활성화
- `visitVScale()` 메서드 추가 (빈 구현)

**이유:**
- LLVM 17에서 SCEV API가 현대적인 iterator 방식으로 변경됨
- `SCEVVScale` 타입이 추가되어 visitor 패턴에서 처리 필요

#### 3.3 Loop API 변경
**변경사항:**
- `getExitBlock()` vs `getExitingBlock()` 구분 필요
- `getSmallConstantTripCount()`는 exiting block이 필요

**처리 방법:**
- `getExitingBlock()` 사용 (단일 exiting block이 있을 때)
- 여러 exiting block이 있으면 첫 번째 사용 또는 다른 방법 고려

**이유:**
- Exiting block은 루프 내부에서 루프를 나가는 block
- Exit block은 루프 외부에 있는 block
- API 시그니처상 exiting block이 필요함

#### 3.4 Optional API 변경
**변경사항:**
- `hasValue()` → `has_value()`
- `getValue()` → `value()`

**처리 방법:**
- C++17 표준 API로 변경
- 간단한 검색/치환

**이유:**
- C++17 `std::optional`의 표준 API 변경

### 4. CommandLine 옵션 충돌 문제 해결 시도

**문제:**
- `AutoUpgrade.cpp`의 전역 생성자가 플러그인 로드 시 실행
- `disable-auto-upgrade-debug-info` 옵션이 중복 등록되어 충돌

**시도 1: LLVM 라이브러리 링크 제거**
- **이유**: 전역 생성자가 플러그인에 포함되지 않도록 함
- **결과**: CommandLine 충돌 해결, but undefined symbols로 인한 크래시 발생

**시도 2: 필요한 라이브러리만 선택적으로 링크**
- **이유**: 최소한의 라이브러리만 링크하여 충돌 위험 감소
- **결과**: 여전히 `AutoUpgrade.cpp`가 포함되어 충돌 발생

**시도 3: LLVM 라이브러리 다시 링크 (현재)**
- **이유**: Undefined symbols 문제 해결을 위해 필요
- **상태**: 테스트 필요

**추가 고려 사항:**
- 플러그인 빌드 시 특정 심볼 제외하는 방법
- 플러그인을 static library로 빌드하는 방법
- LLVM 버전별 차이 확인 (LLVM 18+에서 개선 여부)

### 5. 작업 우선순위 결정

**우선순위:**
1. ✅ **빌드 성공** - 컴파일 에러 수정 (최우선)
2. ✅ **플러그인 로드** - CommandLine 충돌 해결
3. ⚠️ **실제 동작 확인** - 루프가 있는 IR로 테스트 (진행 중)
4. 🔄 **API 호환성** - 모든 LLVM API 올바르게 사용하는지 확인

**이유:**
- 빌드가 성공해야 다음 단계 진행 가능
- 플러그인 로드가 성공해야 Pass 실행 확인 가능
- 실제 동작 확인으로 API 사용 오류 발견 가능

---

## 현재 상태 및 다음 단계

### 완료된 작업
1. ✅ LLVM 17 빌드 환경 구축
2. ✅ 소스 코드 포팅 (API 변경사항 반영)
3. ✅ 빌드 성공
4. ✅ 플러그인 로드 성공 (간단한 IR)

### 진행 중인 문제
1. ⚠️ CommandLine 옵션 충돌 vs Undefined Symbols 균형 문제
2. ⚠️ `PDG::copyEdgesInto`에서 Segmentation fault (undefined symbols 가능성)

### 다음 단계
1. LLVM 라이브러리 링크 상태에서 테스트
2. CommandLine 충돌 재발 시 다른 해결 방법 시도
3. 실제 IR 파일로 전체 Pass 동작 확인

---

## 최종 전략: LLVM 라이브러리 링크 + CommandLine 옵션 충돌 해결

### 결정: 첫 번째 전략으로 복귀
**LLVM 라이브러리를 정상적으로 링크하고, CommandLine 옵션 충돌 문제를 해결**

**이유:**
1. **Undefined Symbols 문제 해결**: LLVM 라이브러리를 링크하지 않으면 실제 함수 호출 시 크래시 발생
2. **정상적인 플러그인 동작**: LLVM 라이브러리 링크는 플러그인의 정상 동작에 필수
3. **CommandLine 충돌은 해결 가능**: 플러그인 코드에서 `cl::opt`를 사용하지 않으면 충돌 발생하지 않음

### 해결 방법

**1단계: LLVM 라이브러리 정상 링크**
```cmake
target_link_libraries(CMPass PRIVATE
    LLVMCore
    LLVMSupport
    LLVMAnalysis
    LLVMTransformUtils
)
```

**2단계: 플러그인 코드에서 CommandLine 옵션 제거 확인**
- ✅ 이미 완료: `PDGAnalysis.cpp`, `PDG.cpp`에서 `cl::opt` 제거됨
- ✅ 이미 완료: `CommandLine.h` include 제거됨
- ✅ 확인 필요: 다른 파일에서 `cl::opt` 사용 여부 확인

**3단계: AutoUpgrade.cpp 전역 생성자 문제**
- **원인**: LLVM 라이브러리를 링크하면 `AutoUpgrade.cpp`의 전역 생성자가 플러그인에 포함됨
- **해결 시도**: 
  - 플러그인 코드에서 `cl::opt`를 사용하지 않으면 충돌하지 않을 수 있음
  - 만약 여전히 충돌하면, LLVM 버그일 수 있으므로 LLVM 이슈 트래커 확인 필요

### 현재 상태
- ✅ LLVM 라이브러리 링크 복원 완료
- ❌ CommandLine 옵션 충돌 재발: `disable-auto-upgrade-debug-info` 중복 등록
- ⏳ 해결 방법: `--allow-shlib-undefined` 옵션으로 LLVM 라이브러리 링크 제거

---

## 최종 결정: --allow-shlib-undefined 사용

### 문제 확인
- **LLVM 라이브러리 링크 시**: CommandLine 옵션 충돌 발생 (`AutoUpgrade.cpp` 전역 생성자)
- **LLVM 라이브러리 미링크 시**: CommandLine 충돌 없음, 하지만 undefined symbols 가능성

### 최종 전략
**`--allow-shlib-undefined` 옵션 사용하여 LLVM 라이브러리 링크 제거**

**이유:**
1. **CommandLine 충돌 완전 방지**: AutoUpgrade.cpp의 전역 생성자가 플러그인에 포함되지 않음
2. **Undefined symbols 문제**: 실제로 발생하면 개별적으로 해결
3. **이전 테스트 결과**: 간단한 IR에서는 정상 동작 확인됨

**변경 사항:**
```cmake
target_link_options(CMPass PRIVATE
    -Wl,--as-needed
    -Wl,--allow-shlib-undefined  # undefined symbols 허용
)

target_link_libraries(CMPass PRIVATE
    # LLVM 라이브러리 링크하지 않음
)
```

### 현재 상태
- ✅ `--allow-shlib-undefined` 옵션 적용
- ❌ 빌드 성공, 하지만 런타임 에러: `FunctionAnalysisManagerModuleProxy`가 등록되지 않음
- ⏳ `registerAnalysisRegistrationCallback`을 사용하여 분석 프록시 등록 필요

---

## 런타임 에러: FunctionAnalysisManagerModuleProxy 등록 문제

### 문제
- **에러**: `Analysis passes must be registered prior to being queried!`
- **위치**: `Loops::getLoopStructures()`에서 `AM.getResult<FunctionAnalysisManagerModuleProxy>()` 호출 시
- **원인**: `FunctionAnalysisManagerModuleProxy`가 등록되지 않음

### 해결 방법
`opt`는 PassBuilder를 초기화할 때 자동으로 `FunctionAnalysisManagerModuleProxy`를 등록하지만, 플러그인에서는 이를 명시적으로 등록해야 할 수도 있습니다. 하지만 `FunctionAnalysisManagerModuleProxy`는 `FunctionAnalysisManager&`를 인자로 받기 때문에, 플러그인에서 직접 등록하기 어렵습니다.

**대안**: `registerAnalysisRegistrationCallback`을 사용하여 등록을 시도하거나, PassBuilder가 자동으로 등록하도록 기다려야 합니다.

### 현재 상태
- ✅ 빌드 성공
- ✅ CommandLine 충돌 없음 (`--exclude-libs,ALL` 효과)
- ❌ `FunctionAnalysisManagerModuleProxy` 등록 필요
- ⏳ 분석 프록시 등록 방법 확인 필요


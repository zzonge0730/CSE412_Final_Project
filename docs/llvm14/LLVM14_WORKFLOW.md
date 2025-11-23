# LLVM 14 이식 작업 순서

## 전체 워크플로우

```
1. 환경 준비 (한 번만)
   ↓
2. CMPass 코드 수정 (반복)
   ↓
3. CMakeLists.txt 수정
   ↓
4. 빌드 시도
   ↓
5. 에러 확인 및 수정 ← (2번으로 돌아가서 반복)
   ↓
6. 빌드 성공
   ↓
7. 테스트
```

## 상세 작업 순서

### 1단계: 환경 준비 (한 번만)

```bash
# Docker 컨테이너 실행
docker run -it --rm \
  -v "$(pwd):/workspace:delegated" \
  -w /workspace \
  catamaran:llvm14

# 컨테이너 내부에서 디렉토리 생성 및 소스 복사
mkdir -p Catamaran-llvm-14/llvm/lib/Transforms/CMPass
cp -r Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMPass/* \
      Catamaran-llvm-14/llvm/lib/Transforms/CMPass/
```

### 2단계: CMPass 코드 수정 (반복 작업)

**우선 수정할 파일들:**

1. **CMakeLists.txt** (빌드 시스템)
   - 위치: `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/CMakeLists.txt`
   - LLVM 14 스타일로 변경

2. **Pass 등록 파일들** (가장 중요)
   - `Loops.cpp`, `LoopsMovec.cpp`, `PDGAnalysis.cpp` 등
   - 구 PassManager → 새 PassManager로 전환

3. **API 변경**
   - `getNumUses()` → `use_empty()` 또는 `use_size()`
   - 헤더 파일 include 경로 수정
   - PassManager 관련 코드 수정

### 3단계: CMakeLists.txt 수정

**필요한 CMakeLists.txt 파일들:**

1. `Catamaran-llvm-14/llvm/lib/Transforms/CMakeLists.txt`
   ```cmake
   add_subdirectory(CMPass)
   ```

2. `Catamaran-llvm-14/llvm/lib/Transforms/CMPass/CMakeLists.txt`
   - LLVM 14 스타일로 작성

### 4단계: 빌드 시도

```bash
# 빌드 디렉토리로 이동
cd /workspace/build-catamaran-14

# CMake 설정 (처음 한 번만)
cmake -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_DIR=$LLVM14/lib/cmake/llvm \
    -DCMAKE_CXX_STANDARD=17 \
    ../Catamaran-llvm-14/llvm

# 빌드 (코드 수정 후마다 반복)
ninja
```

### 5단계: 에러 확인 및 수정 (반복)

**빌드 에러가 나면:**

1. 에러 메시지 확인
2. 해당 파일의 API를 LLVM 14에 맞게 수정
3. 다시 `ninja` 실행
4. 반복...

**일반적인 에러 패턴:**

- `error: 'PassManager' was not declared` → 새 PassManager로 변경 필요
- `error: 'getNumUses' was not declared` → `use_empty()` 또는 `use_size()` 사용
- `error: no matching function for call` → API 시그니처 변경 확인

### 6단계: 빌드 성공 후 테스트

```bash
# 빌드된 libCMPass.so 확인
ls -lh /workspace/build-catamaran-14/lib/libCMPass.so

# 기본 테스트
smoke_test.sh

# 실제 예제로 테스트
cd /workspace
./build-catamaran-14/bin/clang examples/2mm.c -o 2mm -lm
```

## 반복 작업 팁

### 효율적인 작업 방법

1. **작은 단위로 수정**
   - 한 번에 모든 파일 수정하지 말고
   - 하나씩 수정하고 빌드 테스트

2. **빌드 캐시 활용**
   - `ninja`는 변경된 파일만 다시 빌드
   - 전체 재빌드가 필요하면: `ninja clean && ninja`

3. **에러 로그 저장**
   ```bash
   ninja 2>&1 | tee build-errors.log
   ```

4. **단계별 확인**
   - CMakeLists.txt 수정 → CMake 재실행
   - 소스 코드 수정 → ninja만 실행

## 예상 작업 시간

- **초기 설정**: 30분
- **코드 수정**: 2-5일 (복잡도에 따라)
- **빌드 및 디버깅**: 1-3일
- **테스트 및 최종 확인**: 1일

**총 예상 시간**: 1-2주 (LLVM API 변경이 크기 때문)

## 체크리스트

### 환경 준비
- [ ] Docker 이미지 빌드 완료
- [ ] 디렉토리 구조 생성
- [ ] CMPass 소스 복사

### 코드 수정
- [ ] CMakeLists.txt 수정
- [ ] Pass 등록 코드 수정 (Loops.cpp 등)
- [ ] API 변경 (getNumUses 등)
- [ ] 헤더 파일 경로 수정

### 빌드
- [ ] CMake 설정 성공
- [ ] 첫 빌드 시도
- [ ] 에러 수정
- [ ] 빌드 성공

### 테스트
- [ ] libCMPass.so 생성 확인
- [ ] smoke_test.sh 통과
- [ ] 실제 예제 실행

## 다음 단계

1. **지금 할 일**: CMPass 코드 수정 시작
2. **수정 후**: 빌드 시도
3. **에러 나면**: 에러 메시지 보고 수정
4. **반복**: 빌드 성공할 때까지

**핵심**: 수정 → 빌드 → 에러 확인 → 수정 → 빌드 (반복)


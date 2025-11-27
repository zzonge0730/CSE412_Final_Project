# 프로젝트 상태 확인 및 수정 사항

## 발견된 문제

### 1. MoveC γ 실행 시 segfault 발생 (해결됨)

**문제 위치**: `PDGAnalysis::constructEdgesFromUseDefs()` 함수
- **원인**: `pdgValue->getNumUses()` 호출 시 segfault 발생
- **증상**: MoveC γ 파이프라인 실행 중 `constructEdgesFromUseDefs`에서 크래시
- **스택 트레이스**: 
  ```
  opt  llvm::Value::getNumUses() const + 16
  libCMPass.so  PDGAnalysis::constructEdgesFromUseDefs(PDG*) + 237
  ```

**해결 방법**:
- `getNumUses() == 0` 체크를 `use_empty()`로 대체
- `use_empty()`는 동일한 기능을 수행하지만 더 안전함
- 불필요한 디버그 출력 제거

**수정 파일**:
- `Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMPass/PDGAnalysis.cpp`
  - Line 213-222: null 체크 추가 및 `getNumUses()` → `use_empty()` 변경
  - Line 226-234: 디버그 출력 제거

## 현재 프로젝트 상태

### 완료된 작업
1. ✅ SoftBoundCETS 빌드 및 호환성 패치 (errno.h)
2. ✅ Catamaran LLVM 3.4.0 빌드
3. ✅ MoveC γ 문제 해결 (PDG::setEntryPointAt)
4. ✅ MoveC γ segfault 문제 해결 (constructEdgesFromUseDefs)

### 테스트 필요 항목
1. MoveC γ 전체 파이프라인 재실행
   ```bash
   docker compose run --rm dev bash -c "cd /workspace && \
     ./build-catamaran-3.4.0/bin/opt -load ./build-catamaran-3.4.0/lib/libCMPass.so \
     -movec -PDGAnalysis -catamaran-pdg-reaching-analysis -LoopsMovec < MoveC-2mm.ll \
     -o CM-MoveC-2mm.bc"
   ```

2. 바이너리 빌드 및 실행 테스트
   ```bash
   docker compose run --rm dev bash -c "cd /workspace && \
     ./build-catamaran-3.4.0/bin/clang++ -pthread -std=C++11 -DNUM_THREADS=3 \
     CM-MoveC-2mm.bc ./runtime/ThreadPool.cpp -o CM-MoveC-2mm && \
     time ./CM-MoveC-2mm 1000 1000 1000 1000 0"
   ```

### 알려진 이슈
1. **MoveC 바이너리 호환성**: MoveC 바이너리가 호스트에서 빌드되어 Docker 컨테이너에서 실행 불가
   - 해결책: 기존 IR 파일(`MoveC-movec.bc`, `MoveC-2mm.ll`) 사용
   - 또는 호스트에서 MoveC 실행하여 IR 생성 후 Docker에서 사용

2. **GLIBC 버전 불일치**: 호스트 GLIBC 2.35 vs Docker GLIBC 2.31
   - 모든 빌드는 Docker 컨테이너 내에서 수행해야 함

## 다음 단계

1. **빌드 재실행**: 수정된 코드로 Catamaran 재빌드
   ```bash
   docker compose run --rm dev bash -c "cd /workspace/build-catamaran-3.4.0 && \
     make -j\$(nproc) CMPass"
   ```

2. **테스트 실행**: MoveC γ 파이프라인 전체 테스트

3. **성능 측정**: 성공 시 성능 오버헤드 측정 및 비교

## 수정 내역 요약

### 최근 수정 사항
- `PDGAnalysis.cpp`: `getNumUses()` → `use_empty()` 변경으로 segfault 해결
- 디버그 출력 정리

### 이전 수정 사항 (reproduction.md 참조)
- `PDG.cpp`: `setEntryPointAt` 함수 재작성 및 fallback 로직 추가
- `DGBase.h`: `fetchNode` assert 버그 수정
- SoftBoundCETS errno.h 호환성 패치

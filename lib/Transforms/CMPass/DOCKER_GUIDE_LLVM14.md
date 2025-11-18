# Catamaran LLVM 14 Docker 환경 설정 가이드

이 가이드는 LLVM 14를 목표로 Catamaran 프로젝트를 포팅하기 위한 Docker 환경 설정 방법을 설명합니다.

## 🎯 목표

- **LLVM 14** 기반 Catamaran 빌드 환경 구축
- 기존 LLVM 3.4 환경과 분리된 독립적인 개발 환경
- 최신 C++17 표준 지원

## 📋 요구사항

### LLVM 14 빌드 요구사항
- **Ubuntu 22.04** (권장) 또는 Ubuntu 20.04
- **GCC 10+** (GCC 12 권장)
- **CMake 3.13+**
- **C++17** 표준 지원
- **Ninja** 빌드 시스템 (선택사항, 권장)

### Docker 요구사항
- Docker 20.10+
- 최소 8GB RAM (LLVM 빌드 시)
- 최소 20GB 디스크 공간

## 🚀 빠른 시작

### 1. Docker 이미지 빌드

```bash
cd /root/Catamaran_artifact_issta23
docker build -f Dockerfile.llvm14 -t catamaran:llvm14 .
```

또는 빌드 스크립트 사용:

```bash
./build-docker-llvm14.sh
```

**빌드 시간**: 약 1-2시간 (LLVM 14 소스 빌드 포함)

### 2. Docker 컨테이너 실행

```bash
docker run -it --name catamaran-llvm14 \
  -v $(pwd):/workspace \
  -w /opt/catamaran \
  catamaran:llvm14 \
  /bin/bash
```

또는 실행 스크립트 사용:

```bash
./run-docker-llvm14.sh
```

## 📁 디렉토리 구조

컨테이너 내부 구조:

```
/opt/
├── llvm-14/              # LLVM 14 소스 및 빌드
│   ├── llvm/             # LLVM 소스
│   └── build/            # LLVM 빌드 결과
├── catamaran/            # Catamaran 프로젝트
│   ├── Catamaran-llvm-14/  # 포팅된 Catamaran 코드 (작업 필요)
│   └── build-catamaran-14/ # Catamaran 빌드 결과
└── movec/                # MoveC 도구
```

## 🔧 환경 변수

컨테이너 내부에서 사용 가능한 환경 변수:

```bash
LLVM14=/opt/llvm-14/build          # LLVM 14 빌드 디렉토리
CATAMARAN14=/opt/catamaran/build-catamaran-14  # Catamaran 빌드 디렉토리
MOVEC_BIN=/opt/movec/bin          # MoveC 바이너리 경로
```

## 📝 포팅 작업 순서

### Step 1: CMPass 포팅 준비

```bash
# 컨테이너 내부에서
cd /opt/catamaran

# LLVM 14용 디렉토리 생성 (기존 코드 복사)
cp -r Catamaran-llvm-3.4.0 Catamaran-llvm-14

# 또는 새로 클론
git clone <your-repo> Catamaran-llvm-14
```

### Step 2: CMPass 포팅

주요 변경 사항:

1. **Pass Manager 전환**
   ```cpp
   // Legacy (LLVM 3.4)
   static RegisterPass<LoopsMovec> X("LoopsMovec", "...");
   
   // New Pass Manager (LLVM 14)
   struct LoopsMovec : public PassInfoMixin<LoopsMovec> {
     PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM);
   };
   ```

2. **API 업데이트**
   - `getLoopsInfoBaseLoopsInPreorder()` → `getLoopsInPreorder()`
   - `CreateLoad(Value*)` → `CreateLoad(Type*, Value*)`
   - `PointerType::getUnqual()` → `PointerType::get()`

3. **CMakeLists.txt 수정**
   ```cmake
   # LLVM 14용 설정
   add_llvm_library(CMPass SHARED
       ...
   )
   ```

### Step 3: 빌드 및 테스트

```bash
# Catamaran 빌드
cd /opt/catamaran/build-catamaran-14
ninja

# 테스트
smoke_test.sh
```

## 🧪 테스트 예제

### 기본 테스트

```bash
# 컨테이너 내부에서
cd /opt/catamaran

# Baseline 빌드
${CATAMARAN14}/bin/clang examples/2mm.c -o 2mm -lm

# 실행
time ./2mm 1000 1000 1000 1000 0
```

### MoveC 테스트

```bash
# MoveC로 변환
movec --check-memsafe -c examples/2mm.c -o MoveC-2mm.c

# LLVM IR 생성
${CATAMARAN14}/bin/clang -S -emit-llvm MoveC-2mm.c -o MoveC-2mm.ll

# Catamaran Pass 적용
${CATAMARAN14}/bin/opt -load ${CATAMARAN14}/lib/libCMPass.so \
    -movec -PDGAnalysis -catamaran-pdg-reaching-analysis -LoopsMoveC \
    < MoveC-2mm.ll -o CM-MoveC-2mm.bc

# 최종 빌드
${CATAMARAN14}/bin/clang++ -pthread -std=c++17 -DNUM_THREADS=3 \
    CM-MoveC-2mm.bc runtime/ThreadPool.cpp -o CM-MoveC-2mm
```

## 🔍 문제 해결

### 빌드 실패 시

1. **LLVM 14 빌드 실패**
   ```bash
   # LLVM 빌드 로그 확인
   tail -100 /opt/llvm-14/build/build.log
   ```

2. **CMPass 컴파일 에러**
   - Pass Manager 전환 확인
   - API 호환성 확인
   - C++17 표준 준수 확인

3. **링크 에러**
   ```bash
   # LLVM 라이브러리 경로 확인
   echo $LLVM14
   ls -la ${LLVM14}/lib/
   ```

### 디버깅 팁

```bash
# LLVM 버전 확인
${LLVM14}/bin/clang --version

# Pass 등록 확인
${CATAMARAN14}/bin/opt -help | grep -i movec

# IR 덤프
${CATAMARAN14}/bin/opt -S < input.ll
```

## 📚 참고 자료

- [LLVM 14 Release Notes](https://releases.llvm.org/14.0.0/docs/ReleaseNotes.html)
- [New Pass Manager Migration Guide](https://llvm.org/docs/NewPassManager.html)
- [LLVM 14 API Changes](https://llvm.org/docs/ReleaseNotes.html#changes-to-the-llvm-ir)

## ⚠️ 주의사항

1. **기존 환경과 분리**: LLVM 3.4 환경과 완전히 분리되어 있음
2. **포팅 완료 전**: CMPass 포팅이 완료되기 전까지는 빌드가 실패할 수 있음
3. **디스크 공간**: LLVM 14 빌드에 약 10-15GB 필요

## 🔄 기존 환경과의 비교

| 항목 | LLVM 3.4 (기존) | LLVM 14 (신규) |
|------|----------------|----------------|
| Base OS | Ubuntu 18.04 | Ubuntu 22.04 |
| GCC | 7 | 12 |
| C++ 표준 | C++11 | C++17 |
| Pass Manager | Legacy | New |
| 빌드 시스템 | Make | Ninja (권장) |

## 💡 다음 단계

1. ✅ Docker 환경 구축 (이 가이드)
2. ⏳ CMPass 포팅 (작업 필요)
3. ⏳ 빌드 및 테스트
4. ⏳ 성능 벤치마크


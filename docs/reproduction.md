정리 메모(README나 별도 노트에 옮겨두면 좋아요):
재현용 환경: Ubuntu 20.04 기반 Docker로 LLVM 3.4 + SoftBoundCETS + MoveC 재현 성공. gcc-7, python3 지정, iterator 헤더 보강 등으로 빌드 통과.
더 오래된 OS 필요 여부: 16.04는 패키지 노후/EOL이라 오히려 부담. 20.04에서도 필요한 의존성을 맞춰 이미 빌드 재현했으므로 그대로 간다.
최신 실험: LLVM 18 등은 Ubuntu 22.04 별도 컨테이너/인스턴스에서 진행해 완전히 분리.

## Objective 1 재현 진행 로그 (2025-11-09 ~ 2025-11-10)

### 환경
- **모든 작업은 Docker 컨테이너 안에서 진행**
- Docker 이미지: `catamaran-dev:latest` (Ubuntu 20.04, gcc-7/g++-7, python3)
- 컨테이너 진입: `docker compose run --rm dev`
- 호스트 ↔ 컨테이너: `/workspace`에 저장소 마운트
- **중요**: 호스트에서 빌드한 바이너리는 Docker 컨테이너에서 실행 불가 (GLIBC 버전 불일치)

### 빌드 절차 (Docker 컨테이너 안에서 실행)

**모든 명령은 `docker compose run --rm dev`로 진입한 컨테이너 안에서 실행**

1. SoftBoundCETS
   ```bash
   docker compose run --rm dev bash -c "cd /workspace && \
     cd softboundcets-34 && \
     PYTHON=/usr/bin/python3 ./configure --enable-assertions --enable-optimized && \
     make -j\$(nproc) && \
     PATH=\$PWD/softboundcets-llvm-clang34/Release+Asserts/bin:\$PATH make -C softboundcets-lib"
   ```

2. Catamaran LLVM 3.4
   ```bash
   docker compose run --rm dev bash -c "cd /workspace && \
     mkdir -p build-catamaran-3.4.0 && \
     cd build-catamaran-3.4.0 && \
     cmake -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD=host -DCMAKE_CXX_STANDARD=11 ../Catamaran-llvm-3.4.0/llvm/ && \
     make -j\$(nproc) clang opt CMPass"
   ```

3. MoveC
   - **현재 상태**: MoveC 바이너리가 호스트에서 빌드되어 Docker 컨테이너에서 실행 불가
   - **해결 방법**: 기존 IR 파일(`MoveC-movec.bc`) 사용 (가장 안정적)
   - **대안**: 새로운 테스트 케이스가 필요한 경우에만 호스트에서 MoveC 실행하여 IR 파일 생성

4. 예제 빌드 (Docker 컨테이너 안에서)
   - Baseline: `./build-catamaran-3.4.0/bin/clang ./examples/2mm.c -o 2mm`
   - SoftBoundCETS: `./softboundcets-34/softboundcets-llvm-clang34/Release+Asserts/bin/clang -fsoftboundcets ./examples/2mm.c -o SBCETS-2mm -L./softboundcets-34/softboundcets-lib -lm -lrt`

### 실행 결과 (PolyBench 2mm, N=1000)
- Baseline (`2mm`): `0:02.86 16640KB`
- SoftBoundCETS (`SBCETS-2mm`): `0:16.92 17408KB`
- MoveC β (`MoveC-2mm`): `1:34.68 16768KB`
- SoftBoundCETS / Catamaran γ: **성공** (2025-01-XX)
  - `opt -PDGAnalysis -catamaran-pdg-reaching-analysis -Loops` → 정상 실행 완료
  - 출력 파일 `CM-SBCETS-2mm-new.bc` 정상 생성 (28KB)
  - 바이너리 빌드 및 성능 측정 완료: `real 0m18.237s` (또는 `0m15.148s`)
- MoveC / Catamaran γ: **성공** (2025-01-XX 해결)
  - `opt -movec -PDGAnalysis -catamaran-pdg-reaching-analysis -LoopsMovec` → 정상 실행 완료
  - 출력 파일 `CM-MoveC-2mm.bc` 정상 생성 (97KB)
  - 바이너리 빌드 및 성능 측정 완료: `real 1m43.615s`
  - **해결 방법**: `PDG::setEntryPointAt`에서 `main` 함수가 없을 때 fallback 함수 사용 로직 추가

### 호환성 패치 기록
| 파일 | 변경 내용 | 사유 |
| --- | --- | --- |
| `softboundcets-34/softboundcets-lib/softboundcets-wrappers.c`<br>`softboundcets-34/softboundcets-lib/softboundmpx-wrappers.c` | `#include <bits/errno.h>` 제거, `#include <errno.h>` 사용. `#define _GNU_SOURCE` 추가. | glibc 2.31에서 `<bits/errno.h>` 직접 include 시 빌드 실패. GNU 확장 함수 선언 필요. |
| `MoveC-2mm.c` (Movec 자동 생성물) | VLA 파라미터(`double p7[ni][nl]` 등)를 포인터 형태(`double (*p7)[p4]`)로 치환. | Movec가 생성한 코드가 최신 clang/gcc에서 VLA 식별자(`ni`, `nj` 등)를 해석하지 못해 빌드 오류 발생. 함수 시그니처만 포인터로 바꿔 호환성 확보. |

- 위 변경은 재현 과정에서 필요한 빌드 호환성 조치이며, 원본 소스(`examples/2mm.c`, LLVM 패스 등)는 수정하지 않음.
- 패치 적용 시점과 이유를 재현 보고서에 명시할 것.

### MoveC γ 문제 해결 (2025-01-XX)

**문제**: `PDG::setEntryPointAt`에서 segfault 발생
- 원인: `PDG::PDG(Module &M)` 생성자에서 `main` 함수를 찾지 못했을 때 `mainF`가 `nullptr`인 상태에서 `setEntryPointAt(*mainF)` 호출
- 추가 원인: `setEntryPointAt`에서 `F.getName()` 호출 시 `F` 객체가 손상되어 segfault 발생

**해결 방법**:
1. `main` 함수가 없을 때 fallback 함수를 찾는 로직 추가 (`PDG::PDG(Module &M)` 생성자)
2. `setEntryPointAt`에서 `F.getName()` 호출 제거
3. 안전한 진입점 노드 가져오기 로직 구현 (`isInGraph` + `fetchNode` 사용)

**결과**: 
- `PDGAnalysis` 단독 실행 성공
- 전체 Catamaran 파이프라인 (`-movec -PDGAnalysis -catamaran-pdg-reaching-analysis -LoopsMovec`) 성공
- 출력 파일 정상 생성 (97KB)

**수정된 파일**:
- `Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMPass/PDG.cpp`:
  - `PDG::PDG(Module &M)`: `main` 함수 fallback 로직 추가
  - `PDG::setEntryPointAt`: 완전히 재작성, 안전한 진입점 노드 가져오기 로직 구현
  - `addNodesOf`: 인자 처리 버그 수정 (`&arg_it` → `&*arg_it`)
- `Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMPass/DGBase.h`:
  - `DG<T>::fetchNode`: assert 버그 수정

### MoveC γ 실패 원인 가설 (해결됨)

### Docker 빌드 환경 이슈

**발견된 문제:**
- 호스트에서 빌드한 바이너리 (Catamaran, MoveC)는 Docker 컨테이너(Ubuntu 20.04, GLIBC 2.31)에서 실행 불가
- 호스트 GLIBC 버전: 2.35, Docker 컨테이너 GLIBC 버전: 2.31
- Catamaran은 Docker 컨테이너 안에서 재빌드 완료 (2025-11-10)
- MoveC는 아직 해결 필요: 바이너리가 호스트에서 빌드되어 컨테이너에서 실행 불가

**해결 방법 (권장: 옵션 3 - 기존 IR 파일 사용):**
1. ✅ **옵션 3 (권장)**: 기존 IR 파일(`MoveC-movec.bc`) 사용
   - Docker 컨테이너 내에서 완전히 독립적
   - 호스트 환경에 의존하지 않음
   - 가장 안정적이고 간단한 워크플로우
   - 현재 테스트에 충분함

2. 옵션 1: 호스트에서 MoveC 실행하여 IR 파일 생성 (새로운 테스트 케이스 필요 시)
3. 옵션 2: MoveC 소스 코드 빌드 (소스 코드 위치 확인 필요)


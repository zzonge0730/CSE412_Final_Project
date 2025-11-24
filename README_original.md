# Catamaran

This is the artifact for Paper #233 of ISSTA'23 "Catamaran: Low-Overhead Memory Safety Enforcement via Parallel Acceleration ".

## Getting Started 

### Requirments

1. Hardware

* CPU: Any CPU with multiple cores

* Memory: >= 4GB of main memory, preferably more

* Disk: Free space >= 10GB

2. Software

* GCC >= 7.3.0

* CMAKE >= 3.14.2

* [SoftBoundCETS for llvm-3.4](https://github.com/santoshn/softboundcets-34)


Follow the instructions below for compiling it

```bash
git clone https://github.com/santoshn/softboundcets-34.git
cd softboundcets-34/softboundcets-llvm-clang34/
./configure --enable-assertions --enable-optimized
make -j $(nproc)
cd ../softboundcets-lib/
make
```

Now the executable binary and library of softboundcets are in the path ```softboundcets-34/softboundcets-llvm-clang34/Release+Asserts/``` and ```softboundcets-34/softboundcets-lib/```

* [MoveC](https://github.com/drzchen/movec)

Follow the instructions below for installing it

```bash
git clone https://github.com/drzchen/movec.git
export PATH=./movec/bin:$PATH
movec -h
```

* [AddressSanitizer (ASAN) for llvm-3.5.2](https://github.com/llvm/llvm-project/tree/llvmorg-3.5.2)

Follow the instructions below for compiling it

```bash
git clone https://github.com/llvm/llvm-project.git -b llvmorg-3.5.2
mv llvm-project/ llvm-3.5.2
cd llvm-3.5.2
mv compiler-rt/ ./llvm/projects/
mkdir build
cd build
cmake --enable-optimized ../llvm/
make -j $(nproc)
```

Now the executable binary and library of ASAN are in the path ```llvm-3.5.2/build/```

*Note that if your gcc version is too high (e.g., 10 or 11), or too low (e.g., 5), there might be compatibility errors when compiling llvm-3.5.2 directly. You need to patch the code of llvm-3.5.2 first according to the content provided on this [website](https://aur.archlinux.org/packages/llvm35) before proceeding with the compilation.*

* **Catamaran**

1. Catamaran based on llvm-3.4.0 (*Catamaran-llvm-3.4.0*) supports the accleration of SoftBoundCETS and MoveC.

Follow the instructions below for compiling it

```bash
mkdir build-catamaran-3.4.0
cd build-catamaran-3.4.0/
cmake -DCMAKE_BUILD_TYPE=Release --enable-optimized --enable-targets=host-only -DCMAKE_CXX_STANDARD=11 ./Catamaran-llvm-3.4.0/llvm/
make -j $(nproc)
```

Now the executable binary and library of Catamaran-3.4.0 are in the path ```./build-catamaran-3.4.0/```

2. Catamaran based on llvm-3.5.2 (*Catamaran-llvm-3.5.2*) supports the accleration of ASAN.

Follow the instructions below for compiling it

```bash
mkdir build-catamaran-3.5.2
cd build-catamaran-3.5.2/
cmake -DCMAKE_BUILD_TYPE=Release --enable-optimized --enable-targets=host-only -DCMAKE_CXX_STANDARD=11 ./Catamaran-llvm-3.5.2/llvm/
make -j $(nproc)
```
Now the executable binary and library of Catamaran-3.5.2 are in the path ```./build-catamaran-3.5.2/```



## Detailed Instructions

### Run Simple Example
To quickly demonstrate the basic functionality of Catamaran, we have prepared a simple example -- the 2mm subject from [PolyBench](https://web.cse.ohio-state.edu/~pouchet.2/software/polybench/)

#### 1. Baseline Version ($\alpha$)

##### 1.1 Compile the baseline binary
```bash
./build-catamaran-3.4.0/bin/clang ./examples/2mm.c -o 2mm
```

##### 1.2 Evaluate the $\alpha$ version binary
```bash
time ./2mm 1000 1000 1000 1000 0
```

The wall time of the $\alpha$ version binary is denoted as $WallTime_\alpha$


#### 2. Memory Safety Enforced Version ($\beta$)

##### 2.1 Enforced by SoftBoundCETS 

##### 2.1.1 Compile the $\beta$ version binary
```bash
./softboundcets-34/softboundcets-llvm-clang34/Release+Asserts/bin/clang -fsoftboundcets ./examples/2mm.c -o SBCETS-2mm -L./softboundcets-34/softboundcets-lib -lm -lrt
```

##### 2.1.2 Evaluate the $\beta$ version binary
```bash
time ./SBCETS-2mm 1000 1000 1000 1000 0
```

The wall time of the $\beta$ version binary on SoftBoundCETS is denoted as $WallTime\_SBCETS_\beta$

Then the memory safety enforced time overhead $TO_\beta$ shown in the paper is obtained by using the formula $TO\_SBCETS_\beta = (WallTime\_SBCETS_\beta - WallTime_\alpha) / WallTime_\alpha$  



##### 2.2 Enforced by MoveC

##### 2.2.1 Compile the $\beta$ version binary
```bash
movec --check-memsafe -c ./examples/2mm.c -o MoveC-2mm.c
./build-catamaran-3.4.0/bin/clang MoveC-2mm.c -o MoveC-2mm
```

##### 2.2.2 Evaluate the $\beta$ version binary
```bash
time ./MoveC-2mm 1000 1000 1000 1000 0
```

The wall time of the $\beta$ version binary on MoveC is denoted as $WallTime\_MoveC_\beta$

Then $TO\_MoveC_\beta = (WallTime\_MoveC_\beta - WallTime_\alpha) / WallTime_\alpha$  

##### 2.3 Enforced by ASAN 


##### 2.3.1 Compile the $\beta$ version binary
```bash
./llvm-3.5.2/build/bin/clang -fsanitize=address -mllvm -asan-instrumentation-with-call-threshold=0 ./examples/2mm.c -o ASAN-2mm
```

##### 2.3.2 Evaluate the $\beta$ version binary
```bash
time ./ASAN-2mm 1000 1000 1000 1000 0
```

The wall time of the $\beta$ version binary on ASAN is denoted as $WallTime\_ASAN_\beta$

Then $TO\_ASAN_\beta = (WallTime\_ASAN_\beta - WallTime_\alpha) / WallTime_\alpha$  




#### 3. Catamaran Parallelized Version ($\gamma$)

##### 3.1 Accelerate SoftBoundCETS 

##### 3.1.1 Compile the $\gamma$ version binary
```bash
# generate the SoftBoundCETS enforced IR file
./softboundcets-34/softboundcets-llvm-clang34/Release+Asserts/bin/clang -S -emit-llvm -fsoftboundcets ./examples/2mm.c -o SBCETS-2mm.ll
# Catamaran 
./build-catamaran-3.4.0/bin/opt -load ./build-catamaran-3.4.0/lib/libCMPass.so -PDGAnalysis -catamaran-pdg-reaching-analysis -Loops < SBCETS-2mm.ll -o CM-SBCETS-2mm.bc > log.txt 2>&1
./build-catamaran-3.4.0/bin/clang++ -pthread -std=C++11 -DNUM_THREADS=3 CM-SBCETS-2mm.bc ./runtime/ThreadPool.cpp -L./softboundcets-34/softboundcets-lib/ -lsoftboundcets_rt -lm -lrt -o CM-SBCETS-2mm
```

##### 3.1.2 Evaluate the $\gamma$ version binary
```bash
time ./CM-SBCETS-2mm 1000 1000 1000 1000 0
```

The wall time of the $\gamma$ version binary on SoftBoundCETS is denoted as $WallTime\_SBCETS_\gamma$

Then the Catamaran parallelized time overhead $TO_\gamma$ shown in the paper is obtained by using the formula $TO\_SBCETS_\gamma = (WallTime\_SBCETS_\gamma - WallTime_\alpha) / WallTime_\alpha$  

And the speed up ratio can be calculated by the faormula $TO\_SBCETS_\beta / TO\_SBCETS_\gamma$ 


##### 3.2 Accelerate MoveC 

##### 3.2.1 Compile the $\gamma$ version binary
```bash
# generate the MoveC enforced IR file
./build-catamaran-3.4.0/bin/clang -S -emit-llvm MoveC-2mm.c -o MoveC-2mm.ll
# Catamaran 
./build-catamaran-3.4.0/bin/opt -load ./build-catamaran-3.4.0/lib/libCMPass.so -movec -PDGAnalysis -catamaran-pdg-reaching-analysis -LoopsMoveC < MoveC-2mm.ll -o CM-MoveC-2mm.bc > log.txt 2>&1
./build-catamaran-3.4.0/bin/clang++ -pthread -std=C++11 -DNUM_THREADS=3 CM-MoveC-2mm.bc ./runtime/ThreadPool.cpp -o CM-MoveC-2mm
```

##### 3.2.2 Evaluate the $\gamma$ version binary
```bash
time ./CM-MoveC-2mm 1000 1000 1000 1000 0
```

The wall time of the $\gamma$ version binary on MoveC is denoted as $WallTime\_MoveC_\gamma$

Then the Catamaran parallelized time overhead $TO_\gamma$ shown in the paper is obtained by using the formula $TO\_MoveC_\gamma = (WallTime\_MoveC_\gamma - WallTime_\alpha) / WallTime_\alpha$  

And the speed up ratio can be calculated by the faormula $TO\_MoveC_\beta / TO\_MoveC_\gamma$ 

##### 3.3 Accelerate ASAN

##### 3.3.1 Compile the $\gamma$ version binary

```bash
# generate the ASAN enforced IR file
./llvm-3.5.2/build/bin/clang -S -emit-llvm -fsanitize=address -mllvm -asan-instrumentation-with-call-threshold=0 ./examples/2mm.c -o ASAN-2mm.ll
# Catamaran 
./build-catamaran-3.5.2/bin/opt -load ./build-catamaran-3.5.2/lib/libCMPass.so -PDGAnalysis -catamaran-pdg-reaching-analysis -TFAsan < ASAN-2mm.ll -o CM-ASAN-2mm.bc > log.txt 2>&1
./build-catamaran-3.5.2/bin/clang++ -fsanitize=address -pthread -std=C++11 -DNUM_THREADS=3 CM-ASAN-2mm.bc ./runtime/ThreadPool.cpp -o CM-ASAN-2mm
```

##### 3.3.2 Evaluate the $\gamma$ version binary
```bash
time ./CM-ASAN-2mm 1000 1000 1000 1000 0
```

The wall time of the $\gamma$ version binary on ASAN is denoted as $WallTime\_ASAN_\gamma$

Then the Catamaran parallelized time overhead $TO_\gamma$ shown in the paper is obtained by using the formula $TO\_ASAN_\gamma = (WallTime\_ASAN_\gamma - WallTime_\alpha) / WallTime_\alpha$  

And the speed up ratio can be calculated by the faormula $TO\_ASAN_\beta / TO\_ASAN_\gamma$ 





*Note that we have also provided IR format files of the 2mm subject instrumented by SoftBoundCETS, MoveC and ASAN respectively, which are <a href="./examples/SBCETS-2mm-backup.ll">SBCETS-2mm-backup.ll</a>, <a href="./examples/MoveC-2mm-backup.ll">MoveC-2mm-backup.ll</a>, <a href="./examples/ASAN-2mm-backup.ll">ASAN-2mm-backup.ll</a>*




### Run SPEC

*It should be note that SPEC is a proprietary benchmark and is not included in this evaluation by default. Nevertheless, the evalution scripts will prompt for the local SPEC sources and utilize them if provided. Moreover, it should be taken into account that certain versions of SPEC may have errors that must be fixed before compiled successfully. This is the <a href="./SPEC/spec2006/cpu2006.patch">spec 2006 patch file</a> we used to fix errors.*


#### 1. Baseline Version ($\alpha$)


```bash
# SPEC 2006
cd spec2006
sh run.sh baseline-o0
python3 parse-time-mem-spec2006.py baseline o0

# SPEC 2017
cd spec2017
sh run_baseline_o0.sh 
python3 parser-time-mem-spec2017.py baseline o0
```

#### 2. Memory Safety Enforced Version ($\beta$)

##### 2.1 Enforced by SoftBoundCETS
```bash
# SPEC 2006
cd spec2006
sh run.sh softboundcets-o0
python3 parse-time-mem-spec2006.py softboundcets o0

# SPEC 2017
cd spec2017
sh run_softboundcets_o0.sh 
python3 parser-time-mem-spec2017.py softboundcets o0
```

##### 2.2 Enforced by MoveC
```bash
# SPEC 2006
cd spec2006
sh run.sh movec-o0
python3 parse-time-mem-spec2006.py movec o0

# SPEC 2017
cd spec2017
sh run_movec_o0.sh 
python3 parser-time-mem-spec2017.py movec o0
```


##### 2.3 Enforced by ASAN
```bash
# SPEC 2006
cd spec2006
sh run.sh asan-o0
python3 parse-time-mem-spec2006.py asan o0

# SPEC 2017
cd spec2017
sh run_asan_o0.sh 
python3 parser-time-mem-spec2017.py asan o0
```


#### 3. Catamaran Parallelized Version ($\gamma$)


##### 3.1 Accelerate SoftBoundCETS 

```bash
# SPEC 2006
cd spec2006
# generate the SoftBoundCETS enforced IR file
sh run_wrapper.sh wrapper-softboundcets-o0
# link them into one IR file, Catamaran applys on it, and executes
python3 link_and_exe_spec2006.py softboundcets o0

# SPEC 2017
cd spec2017
sh run_wrapper_softboundcets_o0.sh
python3 link_and_exe_spec2017.py softboundcets o0
```


##### 3.2 Accelerate MoveC 

```bash
# SPEC 2006
cd spec2006
# generate the MoveC enforced IR file
sh run_wrapper_movec.sh
# link them into one IR file, Catamaran applys on it, and executes
python3 link_and_exe_spec2006.py movec o0

# SPEC 2017
cd spec2017
sh run_wrapper_movec_o0.sh
python3 link_and_exe_spec2017.py movec o0
```

##### 3.3 Accelerate ASAN 

```bash
# SPEC 2006
cd spec2006
# generate the ASAN enforced IR file
sh run_wrapper.sh wrapper-asan-o0
# link them into one IR file, Catamaran applys on it, and executes
python3 link_and_exe_spec2006.py asan o0

# SPEC 2017
cd spec2017
sh run_wrapper_asan_o0.sh
python3 link_and_exe_spec2017.py asan o0
```
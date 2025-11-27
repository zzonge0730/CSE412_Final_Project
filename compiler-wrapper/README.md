# Compiler Wrapper

A small bash script to wrap clang compiler commands.

## How it Works
The script pretends to be a valid C compiler.
When building system tries to run a compile command which has `-c` option, indicating _compile and assemble only, don't linking_, the script will try to rewrite such command and send it to real compiler.

The script typically splits a compile command as above into two parts:
1. The first part is a command to compile the source code, and generate a
ir file to certain directory.
2. The second part is a command to assemble the generated ir file.

The script will try to use the previously generated ir files first.
If these files still exist in the output directory, then the compilation instructions will not really be executed and the compiler will use these ir files directly for assembly.
## Environment Variables Used by Script
* `COMPILER_WRAPPER_ENABLED`
    * Set to `"true"` to enable the wrapper.
* `COMPILER_WRAPPER_OUTPUT_PATH`
    * Set to specify the output path of ir files. Otherwise default value will be used.
    * Seems that it has to be an absolute path without `~` or `${HOME}`, and I don't know what happens when the path has those things in it.

Compiler and compiling options is pre-defined in the script, change it when necessary.  (Or I should use another two environment variables to control them...)
## Usage
```
unset COMPILER_WRAPPER_ENABLED
CC=wrapper.sh ./configure
export COMPILER_WRAPPER_ENABLED=true
make
```

Tested on libzip1.2.0.

## Use with SPEC2006
### Build Directory for Each Benchmark

* SoftboundCETS
    `<path_to_spec2006>/benchspec/CPU2006/<somebench>/run/build_base_wrapper.0001`
* MOVEC
    `<path_to_spec2006>/benchspec/CPU2006/<somebench>/run/build_peak_wrapper.0001`

That is, we use `base` metric for SoftboundCETS and `peak` for MOVEC.

It's not clear that what difference these two metrics will make to the benchmarking, although the same compile options is used in both metrics.
### Trigger Build System
Simply use `make` to build an excutable and use `make clean` to clean build artifacts when you are in certain build directory.

Remember to activate the script first, then it will use our modified ir files to compile.
You will see the red prompt saying it will ignoring the compile command when it finds an existing ir file.

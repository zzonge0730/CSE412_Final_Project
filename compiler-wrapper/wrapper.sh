#!/bin/bash

# set COMPILER_WRAPPER_ENABLED to "true" to enable wrapper.

# set COMPILER_WRAPPER_OUTPUT_PATH to specify output path
if [[ -z ${COMPILER_WRAPPER_OUTPUT_PATH} ]]; then
  printf "Error, COMPILER_WRAPPER_OUTPUT_PATH not specified\n"
  exit -1
else
  mkdir -p "${COMPILER_WRAPPER_OUTPUT_PATH}"
fi

# set COMPILER_WRAPPER_COMPILER to specify compiler used
if [[ -z ${COMPILER_WRAPPER_COMPILER} ]]; then
  printf "Error, COMPILER_WRAPPER_COMPILER not specified\n"
  exit -1
fi

if [[ "${COMPILER_WRAPPER_ENABLED}" != "true" ]]; then
  printf "Error, COMPILER_WRAPPER_ENABLED not specified\n"
  exit -1
fi

# extra arguments to generate llvm IR
declare -a compile_options_wrapper_default=( "-S" "-emit-llvm" )
# extension name for IR
declare ir_extname="ll"
# path of compiler
declare compiler="${COMPILER_WRAPPER_COMPILER}"
# path of logfile
declare log_file="./parse.log"

declare -a compile_optionss=()
declare -a assemble_options=()
declare output_file_name=""
declare -a source_files=()
declare original_command="$*"
declare object_or_excutable="excutable"
declare ret_val=""

# printf "Origin compile_options: ${original_command}\n" >> "${COMPILER_WRAPPER_OUTPUT_PATH}/${log_file}"

while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    -S)
      compile_options+=("$1")
      printf "wrapper.sh: -S detected \n"
      exec ${original_command}
      ;;
    -o|--output)
    # TODO: add support for -oa.out --output=a.out
      output_file_name="$2"
      shift # past argument
      shift # past value
      ;;
    -c)
      compile_options+=("$1")
      object_or_excutable="object"
      shift
      ;;
    *.c | *.cpp | *.cc)
      source_files+=("$1")
      shift
      ;;
    --bootclasspath=* | --classpath=* | --CLASSPATH=* | --encoding=* | --extdirs=* | -faccess-control | -faddrsig | -faligned-allocation | -falign-functions | -falign-functions=* | -falign-loops=* | -fallow-editor-placeholders | -fallow-unsupported | -faltivec | -faltivec-src-compat=* | -fansi-escape-codes | -fapple-kext | -fapple-link-rtlib | -fapple-pragma-pack | -fapplication-extension | -fasm | -fasm-blocks | -fassociative-math | -fassume-sane-operator-new | -fast | -fastcp | -fastf | -fasync-exceptions | -fasynchronous-unwind-tables | -fautolink | -fauto-profile=* | -fbasic-block-sections=* | -fbinutils-version=* | -fblocks | -fbootclasspath=* | -fborland-extensions | -fbracket-depth=* | -fbuiltin | -fbuiltin-module-map | -fcaret-diagnostics | -fcf-protection=* | -fcf-runtime-abi=* | -fchar8_t | -fclasspath=* | -fcolor-diagnostics | -fcommon | -fcompile-resource=* | -fconstant-cfstrings | -fconstant-string-class=* | -fconstexpr-backtrace-limit=* | -fconstexpr-depth=* | -fconstexpr-steps=* | -fconvergent-functions | -fcoroutines-ts | -fcoverage-compilation-dir=* | -fcoverage-mapping | -fcoverage-prefix-map=* | -fcreate-profile | -fcs-profile-generate | -fcs-profile-generate=* | -fc++-static-destructors | -fcuda-approx-transcendentals | -fcuda-short-ptr | -fcxx-exceptions | -fcxx-modules | -fdata-sections | -fdebug-compilation-dir=* | -fdebug-default-version=* | -fdebug-info-for-profiling | -fdebug-macro | -fdebug-pass-arguments | -fdebug-pass-structure | -fdebug-prefix-map=* | -fdebug-ranges-base-address | -fdebug-types-section | -fdelayed-template-parsing | -fdelete-null-pointer-checks | -fdenormal-fp-math=* | -fdiagnostics-absolute-paths | -fdiagnostics-color | -fdiagnostics-color=* | -fdiagnostics-hotness-threshold=* | -fdiagnostics-show-hotness | -fdiagnostics-show-note-include-stack | -fdiagnostics-show-option | -fdiagnostics-show-template-tree | -fdigraphs | -fdirect-access-external-data | -fdollars-in-identifiers | -fdouble-square-bracket-attributes | -fdwarf-directory-asm | -fdwarf-exceptions | -felide-constructors | -feliminate-unused-debug-symbols | -feliminate-unused-debug-types | -fembed-bitcode=* | -femit-all-decls | -femulated-tls | -fenable-matrix | -fencoding=* | -ferror-limit=* | -fescaping-block-tail-calls | -fexceptions | -fexec-charset=* | -fexperimental-new-constant-interpreter | -fextdirs=* | -fextend-arguments=* | -ffast-math | -ffile-compilation-dir=* | -ffile-prefix-map=* | -ffinite-loops | -ffinite-math-only | -ffixed-point | -fforce-dwarf-frame | -fforce-emit-vtables | -fforce-enable-int128 | -ffor-scope | -ffp-contract=* | -ffp-eval-method=* | -ffp-exception-behavior=* | -ffp-model=* | -ffreestanding | -ffunction-sections | -fgnu89-inline | -fgnuc-version=* | -fgnu-inline-asm | -fgnu-keywords | -fgnu-runtime | -fgpu-allow-device-init | -fgpu-defer-diag | -fgpu-rdc | -fgpu-sanitize | -fhip-fp32-correctly-rounded-divide-sqrt | -fhip-new-launch-api | -fhonor-infinities | -fhonor-nans | -fhosted | -fignore-exceptions | -fimplicit-module-maps | -fimplicit-modules | -finput-charset=* | -finstrument-function-entry-bare | -finstrument-functions | -finstrument-functions-after-inlining | -fintegrated-as | -fintegrated-cc1 | -fjump-tables | -fkeep-static-consts | -flax-vector-conversions=* | -flimited-precision=* | -flto | -flto=* | -flto-jobs=* | -fmacro-backtrace-limit=* | -fmacro-prefix-map=* | -fmath-errno | -fmax-tokens=* | -fmax-type-align=* | -fmemory-profile | -fmemory-profile=* | -fmerge-all-constants | -fmessage-length=* | -fminimize-whitespace | -fmodule-file-deps | -fmodule-map-file=* | -fmodule-name=* | -fmodules | -fmodules-decluse | -fmodules-ignore-macro=* | -fmodules-search-all | -fmodules-strict-decluse | -fmodules-ts | -fmodules-validate-input-files-content | -fms-compatibility | -fms-compatibility-version=* | -fmsc-version=* | -fms-extensions | -fms-memptr-rep=* | -fms-volatile | -fmudflap | -fmudflapth | -fnested-functions | -fnew-alignment=* | -fnew-infallible | -fnext-runtime | -fno-aligned-allocation | -fno-builtin-* | -fno-elide-type | -fno-gpu-rdc | -fno-honor-infinities | -fno-implicit-module-maps | -fno-max-type-align | -fno_modules-validate-input-files-content | -fno_pch-validate-input-files-content | -fno-profile-sample-accurate | -fno-profile-sample-use | -fno-standalone-debug | -fno-strict-modules-decluse | -fno-temp-file | -fno-verbose-asm | -fno-working-directory | -fnoxray-link-deps | -fobjc-abi-version=* | -fobjc-arc | -fobjc-arc-exceptions | -fobjc-convert-messages-to-runtime-calls | -fobjc-disable-direct-methods-for-testing | -fobjc-encode-cxx-class-template-spec | -fobjc-exceptions | -fobjc-infer-related-result-type | -fobjc-legacy-dispatch | -fobjc-link-runtime | -fobjc-nonfragile-abi | -fobjc-nonfragile-abi-version=* | -fobjc-runtime=* | -fobjc-sender-dependent-dispatch | -fobjc-weak | -foffload-lto | -foffload-lto=* | -fomit-frame-pointer | -fopenmp | -fopenmp=* | -fopenmp-simd | -fopenmp-target-new-runtime | -fopenmp-version=* | -foperator-arrow-depth=* | -foperator-names | -foptimization-record-file=* | -foptimization-record-passes=* | -foptimize-sibling-calls | -forder-file-instrumentation | -foutput-class-dir=* | -fpack-struct | -fpack-struct=* | -fpascal-strings | -fpass-plugin=* | -fpatchable-function-entry=* | -fpcc-struct-return | -fpch-codegen | -fpch-debuginfo | -fpch-instantiate-templates | -fpch-preprocess | -fpch-validate-input-files-content | -fpic | -fPIC | -fpie | -fPIE | -fplt | -fplugin=* | -fprebuilt-implicit-modules | -fpreserve-as-comments | -fproc-stat-report* | -fproc-stat-report=* | -fprofile-arcs | -fprofile-dir=* | -fprofile-exclude-files=* | -fprofile-filter-files=* | -fprofile-generate | -fprofile-generate=* | -fprofile-instr-generate | -fprofile-instr-generate=* | -fprofile-instr-use | -fprofile-instr-use=* | -fprofile-list=* | -fprofile-remapping-file=* | -fprofile-sample-accurate | -fprofile-sample-use | -fprofile-sample-use=* | -fprofile-update=* | -fprofile-use | -fprofile-use=* | -fprotect-parens | -fpseudo-probe-for-profiling | -freciprocal-math | -fregister-global-dtors-with-atexit | -freg-struct-return | -frelaxed-template-template-args | -freroll-loops | -fretain-comments-from-system-headers | -frewrite-imports | -frewrite-includes | -frewrite-map-file=* | -fropi | -frounding-math | -frtti | -frtti-data | -frwpi | -fsave-optimization-record | -fsave-optimization-record=* | -fseh-exceptions | -fsemantic-interposition | -fshort-enums | -fshort-wchar | -fshow-column | -fshow-overloads=* | -fshow-source-location | -fsignaling-math | -fsigned-bitfields | -fsigned-char | -fsigned-zeros | -fsized-deallocation | -fsjlj-exceptions | -fslp-vectorize | -fspell-checking | -fspell-checking-limit=* | -fsplit-dwarf-inlining | -fsplit-lto-unit | -fsplit-machine-functions | -fsplit-stack | -fstack-clash-protection | -fstack-protector | -fstack-protector-all | -fstack-protector-strong | -fstack-size-section | -fstack-usage | -fstandalone-debug | -fstrict-aliasing | -fstrict-enums | -fstrict-float-cast-overflow | -fstrict-overflow | -fstrict-return | -fstrict-vtable-pointers | -fstruct-path-tbaa | -fsymbol-partition=* | -ftabstop=* | -ftemplate-backtrace-limit=* | -ftemplate-depth=* | -ftemplate-depth-* | -fterminated-vtables | -ftest-coverage | -fthin-link-bitcode=* | -fthinlto-index=* | -fthreadsafe-statics | -ftime-report | -ftime-report=* | -ftime-trace | -ftime-trace-granularity=* | -ftls-model=* | -ftrap-function=* | -ftrapping-math | -ftrapv | -ftree-slp-vectorize | -ftree-vectorize | -ftrigraphs | -ftrivial-auto-var-init=* | -ftrivial-auto-var-init-stop-after=* | -funique-basic-block-section-names | -funique-internal-linkage-names | -funique-section-names | -funit-at-a-time | -funroll-loops | -funsafe-math-optimizations | -funsigned-bitfields | -funsigned-char | -funwind-tables | -fuse-cxa-atexit | -fuse-init-array | -fuse-ld=* | -fuse-line-directives | -fvalidate-ast-input-files-content | -fveclib=* | -fvectorize | -fverbose-asm | -fvirtual-function-elimination | -fvisibility=* | -fvisibility-dllexport=* | -fvisibility-externs-dllimport=* | -fvisibility-externs-nodllstorageclass=* | -fvisibility-from-dllstorageclass | -fvisibility-global-new-delete-hidden | -fvisibility-inlines-hidden | -fvisibility-inlines-hidden-static-local-var | -fvisibility-ms-compat | -fvisibility-nodllstorageclass=* | -fwasm-exceptions | -fwhole-program-vtables | -fwrapv | -fwritable-strings | -fxl-pragma-pack | -fxray-always-emit-customevents | -fxray-always-emit-typedevents | -fxray-always-instrument=* | -fxray-attr-list=* | -fxray-function-groups=* | -fxray-function-index | -fxray-ignore-loops | -fxray-instruction-threshold* | -fxray-instruction-threshold=* | -fxray-instrument | -fxray-instrumentation-bundle=* | -fxray-link-deps | -fxray-modes=* | -fxray-never-instrument=* | -fxray-selected-function-group=* | -fzero-initialized-in-bss | -fzvector | --gpu-bundle-output | -integrated-as | -mpascal-strings | -mzvector | -no-pedantic | --output-class-directory=* | -pedantic | -pedantic-errors | --resource=* | --signed-char | -trigraphs | --unsigned-char)
      assemble_options+=("$1")
      shift
      ;;
    --bootclasspath | --classpath | --CLASSPATH | --encoding | --extdirs | -fdebug-compilation-dir | -fmodule-implementation-of | -fnew-alignment | -ftrapv-handler | --output-class-directory | --resource)
      assemble_options+=("$1" "$2")
      shift
      shift
      ;;
    *)
      compile_options+=("$1")
      shift
      ;;
  esac
done

if [[ "${COMPILER_WRAPPER_ENABLED}" != "true" || ${#source_files[@]} -eq 0 ]]; then
  printf "wrapper.sh: disabled  ${compiler} ${original_command[*]}\n"
  exec ${compiler} ${original_command}
  exit 0
fi

# printf "Source Files: ${source_files[*]}\n" >> "${COMPILER_WRAPPER_OUTPUT_PATH}/${log_file}"
declare -a ir_files=()
for file in ${source_files[@]}; do
  declare ir_file="${COMPILER_WRAPPER_OUTPUT_PATH}/$(pwd)/${file%.*}.ll"
  declare ir_dir_name="$(dirname ${ir_file})"
  mkdir -p ${ir_dir_name}
  ir_files+=(${ir_file})
done

declare compile_command="${compiler} ${source_files[@]} ${compile_options_wrapper_default[@]} ${compile_options[@]}"

declare assemble_command="${compiler} ${ir_files[@]} ${assemble_options[@]}"
if [[ ! -z "${output_file_name}" ]]; then
  assemble_command+=("-o" "$(pwd)/${output_file_name}")
fi
if [[ ${object_or_excutable} == "object" ]]; then
  assemble_command+=("-c")
fi

for file in ${ir_files[@]}; do
  if [[ -e "${file}" ]]; then
    compile_command+=( "-o" "/dev/null")
    printf "wrapper.sh: ir find ${file}, skipping compile.\n" | tee -a "${COMPILER_WRAPPER_OUTPUT_PATH}/${log_file}"
    $(${compile_command[@]})
  else
    compile_command+=( "-o" "${ir_files[@]}")
    printf "wrapper.sh: ir  ${compile_command[*]}\n" | tee -a "${COMPILER_WRAPPER_OUTPUT_PATH}/${log_file}"
    $(${compile_command[@]})
    ret_val=$?
    if [[ ${ret_val} -ne 0 ]]; then
      printf "wrapper.sh: ir failed\n"
      exit ${ret_val}
    fi
  fi
done

printf "wrapper.sh: object  ${assemble_command[*]}\n" | tee -a "${COMPILER_WRAPPER_OUTPUT_PATH}/${log_file}"
$(${assemble_command[@]})
ret_val=$?
if [[ ${ret_val} -ne 0 ]]; then
  printf "wrapper.sh: obj failed \n"
  exit ${ret_val}
fi

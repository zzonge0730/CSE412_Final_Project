# file(GLOB SRCS
#     Decider.cpp
#     Fitness.cpp
#     FunArgInfo.cpp
#     Profitability.cpp
# )
# set_source_files_properties(${SRCS} PROPERTIES COMPILE_FLAGS "-std=c++11")
# set(PassName "Analyses")

# list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
# include(AddLLVM)

# include_directories(./)

# add_llvm_library(${PassName} SHARED ${SRCS})
add_llvm_library(Analyses SHARED
        Decider.cpp
        Fitness.cpp
        FunArgInfo.cpp
        Profitability.cpp
)
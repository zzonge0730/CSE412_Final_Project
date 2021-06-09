add_llvm_library( CMPass SHARED
    BitMatrix.cpp
    DataFlowAnalysis.cpp
    DataFlowEngine.cpp
    DataFlowResult.cpp
    IdentifyPass.cpp
    PDG.cpp
    PDGAnalysis.cpp
    Utils.cpp
)

add_dependencies(CMPass LLVMInstrumentation)
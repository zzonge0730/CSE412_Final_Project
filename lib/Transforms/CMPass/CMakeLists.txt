add_llvm_library( CMPass SHARED
    BitMatrix.cpp
    DataFlowAnalysis.cpp
    DataFlowEngine.cpp
    DataFlowResult.cpp
    DecisionMaker.cpp
    IdentifyPass.cpp
    PDG.cpp
    PDGAnalysis.cpp
    Transformer.cpp
    Utils.cpp
)
# set_target_properties( CMPass 
#     PROPERTIES 
#     LINK_FLAGS "-Wl,-znodelete"
# )

add_dependencies(CMPass LLVMInstrumentation)
add_llvm_library( CMPass SHARED
    AccumulatorOpInfo.cpp
    BitMatrix.cpp
    DataFlowAnalysis.cpp
    DataFlowEngine.cpp
    DataFlowResult.cpp
    # DecisionMaker.cpp
    DOALL.cpp
    DOALLTask.cpp
    DominatorSummary.cpp
    EnvBuilder.cpp
    # Heuristics.cpp
    # Hot.cpp
    # IdentifyPass.cpp
    InductionVariables.cpp
    InterTask.cpp
    InvariantManager.cpp
    IVStepperUtility.cpp
    LoopCarriedDependencies.cpp
    LoopDependenceInfo.cpp
    LoopEnvironment.cpp
    LoopFreeTask.cpp
    LoopGoverningIVAttribution.cpp
    LoopIterationDomainSpaceAnalysis.cpp
    Loops.cpp
    LoopsMovec.cpp
    LoopStructure.cpp
    LoopSummary.cpp
    LoopVariables.cpp
    # Master.cpp
    MemoryCloningAnalysis.cpp
    # Parallelizer.cpp
    PDG.cpp
    PDGAnalysis.cpp
    # SanRazorPass.cpp
    ScalarEvolutionDelinearization.cpp
    ScalarEvolutionReferencer.cpp
    SCC.cpp
    SCCAttrs.cpp
    SCCDAG.cpp
    SCCDAGAttrs.cpp
    StayConnectedNestedLoopForest.cpp
    # Transformer.cpp
    Utils.cpp
)
# set_target_properties( CMPass 
#     PROPERTIES 
#     LINK_FLAGS "-Wl,-znodelete"
# )

add_dependencies(CMPass LLVMInstrumentation)
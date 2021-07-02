#include "DOALL.h"

DOALL::DOALL(Module& M) {

}

bool DOALL::apply(LoopDependenceInfo * LDI, Catamaran& cat, Heuristics * H) {

}

bool DOALL::canBeAppliedToLoop(LoopDependenceInfo * LDI, Catamaran& cat, Heuristics * H) {

}

std::unordered_set<SCC *> DOALL::getSCCsThatBlockDOALLToBeApplicable(LoopDependenceInfo * LDI, Catamaran& cat) {

}

void DOALL::rewireLoopToIterateChunks(LoopDependenceInfo * LDI) {
    
}

void DOALL::addChunkFunctionExecutionAsiderOriginalLoop(LoopDependenceInfo *LDI, Function *loopFunction, Catamaran * cat) {
    
}

void * DOALL::fetchClone(Value * original) const {

}
#include "Parallelizer.h"
#include <iterator>

using namespace llvm;

char Parallelizer::ID = 0;
static RegisterPass<Parallelizer> X("ParallelDOALL", "Find DOALL Parallelism And Parallel it");

Parallelizer::Parallelizer() : ModulePass {ID} {

}

void Parallelizer::getAnalysisUsage(AnalysisUsage &AU) {
    AU.addRequired<LoopInfo>();
    AU.addRequired<ScalarEvolution>();
    AU.addRequired<PostDominatorTree>(); // 
    AU.addRequired<DominatorTree>();

    AU.addRequired<Catamaran>();
    AU.addRequired<CatamaranHeuristic>();
    AU.setPreservesAll();
}
bool Parallelizer::runOnModule(Module& M) {
    errs() << "Parallelizer::runOnMudule start...\n";

    //get the analysis pass classes we rely on


    //construct doall object
    DOALL doall{M};

    //fetch all the loops we want to parallelize

    //generate the nesting forest

    //filter out loops that are not worthing parallelizing

    //print the loops

    //parallelize the loop we selected, from outermost to the inner ones






    errs() << "Parallelizer::runOnModule end...\n";
    return false;
}

bool Parallelizer::parallelizeLoop(DOALL& doall) {

}

void Parallelizer::printLoop(Loop* loop) {
    errs() << "Parallelizing the following loop...\n";
    auto header = loop->getHeader();
    errs() << "Number of BBs: " << std::distance(loop->block_begin(), loop->block_end()) << "\n";
    for (auto bbIt = loop->block_begin(); bbIt != loop->block_end(); ++bbIt) {
        auto bb = *bbIt;
        if (header == bb) {
            errs() << "Loop Header: \n";
        } else if (loop->isLoopLatch(bb)) {
            errs() << "Loop Latch: \n";
        } else if (loop->isLoopExiting(bb)) {
            errs() << "Loop Exiting: \n";
        } else {
            errs() << "Loop Body: \n";
        }

        for (auto& I : *bb) {
            I.print(errs());
            errs() << "\n";
        }
    }

}
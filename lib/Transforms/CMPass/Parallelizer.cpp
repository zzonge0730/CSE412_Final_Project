#include "Parallelizer.h"
#include <iterator>
#include <string>

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

    AU.addRequired<Master>();
    AU.setPreservesAll();
}
bool Parallelizer::runOnModule(Module& M) {
    errs() << "Parallelizer::runOnMudule start...\n";

    //get the analysis pass classes we rely on
    Master& master = getAnalysis<Master>();
    //construct doall object
    DOALL doall{M};

    //fetch all the loops we want to parallelize
    errs() << "Parallelizer: Fetching the program loops\n";
    auto programLoops = master.getLoopStructures();
    if (programLoops->size() == 0) {
        errs() << "Parallelizer: There is no loop to consider.\n";

        delete programLoops;

        errs() << "Parallelizer: Exit.\n";
        return false;
    }

    errs() << "Parallelizer: There are " << programLoops->size() << " loops in the program that we are going to consider.\n";

    //generate the nesting forest
    auto forest = master.organizeLoopsInTheirNestingForest(*programLoops);
    delete programLoops;

    //filter out loops that are not worthing parallelizing
    errs() << "TODO: Parallelizer: Filter out loops not worthing considering\n";
    //TODO: zyy
    
    //print the loops
    auto trees = forest->getTrees();
    errs() << "Parallelizer: There are " << trees.size() << " loop nesting trees in the program\n";
    for (auto tree : trees) {
        //print the root
        auto loopS = tree->getLoop();
        auto loopid = loopS->getID();

        //print the tree
        auto printTree = [](StayConnectedNestedLoopForestNode * n, uint32_t treeLevel) {
            auto loopS = n->getLoop();
            auto loopid= loopS->getID();
            auto loopFun = loopS->getFunction();
            auto loopHeader = loopS->getHeader();

            std::string prefix{"Parallelizer Print:  "};
            for (int i = 1; i < treeLevel; ++i) {
                prefix.append("   ");
            }

            //print the loop
            errs() << prefix << "ID: " << loopid << " (" << treeLevel << ") \n";
            errs() << prefix << " Function: " << loopFun->getName() << "\n";
            errs() << prefix << " Loop: " << *loopHeader->getFirstNonPHI() << "\n";
            errs() << prefix << " Loop nesting level: " << loopS->getNestingLevel() << "\n";

            return false;
        };
        tree->visitPreOrder(printTree);
    }

    //parallelize the loop we selected, from outermost to the inner ones
    bool modified = false;
    std::unordered_map<BasicBlock *, bool> modifiedBBs{};
    for (auto tree : forest->getTrees()) {
        //select the loop to parallelize
        auto loopsToParallelize = this->selectTheOrderOfLoopsToParallelize(master, tree);

        //parallelize the loops
        for (auto loop : loopsToParallelize) {
            //check if we can parallelize the loop
            auto ls = loop->getLoopStructure();
            auto safe = true;
            for (auto BB : ls->getBasicBlocks()) {
                if (modifiedBBs[BB]) {
                    safe = false;
                    break;
                }
            }
            auto loopID = ls->getID();
            if (!safe) {
                errs() << "Parallelizer: Loop " << loopID << "cannot be parallelized because one of its parent has been parallelized already...\n";
                continue;
            }

            //parallelize the current loop
            auto loopIsParallelized = this->parallelizeLoop(loop, master, doall);

            //keep track of the parallelization
            if (loopIsParallelized) {
                errs() << "Parallelizer: Loop " << loopID << " has been parallelized.\n";
                modified = true;
                for (auto bb : ls->getBasicBlocks()) {
                    modifiedBBs[bb] = true;
                }
            }
        }

        //free the memory
        for (auto loop : loopsToParallelize) {
            if (loop) delete loop;
        }

    }

    errs() << "Parallelizer::runOnModule end...\n";
    return modified;
}

bool Parallelizer::parallelizeLoop(LoopDependenceInfo * LDI, Master& master, DOALL& doall) {
    assert(LDI != nullptr);

    //fetch the loop header
    auto loopStructure = LDI->getLoopStructure();
    auto loopHeader = loopStructure->getHeader();
    auto loopPreHeader = loopStructure->getPreHeader();

    //fetch the loop function
    auto loopFunc = loopStructure->getFunction();

    errs() << "ParallelizeLoop...\n";
    errs() << "ParallelizeLoop: Function = " << loopFunc->getName() << "\n";
    errs() << "ParallelizeLoop: Loop " << LDI->getID() << " loopStructureID: " << loopStructure->getID() << " = " << *loopHeader->getFirstNonPHI() << "\n";
    errs() << "ParallelizeLoop: Nesting Level = " << loopStructure->getNestingLevel() << "\n";
    errs() << "Parallelizer: Number of threads to extrac: "  << LDI->getMaxCoreNumber() << "\n";

    //parallelize the loop
    bool codeModified = false;
    if (doall.canBeAppliedToLoop(LDI, master)) {
        errs() << "ParallelizeLoop: DOALL can be applied to loop\n";
        doall.reset();
        codeModified = doall.apply(LDI, master);
    }

    if (!codeModified) {
        errs() << "Parallelizer: Exit(no code midified)\n";
        return false;
    }

    //fetch the enviroment array where the exit block ID has been stored
    Value * envArray = doall.getEnvArray();
    assert(envArray != nullptr);

    //fetch entry and exit point executed by the parallelized loop
    BasicBlock * entryPoint = doall.getLoopEntryPoint();
    BasicBlock * exitPoint = doall.getLoopExitPoint();
    assert(entryPoint != nullptr && exitPoint != nullptr);

    //the loop has been parallelized
    //link the parallelized loop within the original functio that includes the sequentail loop
    auto exitIndex = cast<Value>(ConstantInt::get(master.int64ptr, LDI->loopEnviroment->indexOfExitBlockTaken()));
    auto loopExitBlocks = loopStructure->getLoopExitBasicBlocks();
    master.linkTransformedLoopToOriginalFunction(
        loopFunc->getParent(),
        loopPreHeader,
        entryPoint,
        exitPoint,
        envArray,
        exitIndex,
        loopExitBlocks
    );

    errs() << "Parallelizer: Exit\n";
    return true;
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
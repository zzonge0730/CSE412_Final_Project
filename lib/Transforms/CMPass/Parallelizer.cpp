#include "Parallelizer.h"
#include <iterator>
#include <string>

using namespace llvm;

char Parallelizer::ID = 0;
static RegisterPass<Parallelizer> X("ParallelDOALL", "Find DOALL Parallelism And Parallel it");

Parallelizer::Parallelizer() : ModulePass {ID} {

}

void Parallelizer::getAnalysisUsage(AnalysisUsage &AU) const {
    AU.addRequired<LoopInfo>();
    AU.addRequired<ScalarEvolution>();
    AU.addRequired<PostDominatorTree>(); // 
    AU.addRequired<DominatorTree>();

    AU.addRequired<Master>();
    AU.addRequired<DOALL>();
    AU.setPreservesAll();
}
bool Parallelizer::runOnModule(Module& M) {
    errs() << "Parallelizer::runOnMudule start...\n";

    //get the analysis pass classes we rely on
    Master& master = getAnalysis<Master>();
    auto hot = master.getHot();
    //construct doall object
    //DOALL doall{M};
    DOALL& doall = getAnalysis<DOALL>();

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
        auto loopsToParallelize = this->selectTheOrderOfLoopsToParallelize(master, hot, tree); // TODO: ---zyy may not work

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


std::vector<LoopDependenceInfo *> Parallelizer::selectTheOrderOfLoopsToParallelize(
Master& master, Hot * hot, StayConnectedNestedLoopForestNode * tree
) {

    std::vector<LoopDependenceInfo *> selectedLoops{};


    /*
    * Compute the amount of time that can be saved by a parallelization technique per loop.
    */
    std::map<LoopDependenceInfo *, uint64_t> timeSavedLoops;
    auto selector = [&master, &timeSavedLoops, hot](StayConnectedNestedLoopForestNode *n, uint32_t treeLevel) -> bool {

      /*
       * Fetch the loop.
       */
      auto ls = n->getLoop();
      auto ldi = master.getLoop(ls);

      /*
       * Fetch the set of sequential SCCs.
       */
      auto sequentialSCCs = DOALL::getSCCsThatBlockDOALLToBeApplicable(ldi, master);

      /*
       * Find the biggest sequential SCC.
       */
      uint64_t biggestSCCTime = 0;
      for (auto sequentialSCC : sequentialSCCs){

        /*
         * Fetch the time spent in the current SCC.
         */
        auto sequentialSCCTime = hot->getTotalInstructions(sequentialSCC);

        /*
         * Compute the biggest SCC.
         */
        if (sequentialSCCTime > biggestSCCTime){
          biggestSCCTime = sequentialSCCTime;
        }
      }

      /*
       * Compute the maximum amount of time saved by any parallelization technique.
       */
      timeSavedLoops[ldi] = 0;
      if (hot->getIterations(ls) > 0){
        auto instsPerIteration = hot->getAverageTotalInstructionsPerIteration(ls);
        auto instsInBiggestSCCPerIteration = ((double)biggestSCCTime) / ((double)hot->getIterations(ls));
        assert(instsInBiggestSCCPerIteration <= instsPerIteration);
        auto timeSavedPerIteration = (double)(instsPerIteration - instsInBiggestSCCPerIteration);
        auto timeSaved = timeSavedPerIteration * hot->getIterations(ls);
        timeSavedLoops[ldi] = (uint64_t)timeSaved;
      }

      return false;
    };
    tree->visitPreOrder(selector);

    /*
     * Filter out loops that should not be parallelized.
     */
    for (auto loopPair : timeSavedLoops){

      /*
       * Fetch the loop.
       */
      auto ldi = loopPair.first;

      /*
       * Compute the total amount of time saved by parallelizing this loop.
       */
      auto savedTimeTotal = ((double)timeSavedLoops[ldi]) / ((double) hot->getTotalInstructions());
      savedTimeTotal *= 100;
      
      /*
       * Check if the time saved is enough.
       */
      if (savedTimeTotal < 2){
        continue ;
      }

      /*
       * The loop is worth parallelizing it.
       *
       * Add it.
       */
      selectedLoops.push_back(ldi);
    }

    /*
     * Sort the loops depending on the amount of time that can be saved by a parallelization technique.
     */
    auto compareOperator = [&timeSavedLoops](LoopDependenceInfo *l1, LoopDependenceInfo *l2){
      auto s1 = timeSavedLoops[l1];
      auto s2 = timeSavedLoops[l2];
      if (s1 != s2){
        return s1 > s2;
      }

      /*
       * The loops have the same saved time.
       * Sort them by nesting level.
       */
      auto l1LS = l1->getLoopStructure();
      auto l2LS = l2->getLoopStructure();
      return l1LS->getNestingLevel() < l2LS->getNestingLevel();
    };
    std::sort(selectedLoops.begin(), selectedLoops.end(), compareOperator);

    /*
     * Print the order and the savings.
     */
      errs() << "Parallelizer: LoopSelector: Start\n";
      errs() << "Parallelizer: LoopSelector:   Order of loops and their maximum savings\n";
      for (auto l : selectedLoops){

        /*
         * Fetch the loop information.
         */
        auto ls = l->getLoopStructure();
        auto loopHeader = ls->getHeader();
        auto loopFunction = ls->getFunction();

        /*
         * Compute the savings
         */
        auto savedTimeRelative = ((double)timeSavedLoops[l]) / ((double) hot->getTotalInstructions(ls));
        auto savedTimeTotal = ((double)timeSavedLoops[l]) / ((double) hot->getTotalInstructions());
        savedTimeRelative *= 100;
        savedTimeTotal *= 100;

        /*
         * Print
         */
        errs() << "Parallelizer: LoopSelector:    Loop " << l->getID() << " " << ls->getID() << "\n";
        errs() << "Parallelizer: LoopSelector:      Function: \"" << loopFunction->getName() << "\"\n";
        errs() << "Parallelizer: LoopSelector:      Loop nesting level: " << ls->getNestingLevel() << "\n";
        errs() << "Parallelizer: LoopSelector:      \"" << *loopHeader->getFirstNonPHI() << "\"\n";
        errs() << "Parallelizer: LoopSelector:      Whole-program savings = " << savedTimeTotal << "%\n";
        errs() << "Parallelizer: LoopSelector:      Loop savings = " << savedTimeRelative << "%)\n";
      }
      errs() << "Parallelizer: LoopSelector: End\n";

    return selectedLoops;
}
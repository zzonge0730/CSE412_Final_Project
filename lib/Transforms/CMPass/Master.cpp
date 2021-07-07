#include "Master.h"
#include "llvm/Analysis/LoopInfoImpl.h"
#include "llvm/Analysis/LoopInfo.h"

char Master::ID = 0;

static RegisterPass<Master> X("Master", "Master all info which is needed");
Master::Master() : ModulePass{ID} {
    this->minHot = 0.0;
    this->program = nullptr;
    this->programDependenceGraph = nullptr;
}
Master::~Master() {
    if (this->hot) {
        delete this->hot;
    }
}

bool Master::doInitialization (Module& M) {
    this->program = &M;

    int1ptr = IntegerType::get(M.getContext(), 1);
    int8ptr = IntegerType::get(M.getContext(), 8);
    int16ptr = IntegerType::get(M.getContext(), 16);
    int32ptr = IntegerType::get(M.getContext(), 32);
    int64ptr = IntegerType::get(M.getContext(), 64);

    this->hot = new Hot();
    this->hot->computeProgramInvocations(M);

    return false;
}

void Master::getAnalysisUsage(AnalysisUsage &AU) const {
    AU.addRequired<CallGraph>();
    AU.addRequired<DominatorTree>();
    AU.addRequired<PostDominatorTree>();
    AU.addRequired<PDGAnalysis>();
    AU.addRequired<ScalarEvolution>();
    AU.addRequired<LoopInfo>();

    AU.setPreservesAll();    
}
bool Master::runOnModule(Module& M) {
    this->pdgAnalysis = &getAnalysis<PDGAnalysis>();
    return false;
}

std::vector<LoopDependenceInfo *> * Master::getLoops(void) {
    return this->getLoops(this->minHot);
}
std::vector<LoopDependenceInfo *> * Master::getLoops(double minHot) {
//TODO:
}
std::vector<LoopDependenceInfo *> * Master::getLoops(Function * fun) {
    return this->getLoops(fun, this->minHot);
}
std::vector<LoopDependenceInfo *> * Master::getLoops(Function * fun, double minHot) {
//TODO:
}

std::vector<LoopStructure *> * Master::getLoopStructures(void) {
    return this->getLoopStructures(this->minHot);
}
std::vector<LoopStructure *> * Master::getLoopStructures(double minHot) {
    auto allLoops = new std::vector<LoopStructure *> ();

    auto mainFunction = this->getEntryFunction();
    assert(mainFunction != nullptr);
    auto functions = this->getModuleFunctionsReachableFrom(this->program, mainFunction);

    //check if we should filter out loops
    auto filterloops = this->checkToGetLoopFilteringInfo();

    //append loops of each function
    auto nextLoopIndex = 0;
    for (auto func : *functions) {
        if (func->empty()) continue;

        //at this time 2021.7.5 we assume that each function is hot
        auto& LI = getAnalysis<LoopInfo>(*func);
        if (std::distance(LI.begin(), LI.end()) == 0) continue;

        //fetch the function dependence graph
        auto funDG = this->getFunctionDependenceGraph(func);

        //fetch the post dominators and scalar evolutions
        auto DS = this->getDominators(func);
        auto& SE = getAnalysis<ScalarEvolution>(*func);

        //fetch all loops of the current function
        // auto loops = LI.getLoopsInPreorder();
        auto loops = LI.getLoopsInfoBaseLoopsInPreorder();

        for (auto loop : loops) {
            auto currentLoopIndex = nextLoopIndex++;
            auto loopStructure = new LoopStructure(loop);
            auto loopHeader = loopStructure->getHeader();
            //at this time 2021.7.5, we assume that each loop is hot
            if (!filterloops) {
                allLoops->push_back(loopStructure);
                this->loopHeaderToLoopIndexMap.insert(std::make_pair(loopHeader, currentLoopIndex));
                continue;
            }

            //we need to filter loops
            // auto maximumNumberOfCoresForTheParallelization = this->loopThreads[currentLoopIndex];
            // if (maximumNumberOfCoresForTheParallelization <= 1){
            //     delete loopStructure;
            //     continue ;
            // }

            // if (currentLoopIndex >= loopThreads.size()){
            //     errs() << "ERROR: the 'INDEX_FILE' file isn't correct. There are more than " << loopThreads.size() << " loops available in the program\n";
            //     abort();
            // }
            // allLoops->push_back(loopStructure);
            // this->loopHeaderToLoopIndexMap.insert(std::make_pair(loopHeader, currentLoopIndex));

        }
    }
    delete functions;
    return allLoops;
}
std::vector<LoopStructure *> * Master::getLoopStructures(Function * fun) {
    return this->getLoopStructures(fun, this->minHot);
}
std::vector<LoopStructure *> * Master::getLoopStructures(Function * fun, double minHot) {
    //check if the function has loops
    auto allLoops = new std::vector<LoopStructure *>();
    //---zyy, may be should check fun is a declration or not
    auto& LI = getAnalysis<LoopInfo>(*fun);

    if (std::distance(LI.begin(), LI.end()) == 0) {
        return allLoops;
    }

    //fetch all loops of the current function
    // auto loops = LI.getLoopsInPreorder();
    auto loops = LI.getLoopsInfoBaseLoopsInPreorder();
    for (auto loop : loops) {
        //check if the loop is hot enough
        auto loopStructure = new LoopStructure(loop);
        //at this time 2021.7.5 , we assume that each loop is a hot loop. Optimize later
        allLoops->push_back(loopStructure);
    }

    return allLoops;
}

LoopDependenceInfo * Master::getLoop(LoopStructure * loop) {
//TODO:
}

StayConnectedNestedLoopForest * Master::organizeLoopsInTheirNestingForest(
    std::vector<LoopStructure *> const & loops
) {
    //compute the dominators
    std::unordered_map<Function *, DominatorSummary *> doms{};
    for (auto loop : loops) {
        auto fun = loop->getFunction();
        if (doms.find(fun) != doms.end() ) {
            continue;
        }
        doms[fun] = this->getDominators(fun);
    }

    //compute the forest
    auto nestedLooForest = new StayConnectedNestedLoopForest(loops, doms);

    //free the memory
    for (auto pair : doms) {
        delete pair.second;
    }

    return nestedLooForest;
}

void Master::linkTransformedLoopToOriginalFunction(
    Module * M,
    BasicBlock * originalPreHeader,
    BasicBlock * startOfParallelizeLoopInOriginalFunc,
    BasicBlock * endOfParallelizedLoopInOriginalFunc,
    Value * envArray,
    Value * envIndexForExitVariable,
    std::vector<BasicBlock*>& loopExitBlocks
) {

    //create the global variable for the parallelized loop
    auto globalBool = new GlobalVariable(*M, int32ptr, /*isConstant*/  false, GlobalValue::ExternalLinkage, Constant::getNullValue(int32ptr));
    auto const0 = ConstantInt::get(int32ptr, 0);
    auto const1 = ConstantInt::get(int32ptr, 1);

    //fetch the terminator of the prehead
    auto originalTerminator = originalPreHeader->getTerminator();

    //fetch the header of the original loop
    auto originalHeader = originalTerminator->getSuccessor(0);

    //check if another invocation of the loop is running in parallel
    IRBuilder<> loopSwitchBuilder(originalTerminator);
    auto globalLoad = loopSwitchBuilder.CreateLoad(globalBool);
    auto compareInstruction = loopSwitchBuilder.CreateICmpEQ(globalLoad, const0);
    loopSwitchBuilder.CreateCondBr(
        compareInstruction,
        startOfParallelizeLoopInOriginalFunc,
        originalHeader
    );
    originalTerminator->eraseFromParent();

    IRBuilder<> endBuilder(endOfParallelizedLoopInOriginalFunc);
    //load exit block environment variable and branch to the correct loop exit block
    if (loopExitBlocks.size() == 1) {
        endBuilder.CreateBr(loopExitBlocks[0]);
    } else {
        //compute how many values can fit in a cache line
        auto valuesInCacheLine = 64 / sizeof(int64_t); // getCachedLineBytes()
        auto exitEnvPtr = endBuilder.CreateInBoundsGEP(
            envArray, ArrayRef<Value*>({
                cast<Value>(ConstantInt::get(int64ptr, 0)), 
                endBuilder.CreateMul(envIndexForExitVariable, ConstantInt::get(int64ptr, valuesInCacheLine))
            })
        );
        auto exitEnvCast = endBuilder.CreateIntCast(endBuilder.CreateLoad(exitEnvPtr), int32ptr, /*isSigned*/ false);
        auto exitSwitch = endBuilder.CreateSwitch(exitEnvCast, loopExitBlocks[0]);
        for (int i = 1; i < loopExitBlocks.size(); i++) {
            exitSwitch->addCase(ConstantInt::get(int32ptr, i), loopExitBlocks[i]);
        }
    }

    //LCSSA constants need to be replicated for parallelized code path
    for (auto bb : loopExitBlocks) {
        for (auto& I : *bb) {
            if (auto phi = dyn_cast<PHINode>(&I)) {
                auto bbIndex = phi->getBasicBlockIndex(originalHeader);
                if (bbIndex == -1) {
                    continue;
                }
                auto val = phi->getIncomingValue(bbIndex);
                if (isa<Constant>(val)) {
                    phi->addIncoming(val, endOfParallelizedLoopInOriginalFunc);
                }
                continue;
            }
            break;
        }
    }

    //set/reset global variable so only one invocation of the loop is run in parallel at a time
    if (startOfParallelizeLoopInOriginalFunc == endOfParallelizedLoopInOriginalFunc) {
        endBuilder.SetInsertPoint(&*endOfParallelizedLoopInOriginalFunc->begin());
        endBuilder.CreateStore(const1, globalBool);
    } else {
        IRBuilder<> startBuilder(&*startOfParallelizeLoopInOriginalFunc->begin());
        startBuilder.CreateStore(const1, globalBool);
    }
    endBuilder.SetInsertPoint(endOfParallelizedLoopInOriginalFunc->getTerminator());
    endBuilder.CreateStore(const0, globalBool);

}

Module * Master::getProgram(void) const {
    return this->program;
}

DominatorSummary * Master::getDominators(Function * f) {
    auto& DT = getAnalysis<DominatorTree>(*f);
    auto& PDT = getAnalysis<PostDominatorTree>(*f);

    auto ds = new DominatorSummary(DT, PDT);
    return ds;
}

Function * Master::getEntryFunction(void) const {
    return this->program->getFunction("softboundcets_pseudo_main");//"main"
}

std::vector<Function*> * Master::getModuleFunctionsReachableFrom(
        Module * M, Function * startingPoint
) {
    auto functions = new std::vector<Function*>();
    auto &callGraph = getAnalysis<CallGraph>();

    // Compute the set of functions reachable from the starting point.
    std::set<Function *> funcSet ;
    std::queue<Function *> funcToTraverse;
    funcToTraverse.push(startingPoint);
    while (!funcToTraverse.empty()) {
        auto func = funcToTraverse.front();
        funcToTraverse.pop();
        if (funcSet.find(func) != funcSet.end()) continue;
        funcSet.insert(func);

        auto funcCGNode = callGraph[func];
        for (auto &callRecord : make_range(funcCGNode->begin(), funcCGNode->end())) {
            auto F = callRecord.second->getFunction();
            if (!F) {
                continue ;
            }
            if (F->empty()) {
                continue;
            }
            funcToTraverse.push(F);
        }
    }

    for (auto &f : *M){
        if (funcSet.find(&f) == funcSet.end()){
            continue ;
        }
        functions->push_back(&f);
    }

    auto compareFunctions = [] (Function *f1, Function *f2) -> bool {
        auto f1Name = f1->getName();
        auto f2Name = f2->getName();
        return (f1Name.compare(f2Name) < 0) ? true : false;
    };

    std::sort(functions->begin(), functions->end(), compareFunctions);

    return functions;
} 

bool Master::checkToGetLoopFilteringInfo(void) {
    //at this time, 2021.7.5, we do not filter any loops
    return false;
}

PDG * Master::getFunctionDependenceGraph(Function * f) {

}
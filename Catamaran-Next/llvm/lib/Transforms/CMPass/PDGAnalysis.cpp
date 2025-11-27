#include "PDGAnalysis.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/ADT/iterator_range.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/BitVector.h"
#include "llvm/Analysis/LoopInfo.h"
// LLVM 14: Dominators.h와 PostDominators.h가 llvm/IR로 이동
#include "llvm/IR/Dominators.h"
// LLVM 14: AliasAnalysis는 AAResults로 변경됨
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Analysis/MemoryLocation.h"
// LLVM 14: cl::opt를 사용하지 않으므로 CommandLine.h 불필요
// #include "llvm/Support/CommandLine.h"
#include "llvm/Analysis/CallGraph.h"
#include "llvm/IR/Value.h"

#include <utility>
#include <string>
#include <unordered_set>

using namespace llvm;
// LLVM 14: ModRefInfo는 llvm namespace에 있음
using ModRefInfo = llvm::ModRefInfo;

// char PDGAnalysis::ID = 0;

// LLVM 14: cl::opt는 전역 생성자에서 충돌을 일으킬 수 있으므로 비활성화
// TODO: 새 PassManager의 PassBuilder 옵션으로 전환 필요
static bool PDGDump = false; // 임시로 false로 설정
static bool PDGRA = false; // 임시로 false로 설정

PDGAnalysis::PDGAnalysis() : 
    M{nullptr},
    MAM{nullptr},
    programDependenceGraph{nullptr},
    dfAna{},
    enableReachAnalysis{false},
    dumpPDG{false}
    /*printer{}*/ {
    return;
}

bool PDGAnalysis::run(Module &M, ModuleAnalysisManager &AM) {
    //check if the pass has already run
    if (this->programDependenceGraph != nullptr || this->M != nullptr) {
        return false;
    }

    //store global information
    this->M = &M;
    this->MAM = &AM; // Store AnalysisManager

    // Initialization logic moved here
    this->dumpPDG = PDGDump;
    this->enableReachAnalysis = PDGRA;

    //function reachability analysis
    //TODO: need to integration with SVF
    //identifyFunctionsThatInvokeUnhandledLibrary(M);

    //construct PDG
    
    auto currentPDG = this->getPDG();
    // errs() << "----52----\n";
    //check if we should dump the PDG
    // if (this->dumpPDG) {
    //     //dump the PDG
    //     auto localPDGPrinter = new PDGPrinter();
    //     auto &callgraph = getAnalysis<CallGraph>();
    //     auto getLoopInfo = [this](Function *f) -> LoopInfo& {
    //         auto &LI = getAnalysis<LoopInfo>(*f);
    //     };
    //     localPDGPrinter->printPDG(M , callgraph, currentPDG, getLoopInfo);
    // }
    if (this->dumpPDG) {
        //right now just print some information of PDG
        errs() << "###Print the PDG ###\n";
        std::string str;
        raw_string_ostream ros(str);
        currentPDG->print(ros);
        ros.flush();
        errs() << "---dumpPDG--- \n" << str << "\n";
    }

    return false;
}

// Legacy methods removed: doInitialization, getAnalysisUsage

void PDGAnalysis::releaseMemory() {
    if (this->programDependenceGraph)
        delete this->programDependenceGraph;
    this->programDependenceGraph = nullptr;
    
    for (auto functionFDGPair : this->functionToFDGMap) {
        auto fdg = functionFDGPair.second;
        delete fdg;
    }
    this->functionToFDGMap.clear();

}

PDG * PDGAnalysis::getFunctionPDG(Function &F) {
    //if the module PDG has been built, take the subcet related to the input function
    //else construct the function DG
    PDG * pdg = nullptr;
    if (this->programDependenceGraph) {
        //check and get/update the function cache
        if (this->functionToFDGMap.find(&F) == this->functionToFDGMap.end()) {
            pdg = this->programDependenceGraph->createFunctionSubgraph(F);
            for (auto edge : pdg->getEdges()) {
                assert(!edge->isLoopCarriedDependence() && "Flag was already set");
            }
            this->functionToFDGMap.insert(std::make_pair(&F, pdg));
        } else {
            pdg = this->functionToFDGMap.at(&F);
            for (auto edge : pdg->getEdges()) {
                assert(!edge->isLoopCarriedDependence() && "Flag was already set");
            }
        }
    } else {
        //check and get/update the function cache
        if (this->functionToFDGMap.find(&F) == this->functionToFDGMap.end()) {
            pdg = constructFunctionDGFromAnalysis(F);
            for (auto edge : pdg->getEdges()) {
                assert(!edge->isLoopCarriedDependence() && "Flag was already set");
            }
            this->functionToFDGMap.insert(std::make_pair(&F, pdg));
        } else {
            pdg = this->functionToFDGMap.at(&F);
            for (auto edge : pdg->getEdges()) {
                assert(!edge->isLoopCarriedDependence() && "Flag was already set");
            }
        }
    }
    return pdg;
}

// void PDGAnalysis::printFunctionReachabilityResult() {
//     //print internal and unhandled external functions
// }

PDG * PDGAnalysis::getPDG(void) {
    //check if we have alread built the PDG
    if (this->programDependenceGraph) {
        // errs() << "---158---\n";
        return this->programDependenceGraph;
    }

    //construct the PDG
    //compute the PDG using the dependence analysis
    // errs() << "---164---\n";
    this->programDependenceGraph = constructPDGFromAnalysis(*this->M);

    return this->programDependenceGraph;
}

PDG * PDGAnalysis::constructPDGFromAnalysis(Module &M) {
    // errs() << "---171---\n";
    auto pdg = new PDG(M);
    // errs() << "---173---\n";
    constructEdgesFromUseDefs(pdg);
    // errs() << "^^^construct UseDef^^^\n";
    constructEdgesFromAliases(pdg, M);
    // errs() << "^^^construct Alias^^^\n";
    constructEdgesFromControl(pdg, M);
    // errs() << "^^^construct Control^^^\n";
    //constructEdgesFromSequence(pdg, M);

    //trimDGUsingCustomAliasAnalysis(pdg);
    return pdg;
}

PDG * PDGAnalysis::constructFunctionDGFromAnalysis(Function &F) {
    auto pdg = new PDG(F);
    constructEdgesFromUseDefs(pdg);
    constructEdgesFromAliasesForFunction(pdg, F);
    constructEdgesFromControlForFunction(pdg, F);
    //constructEdgesFromSequenceForFunction(pdg, F);
    return pdg;
}

// void PDGAnalysis::trimDGUsingCustomAliasAnalysis(PDG *pdg) {

// }

// void PDGAnalysis::collectCGUnderFunctionMain(Module &M) {

// }

void PDGAnalysis::constructEdgesFromUseDefs(PDG *pdg) {
    //add dependences due to variables
    std::unordered_set<DGNode<Value> *>::iterator node_iterator;

    //for (auto node : llvm::make_range(pdg->begin_nodes(), pdg->end_nodes())) {
    for (node_iterator = pdg->begin_nodes(); node_iterator != pdg->end_nodes(); ++node_iterator) {
        
        //check the current definition has uses
        //if it doesn't, then there is no varaible dependence
        
        Value * pdgValue = (*node_iterator)->getT();
        if (pdgValue == nullptr) {
            continue;
        }
        
        if (!isa<Instruction>(pdgValue)) continue;
        
        // Use use_empty() instead of getNumUses() to avoid segfault
        // getNumUses() can segfault if the Value has been invalidated
        if (pdgValue->use_empty()) continue;

        //the current definition has uses
        //add the uses
        //for (auto& U : pdgValue->uses()) {
        for (Value::use_iterator U = pdgValue->use_begin(); U != pdgValue->use_end(); ++U) {
            //Instruction *User = dyn_cast<Instruction>(*U);
            if (isa<Instruction>(*U) || isa<Argument>(*U)) {
                // errs () << "Inst: " << *dyn_cast<Instruction>(*U) << "\n";
                auto edge = pdg->addEdge(pdgValue, *U); //from: pdgValue, to:user, pdgValue - write(def),  user - read(use)
                edge->setMemMustType(false, true, DG_DATA_RAW);
            }
        }
    }

}

void PDGAnalysis::constructEdgesFromAliases(PDG *pdg, Module &M) {
    //use alias analysis on stores, loads, and function calls to construct PDG edges
    for (auto &F : M) {
        //check if the function has a body
        if (F.empty()) continue;
        // LLVM 14: StringRef → string 변환
        if (movecLibFunction.count(F.getName().str())) continue;
        if (softboundcetsLibFunction.count(F.getName().str())) continue;
        // errs() << "--PDGAnalysis-222: " << F.getName() << "\n";
        //add the edges to the PDG
        constructEdgesFromAliasesForFunction(pdg, F);
    }
}

void PDGAnalysis::constructEdgesFromAliasesForFunction(PDG *pdg, Function &F) {
    //fetch the alias analysis
    // LLVM 17: ModuleAnalysisManager를 통해 FunctionAnalysisManager -> AAManager -> AAResults 얻기
    FunctionAnalysisManager &FAM = this->MAM->getResult<FunctionAnalysisManagerModuleProxy>(*this->M).getManager();
    AAResults &AA = FAM.getResult<AAManager>(F);
    
    //run the reachable analysis
    auto onlyMemoryInstructionFilter = [](Instruction * i) -> bool {
        if (isa<LoadInst>(i)) return true;
        if (isa<StoreInst>(i)) return true;
        if (isa<CallInst>(i)) return true;
        if (isa<InvokeInst>(i)) return true;

        return false;
    };
    //errs() << "---PDGAnalysis--242\n";
    auto dfRes = this->enableReachAnalysis ? this->dfAna.runReachableAnalysis(&F, onlyMemoryInstructionFilter) : this->dfAna.getFullSets(&F);
    //errs() << "---PDGAnalysis--244\n";
    for (auto &BB : F) {
        for (auto &Inst : BB) {
            if (auto store = dyn_cast<StoreInst>(&Inst)) {
                //errs() << "---PDGAnalysis--248\n";
                iteratorInstForStore(pdg, F, AA, dfRes, store);
                //errs() << "---PDGAnalysis--250\n";
            } else if (auto load = dyn_cast<LoadInst>(&Inst)) {
                //errs() << "---PDGAnalysis--252\n";
                iteratorInstForLoad(pdg, F, AA, dfRes, load);
                //errs() << "---PDGAnalysis--254\n";
            } else if (auto call = dyn_cast<CallInst>(&Inst)) {
                //errs() << "---PDGAnalysis--256\n";
                iteratorInstForCall(pdg, F, AA, dfRes, call);
                //errs() << "---PDGAnalysis--258\n";
            }
        }
    }
    //errs() << "---PDGAnalysis--262\n";
    //free memory
    delete dfRes;
}

void PDGAnalysis::constructEdgesFromControl(PDG *pdg, Module &M) {
    assert(pdg != nullptr);

    for (auto &F : M) {
        //fetch the next function with a body
        if (F.empty()) continue;
        // LLVM 14: StringRef → string 변환
        if (movecLibFunction.count(F.getName().str())) continue;
        if (softboundcetsLibFunction.count(F.getName().str())) continue;
        //errs() << "--PDGAnalysis-277: " << F.getName() << "\n";
        //compute the control dependences of the function based on its post-dominator tree
        this->constructEdgesFromControlForFunction(pdg, F);
    }
}

void PDGAnalysis::constructEdgesFromControlForFunction(PDG *pdg, Function &F) {
    assert(pdg != nullptr);
    /*
    * There is a control dependence from a basic block A to a basic block B iff
    * 1) there is E such that E is a successor of A, and 
    * 2) B post-dominates E, and
    * 3) B doesn't strictly post-dominate A
    */

    //errs() << "---PDGAnalysis--285\n";
    //fetch the post-dominator tree of the function
    // LLVM 17: ModuleAnalysisManager -> FunctionAnalysisManager -> DominatorTreeAnalysis
    FunctionAnalysisManager &FAM = this->MAM->getResult<FunctionAnalysisManagerModuleProxy>(*this->M).getManager();
    DominatorTree * DT = &FAM.getResult<DominatorTreeAnalysis>(F);
    
    //errs() << "---PDGAnalysis---288\n";
    //auto &postDomTree = PDT.getPostDomTree();
    //errs() << "---PDGAnalysis--290\n";
    for (auto &B : F) {
        //fetch the basic blocks post-dominated by the current one.
        SmallVector<BasicBlock *, 10> dominatedBBs;
        //postDomTree.getDescendants(&B, dominatedBBs);
        //errs() << "---PDGAnalysis-300-1\n";
        DT->getDescendants(&B, dominatedBBs);
        //errs() << "---PDGAnalysis--293\n";
        //for each basic block that B post dominates,  check if B doesn't strictly post dominate its predecessor
        //if it does not, then there is a control dependence from the predecessor to B
        //errs() << "dominatedBBs size: " << dominatedBBs.size() << "\n";
        for (auto dominatedBB : dominatedBBs) {
            //errs() << "---PDGAnalysis---306\n";
            for (auto predBB : make_range(pred_begin(dominatedBB), pred_end(dominatedBB))) {
                //fecth the terminator of the predecessor
                auto controlTerminator = predBB->getTerminator();
                //errs() << "---PDGAnalysis--300\n";
                //check if the predecessor terminator is a conditional branch.
                //This is necessary to avoid adding incorrect control dependences 
                //between basic blocks of a loop that has no exit blocks
                //For example:
                //predBB:
                // branch B
                //B:
                // i
                // branch %B
                //in this case, if we don't check that the terminator of predBB is a conditional branch
                //we would add a control dependence from branch %B to i
                if (controlTerminator->getNumSuccessors() == 1) continue;
                //errs() << "---PDGAnalysis--313\n";
                //check if B strictly post-dominates predBB
                //if (postDomTree.properlyDominates(&B, predBB)) continue;
                /*
                * B strictly post-dominates predBB.
                * Therefore, there is no control dependence from predBB to B
                */
                if (DT->properlyDominates(&B, predBB)) continue;
                //errs() << "---PDGAnalysis--316\n";
                //There is a control dependence from predBB to B
                //add the control dependences
                for (auto &I : B) {
                    auto edge = pdg->addEdge((Value*)controlTerminator, (Value*)&I);
                    //errs() << "---PDGAnalysis--330\n";
                    edge->setControl(true);
                }
                //errs() << "---PDGAnalysis-333\n";
            }
            //errs() << "---PDGAnalysis-335\n";
        }
        //errs() << "---PDGAnalysis-339\n";
    }
    //errs() << "---PDGAnalysis--325\n";
    auto getControlProducers = [&](Value * V) -> std::unordered_set<Value *> {
        std::unordered_set<Value *> controlProducers;
        auto node = pdg->fetchNode(V);
        for (auto edge : node->getIncomingEdges()) {
            if (!edge->isControlDependence()) continue;
            auto controlProducer = edge->getOutgoingT();
            controlProducers.insert(controlProducer);
        }
        return controlProducers;
    };

    //for PHI nodes with incoming values that do not reside in their respective incoming block,
    //add control edges on the incoming block's terminator to he PHI
    for (auto &B : F) {
        for (auto &phi : B.phis()) {
            //locate control producers of incoming blocks to PHIs
            //where the incoming value doesn't reside in incoming block
            std::unordered_set<Value *> controlProducers;
            //errs() << "---PDGAnalysis--344\n";
            for (auto i = 0; i < phi.getNumIncomingValues(); i++) {
                auto incomingValue = phi.getIncomingValue(i);
                if (!incomingValue) continue;

                auto incomingInst = dyn_cast<Instruction>(incomingValue);
                auto incomingBlock = phi.getIncomingBlock(i);
                if (incomingInst && incomingInst->getParent() == incomingBlock) continue;

                auto terminator = incomingBlock->getTerminator();
                auto terminatorControlProducers = getControlProducers(terminator);
                controlProducers.insert(terminatorControlProducers.begin(), terminatorControlProducers.end());

            }
            if (controlProducers.size() == 0) continue;
            //errs() << "---PDGAnalysis--359\n";
            //determine which of these control producers do not have a control edge to the PHI already
            //add a control edge from those producers to the PHI
            std::unordered_set<Value *> currentControlProducersOnPHI = getControlProducers(&phi);
            for (auto producer : controlProducers) {
                if (currentControlProducersOnPHI.find(producer) != currentControlProducersOnPHI.end()) continue;

                auto edge = pdg->addEdge(producer, &phi);
                edge->setControl(true);
            }
        }
    }
}

// void PDGAnalysis::constructEdgesFromSequence(PDG *pdg, Module &M) {
//     assert(pdg != nullptr);

//     for (auto &F : M) {
//         //fetch the next function with a body
//         if (F.empty()) continue;

//         //compute the sequence dependences of the function based on its loc
//         this->constructEdgesFromSequenceForFunction(pdg, F);
//     }
// }

// void PDGAnalysis::constructEdgesFromSequenceForFunction(PDG *pdg, Function &F) {
//     assert(pdg != nullptr);

//     for (BasicBlock &BB : F) {

//         for (Instruction &I : BB) {
//             auto edge = pdg->addEdge();
//             edge->setSequence(true);
//         }
//     }

// }

PDGAnalysis::~PDGAnalysis() {
    if (this->programDependenceGraph)
        delete this->programDependenceGraph;

    for (auto functionFDGPair : this->functionToFDGMap) {
        auto fdg = functionFDGPair.second;
        delete fdg;
    }
    this->functionToFDGMap.clear();
}


void PDGAnalysis::iteratorInstForStore(PDG *pdg, Function &F, AAResults &AA, DataFlowResult * dfRes, StoreInst * store) {
    for (auto I : dfRes->OUT(store)) {
        //check stores
        if (auto otherStore = dyn_cast<StoreInst>(I)) {
            if (store != otherStore) {
                addEdgeFromMemoryAlias<StoreInst, StoreInst>(pdg, F, AA, store, otherStore, DG_DATA_WAW);
            }
            continue;
        }
        //check loads
        if (auto load = dyn_cast<LoadInst>(I)) {
            addEdgeFromMemoryAlias<StoreInst, LoadInst>(pdg, F, AA, store, load, DG_DATA_RAW);
        }

        //check call
        if (auto call = dyn_cast<CallInst>(I)) {
            if (!this->isActualCode(call)) {
                continue;
            }
            addEdgeFromFunctionModRef(pdg, F, AA, call, store, false);
            continue;
        }
    }
}

void PDGAnalysis::iteratorInstForLoad(PDG *pdg, Function &F, AAResults &AA, DataFlowResult * dfRes, LoadInst * load) {
    for (auto I : dfRes->OUT(load)) {
        //check stores
        if (auto store = dyn_cast<StoreInst>(I)) {
            addEdgeFromMemoryAlias<LoadInst, StoreInst>(pdg, F, AA, load, store, DG_DATA_WAR);
            continue;
        }

        //check call
        if (auto call = dyn_cast<CallInst>(I)) {
            if (!this->isActualCode(call)) {
                continue;
            }
            addEdgeFromFunctionModRef(pdg, F, AA, call, load, false);
            continue;
        }
    }
}
void PDGAnalysis::iteratorInstForCall(PDG *pdg, Function &F, AAResults &AA, DataFlowResult * dfRes, CallInst * call) {
    //check if the call instruction is not actual code
    if (!this->isActualCode(call)) return;

    //identify all dependences with @call
    for (auto I : dfRes->OUT(call)) {
        // errs() << "iteratorInstForCall-475, Inst: " << *I << "\n";
        // if (I == nullptr || I == NULL) errs() << "iteratorInstForCall I is null\n";
        //check store
        if (auto store = dyn_cast<StoreInst>(I)) {
            addEdgeFromFunctionModRef(pdg, F, AA, call, store, true);
            continue;
        }
        //errs() << "iteratorInstForCall-481\n";
        //check load
        if (auto load = dyn_cast<LoadInst>(I)) {
            // errs() << "504: call: " << *call << ", load: " << *load << "\n";
            addEdgeFromFunctionModRef(pdg, F, AA, call, load, true);
            continue;
        }
        //errs() << "iteratorInstForCall-487\n";
        //checkcalls
        if (auto othercall = dyn_cast<CallInst>(I)) {
            if (!this->isActualCode(othercall)) continue;
            addEdgeFromFunctionModRef(pdg, F, AA, call, othercall);
            continue;
        }
    }
}

bool PDGAnalysis::isActualCode(CallInst *call) {
    //fetch the callee
    auto callee = call->getCalledFunction();
    if (callee == nullptr) return true;

    if (!callee->isIntrinsic()) return true;

    return false;//!zyy
}

void PDGAnalysis::addEdgeFromFunctionModRef(PDG * pdg, Function &F, AAResults &AA, CallInst *call, StoreInst *store, bool addEdgeFromCall) {
    BitVector bv(3, false);
    bool makeRefEdge = false;
    bool makeModEdge = false;

    //we cannot have memory dependences from a call to a deallocator(e.g., free).
    if (isDeallocator(call)) return;

    //query the llvm alias analysis
    // LLVM 14: AAResults API 변경 - MemoryLocation 사용
    auto Loc = MemoryLocation::get(store);
    auto ModRef = AA.getModRefInfo(call, Loc);
    switch(ModRef) {
        case ModRefInfo::NoModRef:
            return;
        case ModRefInfo::Ref:
            bv[0] = true;
            break;
        case ModRefInfo::Mod:
            bv[1] = true;
            break;
        case ModRefInfo::ModRef:
            bv[2] = true;
            break;
    }

    //TODO: add SVF alias analysis
    // if (this->enableSVF) {

    // }

    //NoModRef when one says Mod and another says Ref
    if (bv[0] & bv[1]){
        return;
    }
    if (bv[0]) {
        makeRefEdge = true;
    } else if (bv[1]) {
        makeModEdge = true;
    } else {
        makeModEdge = true;
        makeRefEdge = true;
    }

    //there is a dependence
    if (makeRefEdge) {
        if (addEdgeFromCall) {
            pdg->addEdge((Value*)call, (Value*)store)->setMemMustType(true, false, DG_DATA_WAR);
        } else {
            //we cannot have mmeory dependences from a memory instruction to allocators as they always
            //return new memory
            if (!isAllocator(call)) {
                pdg->addEdge((Value*)store, (Value*)call)->setMemMustType(true, false, DG_DATA_RAW);
            }
            
        }
    }

    if (makeModEdge) {
        if (addEdgeFromCall) {
            pdg->addEdge((Value*)call, (Value*)store)->setMemMustType(true, false, DG_DATA_WAW);
        } else {
            //we cannot have mmeory dependences from a memory instruction to allocators as they always
            //return new memory
            if (!isAllocator(call)) {
                pdg->addEdge((Value*)store, (Value*)call)->setMemMustType(true, false, DG_DATA_WAW);
            }
            
        }
    }
}

void PDGAnalysis::addEdgeFromFunctionModRef(PDG * pdg, Function &F, AAResults &AA, CallInst *call, LoadInst *load, bool addEdgeFromCall) {
    BitVector bv(3, false);

    //we cannot have memory dependences from a call to a deallocator(e.g., free).
    if (isDeallocator(call)) return;

    //query the llvm alias analysis
    // LLVM 14: AAResults API 변경 - MemoryLocation 사용
    auto Loc = MemoryLocation::get(load);
    auto ModRef = AA.getModRefInfo(call, Loc);
    switch(ModRef) {
        case ModRefInfo::NoModRef:
        case ModRefInfo::Ref:
            return;
        case ModRefInfo::Mod:
        case ModRefInfo::ModRef:
           break;
    }

    //TODO: add SVF alias analysis

    //for softboundcets --- 1
    bool specialRAW = false;
    // // errs() << "611: call: " << *call << ", NumOfArg: " << call->arg_size() <<"\n";
    // LLVM 14: getNumArgOperands() → arg_size()
    for (int i = 0; i < (int)call->arg_size(); i++) {
        // errs() << "Arg-" << i << " is: " << *(call->getArgOperand(i)) << "\n";
        if (call->getArgOperand(i) == load->getOperand(0)) specialRAW = true;
    }
    // errs() << "611: load: " << *load << ", 0Op: " << *(load->getOperand(0)) << "\n";
    // errs() << "addEdgeFromCall: " << addEdgeFromCall << "\n";
    //there is a dependence
    if (addEdgeFromCall) {
        pdg->addEdge((Value *)call, (Value *)load)->setMemMustType(true, false, DG_DATA_RAW);
    } else {
        //we cannot have mmeory dependences from a memory instruction to allocators as they always
        //return new memory
        if (!isAllocator(call)) {
            pdg->addEdge((Value *)load, (Value *) call)->setMemMustType(true, false, DG_DATA_WAR);
        }
    }
    //for softboundcets --- 1
    if (specialRAW) {
        pdg->addEdge((Value *)call, (Value *)load)->setMemMustType(true, true, DG_DATA_RAW);
    }
}

void PDGAnalysis::addEdgeFromFunctionModRef(PDG * pdg, Function &F, AAResults &AA, CallInst *call, CallInst *otherCall) {
    BitVector bv(3, false);
    BitVector rbv(3, false);
    bool makeRefEdge = false;
    bool makeModEdge = false;
    bool makeModRefEdge = false;
    bool reverseRefEdge = false;
    bool reverseModEdge = false;
    bool reverseModRefEdge = false;

    //no dependence between allocators
    if (isAllocator(call) && isAllocator(otherCall) 
    && !isReallocator(call) && !isReallocator(otherCall)) 
        return;
    //check if the call instructions are abount an allocator and a deallocator
    CallInst * allocatorCall = nullptr;
    CallInst * deallocatorCall = nullptr;
    if (isAllocator(call)) allocatorCall = call;
    if (isAllocator(otherCall)) allocatorCall = otherCall;
    if (isDeallocator(call)) deallocatorCall = call;
    if (isDeallocator(otherCall)) deallocatorCall = otherCall;
    if (allocatorCall != nullptr && deallocatorCall != nullptr) {
        // if one call is allocator , another is deallocator
        // check if the pointer accessed by the deallocator alias with the pointer returned by the allocator
        auto objectAllocated = getAllocatedObject(allocatorCall);
        auto objectFreed = getFreedObject(deallocatorCall);
        if (objectAllocated != nullptr && objectFreed != nullptr) {
            auto aliasType = this->doTheyAlias(pdg, F, AA, objectAllocated, objectFreed);
            // LLVM 14: AliasResult는 llvm namespace에 있음
            if (aliasType == llvm::AliasResult::NoAlias) return;
        }

    }

    //query the llvm alias analysis
    // LLVM 14: AAResults API 변경 - CallBase 사용
    auto ModRef1 = AA.getModRefInfo(call, otherCall);
    switch (ModRef1) {
        case ModRefInfo::NoModRef:
            return;
        case ModRefInfo::Ref:
            //@call may read memory locations written by @otherCall
            bv[0] = true;
            break;
        case ModRefInfo::Mod:
            //@call may write a memory location that can be read or written by @otherCall
            bv[1] = true;
            {
                // LLVM 14: switch 문에서 변수 선언 시 블록 필요
                auto ModRef2 = AA.getModRefInfo(otherCall, call);
                switch (ModRef2) {
                    case ModRefInfo::NoModRef:
                        return;
                    case ModRefInfo::Ref:
                        rbv[0] = true;
                        break;
                    case ModRefInfo::Mod:
                        rbv[1] = true;
                        break;
                    case ModRefInfo::ModRef:
                        rbv[2] = true;
                        break;
                }
            }
            break;
        case ModRefInfo::ModRef:
            //@call may read or write a memory location that can be written by @otherCall
            bv[2] = true;
            break;

    }

    //TODO: add SVF alias analysis

    if (bv[0] && bv[1]) {
        return;
    }
    if (bv[0]) {
        makeRefEdge = true;
    } else if (bv[1]) {
        makeModEdge = true;
        if (rbv[0] && rbv[1]) {
            return;
        }

        if (rbv[0]) {
            reverseRefEdge = true;
        } else if (rbv[1]) {
            reverseModEdge = true;
        } else {
            reverseModRefEdge = true;
        }
    } else {
        makeModRefEdge = true;
    }

    //there is a dependence
    if (makeRefEdge) {
        //@call reads a memory location that @otherCall writes.
        //The sequence of execution is @call and then @otherCall.
        //Hence, there is a WAR dependence from @call to @otherCall
        pdg->addEdge((Value *)call, (Value *)otherCall)->setMemMustType(true, false, DG_DATA_WAR);
        
        //check the unique case that @call and @otherCall are the same.
        //in this case, there is also a RAW dependence between them.
        if (call == otherCall) {
            pdg->addEdge((Value*)otherCall, (Value*)call)->setMemMustType(true, false, DG_DATA_RAW);
        }
    } else if (makeModEdge) {
        //dependency of Mod result between call and otherCall is depend on the reverse getModRefInfo result
        if (reverseRefEdge) {
            pdg->addEdge((Value *)call, (Value *)otherCall)->setMemMustType(true, false, DG_DATA_RAW);
            //check the unique case that @call and @otherCall are the same.
            //in this case, there is also a WAR dependence between them.
            if (call == otherCall) {
                pdg->addEdge((Value*)otherCall, (Value*)call)->setMemMustType(true, false, DG_DATA_WAR);
            }
        } else if (reverseModEdge) {
            pdg->addEdge((Value *)call, (Value *)otherCall)->setMemMustType(true, false, DG_DATA_WAW);
        } else if (reverseModRefEdge) {
            pdg->addEdge((Value *)call, (Value *)otherCall)->setMemMustType(true, false, DG_DATA_RAW);
            pdg->addEdge((Value *)call, (Value *)otherCall)->setMemMustType(true, false, DG_DATA_WAW);

            //check the unique case that @call and @otherCall are the same.
            //in this case, there is also a WAR dependence between them.
            if (call == otherCall) {
                pdg->addEdge((Value*)otherCall, (Value*)call)->setMemMustType(true, false, DG_DATA_WAR);
            }
        }
    } else if (makeModRefEdge) {
        pdg->addEdge((Value *)call, (Value *)otherCall)->setMemMustType(true, false, DG_DATA_WAR);
        pdg->addEdge((Value *)call, (Value *)otherCall)->setMemMustType(true, false, DG_DATA_WAW);

        //check the unique case that @call and @otherCall are the same.
        //in this case, there is also a RAW dependence between them.
        if (call == otherCall) {
            pdg->addEdge((Value*)otherCall, (Value*)call)->setMemMustType(true, false, DG_DATA_RAW);
        }
    }
}


bool PDGAnalysis::isTheLibraryFunctionPure(Function * libF) {
    // LLVM 14: StringRef → string 변환
    if (PDGAnalysis::libraryFunction.count(libF->getName().str())) {
        return true;
    }
    return false;
}

bool PDGAnalysis::isTheLibraryFunctionThreadSafe(Function * libraryFunction) {
    // LLVM 14: StringRef → string 변환
    if (PDGAnalysis::externalThreadSafeFunctions.count(libraryFunction->getName().str())) {
        return true;
    }

    return false;
}

// http://www.cplusplus.com/reference/clibrary/ and https://github.com/SVF-tools/SVF/blob/master/lib/Util/ExtAPI.cpp
const std::unordered_set<std::string> PDGAnalysis::libraryFunction {
    // ctype.h
  "isalnum",
  "isalpha",
  "isblank",
  "iscntrl",
  "isdigit",
  "isgraph",
  "islower",
  "isprint",
  "ispunct",
  "isspace",
  "isupper",
  "isxdigit",
  "tolower",
  "toupper",

  // math.h
  "cos",
  "sin",
  "tan",
  "acos",
  "asin",
  "atan",
  "atan2",
  "cosh",
  "sinh",
  "tanh",
  "acosh",
  "asinh",
  "atanh",
  "exp",
  "ldexp",
  "log",
  "log10",
  "exp2",
  "expm1",
  "ilogb",
  "log1p",
  "log2",
  "logb",
  "scalbn",
  "scalbln",
  "pow",
  "sqrt",
  "cbrt",
  "hypot",
  "erf",
  "erfc",
  "tgamma",
  "lgamma",
  "ceil",
  "floor",
  "fmod",
  "trunc",
  "round",
  "lround",
  "llround",
  "nearbyint",
  "remainder",
  "copysign",
  "nextafter",
  "nexttoward",
  "fdim",
  "fmax",
  "fmin",
  "fabs",
  "abs",
  "fma",
  "fpclassify",
  "isfinite",
  "isinf",
  "isnan",
  "isnormal",
  "signbit",
  "isgreater",
  "isgreaterequal",
  "isless",
  "islessequal",
  "islessgreater",
  "isunordered",

  // time.h
  "clock",
  "difftime",

  // wctype.h
  "iswalnum",
  "iswalpha",
  "iswblank",
  "iswcntrl",
  "iswdigit",
  "iswgraph",
  "iswlower",
  "iswprint",
  "iswpunct",
  "iswspace",
  "iswupper",
  "iswxdigit",
  "towlower",
  "towupper",
  "iswctype",
  "towctrans",

  "atoi",
  "atoll",
  "exit",
  "strcmp",
  "strncmp",
  "rand_r"
};

// may extermely slow down the performance of multi-threading parallel performance 
const std::unordered_set<std::string> PDGAnalysis::externalThreadSafeFunctions {
    "malloc",
    "calloc",
    "realloc",
    "free", 
    // for soundness, below functions are considered thread safe.
    "fgetc",
    "fopen",
    "fclose",
    "fwrite",
    "fread",
    "fprintf",
    "fscanf",

    "printf",
    "scanf",

    // "sqrt",

    // ------------ softboundcets version ------------
    "softboundcets_malloc",
    "softboundcets_calloc",
    "softboundcets_realloc",
    "softboundcets_free",

    "softboundcets_fgetc",
    "softboundcets_fopen",
    "softboundcets_fclose",
    "softboundcets_fwrite",
    "softboundcets_fread",

    // "softboundcets_sqrt",

    // ------------ movec version ------------
    "_RV_fclose",
    "_RV_clearerr",
    "_RV_feof",
    "_RV_ferror",
    "_RV_fflush",
    "_RV_fgetpos",
    "_RV_fopen",
    "_RV_fdopen",
    "_RV_freopen",
    "_RV_fileno",
    "_RV_fread",
    "_RV_fseek",
    "_RV_fsetpos",
    "_RV_ftell",
    "_RV_fwrite",
    "_RV_remove",
    "_RV_rename",
    "_RV_rewind",
    "_RV_setbuf",
    "_RV_setvbuf",
    "_RV_tmpfile",
    "_RV_tmpnam",
    "_RV_vfprintf",
    "_RV_vprintf",
    "_RV_vsprintf",
    "_RV_fgetc",
    "_RV_fgets",
    "_RV_fputc",
    "_RV_fputs",
    "_RV__IO_getc",
    "_RV_gets",
    "_RV__IO_putc",
    "_RV_puts",
    "_RV_ungetc",
    "_RV_perror",
    "_RV_free",
    "_RV_malloc",
    "_RV_realloc",
    "_RV_read",
    "_RV_write"


};

// LLVM 14: AliasResult는 llvm namespace에 있음
llvm::AliasResult PDGAnalysis::doTheyAlias (PDG *pdg, Function &F, AAResults &AA, Value * instI, Value * instJ) {
    //query the llvm alias analysis
    // LLVM 14: AAResults::alias() 사용
    switch (AA.alias(instI, instJ)) {
        case llvm::AliasResult::NoAlias:
            return llvm::AliasResult::NoAlias;
        case llvm::AliasResult::PartialAlias:
        case llvm::AliasResult::MayAlias:
            break;
        case llvm::AliasResult::MustAlias: 
            return llvm::AliasResult::MustAlias;
    }

    //TODO: add SVF alias analysis

    return llvm::AliasResult::MayAlias;
}
#include "PDGAnalysis.h"
#include "DGBase.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/ADT/iterator_range.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/BitVector.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/PostDominators.h"
#include "llvm/IR/Dominators.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Analysis/CallGraph.h"
#include "llvm/IR/Value.h"

#include <utility>
#include <string>
#include <unordered_set>

using namespace llvm;

char PDGAnalysis::ID = 0;

static RegisterPass<PDGAnalysis> X("PDGAnalysis", "Computing the Program Dependence Graph");

static cl::opt<bool> PDGDump("catamaran-pdg-dump", cl::ZeroOrMore, cl::Hidden, cl::desc("Dump the PDG"));
static cl::opt<bool> PDGRA("catamaran-pdg-reaching-analysis", cl::ZeroOrMore, cl::Hidden, cl::desc("Use the reaching analysis to compute the PDG"));

PDGAnalysis::PDGAnalysis() : ModulePass{ID},
    M{nullptr},
    programDependenceGraph{nullptr},
    dfAna{},
    enableReachAnalysis{false},
    dumpPDG{false}
    /*printer{}*/ {
    return;
}

bool PDGAnalysis::runOnModule(Module &M) {
    //check if the pass has already run
    if (this->programDependenceGraph != nullptr || this->M != nullptr) {
        return false;
    }

    //store global information
    this->M = &M;

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

bool PDGAnalysis::doInitialization(Module &M) {
    errs() << "Initialization...\n";
    this->dumpPDG = (PDGDump.getNumOccurrences() > 0) ? true : false;
    this->enableReachAnalysis = (PDGRA.getNumOccurrences() > 0) ? true : false;
    return false;
}

void PDGAnalysis::getAnalysisUsage(AnalysisUsage &AU) const {
    //errs() << "getAnalysisUsage\n";
    // AU.addRequired<CallGraph>();
    // AU.addRequired<AliasAnalysis>();
    // AU.addRequired<LoopInfo>();
    
    // AU.addRequired<DominatorTree>();
    // AU.addRequired<PostDominatorTree>(); // 
    AU.addRequired<AliasAnalysis>();
    AU.addRequired<PostDominatorTree>(); // 
    AU.addRequired<DominatorTreeWrapperPass>(); // DominatorTreeWrapperPass
    AU.addRequired<LoopInfo>();
    AU.addRequired<CallGraphWrapperPass>(); // CallGraphWrapperPass
    AU.setPreservesAll();
    // errs() << "getAnalysisUsage---after\n";
}

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
        
        //auto pdgValue = node->getT();
        errs() << "---getT---180\n";
        auto pdgValue = (*node_iterator)->getT();
        // Value * pdgValue = (*node_iterator)->getT();
        errs() << "---after-getT---180\n";
        //assert((pdgValue == nullptr) && "pdgValue is nullptr\n");
        if (pdgValue == nullptr) {
            errs() << "pdgValue is nullptr\n";
        }
        errs() << "---after-getT---222\n";
        if (pdgValue->use_empty()) {
            errs() << "pdgValue use is empty...\n";
        }
        errs() << "---after-getT---226\n";
        if (!isa<Instruction>(pdgValue)) continue;
        // errs () << "pdgValue: " << *(pdgValue) << "\n";
        // errs() << " pdgValue Inst : " << *cast<Instruction>(pdgValue) << "\n";
        // errs() << "---getNumUses(): " << std::distance(pdgValue->use_begin(), pdgValue->use_end()) << "\n";
        // if (pdgValue->getNumUses() == 0)    continue;
        // if (isa<PtrToIntInst>(pdgValue)) errs() << " pdgValue Inst : " << *cast<PtrToIntInst>(pdgValue) << "\n";

        //the current definition has uses
        //add the uses
        // errs() << "---PDGAnalysis 181:" << *cast<Instruction>(pdgValue) << "\n";
        //for (auto& U : pdgValue->uses()) {

        for (Value::use_iterator U = pdgValue->use_begin(); U != pdgValue->use_end(); U++) {
            errs() << "---PDGAnalysis 184---\n";
            
            //Instruction *User = dyn_cast<Instruction>(*U);
            if (isa<Instruction>(U->getUser()) || isa<Argument>(U->getUser())) {
                // if (pdgValue == *U) continue;
                errs() << " pdgValue Inst : " << *cast<Instruction>(pdgValue) << "\n";
                errs () << "Inst: " << *dyn_cast<Instruction>(U->getUser()) << "\n";
                auto edge = pdg->addEdge(pdgValue, U->getUser()); //from: pdgValue, to:user, pdgValue - write(def),  user - read(use)
                edge->setMemMustType(false, true, DG_DATA_RAW);
                errs() << "---PDGAnalysis 188---\n";
            }
        }

    }


}

void PDGAnalysis::constructEdgesFromAliases(PDG *pdg, Module &M) {
    //use alias analysis on stores, loads, and function calls to construct PDG edges
    for (auto &F : M) {
        //check if the function has a body
        if (F.empty()) continue;
        if (isASANLibFunc(&F)) continue;
        // errs() << "--PDGAnalysis-222: " << F.getName() << "\n";
        //add the edges to the PDG
        constructEdgesFromAliasesForFunction(pdg, F);
    }
}

void PDGAnalysis::constructEdgesFromAliasesForFunction(PDG *pdg, Function &F) {
    //fetch the alias analysis
    //errs() << "---PDGAnalysis--230\n";
    auto &AA = getAnalysis<AliasAnalysis>();
    //errs() << "---PDGAnalysis--232\n";
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
            else if (auto cast = dyn_cast<PtrToIntInst>(&Inst)) { 
                iteratorInstForCast(pdg, F, AA, dfRes, cast);
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
        if (isASANLibFunc(&F)) continue;
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
    PostDominatorTree * PDT = &getAnalysis<PostDominatorTree>(F);
    // DominatorTree * DT = &getAnalysis<DominatorTree>(F);
    //errs() << "---PDGAnalysis---288\n";
    //auto &postDomTree = PDT.getPostDomTree();
    //errs() << "---PDGAnalysis--290\n";
    for (auto &B : F) {
        //fetch the basic blocks post-dominated by the current one.
        SmallVector<BasicBlock *, 10> dominatedBBs;
        //postDomTree.getDescendants(&B, dominatedBBs);
        //errs() << "---PDGAnalysis-300-1\n";
        // DT->getDescendants(&B, dominatedBBs);
        PDT->getDescendants(&B, dominatedBBs);
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
                if (PDT->properlyDominates(&B, predBB)) continue;
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


void PDGAnalysis::iteratorInstForStore(PDG *pdg, Function &F, AliasAnalysis &AA, DataFlowResult * dfRes, StoreInst * store) {
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

void PDGAnalysis::iteratorInstForLoad(PDG *pdg, Function &F, AliasAnalysis &AA, DataFlowResult * dfRes, LoadInst * load) {
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

void PDGAnalysis::iteratorInstForCast(PDG *pdg, Function &F, AliasAnalysis &AA, DataFlowResult * dfRes, PtrToIntInst * cast) {
    for (auto I : dfRes->OUT(cast)) {
        // //check stores
        // if (auto store = dyn_cast<StoreInst>(I)) {
        //     addEdgeFromMemoryAlias<LoadInst, StoreInst>(pdg, F, AA, load, store, DG_DATA_WAR);
        //     continue;
        // }

        //check call
        if (auto call = dyn_cast<CallInst>(I)) {
            // if (!this->isActualCode(call)) {
            //     continue;
            // }
            if (IsSafeCheckCall(call)) {
                pdg->addEdge((Value *)cast, (Value *) call)->setMemMustType(false, false, DG_DATA_RAW);
            }
            
            continue;
        }
    }
}

void PDGAnalysis::iteratorInstForCall(PDG *pdg, Function &F, AliasAnalysis &AA, DataFlowResult * dfRes, CallInst * call) {
    //check if the call instruction is not actual code
    if (!this->isActualCode(call)) return;

    //identify all dependences with @call
    for (auto I : dfRes->OUT(call)) {
        // errs() << "iteratorInstForCall-475, Inst: " << *I << "\n";
        if (I == nullptr || I == NULL) errs() << "iteratorInstForCall I is null\n";
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

    // corner cases for asan
    // add edge from arg to call
    // if (IsSafeCheckCall(call)) {
    //     // errs() << "call581: " << *call << "\n";
    //     // errs() << "arg0: " << *call->getArgOperand(0) << "\n";
    //     Value * from = (Value *)call->getArgOperand(0);
    //     Value * to = (Value *)call;
    //     if (pdg->fetchNode(from) == nullptr || pdg->fetchNode(to) == nullptr) {
    //         return;
    //     }
    //     pdg->addEdge(from, to)->setMemMustType(false, true, DG_DATA_RAW);
    // }

}

bool PDGAnalysis::isActualCode(CallInst *call) {
    //fetch the callee
    auto callee = call->getCalledFunction();
    if (callee == nullptr) return true;

    if (!callee->isIntrinsic()) return true;

    return false;//!zyy
}

void PDGAnalysis::addEdgeFromFunctionModRef(PDG * pdg, Function &F, AliasAnalysis &AA, CallInst *call, StoreInst *store, bool addEdgeFromCall) {
    BitVector bv(3, false);
    bool makeRefEdge = false;
    bool makeModEdge = false;

    //we cannot have memory dependences from a call to a deallocator(e.g., free).
    if (isDeallocator(call)) return;

    //query the llvm alias analysis
    switch(AA.getModRefInfo(call, AA.getLocation(store))) {
        case AliasAnalysis::NoModRef:
            return;
        case AliasAnalysis::Ref:
            bv[0] = true;
            break;
        case AliasAnalysis::Mod:
            bv[1] = true;
            break;
        case AliasAnalysis::ModRef:
            bv[2] = true;
            break;
    }


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

void PDGAnalysis::addEdgeFromFunctionModRef(PDG * pdg, Function &F, AliasAnalysis &AA, CallInst *call, LoadInst *load, bool addEdgeFromCall) {
    BitVector bv(3, false);

    //we cannot have memory dependences from a call to a deallocator(e.g., free).
    if (isDeallocator(call)) return;

    //query the llvm alias analysis
    switch(AA.getModRefInfo(call, AA.getLocation(load))) {
        case AliasAnalysis::NoModRef:
        case AliasAnalysis::Ref:
            return;
        case AliasAnalysis::Mod:
        case AliasAnalysis::ModRef:
           break;
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

}

void PDGAnalysis::addEdgeFromFunctionModRef(PDG * pdg, Function &F, AliasAnalysis &AA, CallInst *call, CallInst *otherCall) {
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
            if (aliasType == AliasAnalysis::NoAlias) return;
        }

    }

    //query the llvm alias analysis
    switch (AA.getModRefInfo(call, otherCall)) {
        case AliasAnalysis::NoModRef:
            return;
        case AliasAnalysis::Ref:
            //@call may read memory locations written by @otherCall
            bv[0] = true;
            break;
        case AliasAnalysis::Mod:
            //@call may write a memory location that can be read or written by @otherCall
            bv[1] = true;
            switch (AA.getModRefInfo(otherCall, call)) {
                case AliasAnalysis::NoModRef:
                    return;
                case AliasAnalysis::Ref:
                    rbv[0] = true;
                    break;
                case AliasAnalysis::Mod:
                    rbv[1] = true;
                    break;
                case AliasAnalysis::ModRef:
                    rbv[2] = true;
                    break;
            }
            break;
        case AliasAnalysis::ModRef:
            //@call may read or write a memory location that can be written by @otherCall
            bv[2] = true;
            break;

    }

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
    if (PDGAnalysis::libraryFunction.count(libF->getName())) {
        return true;
    }
    return false;
}

bool PDGAnalysis::isTheLibraryFunctionThreadSafe(Function * libraryFunction) {
    if (PDGAnalysis::externalThreadSafeFunctions.count(libraryFunction->getName())) {
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
    "scanf"
};

AliasAnalysis::AliasResult PDGAnalysis::doTheyAlias (PDG *pdg, Function &F, AliasAnalysis &AA, Value * instI, Value * instJ) {
    //query the llvm alias analysis
    switch (AA.alias(instI, instJ)) {
        case AliasAnalysis::NoAlias:
            return AliasAnalysis::NoAlias;
        case AliasAnalysis::PartialAlias:
        case AliasAnalysis::MayAlias:
            break;
        case AliasAnalysis::MustAlias: 
            return AliasAnalysis::MustAlias;
    }


    return AliasAnalysis::MayAlias;
}
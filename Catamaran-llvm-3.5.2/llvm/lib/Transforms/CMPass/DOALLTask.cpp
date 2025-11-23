#include "DOALLTask.h"
#include <cstdlib>

DOALLTask::DOALLTask(uint32_t ID, FunctionType * funcType, Module * M) : loopSeed {std::random_device{}()} {
    this->ID = ID;
    this->M = M;

}

uint32_t DOALLTask::getID(void) const {
    return this->ID;
}

//Live-in values
bool DOALLTask::isAnOriginalLiveIn (Value *v) const {
    if (this->liveInClones.find(v) != this->liveInClones.end()) return true;
    return false;
}

Value * DOALLTask::getCloneOfOriginalLiveIn (Value * v) const {
    if (!this->isAnOriginalLiveIn(v)) return nullptr;
    return this->liveInClones.at(v);
}

void DOALLTask::addLiveIn (Value *original, Value *internal)  {
    this->liveInClones[original] = internal;
}

void DOALLTask::removeLiveIn (Instruction *original) {
    auto it = this->liveInClones.find(original);
    if (it == this->liveInClones.end()) return;

    //remove the load of the live-in
    auto clonedValue = this->liveInClones.at(original);
    if (auto loadInst = dyn_cast<Instruction>(clonedValue)) {
        loadInst->eraseFromParent();
    }

    //remove the live-in
    this->liveInClones.erase(it);
}

//Live-out instructions

void DOALLTask::addLiveOut (Instruction *original, Instruction *internal)  {
    this->liveOutClones[original].insert(internal);
}

void DOALLTask::removeLiveOut (Instruction *original, Instruction *removed)  {
    if (this->liveOutClones.find(original) == this->liveOutClones.end()) return;

    this->liveOutClones[original].erase(removed);
}

//Instructions
bool DOALLTask::isAnOriginalInstruction (Instruction *i) const {
    if (this->instructionClones.find(i) != this->instructionClones.end()) return true;

    return false;
}

bool DOALLTask::isAClonedInstruction (Instruction *i) const  {
    if (i->getFunction() != this->getTaskBody()) return false;
    assert(this->instructionClones.find(i) != this->instructionClones.end());
    return true;
}

Instruction * DOALLTask::getCloneOfOriginalInstruction (Instruction *i) const {
    if (!this->isAnOriginalInstruction(i)) return nullptr;

    return this->instructionClones.at(i);
}

void DOALLTask::addInstruction (Instruction *original, Instruction *internal) {
    this->instructionClones[original] = internal;
}

std::unordered_set<Instruction *> DOALLTask::getOriginalInstructions (void) const {
    std::unordered_set<Instruction *> res;
    for (auto insts : this->instructionClones) {
        res.insert(insts.first);
    }
    return res;
}

Instruction * DOALLTask::cloneAndAddInstruction (Instruction *original){
    auto cloneInst = original->clone();

    this->addInstruction(original, cloneInst);
    return cloneInst;
}

void DOALLTask::removeOriginalInstruction (Instruction *i) {
    if (this->instructionClones.find(i) == this->instructionClones.end() ) return;
    this->instructionClones.erase(i);
}

//BasicBlocks
bool DOALLTask::isAnOriginalBasicBlock (BasicBlock *bb) const  {
    if (this->basicBlockClones.find(bb) != this->basicBlockClones.end()) return true;
    return false;
}

BasicBlock * DOALLTask::getCloneOfOriginalBasicBlock (BasicBlock *bb) const {
    if (!this->isAnOriginalBasicBlock(bb)) return nullptr;

    return this->basicBlockClones.at(bb);
}

std::unordered_set<BasicBlock *> DOALLTask::getOriginalBasicBlocks (void) const {
    std::unordered_set<BasicBlock *>res;
    for(auto bbs : this->basicBlockClones) {
        res.insert(bbs.first);
    }
    return res;
}

void DOALLTask::addBasicBlock (BasicBlock *original, BasicBlock *internal)  {
    this->basicBlockClones[original] = internal;
}

LLVMContext& DOALLTask::getTaskLLVMContext(void) const {
    auto& c = this->F->getContext();
    return c;
}

BasicBlock * DOALLTask::addBasicBlockStub (BasicBlock *original) {
    auto& ctx = this->getTaskLLVMContext();

    //allocate a new basic block
    auto newBB = BasicBlock::Create(ctx, "", this->F);
    // errs() << "---addNewBB\n";
    this->addBasicBlock(original, newBB);
    return newBB;
}

BasicBlock * DOALLTask::cloneAndAddBasicBlock (BasicBlock *original) {
    auto func = [](Instruction * I) -> bool {
        return true;
    };

    auto newBB = this->cloneAndAddBasicBlock(original, func);
    return newBB;
}

BasicBlock * DOALLTask::cloneAndAddBasicBlock (BasicBlock *original, std::function<bool (Instruction *origInst)> filter) {
    auto cloneBB = this->addBasicBlockStub(original);
    // errs() << "---cloneAddBB--186\n";
    IRBuilder<> builder(cloneBB);
    for (auto& I : *original) {
        if (!filter(&I)) continue;

        //add the current instructions to the task
        auto cloneInst = builder.Insert(I.clone());
        this->instructionClones[&I] = cloneInst;
    }

    return cloneBB;
}

void DOALLTask::removeOriginalBasicBlock (BasicBlock *bb) {
    this->basicBlockClones.erase(bb);
}

BasicBlock * DOALLTask::getEntry (void) const  {
    return this->entryBlock;
}

BasicBlock * DOALLTask::getExit (void) const  {
    return this->exitBlock;
}

uint32_t DOALLTask::getNumberOfLastBlocks (void) const  {
    return this->lastBlocks.size();
}

BasicBlock * DOALLTask::getLastBlock (uint32_t blockID) const  {
    if (blockID >= this->lastBlocks.size()) {
        return nullptr;
    }
    return this->lastBlocks[blockID];

}

//Body
Function * DOALLTask::getTaskBody (void) const {
    return this->F;
}

//Dependences with the outside code
Value * DOALLTask::getEnvironment (void) const {
    return this->envArg;
}

void DOALLTask::setLoopHeader(BasicBlock * loopH) {
    this->loopHeader = loopH;
}

void DOALLTask::setWhereToInsertFunc(Instruction * inst) {
    this->whereToInsertFunc = inst;
}

void DOALLTask::addLiveInVar(Value * liveIn) {
    this->liveInVars.push_back(liveIn);
}

void DOALLTask::setSafeCheckInstsNoInLoopBody(std::unordered_set<Instruction *> checkcalls) {
    this->notInLoopBody = checkcalls;
}
void DOALLTask::setSafeCheckInstsInLoopBody(std::unordered_map<Instruction *, std::set<Instruction *>> safecodes) {
    this->safeCheckInstsInLoopBody = safecodes;
}
void DOALLTask::setAllInstsToOneCallInstInLoopBody(std::unordered_map<Instruction *, std::set<Instruction *>> allinsts) {
    this->allInstsToOneCallInstInLoopBody = allinsts;
}

bool DOALLTask::isOriginalLiveInVar(Value * v) {
    int count = std::count(this->liveInVars.begin(), this->liveInVars.end(), v);
    if (count > 0) {
        return true;
    }
    return false;
}

void DOALLTask::clearClones() {
    for (auto pair : this->liveInClones) {
        auto cloneI = cast<Instruction>(this->liveInClones[pair.first]);
        if (cloneI) cloneI->removeFromParent();
    }
}

void DOALLTask::setLiveInInitVal(std::unordered_map<Value *, Value *> initMap) {
    this->liveInInitValue = initMap;
}

void DOALLTask::genCtorForSpawn(Module * M, Function * wrapperFunc) {
    LLVMContext& ctx = this->M->getContext();
    uint32_t baseArgsForCtorSpawn = 2;
    std::vector<Type *> ctorSig(baseArgsForCtorSpawn);
    ctorSig[0] = Type::getInt32Ty(ctx);

    Type * voidStarTy = PointerType::getUnqual(Type::getInt8Ty(ctx));

    std::string s0 = "_Z5spawnjPFv";
    std::string s1 = "P";
    std::string s2 = "v";
    std::string s3 = "E";
    std::string s4 = "S_";
    std::string s5 = "";
    std::string deltaS2 = "S_";
    std::string deltaS4 = "S_";

    std::vector<Type *> ctorArgs;
    std::string ctorName = s0 + s2 + s3 + s5;

    
    for (int t = 0; t <= wrapperFunc->getArgumentList().size(); ++t) {
        if (t == wrapperFunc->getArgumentList().size()) {
            ctorSig[1] = PointerType::getUnqual(FunctionType::get(Type::getVoidTy(ctx), ctorArgs, false));
            FunctionType * ctorTy = FunctionType::get(Type::getVoidTy(ctx), ctorSig, false);
            this->ctors[t] = this->M->getOrInsertFunction(ctorName, ctorTy);
        }

        ctorSig.push_back(voidStarTy);
        //extend the name
        s2 += ( t == 0 ? "" : deltaS2);
        s4 += ( t == 0 ? "" : deltaS4);

        ctorName = s0 + s1 + s2 + s3 + s4 + s5;
        ctorArgs.push_back(voidStarTy);
    }

}

std::vector<Value *> DOALLTask::genSpawnArgs(Module *M, Function * wrapperFunc) {
    LLVMContext& ctx = this->M->getContext();
    Type * voidStarTy = PointerType::getUnqual(Type::getInt8Ty(ctx));

    std::vector<Value *> args{ConstantInt::get(Type::getInt32Ty(ctx), std::uniform_int_distribution<uint32_t>{}(this->loopSeed)), wrapperFunc};

    for (auto liveIn : this->liveInVars) {
        // errs() << "592Inst: " << *liveIn << "\n";
        Type * liveInType = liveIn->getType();
        Value * castArgForNew;
        // 
        // filter liveInvars which are needed alloca memory and bitcast related
        // if (this->isLocalVarLiveIn(liveIn)) continue;
        if (liveInType->isPointerTy()) {
            //just need to bitcast
            castArgForNew = liveIn;
            // errs() << "--622\n";
        } else {
            castArgForNew = new AllocaInst(liveInType, "ya_", this->whereToInsertFunc);
            new StoreInst(liveIn, castArgForNew, this->whereToInsertFunc);
            // errs() << "--626\n";
        }
        // errs() << "castArgForNew: " << *castArgForNew <<"\n";
        BitCastInst * bcInst = new BitCastInst(castArgForNew, voidStarTy, "yy_", this->whereToInsertFunc);
        // errs() << "bcInst: " << *bcInst << "\n";
        args.push_back(bcInst);
        // errs() << "--631\n";
    }
    errs() << "argsize: " << args.size() << "\n";
    // for (auto arg : args) {
    //     errs() << "final arg: " << *arg << "\n";
    // }
    // for (int i = 0 ; i < args.size(); i++) {
    //     errs() << "final arg: " << *args[i] << "\n";
    // }

    return args;
}

void DOALLTask::eraseSafeCheckCodes() {

    //the code in safeCheckInstsInLoopBody should be erase
    // TODO: need more care consideration
    std::unordered_set<Instruction*> toErased;
    for (auto pair : this->safeCheckInstsInLoopBody) { 
        for (auto inst : pair.second) {
            if (isOriginalInst(inst)) continue;
            toErased.insert(inst);
        }
        toErased.insert(pair.first);
    }

    for (auto inst : toErased) {
            //do not erase these codes in source program
        if (this->notInLoopBody.count(inst) != 0) continue;
        inst->eraseFromParent();
    }

    // errs() << "Final module: \n";
    // errs() << *this->M << "\n";
}

bool DOALLTask::isOriginalInst(Instruction * inst) {
    if (isa<GetElementPtrInst>(inst)) return true;
    if (usedByLLVMIntrinsic(inst)) return true;
    return false;

}

void DOALLTask::splitLoop() {
    auto loopStructure = this->LDI->getLoopStructure();

    // errs() << "----loopStructure of a task----\n";
    // std::string str;
    // raw_string_ostream ros(str);
    // loopStructure->print(ros);
    // ros.flush();
    // errs() << str << "\n";

    auto& ctx = this->M->getContext();
    Type * voidStarTy = PointerType::getUnqual(Type::getInt8Ty(ctx));
    
    // std::vector<Value *> nonLocalLiveIn;
    // for (auto livein : this->liveInVars) {
    //     if (this->isLocalVarLiveIn(livein)) continue;
    //     nonLocalLiveIn.push_back(livein); 
    //     errs() << "nonLocaLiveIn : " << *livein << "\n";
    // }

    // int numArgs = nonLocalLiveIn.size();
    int numArgs = this->liveInVars.size();
    
    std::vector<Type *> newLoopFuncArgs;
    newLoopFuncArgs.reserve(numArgs);
    for (int i = 0; i < numArgs; i++) {
        // newLoopFuncArgs.push_back(nonLocalLiveIn[i]->getType());
        newLoopFuncArgs.push_back(this->liveInVars[i]->getType());
        // errs() << "type: " << *(liveInVars[i]->getType()) << "\n";
        // errs() << "name: " << (liveInVars[i]->getName()) << "\n";
        // errs() << "liveIn: " << *(this->liveInVars[i]) << "\n";
    }

    FunctionType * newLoopFuncType = FunctionType::get(Type::getVoidTy(ctx), newLoopFuncArgs, false);
    std::string newLoopFuncName = "_loop_func_" + std::to_string(this->ID);

    Function * newLoopFunc = cast<Function>(Function::Create(newLoopFuncType, Function::InternalLinkage, newLoopFuncName, this->M));
    //set arg name
    int ind = 0;
    for (auto argIt = newLoopFunc->arg_begin(); argIt != newLoopFunc->arg_end(); ++argIt, ++ind) {
        argIt->setName(this->liveInVars[ind]->getName());
    }
    this->entryBlock = BasicBlock::Create(ctx, "entry", newLoopFunc);
    // errs() << "SplitLoop 386" << *newLoopFunc << "\n";
    // errs() << "SplitLoop 740" << "\n";
    //prepare var in entry block
    std::unordered_map<Value *, Value *> liveInForNewLiveIn;
    for (auto liveIn : this->liveInVars) {
        if (this->liveInNeedACMem(liveIn)) {
            // errs() << "393: " << *liveIn << "\n";
            if (!this->liveInInitValue[liveIn]) {
                //init value is null, 
                // p
                // errs() << "---548 " << *liveIn << "\n";
                // errs() << "---398\n";
                // if (AllocaInst * acInst = dyn_cast<AllocaInst>(liveIn)) {
                Value * castArg = new AllocaInst(liveIn->getType(), "zyyac_", this->entryBlock);
                // errs() << "---552\n";
                    // errs() << "---554\n";

                    // errs() << "---559\n";
                    // errs() << "---562\n";

                liveInForNewLiveIn[liveIn] = castArg;
                    // errs() << "---573\n";
                // }
            } else if (isa<Constant>(this->liveInInitValue[liveIn])) {
                //init value is constant value
                // errs() << "---412--" <<  *liveIn << "\n";; 
                Value * ac = new AllocaInst(this->liveInInitValue[liveIn]->getType(), "zyac_", this->entryBlock);
                new StoreInst(this->liveInInitValue[liveIn], ac, this->entryBlock);

                liveInForNewLiveIn[liveIn] = ac;

            } else { 
                // errs() << "---573--\n";
                //init value is variable
                // Value * ac = new AllocaInst(this->liveInInitValue[liveIn]->getType(), "zac_", this->entryBlock);
                if (AllocaInst * acInst = dyn_cast<AllocaInst>(liveIn)) {
                    // errs() << "acInst: " << *acInst << "\n";
                    Argument * arg = nullptr;
                    for (auto argIt = newLoopFunc->arg_begin(); argIt != newLoopFunc->arg_end(); ++argIt) {
                        if (argIt->getName() == liveIn->getName() && argIt->getType() == liveIn->getType()) {
                            
                            arg = argIt;
                            break;
                        } 
                    }
                    
                    // errs() << "--823---\n";

                    if (arg == nullptr) errs() << "Error...arg is nullptr\n";
                    Value * ac = new AllocaInst(acInst->getAllocatedType(), "zac_", this->entryBlock);

                    LoadInst * load = new LoadInst(arg, "zyl_", this->entryBlock);
                    
                    // errs() << "--825---\n";
                    new StoreInst(load, ac, this->entryBlock);

                    liveInForNewLiveIn[liveIn] = ac;
                    
                }


            }
        }
    }
    // errs() << "SplitLoop 811" << "\n";
    // errs() << "SplitLoop 455" << *newLoopFunc << "\n";
    // IRBuilder<> loopPreHeader(this->entryBlock);
    // create bitcast inst for localLiveIn var in the entry block
    for (auto liveIn : this->liveInVars) {

        Value * argForNew;
        if (liveInForNewLiveIn.count(liveIn) > 0) {
            argForNew = liveInForNewLiveIn[liveIn];
        
            // errs() << "argForNew: " << *argForNew << "\n";
            auto bcInst = new BitCastInst{argForNew, liveIn->getType(), "", this->entryBlock};
            // loopPreHeader.Insert(bcInst);
            this->liveInClones[liveIn] = bcInst; 
        }
        // errs() << "470 live in: " << *liveIn << "\n";
    }
    // errs() << "SplitLoop 845" << "\n";
    // errs() << "SplitLoop 466" << *newLoopFunc << "\n";
    int ix = 0;
    for (auto argIt = newLoopFunc->arg_begin(); argIt != newLoopFunc->arg_end(); ++argIt, ++ix) {
        //alloca memory for those liveInVars which are needed bitcast related
        if (liveInForNewLiveIn.count(this->liveInVars[ix]) > 0) continue;
        auto bcInst = new BitCastInst{&*argIt, this->liveInVars[ix]->getType(), "xx", this->entryBlock};
        // loopPreHeader.Insert(bcInst);
        this->liveInClones[this->liveInVars[ix]] = bcInst; 
    }
    // std::unordered_map<Instruction *, Instruction *> instMap{};
    std::unordered_map<BasicBlock *, BasicBlock *> bbMap{};
    std::set<Instruction *> instAdded{};

    // errs() << "SplitLoop 701" << "\n";
    // errs() << "SplitLoop 480" << *newLoopFunc << "\n";
    // abort();
    //clone Instructions in the parallelized loop task
    for (auto BB : loopStructure->getBasicBlocks()) {
        std::string label = BB->getName();
        auto cloneBB = BasicBlock::Create(ctx, label, newLoopFunc);
        bbMap[BB] = cloneBB;
        IRBuilder<> builder(cloneBB);
        for (auto& I : *BB) {
            //not clone branchInst, which is reconstructed by our approach later
            if (isa<BranchInst>(&I)) continue;

            // if (isDoNotParallelCodes(&I) && (!instIsInBrInstRelated(&I))) continue; 

            
            if ((!instIsInLoopBody(&I)) /*outer most loop latch & header*/ 
            || (instIsInLoopBody(&I) && (instIsInAllInstsToOneCall(&I) || instIsInBrInstRelated(&I) || phiCornerCase(&I, BB) || succIsPHIBB(BB)))) {
                auto cloneInst = builder.Insert(I.clone());
                instAdded.insert(cloneInst);
                // instMap[&I] = cloneInst;
                this->instructionClones[&I] = cloneInst;
            }

        } 
    }
    errs() << "SplitLoop: Finished cloning non-branch instructions\n";
    // errs() << "SplitLoop 724 is: " << *newLoopFunc << "\n";
    
    std::unordered_map<BasicBlock *, BasicBlock *> exitBlockToExitingBlock{};
    for (auto exit : loopStructure->getLoopExitBasicBlocks()) {
        auto exitingBlock = exit->getSinglePredecessor();
        if (exitingBlock) {
            // errs() << "exit: " << *exit << "\n";
            // errs() << "exitingBlock: " << *exitingBlock << "\n";
            exitBlockToExitingBlock[exit] = exitingBlock;
        }
    }

    errs() << "SplitLoop: Finished collecting exit branches\n";

    /*
    * Map the original loop exit blocks to themselves so in the next section the new loop
    *   will have branches to the original exits
    */
    for (auto loopExitBlock : loopStructure->getLoopExitBasicBlocks()) {
        // errs() << "loopExitBlock: " << *loopExitBlock << "\n";
        bbMap[loopExitBlock] = loopExitBlock;
    }

    /*
    * Duplicate all branch instructions (with correct successors).
    *   Cloned branches are not added to instMap because they don't produce values
    */
    // errs() << "SplitLoop 750" << "\n";

    for (auto BB : loopStructure->getBasicBlocks()) {
        // errs() << "BBBB: " << *BB << "\n";
        IRBuilder<> builder(bbMap.at(BB));
        // errs() << "SplitLoop 751" << "\n";
        auto terminator = BB->getTerminator();
        // errs() << "SplitLoop 752" << "\n";
        auto cloneTerminator = builder.Insert(terminator->clone());
        // errs() << "SplitLoop 753" << "\n";
        instAdded.insert(cloneTerminator);
        // errs() << "SplitLoop 754" << "\n";
        assert(isa<BranchInst>(terminator) && isa<BranchInst>(cloneTerminator));
        auto branch = cast<BranchInst>(terminator);
        // errs() << "SplitLoop 755" << "\n";
        auto cloneBranch = cast<BranchInst>(cloneTerminator);
        // errs() << "SplitLoop 756" << "\n";
        this->instructionClones[branch] = cloneBranch;
        // errs() << "SplitLoop 757" << "\n";
        // errs() << "brSuccSize: " << branch->getNumSuccessors() << "\n";
        // errs() << "cloneBrSuccSize: " << cloneBranch->getNumSuccessors() << "\n";
        for (unsigned idx = 0; idx < branch->getNumSuccessors(); idx++) {
            auto oldBB = branch->getSuccessor(idx);
            // errs() << "oldBB: " << *oldBB << "\n";
            // errs() << "SplitLoop 758" << "\n";
            auto newBB = bbMap.at(oldBB);
            // errs() << "SplitLoop 759" << "\n";
            // if oldBB is a loopExitBlock
            if (loopStructure->isLoopExitBlock(oldBB)) {
                // errs() << "SplitLoop 75591" << "\n";
                newBB = BasicBlock::Create(ctx, "exit", newLoopFunc);
                // errs() << "SplitLoop 7510" << "\n";
                ReturnInst::Create(ctx, nullptr, newBB);
                // errs() << "SplitLoop 7511" << "\n";
            }
            // errs() << "SplitLoop 75592" << "\n";
            // errs() << "newBB: " << *newBB << "\n";
            // if (newBB == nullptr) errs() << "newBB is nullptr\n";
            // if (cloneBranch == nullptr) errs() << "cloneBranch is nullptr, " << "branch is " << *branch << "\n";
            // errs() << "idx: " << idx <<"\n";
            cloneBranch->setSuccessor(idx, newBB);
            // errs() << "SplitLoop 7512" << "\n";
        }
    }
    // errs() << "SplitLoop 959" << "\n";
    // errs() << "SplitLoop 576 is: " << *newLoopFunc << "\n";
    auto newLoopHeader = bbMap.at(loopStructure->getHeader());
    auto newPreHeaderBranch = BranchInst::Create(newLoopHeader, this->entryBlock);
    instAdded.insert(newPreHeaderBranch);
    bbMap[loopStructure->getPreHeader()] = this->entryBlock;
    // this->exitBlock = BasicBlock::Create(ctx, "exit", newLoopFunc);
    // for (auto pair : exitBlockToExitingBlock) {
    //     auto oldExitBlock = pair.first;
    //     // errs() << "oldExitBlock: " << *oldExitBlock <<"\n";
    //     auto exitingBlock = pair.second;
    //     assert(isa<BranchInst>(exitingBlock->getTerminator()));
    //     auto exitBranch = cast<BranchInst>(exitingBlock->getTerminator());
    //     // errs() << "exitBranch is: " << *exitBranch << "\n";
    //     // auto newExitBlockBranch = BranchInst::Create(this->entryBlock, newExitBlock);
    //     // instAdded.insert(newExitBlockBranch);
    //     for (unsigned idx = 0; idx < exitBranch->getNumSuccessors(); ++idx) {
    //         if (exitBranch->getSuccessor(idx) == oldExitBlock) {
    //             // std::string oldBlockName = oldExitBlock->getName();
    //             this->exitBlock = BasicBlock::Create(ctx, "exit", newLoopFunc);
    //             ReturnInst::Create(ctx, nullptr, this->exitBlock);
    //             // errs() << "idx: " << idx <<", oldExitBlock: " << *oldExitBlock <<"\n";
    //             exitBranch->setSuccessor(idx, this->exitBlock);
    //             break;
    //         }
    //     }
    // }
    errs() << "SplitLoop: Finished stitching together the new loop CFG\n";

    // errs() << "SplitLoop 831 is: " << *newLoopFunc << "\n";
    for (auto inst : this->instructionClones) {
        auto cloneI = this->instructionClones[inst.first];

        // if (cloneI->isTerminator()) {
        //     //cast cloneI into TerminatorInst
        //     TerminatorInst * termInst = cast<TerminatorInst>(cloneI);
        //     if (termInst->getNumSuccessors() >= 2) { // means a loopheader brInst
        //         termInst->setSuccessor(0, this->newLoopBody);
        //         termInst->setSuccessor(1, this->exitBlock);
        //     }

        // }

        if (auto phi = dyn_cast<PHINode>(cloneI)) {
            for (int k = 0; k < phi->getNumIncomingValues(); k++) {
                auto incomingBB = phi->getIncomingBlock(k);
                auto newBB = bbMap.at(incomingBB);
                phi->setIncomingBlock(k, newBB);
            }
        }

        for (User::op_iterator opIt = cloneI->op_begin(); opIt != cloneI->op_end(); ++opIt) {
            auto opV = (*opIt).get();

            if (dyn_cast<Constant>(opV)) continue;

            if (isOriginalLiveInVar(opV)) {
                auto internalValue = this->getCloneOfOriginalLiveIn(opV);
                (*opIt).set(internalValue);
                continue;
            }

            //the value is not a live-in
            //if the vlaue is generate by another insturciton with the new loop
            //then set it tot the equivalent cloned instruction
            if (auto opI = dyn_cast<Instruction>(opV)) {
                if (isAnOriginalInstruction(opI)) {
                    auto cloneOpI = this->instructionClones[opI];
                    (*opIt).set(cloneOpI);
                }
            }
        }
    }
    errs() << "SplitLoop: Finished fixing instruction dependencies in the new loop\n";
    
    // errs() << "SplitLoop is: " << *newLoopFunc << "\n";

    //create wrapper function for parallelized loop task function
    std::vector<Type *> wrapperFuncArgs;
    wrapperFuncArgs.reserve(numArgs);
    
    for (int k = 0; k < numArgs; k++) {
        wrapperFuncArgs.push_back(voidStarTy);
    }

    FunctionType * wrapperFuncType = FunctionType::get(Type::getVoidTy(ctx), wrapperFuncArgs, false);
    std::string wrapperFuncName = "_spawn" + newLoopFuncName;

    //wrapper function pointer
    Function * wrapperFunc = cast<Function>(Function::Create(wrapperFuncType, Function::InternalLinkage, wrapperFuncName, this->M));
    BasicBlock * wrapperFuncEntryBB = BasicBlock::Create(ctx, "entry", wrapperFunc);

    auto& wrapperFuncArgList = wrapperFunc->getArgumentList();
    auto& newLoopFuncArgList = newLoopFunc->getArgumentList();

    std::vector<Value *> wrapperFuncCastArgs;
    for (auto newLoopFuncArgListIt = newLoopFuncArgList.begin(), wrapperFuncArgListIt = wrapperFuncArgList.begin();
    newLoopFuncArgListIt != newLoopFuncArgList.end(); ++newLoopFuncArgListIt, ++wrapperFuncArgListIt) {
        Type * tmpType = newLoopFuncArgListIt->getType();
        if (tmpType->isPointerTy()) {
            BitCastInst * bc = new BitCastInst(&*wrapperFuncArgListIt, tmpType, "", wrapperFuncEntryBB);
            wrapperFuncCastArgs.push_back(bc);
        } else {
            BitCastInst * bc = new BitCastInst(&*wrapperFuncArgListIt, PointerType::getUnqual(tmpType), "", wrapperFuncEntryBB);
            LoadInst * load = new LoadInst(bc, "", wrapperFuncEntryBB);
            wrapperFuncCastArgs.push_back(load);
        }
    }

    // add call newLoopFunc
    CallInst * callNewLoopFuncInst = CallInst::Create(newLoopFunc, wrapperFuncCastArgs, "", wrapperFuncEntryBB);
    ReturnInst::Create(ctx, nullptr, wrapperFuncEntryBB);

    //constructor of spawnable function
    genCtorForSpawn(this->M, wrapperFunc);
  

    // errs() << "wrapperFunc: " << *wrapperFunc << "\n";

    //create thread

    std::vector<Value *> needArgs = genSpawnArgs(this->M, wrapperFunc);
    errs() << "needArgSize: " << needArgs.size() << "\n";
    if (needArgs.size() != numArgs + 2) {
        errs() << ">>>Num of NeedArgs is wrong...\n";
    }

    auto ctorIt = this->ctors.find(numArgs);
    if (ctorIt == this->ctors.end()) {
        errs() << ">>> No Spawnable ctor in ctors...\n";
    }
    if (cast<Function>(ctorIt->second)->getArgumentList().size() != needArgs.size()) {
        errs() << ">>>wrong ctor in ctors..., wrong args size...\n";
    }

    
    CallInst::Create(ctorIt->second, needArgs, "", this->whereToInsertFunc);
    
    //put join points
    Value * id = needArgs[0]; 
    for (auto *point : this->joinPoints) {
        CallInst::Create(this->joinFunc, id, "", point);
    }
    
    #if 0
    //used for evalution
    // Value * id = needArgs[0]; 
    Type *i32_type = llvm::IntegerType::getInt32Ty(ctx);
    Constant *i32_val = llvm::ConstantInt::get(i32_type, 0, true);
    CallInst::Create(this->joinFunc, i32_val, "", this->whereToInsertFunc);
    #endif
    // errs() << "726 Transform module: \n";
    // errs() << *this->M << "\n";
}

void DOALLTask::setLDI(LoopDependenceInfo * LDI) {
    this->LDI = LDI;
}

void DOALLTask::setOldLoopBody(std::unordered_set<BasicBlock *> oldBBs) {
    this->oldLoopBody = oldBBs;
}

void DOALLTask::setBrInstRelated(std::unordered_set<Instruction *> instSet) {
    this->brInstRelated = instSet;
}

bool DOALLTask::instIsInLoopBody(Instruction * inst) {
    for (auto BB : this->oldLoopBody) {
        for (auto& I : *BB) {
            if (inst == &I) {
                return true;
            }
        }
    }
    return false;
}
bool DOALLTask::instIsInAllInstsToOneCall(Instruction * inst) {
    if (this->notInLoopBody.count(inst) != 0 && !IsForRelated(inst)) {
        return false;
    }

    for (auto pair : this->allInstsToOneCallInstInLoopBody) {
        
        for (auto I : pair.second) {
            
            if (I == inst) {
                
                return true;
            }
        }
        if ((pair.first == inst)) {
            return true;
        }
    }

    return false;
}

bool DOALLTask::instIsInBrInstRelated(Instruction * inst) {
    if (this->brInstRelated.count(inst) > 0) {
        return true;
    }
    return false;
}

void DOALLTask::setBitCastLiveInVarRelated(std::unordered_map<Value *, std::unordered_set<Instruction *>> bitcastMap) {
    this->bitcastLiveInVarRelated = bitcastMap;
}

bool DOALLTask::hasStoreInstInNewLoopBody(Value * liveIn) {
    for (auto pair : this->instructionClones) {
        if (isa<StoreInst>(pair.first)) {
            for (auto edge : this->LDI->getLoopPDG()->getEdges()) {
                auto fromNodeSubT = edge->getOutgoingNode()->getT();
                auto toNodeSubT = edge->getIncomingNode()->getT();

                if (cast<Instruction>(toNodeSubT) == cast<Instruction>(pair.first) ) {
                    if (edge->isMustDependence() && edge->dataDepToString() == "RAW") {
                        if (fromNodeSubT == liveIn) {
                            // means this liveInVar need init value
                            return true;
                        }
                    }
                }
            }
        }
    }
    return false;
}

void DOALLTask::setJoinFunc(Constant * joinF) {
    this->joinFunc = joinF;
}

void DOALLTask::setJoinPoints(std::unordered_set<Instruction *> joinPts) {
    this->joinPoints = joinPts;
}

bool DOALLTask::liveInNeedACMem(Value * liveIn) {
    if (this->liveInInitValue.count(liveIn) > 0) {
        return true;
    }
    return false;
}

bool DOALLTask::isLocalVarLiveIn(Value * liveIn) {
    if (this->liveInInitValue.count(liveIn) > 0 && (!this->liveInInitValue[liveIn] || isa<Constant>(this->liveInInitValue[liveIn]))) {
        return true;
    }

    if (this->bitcastLiveInVarRelated.count(liveIn) > 0) {
        for (auto related : this->bitcastLiveInVarRelated[liveIn]) {
            if (this->liveInNeedACMem(related)) {
                return true;
            }
        }
    }
    return false;
}

bool DOALLTask::usedByLLVMIntrinsic(Value * V) {
    for (auto useIt = V->use_begin(); useIt != V->use_end(); ++useIt) {
        Instruction * inst = dyn_cast<Instruction>(*useIt);
        if (isa<IntrinsicInst>(inst)) {
            return true;
        }
    }

    return false;
}

bool DOALLTask::phiCornerCase(Instruction * inst, BasicBlock * bb) {
    if (isa<PHINode>(inst) && bb->size() == 2) {
        return true;
    }

    return false;
}

bool DOALLTask::succIsPHIBB(BasicBlock * BB) {
    bool hasSuccPHIBB = false;
    auto terminator = BB->getTerminator();
    auto branch = cast<BranchInst>(terminator);
    for (unsigned idx = 0; idx < branch->getNumSuccessors(); idx++) {
        auto succBB = branch->getSuccessor(idx);
        Instruction& firstInst = succBB->front();
        if (isa<PHINode>(&firstInst)) {
            hasSuccPHIBB = true;
        }
    }

    return hasSuccPHIBB;
}

void DOALLTask::setDoNotParallelCodes(std::unordered_map<Instruction *, std::set<Instruction *>> codes) {
    this->doNotParallelCodes = codes;
}


bool DOALLTask::isDoNotParallelCodes(Instruction * inst) {
    for (auto pair : this->doNotParallelCodes) {
        
        for (auto I : pair.second) {
            
            if (I == inst) {
                return true;
            }
        }
        if (pair.first == inst) {
            return true;
        }
    }

    return false;
}

bool DOALLTask::IsForRelated(Instruction * inst) {
    BasicBlock * bb = inst->getParent();
    std::string label = bb->getName();
    if (label.find("for.inc") != label.npos) {
        return true;
    }
    return false;
    
}
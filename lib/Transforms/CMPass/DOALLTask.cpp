#include "DOALLTask.h"

DOALLTask::DOALLTask(uint32_t ID, FunctionType * funcType, Module * M) : loopSeed {std::random_device{}()} {
    this->ID = ID;
    this->M = M;
    //create empty body of the task
    //auto functionCallee = M.getOrInsertFunction("", funcType);

    // this->F = cast<Function>(M.getOrInsertFunction("zyy", funcType));
    //add the entry and the exit basic blocks
    // auto& ctx = M.getContext();
    // this->entryBlock = BasicBlock::Create(ctx, "", this->F);
    // this->exitBlock = BasicBlock::Create(ctx, "", this->F);

}

void DOALLTask::extractFuncArgs(void) {
    auto argIter = this->F->arg_begin();
    this->envArg = (Value *) &*(argIter++);
    this->coreArg = (Value *) &*(argIter++);
    this->numCoresArg = (Value *) &*(argIter++);
    this->chunkSizeArg = (Value *) &*(argIter++);
    this->instanceIndexV = this->coreArg;
}

uint32_t DOALLTask::getID(void) const {
    return this->ID;
}

Value * DOALLTask::getTaskInstanceID(void) const {
    return this->instanceIndexV;
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

std::unordered_set<Value *> DOALLTask::getOriginalLiveIns (void) const  {
    std::unordered_set<Value *> res;
    for (auto v : this->liveInClones) {
        res.insert(v.first);
    }
    return res;
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
bool DOALLTask::doesOriginalLiveOutHaveManyClones (Instruction *I) const {
    return this->liveOutClones.find(I) != this->liveOutClones.end();
}

std::unordered_set<Instruction *> DOALLTask::getClonesOfOriginalLiveOut (Instruction *I) const  {
    if (this->liveOutClones.find(I) == this->liveOutClones.end()) {
        return {};
    }

    return this->liveOutClones.at(I);
}

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
    errs() << "---addNewBB\n";
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
    errs() << "---cloneAddBB--186\n";
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

void DOALLTask::tagBasicBlockAsLastBlock (BasicBlock *bb) {
    this->lastBlocks.push_back(bb);
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
void DOALLTask::setLoopLatch(BasicBlock * loopL) {
    this->loopLatch = loopL;
}

void DOALLTask::setWhereToInsertFunc(Instruction * inst) {
    this->whereToInsertFunc = inst;
}

void DOALLTask::addLiveInVar(Value * liveIn) {
    this->liveInVars.push_back(liveIn);
}

void DOALLTask::setSafeCheckCallInstsInLoopBody(std::vector<Instruction *> checkcalls) {
    this->safeCheckCallInstsInLoopBody = checkcalls;
}
void DOALLTask::setSafeCheckInstsInLoopBody(std::unordered_map<Instruction *, std::set<Instruction *>> safecodes) {
    this->safeCheckInstsInLoopBody = safecodes;
}
void DOALLTask::setAllInstsToOneCallInstInLoopBody(std::unordered_map<Instruction *, std::set<Instruction *>> allinsts) {
    this->allInstsToOneCallInstInLoopBody = allinsts;
}

void DOALLTask::transform() {
    LLVMContext& ctx = this->M->getContext();
    //create function for loop
    int numArgs = this->liveInVars.size();
    std::vector<Type *> newLoopFuncArgs;
    newLoopFuncArgs.reserve(numArgs);
    for (int i = 0; i < numArgs; i++) {
        newLoopFuncArgs.push_back(liveInVars[i]->getType());
        errs() << "type: " << *(liveInVars[i]->getType()) << "\n";
        errs() << "name: " << (liveInVars[i]->getName()) << "\n";
    }
    FunctionType * newLoopFuncType = FunctionType::get(Type::getVoidTy(ctx), newLoopFuncArgs, false);
    std::string newLoopFuncName = "_loop_func_" + std::to_string(this->ID);

    Function * newLoopFunc = cast<Function>(Function::Create(newLoopFuncType, Function::InternalLinkage, newLoopFuncName, this->M));
    //set arg name
    int ind = 0;
    for (auto argIt = newLoopFunc->arg_begin(); argIt != newLoopFunc->arg_end(); ++argIt, ++ind) {
        argIt->setName(liveInVars[ind]->getName());
    }
    //create loop entry block
    this->entryBlock = BasicBlock::Create(ctx, "entry", newLoopFunc);

    // add bitcast in prehead --- entry block
    IRBuilder<> loopPreHeader(this->entryBlock);
    // for (auto var : this->liveInVars) {
    //     auto bcInst = new BitCastInst{var, var->getType(), "", this->entryBlock};
    //     loopPreHeader.Insert(bcInst);
    //     // this->instructionClones[cast<Instruction>(var)] = bcInst;
    //     this->liveInClones[var] = bcInst; 
    // }
    int ix = 0;
    for (auto argIt = newLoopFunc->arg_begin(); argIt != newLoopFunc->arg_end(); ++argIt, ++ix) {
        auto bcInst = new BitCastInst{&*argIt, liveInVars[ix]->getType(), "", this->entryBlock};
        loopPreHeader.Insert(bcInst);
        this->liveInClones[liveInVars[ix]] = bcInst; 
    }


    //fulfill the loop header
    this->newLoopHeader = BasicBlock::Create(ctx, "header", newLoopFunc);
    this->addBasicBlock(this->loopHeader, this->newLoopHeader);
    IRBuilder<> loopHeaderBuilder(this->newLoopHeader);
    ICmpInst * loopHeaderICMPInst;
    BranchInst * loopHeaderBrInst;
    for (auto& I : *this->loopHeader) {
        if (isa<BranchInst>(I)) loopHeaderBrInst = cast<BranchInst>(&I);
        if (isa<ICmpInst>(I)) loopHeaderICMPInst = cast<ICmpInst>(&I);
        auto cloneI = loopHeaderBuilder.Insert(I.clone());
        this->instructionClones[&I] = cloneI;
    }   
    std::string newLoopBodyLabel = loopHeaderBrInst->getSuccessor(0)->getName();
    std::string newLoopExitLabel = loopHeaderBrInst->getSuccessor(1)->getName();
    // errs() << "brInst Successor 0: " << loopHeaderBrInst->getSuccessor(0)->getName() << "\n";
    //directly jump from xx to xx
    BranchInst::Create(this->newLoopHeader, this->entryBlock); // entry ---> header
    
    // fulfill the loop body 
    this->newLoopBody = BasicBlock::Create(ctx, newLoopBodyLabel, newLoopFunc);
    
    IRBuilder<> loopBodyBuilder(this->newLoopBody);
    std::unordered_map<Instruction *, std::set<Instruction *>>::iterator iterAll;
    // safe_check :-> bitcast = ; bitcast = xx; %x = load xx;
    for (iterAll = this->allInstsToOneCallInstInLoopBody.begin(); iterAll != this->allInstsToOneCallInstInLoopBody.end(); ++iterAll) {
        for (auto I : iterAll->second) {
            auto cloneI = loopBodyBuilder.Insert(I->clone());
            this->instructionClones[I] = cloneI;
        }
        auto cloneII = loopBodyBuilder.Insert(iterAll->first->clone());
        this->instructionClones[iterAll->first] = cloneII;
    }

    // fulfill the loop latch
    this->newLoopLatch = BasicBlock::Create(ctx, "latch", newLoopFunc);
    this->addBasicBlock(this->loopLatch, this->newLoopLatch);
    IRBuilder<> loopLatchBuilder(this->newLoopLatch);
    for (auto& I : *this->loopLatch) {
        if (isa<BranchInst>(I)) continue;
        auto cloneI = loopLatchBuilder.Insert(I.clone());
        this->instructionClones[&I] = cloneI;
    }
    BranchInst::Create(this->newLoopLatch, this->newLoopBody); // body->latch
    BranchInst::Create(this->newLoopHeader, this->newLoopLatch); // latch -> header
    

    //create loop exit block --- ret void
    this->exitBlock = BasicBlock::Create(ctx, newLoopExitLabel, newLoopFunc);
    ReturnInst::Create(ctx, nullptr, this->exitBlock);
    // BranchInst::Create(this->newLoopBody, this->exitBlock, loopHeaderICMPInst, this->newLoopHeader); // header -> body or exit
    



    errs() << "naive function: " << "\n";
    errs() << *newLoopFunc << "\n";


    //adjust values dataflow
    for (auto inst : this->instructionClones) {
        auto cloneI = this->instructionClones[inst.first];

        if (cloneI->isTerminator()) {
            //cast cloneI into TerminatorInst
            TerminatorInst * termInst = cast<TerminatorInst>(cloneI);
            if (termInst->getNumSuccessors() >= 2) { // means a loopheader brInst
                termInst->setSuccessor(0, this->newLoopBody);
                termInst->setSuccessor(1, this->exitBlock);
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

    // for (auto pair : this->liveInClones) {
    //     auto cloneI = cast<Instruction>(pair.first);
    //     cloneI->removeFromParent();
    // }

    errs() << "after adjust dataflow: " << "\n";
    errs() << *newLoopFunc << "\n";




    
    //create wrapper function
    std::vector<Type *> wrapperFuncArgs;
    wrapperFuncArgs.reserve(numArgs);
    Type * voidStarTy = PointerType::getUnqual(Type::getInt8Ty(ctx));
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

    //no need to consider join

    //create thread

    std::vector<Value *> needArgs = genSpawnArgs(this->M, wrapperFunc);

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
    errs() << "Transform module: \n";
    errs() << *this->M << "\n";
    //erase check codes , not original codes
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
        Type * liveInType = liveIn->getType();
        Value * castArg;
        if (this->liveInInitValue.count(liveIn) > 0) {
            //need alloca and store 
            // AllocaInst * tmpAcInst = cast<AllocaInst>(liveIn);
            // errs() << "tmpAcInst: Op 0: " << *tmpAcInst->getOperand(0) << "\n";
            castArg = new AllocaInst(this->liveInInitValue[liveIn]->getType(), "", this->whereToInsertFunc);
            new StoreInst(this->liveInInitValue[liveIn], castArg, this->whereToInsertFunc);
        } else {
            //just need to bitcast
            if (liveInType->isPointerTy()) {
                castArg = liveIn;
            } else {
                castArg = new AllocaInst(liveInType, "", this->whereToInsertFunc);
                new StoreInst(liveIn, castArg, this->whereToInsertFunc);
            }
        }
        BitCastInst * bcInst = new BitCastInst(castArg, voidStarTy, "", this->whereToInsertFunc);
        args.push_back(bcInst);
    }


    return args;
}

void DOALLTask::eraseSafeCheckCodes() {
    //the code in safeCheckInstsInLoopBody should be erase
    for (auto pair : this->safeCheckInstsInLoopBody) {
        for (auto inst : pair.second) {
            inst->eraseFromParent();
        }
        pair.first->eraseFromParent();
    }

    errs() << "Final module: \n";
    errs() << *this->M << "\n";
}
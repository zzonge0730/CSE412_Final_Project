#include "DOALLTask.h"
#include "llvm/IR/Function.h" // For FunctionCallee
#include "llvm/IR/DataLayout.h" // For DataLayout
#include "llvm/ADT/SmallVector.h" // For SmallVector
#include <algorithm>

DOALLTask::DOALLTask(uint32_t ID, FunctionType * funcType, Module * M) : loopSeed(std::random_device()()) {
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

bool DOALLTask::hasLiveInVar(Value * liveIn) const {
    return std::find(this->liveInVars.begin(), this->liveInVars.end(), liveIn) != this->liveInVars.end();
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

void DOALLTask::genCtorForSpawn(Module * M, Function * wrapperFunc, unsigned ctorKey) {
    LLVMContext& ctx = this->M->getContext();
    uint32_t baseArgsForCtorSpawn = 2;
    std::vector<Type *> ctorSig(baseArgsForCtorSpawn);
    ctorSig[0] = Type::getInt32Ty(ctx);

    Type * voidStarTy = PointerType::get(ctx, 0);

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

    
    // LLVM 14: getArgumentList() → arg_size()
    for (int t = 0; t <= (int)wrapperFunc->arg_size(); ++t) {
        if (t == (int)wrapperFunc->arg_size()) {
            ctorSig[1] = PointerType::get(ctx, 0);
            FunctionType * ctorTy = FunctionType::get(Type::getVoidTy(ctx), ctorSig, false);
            // LLVM 14: getOrInsertFunction()는 FunctionCallee를 반환, getCallee()로 Constant* 얻기
            FunctionCallee ctorCallee = this->M->getOrInsertFunction(ctorName, ctorTy);
            this->ctors[ctorKey] = cast<Constant>(ctorCallee.getCallee());
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
    PointerType * voidPtrType = PointerType::get(ctx, 0);
    Type * voidStarTy = voidPtrType;

    std::vector<Value *> args{ConstantInt::get(Type::getInt32Ty(ctx), std::uniform_int_distribution<uint32_t>{}(this->loopSeed)), wrapperFunc};
    std::vector<Value *> packedLiveIns;
    packedLiveIns.reserve(this->liveInVars.size());
    for (auto liveIn : this->liveInVars) {
        // errs() << "592Inst: " << *liveIn << "\n";
        Type * liveInType = liveIn->getType();
        Value * castArgForNew;
        // 
        // filter liveInvars which are needed alloca memory and bitcast related
        if (this->isLocalVarLiveIn(liveIn)) continue;
        if (liveInType->isPointerTy()) {
            //just need to bitcast
            castArgForNew = liveIn;
            // errs() << "--622\n";
        } else {
            // LLVM 14: AllocaInst 생성자 변경 - InsertBefore는 별도로 설정
            castArgForNew = new AllocaInst(liveInType, 0, "ya_", this->whereToInsertFunc);
            new StoreInst(liveIn, castArgForNew, this->whereToInsertFunc);
            // errs() << "--626\n";
        }
        // errs() << "castArgForNew: " << *castArgForNew <<"\n";
        BitCastInst * bcInst = new BitCastInst(castArgForNew, voidStarTy, "yy_", this->whereToInsertFunc);
        packedLiveIns.push_back(bcInst);
    }

    Value *envPtrValue = ConstantPointerNull::get(voidPtrType);
    if (!packedLiveIns.empty()) {
        // Use malloc instead of alloca to prevent use-after-return in async tasks
        Type *sizeT = Type::getInt64Ty(ctx);
        FunctionCallee mallocFunc = this->M->getOrInsertFunction("malloc", 
            FunctionType::get(PointerType::get(ctx, 0), {sizeT}, false));

        uint64_t totalBytes = packedLiveIns.size() * 8; // Assuming 64-bit pointers
        Value *sizeVal = ConstantInt::get(sizeT, totalBytes);

        // Call malloc
        CallInst *envMalloc = CallInst::Create(mallocFunc, {sizeVal}, "cm_spawn_env_malloc", this->whereToInsertFunc);

        for (unsigned idx = 0; idx < packedLiveIns.size(); ++idx) {
            Value *idxVal = ConstantInt::get(Type::getInt32Ty(ctx), idx);
            // GEP needs element type (voidStarTy is i8* or opaque)
            Value *slotPtr = GetElementPtrInst::Create(voidStarTy, envMalloc, idxVal, "cm_spawn_slot", this->whereToInsertFunc);
            new StoreInst(packedLiveIns[idx], slotPtr, this->whereToInsertFunc);
        }
        envPtrValue = envMalloc;
    }

    args.push_back(envPtrValue);
    errs() << "argsize: " << args.size() << "\n";

    return args;
}

namespace {
void eraseInstructionSafely(Instruction *Inst) {
    if (Inst == nullptr) return;
    if (!Inst->use_empty()) {
        if (!Inst->getType()->isVoidTy()) {
            Inst->replaceAllUsesWith(UndefValue::get(Inst->getType()));
        } else {
            SmallVector<User *, 4> Users(Inst->user_begin(), Inst->user_end());
            for (auto *U : Users) {
                if (Instruction *UserInst = dyn_cast<Instruction>(U)) {
                    eraseInstructionSafely(UserInst);
                }
            }
        }
    }
    Inst->dropAllReferences();
    Inst->eraseFromParent();
}
}

void DOALLTask::eraseSafeCheckCodes() {

    //adjust data flows in original loops for MoveC
    for (auto p : this->safeCheckInstsInLoopBody) {
        if (p.second.size() == 0) continue;
        if (CallInst * CI = dyn_cast<CallInst>(p.first)) {
            StringRef funcName = CI->getCalledFunction()->getName();
            Instruction * from = nullptr;
            ConstantInt * subscript = nullptr;
            if (funcName.equals("_RV_check_dpv_ss") ||
                funcName.equals("_RV_check_dpc_ss") ||
                funcName.equals("__RV_check_dpv_ss") ||
                funcName.equals("__RV_check_dpc_ss")) {
                for (auto i : p.second) {
                    if (i->getType() == Type::getInt64Ty(this->M->getContext())) {
                        from = i;
                        break;
                    }
                }

                //get constant value
                if (!from) {
                    //_RV_check_dpv_ss getOp(2)
                    if (funcName.equals("_RV_check_dpv_ss") || funcName.equals("__RV_check_dpv_ss")) {
                        subscript = dyn_cast<ConstantInt>(CI->getArgOperand(2));
                        
                    } else if (funcName.equals("_RV_check_dpc_ss") || funcName.equals("__RV_check_dpc_ss")) {
                        //_RV_check_dpc_ss getOp(3)
                        subscript = dyn_cast<ConstantInt>(CI->getArgOperand(3));
                       
                    }
                    
                }

            } else if (funcName.equals("_RV_check_dpv") || funcName.equals("__RV_check_dpv")) {
                for (auto inst : p.second) {
                    if ((inst->getType()->isPointerTy()) && (isa<BitCastInst>(inst) || isa<LoadInst>(inst) || isa<GetElementPtrInst>(inst))) {
                        from = inst;
                        break;
                    }
                }

            }

            if (from) {
                // errs() << "719 from: " << *from << "\n";
                //find the use of CI and change dataflow
                // errs() << "718 CI: " << *CI << "\n";
                std::unordered_set<Instruction *> cachedInstUse;
                // Copy users to a vector to avoid iterator invalidation
                std::vector<User*> users(CI->user_begin(), CI->user_end());
                for (auto use : users) {
                    Instruction * instUse = dyn_cast<Instruction>(use);
                    if (!instUse) continue;
                    if (cachedInstUse.count(instUse) > 0) continue;
                    cachedInstUse.insert(instUse);
                    // errs() << "instUse: " << *instUse << "\n";
                    for (User::op_iterator opIt = instUse->op_begin(); opIt != instUse->op_end(); ++opIt) {
                        auto opV = (*opIt).get();

                        if (auto opI = dyn_cast<Instruction>(opV) ) {
                            // errs() << "--710--" << *opI << "\n";
                            if (opI == CI) {
                                (*opIt).set(from);
                            }
                            
                        }
                    }
                }
            } else {
                if (subscript) {
                    // errs() << "755 CI: " << *CI << "\n";
                    // errs() << "756 subscript: " << *subscript << "\n";
                    std::unordered_set<Instruction *> cachedInstUse;
                    // Copy users to a vector to avoid iterator invalidation
                    std::vector<User*> users(CI->user_begin(), CI->user_end());
                    for (auto use : users) {
                        // if (cachedInstUse.size() >= 1) break; // This break seems logic dependent, keeping it for now if needed, but vector copy handles invalidation.
                        Instruction * instUse = dyn_cast<Instruction>(use);
                        if (instUse == nullptr) continue;
                        if (cachedInstUse.count(instUse) > 0) continue;
                        cachedInstUse.insert(instUse);
                        // errs() << "instUse: " << *instUse << "\n";
                        for (User::op_iterator opIt = instUse->op_begin(); opIt != instUse->op_end(); ++opIt) {
                            auto opV = (*opIt).get();

                            if (auto opI = dyn_cast<Instruction>(opV) ) {
                                // errs() << "--710--" << *opI << "\n";
                                if (opI == CI) {
                                    (*opIt).set(subscript);
                                }
                                
                            }
                        }
                    }
                }
            }


        }
    }



    //the code in safeCheckInstsInLoopBody should be erase
    std::unordered_set<Instruction*> toErased;
    for (auto pair : this->safeCheckInstsInLoopBody) { 
        // if call ret value is used by _RV_pmd_cp_pmd_ret, do not erase
        bool usedByFlag = false;
        if (CallInst * ci = dyn_cast<CallInst>(pair.first)) {
            for (auto useIt = ci->use_begin(); useIt != ci->use_end(); ++useIt) {
                if (CallInst * useCall = dyn_cast<CallInst>(useIt->getUser())) { // Correctly access user
                    Function * calledF = useCall->getCalledFunction();
                    if (calledF) {
                        StringRef useCallName = calledF->getName();
                        if (useCallName.equals("_RV_pmd_cp_pmd_ret") || useCallName.equals("_RV_memcpy")) {
                            usedByFlag = true;
                        }
                    }
                }
            }
        }
        if (usedByFlag) continue;
        

        for (auto inst : pair.second) {
            
            if (isOriginalInst(inst)) continue;
            // for movec
            if (CallInst * CI = dyn_cast<CallInst>(pair.first)) {
                StringRef funcName = CI->getCalledFunction()->getName();
                if (funcName.equals("_RV_check_dpv_ss") ||
                    funcName.equals("_RV_check_dpc_ss") ||
                    funcName.equals("__RV_check_dpv_ss") ||
                    funcName.equals("__RV_check_dpc_ss")) {
                    if (inst->getType() == Type::getInt64Ty(this->M->getContext()) || 
                    isa<LoadInst>(inst)) {
                        //  errs() << "--751--\n";
                        continue;
                    }
                } else if (funcName.equals("_RV_check_dpv") || funcName.equals("__RV_check_dpv")) {
                    // errs() << "--755--\n";
                    continue;
                }
            }
            toErased.insert(inst);
        }
        toErased.insert(pair.first);
    }

    std::unordered_set<Instruction*> eraseSet(toErased.begin(), toErased.end());

    for (auto inst : toErased) {
            //do not erase these codes in source program
        if (this->notInLoopBody.count(inst) != 0) continue;
        if (!this->instIsInLoopBody(inst)) continue;
        if (isa<AllocaInst>(inst)) continue;
        
        bool externalUse = false;
        for (User *U : inst->users()) {
            if (auto *UI = dyn_cast<Instruction>(U)) {
                if (eraseSet.count(UI) == 0) {
                    externalUse = true;
                    break;
                }
            } else {
                externalUse = true;
                break;
            }
        }
        if (externalUse) continue;
        
        eraseInstructionSafely(inst);
    }

    // errs() << "Final module: \n";
    // errs() << *this->M << "\n";
}

bool DOALLTask::isOriginalInst(Instruction * inst) {
    if (isa<GetElementPtrInst>(inst)) return true;
    if (usedByLLVMIntrinsic(inst)) return true;
    if (isa<LoadInst>(inst)) {
        Value * val = cast<LoadInst>(inst)->getPointerOperand();
        // LLVM 14: StringRef → string 변환
        std::string valName = val->getName().str();
        // errs() << "714Name: " << valName << "\n";
        if (valName.find("base.load") == std::string::npos
        && valName.find("bound.load") == std::string::npos
        && valName.find("key.load") == std::string::npos
        && valName.find("lock.load") == std::string::npos) { // if find one
            return true;
        }
    }

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
    Type * voidStarTy = PointerType::get(ctx, 0);
    
    std::vector<Value *> nonLocalLiveIn;
    for (auto livein : this->liveInVars) {
        if (this->isLocalVarLiveIn(livein)) continue;
        nonLocalLiveIn.push_back(livein); 
        // errs() << "nonLocaLiveIn : " << *livein << "\n";
    }

    int numArgs = nonLocalLiveIn.size();
    std::vector<Type *> newLoopFuncArgs;
    newLoopFuncArgs.reserve(numArgs);
    for (int i = 0; i < numArgs; i++) {
        newLoopFuncArgs.push_back(nonLocalLiveIn[i]->getType());
        // errs() << "type: " << *(liveInVars[i]->getType()) << "\n";
        // errs() << "name: " << (liveInVars[i]->getName()) << "\n";
    }

    FunctionType * newLoopFuncType = FunctionType::get(Type::getVoidTy(ctx), newLoopFuncArgs, false);
    std::string newLoopFuncName = "_loop_func_" + std::to_string(this->ID);

    Function * newLoopFunc = cast<Function>(Function::Create(newLoopFuncType, Function::InternalLinkage, newLoopFuncName, this->M));
    //set arg name
    int ind = 0;
    for (auto argIt = newLoopFunc->arg_begin(); argIt != newLoopFunc->arg_end(); ++argIt, ++ind) {
        argIt->setName(nonLocalLiveIn[ind]->getName());
    }
    this->entryBlock = BasicBlock::Create(ctx, "entry", newLoopFunc);

    // errs() << "SplitLoop 740" << "\n";
    //prepare var in entry block
    std::unordered_map<Value *, Value *> liveInForNewLiveIn;
    std::unordered_map<Value *, std::pair<Value *, Value *>> newBase_BoundForNewAlloca;
    for (auto liveIn : this->liveInVars) {
        if (this->liveInNeedACMem(liveIn)) {
            if (!this->liveInInitValue[liveIn]) {
                //init value is null
                // p
                // errs() << "---548 " << *liveIn << "\n";
                if (AllocaInst * acInst = dyn_cast<AllocaInst>(liveIn)) {
                    // LLVM 14: AllocaInst 생성자 변경 - address space 명시 (0 = default)
                    Value * castArg = new AllocaInst(acInst->getAllocatedType(), 0, "zyyac_", this->entryBlock);
                    // errs() << "---552\n";
                    AllocaInst * allocaInst = cast<AllocaInst>(castArg);
                    // errs() << "---554\n";
                    unsigned num_operands = allocaInst->getNumOperands();
                    PointerType* ptr_type = PointerType::get(allocaInst->getAllocatedType(), 0);
                    Type * ty1 = ptr_type;
                    BitCastInst * ptr = new BitCastInst(castArg, ty1, "zyyacptr_", this->entryBlock);
                    // errs() << "---559\n";
                    //p base
                    Value * ptr_base = new BitCastInst(ptr, voidStarTy, "zyybitcast", this->entryBlock);
                    // errs() << "---562\n";
                    //p bound
                    Value * int_bound;
                    if (num_operands == 0) {
                        // LLVM 14: Module::getPointerSize() 제거됨, DataLayout 사용
                        DataLayout DL(this->M);
                        unsigned ptrSize = DL.getPointerSizeInBits(0); // address space 0
                        if (ptrSize == 64) {
                            int_bound = ConstantInt::get(Type::getInt64Ty(ctx), 1, false);
                        } else {
                            int_bound = ConstantInt::get(Type::getInt32Ty(ctx), 1, false);
                        }
                    } else {
                        int_bound = allocaInst->getOperand(0);
                    }
                    // LLVM 14: GetElementPtrInst::Create() API 변경 - 타입과 indices 필요
                    SmallVector<Value*, 1> indices = { int_bound };
                    GetElementPtrInst * gep = GetElementPtrInst::Create(
                        allocaInst->getAllocatedType(), ptr, indices, "zyytmp", this->entryBlock);
                    Value * bound_ptr = gep;
                    Value * ptr_bound = new BitCastInst(bound_ptr, voidStarTy, "zyybitcast", this->entryBlock);
                    liveInForNewLiveIn[liveIn] = castArg;
                    newBase_BoundForNewAlloca[castArg] = std::make_pair(ptr_base, ptr_bound);
                    // errs() << "---573\n";
                }
            } else if (isa<Constant>(this->liveInInitValue[liveIn])) {
                //init value is constant value
                // LLVM 14: AllocaInst 생성자 변경
                Value * ac = new AllocaInst(this->liveInInitValue[liveIn]->getType(), 0, "zyac_", this->entryBlock);
                new StoreInst(this->liveInInitValue[liveIn], ac, this->entryBlock);

                liveInForNewLiveIn[liveIn] = ac;

                AllocaInst * allocaInst = cast<AllocaInst>(ac);
                unsigned num_operands = allocaInst->getNumOperands();
                PointerType* ptr_type = PointerType::get(allocaInst->getAllocatedType(), 0);
                Type * ty1 = ptr_type;
                BitCastInst * ptr = new BitCastInst(ac, ty1, "zyacptr_", this->entryBlock);
                //p base
                Value * ptr_base = new BitCastInst(ptr, voidStarTy, "zybitcast", this->entryBlock);
                //p bound
                Value * int_bound;
                if (num_operands == 0) {
                    // LLVM 14: Module::getPointerSize() 제거됨, DataLayout 사용
                    DataLayout DL(this->M);
                    unsigned ptrSize = DL.getPointerSizeInBits(0); // address space 0
                    if (ptrSize == 64) {
                        int_bound = ConstantInt::get(Type::getInt64Ty(ctx), 1, false);
                    } else {
                        int_bound = ConstantInt::get(Type::getInt32Ty(ctx), 1, false);
                    }
                } else {
                    int_bound = allocaInst->getOperand(0);
                }
                // LLVM 14: GetElementPtrInst::Create() API 변경
                SmallVector<Value*, 1> indices = { int_bound };
                GetElementPtrInst * gep = GetElementPtrInst::Create(
                    allocaInst->getAllocatedType(), ptr, indices, "zyytmp", this->entryBlock);
                Value * bound_ptr = gep;
                Value * ptr_bound = new BitCastInst(bound_ptr, voidStarTy, "zybitcast", this->entryBlock);
                newBase_BoundForNewAlloca[ac] = std::make_pair(ptr_base, ptr_bound);

            } else { 
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
                    // LLVM 14: AllocaInst 생성자 변경
                    Value * ac = new AllocaInst(acInst->getAllocatedType(), 0, "zac_", this->entryBlock);

                    // LLVM 14: LoadInst 생성자 변경 - 타입 명시 필요
                    LoadInst * load = new LoadInst(acInst->getAllocatedType(), arg, "zyl_", this->entryBlock);
                    
                    // errs() << "--825---\n";
                    new StoreInst(load, ac, this->entryBlock);

                    liveInForNewLiveIn[liveIn] = ac;

                    AllocaInst * allocaInst = cast<AllocaInst>(ac);
                    unsigned num_operands = allocaInst->getNumOperands();
                    PointerType* ptr_type = PointerType::get(allocaInst->getAllocatedType(), 0);
                    Type * ty1 = ptr_type;
                    BitCastInst * ptr = new BitCastInst(ac, ty1, "zacptr_", this->entryBlock);
                    //p base
                    Value * ptr_base = new BitCastInst(ptr, voidStarTy, "zbitcast", this->entryBlock);
                    //p bound
                    Value * int_bound;
                    if (num_operands == 0) {
                        // LLVM 14: Module::getPointerSize() 제거됨, DataLayout 사용
                        DataLayout DL(this->M);
                        unsigned ptrSize = DL.getPointerSizeInBits(0); // address space 0
                        if (ptrSize == 64) {
                            int_bound = ConstantInt::get(Type::getInt64Ty(ctx), 1, false);
                        } else {
                            int_bound = ConstantInt::get(Type::getInt32Ty(ctx), 1, false);
                        }
                    } else {
                        int_bound = allocaInst->getOperand(0);
                    }
                    // LLVM 14: GetElementPtrInst::Create() API 변경
                    SmallVector<Value*, 1> indices = { int_bound };
                    GetElementPtrInst * gep = GetElementPtrInst::Create(
                        allocaInst->getAllocatedType(), ptr, indices, "ztmp", this->entryBlock);
                    Value * bound_ptr = gep;
                    Value * ptr_bound = new BitCastInst(bound_ptr, voidStarTy, "zbitcast", this->entryBlock);
                    newBase_BoundForNewAlloca[ac] = std::make_pair(ptr_base, ptr_bound);

                    
                }


            }
        }
    }
    // errs() << "SplitLoop 811" << "\n";
    IRBuilder<> loopPreHeader(this->entryBlock);
    // create bitcast inst for localLiveIn var in the entry block
    for (auto liveIn : this->liveInVars) {
        if (this->isLocalVarLiveIn(liveIn)) {
            Value * argForNew;
            if (this->bitcastLiveInVarRelated.count(liveIn) > 0) {
                for (auto related : this->bitcastLiveInVarRelated[liveIn]) {
                    if (liveInForNewLiveIn.count(related) > 0) {
                        // errs() << "related: " << *related << "\n";
                        Value * newAllocaInst = liveInForNewLiveIn[related];
                        // errs() << "--599" << *newAllocaInst << "\n";
                        std::pair<Value *, Value *> base_bound = newBase_BoundForNewAlloca[newAllocaInst];
                        // errs() << "-603\n";
                        // LLVM 14: StringRef → string 변환
                        std::string pointerName = cast<BitCastInst>(liveIn)->getOperand(0)->getName().str();
                        
                        if (pointerName.find("mtmp") != std::string::npos) {
                            argForNew = base_bound.second;
                        } else {
                            argForNew = base_bound.first;
                        }
                        // errs() << "--603: " << *castArgForNew <<  "\n";
                        break;
                    }

                }
            } else {
                argForNew = liveInForNewLiveIn[liveIn];
            }
            auto bcInst = CastInst::Create(Instruction::BitCast, argForNew, liveIn->getType());
            loopPreHeader.Insert(bcInst);
            this->liveInClones[liveIn] = bcInst; 

        } else if (this->liveInNeedACMem(liveIn)) {// needACMem and load variable init
            Value * argForNew;
            argForNew = liveInForNewLiveIn[liveIn];
            auto bcInst = CastInst::Create(Instruction::BitCast, argForNew, liveIn->getType());
            loopPreHeader.Insert(bcInst);
            this->liveInClones[liveIn] = bcInst; 
        }
    }
    // errs() << "SplitLoop 845" << "\n";
    int ix = 0;
    for (auto argIt = newLoopFunc->arg_begin(); argIt != newLoopFunc->arg_end(); ++argIt, ++ix) {
        //alloca memory for those liveInVars which are needed bitcast related
        if (this->liveInNeedACMem(nonLocalLiveIn[ix])) continue;
        auto bcInst = CastInst::Create(Instruction::BitCast, &*argIt, nonLocalLiveIn[ix]->getType());
        loopPreHeader.Insert(bcInst);
        this->liveInClones[nonLocalLiveIn[ix]] = bcInst; 
    }
    // std::unordered_map<Instruction *, Instruction *> instMap{};
    std::unordered_map<BasicBlock *, BasicBlock *> bbMap{};
    std::set<Instruction *> instAdded{};

    // errs() << "SplitLoop 701" << "\n";

    //clone Instructions in the parallelized loop task
    for (auto BB : loopStructure->getBasicBlocks()) {
        // LLVM 14: StringRef → string 변환
        std::string label = BB->getName().str();
        auto cloneBB = BasicBlock::Create(ctx, label, newLoopFunc);
        bbMap[BB] = cloneBB;
        IRBuilder<> builder(cloneBB);
        for (auto& I : *BB) {
            if (isa<BranchInst>(&I)) continue;
            auto cloneInst = builder.Insert(I.clone());
            instAdded.insert(cloneInst);
            this->instructionClones[&I] = cloneInst;
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
                if (internalValue->getType() != opV->getType()) {
                    if (internalValue->getType()->isIntegerTy() && opV->getType()->isIntegerTy()) {
                        unsigned srcBits = internalValue->getType()->getIntegerBitWidth();
                        unsigned dstBits = opV->getType()->getIntegerBitWidth();
                        if (srcBits < dstBits) {
                            internalValue = new ZExtInst(internalValue, opV->getType(), "", cloneI);
                        } else if (srcBits > dstBits) {
                            internalValue = new TruncInst(internalValue, opV->getType(), "", cloneI);
                        }
                    }
                }
                (*opIt).set(internalValue);
                continue;
            }

            //the value is not a live-in
            //if the vlaue is generate by another insturciton with the new loop
            //then set it tot the equivalent cloned instruction
            if (auto opI = dyn_cast<Instruction>(opV)) {
                if (isAnOriginalInstruction(opI)) {
                    auto cloneOpI = this->instructionClones[opI];
                    if (cloneOpI->getType() != opI->getType()) {
                         if (cloneOpI->getType()->isIntegerTy() && opI->getType()->isIntegerTy()) {
                            unsigned srcBits = cloneOpI->getType()->getIntegerBitWidth();
                            unsigned dstBits = opI->getType()->getIntegerBitWidth();
                            if (srcBits < dstBits) {
                                cloneOpI = new ZExtInst(cloneOpI, opI->getType(), "", cloneI);
                            } else if (srcBits > dstBits) {
                                cloneOpI = new TruncInst(cloneOpI, opI->getType(), "", cloneI);
                            }
                        }
                    }
                    (*opIt).set(cloneOpI);
                }
            }
        }
    }
    errs() << "SplitLoop: Finished fixing instruction dependencies in the new loop\n";
    
    // errs() << "SplitLoop is: " << *newLoopFunc << "\n";

    //create wrapper function for parallelized loop task function
    std::vector<Type *> wrapperFuncArgs(1, voidStarTy);

    FunctionType * wrapperFuncType = FunctionType::get(Type::getVoidTy(ctx), wrapperFuncArgs, false);
    std::string wrapperFuncName = "_spawn" + newLoopFuncName;

    //wrapper function pointer
    Function * wrapperFunc = cast<Function>(Function::Create(wrapperFuncType, Function::InternalLinkage, wrapperFuncName, this->M));
    BasicBlock * wrapperFuncEntryBB = BasicBlock::Create(ctx, "entry", wrapperFunc);

    // LLVM 14: getArgumentList() → args()
    auto envArgIt = wrapperFunc->arg_begin();
    Type * voidPtrPtrTy = PointerType::get(voidStarTy, 0);
    Value * envBase = new BitCastInst(&*envArgIt, voidPtrPtrTy, "cm_env_base", wrapperFuncEntryBB);

    std::vector<Value *> wrapperFuncCastArgs;
    unsigned wrapperIdx = 0;
    for (auto newLoopFuncArgIt = newLoopFunc->arg_begin();
        newLoopFuncArgIt != newLoopFunc->arg_end(); ++newLoopFuncArgIt, ++wrapperIdx) {
        Type * tmpType = newLoopFuncArgIt->getType();
        Value * idxVal = ConstantInt::get(Type::getInt32Ty(ctx), wrapperIdx);
        Value * slotPtr = GetElementPtrInst::Create(voidStarTy, envBase, idxVal, "cm_env_slot", wrapperFuncEntryBB);
        Value * rawPtr = new LoadInst(voidStarTy, slotPtr, "", wrapperFuncEntryBB);
        if (tmpType->isPointerTy()) {
            BitCastInst * bc = new BitCastInst(rawPtr, tmpType, "", wrapperFuncEntryBB);
            wrapperFuncCastArgs.push_back(bc);
        } else {
            BitCastInst * bc = new BitCastInst(rawPtr, PointerType::get(tmpType, 0), "", wrapperFuncEntryBB);
            LoadInst * load = new LoadInst(tmpType, bc, "", wrapperFuncEntryBB);
            wrapperFuncCastArgs.push_back(load);
        }
    }

    // add call newLoopFunc
    CallInst * callNewLoopFuncInst = CallInst::Create(newLoopFunc, wrapperFuncCastArgs, "", wrapperFuncEntryBB);
    ReturnInst::Create(ctx, nullptr, wrapperFuncEntryBB);

    //constructor of spawnable function
    genCtorForSpawn(this->M, wrapperFunc, numArgs);
  

    // errs() << "wrapperFunc: " << *wrapperFunc << "\n";

    //create thread

    std::vector<Value *> needArgs = genSpawnArgs(this->M, wrapperFunc);
    errs() << "needArgSize: " << needArgs.size() << "\n";
    if (needArgs.size() != 3) {
        errs() << ">>>Num of NeedArgs is wrong...\n";
    }

    auto ctorIt = this->ctors.find(numArgs);
    if (ctorIt == this->ctors.end()) {
        errs() << ">>> No Spawnable ctor in ctors...\n";
    }
    // LLVM 14: getArgumentList() → arg_size()
    if (cast<Function>(ctorIt->second)->arg_size() != needArgs.size()) {
        errs() << ">>>wrong ctor in ctors..., wrong args size...\n";
    }

    
    // LLVM 14: CallInst::Create() API 변경 - FunctionCallee 사용
    FunctionCallee ctorCallee(cast<Function>(ctorIt->second));
    CallInst::Create(ctorCallee, needArgs, "", this->whereToInsertFunc);
    
    //put join points
    Value * id = needArgs[0]; 
    // LLVM 14: CallInst::Create() API 변경 - FunctionCallee 사용
    FunctionCallee joinCallee(cast<Function>(this->joinFunc));
    for (auto *point : this->joinPoints) {
        CallInst::Create(joinCallee, {id}, "", point);
    }
    
    #if 0
    //used for evalution
    // Value * id = needArgs[0]; 
    Type *i32_type = llvm::IntegerType::getInt32Ty(ctx);
    Constant *i32_val = llvm::ConstantInt::get(i32_type, 0, true);
    // LLVM 14: CallInst::Create() API 변경 - FunctionCallee 사용
    FunctionCallee joinCallee2(cast<Function>(this->joinFunc));
    CallInst::Create(joinCallee2, {i32_val}, "", this->whereToInsertFunc);
    #endif
    // errs() << "Transform module: \n";
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
        // LLVM 14: StringRef → string 변환
        std::string label = bb->getName().str();
    if (label.find("for.inc") != label.npos) {
        return true;
    }
    return false;
    
}
#include "LoopFreeTask.h"
// LLVM 14: Utils.h에 선언된 유틸리티 함수들 사용
#include "Utils.h"
#include "llvm/ADT/SmallVector.h"

LoopFreeTask::LoopFreeTask(uint32_t id, Module * m) : loopFreeSeed(std::random_device()()) {
    this->ID = id;
    this->M = m;
    this->subID = 0;
    this->mergedirection = 0;
}

void LoopFreeTask::setSafeCheckCodesForOneTask(std::vector<Instruction *> insts) {
    this->safeCheckCodeForOneTask = insts;
}

void LoopFreeTask::setInfo(std::set<Instruction *> safeCheckBody) {
    this->safeCheckInstsInNonLoopBody = safeCheckBody;
}

void LoopFreeTask::setJoinPoint(Instruction * taskJP) {
    this->taskJoinPoint = taskJP;
}

void LoopFreeTask::setJoinFunc(Constant * joinF) {
    this->joinFunc = joinF;
}

void LoopFreeTask::setCreatePt(Instruction * startPt) {
    this->multiCheckStartPt = startPt;
}

void LoopFreeTask::transform() {

    SafeCheckTobeMerged();
    
}

namespace {
void eraseInstructionSafelyLF(Instruction *Inst) {
    if (Inst == nullptr) return;
    if (!Inst->use_empty()) {
        if (!Inst->getType()->isVoidTy()) {
            Inst->replaceAllUsesWith(UndefValue::get(Inst->getType()));
        } else {
            SmallVector<User *, 4> Users(Inst->user_begin(), Inst->user_end());
            for (auto *U : Users) {
                if (Instruction *UserInst = dyn_cast<Instruction>(U)) {
                    eraseInstructionSafelyLF(UserInst);
                }
            }
        }
    }
    Inst->dropAllReferences();
    Inst->eraseFromParent();
}
}

void LoopFreeTask::eraseSafeCheckCodes() {
    if (this->safeCheckCodeForOneTask.size() == 0) return;

    // //erase safeCheckCodeForOneTask
    // for (auto inst : this->safeCheckCodeForOneTask) {
    //     inst->eraseFromParent();
    // }
    
    //adjust data flow for movec, before earse safecheck inst
    //get all instruction used by safechecks, for movec,; no such tedious work for softboundcets
    for (auto check : this->safeCheckCodeForOneTask) {
        if (CallInst * CI = dyn_cast<CallInst>(check) ) {
            StringRef funcName = CI->getCalledFunction()->getName();
            Instruction * from = nullptr;
            ConstantInt * subscript = nullptr;
            if (funcName.equals("_RV_check_dpv") || funcName.equals("__RV_check_dpv")) {
                from = dyn_cast<Instruction>(CI->getArgOperand(1));

                std::unordered_set<Instruction *> cachedInstUse;
                // Copy users to a vector to avoid iterator invalidation
                std::vector<User*> users(CI->user_begin(), CI->user_end());
                for (auto use : users) {
                    // if (cachedInstUse.size() >= 1) break;
                    Instruction * instUse = dyn_cast<Instruction>(use);
                    if (instUse == nullptr) continue;
                    if (cachedInstUse.count(instUse) > 0) continue;
                    cachedInstUse.insert(instUse);
                    
                    for (User::op_iterator opIt = instUse->op_begin(); opIt != instUse->op_end(); ++opIt) {
                            auto opV = (*opIt).get();

                            if (auto opI = dyn_cast<Instruction>(opV) ) {
                                if (opI == CI) {
                                    (*opIt).set(from);
                                }
                                
                            }
                    }
                }
            } else if (funcName.equals("_RV_check_dpv_ss") || funcName.equals("__RV_check_dpv_ss")) {
                subscript = dyn_cast<ConstantInt>(CI->getArgOperand(2));

                std::unordered_set<Instruction *> cachedInstUse;
                // Copy users to a vector to avoid iterator invalidation
                std::vector<User*> users(CI->user_begin(), CI->user_end());
                for (auto use : users) {
                    // if (cachedInstUse.size() >= 1) break;
                    Instruction * instUse = dyn_cast<Instruction>(use);
                    if (instUse == nullptr) continue;
                    if (cachedInstUse.count(instUse) > 0) continue;
                    cachedInstUse.insert(instUse);
                    
                    for (User::op_iterator opIt = instUse->op_begin(); opIt != instUse->op_end(); ++opIt) {
                            auto opV = (*opIt).get();

                            if (auto opI = dyn_cast<Instruction>(opV) ) {
                                if (opI == CI) {
                                    (*opIt).set(subscript);
                                }
                                
                            }
                    }
                }
            } else if (funcName.equals("_RV_check_dpc") || funcName.equals("__RV_check_dpc")) {
                from = dyn_cast<Instruction>(CI->getArgOperand(2));

                std::unordered_set<Instruction *> cachedInstUse;
                // Copy users to a vector to avoid iterator invalidation
                std::vector<User*> users(CI->user_begin(), CI->user_end());
                for (auto use : users) {
                    // if (cachedInstUse.size() >= 1) break;
                    Instruction * instUse = dyn_cast<Instruction>(use);
                    if (instUse == nullptr) continue;
                    if (cachedInstUse.count(instUse) > 0) continue;
                    cachedInstUse.insert(instUse);
                    
                    for (User::op_iterator opIt = instUse->op_begin(); opIt != instUse->op_end(); ++opIt) {
                            auto opV = (*opIt).get();

                            if (auto opI = dyn_cast<Instruction>(opV) ) {
                                if (opI == CI) {
                                    (*opIt).set(from);
                                }
                                
                            }
                    }
                }
            } else if (funcName.equals("_RV_check_dpc_ss") || funcName.equals("__RV_check_dpc_ss")) {
                subscript = dyn_cast<ConstantInt>(CI->getArgOperand(3));

                std::unordered_set<Instruction *> cachedInstUse;
                // Copy users to a vector to avoid iterator invalidation
                std::vector<User*> users(CI->user_begin(), CI->user_end());
                for (auto use : users) {
                    // if (cachedInstUse.size() >= 1) break;
                    Instruction * instUse = dyn_cast<Instruction>(use);
                    if (instUse == nullptr) continue;
                    if (cachedInstUse.count(instUse) > 0) continue;
                    cachedInstUse.insert(instUse);
                    
                    for (User::op_iterator opIt = instUse->op_begin(); opIt != instUse->op_end(); ++opIt) {
                            auto opV = (*opIt).get();

                            if (auto opI = dyn_cast<Instruction>(opV) ) {
                                if (opI == CI) {
                                    (*opIt).set(subscript);
                                }
                                
                            }
                    }
                }
            }
        }
    }


    for (auto inst : this->safeCheckCodeForOneTask) {
        eraseInstructionSafelyLF(inst);
    }
}

void LoopFreeTask::SafeCheckTobeMerged() {
    LLVMContext& ctx = this->M->getContext();
    std::vector<Instruction *> checksGroup = this->safeCheckCodeForOneTask;
    Instruction * locToInsertBefore = nullptr;
    if (checksGroup.size() <= 2) {
        if (this->mergedirection == 0 || this->mergedirection == 2) {
            locToInsertBefore = checksGroup[0];
        } else {
            locToInsertBefore = checksGroup[1];
        }
    } else {
        locToInsertBefore = this->multiCheckStartPt;
    }

    

    Type * voidStarTy = PointerType::getUnqual(Type::getInt8Ty(ctx));
    PointerType * voidPtrPtrTy = PointerType::getUnqual(voidStarTy);
    std::vector<Type *> wrapperFuncArgs(1, voidStarTy);
    std::vector<Function *> checkFuncVec;

    std::string wrapperFuncName = "_spawn_loop_free_func_" + std::to_string(this->ID) + "_" + std::to_string(this->subID++);

    uint32_t totalNumArgs = 0;
    for (auto check : checksGroup) {
        CallInst * call = cast<CallInst>(check);
        Function * fun = call->getCalledFunction();

        // LLVM 14: getArgumentList() 제거됨, args() 사용
        totalNumArgs += fun->arg_size();

        checkFuncVec.push_back(fun);
    }

    FunctionType * wrapperFuncType = FunctionType::get(Type::getVoidTy(ctx), wrapperFuncArgs, false);

    Function * wrapperFunc = cast<Function>(Function::Create(wrapperFuncType, Function::InternalLinkage, wrapperFuncName, this->M));
    BasicBlock * entryBB = BasicBlock::Create(ctx, "entry", wrapperFunc);

    auto envArgIt = wrapperFunc->arg_begin();
    Value * envBase = new BitCastInst(&*envArgIt, voidPtrPtrTy, "lf_env_base", entryBB);
    unsigned envIndex = 0;

    for (int idx = 0; idx < checkFuncVec.size(); idx++) {
        std::vector<Value *> groupedCastArgs;
        for (auto argIt = checkFuncVec[idx]->arg_begin(); argIt != checkFuncVec[idx]->arg_end(); ++argIt, ++envIndex) {
            Type * tmpType = argIt->getType();
            Value * idxVal = ConstantInt::get(Type::getInt32Ty(ctx), envIndex);
            Value * slotPtr = GetElementPtrInst::Create(voidStarTy, envBase, idxVal, "lf_env_slot", entryBB);
            Value * rawPtr = new LoadInst(voidStarTy, slotPtr, "", entryBB);

            if (tmpType->isPointerTy()) {
                BitCastInst * bitcast = new BitCastInst(rawPtr, tmpType, "", entryBB);
                groupedCastArgs.push_back(bitcast);     
            } else {
                BitCastInst * bitcast = new BitCastInst(rawPtr, PointerType::getUnqual(tmpType), "", entryBB);
                // LoadInst * load = new LoadInst(bitcast, "", entryBB);
                Type * destTy = Type::getInt64Ty(ctx);
                if (tmpType->isIntegerTy(8)) {
                    destTy = Type::getInt8Ty(ctx);
                } else if (tmpType->isIntegerTy(16)) {
                    destTy = Type::getInt16Ty(ctx);
                } else if (tmpType->isIntegerTy(32)) {
                    destTy = Type::getInt32Ty(ctx);
                }
                
                Value * tmpCast = CastInst::Create(Instruction::PtrToInt, bitcast, destTy, "zt_", entryBB);
                groupedCastArgs.push_back(tmpCast);     
            }
        }

        // LLVM 14: CallInst::Create() API 변경 - FunctionCallee 사용
        FunctionCallee funcCallee(checkFuncVec[idx]);
        CallInst * callInst = CallInst::Create(funcCallee, groupedCastArgs, "", entryBB);

    }

    ReturnInst::Create(ctx, nullptr, entryBB);
    genCtorForSpawn(wrapperFunc, totalNumArgs);

    // errs() << "loop-free wrapperFunc: " << *wrapperFunc << "\n";

    //create thread

    std::vector<Value *> needArgs = genSpawnArgs(checksGroup, wrapperFunc);
    errs() << "needArgSize: " << needArgs.size() << "\n";
    if (needArgs.size() != 3) {
        errs() << ">>>Num of NeedArgs is wrong...\n";
    }

    auto ctorIt = this->ctors.find(totalNumArgs);
    if (ctorIt == this->ctors.end()) {
        errs() << ">>> No Spawnable ctor in ctors...\n";
    }
    // LLVM 14: getArgumentList() 제거됨
    Function *ctorFunc = cast<Function>(ctorIt->second);
    if (ctorFunc->arg_size() != needArgs.size()) {
        errs() << ">>>wrong ctor in ctors..., wrong args size...\n";
    }

    // LLVM 14: CallInst::Create() API 변경 - FunctionCallee 사용
    FunctionCallee ctorCallee(ctorFunc);
    CallInst::Create(ctorCallee, needArgs, "", locToInsertBefore);
    
    //put join points
    Value * id = needArgs[0]; 

    //corner case 
    //if taskjoinpoint happens before safecheck task, reset the last bb instruction as jointpoint
    if (instHappensBefore(this->taskJoinPoint, locToInsertBefore)) {
        this->taskJoinPoint = &(*(--locToInsertBefore->getParent()->end()));//the second last
    }
    // LLVM 14: CallInst::Create() API 변경 - FunctionCallee 사용
    if (this->joinFunc) {
        Function *joinFunc = cast<Function>(this->joinFunc);
        FunctionCallee joinCallee(joinFunc);
        CallInst::Create(joinCallee, {id}, "", this->taskJoinPoint);
    }



}

void LoopFreeTask::genCtorForSpawn(Function * wrapperFunc, unsigned ctorKey) {
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

    
    // LLVM 14: getArgumentList() 제거됨
    uint32_t argCount = wrapperFunc->arg_size();
    for (int t = 0; t <= argCount; ++t) {
        if (t == argCount) {
            ctorSig[1] = PointerType::getUnqual(FunctionType::get(Type::getVoidTy(ctx), ctorArgs, false));
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
std::vector<Value *> LoopFreeTask::genSpawnArgs(std::vector<Instruction *> checksGroup, Function * wrapperFunc) {
    LLVMContext& ctx = this->M->getContext();
    PointerType * voidPtrType = PointerType::getUnqual(Type::getInt8Ty(ctx));
    Type * voidStarTy = voidPtrType;

    std::vector<Value *> args{ConstantInt::get(Type::getInt32Ty(ctx), std::uniform_int_distribution<uint32_t>{}(this->loopFreeSeed)), wrapperFunc};
    std::vector<Value *> packedArgs;

    for (int ind = 0; ind < checksGroup.size(); ind++) {
        CallInst * curCI = cast<CallInst>(checksGroup[ind]);
        for (int j = 0; j < (int)curCI->arg_size(); j++) {
            Value * arg = curCI->getArgOperand(j);
            Type * argTy = arg->getType();
            Value * castArg;
            if (argTy->isPointerTy()) {
                castArg = arg;
            } else {
                castArg = CastInst::Create(Instruction::IntToPtr, arg, voidStarTy, "zyarg_", curCI);
            }
            BitCastInst * bcInst = new BitCastInst(castArg, voidStarTy, "zybc_", curCI);
            packedArgs.push_back(bcInst);
        }
    }

    Value *envPtrValue = ConstantPointerNull::get(voidPtrType);
    Instruction *insertBefore = checksGroup.empty() ? wrapperFunc->getEntryBlock().getTerminator() : checksGroup.front();
    if (!packedArgs.empty()) {
        ArrayType *arrTy = ArrayType::get(voidStarTy, packedArgs.size());
        IRBuilder<> envBuilder(insertBefore);
        AllocaInst *envAlloca = envBuilder.CreateAlloca(arrTy, nullptr, "lf_spawn_env");
        for (unsigned idx = 0; idx < packedArgs.size(); ++idx) {
            Value *idxVals[] = {
                ConstantInt::get(Type::getInt32Ty(ctx), 0),
                ConstantInt::get(Type::getInt32Ty(ctx), idx)
            };
            Value *slotPtr = envBuilder.CreateInBoundsGEP(arrTy, envAlloca, idxVals, "lf_spawn_slot");
            envBuilder.CreateStore(packedArgs[idx], slotPtr);
        }
        envPtrValue = envBuilder.CreateBitCast(envAlloca, voidStarTy, "lf_spawn_env_ptr");
    }

    args.push_back(envPtrValue);
    return args;
}

void LoopFreeTask::setMergeDirection(int direction) {
    this->mergedirection = direction;
}


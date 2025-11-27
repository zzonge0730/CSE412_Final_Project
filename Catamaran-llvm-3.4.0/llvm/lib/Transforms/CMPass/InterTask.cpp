#include "InterTask.h"

char InterTask::ID = 0;
static RegisterPass<InterTask> X("InterTask", "InterTask Parallel in the program");

InterTask::InterTask() : ModulePass(ID), taskSeed(std::random_device()()) {
    this->id = 0;
}
InterTask::~InterTask() {

}

void InterTask::getAnalysisUsage(AnalysisUsage &AU) const {
    AU.setPreservesAll();
}

bool InterTask::runOnModule(Module &M) {
    
    
    this->mo = &M;
    LLVMContext& ctx = this->mo->getContext();
    joinFunc = generateJoin();
    std::vector<CallInst *> CIToBeSpawned;
    //filter some functions
    for (auto &F : M) {
        if (F.isDeclaration()) continue;
        if (movecLibFunction.count(F.getName())) continue;
        if (!IsConsideredFunForInterTask(F)) continue;
        // for lbm
        // if (!F.getName().equals("LBM_performStreamCollide")) continue; 
        for (auto &BB : F) {
            for (auto &I : BB) {
                if (CallInst * CI = dyn_cast<CallInst>(&I)) {
                    // if (IsIntraTaskConsideredForSB(CI)) {
                    //     CIToBeSpawned.push_back(CI);
                    // }
                    if (IsIntraTaskConsideredForMC(CI)) {
                        CIToBeSpawned.push_back(CI);
                    }
                }
            }
        }
    }

    // errs() << "CIToBeSpawned Size: " << CIToBeSpawned.size() << "\n";

    BasicBlock * lastBasicBlock = nullptr;

    for (auto *CI : CIToBeSpawned) {

        std::vector<Type *> wrapperFuncArgs;

        std::string wrapperFuncName = "_spawn_intra_" + std::to_string(this->id++);
        Function * fun = CI->getCalledFunction();
        uint32_t totalNumArgs = fun->getArgumentList().size();
        wrapperFuncArgs.reserve(totalNumArgs);
        
        Type * voidStarTy = PointerType::getUnqual(Type::getInt8Ty(ctx));
        for (int i = 0; i < totalNumArgs; i++) {
            wrapperFuncArgs.push_back(voidStarTy);
        }

        FunctionType * wrapperFuncType = FunctionType::get(Type::getVoidTy(ctx), wrapperFuncArgs, false);

        Function * wrapperFunc = cast<Function>(Function::Create(wrapperFuncType, Function::LinkOnceAnyLinkage, wrapperFuncName, this->mo));
        BasicBlock * entryBB = BasicBlock::Create(ctx, "entry", wrapperFunc);

        auto& wrapperFuncArgList = wrapperFunc->getArgumentList();
        auto wrapperFuncArgListIt = wrapperFuncArgList.begin();
        auto& funcArgList = fun->getArgumentList();
        std::vector<Value *> castArgs;
        for (auto argListIt = funcArgList.begin(); argListIt != funcArgList.end(); ++argListIt, ++wrapperFuncArgListIt) {
            Type * tmpType = argListIt->getType();

            if (tmpType->isPointerTy()) {
                BitCastInst * bitcast = new BitCastInst(&*wrapperFuncArgListIt, tmpType, "", entryBB);
                castArgs.push_back(bitcast);     
            } else {
                //for temporal check
                // std::string funcName = fun->getName();
                BitCastInst * bitcast = new BitCastInst(&*wrapperFuncArgListIt, PointerType::getUnqual(tmpType), "", entryBB);
                // if (funcName.find("_temporal_") != funcName.npos) {
                    
                //     LoadInst * load = new LoadInst(bitcast, "", entryBB);
                //     castArgs.push_back(load);     
                // }
                // //for spatial check
                // if (funcName.find("_spatial_") != funcName.npos) {
                //     Type * destTy = Type::getInt64Ty(ctx);
                //     Value * tmpCast = CastInst::Create(Instruction::PtrToInt, bitcast, destTy, "zt_", entryBB);
                //     castArgs.push_back(tmpCast);   
                // }
                Type * destTy = Type::getInt64Ty(ctx);
                if (tmpType->isIntegerTy(8)) {
                    destTy = Type::getInt8Ty(ctx);
                } else if (tmpType->isIntegerTy(16)) {
                    destTy = Type::getInt16Ty(ctx);
                } else if (tmpType->isIntegerTy(32)) {
                    destTy = Type::getInt32Ty(ctx);
                }
                
                Value * tmpCast = CastInst::Create(Instruction::PtrToInt, bitcast, destTy, "zt_", entryBB);
                castArgs.push_back(tmpCast);   

            }
        }

        CallInst * callInst = CallInst::Create(fun, castArgs, "", entryBB);
        ReturnInst::Create(ctx, nullptr, entryBB);
        genCtorForSpawn(wrapperFunc);
        
        //create thread
        std::vector<Value *> needArgs = genSpawnArgs(CI, wrapperFunc);
        // errs() << "needArgSize: " << needArgs.size() << "\n";
        if (needArgs.size() != totalNumArgs + 2) {
            errs() << ">>>Num of NeedArgs is wrong...\n";
        }

        auto ctorIt = this->ctors.find(totalNumArgs);
        if (ctorIt == this->ctors.end()) {
            errs() << ">>> No Spawnable ctor in ctors...\n";
        }
        if (cast<Function>(ctorIt->second)->getArgumentList().size() != needArgs.size()) {
            errs() << ">>>wrong ctor in ctors..., wrong args size...\n";
        }

        CallInst::Create(ctorIt->second, needArgs, "", CI);

        Value * id = needArgs[0];
    
        //considering for intra task
        //join point naively set right before the last inst of the basicblock 
        Instruction * joinPoint = &(*(--CI->getParent()->end()));
        BasicBlock * curBB = nullptr;
        auto bbList = &(CI->getParent()->getParent()->getBasicBlockList());
        for (auto bb = bbList->rbegin(); bb != bbList->rend(); bb++) {
            for (Instruction& inst : *bb) {
                if (isa<ReturnInst>(&inst)) {   
                    joinPoint = &(*((*bb).getFirstInsertionPt()));
                    curBB = CI->getParent();
                    break;
                }
            }
            if (curBB != nullptr) break;
        }
        // Instruction * joinPoint = getNextInstruction(CI, CI->getParent());
        if (curBB != lastBasicBlock) {
            lastBasicBlock = curBB;
            CallInst::Create(this->joinFunc, id, "", joinPoint);
        }
        
        //for SB
        // CI->eraseFromParent();
        //for MC
        StringRef funcName = CI->getCalledFunction()->getName();
        Instruction * from = nullptr;
        Instruction * subscript = nullptr;
        if (funcName.equals("_RV_check_dpv_ss")) {
            // errs() << "---is here188--->>>\n";
            subscript = dyn_cast<Instruction>(CI->getArgOperand(2));
            if (ConstantInt * val = dyn_cast<ConstantInt>(CI->getArgOperand(2))) {
                Constant * ct = ConstantInt::get(IntegerType::getInt64Ty(ctx), val->getValue());
                std::unordered_set<Instruction *> cachedInstUse;
                for (auto useIt = CI->use_begin(); useIt != CI->use_end(); ++useIt) {
                    if (cachedInstUse.size() >= 1) break;
                    Instruction * instUse = dyn_cast<Instruction>(*useIt);
                    if (instUse == nullptr) continue;
                    if (cachedInstUse.count(instUse) > 0) continue;
                    cachedInstUse.insert(instUse);
                    for (User::op_iterator opIt = instUse->op_begin(); opIt != instUse->op_end(); ++opIt) {
                        auto opV = (*opIt).get();
                        if (auto opI = dyn_cast<Instruction>(opV) ) {
                            // errs() << "--710--" << *opI << "\n";
                            if (opI == CI) {
                                (*opIt).set(ct);
                            }
                            
                        }
                    }
                }
            } else {
                std::unordered_set<Instruction *> cachedInstUse;
                for (auto useIt = CI->use_begin(); useIt != CI->use_end(); ++useIt) {
                    if (cachedInstUse.size() >= 1) break;
                    Instruction * instUse = dyn_cast<Instruction>(*useIt);
                    if (instUse == nullptr) continue;
                    if (cachedInstUse.count(instUse) > 0) continue;
                    cachedInstUse.insert(instUse);
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
        } else if (funcName.equals("_RV_check_dpc_ss")) {
            // errs() << "---is here188--->>>\n";
            subscript = dyn_cast<Instruction>(CI->getArgOperand(3));
            if (ConstantInt * val = dyn_cast<ConstantInt>(CI->getArgOperand(3))) {
                Constant * ct = ConstantInt::get(IntegerType::getInt64Ty(ctx), val->getValue());
                std::unordered_set<Instruction *> cachedInstUse;
                for (auto useIt = CI->use_begin(); useIt != CI->use_end(); ++useIt) {
                    if (cachedInstUse.size() >= 1) break;
                    Instruction * instUse = dyn_cast<Instruction>(*useIt);
                    if (instUse == nullptr) continue;
                    if (cachedInstUse.count(instUse) > 0) continue;
                    cachedInstUse.insert(instUse);
                    for (User::op_iterator opIt = instUse->op_begin(); opIt != instUse->op_end(); ++opIt) {
                        auto opV = (*opIt).get();
                        if (auto opI = dyn_cast<Instruction>(opV) ) {
                            // errs() << "--710--" << *opI << "\n";
                            if (opI == CI) {
                                (*opIt).set(ct);
                            }
                            
                        }
                    }
                }
            } else {
                std::unordered_set<Instruction *> cachedInstUse;
                for (auto useIt = CI->use_begin(); useIt != CI->use_end(); ++useIt) {
                    if (cachedInstUse.size() >= 1) break;
                    Instruction * instUse = dyn_cast<Instruction>(*useIt);
                    if (instUse == nullptr) continue;
                    if (cachedInstUse.count(instUse) > 0) continue;
                    cachedInstUse.insert(instUse);
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
        } else if (funcName.equals("_RV_check_dpv")) {
            from = dyn_cast<Instruction>(CI->getArgOperand(1));
        }

        if (from) {
                //find the use of CI and change dataflow
                std::unordered_set<Instruction *> cachedInstUse;
                // errs() << "---is here169--->>>\n";
                for (auto useIt = CI->use_begin(); useIt != CI->use_end(); ++useIt) {
                    Instruction * instUse = dyn_cast<Instruction>(*useIt);
                    if (cachedInstUse.count(instUse) > 0) continue;
                    cachedInstUse.insert(instUse);
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
        }
        CI->eraseFromParent();
    }
    // errs() << *this->mo << "\n";
    errs() << "InterTask::runOnModule...successfully exit\n";
    return true;
}

Constant * InterTask::generateJoin() {
    LLVMContext& ctx = this->mo->getContext();
    Type * ty = Type::getInt32Ty(ctx);
    FunctionType * joinFuncType = FunctionType::get(Type::getVoidTy(ctx), ty, false);
    Constant * join = this->mo->getOrInsertFunction("_Z4joinj", joinFuncType);
    return join;
}

void InterTask::genCtorForSpawn(Function * wrapperFunc) {
    LLVMContext& ctx = this->mo->getContext();
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
            this->ctors[t] = this->mo->getOrInsertFunction(ctorName, ctorTy);
        }

        ctorSig.push_back(voidStarTy);
        //extend the name
        s2 += ( t == 0 ? "" : deltaS2);
        s4 += ( t == 0 ? "" : deltaS4);

        ctorName = s0 + s1 + s2 + s3 + s4 + s5;
        ctorArgs.push_back(voidStarTy);
    }
}

std::vector<Value *> InterTask::genSpawnArgs( CallInst * CI, Function * wrapperFunc) {
    LLVMContext& ctx = this->mo->getContext();
    Type * voidStarTy = PointerType::getUnqual(Type::getInt8Ty(ctx));

    //need #include "llvm/IR/IntrinsicInst.h"
    std::vector<Value *> args{
        ConstantInt::get(Type::getInt32Ty(ctx), 
        std::uniform_int_distribution<uint32_t>{}(this->taskSeed)), wrapperFunc};

    for (int j = 0; j < CI->getNumArgOperands(); j++) {
        Value * arg = CI->getArgOperand(j);
        // errs() << "argis: " << *arg << "\n";
        Type * argTy = arg->getType();
        Value * castArg;
        if (argTy->isPointerTy()) {
            castArg = arg;
        } else {
            // Instruction *argInst = cast<Instruction>(arg);
            // if (isa<LoadInst>(argInst)) {
            //     LoadInst * loadtmp = cast<LoadInst>(argInst);
            //     castArg = loadtmp->getPointerOperand();
            //     // errs() << "castArgis: " << *castArg << "\n";
            // } else {
            //     // castArg = new AllocaInst(argTy, "zyarg_", CI);
            //     // new StoreInst(arg, castArg, CI);
            //     std::string varName = "zypt_" + std::to_string(this->id++);
            //     castArg = CastInst::Create(Instruction::IntToPtr, arg, voidStarTy, varName, CI);
            // }
            std::string varName = "zypt_" + std::to_string(this->id++);
            castArg = CastInst::Create(Instruction::IntToPtr, arg, voidStarTy, varName, CI);

        }
        BitCastInst * bcInst = new BitCastInst(castArg, voidStarTy, "zybc_", CI);

        args.push_back(bcInst);
    }

    return args;
}
    
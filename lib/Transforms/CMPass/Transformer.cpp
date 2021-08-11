#include "Transformer.h"

#include "llvm/IR/User.h"
#include "llvm/ADT/ilist.h"
#include "llvm/IR/Function.h"

#include <algorithm>
#include <vector>
#include <set>
#include <map>
#include <string>

using namespace llvm;

char Transformer::ID = 0;

static RegisterPass<Transformer> X("ParallelTransformer", "Transform sequential codes into parallel code");

Transformer::Transformer() : ModulePass{ID}, seed{ std::random_device{}()} {

}

Transformer::~Transformer() {
    ctors.clear();
}

void Transformer::releaseMemory() {
    ctors.clear();
}

void Transformer::getAnalysisUsage(AnalysisUsage &AU) const {
    AU.addRequired<DecisionMaker>();
    AU.setPreservesAll();
}

bool Transformer::runOnModule(Module &M) {
    errs() << "runOnModule Transformer...\n";

    DecisionMaker& dm = getAnalysis<DecisionMaker>();
    LLVMContext& c = M.getContext();

    std::set<Function *> setOfSpawnableFuncs;
    std::map<Function *, Function *> funcMapToSpawnableFuncs;

    //get all calls are fit for spawning, mainly safe check calls

    for (auto *F : dm.getFuncToBeSpawned()) {
        errs() << "Generating Spawnable Fun for Function: " << F->getName() << "()\n";
        // LLVMContext& context = F->getContext();
        const bool returnsValIsNotVoidType = (F->getReturnType() != Type::getVoidTy(c)); // ---zyy--- Type::VoidTyID , c or context
        auto& funcArgList = F->getArgumentList();

        //create the new function signature with F's arglist length, plus 1 for ret
        const auto numArgs = returnsValIsNotVoidType ? funcArgList.size() + 1 : funcArgList.size();

        std::vector<Type *> newFuncArgs;
        newFuncArgs.reserve(numArgs);

        //construct a void * type
        Type * const voidStarTy = PointerType::getUnqual(Type::getInt8Ty(c));//---zyy-- may should change c or context
        
        for (int i = 0; i < numArgs; i++) {
            newFuncArgs.push_back(voidStarTy);
        }

        FunctionType * newFuncType = FunctionType::get(Type::getVoidTy(c), newFuncArgs, false); // c or context
        std::string newFuncName = "_Spawnable_" + F->getName().str();

        //add a new function to M
        Function * spawnableFunc = cast<Function>(Function::Create(newFuncType, Function::InternalLinkage, newFuncName, &M));
        BasicBlock * BB = BasicBlock::Create(c, "entry", spawnableFunc); // c or context
    
        auto& spawnableFuncArgList = spawnableFunc->getArgumentList();
        
        //cast  all of spawnable function args to origin Function args
        std::vector<Value *> castArgs;
        for (auto funcArgListIt = funcArgList.begin(), spawnableFuncArgListIt = spawnableFuncArgList.begin();
         funcArgListIt != funcArgList.end(); ++funcArgListIt, ++spawnableFuncArgListIt) {
             Type * tmpType = funcArgListIt->getType();

             errs() << "Dealing with argument of type: " << *tmpType << "\n";
             //check if tmpType is a pointer type; if not , need to do a load
             if (tmpType->isPointerTy()) { //TODO: need more handle operation
                 BitCastInst * bitcast = new BitCastInst(&*spawnableFuncArgListIt, tmpType, "", BB);
                 castArgs.push_back(bitcast);
             } else {
                 BitCastInst * bitcast = new BitCastInst(&*spawnableFuncArgListIt, PointerType::getUnqual(tmpType), "", BB);
                 LoadInst * load = new LoadInst(bitcast, "", BB);
                 castArgs.push_back(load);
             }
        }

        //add call original function
        CallInst * callInst = CallInst::Create(F, castArgs, "", BB);
        if (returnsValIsNotVoidType) {
            errs() << "Dealing with return of type :" << *F->getReturnType() << "\n";
            BitCastInst * bitcast = new BitCastInst(&spawnableFuncArgList.back(), PointerType::getUnqual(F->getReturnType()), "", BB);
            StoreInst * store = new StoreInst(callInst, bitcast, BB);
        }
        ReturnInst::Create(c, nullptr, BB);

        errs() << "spawnableFunc: ----\n" << *spawnableFunc << "\n";
        funcMapToSpawnableFuncs[F] = spawnableFunc;
        setOfSpawnableFuncs.insert(spawnableFunc);
    }


    // std::set<Function *> setOfGroupedSpawnableFuncs;
    // std::map<std::pair<std::vector<CallInst *>, uint32_t>, Function *> groupFuncMapToGroupedSpawnableFuncs;
    // //get all safe check merged calls for spawanableFunc
    // for (auto groupPair : dm.getSafeCheckToBeMergedGroup()) {
    //     errs() << "Grouped Spawnable Function Generatation...\n";
    //     // uint32_t direction = groupPair.second;
    //     std::vector<CallInst *> checksGroup = groupPair.first;

    //     std::vector<bool> retValIsNotVoidTypeVec;
    //     // std::vector<Function::ArgumentListType&> argListVec;
    //     std::string groupedFuncName = "_Spawnable_";
    //     std::vector<Type *> groupedFuncArgs;
    //     std::vector<Function *> checkFuncVec;
    //     uint32_t totalNumArgs = 0;
    //     for (auto check : checksGroup) {
    //         errs() << "222call: " << *check << "\n";
    //         Function * fun = check->getCalledFunction();
    //         groupedFuncName += fun->getName().split('_').second.split('_').second.split('_').second.split('_').first.str() + "_";

    //         bool retValIsNotVoidTypeItem = (fun->getReturnType() != Type::getVoidTy(c));
    //         retValIsNotVoidTypeVec.push_back(retValIsNotVoidTypeItem);

    //         auto& funcArgListTmp = fun->getArgumentList();
    //         // argListVec.push_back(funcArgList);

    //         totalNumArgs += (retValIsNotVoidTypeItem ? funcArgListTmp.size() + 1 : funcArgListTmp.size());

    //         checkFuncVec.push_back(fun);
    //     }

    //     groupedFuncArgs.reserve(totalNumArgs);
    //     Type * const voidStarTy = PointerType::getUnqual(Type::getInt8Ty(c));
    //     for (int i = 0; i < totalNumArgs; i++) {
    //         groupedFuncArgs.push_back(voidStarTy);
    //     }
    //     FunctionType * groupedFuncType = FunctionType::get(Type::getVoidTy(c), groupedFuncArgs, false);

    //     Function * groupedSpawnableFunc = cast<Function>(Function::Create(groupedFuncType, Function::InternalLinkage, groupedFuncName, &M));
    //     BasicBlock * BB = BasicBlock::Create(c, "entry", groupedSpawnableFunc);

    //     auto& groupedSpawnableFuncArgList = groupedSpawnableFunc->getArgumentList();        
    //     auto groupedSpawnableFuncArgListIt = groupedSpawnableFuncArgList.begin();

        
    //     for (int ind = 0; ind < checkFuncVec.size(); ++ind) {
    //         auto& funcArgList = checkFuncVec[ind]->getArgumentList();
    //         std::vector<Value *> groupedCastArgs;
    //         for (auto argListIt = funcArgList.begin(); argListIt != funcArgList.end(); ++argListIt, ++groupedSpawnableFuncArgListIt ) {
    //             Type * tmpType = argListIt->getType();

    //             if (tmpType->isPointerTy()) {
    //                 BitCastInst * bitcast = new BitCastInst(&*groupedSpawnableFuncArgListIt, tmpType, "", BB);
    //                 groupedCastArgs.push_back(bitcast);
    //             } else {
    //                 BitCastInst * bitcast = new BitCastInst(&*groupedSpawnableFuncArgListIt, PointerType::getUnqual(tmpType), "", BB);
    //                 LoadInst * load = new LoadInst(bitcast, "", BB);
    //                 groupedCastArgs.push_back(load);
    //             }
    //         }

    //         //add call original function
    //         CallInst * callInst = CallInst::Create(checkFuncVec[ind], groupedCastArgs, "", BB);
    //         if (retValIsNotVoidTypeVec[ind]) {
    //             //TODO: not sure "&spawnableFuncArgList.back()" corresponding to ""
    //             BitCastInst * bitcast = new BitCastInst(&*groupedSpawnableFuncArgListIt, PointerType::getUnqual(checkFuncVec[ind]->getReturnType()) , "" , BB);
    //             StoreInst * store = new StoreInst(callInst, bitcast, BB);
    //             groupedSpawnableFuncArgListIt++;
    //         }

    //     }


    //     ReturnInst::Create(c, nullptr, BB);

    //     //map
    //     errs() << "groupedSpawnableFunc: --- \n" << *groupedSpawnableFunc << "\n";

    //     groupFuncMapToGroupedSpawnableFuncs[groupPair] = groupedSpawnableFunc;
    //     setOfGroupedSpawnableFuncs.insert(groupedSpawnableFunc);
        
    // }



    if (setOfSpawnableFuncs.size() == 0) {
        errs() << "Nothing to spawn...\n";
        return false;
    }

    // if (setOfGroupedSpawnableFuncs.size() == 0) {
    //     errs() << "grouped nothing to spawn...\n";
    //     return false;
    // }

    //generate multi-thread code
    std::set<uint32_t> arities;
    for (Function * spawnableF : setOfSpawnableFuncs) {
        arities.insert(spawnableF->getArgumentList().size());
    }

    // std::set<uint32_t> groupedArities;
    // for (Function * groupedSpawnableF : setOfGroupedSpawnableFuncs) {
    //     groupedArities.insert(groupedSpawnableF->getArgumentList().size());
    // }

    uint32_t maxArgsNum = *--arities.end();//get the max num

    // uint32_t groupedMaxArgsNum = *--groupedArities.end();

    //because of thread pool, multiple overloaded functions
    generateConstructorForSpawnableFunc(arities, M, maxArgsNum); // 

    // genCtorsForGroupedSpawnableFunc(groupedArities, M, groupedMaxArgsNum);

    //because of thread pool, for join function 
    generateJoin(M); //

    errs() << "after join M ....\n";
    std::map<CallInst *, std::set<Instruction *>>::iterator JoinPairIt;
    errs() << "PairSize: " << dm.getProfitableJoinPoints().size() << "\n";
    int count = 0;
    for (JoinPairIt = dm.join_begin(); JoinPairIt != dm.join_end(); ++JoinPairIt) {
        count++;
        Function * spawnableF;
        if (funcMapToSpawnableFuncs.find(JoinPairIt->first->getCalledFunction()) != funcMapToSpawnableFuncs.end()) {
            spawnableF = funcMapToSpawnableFuncs[JoinPairIt->first->getCalledFunction()];
        } else {
            spawnableF = nullptr;
        }

        if (spawnableF == nullptr) {
            errs() << "Spawnable function was not found...\n";
            //return false;
            continue;
        }
        if (JoinPairIt->first == nullptr || JoinPairIt->first == NULL) {
            errs() << "CallInst is null...\n";
            continue;
        }
        //create thread
        createThread(JoinPairIt->first, JoinPairIt->second, spawnableF);
        errs() << "after createThread...\n";
        JoinPairIt->first->eraseFromParent(); // 
        errs() << "after eraseFromParent...\n";
        errs() << "count: " << count << "\n";
    }
    // std::for_each(dm.join_begin(), dm.join_end(),
    //     [&](decltype(*dm.join_begin()) pair) {
    //         Function * spawnableF;
    //         if (funcMapToSpawnableFuncs.find((*pair).first->getCalledFunction()) != funcMapToSpawnableFuncs.end()) {
    //             spawnableF = funcMapToSpawnableFuncs[(*pair).first->getCalledFunction()];
    //         } else {
    //             spawnableF = nullptr;
    //         }
    //         createThread(pair.first, pair.second, spawnableF);
    //         count++;
    //         pair.first->eraseFromParent();
    //         errs() << "count: " << count << "\n";
    //     });

    //Parallelizer& par = getAnalysis<Parallelizer>(); //it means that Parallelizer class had runOnModule
    

    // for (auto groupPair : dm.getSafeCheckToBeMergedGroup()) {
    //     uint32_t direction = groupPair.second;
    //     std::vector<CallInst *> checksGroup = groupPair.first;
    //     for (auto call : checksGroup) {
    //         errs() << "111call: " << *call << "\n";
    //     }
    //     Function * groupedSF;

    //     if (groupFuncMapToGroupedSpawnableFuncs.find(groupPair) != groupFuncMapToGroupedSpawnableFuncs.end()) {
    //         groupedSF = groupFuncMapToGroupedSpawnableFuncs[groupPair];
    //     } else {
    //         groupedSF = nullptr;
    //     }

    //     if (groupedSF == nullptr) {
    //         errs() << "groupedSpawnable function was not found...\n";
    //         continue;
    //     }

    //     //get merge joinPoints
    //     //there only one join Point after merging, bacause of join dependence
    //     std::set<Instruction *> joinPoints;
    //     std::map<CallInst *, std::set<Instruction *>>::iterator JoinPairItForGroupedIt;
    //     for (JoinPairItForGroupedIt = dm.join_begin(); JoinPairItForGroupedIt != dm.join_end(); ++JoinPairItForGroupedIt) {
    //         // if (checksGroup.count(JoinPairItForGroupedIt->first)) {
    //         if (std::count(checksGroup.begin(), checksGroup.end(), JoinPairItForGroupedIt->first)) {
    //             joinPoints.insert(JoinPairItForGroupedIt->second.begin(), JoinPairItForGroupedIt->second.end());
    //         }
    //     }
    //     Instruction * firstJoinPoint = *joinPoints.begin();
        
    //     //because one callInst has more than one joinPoints
    //     createThreadForGroupedSF(checksGroup, firstJoinPoint, groupedSF, direction);


    //     //erase originial call function
    //     for (auto check : checksGroup) {
    //         check->eraseFromParent();
    //     }
    // }



    errs() << "before return runOnModule...\n";

    return false;
}

void Transformer::generateConstructorForSpawnableFunc(std::set<uint32_t> &arities, Module &M, uint32_t maxargs) {
    const uint32_t baseArgs = 2;
    LLVMContext &c = M.getContext();
    
    std::vector<Type *> ctorSig(baseArgs);
    ctorSig[0] = Type::getInt32Ty(c); // task id

    Type* voidStarType = PointerType::getUnqual(Type::getInt8Ty(c));

    std::string s0 = "_Z5spawnjPFv";
    std::string s1 = "P";
    std::string s2 = "v";
    std::string s3 = "E";
    std::string s4 = "S_";
    std::string s5 = "";
    std::string deltaS2 = "S_";
    std::string deltaS4 = "S_";
    Type* ctorArgTy = voidStarType;


    std::vector<Type *> args;

    std::string name = s0 + s2 + s3 + s5;

    for (uint32_t i = 0; i <= maxargs; i++) {
        if (arities.count(i)) {
            ctorSig[baseArgs - 1] = PointerType::getUnqual(FunctionType::get(Type::getVoidTy(c), args, false));
            FunctionType *ctorTy = FunctionType::get(Type::getVoidTy(c), ctorSig, false);
            ctors[i] = M.getOrInsertFunction(name, ctorTy);
        }
    
        //extend ctor's signature
        ctorSig.push_back(ctorArgTy);

        //extend the name
        s2 += ( i == 0 ? "" : deltaS2);
        s4 += ( i == 0 ? "" : deltaS4);

        name = s0 + s1 + s2 + s3 + s4 + s5;

        args.push_back(voidStarType);
    }

}

void Transformer::genCtorsForGroupedSpawnableFunc(std::set<uint32_t> &arities, Module &M, uint32_t maxargs) {
    const uint32_t baseArgs = 2;
    LLVMContext &c = M.getContext();
    
    std::vector<Type *> ctorSig(baseArgs);
    ctorSig[0] = Type::getInt32Ty(c); // confused

    Type* voidStarType = PointerType::getUnqual(Type::getInt8Ty(c));

    std::string s0 = "_Z5spawnjPFv";
    std::string s1 = "P";
    std::string s2 = "v";
    std::string s3 = "E";
    std::string s4 = "S_";
    std::string s5 = "";
    std::string deltaS2 = "S_";
    std::string deltaS4 = "S_";
    Type* ctorArgTy = voidStarType;


    std::vector<Type *> args;

    std::string name = s0 + s2 + s3 + s5;

    for (uint32_t i = 0; i <= maxargs; i++) {
        if (arities.count(i)) {
            ctorSig[baseArgs - 1] = PointerType::getUnqual(FunctionType::get(Type::getVoidTy(c), args, false));
            FunctionType *ctorTy = FunctionType::get(Type::getVoidTy(c), ctorSig, false);
            groupedCtors[i] = M.getOrInsertFunction(name, ctorTy);
        }
    
        //extend ctor's signature
        ctorSig.push_back(ctorArgTy);

        //extend the name
        s2 += ( i == 0 ? "" : deltaS2);
        s4 += ( i == 0 ? "" : deltaS4);

        name = s0 + s1 + s2 + s3 + s4 + s5;

        args.push_back(voidStarType);
    }

}

void Transformer::generateJoin(Module &M) {
    LLVMContext& c = M.getContext();
    Type * ty;

    ty = Type::getInt32Ty(c);

    FunctionType * joinTy = FunctionType::get(Type::getVoidTy(c), ty, false);
    join = M.getOrInsertFunction("_Z4joinj", joinTy);
    groupedJoin = M.getOrInsertFunction("_Z4joinj", joinTy);
}

void Transformer::createThread(CallInst * CI, std::set<Instruction*> joinPoints, Function * spawnableFun) {
    errs() << "Transformer::createThread...\n";
    errs() << "CallInst: " << *CI << "\n";
    errs() << "Function: " << spawnableFun->getName() << "\n";
    AllocaInst *retVal = nullptr;
    std::vector<Value *> args = genSpawnArgs(CI, spawnableFun, retVal);

    uint32_t numOfArgs = spawnableFun->getArgumentList().size();

    if (args.size() != numOfArgs + 2) {
        errs() << ">>>Num of Args is different...\n";
    }

    auto ctorIt = ctors.find(numOfArgs);
    if (ctorIt == ctors.end()) {
        errs() << ">>> No ctor in ctors...\n";
    }
    if (cast<Function>(ctorIt->second)->getArgumentList().size() != args.size()) {
        errs() << ">>>wrong ctor in ctors..., wrong args size...\n";
    }

    CallInst::Create(ctorIt->second, args, "", CI);
    errs() << "createThread--224\n";
    //the join function needs the first ctor arg
    Value * id = args[0]; // task ID
    //createJoin(joinPoints, id);
    for (auto *point : joinPoints) {
        CallInst::Create(join, id, "", point); 
    }

    errs() << "createThread---232\n";
    // if the functions returned a value, swap all uses of that value with
    //the value returned by our spawned thread, which is at the address of retVal
    if (retVal) {
        handleRetVal(CI, retVal);
        errs() << "Call: " << *CI << " has retVal...\n";
    } else {
        errs() << "Call: " << *CI << "has no retVal...\n";
    }

}

void Transformer::createThreadForGroupedSF(std::vector<CallInst *> CISet, Instruction* joinPoint, Function * spawnableFun, uint32_t direction) {

    std::vector<CallInst *> CIVec;
    std::vector<AllocaInst *> retValVec;
    for (auto check : CISet) {
        CIVec.push_back(check);
        retValVec.push_back(nullptr);
    }

    //construct args
    std::vector<Value *> args = genSpawnArgsForGrouped(CIVec, spawnableFun, retValVec);

    uint32_t numOfArgs = spawnableFun->getArgumentList().size();

    if (args.size() != numOfArgs + 2) {
        errs() << ">>>Num of Args is different...\n";
    }
    errs() << "----478\n";
    auto groupedCtorIt = groupedCtors.find(numOfArgs);
    if (groupedCtorIt == groupedCtors.end()) {
        errs () << ">>> No groupedCtor in groupedCtors...\n";
    }
    errs() << "----479\n";
    if (cast<Function>(groupedCtorIt->second)->getArgumentList().size() != args.size()) {
        errs() << ">>>wrong ctor in ctors..., wrong args size...\n";
    }
    CallInst * callInstToPlace = nullptr;
    uint32_t cornerCaseIndex = direction >> 2;
    errs() << "direction: " << direction << ", cornerIndx: " << cornerCaseIndex << "\n";
    if (cornerCaseIndex == 0) {//no cornercase
        // if (direction == 0) { // the first call to be threaded
        //     // callInstToPlace = *CISet.begin();
        //     callInstToPlace = CIVec[0];
        // } else{//the last call to be threaded for 1, 2, 3 condition
        //     // callInstToPlace = *--CISet.end();
        //     callInstToPlace = CIVec[CIVec.size() - 1];
        // }
        callInstToPlace = CIVec[CIVec.size() - 1];
    } else {//there is a cornercase
        // callInstToPlace = CIVec[cornerCaseIndex - 1];
        callInstToPlace = CIVec[CIVec.size() - 1];
    }
    errs() << "----480\n";
    errs() << "ToPlaceCall: " << *callInstToPlace << "\n";
    CallInst::Create(groupedCtorIt->second, args, "", callInstToPlace);
    errs() << "----481\n";
    //the join id
    Value * id = args[0];
    errs() << "----482\n";
    CallInst::Create(groupedJoin, id, "", joinPoint);

    errs() << "----505\n";

    //handle retval
    for (int retInd = 0; retInd < retValVec.size(); retInd++) {
        if (retValVec[retInd]) {
            handleRetVal(CIVec[retInd], retValVec[retInd]);
            errs() << "Call: " << *CIVec[retInd] << " has retVal...\n";
        } else {
            errs() << "Call: " << *CIVec[retInd] << " has no retVal...\n";
        }
    }

}

// void Transformer::createJoin(std::set<Instruction*>& joinPoints, Value* id) {
//     for (auto *point : joinPoints) {
//         CallInst::Create(join, id, "", point); // confused
//     }
// }

std::vector<Value *> Transformer::genSpawnArgsForGrouped(std::vector<CallInst *> CIVec, Function * spawnableF, std::vector<AllocaInst *> &retVal) {
    errs() << "genSpawnArgsForGrouped::CIVec size: " << CIVec.size() << "\n";
    for (auto check : CIVec) {
        errs() << "check: " << *check << "\n";
    }
    errs() << "------527\n";
    LLVMContext& c = CIVec.at(0)->getContext();
    errs() << "------528\n";
    std::vector<Value *> args {ConstantInt::get(Type::getInt32Ty(c), std::uniform_int_distribution<uint32_t>{}(seed)), spawnableF};
    errs() << "------529\n";
    Type * voidStarTy = PointerType::getUnqual(Type::getInt8Ty(c));
    errs() << "------530\n";
    for (int ind = 0; ind < CIVec.size(); ind++) {
        CallInst * curCI = CIVec[ind];
        errs() << "------531\n";
        for (int j = 0; j < curCI->getNumArgOperands(); j++) {
            Value * arg = curCI->getArgOperand(j);
            Type * argTy = arg->getType();
            errs() << "------532\n";
            Value * castArg;
            if (argTy->isPointerTy()) {
                castArg = arg;
            } else {
                castArg = new AllocaInst(argTy, "", curCI);
                new StoreInst(arg, castArg, curCI);
            }

            BitCastInst * bcInst = new BitCastInst(castArg, voidStarTy, "", curCI);
            errs() << "------533\n";
            args.push_back(bcInst);
        }

        errs() << "------536\n";
        Type * retTy = curCI->getCalledFunction()->getReturnType();
        bool retValIsNotVoid = (retTy != Type::getVoidTy(c));
        if (retValIsNotVoid) {
            retVal[ind] = new AllocaInst(retTy, "", curCI);
            errs() << "------534\n";
            BitCastInst * bcI = new BitCastInst(retVal[ind], voidStarTy, "", curCI);
            args.push_back(bcI);
            errs() << "------535\n";
        }
    }


    return args;

}

void Transformer::handleRetVal(CallInst * CI, AllocaInst * retVal) {
    errs() << "Transformer::handleRetVal...\n";

    std::vector<User *> oldUsersOfCall;
    oldUsersOfCall.reserve(std::distance(CI->use_begin(), CI->use_end()));
    std::for_each(CI->use_begin(), CI->use_end(), 
        [&](User *user){ oldUsersOfCall.push_back(user);});
    
    errs() << "old user:--- CI: " << *CI << ", retVal: " << *retVal << "\n";
    for(User * user : oldUsersOfCall) {
        errs() << "user: " << *user << "\n";
    } 

    for (User * user : oldUsersOfCall) {
        LoadInst * load = new LoadInst(retVal, "retVal", cast<Instruction>(user));
        std::transform(user->op_begin(), user->op_end(), user->op_begin(),
        [=](Value *v)-> Value * {
            if (v == CI) {
                return load;
            } else {
                return v;
            }
        });
    }

}

std::vector<Value *> Transformer::genSpawnArgs(CallInst * CI, Function * spawnableF, AllocaInst * &retVal) {

    errs() << "Transformer::genSpawnArgs...\n";
    LLVMContext& c = CI->getContext();
    Type * voidStarTy = PointerType::getUnqual(Type::getInt8Ty(c));

    //in our thread pool, need a "task" (random number) id  as an arg
    std::vector<Value *> args {ConstantInt::get(Type::getInt32Ty(c), std::uniform_int_distribution<uint32_t>{}(seed)), spawnableF};

    errs() << "init spawnArgs:---\n";
    for (auto arg : args) {
        errs() << "arg: " << *arg << "\n";
    }

    for (uint32_t i = 0; i < CI->getNumArgOperands(); i++) {
        Value * arg = CI->getArgOperand(i);
        Type * argTy = arg->getType();

        //if arg is not a pointer, need to store it so that we can get its address
        Value * castArg;
        if (argTy->isPointerTy()) {
            castArg = arg;
        } else {
            castArg = new AllocaInst(argTy, "", CI);
            new StoreInst(arg, castArg, CI);// confused.., does this operation can add a store inst directly?
        }

        BitCastInst * bcInst = new BitCastInst(castArg, voidStarTy, "", CI);

        args.push_back(bcInst);
    }

    Type * retTy = CI->getCalledFunction()->getReturnType();
    bool retValIsNotVoid = (retTy !=  Type::getVoidTy(c));
    if (retValIsNotVoid) {
        retVal = new AllocaInst(retTy, "", CI);
        BitCastInst * bcI = new BitCastInst(retVal, voidStarTy, "", CI);
        args.push_back(bcI);
    }

    errs() << "return spawnArgs:---\n";
    for (auto arg : args) {
        errs() << "arg: " << *arg << "\n";
    }
    return args;

}


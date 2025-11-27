#ifndef _INTER_TASK_H
#define _INTER_TASK_H

#include <random>
// LLVM 14: llvm/Pass.h는 레거시 PassManager를 포함하므로 제거
// #include "llvm/Pass.h"
// LLVM 14: ModulePass forward declaration
namespace llvm {
    class ModulePass;
    class Module;
    class AnalysisUsage;
}
#include "PDG.h"
// LLVM 14: PDGAnalysis는 레거시 PassManager를 사용하므로 임시로 forward declaration만 사용
// #include "PDGAnalysis.h"
class PDGAnalysis; // Forward declaration
#include "llvm/IR/IntrinsicInst.h"

using namespace llvm;

// LLVM 14: ModulePass는 레거시 PassManager이므로, 현재는 사용하지 않음
// TODO: 새 PassManager로 전환 필요
// 임시로 비활성화 (전역 생성자 충돌 방지)
#if 0
class InterTask : public ModulePass {
public:
    static char ID;
    InterTask();
    virtual ~InterTask();
    void getAnalysisUsage(AnalysisUsage &AU) const override;
    bool runOnModule(Module &M) override;

private:
    Module * mo;
    std::map<uint32_t, Constant *> ctors;
    Constant * joinFunc;
    uint32_t id;
    std::mt19937 taskSeed;
    Constant * generateJoin();
    void genCtorForSpawn(Function * wrapperFunc);
    std::vector<Value *> genSpawnArgs(CallInst * CI, Function * wrapperFunc);
    
};
#else
// LLVM 14: 임시로 비활성화 (전역 생성자 충돌 방지)
class InterTask {
    // Forward declaration only
};
#endif

#endif
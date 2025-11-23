#include "llvm/ADT/StringRef.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

namespace {
class HelloPass : public PassInfoMixin<HelloPass> {
public:
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM) {
    errs() << "[HelloPass] Function: " << F.getName() << '\n';
    return PreservedAnalyses::all();
  }
};
} // namespace

static PassPluginLibraryInfo getHelloPassPluginInfo() {
  return {LLVM_PLUGIN_API_VERSION, "hello-pass", LLVM_VERSION_STRING,
          [](PassBuilder &PB) {
            PB.registerPipelineParsingCallback(
                [](StringRef Name, FunctionPassManager &FPM,
                   ArrayRef<PassBuilder::PipelineElement>) {
                  if (Name == "hello-pass") {
                    FPM.addPass(HelloPass());
                    return true;
                  }
                  return false;
                });
          }};
}

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
  return getHelloPassPluginInfo();
}

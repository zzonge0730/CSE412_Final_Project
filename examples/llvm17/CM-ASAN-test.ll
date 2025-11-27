; ModuleID = 'test_llvm17_asan.ll'
source_filename = "test_llvm17_asan.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"test.c\00", align 1

declare void @__asan_load1(ptr)

declare void @__asan_load2(ptr)

declare void @__asan_load4(ptr)

declare void @__asan_load8(ptr)

declare void @__asan_store4(ptr)

declare void @__asan_store8(ptr)

declare void @__asan_loadN(ptr, i64)

declare void @__asan_storeN(ptr, i64)

define i32 @main(i32 %argc, ptr %argv) {
entry:
  %argv.addr = alloca ptr, align 8
  %ptr1 = alloca ptr, align 8
  %val = alloca i32, align 4
  store ptr %argv, ptr %argv.addr, align 8
  %zybc_ = bitcast ptr %val to ptr
  %zybc_1 = bitcast ptr %ptr1 to ptr
  %zybc_2 = bitcast ptr %argv.addr to ptr
  %zyarg_ = inttoptr i64 16 to ptr
  %zybc_3 = bitcast ptr %zyarg_ to ptr
  call void @_Z5spawnjPFvPvS_S_S_ES_S_S_S_(i32 219356868, ptr @_spawn_loop_free_func_0_0, ptr %zybc_, ptr %zybc_1, ptr %zybc_2, ptr %zybc_3)
  %0 = load i32, ptr %val, align 4
  call void @_Z4joinj(i32 219356868)
  ret i32 0
}

declare void @_Z4joinj(i32)

define internal void @_spawn_loop_free_func_0_0(ptr %0, ptr %1, ptr %2, ptr %3) {
entry:
  %4 = bitcast ptr %0 to ptr
  call void @__asan_load4(ptr %4)
  %5 = bitcast ptr %1 to ptr
  call void @__asan_store8(ptr %5)
  %6 = bitcast ptr %2 to ptr
  %7 = bitcast ptr %3 to ptr
  %zt_ = ptrtoint ptr %7 to i64
  call void @__asan_loadN(ptr %6, i64 %zt_)
  ret void
}

declare void @_Z5spawnjPFvPvS_S_S_ES_S_S_S_(i32, ptr, ptr, ptr, ptr, ptr)

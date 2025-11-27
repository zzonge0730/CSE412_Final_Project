; Test IR file for LLVM 17 Catamaran pass - ASAN metadata checks
; This simulates ASAN instrumented code with __asan_load/store functions

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Declare ASAN check functions (stubs for testing)
declare void @__asan_load1(ptr)
declare void @__asan_load2(ptr)
declare void @__asan_load4(ptr)
declare void @__asan_load8(ptr)
declare void @__asan_store4(ptr)
declare void @__asan_store8(ptr)
declare void @__asan_loadN(ptr, i64)
declare void @__asan_storeN(ptr, i64)

@.str = private unnamed_addr constant [7 x i8] c"test.c\00", align 1

define i32 @main(i32 %argc, ptr %argv) {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca ptr, align 8
  %ptr1 = alloca ptr, align 8
  %val = alloca i32, align 4
  
  store i32 %argc, ptr %argc.addr, align 4
  store ptr %argv, ptr %argv.addr, align 8
  
  ; Simulate ASAN checks
  ; Check 1: Load check 4 bytes
  call void @__asan_load4(ptr %val)
  
  ; Check 2: Store check 8 bytes
  call void @__asan_store8(ptr %ptr1)
  
  ; Check 3: Load check N bytes
  call void @__asan_loadN(ptr %argv.addr, i64 16)

  ; Actual memory access (simulated)
  %0 = load i32, ptr %val, align 4
  
  ret i32 0
}


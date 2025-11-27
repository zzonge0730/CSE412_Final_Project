; Test IR file for LLVM 17 Catamaran pass - MoveC metadata checks
; This simulates MoveC instrumented code with _RV_check functions

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._RV_pmd = type { i8*, i8*, i8*, i8 }

; Declare MoveC check functions (stubs for testing)
declare i8* @_RV_check_dpv(%struct._RV_pmd*, i8*, i64, i8*, i8*, i32, i32, i8*)
declare i8* @_RV_check_dpc(i8*, i8*, i8*, i64, i8*, i8*, i32, i32, i8*)
declare i64 @_RV_check_dpv_ss(%struct._RV_pmd*, i8*, i64, i64, i8*, i8*, i32, i32, i8*)

; Test globals
@_RV_test_pmd = internal global %struct._RV_pmd { i8* null, i8* null, i8* null, i8 0 }
@.str = private unnamed_addr constant [7 x i8] c"test.c\00", align 1
@.str1 = private unnamed_addr constant [5 x i8] c"main\00", align 1

define i32 @main(i32 %argc, i8** %argv) {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %ptr1 = alloca i8*, align 8
  %ptr2 = alloca i8*, align 8
  %base1 = alloca i8*, align 8
  %bound1 = alloca i8*, align 8
  
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  
  %val1 = load i8*, i8** %ptr1, align 8
  %val2 = load i8*, i8** %ptr2, align 8
  %base_val = load i8*, i8** %base1, align 8
  %bound_val = load i8*, i8** %bound1, align 8
  
  ; These calls should be identified by LoopFreeTask as independent checks
  ; Check 1: Independent pointer validation
  %check1 = call i8* @_RV_check_dpv(%struct._RV_pmd* @_RV_test_pmd, i8* %val1, i64 8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str1, i64 0, i64 0), i32 10, i32 5, i8* null)
  
  ; Check 2: Another independent check
  %check2 = call i8* @_RV_check_dpc(i8* %base_val, i8* %bound_val, i8* %val2, i64 4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str1, i64 0, i64 0), i32 11, i32 6, i8* null)
  
  ; Check 3: Another independent check
  %check3 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* @_RV_test_pmd, i8* %val1, i64 0, i64 16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str1, i64 0, i64 0), i32 12, i32 7, i8* null)
  
  ret i32 0
}


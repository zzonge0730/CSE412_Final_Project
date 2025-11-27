; ModuleID = 'MoveC-gemm-fixed.c'
source_filename = "MoveC-gemm-fixed.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__RV_pmd = type { ptr, ptr, ptr, i8 }
%struct.__RV_stat_node = type { i32, i64 }
%struct.__RV_fmd_pmd = type { ptr, ptr, ptr }
%struct.__RV_fmd = type { ptr, i8, ptr, ptr }
%struct.__RV_hashtbl = type { ptr, i64, i64, i64 }
%struct._IO_FILE = type { i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, [1 x i8], ptr, i64, ptr, ptr, ptr, ptr, i64, i32, [20 x i8] }
%struct.__va_list_tag = type { i32, i32, ptr, ptr }

@__RV_error_count = dso_local global i64 0, align 8
@stderr = external global ptr, align 8
@.str = private unnamed_addr constant [20 x i8] c"1 error generated.\0A\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c"%lu errors generated.\0A\00", align 1
@.str.2 = private unnamed_addr constant [25 x i8] c"The pmd does not exist.\0A\00", align 1
@.str.3 = private unnamed_addr constant [31 x i8] c"The pmd is [%p, %p), status = \00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"(null)\0A\00", align 1
@.str.5 = private unnamed_addr constant [11 x i8] c"(%d, %lu)\0A\00", align 1
@_RV_TRIE_PRIMARY_ENTRIES = dso_local constant i64 8388608, align 8
@_RV_TRIE_SECONDARY_ENTRIES = dso_local constant i64 4194304, align 8
@.str.6 = private unnamed_addr constant [27 x i8] c"trie_primary != (void *)-1\00", align 1
@.str.7 = private unnamed_addr constant [16 x i8] c"./_RV_memsafe.c\00", align 1
@__PRETTY_FUNCTION__.__RV_trie_create = private unnamed_addr constant [34 x i8] c"__RV_pmd **__RV_trie_create(void)\00", align 1
@.str.8 = private unnamed_addr constant [28 x i8] c"trie_secondary != (void*)-1\00", align 1
@__PRETTY_FUNCTION__.__RV_trie_create_secondary = private unnamed_addr constant [43 x i8] c"__RV_pmd *__RV_trie_create_secondary(void)\00", align 1
@__RV_trie_get_trie_ref_pmd.tbl = internal global ptr null, align 8
@__RV_hashtbl_get_hashtbl_ref_fmd.tbl = internal global ptr null, align 8
@.str.9 = private unnamed_addr constant [43 x i8] c"The pmd of %s (addr = %p) does not exist.\0A\00", align 1
@.str.10 = private unnamed_addr constant [49 x i8] c"The pmd of %s (addr = %p) is [%p, %p), status = \00", align 1
@.str.11 = private unnamed_addr constant [43 x i8] c"The fpmd of %s (param %d) does not exist.\0A\00", align 1
@.str.12 = private unnamed_addr constant [49 x i8] c"The fpmd of %s (param %d) is [%p, %p), status = \00", align 1
@.str.13 = private unnamed_addr constant [91 x i8] c"%s: In function '%s':\0A%s:%d:%d: error: dereferenced pointer '%s' is NULL. [spatial error]\0A\00", align 1
@.str.14 = private unnamed_addr constant [150 x i8] c"%s: In function '%s':\0A%s:%d:%d: error: dereferenced pointer '%s' (val = %p, size = %lu) points to an invalid object (uninitialized). [spatial error]\0A\00", align 1
@.str.15 = private unnamed_addr constant [164 x i8] c"%s: In function '%s':\0A%s:%d:%d: error: dereferenced pointer '%s' (val = %p, size = %lu) points to an invalid object (original block is [%p, %p)). [temporal error]\0A\00", align 1
@.str.16 = private unnamed_addr constant [148 x i8] c"%s: In function '%s':\0A%s:%d:%d: error: dereferenced pointer '%s' (val = %p, size = %lu) points to a function %p, not a data block. [segment error]\0A\00", align 1
@.str.17 = private unnamed_addr constant [135 x i8] c"%s: In function '%s':\0A%s:%d:%d: error: dereferenced pointer '%s' (val = %p, size = %lu) is out of the block [%p, %p). [spatial error]\0A\00", align 1
@.str.18 = private unnamed_addr constant [138 x i8] c"%s: In function '%s':\0A%s:%d:%d: error: dereferenced pointer '%s' (val = %p) points to an invalid object (uninitialized). [spatial error]\0A\00", align 1
@.str.19 = private unnamed_addr constant [152 x i8] c"%s: In function '%s':\0A%s:%d:%d: error: dereferenced pointer '%s' (val = %p) points to an invalid object (original block is [%p, %p)). [temporal error]\0A\00", align 1
@.str.20 = private unnamed_addr constant [150 x i8] c"%s: In function '%s':\0A%s:%d:%d: error: dereferenced pointer '%s' (val = %p) does not point to a function, but a data block [%p, %p). [segment error]\0A\00", align 1
@.str.21 = private unnamed_addr constant [132 x i8] c"%s: In function '%s':\0A%s:%d:%d: error: dereferenced pointer '%s' (val = %p) is not the address of the function %p. [spatial error]\0A\00", align 1
@optarg = external global ptr, align 8
@stdin = external global ptr, align 8
@_RV_tmpnam.temp_file = internal global [20 x i8] c"tmp_XXXXXX\00\00\00\00\00\00\00\00\00\00", align 16
@__RV_static_sa = dso_local global ptr null, align 8
@stdout = external global ptr, align 8
@.str.22 = private unnamed_addr constant [23 x i8] c"%s: In function '%s':\0A\00", align 1
@.str.23 = private unnamed_addr constant [109 x i8] c"%s:%d:%d: error: freed pointer '%s' (val = %p) points to an invalid object (uninitialized). [spatial error]\0A\00", align 1
@.str.24 = private unnamed_addr constant [137 x i8] c"%s:%d:%d: error: freed pointer '%s' (val = %p) points to an invalid object (original block is [%p, %p)). [temporal error][illegal free]\0A\00", align 1
@.str.25 = private unnamed_addr constant [140 x i8] c"%s:%d:%d: error: freed pointer '%s' (val = %p) does not point to a heap object (original block is [%p, %p)). [segment error][illegal free]\0A\00", align 1
@.str.26 = private unnamed_addr constant [132 x i8] c"%s:%d:%d: error: freed pointer '%s' (val = %p) is not the base address (original block is [%p, %p)). [spatial error][illegal free]\0A\00", align 1
@__RV_global_sa = dso_local global ptr null, align 8
@__RV_library_sa = dso_local global ptr null, align 8
@_RV_strtok.pmd = internal global %struct.__RV_pmd zeroinitializer, align 8
@environ = external global ptr, align 8
@.str.27 = private unnamed_addr constant [46 x i8] c"error: unhandled call wrapper by pointer %p.\0A\00", align 1
@__RV_function_sa = dso_local global ptr null, align 8
@.str.28 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.29 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_print_error_count() #0 {
entry:
  call void @__RV_global_clear_code()
  %0 = load i64, ptr @__RV_error_count, align 8
  %cmp = icmp eq i64 %0, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8
  %call = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %1, ptr noundef @.str)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i64, ptr @__RV_error_count, align 8
  %cmp1 = icmp ugt i64 %2, 1
  br i1 %cmp1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %3 = load ptr, ptr @stderr, align 8
  %4 = load i64, ptr @__RV_error_count, align 8
  %call3 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %3, ptr noundef @.str.1, i64 noundef %4)
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.end
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_global_clear_code() #0 {
entry:
  call void @__RV_unistd_clear_code()
  call void @__RV_stdio_clear_code()
  %0 = load ptr, ptr @__RV_library_sa, align 8
  %call = call i32 @__RV_stat_node_dec(ptr noundef %0)
  %1 = load ptr, ptr @__RV_static_sa, align 8
  %call1 = call i32 @__RV_stat_node_dec(ptr noundef %1)
  %2 = load ptr, ptr @__RV_global_sa, align 8
  %call2 = call i32 @__RV_stat_node_dec(ptr noundef %2)
  %3 = load ptr, ptr @__RV_function_sa, align 8
  %call3 = call i32 @__RV_stat_node_dec(ptr noundef %3)
  ret void
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_stat_node_create(i32 noundef %stat, i64 noundef %count) #0 {
entry:
  %retval = alloca ptr, align 8
  %stat.addr = alloca i32, align 4
  %count.addr = alloca i64, align 8
  %snda = alloca ptr, align 8
  store i32 %stat, ptr %stat.addr, align 4
  store i64 %count, ptr %count.addr, align 8
  %call = call noalias ptr @malloc(i64 noundef 16) #12
  store ptr %call, ptr %snda, align 8
  %0 = load ptr, ptr %snda, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store ptr null, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, ptr %stat.addr, align 4
  %2 = load ptr, ptr %snda, align 8
  %stat1 = getelementptr inbounds %struct.__RV_stat_node, ptr %2, i32 0, i32 0
  store i32 %1, ptr %stat1, align 8
  %3 = load i64, ptr %count.addr, align 8
  %4 = load ptr, ptr %snda, align 8
  %count2 = getelementptr inbounds %struct.__RV_stat_node, ptr %4, i32 0, i32 1
  store i64 %3, ptr %count2, align 8
  %5 = load ptr, ptr %snda, align 8
  store ptr %5, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %6 = load ptr, ptr %retval, align 8
  ret ptr %6
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__RV_stat_node_get_stat(ptr noundef %snda) #0 {
entry:
  %retval = alloca i32, align 4
  %snda.addr = alloca ptr, align 8
  store ptr %snda, ptr %snda.addr, align 8
  %0 = load ptr, ptr %snda.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %snda.addr, align 8
  %stat = getelementptr inbounds %struct.__RV_stat_node, ptr %1, i32 0, i32 0
  %2 = load i32, ptr %stat, align 8
  store i32 %2, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, ptr %retval, align 4
  ret i32 %3
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__RV_stat_node_get_count(ptr noundef %snda) #0 {
entry:
  %retval = alloca i64, align 8
  %snda.addr = alloca ptr, align 8
  store ptr %snda, ptr %snda.addr, align 8
  %0 = load ptr, ptr %snda.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 0, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %snda.addr, align 8
  %count = getelementptr inbounds %struct.__RV_stat_node, ptr %1, i32 0, i32 1
  %2 = load i64, ptr %count, align 8
  store i64 %2, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load i64, ptr %retval, align 8
  ret i64 %3
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__RV_stat_node_dec(ptr noundef %snda) #0 {
entry:
  %retval = alloca i32, align 4
  %snda.addr = alloca ptr, align 8
  %ret = alloca i32, align 4
  store ptr %snda, ptr %snda.addr, align 8
  store i32 0, ptr %ret, align 4
  %0 = load ptr, ptr %snda.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %snda.addr, align 8
  %count = getelementptr inbounds %struct.__RV_stat_node, ptr %1, i32 0, i32 1
  %2 = load i64, ptr %count, align 8
  %cmp1 = icmp eq i64 %2, 0
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  store i32 0, ptr %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  %3 = load ptr, ptr %snda.addr, align 8
  %count4 = getelementptr inbounds %struct.__RV_stat_node, ptr %3, i32 0, i32 1
  %4 = load i64, ptr %count4, align 8
  %cmp5 = icmp eq i64 %4, 1
  br i1 %cmp5, label %if.then6, label %if.else

if.then6:                                         ; preds = %if.end3
  %5 = load ptr, ptr %snda.addr, align 8
  %stat = getelementptr inbounds %struct.__RV_stat_node, ptr %5, i32 0, i32 0
  %6 = load i32, ptr %stat, align 8
  %cmp7 = icmp eq i32 %6, 4
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.then6
  store i32 1, ptr %ret, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.then6
  %7 = load ptr, ptr %snda.addr, align 8
  call void @free(ptr noundef %7) #13
  br label %if.end11

if.else:                                          ; preds = %if.end3
  %8 = load ptr, ptr %snda.addr, align 8
  %count10 = getelementptr inbounds %struct.__RV_stat_node, ptr %8, i32 0, i32 1
  %9 = load i64, ptr %count10, align 8
  %dec = add i64 %9, -1
  store i64 %dec, ptr %count10, align 8
  br label %if.end11

if.end11:                                         ; preds = %if.else, %if.end9
  %10 = load i32, ptr %ret, align 4
  store i32 %10, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end11, %if.then2, %if.then
  %11 = load i32, ptr %retval, align 4
  ret i32 %11
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_stat_node_inc(ptr noundef %snda) #0 {
entry:
  %snda.addr = alloca ptr, align 8
  store ptr %snda, ptr %snda.addr, align 8
  %0 = load ptr, ptr %snda.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %snda.addr, align 8
  %count = getelementptr inbounds %struct.__RV_stat_node, ptr %1, i32 0, i32 1
  %2 = load i64, ptr %count, align 8
  %inc = add i64 %2, 1
  store i64 %inc, ptr %count, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_pmd_create(ptr noundef %ptra, ptr noundef %snda, i32 noundef %stat, ptr noundef %base, ptr noundef %bound) #0 {
entry:
  %ptra.addr = alloca ptr, align 8
  %snda.addr = alloca ptr, align 8
  %stat.addr = alloca i32, align 4
  %base.addr = alloca ptr, align 8
  %bound.addr = alloca ptr, align 8
  %pmd = alloca ptr, align 8
  store ptr %ptra, ptr %ptra.addr, align 8
  store ptr %snda, ptr %snda.addr, align 8
  store i32 %stat, ptr %stat.addr, align 4
  store ptr %base, ptr %base.addr, align 8
  store ptr %bound, ptr %bound.addr, align 8
  %0 = load ptr, ptr %ptra.addr, align 8
  %call = call ptr @__RV_pmd_create_null(ptr noundef %0)
  store ptr %call, ptr %pmd, align 8
  %1 = load ptr, ptr %pmd, align 8
  %2 = load ptr, ptr %snda.addr, align 8
  %3 = load i32, ptr %stat.addr, align 4
  %4 = load ptr, ptr %base.addr, align 8
  %5 = load ptr, ptr %bound.addr, align 8
  %call1 = call ptr @__RV_pmd_set(ptr noundef %1, ptr noundef %2, i32 noundef %3, ptr noundef %4, ptr noundef %5)
  %6 = load ptr, ptr %pmd, align 8
  ret ptr %6
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_pmd_create_null(ptr noundef %ptra) #0 {
entry:
  %retval = alloca ptr, align 8
  %ptra.addr = alloca ptr, align 8
  %pmd = alloca ptr, align 8
  store ptr %ptra, ptr %ptra.addr, align 8
  %call = call noalias ptr @malloc(i64 noundef 32) #12
  store ptr %call, ptr %pmd, align 8
  %0 = load ptr, ptr %pmd, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store ptr null, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %pmd, align 8
  %2 = load ptr, ptr %ptra.addr, align 8
  call void @__RV_pmd_init_null(ptr noundef %1, ptr noundef %2)
  %3 = load ptr, ptr %pmd, align 8
  store ptr %3, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %4 = load ptr, ptr %retval, align 8
  ret ptr %4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_pmd_set(ptr noundef %pmd, ptr noundef %snda, i32 noundef %stat, ptr noundef %base, ptr noundef %bound) #0 {
entry:
  %retval = alloca ptr, align 8
  %pmd.addr = alloca ptr, align 8
  %snda.addr = alloca ptr, align 8
  %stat.addr = alloca i32, align 4
  %base.addr = alloca ptr, align 8
  %bound.addr = alloca ptr, align 8
  store ptr %pmd, ptr %pmd.addr, align 8
  store ptr %snda, ptr %snda.addr, align 8
  store i32 %stat, ptr %stat.addr, align 4
  store ptr %base, ptr %base.addr, align 8
  store ptr %bound, ptr %bound.addr, align 8
  %0 = load ptr, ptr %pmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %pmd.addr, align 8
  store ptr %1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %snda.addr, align 8
  %cmp1 = icmp ne ptr %2, null
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  %3 = load ptr, ptr %pmd.addr, align 8
  %4 = load ptr, ptr %snda.addr, align 8
  call void @__RV_pmd_c_snda(ptr noundef %3, ptr noundef %4)
  br label %if.end7

if.else:                                          ; preds = %if.end
  %5 = load ptr, ptr %pmd.addr, align 8
  call void @__RV_pmd_dc_snda(ptr noundef %5)
  %6 = load i32, ptr %stat.addr, align 4
  %cmp3 = icmp ne i32 %6, 0
  br i1 %cmp3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.else
  %7 = load i32, ptr %stat.addr, align 4
  %call = call ptr @__RV_stat_node_create(i32 noundef %7, i64 noundef 1)
  %8 = load ptr, ptr %pmd.addr, align 8
  %snda5 = getelementptr inbounds %struct.__RV_pmd, ptr %8, i32 0, i32 2
  store ptr %call, ptr %snda5, align 8
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.then2
  %9 = load ptr, ptr %base.addr, align 8
  %10 = load ptr, ptr %pmd.addr, align 8
  %base8 = getelementptr inbounds %struct.__RV_pmd, ptr %10, i32 0, i32 0
  store ptr %9, ptr %base8, align 8
  %11 = load ptr, ptr %bound.addr, align 8
  %12 = load ptr, ptr %pmd.addr, align 8
  %bound9 = getelementptr inbounds %struct.__RV_pmd, ptr %12, i32 0, i32 1
  store ptr %11, ptr %bound9, align 8
  %13 = load ptr, ptr %pmd.addr, align 8
  %pmdflag = getelementptr inbounds %struct.__RV_pmd, ptr %13, i32 0, i32 3
  %14 = load i8, ptr %pmdflag, align 8
  %conv = zext i8 %14 to i32
  %cmp10 = icmp eq i32 %conv, 0
  br i1 %cmp10, label %if.then12, label %if.end14

if.then12:                                        ; preds = %if.end7
  %15 = load ptr, ptr %pmd.addr, align 8
  %pmdflag13 = getelementptr inbounds %struct.__RV_pmd, ptr %15, i32 0, i32 3
  store i8 1, ptr %pmdflag13, align 8
  br label %if.end14

if.end14:                                         ; preds = %if.then12, %if.end7
  %16 = load ptr, ptr %pmd.addr, align 8
  store ptr %16, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end14, %if.then
  %17 = load ptr, ptr %retval, align 8
  ret ptr %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_pmd_init_null(ptr noundef %pmd, ptr noundef %ptra) #0 {
entry:
  %pmd.addr = alloca ptr, align 8
  %ptra.addr = alloca ptr, align 8
  store ptr %pmd, ptr %pmd.addr, align 8
  store ptr %ptra, ptr %ptra.addr, align 8
  %0 = load ptr, ptr %pmd.addr, align 8
  %tobool = icmp ne ptr %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  br label %if.end3

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %pmd.addr, align 8
  %base = getelementptr inbounds %struct.__RV_pmd, ptr %1, i32 0, i32 0
  store ptr null, ptr %base, align 8
  %2 = load ptr, ptr %pmd.addr, align 8
  %bound = getelementptr inbounds %struct.__RV_pmd, ptr %2, i32 0, i32 1
  store ptr null, ptr %bound, align 8
  %3 = load ptr, ptr %pmd.addr, align 8
  %snda = getelementptr inbounds %struct.__RV_pmd, ptr %3, i32 0, i32 2
  store ptr null, ptr %snda, align 8
  %4 = load ptr, ptr %ptra.addr, align 8
  %cmp = icmp eq ptr %4, null
  br i1 %cmp, label %if.then1, label %if.else

if.then1:                                         ; preds = %if.end
  %5 = load ptr, ptr %pmd.addr, align 8
  %pmdflag = getelementptr inbounds %struct.__RV_pmd, ptr %5, i32 0, i32 3
  store i8 2, ptr %pmdflag, align 8
  br label %if.end3

if.else:                                          ; preds = %if.end
  %6 = load ptr, ptr %pmd.addr, align 8
  %pmdflag2 = getelementptr inbounds %struct.__RV_pmd, ptr %6, i32 0, i32 3
  store i8 1, ptr %pmdflag2, align 8
  br label %if.end3

if.end3:                                          ; preds = %if.then, %if.else, %if.then1
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_pmd_free(ptr noundef %pmd) #0 {
entry:
  %pmd.addr = alloca ptr, align 8
  store ptr %pmd, ptr %pmd.addr, align 8
  %0 = load ptr, ptr %pmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %pmd.addr, align 8
  call void @__RV_pmd_dc_snda(ptr noundef %1)
  %2 = load ptr, ptr %pmd.addr, align 8
  call void @free(ptr noundef %2) #13
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_pmd_dc_snda(ptr noundef %pmd) #0 {
entry:
  %pmd.addr = alloca ptr, align 8
  %mem_leak = alloca i8, align 1
  store ptr %pmd, ptr %pmd.addr, align 8
  %0 = load ptr, ptr %pmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %pmd.addr, align 8
  %snda = getelementptr inbounds %struct.__RV_pmd, ptr %1, i32 0, i32 2
  %2 = load ptr, ptr %snda, align 8
  %call = call i32 @__RV_stat_node_dec(ptr noundef %2)
  %conv = trunc i32 %call to i8
  store i8 %conv, ptr %mem_leak, align 1
  %3 = load i8, ptr %mem_leak, align 1
  %conv1 = zext i8 %3 to i32
  %cmp2 = icmp eq i32 %conv1, 1
  br i1 %cmp2, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  %4 = load ptr, ptr %pmd.addr, align 8
  %snda6 = getelementptr inbounds %struct.__RV_pmd, ptr %4, i32 0, i32 2
  store ptr null, ptr %snda6, align 8
  br label %return

return:                                           ; preds = %if.end5, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_pmd_free_null_ptr(ptr noundef %pmd) #0 {
entry:
  %pmd.addr = alloca ptr, align 8
  store ptr %pmd, ptr %pmd.addr, align 8
  %0 = load ptr, ptr %pmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %if.end4

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %pmd.addr, align 8
  %pmdflag = getelementptr inbounds %struct.__RV_pmd, ptr %1, i32 0, i32 3
  %2 = load i8, ptr %pmdflag, align 8
  %conv = zext i8 %2 to i32
  %cmp1 = icmp eq i32 %conv, 2
  br i1 %cmp1, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %3 = load ptr, ptr %pmd.addr, align 8
  call void @__RV_pmd_free(ptr noundef %3)
  br label %if.end4

if.end4:                                          ; preds = %if.then, %if.then3, %if.end
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__RV_pmd_is_null(ptr noundef %pmd) #0 {
entry:
  %retval = alloca i32, align 4
  %pmd.addr = alloca ptr, align 8
  store ptr %pmd, ptr %pmd.addr, align 8
  %0 = load ptr, ptr %pmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %pmd.addr, align 8
  %snda = getelementptr inbounds %struct.__RV_pmd, ptr %1, i32 0, i32 2
  %2 = load ptr, ptr %snda, align 8
  %cmp1 = icmp eq ptr %2, null
  br i1 %cmp1, label %land.lhs.true, label %if.end6

land.lhs.true:                                    ; preds = %if.end
  %3 = load ptr, ptr %pmd.addr, align 8
  %base = getelementptr inbounds %struct.__RV_pmd, ptr %3, i32 0, i32 0
  %4 = load ptr, ptr %base, align 8
  %cmp2 = icmp eq ptr %4, null
  br i1 %cmp2, label %land.lhs.true3, label %if.end6

land.lhs.true3:                                   ; preds = %land.lhs.true
  %5 = load ptr, ptr %pmd.addr, align 8
  %bound = getelementptr inbounds %struct.__RV_pmd, ptr %5, i32 0, i32 1
  %6 = load ptr, ptr %bound, align 8
  %cmp4 = icmp eq ptr %6, null
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %land.lhs.true3
  store i32 1, ptr %retval, align 4
  br label %return

if.end6:                                          ; preds = %land.lhs.true3, %land.lhs.true, %if.end
  store i32 0, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end6, %if.then5, %if.then
  %7 = load i32, ptr %retval, align 4
  ret i32 %7
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_pmd_get_base(ptr noundef %pmd) #0 {
entry:
  %retval = alloca ptr, align 8
  %pmd.addr = alloca ptr, align 8
  store ptr %pmd, ptr %pmd.addr, align 8
  %0 = load ptr, ptr %pmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store ptr null, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %pmd.addr, align 8
  %base = getelementptr inbounds %struct.__RV_pmd, ptr %1, i32 0, i32 0
  %2 = load ptr, ptr %base, align 8
  store ptr %2, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load ptr, ptr %retval, align 8
  ret ptr %3
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_pmd_get_bound(ptr noundef %pmd) #0 {
entry:
  %retval = alloca ptr, align 8
  %pmd.addr = alloca ptr, align 8
  store ptr %pmd, ptr %pmd.addr, align 8
  %0 = load ptr, ptr %pmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store ptr null, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %pmd.addr, align 8
  %bound = getelementptr inbounds %struct.__RV_pmd, ptr %1, i32 0, i32 1
  %2 = load ptr, ptr %bound, align 8
  store ptr %2, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load ptr, ptr %retval, align 8
  ret ptr %3
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_pmd_get_snda(ptr noundef %pmd) #0 {
entry:
  %retval = alloca ptr, align 8
  %pmd.addr = alloca ptr, align 8
  store ptr %pmd, ptr %pmd.addr, align 8
  %0 = load ptr, ptr %pmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store ptr null, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %pmd.addr, align 8
  %snda = getelementptr inbounds %struct.__RV_pmd, ptr %1, i32 0, i32 2
  %2 = load ptr, ptr %snda, align 8
  store ptr %2, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load ptr, ptr %retval, align 8
  ret ptr %3
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__RV_pmd_get_stat(ptr noundef %pmd) #0 {
entry:
  %retval = alloca i32, align 4
  %pmd.addr = alloca ptr, align 8
  store ptr %pmd, ptr %pmd.addr, align 8
  %0 = load ptr, ptr %pmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %pmd.addr, align 8
  %snda = getelementptr inbounds %struct.__RV_pmd, ptr %1, i32 0, i32 2
  %2 = load ptr, ptr %snda, align 8
  %call = call i32 @__RV_stat_node_get_stat(ptr noundef %2)
  store i32 %call, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, ptr %retval, align 4
  ret i32 %3
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__RV_pmd_get_count(ptr noundef %pmd) #0 {
entry:
  %retval = alloca i64, align 8
  %pmd.addr = alloca ptr, align 8
  store ptr %pmd, ptr %pmd.addr, align 8
  %0 = load ptr, ptr %pmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 0, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %pmd.addr, align 8
  %snda = getelementptr inbounds %struct.__RV_pmd, ptr %1, i32 0, i32 2
  %2 = load ptr, ptr %snda, align 8
  %call = call i64 @__RV_stat_node_get_count(ptr noundef %2)
  store i64 %call, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load i64, ptr %retval, align 8
  ret i64 %3
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_pmd_print(ptr noundef %pmd) #0 {
entry:
  %pmd.addr = alloca ptr, align 8
  store ptr %pmd, ptr %pmd.addr, align 8
  %0 = load ptr, ptr %pmd.addr, align 8
  %tobool = icmp ne ptr %0, null
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %if.end9

if.else:                                          ; preds = %entry
  %1 = load ptr, ptr %pmd.addr, align 8
  %base = getelementptr inbounds %struct.__RV_pmd, ptr %1, i32 0, i32 0
  %2 = load ptr, ptr %base, align 8
  %3 = load ptr, ptr %pmd.addr, align 8
  %bound = getelementptr inbounds %struct.__RV_pmd, ptr %3, i32 0, i32 1
  %4 = load ptr, ptr %bound, align 8
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %2, ptr noundef %4)
  %5 = load ptr, ptr %pmd.addr, align 8
  %snda = getelementptr inbounds %struct.__RV_pmd, ptr %5, i32 0, i32 2
  %6 = load ptr, ptr %snda, align 8
  %tobool2 = icmp ne ptr %6, null
  br i1 %tobool2, label %if.else5, label %if.then3

if.then3:                                         ; preds = %if.else
  %call4 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %if.end

if.else5:                                         ; preds = %if.else
  %7 = load ptr, ptr %pmd.addr, align 8
  %snda6 = getelementptr inbounds %struct.__RV_pmd, ptr %7, i32 0, i32 2
  %8 = load ptr, ptr %snda6, align 8
  %stat = getelementptr inbounds %struct.__RV_stat_node, ptr %8, i32 0, i32 0
  %9 = load i32, ptr %stat, align 8
  %10 = load ptr, ptr %pmd.addr, align 8
  %snda7 = getelementptr inbounds %struct.__RV_pmd, ptr %10, i32 0, i32 2
  %11 = load ptr, ptr %snda7, align 8
  %count = getelementptr inbounds %struct.__RV_stat_node, ptr %11, i32 0, i32 1
  %12 = load i64, ptr %count, align 8
  %call8 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %9, i64 noundef %12)
  br label %if.end

if.end:                                           ; preds = %if.else5, %if.then3
  br label %if.end9

if.end9:                                          ; preds = %if.end, %if.then
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_pmd_set_base(ptr noundef %pmd, ptr noundef %base) #0 {
entry:
  %pmd.addr = alloca ptr, align 8
  %base.addr = alloca ptr, align 8
  store ptr %pmd, ptr %pmd.addr, align 8
  store ptr %base, ptr %base.addr, align 8
  %0 = load ptr, ptr %pmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %base.addr, align 8
  %2 = load ptr, ptr %pmd.addr, align 8
  %base1 = getelementptr inbounds %struct.__RV_pmd, ptr %2, i32 0, i32 0
  store ptr %1, ptr %base1, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_pmd_set_bound(ptr noundef %pmd, ptr noundef %bound) #0 {
entry:
  %pmd.addr = alloca ptr, align 8
  %bound.addr = alloca ptr, align 8
  store ptr %pmd, ptr %pmd.addr, align 8
  store ptr %bound, ptr %bound.addr, align 8
  %0 = load ptr, ptr %pmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %bound.addr, align 8
  %2 = load ptr, ptr %pmd.addr, align 8
  %bound1 = getelementptr inbounds %struct.__RV_pmd, ptr %2, i32 0, i32 1
  store ptr %1, ptr %bound1, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_pmd_c_snda(ptr noundef %pmd, ptr noundef %snda) #0 {
entry:
  %pmd.addr = alloca ptr, align 8
  %snda.addr = alloca ptr, align 8
  store ptr %pmd, ptr %pmd.addr, align 8
  store ptr %snda, ptr %snda.addr, align 8
  %0 = load ptr, ptr %pmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load ptr, ptr %pmd.addr, align 8
  %snda1 = getelementptr inbounds %struct.__RV_pmd, ptr %1, i32 0, i32 2
  %2 = load ptr, ptr %snda1, align 8
  %3 = load ptr, ptr %snda.addr, align 8
  %cmp2 = icmp eq ptr %2, %3
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %4 = load ptr, ptr %pmd.addr, align 8
  call void @__RV_pmd_dc_snda(ptr noundef %4)
  %5 = load ptr, ptr %snda.addr, align 8
  %6 = load ptr, ptr %pmd.addr, align 8
  %snda3 = getelementptr inbounds %struct.__RV_pmd, ptr %6, i32 0, i32 2
  store ptr %5, ptr %snda3, align 8
  %7 = load ptr, ptr %snda.addr, align 8
  call void @__RV_stat_node_inc(ptr noundef %7)
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_pmd_set_stat(ptr noundef %pmd, i32 noundef %stat) #0 {
entry:
  %pmd.addr = alloca ptr, align 8
  %stat.addr = alloca i32, align 4
  store ptr %pmd, ptr %pmd.addr, align 8
  store i32 %stat, ptr %stat.addr, align 4
  %0 = load ptr, ptr %pmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load ptr, ptr %pmd.addr, align 8
  %snda = getelementptr inbounds %struct.__RV_pmd, ptr %1, i32 0, i32 2
  %2 = load ptr, ptr %snda, align 8
  %cmp1 = icmp eq ptr %2, null
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %3 = load i32, ptr %stat.addr, align 4
  %4 = load ptr, ptr %pmd.addr, align 8
  %snda2 = getelementptr inbounds %struct.__RV_pmd, ptr %4, i32 0, i32 2
  %5 = load ptr, ptr %snda2, align 8
  %stat3 = getelementptr inbounds %struct.__RV_stat_node, ptr %5, i32 0, i32 0
  store i32 %3, ptr %stat3, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_pmd_set_ret(ptr noundef %pmd, ptr noundef %snda, i32 noundef %stat, ptr noundef %base, ptr noundef %bound, ptr noundef %ret) #0 {
entry:
  %pmd.addr = alloca ptr, align 8
  %snda.addr = alloca ptr, align 8
  %stat.addr = alloca i32, align 4
  %base.addr = alloca ptr, align 8
  %bound.addr = alloca ptr, align 8
  %ret.addr = alloca ptr, align 8
  store ptr %pmd, ptr %pmd.addr, align 8
  store ptr %snda, ptr %snda.addr, align 8
  store i32 %stat, ptr %stat.addr, align 4
  store ptr %base, ptr %base.addr, align 8
  store ptr %bound, ptr %bound.addr, align 8
  store ptr %ret, ptr %ret.addr, align 8
  %0 = load ptr, ptr %pmd.addr, align 8
  %1 = load ptr, ptr %snda.addr, align 8
  %2 = load i32, ptr %stat.addr, align 4
  %3 = load ptr, ptr %base.addr, align 8
  %4 = load ptr, ptr %bound.addr, align 8
  %call = call ptr @__RV_pmd_set(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3, ptr noundef %4)
  %5 = load ptr, ptr %ret.addr, align 8
  ret ptr %5
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_pmd_set_null(ptr noundef %pmd) #0 {
entry:
  %pmd.addr = alloca ptr, align 8
  store ptr %pmd, ptr %pmd.addr, align 8
  %0 = load ptr, ptr %pmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %if.end5

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %pmd.addr, align 8
  call void @__RV_pmd_dc_snda(ptr noundef %1)
  %2 = load ptr, ptr %pmd.addr, align 8
  %base = getelementptr inbounds %struct.__RV_pmd, ptr %2, i32 0, i32 0
  store ptr null, ptr %base, align 8
  %3 = load ptr, ptr %pmd.addr, align 8
  %bound = getelementptr inbounds %struct.__RV_pmd, ptr %3, i32 0, i32 1
  store ptr null, ptr %bound, align 8
  %4 = load ptr, ptr %pmd.addr, align 8
  %pmdflag = getelementptr inbounds %struct.__RV_pmd, ptr %4, i32 0, i32 3
  %5 = load i8, ptr %pmdflag, align 8
  %conv = zext i8 %5 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %6 = load ptr, ptr %pmd.addr, align 8
  %pmdflag4 = getelementptr inbounds %struct.__RV_pmd, ptr %6, i32 0, i32 3
  store i8 1, ptr %pmdflag4, align 8
  br label %if.end5

if.end5:                                          ; preds = %if.then, %if.then3, %if.end
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_pmd_cp_pmd(ptr noundef %pmd, ptr noundef %pmd2) #0 {
entry:
  %retval = alloca ptr, align 8
  %pmd.addr = alloca ptr, align 8
  %pmd2.addr = alloca ptr, align 8
  store ptr %pmd, ptr %pmd.addr, align 8
  store ptr %pmd2, ptr %pmd2.addr, align 8
  %0 = load ptr, ptr %pmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %pmd.addr, align 8
  store ptr %1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %pmd2.addr, align 8
  %cmp1 = icmp eq ptr %2, null
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  %3 = load ptr, ptr %pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %3)
  br label %if.end10

if.else:                                          ; preds = %if.end
  %4 = load ptr, ptr %pmd.addr, align 8
  %5 = load ptr, ptr %pmd2.addr, align 8
  %snda = getelementptr inbounds %struct.__RV_pmd, ptr %5, i32 0, i32 2
  %6 = load ptr, ptr %snda, align 8
  call void @__RV_pmd_c_snda(ptr noundef %4, ptr noundef %6)
  %7 = load ptr, ptr %pmd2.addr, align 8
  %base = getelementptr inbounds %struct.__RV_pmd, ptr %7, i32 0, i32 0
  %8 = load ptr, ptr %base, align 8
  %9 = load ptr, ptr %pmd.addr, align 8
  %base3 = getelementptr inbounds %struct.__RV_pmd, ptr %9, i32 0, i32 0
  store ptr %8, ptr %base3, align 8
  %10 = load ptr, ptr %pmd2.addr, align 8
  %bound = getelementptr inbounds %struct.__RV_pmd, ptr %10, i32 0, i32 1
  %11 = load ptr, ptr %bound, align 8
  %12 = load ptr, ptr %pmd.addr, align 8
  %bound4 = getelementptr inbounds %struct.__RV_pmd, ptr %12, i32 0, i32 1
  store ptr %11, ptr %bound4, align 8
  %13 = load ptr, ptr %pmd.addr, align 8
  %pmdflag = getelementptr inbounds %struct.__RV_pmd, ptr %13, i32 0, i32 3
  %14 = load i8, ptr %pmdflag, align 8
  %conv = zext i8 %14 to i32
  %cmp5 = icmp eq i32 %conv, 0
  br i1 %cmp5, label %if.then7, label %if.end9

if.then7:                                         ; preds = %if.else
  %15 = load ptr, ptr %pmd.addr, align 8
  %pmdflag8 = getelementptr inbounds %struct.__RV_pmd, ptr %15, i32 0, i32 3
  store i8 1, ptr %pmdflag8, align 8
  br label %if.end9

if.end9:                                          ; preds = %if.then7, %if.else
  br label %if.end10

if.end10:                                         ; preds = %if.end9, %if.then2
  %16 = load ptr, ptr %pmd.addr, align 8
  store ptr %16, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end10, %if.then
  %17 = load ptr, ptr %retval, align 8
  ret ptr %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_pmd_cp_pmd_ret(ptr noundef %pmd, ptr noundef %pmd2, ptr noundef %ret) #0 {
entry:
  %pmd.addr = alloca ptr, align 8
  %pmd2.addr = alloca ptr, align 8
  %ret.addr = alloca ptr, align 8
  store ptr %pmd, ptr %pmd.addr, align 8
  store ptr %pmd2, ptr %pmd2.addr, align 8
  store ptr %ret, ptr %ret.addr, align 8
  %0 = load ptr, ptr %pmd.addr, align 8
  %1 = load ptr, ptr %pmd2.addr, align 8
  %call = call ptr @__RV_pmd_cp_pmd(ptr noundef %0, ptr noundef %1)
  %2 = load ptr, ptr %ret.addr, align 8
  ret ptr %2
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_pmd_cp_fmd_pmd(ptr noundef %pmd, ptr noundef %fpmd) #0 {
entry:
  %retval = alloca ptr, align 8
  %pmd.addr = alloca ptr, align 8
  %fpmd.addr = alloca ptr, align 8
  store ptr %pmd, ptr %pmd.addr, align 8
  store ptr %fpmd, ptr %fpmd.addr, align 8
  %0 = load ptr, ptr %pmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %pmd.addr, align 8
  store ptr %1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %fpmd.addr, align 8
  %cmp1 = icmp eq ptr %2, null
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  %3 = load ptr, ptr %pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %3)
  br label %if.end10

if.else:                                          ; preds = %if.end
  %4 = load ptr, ptr %pmd.addr, align 8
  %5 = load ptr, ptr %fpmd.addr, align 8
  %snda = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %5, i32 0, i32 2
  %6 = load ptr, ptr %snda, align 8
  call void @__RV_pmd_c_snda(ptr noundef %4, ptr noundef %6)
  %7 = load ptr, ptr %fpmd.addr, align 8
  %base = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %7, i32 0, i32 0
  %8 = load ptr, ptr %base, align 8
  %9 = load ptr, ptr %pmd.addr, align 8
  %base3 = getelementptr inbounds %struct.__RV_pmd, ptr %9, i32 0, i32 0
  store ptr %8, ptr %base3, align 8
  %10 = load ptr, ptr %fpmd.addr, align 8
  %bound = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %10, i32 0, i32 1
  %11 = load ptr, ptr %bound, align 8
  %12 = load ptr, ptr %pmd.addr, align 8
  %bound4 = getelementptr inbounds %struct.__RV_pmd, ptr %12, i32 0, i32 1
  store ptr %11, ptr %bound4, align 8
  %13 = load ptr, ptr %pmd.addr, align 8
  %pmdflag = getelementptr inbounds %struct.__RV_pmd, ptr %13, i32 0, i32 3
  %14 = load i8, ptr %pmdflag, align 8
  %conv = zext i8 %14 to i32
  %cmp5 = icmp eq i32 %conv, 0
  br i1 %cmp5, label %if.then7, label %if.end9

if.then7:                                         ; preds = %if.else
  %15 = load ptr, ptr %pmd.addr, align 8
  %pmdflag8 = getelementptr inbounds %struct.__RV_pmd, ptr %15, i32 0, i32 3
  store i8 1, ptr %pmdflag8, align 8
  br label %if.end9

if.end9:                                          ; preds = %if.then7, %if.else
  br label %if.end10

if.end10:                                         ; preds = %if.end9, %if.then2
  %16 = load ptr, ptr %pmd.addr, align 8
  store ptr %16, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end10, %if.then
  %17 = load ptr, ptr %retval, align 8
  ret ptr %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__RV_fmd_pmd_is_null(ptr noundef %fpmd) #0 {
entry:
  %retval = alloca i32, align 4
  %fpmd.addr = alloca ptr, align 8
  store ptr %fpmd, ptr %fpmd.addr, align 8
  %0 = load ptr, ptr %fpmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %fpmd.addr, align 8
  %snda = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %1, i32 0, i32 2
  %2 = load ptr, ptr %snda, align 8
  %cmp1 = icmp eq ptr %2, null
  br i1 %cmp1, label %land.lhs.true, label %if.end6

land.lhs.true:                                    ; preds = %if.end
  %3 = load ptr, ptr %fpmd.addr, align 8
  %base = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %3, i32 0, i32 0
  %4 = load ptr, ptr %base, align 8
  %cmp2 = icmp eq ptr %4, null
  br i1 %cmp2, label %land.lhs.true3, label %if.end6

land.lhs.true3:                                   ; preds = %land.lhs.true
  %5 = load ptr, ptr %fpmd.addr, align 8
  %bound = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %5, i32 0, i32 1
  %6 = load ptr, ptr %bound, align 8
  %cmp4 = icmp eq ptr %6, null
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %land.lhs.true3
  store i32 1, ptr %retval, align 4
  br label %return

if.end6:                                          ; preds = %land.lhs.true3, %land.lhs.true, %if.end
  store i32 0, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end6, %if.then5, %if.then
  %7 = load i32, ptr %retval, align 4
  ret i32 %7
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_fmd_pmd_get_base(ptr noundef %fpmd) #0 {
entry:
  %retval = alloca ptr, align 8
  %fpmd.addr = alloca ptr, align 8
  store ptr %fpmd, ptr %fpmd.addr, align 8
  %0 = load ptr, ptr %fpmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store ptr null, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %fpmd.addr, align 8
  %base = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %1, i32 0, i32 0
  %2 = load ptr, ptr %base, align 8
  store ptr %2, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load ptr, ptr %retval, align 8
  ret ptr %3
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_fmd_pmd_get_bound(ptr noundef %fpmd) #0 {
entry:
  %retval = alloca ptr, align 8
  %fpmd.addr = alloca ptr, align 8
  store ptr %fpmd, ptr %fpmd.addr, align 8
  %0 = load ptr, ptr %fpmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store ptr null, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %fpmd.addr, align 8
  %bound = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %1, i32 0, i32 1
  %2 = load ptr, ptr %bound, align 8
  store ptr %2, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load ptr, ptr %retval, align 8
  ret ptr %3
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_fmd_pmd_get_snda(ptr noundef %fpmd) #0 {
entry:
  %retval = alloca ptr, align 8
  %fpmd.addr = alloca ptr, align 8
  store ptr %fpmd, ptr %fpmd.addr, align 8
  %0 = load ptr, ptr %fpmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store ptr null, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %fpmd.addr, align 8
  %snda = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %1, i32 0, i32 2
  %2 = load ptr, ptr %snda, align 8
  store ptr %2, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load ptr, ptr %retval, align 8
  ret ptr %3
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__RV_fmd_pmd_get_stat(ptr noundef %fpmd) #0 {
entry:
  %retval = alloca i32, align 4
  %fpmd.addr = alloca ptr, align 8
  store ptr %fpmd, ptr %fpmd.addr, align 8
  %0 = load ptr, ptr %fpmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %fpmd.addr, align 8
  %snda = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %1, i32 0, i32 2
  %2 = load ptr, ptr %snda, align 8
  %call = call i32 @__RV_stat_node_get_stat(ptr noundef %2)
  store i32 %call, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, ptr %retval, align 4
  ret i32 %3
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_fmd_pmd_dc_snda(ptr noundef %fpmd) #0 {
entry:
  %fpmd.addr = alloca ptr, align 8
  store ptr %fpmd, ptr %fpmd.addr, align 8
  %0 = load ptr, ptr %fpmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %fpmd.addr, align 8
  %snda = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %1, i32 0, i32 2
  %2 = load ptr, ptr %snda, align 8
  %call = call i32 @__RV_stat_node_dec(ptr noundef %2)
  %cmp1 = icmp eq i32 %call, 1
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %3 = load ptr, ptr %fpmd.addr, align 8
  %snda4 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %3, i32 0, i32 2
  store ptr null, ptr %snda4, align 8
  br label %return

return:                                           ; preds = %if.end3, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_fmd_pmd_c_snda(ptr noundef %fpmd, ptr noundef %snda) #0 {
entry:
  %fpmd.addr = alloca ptr, align 8
  %snda.addr = alloca ptr, align 8
  store ptr %fpmd, ptr %fpmd.addr, align 8
  store ptr %snda, ptr %snda.addr, align 8
  %0 = load ptr, ptr %fpmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load ptr, ptr %fpmd.addr, align 8
  %snda1 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %1, i32 0, i32 2
  %2 = load ptr, ptr %snda1, align 8
  %3 = load ptr, ptr %snda.addr, align 8
  %cmp2 = icmp eq ptr %2, %3
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %4 = load ptr, ptr %fpmd.addr, align 8
  call void @__RV_fmd_pmd_dc_snda(ptr noundef %4)
  %5 = load ptr, ptr %snda.addr, align 8
  %6 = load ptr, ptr %fpmd.addr, align 8
  %snda3 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %6, i32 0, i32 2
  store ptr %5, ptr %snda3, align 8
  %7 = load ptr, ptr %snda.addr, align 8
  call void @__RV_stat_node_inc(ptr noundef %7)
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_fmd_pmd_set(ptr noundef %fpmd, ptr noundef %snda, i32 noundef %stat, ptr noundef %base, ptr noundef %bound) #0 {
entry:
  %fpmd.addr = alloca ptr, align 8
  %snda.addr = alloca ptr, align 8
  %stat.addr = alloca i32, align 4
  %base.addr = alloca ptr, align 8
  %bound.addr = alloca ptr, align 8
  store ptr %fpmd, ptr %fpmd.addr, align 8
  store ptr %snda, ptr %snda.addr, align 8
  store i32 %stat, ptr %stat.addr, align 4
  store ptr %base, ptr %base.addr, align 8
  store ptr %bound, ptr %bound.addr, align 8
  %0 = load ptr, ptr %fpmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %snda.addr, align 8
  %cmp1 = icmp ne ptr %1, null
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  %2 = load ptr, ptr %fpmd.addr, align 8
  %3 = load ptr, ptr %snda.addr, align 8
  call void @__RV_fmd_pmd_c_snda(ptr noundef %2, ptr noundef %3)
  br label %if.end7

if.else:                                          ; preds = %if.end
  %4 = load ptr, ptr %fpmd.addr, align 8
  call void @__RV_fmd_pmd_dc_snda(ptr noundef %4)
  %5 = load i32, ptr %stat.addr, align 4
  %cmp3 = icmp ne i32 %5, 0
  br i1 %cmp3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.else
  %6 = load i32, ptr %stat.addr, align 4
  %call = call ptr @__RV_stat_node_create(i32 noundef %6, i64 noundef 1)
  %7 = load ptr, ptr %fpmd.addr, align 8
  %snda5 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %7, i32 0, i32 2
  store ptr %call, ptr %snda5, align 8
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.then2
  %8 = load ptr, ptr %base.addr, align 8
  %9 = load ptr, ptr %fpmd.addr, align 8
  %base8 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %9, i32 0, i32 0
  store ptr %8, ptr %base8, align 8
  %10 = load ptr, ptr %bound.addr, align 8
  %11 = load ptr, ptr %fpmd.addr, align 8
  %bound9 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %11, i32 0, i32 1
  store ptr %10, ptr %bound9, align 8
  br label %return

return:                                           ; preds = %if.end7, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_fmd_pmd_set_null(ptr noundef %fpmd) #0 {
entry:
  %fpmd.addr = alloca ptr, align 8
  store ptr %fpmd, ptr %fpmd.addr, align 8
  %0 = load ptr, ptr %fpmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %fpmd.addr, align 8
  call void @__RV_fmd_pmd_dc_snda(ptr noundef %1)
  %2 = load ptr, ptr %fpmd.addr, align 8
  %base = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %2, i32 0, i32 0
  store ptr null, ptr %base, align 8
  %3 = load ptr, ptr %fpmd.addr, align 8
  %bound = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %3, i32 0, i32 1
  store ptr null, ptr %bound, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_fmd_pmd_cp_pmd(ptr noundef %fpmd, ptr noundef %pmd) #0 {
entry:
  %fpmd.addr = alloca ptr, align 8
  %pmd.addr = alloca ptr, align 8
  store ptr %fpmd, ptr %fpmd.addr, align 8
  store ptr %pmd, ptr %pmd.addr, align 8
  %0 = load ptr, ptr %fpmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %if.end5

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %pmd.addr, align 8
  %cmp1 = icmp eq ptr %1, null
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  %2 = load ptr, ptr %fpmd.addr, align 8
  call void @__RV_fmd_pmd_set_null(ptr noundef %2)
  br label %if.end5

if.else:                                          ; preds = %if.end
  %3 = load ptr, ptr %fpmd.addr, align 8
  %4 = load ptr, ptr %pmd.addr, align 8
  %snda = getelementptr inbounds %struct.__RV_pmd, ptr %4, i32 0, i32 2
  %5 = load ptr, ptr %snda, align 8
  call void @__RV_fmd_pmd_c_snda(ptr noundef %3, ptr noundef %5)
  %6 = load ptr, ptr %pmd.addr, align 8
  %base = getelementptr inbounds %struct.__RV_pmd, ptr %6, i32 0, i32 0
  %7 = load ptr, ptr %base, align 8
  %8 = load ptr, ptr %fpmd.addr, align 8
  %base3 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %8, i32 0, i32 0
  store ptr %7, ptr %base3, align 8
  %9 = load ptr, ptr %pmd.addr, align 8
  %bound = getelementptr inbounds %struct.__RV_pmd, ptr %9, i32 0, i32 1
  %10 = load ptr, ptr %bound, align 8
  %11 = load ptr, ptr %fpmd.addr, align 8
  %bound4 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %11, i32 0, i32 1
  store ptr %10, ptr %bound4, align 8
  br label %if.end5

if.end5:                                          ; preds = %if.then, %if.else, %if.then2
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_fmd_create(ptr noundef %func, i8 noundef zeroext %capacity) #0 {
entry:
  %retval = alloca ptr, align 8
  %func.addr = alloca ptr, align 8
  %capacity.addr = alloca i8, align 1
  %fmd = alloca ptr, align 8
  %i = alloca i8, align 1
  store ptr %func, ptr %func.addr, align 8
  store i8 %capacity, ptr %capacity.addr, align 1
  %call = call noalias ptr @malloc(i64 noundef 32) #12
  store ptr %call, ptr %fmd, align 8
  %0 = load ptr, ptr %fmd, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store ptr null, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8, ptr %capacity.addr, align 1
  %conv = zext i8 %1 to i64
  %mul = mul i64 %conv, 24
  %call1 = call noalias ptr @malloc(i64 noundef %mul) #12
  %2 = load ptr, ptr %fmd, align 8
  %pmds = getelementptr inbounds %struct.__RV_fmd, ptr %2, i32 0, i32 0
  store ptr %call1, ptr %pmds, align 8
  %3 = load ptr, ptr %fmd, align 8
  %pmds2 = getelementptr inbounds %struct.__RV_fmd, ptr %3, i32 0, i32 0
  %4 = load ptr, ptr %pmds2, align 8
  %cmp3 = icmp eq ptr %4, null
  br i1 %cmp3, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  %5 = load ptr, ptr %fmd, align 8
  call void @free(ptr noundef %5) #13
  store ptr null, ptr %retval, align 8
  br label %return

if.end6:                                          ; preds = %if.end
  store i8 0, ptr %i, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end6
  %6 = load i8, ptr %i, align 1
  %conv7 = zext i8 %6 to i32
  %7 = load i8, ptr %capacity.addr, align 1
  %conv8 = zext i8 %7 to i32
  %cmp9 = icmp slt i32 %conv7, %conv8
  br i1 %cmp9, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %8 = load ptr, ptr %fmd, align 8
  %pmds11 = getelementptr inbounds %struct.__RV_fmd, ptr %8, i32 0, i32 0
  %9 = load ptr, ptr %pmds11, align 8
  %10 = load i8, ptr %i, align 1
  %idxprom = zext i8 %10 to i64
  %arrayidx = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %9, i64 %idxprom
  %base = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %arrayidx, i32 0, i32 0
  store ptr null, ptr %base, align 8
  %11 = load ptr, ptr %fmd, align 8
  %pmds12 = getelementptr inbounds %struct.__RV_fmd, ptr %11, i32 0, i32 0
  %12 = load ptr, ptr %pmds12, align 8
  %13 = load i8, ptr %i, align 1
  %idxprom13 = zext i8 %13 to i64
  %arrayidx14 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %12, i64 %idxprom13
  %bound = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %arrayidx14, i32 0, i32 1
  store ptr null, ptr %bound, align 8
  %14 = load ptr, ptr %fmd, align 8
  %pmds15 = getelementptr inbounds %struct.__RV_fmd, ptr %14, i32 0, i32 0
  %15 = load ptr, ptr %pmds15, align 8
  %16 = load i8, ptr %i, align 1
  %idxprom16 = zext i8 %16 to i64
  %arrayidx17 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %15, i64 %idxprom16
  %snda = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %arrayidx17, i32 0, i32 2
  store ptr null, ptr %snda, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %17 = load i8, ptr %i, align 1
  %inc = add i8 %17, 1
  store i8 %inc, ptr %i, align 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %18 = load i8, ptr %capacity.addr, align 1
  %19 = load ptr, ptr %fmd, align 8
  %capacity18 = getelementptr inbounds %struct.__RV_fmd, ptr %19, i32 0, i32 1
  store i8 %18, ptr %capacity18, align 8
  %20 = load ptr, ptr %func.addr, align 8
  %21 = load ptr, ptr %fmd, align 8
  %func19 = getelementptr inbounds %struct.__RV_fmd, ptr %21, i32 0, i32 2
  store ptr %20, ptr %func19, align 8
  %22 = load ptr, ptr %fmd, align 8
  %next = getelementptr inbounds %struct.__RV_fmd, ptr %22, i32 0, i32 3
  store ptr null, ptr %next, align 8
  %23 = load ptr, ptr %fmd, align 8
  store ptr %23, ptr %retval, align 8
  br label %return

return:                                           ; preds = %for.end, %if.then5, %if.then
  %24 = load ptr, ptr %retval, align 8
  ret ptr %24
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_fmd_free_pmds(ptr noundef %fmd) #0 {
entry:
  %fmd.addr = alloca ptr, align 8
  %i = alloca i8, align 1
  store ptr %fmd, ptr %fmd.addr, align 8
  %0 = load ptr, ptr %fmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load ptr, ptr %fmd.addr, align 8
  %pmds = getelementptr inbounds %struct.__RV_fmd, ptr %1, i32 0, i32 0
  %2 = load ptr, ptr %pmds, align 8
  %cmp1 = icmp eq ptr %2, null
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  store i8 0, ptr %i, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i8, ptr %i, align 1
  %conv = zext i8 %3 to i32
  %4 = load ptr, ptr %fmd.addr, align 8
  %capacity = getelementptr inbounds %struct.__RV_fmd, ptr %4, i32 0, i32 1
  %5 = load i8, ptr %capacity, align 8
  %conv2 = zext i8 %5 to i32
  %cmp3 = icmp slt i32 %conv, %conv2
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load ptr, ptr %fmd.addr, align 8
  %pmds5 = getelementptr inbounds %struct.__RV_fmd, ptr %6, i32 0, i32 0
  %7 = load ptr, ptr %pmds5, align 8
  %8 = load i8, ptr %i, align 1
  %conv6 = zext i8 %8 to i32
  %idx.ext = sext i32 %conv6 to i64
  %add.ptr = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %7, i64 %idx.ext
  call void @__RV_fmd_pmd_dc_snda(ptr noundef %add.ptr)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i8, ptr %i, align 1
  %inc = add i8 %9, 1
  store i8 %inc, ptr %i, align 1
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  %10 = load ptr, ptr %fmd.addr, align 8
  %pmds7 = getelementptr inbounds %struct.__RV_fmd, ptr %10, i32 0, i32 0
  %11 = load ptr, ptr %pmds7, align 8
  call void @free(ptr noundef %11) #13
  %12 = load ptr, ptr %fmd.addr, align 8
  %pmds8 = getelementptr inbounds %struct.__RV_fmd, ptr %12, i32 0, i32 0
  store ptr null, ptr %pmds8, align 8
  %13 = load ptr, ptr %fmd.addr, align 8
  %capacity9 = getelementptr inbounds %struct.__RV_fmd, ptr %13, i32 0, i32 1
  store i8 0, ptr %capacity9, align 8
  br label %return

return:                                           ; preds = %for.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_fmd_free(ptr noundef %fmd) #0 {
entry:
  %fmd.addr = alloca ptr, align 8
  store ptr %fmd, ptr %fmd.addr, align 8
  %0 = load ptr, ptr %fmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %fmd.addr, align 8
  call void @__RV_fmd_free_pmds(ptr noundef %1)
  %2 = load ptr, ptr %fmd.addr, align 8
  call void @free(ptr noundef %2) #13
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_fmd_get_fmd_pmd(ptr noundef %fmd, i8 noundef zeroext %i) #0 {
entry:
  %retval = alloca ptr, align 8
  %fmd.addr = alloca ptr, align 8
  %i.addr = alloca i8, align 1
  store ptr %fmd, ptr %fmd.addr, align 8
  store i8 %i, ptr %i.addr, align 1
  %0 = load ptr, ptr %fmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load ptr, ptr %fmd.addr, align 8
  %pmds = getelementptr inbounds %struct.__RV_fmd, ptr %1, i32 0, i32 0
  %2 = load ptr, ptr %pmds, align 8
  %cmp1 = icmp eq ptr %2, null
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %3 = load i8, ptr %i.addr, align 1
  %conv = zext i8 %3 to i32
  %4 = load ptr, ptr %fmd.addr, align 8
  %capacity = getelementptr inbounds %struct.__RV_fmd, ptr %4, i32 0, i32 1
  %5 = load i8, ptr %capacity, align 8
  %conv3 = zext i8 %5 to i32
  %cmp4 = icmp sge i32 %conv, %conv3
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  store ptr null, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  %6 = load ptr, ptr %fmd.addr, align 8
  %pmds6 = getelementptr inbounds %struct.__RV_fmd, ptr %6, i32 0, i32 0
  %7 = load ptr, ptr %pmds6, align 8
  %8 = load i8, ptr %i.addr, align 1
  %conv7 = zext i8 %8 to i32
  %idx.ext = sext i32 %conv7 to i64
  %add.ptr = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %7, i64 %idx.ext
  store ptr %add.ptr, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %9 = load ptr, ptr %retval, align 8
  ret ptr %9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_fmd_dc_snda(ptr noundef %fmd) #0 {
entry:
  %fmd.addr = alloca ptr, align 8
  %i = alloca i8, align 1
  store ptr %fmd, ptr %fmd.addr, align 8
  %0 = load ptr, ptr %fmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load ptr, ptr %fmd.addr, align 8
  %pmds = getelementptr inbounds %struct.__RV_fmd, ptr %1, i32 0, i32 0
  %2 = load ptr, ptr %pmds, align 8
  %cmp1 = icmp eq ptr %2, null
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %for.end

if.end:                                           ; preds = %lor.lhs.false
  store i8 0, ptr %i, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i8, ptr %i, align 1
  %conv = zext i8 %3 to i32
  %4 = load ptr, ptr %fmd.addr, align 8
  %capacity = getelementptr inbounds %struct.__RV_fmd, ptr %4, i32 0, i32 1
  %5 = load i8, ptr %capacity, align 8
  %conv2 = zext i8 %5 to i32
  %cmp3 = icmp slt i32 %conv, %conv2
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load ptr, ptr %fmd.addr, align 8
  %pmds5 = getelementptr inbounds %struct.__RV_fmd, ptr %6, i32 0, i32 0
  %7 = load ptr, ptr %pmds5, align 8
  %8 = load i8, ptr %i, align 1
  %conv6 = zext i8 %8 to i32
  %idx.ext = sext i32 %conv6 to i64
  %add.ptr = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %7, i64 %idx.ext
  call void @__RV_fmd_pmd_dc_snda(ptr noundef %add.ptr)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i8, ptr %i, align 1
  %inc = add i8 %9, 1
  store i8 %inc, ptr %i, align 1
  br label %for.cond, !llvm.loop !9

for.end:                                          ; preds = %if.then, %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_fmd_set_null(ptr noundef %fmd) #0 {
entry:
  %fmd.addr = alloca ptr, align 8
  %i = alloca i8, align 1
  store ptr %fmd, ptr %fmd.addr, align 8
  %0 = load ptr, ptr %fmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load ptr, ptr %fmd.addr, align 8
  %pmds = getelementptr inbounds %struct.__RV_fmd, ptr %1, i32 0, i32 0
  %2 = load ptr, ptr %pmds, align 8
  %cmp1 = icmp eq ptr %2, null
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %for.end

if.end:                                           ; preds = %lor.lhs.false
  store i8 0, ptr %i, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i8, ptr %i, align 1
  %conv = zext i8 %3 to i32
  %4 = load ptr, ptr %fmd.addr, align 8
  %capacity = getelementptr inbounds %struct.__RV_fmd, ptr %4, i32 0, i32 1
  %5 = load i8, ptr %capacity, align 8
  %conv2 = zext i8 %5 to i32
  %cmp3 = icmp slt i32 %conv, %conv2
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load ptr, ptr %fmd.addr, align 8
  %pmds5 = getelementptr inbounds %struct.__RV_fmd, ptr %6, i32 0, i32 0
  %7 = load ptr, ptr %pmds5, align 8
  %8 = load i8, ptr %i, align 1
  %conv6 = zext i8 %8 to i32
  %idx.ext = sext i32 %conv6 to i64
  %add.ptr = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %7, i64 %idx.ext
  call void @__RV_fmd_pmd_set_null(ptr noundef %add.ptr)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i8, ptr %i, align 1
  %inc = add i8 %9, 1
  store i8 %inc, ptr %i, align 1
  br label %for.cond, !llvm.loop !10

for.end:                                          ; preds = %if.then, %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_fmd_cp_pmd(ptr noundef %fmd, i8 noundef zeroext %i, ptr noundef %pmd) #0 {
entry:
  %fmd.addr = alloca ptr, align 8
  %i.addr = alloca i8, align 1
  %pmd.addr = alloca ptr, align 8
  store ptr %fmd, ptr %fmd.addr, align 8
  store i8 %i, ptr %i.addr, align 1
  store ptr %pmd, ptr %pmd.addr, align 8
  %0 = load ptr, ptr %fmd.addr, align 8
  %1 = load i8, ptr %i.addr, align 1
  %call = call ptr @__RV_fmd_get_fmd_pmd(ptr noundef %0, i8 noundef zeroext %1)
  %2 = load ptr, ptr %pmd.addr, align 8
  call void @__RV_fmd_pmd_cp_pmd(ptr noundef %call, ptr noundef %2)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_fmd_resize_pmds(ptr noundef %fmd, i8 noundef zeroext %new_capacity, i8 noundef zeroext %clear) #0 {
entry:
  %fmd.addr = alloca ptr, align 8
  %new_capacity.addr = alloca i8, align 1
  %clear.addr = alloca i8, align 1
  %i = alloca i8, align 1
  %new_pmds = alloca ptr, align 8
  store ptr %fmd, ptr %fmd.addr, align 8
  store i8 %new_capacity, ptr %new_capacity.addr, align 1
  store i8 %clear, ptr %clear.addr, align 1
  %0 = load ptr, ptr %fmd.addr, align 8
  %capacity = getelementptr inbounds %struct.__RV_fmd, ptr %0, i32 0, i32 1
  %1 = load i8, ptr %capacity, align 8
  %conv = zext i8 %1 to i32
  %2 = load i8, ptr %new_capacity.addr, align 1
  %conv1 = zext i8 %2 to i32
  %cmp = icmp sge i32 %conv, %conv1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %3 = load i8, ptr %clear.addr, align 1
  %conv3 = zext i8 %3 to i32
  %cmp4 = icmp ne i32 %conv3, 0
  br i1 %cmp4, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then
  store i8 0, ptr %i, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then6
  %4 = load i8, ptr %i, align 1
  %conv7 = zext i8 %4 to i32
  %5 = load i8, ptr %new_capacity.addr, align 1
  %conv8 = zext i8 %5 to i32
  %cmp9 = icmp slt i32 %conv7, %conv8
  br i1 %cmp9, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load ptr, ptr %fmd.addr, align 8
  %pmds = getelementptr inbounds %struct.__RV_fmd, ptr %6, i32 0, i32 0
  %7 = load ptr, ptr %pmds, align 8
  %8 = load i8, ptr %i, align 1
  %conv11 = zext i8 %8 to i32
  %idx.ext = sext i32 %conv11 to i64
  %add.ptr = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %7, i64 %idx.ext
  call void @__RV_fmd_pmd_set_null(ptr noundef %add.ptr)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i8, ptr %i, align 1
  %inc = add i8 %9, 1
  store i8 %inc, ptr %i, align 1
  br label %for.cond, !llvm.loop !11

for.end:                                          ; preds = %for.cond
  br label %if.end

if.end:                                           ; preds = %for.end, %if.then
  %10 = load i8, ptr %new_capacity.addr, align 1
  store i8 %10, ptr %i, align 1
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc23, %if.end
  %11 = load i8, ptr %i, align 1
  %conv13 = zext i8 %11 to i32
  %12 = load ptr, ptr %fmd.addr, align 8
  %capacity14 = getelementptr inbounds %struct.__RV_fmd, ptr %12, i32 0, i32 1
  %13 = load i8, ptr %capacity14, align 8
  %conv15 = zext i8 %13 to i32
  %cmp16 = icmp slt i32 %conv13, %conv15
  br i1 %cmp16, label %for.body18, label %for.end25

for.body18:                                       ; preds = %for.cond12
  %14 = load ptr, ptr %fmd.addr, align 8
  %pmds19 = getelementptr inbounds %struct.__RV_fmd, ptr %14, i32 0, i32 0
  %15 = load ptr, ptr %pmds19, align 8
  %16 = load i8, ptr %i, align 1
  %conv20 = zext i8 %16 to i32
  %idx.ext21 = sext i32 %conv20 to i64
  %add.ptr22 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %15, i64 %idx.ext21
  call void @__RV_fmd_pmd_set_null(ptr noundef %add.ptr22)
  br label %for.inc23

for.inc23:                                        ; preds = %for.body18
  %17 = load i8, ptr %i, align 1
  %inc24 = add i8 %17, 1
  store i8 %inc24, ptr %i, align 1
  br label %for.cond12, !llvm.loop !12

for.end25:                                        ; preds = %for.cond12
  br label %if.end98

if.else:                                          ; preds = %entry
  %18 = load i8, ptr %new_capacity.addr, align 1
  %conv26 = zext i8 %18 to i64
  %mul = mul i64 %conv26, 24
  %call = call noalias ptr @malloc(i64 noundef %mul) #12
  store ptr %call, ptr %new_pmds, align 8
  %19 = load i8, ptr %clear.addr, align 1
  %conv27 = zext i8 %19 to i32
  %cmp28 = icmp ne i32 %conv27, 0
  br i1 %cmp28, label %if.then30, label %if.else44

if.then30:                                        ; preds = %if.else
  store i8 0, ptr %i, align 1
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc41, %if.then30
  %20 = load i8, ptr %i, align 1
  %conv32 = zext i8 %20 to i32
  %21 = load i8, ptr %new_capacity.addr, align 1
  %conv33 = zext i8 %21 to i32
  %cmp34 = icmp slt i32 %conv32, %conv33
  br i1 %cmp34, label %for.body36, label %for.end43

for.body36:                                       ; preds = %for.cond31
  %22 = load ptr, ptr %new_pmds, align 8
  %23 = load i8, ptr %i, align 1
  %idxprom = zext i8 %23 to i64
  %arrayidx = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %22, i64 %idxprom
  %base = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %arrayidx, i32 0, i32 0
  store ptr null, ptr %base, align 8
  %24 = load ptr, ptr %new_pmds, align 8
  %25 = load i8, ptr %i, align 1
  %idxprom37 = zext i8 %25 to i64
  %arrayidx38 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %24, i64 %idxprom37
  %bound = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %arrayidx38, i32 0, i32 1
  store ptr null, ptr %bound, align 8
  %26 = load ptr, ptr %new_pmds, align 8
  %27 = load i8, ptr %i, align 1
  %idxprom39 = zext i8 %27 to i64
  %arrayidx40 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %26, i64 %idxprom39
  %snda = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %arrayidx40, i32 0, i32 2
  store ptr null, ptr %snda, align 8
  br label %for.inc41

for.inc41:                                        ; preds = %for.body36
  %28 = load i8, ptr %i, align 1
  %inc42 = add i8 %28, 1
  store i8 %inc42, ptr %i, align 1
  br label %for.cond31, !llvm.loop !13

for.end43:                                        ; preds = %for.cond31
  br label %if.end94

if.else44:                                        ; preds = %if.else
  store i8 0, ptr %i, align 1
  br label %for.cond45

for.cond45:                                       ; preds = %for.inc73, %if.else44
  %29 = load i8, ptr %i, align 1
  %conv46 = zext i8 %29 to i32
  %30 = load ptr, ptr %fmd.addr, align 8
  %capacity47 = getelementptr inbounds %struct.__RV_fmd, ptr %30, i32 0, i32 1
  %31 = load i8, ptr %capacity47, align 8
  %conv48 = zext i8 %31 to i32
  %cmp49 = icmp slt i32 %conv46, %conv48
  br i1 %cmp49, label %for.body51, label %for.end75

for.body51:                                       ; preds = %for.cond45
  %32 = load ptr, ptr %fmd.addr, align 8
  %pmds52 = getelementptr inbounds %struct.__RV_fmd, ptr %32, i32 0, i32 0
  %33 = load ptr, ptr %pmds52, align 8
  %34 = load i8, ptr %i, align 1
  %idxprom53 = zext i8 %34 to i64
  %arrayidx54 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %33, i64 %idxprom53
  %base55 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %arrayidx54, i32 0, i32 0
  %35 = load ptr, ptr %base55, align 8
  %36 = load ptr, ptr %new_pmds, align 8
  %37 = load i8, ptr %i, align 1
  %idxprom56 = zext i8 %37 to i64
  %arrayidx57 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %36, i64 %idxprom56
  %base58 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %arrayidx57, i32 0, i32 0
  store ptr %35, ptr %base58, align 8
  %38 = load ptr, ptr %fmd.addr, align 8
  %pmds59 = getelementptr inbounds %struct.__RV_fmd, ptr %38, i32 0, i32 0
  %39 = load ptr, ptr %pmds59, align 8
  %40 = load i8, ptr %i, align 1
  %idxprom60 = zext i8 %40 to i64
  %arrayidx61 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %39, i64 %idxprom60
  %bound62 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %arrayidx61, i32 0, i32 1
  %41 = load ptr, ptr %bound62, align 8
  %42 = load ptr, ptr %new_pmds, align 8
  %43 = load i8, ptr %i, align 1
  %idxprom63 = zext i8 %43 to i64
  %arrayidx64 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %42, i64 %idxprom63
  %bound65 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %arrayidx64, i32 0, i32 1
  store ptr %41, ptr %bound65, align 8
  %44 = load ptr, ptr %fmd.addr, align 8
  %pmds66 = getelementptr inbounds %struct.__RV_fmd, ptr %44, i32 0, i32 0
  %45 = load ptr, ptr %pmds66, align 8
  %46 = load i8, ptr %i, align 1
  %idxprom67 = zext i8 %46 to i64
  %arrayidx68 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %45, i64 %idxprom67
  %snda69 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %arrayidx68, i32 0, i32 2
  %47 = load ptr, ptr %snda69, align 8
  %48 = load ptr, ptr %new_pmds, align 8
  %49 = load i8, ptr %i, align 1
  %idxprom70 = zext i8 %49 to i64
  %arrayidx71 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %48, i64 %idxprom70
  %snda72 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %arrayidx71, i32 0, i32 2
  store ptr %47, ptr %snda72, align 8
  br label %for.inc73

for.inc73:                                        ; preds = %for.body51
  %50 = load i8, ptr %i, align 1
  %inc74 = add i8 %50, 1
  store i8 %inc74, ptr %i, align 1
  br label %for.cond45, !llvm.loop !14

for.end75:                                        ; preds = %for.cond45
  br label %for.cond76

for.cond76:                                       ; preds = %for.inc91, %for.end75
  %51 = load i8, ptr %i, align 1
  %conv77 = zext i8 %51 to i32
  %52 = load i8, ptr %new_capacity.addr, align 1
  %conv78 = zext i8 %52 to i32
  %cmp79 = icmp slt i32 %conv77, %conv78
  br i1 %cmp79, label %for.body81, label %for.end93

for.body81:                                       ; preds = %for.cond76
  %53 = load ptr, ptr %new_pmds, align 8
  %54 = load i8, ptr %i, align 1
  %idxprom82 = zext i8 %54 to i64
  %arrayidx83 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %53, i64 %idxprom82
  %base84 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %arrayidx83, i32 0, i32 0
  store ptr null, ptr %base84, align 8
  %55 = load ptr, ptr %new_pmds, align 8
  %56 = load i8, ptr %i, align 1
  %idxprom85 = zext i8 %56 to i64
  %arrayidx86 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %55, i64 %idxprom85
  %bound87 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %arrayidx86, i32 0, i32 1
  store ptr null, ptr %bound87, align 8
  %57 = load ptr, ptr %new_pmds, align 8
  %58 = load i8, ptr %i, align 1
  %idxprom88 = zext i8 %58 to i64
  %arrayidx89 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %57, i64 %idxprom88
  %snda90 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %arrayidx89, i32 0, i32 2
  store ptr null, ptr %snda90, align 8
  br label %for.inc91

for.inc91:                                        ; preds = %for.body81
  %59 = load i8, ptr %i, align 1
  %inc92 = add i8 %59, 1
  store i8 %inc92, ptr %i, align 1
  br label %for.cond76, !llvm.loop !15

for.end93:                                        ; preds = %for.cond76
  br label %if.end94

if.end94:                                         ; preds = %for.end93, %for.end43
  %60 = load ptr, ptr %fmd.addr, align 8
  %pmds95 = getelementptr inbounds %struct.__RV_fmd, ptr %60, i32 0, i32 0
  %61 = load ptr, ptr %pmds95, align 8
  call void @free(ptr noundef %61) #13
  %62 = load ptr, ptr %new_pmds, align 8
  %63 = load ptr, ptr %fmd.addr, align 8
  %pmds96 = getelementptr inbounds %struct.__RV_fmd, ptr %63, i32 0, i32 0
  store ptr %62, ptr %pmds96, align 8
  %64 = load i8, ptr %new_capacity.addr, align 1
  %65 = load ptr, ptr %fmd.addr, align 8
  %capacity97 = getelementptr inbounds %struct.__RV_fmd, ptr %65, i32 0, i32 1
  store i8 %64, ptr %capacity97, align 8
  br label %if.end98

if.end98:                                         ; preds = %if.end94, %for.end25
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_trie_get_index(ptr noundef %ptra, ptr noundef %primary_index, ptr noundef %secondary_index) #0 {
entry:
  %ptra.addr = alloca ptr, align 8
  %primary_index.addr = alloca ptr, align 8
  %secondary_index.addr = alloca ptr, align 8
  %key = alloca i64, align 8
  store ptr %ptra, ptr %ptra.addr, align 8
  store ptr %primary_index, ptr %primary_index.addr, align 8
  store ptr %secondary_index, ptr %secondary_index.addr, align 8
  %0 = load ptr, ptr %ptra.addr, align 8
  %1 = ptrtoint ptr %0 to i64
  store i64 %1, ptr %key, align 8
  %2 = load i64, ptr %key, align 8
  %shr = lshr i64 %2, 25
  %and = and i64 %shr, 8388607
  %3 = load ptr, ptr %primary_index.addr, align 8
  store i64 %and, ptr %3, align 8
  %4 = load i64, ptr %key, align 8
  %shr1 = lshr i64 %4, 3
  %and2 = and i64 %shr1, 4194303
  %5 = load ptr, ptr %secondary_index.addr, align 8
  store i64 %and2, ptr %5, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_trie_create() #0 {
entry:
  %len = alloca i64, align 8
  %trie_primary = alloca ptr, align 8
  store i64 67108864, ptr %len, align 8
  %0 = load i64, ptr %len, align 8
  %call = call ptr @mmap(ptr noundef null, i64 noundef %0, i32 noundef 3, i32 noundef 16418, i32 noundef -1, i64 noundef 0) #13
  store ptr %call, ptr %trie_primary, align 8
  %1 = load ptr, ptr %trie_primary, align 8
  %cmp = icmp ne ptr %1, inttoptr (i64 -1 to ptr)
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(ptr noundef @.str.6, ptr noundef @.str.7, i32 noundef 873, ptr noundef @__PRETTY_FUNCTION__.__RV_trie_create) #14
  unreachable

if.end:                                           ; preds = %if.then
  %2 = load ptr, ptr %trie_primary, align 8
  ret ptr %2
}

; Function Attrs: nounwind
declare ptr @mmap(ptr noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_trie_create_secondary() #0 {
entry:
  %len = alloca i64, align 8
  %trie_secondary = alloca ptr, align 8
  store i64 134217728, ptr %len, align 8
  %0 = load i64, ptr %len, align 8
  %call = call ptr @mmap(ptr noundef null, i64 noundef %0, i32 noundef 3, i32 noundef 16418, i32 noundef -1, i64 noundef 0) #13
  store ptr %call, ptr %trie_secondary, align 8
  %1 = load ptr, ptr %trie_secondary, align 8
  %cmp = icmp ne ptr %1, inttoptr (i64 -1 to ptr)
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(ptr noundef @.str.8, ptr noundef @.str.7, i32 noundef 888, ptr noundef @__PRETTY_FUNCTION__.__RV_trie_create_secondary) #14
  unreachable

if.end:                                           ; preds = %if.then
  %2 = load ptr, ptr %trie_secondary, align 8
  ret ptr %2
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_trie_find_pmd(ptr noundef %tbl, ptr noundef %ptra) #0 {
entry:
  %retval = alloca ptr, align 8
  %tbl.addr = alloca ptr, align 8
  %ptra.addr = alloca ptr, align 8
  %primary_index = alloca i64, align 8
  %secondary_index = alloca i64, align 8
  %secondary_table = alloca ptr, align 8
  store ptr %tbl, ptr %tbl.addr, align 8
  store ptr %ptra, ptr %ptra.addr, align 8
  %0 = load ptr, ptr %ptra.addr, align 8
  call void @__RV_trie_get_index(ptr noundef %0, ptr noundef %primary_index, ptr noundef %secondary_index)
  %1 = load ptr, ptr %tbl.addr, align 8
  %2 = load i64, ptr %primary_index, align 8
  %arrayidx = getelementptr inbounds ptr, ptr %1, i64 %2
  %3 = load ptr, ptr %arrayidx, align 8
  store ptr %3, ptr %secondary_table, align 8
  %4 = load ptr, ptr %secondary_table, align 8
  %cmp = icmp eq ptr %4, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store ptr null, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %5 = load ptr, ptr %secondary_table, align 8
  %6 = load i64, ptr %secondary_index, align 8
  %arrayidx1 = getelementptr inbounds %struct.__RV_pmd, ptr %5, i64 %6
  %pmdflag = getelementptr inbounds %struct.__RV_pmd, ptr %arrayidx1, i32 0, i32 3
  %7 = load i8, ptr %pmdflag, align 8
  %conv = zext i8 %7 to i32
  %cmp2 = icmp eq i32 %conv, 0
  br i1 %cmp2, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  store ptr null, ptr %retval, align 8
  br label %return

if.end5:                                          ; preds = %if.end
  %8 = load ptr, ptr %secondary_table, align 8
  %9 = load i64, ptr %secondary_index, align 8
  %add.ptr = getelementptr inbounds %struct.__RV_pmd, ptr %8, i64 %9
  store ptr %add.ptr, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end5, %if.then4, %if.then
  %10 = load ptr, ptr %retval, align 8
  ret ptr %10
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_trie_insert_pmd_ptr(ptr noundef %tbl, ptr noundef %ptra) #0 {
entry:
  %tbl.addr = alloca ptr, align 8
  %ptra.addr = alloca ptr, align 8
  %primary_index = alloca i64, align 8
  %secondary_index = alloca i64, align 8
  %secondary_table = alloca ptr, align 8
  store ptr %tbl, ptr %tbl.addr, align 8
  store ptr %ptra, ptr %ptra.addr, align 8
  %0 = load ptr, ptr %ptra.addr, align 8
  call void @__RV_trie_get_index(ptr noundef %0, ptr noundef %primary_index, ptr noundef %secondary_index)
  %1 = load ptr, ptr %tbl.addr, align 8
  %2 = load i64, ptr %primary_index, align 8
  %arrayidx = getelementptr inbounds ptr, ptr %1, i64 %2
  %3 = load ptr, ptr %arrayidx, align 8
  store ptr %3, ptr %secondary_table, align 8
  %4 = load ptr, ptr %secondary_table, align 8
  %cmp = icmp eq ptr %4, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call ptr @__RV_trie_create_secondary()
  store ptr %call, ptr %secondary_table, align 8
  %5 = load ptr, ptr %secondary_table, align 8
  %6 = load ptr, ptr %tbl.addr, align 8
  %7 = load i64, ptr %primary_index, align 8
  %arrayidx1 = getelementptr inbounds ptr, ptr %6, i64 %7
  store ptr %5, ptr %arrayidx1, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %8 = load ptr, ptr %secondary_table, align 8
  %9 = load i64, ptr %secondary_index, align 8
  %arrayidx2 = getelementptr inbounds %struct.__RV_pmd, ptr %8, i64 %9
  %pmdflag = getelementptr inbounds %struct.__RV_pmd, ptr %arrayidx2, i32 0, i32 3
  store i8 1, ptr %pmdflag, align 8
  %10 = load ptr, ptr %secondary_table, align 8
  %11 = load i64, ptr %secondary_index, align 8
  %add.ptr = getelementptr inbounds %struct.__RV_pmd, ptr %10, i64 %11
  ret ptr %add.ptr
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__RV_trie_remove_pmd(ptr noundef %tbl, ptr noundef %ptra) #0 {
entry:
  %retval = alloca i32, align 4
  %tbl.addr = alloca ptr, align 8
  %ptra.addr = alloca ptr, align 8
  %pmd = alloca ptr, align 8
  store ptr %tbl, ptr %tbl.addr, align 8
  store ptr %ptra, ptr %ptra.addr, align 8
  %0 = load ptr, ptr %tbl.addr, align 8
  %1 = load ptr, ptr %ptra.addr, align 8
  %call = call ptr @__RV_trie_find_pmd(ptr noundef %0, ptr noundef %1)
  store ptr %call, ptr %pmd, align 8
  %2 = load ptr, ptr %pmd, align 8
  %cmp = icmp eq ptr null, %2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load ptr, ptr %pmd, align 8
  call void @__RV_pmd_set_null(ptr noundef %3)
  %4 = load ptr, ptr %pmd, align 8
  %pmdflag = getelementptr inbounds %struct.__RV_pmd, ptr %4, i32 0, i32 3
  store i8 0, ptr %pmdflag, align 8
  store i32 1, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %5 = load i32, ptr %retval, align 4
  ret i32 %5
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_trie_get_trie_ref_pmd() #0 {
entry:
  %0 = load ptr, ptr @__RV_trie_get_trie_ref_pmd.tbl, align 8
  %cmp = icmp eq ptr null, %0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call ptr @__RV_trie_create()
  store ptr %call, ptr @__RV_trie_get_trie_ref_pmd.tbl, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret ptr @__RV_trie_get_trie_ref_pmd.tbl
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_trie_get_trie_pmd() #0 {
entry:
  %call = call ptr @__RV_trie_get_trie_ref_pmd()
  %0 = load ptr, ptr %call, align 8
  ret ptr %0
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__RV_list_find_fmd_ref(ptr noundef %head_ref, ptr noundef %func, ptr noundef %prev_ref) #0 {
entry:
  %retval = alloca i32, align 4
  %head_ref.addr = alloca ptr, align 8
  %func.addr = alloca ptr, align 8
  %prev_ref.addr = alloca ptr, align 8
  %cur = alloca ptr, align 8
  store ptr %head_ref, ptr %head_ref.addr, align 8
  store ptr %func, ptr %func.addr, align 8
  store ptr %prev_ref, ptr %prev_ref.addr, align 8
  %0 = load ptr, ptr %head_ref.addr, align 8
  %1 = load ptr, ptr %prev_ref.addr, align 8
  store ptr %0, ptr %1, align 8
  %2 = load ptr, ptr %prev_ref.addr, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %cur, align 8
  br label %while.body

while.body:                                       ; preds = %entry, %if.end6
  %5 = load ptr, ptr %cur, align 8
  %cmp = icmp eq ptr %5, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  store i32 0, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %while.body
  %6 = load ptr, ptr %cur, align 8
  %func1 = getelementptr inbounds %struct.__RV_fmd, ptr %6, i32 0, i32 2
  %7 = load ptr, ptr %func1, align 8
  %8 = load ptr, ptr %func.addr, align 8
  %cmp2 = icmp uge ptr %7, %8
  br i1 %cmp2, label %if.then3, label %if.end6

if.then3:                                         ; preds = %if.end
  %9 = load ptr, ptr %cur, align 8
  %func4 = getelementptr inbounds %struct.__RV_fmd, ptr %9, i32 0, i32 2
  %10 = load ptr, ptr %func4, align 8
  %11 = load ptr, ptr %func.addr, align 8
  %cmp5 = icmp eq ptr %10, %11
  %conv = zext i1 %cmp5 to i32
  store i32 %conv, ptr %retval, align 4
  br label %return

if.end6:                                          ; preds = %if.end
  %12 = load ptr, ptr %cur, align 8
  %next = getelementptr inbounds %struct.__RV_fmd, ptr %12, i32 0, i32 3
  %13 = load ptr, ptr %prev_ref.addr, align 8
  store ptr %next, ptr %13, align 8
  %14 = load ptr, ptr %cur, align 8
  %next7 = getelementptr inbounds %struct.__RV_fmd, ptr %14, i32 0, i32 3
  %15 = load ptr, ptr %next7, align 8
  store ptr %15, ptr %cur, align 8
  br label %while.body

return:                                           ; preds = %if.then3, %if.then
  %16 = load i32, ptr %retval, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__RV_list_insert_fmd(ptr noundef %head_ref, ptr noundef %fmd, ptr noundef %prev_ref) #0 {
entry:
  %retval = alloca i32, align 4
  %head_ref.addr = alloca ptr, align 8
  %fmd.addr = alloca ptr, align 8
  %prev_ref.addr = alloca ptr, align 8
  %cur = alloca ptr, align 8
  store ptr %head_ref, ptr %head_ref.addr, align 8
  store ptr %fmd, ptr %fmd.addr, align 8
  store ptr %prev_ref, ptr %prev_ref.addr, align 8
  %0 = load ptr, ptr %head_ref.addr, align 8
  %1 = load ptr, ptr %fmd.addr, align 8
  %func = getelementptr inbounds %struct.__RV_fmd, ptr %1, i32 0, i32 2
  %2 = load ptr, ptr %func, align 8
  %3 = load ptr, ptr %prev_ref.addr, align 8
  %call = call i32 @__RV_list_find_fmd_ref(ptr noundef %0, ptr noundef %2, ptr noundef %3)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load ptr, ptr %prev_ref.addr, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %cur, align 8
  %7 = load ptr, ptr %cur, align 8
  %next = getelementptr inbounds %struct.__RV_fmd, ptr %7, i32 0, i32 3
  %8 = load ptr, ptr %next, align 8
  %9 = load ptr, ptr %fmd.addr, align 8
  %next1 = getelementptr inbounds %struct.__RV_fmd, ptr %9, i32 0, i32 3
  store ptr %8, ptr %next1, align 8
  %10 = load ptr, ptr %fmd.addr, align 8
  %11 = load ptr, ptr %prev_ref.addr, align 8
  %12 = load ptr, ptr %11, align 8
  store ptr %10, ptr %12, align 8
  %13 = load ptr, ptr %cur, align 8
  call void @__RV_fmd_free(ptr noundef %13)
  store i32 0, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %14 = load ptr, ptr %prev_ref.addr, align 8
  %15 = load ptr, ptr %14, align 8
  %16 = load ptr, ptr %15, align 8
  %17 = load ptr, ptr %fmd.addr, align 8
  %next2 = getelementptr inbounds %struct.__RV_fmd, ptr %17, i32 0, i32 3
  store ptr %16, ptr %next2, align 8
  %18 = load ptr, ptr %fmd.addr, align 8
  %19 = load ptr, ptr %prev_ref.addr, align 8
  %20 = load ptr, ptr %19, align 8
  store ptr %18, ptr %20, align 8
  store i32 1, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %21 = load i32, ptr %retval, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__RV_list_insert_fmd_func(ptr noundef %head_ref, ptr noundef %func, i8 noundef zeroext %capacity, ptr noundef %prev_ref) #0 {
entry:
  %retval = alloca i32, align 4
  %head_ref.addr = alloca ptr, align 8
  %func.addr = alloca ptr, align 8
  %capacity.addr = alloca i8, align 1
  %prev_ref.addr = alloca ptr, align 8
  %fmd = alloca ptr, align 8
  store ptr %head_ref, ptr %head_ref.addr, align 8
  store ptr %func, ptr %func.addr, align 8
  store i8 %capacity, ptr %capacity.addr, align 1
  store ptr %prev_ref, ptr %prev_ref.addr, align 8
  %0 = load ptr, ptr %head_ref.addr, align 8
  %1 = load ptr, ptr %func.addr, align 8
  %2 = load ptr, ptr %prev_ref.addr, align 8
  %call = call i32 @__RV_list_find_fmd_ref(ptr noundef %0, ptr noundef %1, ptr noundef %2)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load ptr, ptr %prev_ref.addr, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = load i8, ptr %capacity.addr, align 1
  call void @__RV_fmd_resize_pmds(ptr noundef %5, i8 noundef zeroext %6, i8 noundef zeroext 0)
  store i32 0, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %7 = load ptr, ptr %func.addr, align 8
  %8 = load i8, ptr %capacity.addr, align 1
  %call1 = call ptr @__RV_fmd_create(ptr noundef %7, i8 noundef zeroext %8)
  store ptr %call1, ptr %fmd, align 8
  %9 = load ptr, ptr %prev_ref.addr, align 8
  %10 = load ptr, ptr %9, align 8
  %11 = load ptr, ptr %10, align 8
  %12 = load ptr, ptr %fmd, align 8
  %next = getelementptr inbounds %struct.__RV_fmd, ptr %12, i32 0, i32 3
  store ptr %11, ptr %next, align 8
  %13 = load ptr, ptr %fmd, align 8
  %14 = load ptr, ptr %prev_ref.addr, align 8
  %15 = load ptr, ptr %14, align 8
  store ptr %13, ptr %15, align 8
  store i32 1, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %16 = load i32, ptr %retval, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__RV_list_remove_fmd(ptr noundef %head_ref, ptr noundef %func, ptr noundef %prev_ref) #0 {
entry:
  %retval = alloca i32, align 4
  %head_ref.addr = alloca ptr, align 8
  %func.addr = alloca ptr, align 8
  %prev_ref.addr = alloca ptr, align 8
  %cur = alloca ptr, align 8
  store ptr %head_ref, ptr %head_ref.addr, align 8
  store ptr %func, ptr %func.addr, align 8
  store ptr %prev_ref, ptr %prev_ref.addr, align 8
  %0 = load ptr, ptr %head_ref.addr, align 8
  %1 = load ptr, ptr %func.addr, align 8
  %2 = load ptr, ptr %prev_ref.addr, align 8
  %call = call i32 @__RV_list_find_fmd_ref(ptr noundef %0, ptr noundef %1, ptr noundef %2)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i32 0, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load ptr, ptr %prev_ref.addr, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = load ptr, ptr %4, align 8
  store ptr %5, ptr %cur, align 8
  %6 = load ptr, ptr %cur, align 8
  %next = getelementptr inbounds %struct.__RV_fmd, ptr %6, i32 0, i32 3
  %7 = load ptr, ptr %next, align 8
  %8 = load ptr, ptr %prev_ref.addr, align 8
  %9 = load ptr, ptr %8, align 8
  store ptr %7, ptr %9, align 8
  %10 = load ptr, ptr %cur, align 8
  call void @__RV_fmd_free(ptr noundef %10)
  store i32 1, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %11 = load i32, ptr %retval, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__RV_hashtbl_hash(i64 noundef %key, i64 noundef %capacity) #0 {
entry:
  %key.addr = alloca i64, align 8
  %capacity.addr = alloca i64, align 8
  store i64 %key, ptr %key.addr, align 8
  store i64 %capacity, ptr %capacity.addr, align 8
  %0 = load i64, ptr %key.addr, align 8
  %1 = load i64, ptr %key.addr, align 8
  %shr = lshr i64 %1, 20
  %xor = xor i64 %0, %shr
  %2 = load i64, ptr %key.addr, align 8
  %shr1 = lshr i64 %2, 12
  %xor2 = xor i64 %xor, %shr1
  store i64 %xor2, ptr %key.addr, align 8
  %3 = load i64, ptr %key.addr, align 8
  %4 = load i64, ptr %key.addr, align 8
  %shr3 = lshr i64 %4, 7
  %xor4 = xor i64 %3, %shr3
  %5 = load i64, ptr %key.addr, align 8
  %shr5 = lshr i64 %5, 4
  %xor6 = xor i64 %xor4, %shr5
  store i64 %xor6, ptr %key.addr, align 8
  %6 = load i64, ptr %key.addr, align 8
  %7 = load i64, ptr %capacity.addr, align 8
  %sub = sub i64 %7, 1
  %and = and i64 %6, %sub
  ret i64 %and
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_hashtbl_create(i64 noundef %capacity) #0 {
entry:
  %retval = alloca ptr, align 8
  %capacity.addr = alloca i64, align 8
  %i = alloca i64, align 8
  %tbl = alloca ptr, align 8
  store i64 %capacity, ptr %capacity.addr, align 8
  %call = call noalias ptr @malloc(i64 noundef 32) #12
  store ptr %call, ptr %tbl, align 8
  %0 = load ptr, ptr %tbl, align 8
  %cmp = icmp eq ptr null, %0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store ptr null, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i64, ptr %capacity.addr, align 8
  %mul = mul i64 %1, 8
  %call1 = call noalias ptr @malloc(i64 noundef %mul) #12
  %2 = load ptr, ptr %tbl, align 8
  %slots = getelementptr inbounds %struct.__RV_hashtbl, ptr %2, i32 0, i32 0
  store ptr %call1, ptr %slots, align 8
  %3 = load ptr, ptr %tbl, align 8
  %slots2 = getelementptr inbounds %struct.__RV_hashtbl, ptr %3, i32 0, i32 0
  %4 = load ptr, ptr %slots2, align 8
  %cmp3 = icmp eq ptr null, %4
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %5 = load ptr, ptr %tbl, align 8
  call void @free(ptr noundef %5) #13
  store ptr null, ptr %retval, align 8
  br label %return

if.end5:                                          ; preds = %if.end
  store i64 0, ptr %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end5
  %6 = load i64, ptr %i, align 8
  %7 = load i64, ptr %capacity.addr, align 8
  %cmp6 = icmp ult i64 %6, %7
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %8 = load ptr, ptr %tbl, align 8
  %slots7 = getelementptr inbounds %struct.__RV_hashtbl, ptr %8, i32 0, i32 0
  %9 = load ptr, ptr %slots7, align 8
  %10 = load i64, ptr %i, align 8
  %arrayidx = getelementptr inbounds ptr, ptr %9, i64 %10
  store ptr null, ptr %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %11 = load i64, ptr %i, align 8
  %inc = add i64 %11, 1
  store i64 %inc, ptr %i, align 8
  br label %for.cond, !llvm.loop !16

for.end:                                          ; preds = %for.cond
  %12 = load i64, ptr %capacity.addr, align 8
  %13 = load ptr, ptr %tbl, align 8
  %capacity8 = getelementptr inbounds %struct.__RV_hashtbl, ptr %13, i32 0, i32 1
  store i64 %12, ptr %capacity8, align 8
  %14 = load ptr, ptr %tbl, align 8
  %size = getelementptr inbounds %struct.__RV_hashtbl, ptr %14, i32 0, i32 2
  store i64 0, ptr %size, align 8
  %15 = load ptr, ptr %tbl, align 8
  %count = getelementptr inbounds %struct.__RV_hashtbl, ptr %15, i32 0, i32 3
  store i64 0, ptr %count, align 8
  %16 = load ptr, ptr %tbl, align 8
  store ptr %16, ptr %retval, align 8
  br label %return

return:                                           ; preds = %for.end, %if.then4, %if.then
  %17 = load ptr, ptr %retval, align 8
  ret ptr %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_hashtbl_free_slots_fmd(ptr noundef %tbl) #0 {
entry:
  %tbl.addr = alloca ptr, align 8
  %i = alloca i64, align 8
  %fmd = alloca ptr, align 8
  %fmd1 = alloca ptr, align 8
  store ptr %tbl, ptr %tbl.addr, align 8
  %0 = load ptr, ptr %tbl.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load ptr, ptr %tbl.addr, align 8
  %slots = getelementptr inbounds %struct.__RV_hashtbl, ptr %1, i32 0, i32 0
  %2 = load ptr, ptr %slots, align 8
  %cmp1 = icmp eq ptr %2, null
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  store i64 0, ptr %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, ptr %i, align 8
  %4 = load ptr, ptr %tbl.addr, align 8
  %capacity = getelementptr inbounds %struct.__RV_hashtbl, ptr %4, i32 0, i32 1
  %5 = load i64, ptr %capacity, align 8
  %cmp2 = icmp ult i64 %3, %5
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load ptr, ptr %tbl.addr, align 8
  %slots3 = getelementptr inbounds %struct.__RV_hashtbl, ptr %6, i32 0, i32 0
  %7 = load ptr, ptr %slots3, align 8
  %8 = load i64, ptr %i, align 8
  %arrayidx = getelementptr inbounds ptr, ptr %7, i64 %8
  %9 = load ptr, ptr %arrayidx, align 8
  store ptr %9, ptr %fmd, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.body
  %10 = load ptr, ptr %fmd, align 8
  %cmp4 = icmp ne ptr %10, null
  br i1 %cmp4, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %11 = load ptr, ptr %fmd, align 8
  %next = getelementptr inbounds %struct.__RV_fmd, ptr %11, i32 0, i32 3
  %12 = load ptr, ptr %next, align 8
  store ptr %12, ptr %fmd1, align 8
  %13 = load ptr, ptr %fmd, align 8
  call void @__RV_fmd_free(ptr noundef %13)
  %14 = load ptr, ptr %fmd1, align 8
  store ptr %14, ptr %fmd, align 8
  br label %while.cond, !llvm.loop !17

while.end:                                        ; preds = %while.cond
  br label %for.inc

for.inc:                                          ; preds = %while.end
  %15 = load i64, ptr %i, align 8
  %inc = add i64 %15, 1
  store i64 %inc, ptr %i, align 8
  br label %for.cond, !llvm.loop !18

for.end:                                          ; preds = %for.cond
  %16 = load ptr, ptr %tbl.addr, align 8
  %slots5 = getelementptr inbounds %struct.__RV_hashtbl, ptr %16, i32 0, i32 0
  %17 = load ptr, ptr %slots5, align 8
  call void @free(ptr noundef %17) #13
  %18 = load ptr, ptr %tbl.addr, align 8
  %slots6 = getelementptr inbounds %struct.__RV_hashtbl, ptr %18, i32 0, i32 0
  store ptr null, ptr %slots6, align 8
  %19 = load ptr, ptr %tbl.addr, align 8
  %capacity7 = getelementptr inbounds %struct.__RV_hashtbl, ptr %19, i32 0, i32 1
  store i64 0, ptr %capacity7, align 8
  %20 = load ptr, ptr %tbl.addr, align 8
  %size = getelementptr inbounds %struct.__RV_hashtbl, ptr %20, i32 0, i32 2
  store i64 0, ptr %size, align 8
  %21 = load ptr, ptr %tbl.addr, align 8
  %count = getelementptr inbounds %struct.__RV_hashtbl, ptr %21, i32 0, i32 3
  store i64 0, ptr %count, align 8
  br label %return

return:                                           ; preds = %for.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_hashtbl_free_fmd(ptr noundef %tbl) #0 {
entry:
  %tbl.addr = alloca ptr, align 8
  store ptr %tbl, ptr %tbl.addr, align 8
  %0 = load ptr, ptr %tbl.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %tbl.addr, align 8
  call void @__RV_hashtbl_free_slots_fmd(ptr noundef %1)
  %2 = load ptr, ptr %tbl.addr, align 8
  call void @free(ptr noundef %2) #13
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_hashtbl_find_fmd(ptr noundef %tbl, ptr noundef %func) #0 {
entry:
  %retval = alloca ptr, align 8
  %tbl.addr = alloca ptr, align 8
  %func.addr = alloca ptr, align 8
  %index = alloca i64, align 8
  %prev = alloca ptr, align 8
  store ptr %tbl, ptr %tbl.addr, align 8
  store ptr %func, ptr %func.addr, align 8
  %0 = load ptr, ptr %tbl.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store ptr null, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %func.addr, align 8
  %2 = ptrtoint ptr %1 to i64
  %3 = load ptr, ptr %tbl.addr, align 8
  %capacity = getelementptr inbounds %struct.__RV_hashtbl, ptr %3, i32 0, i32 1
  %4 = load i64, ptr %capacity, align 8
  %call = call i64 @__RV_hashtbl_hash(i64 noundef %2, i64 noundef %4)
  store i64 %call, ptr %index, align 8
  %5 = load ptr, ptr %tbl.addr, align 8
  %slots = getelementptr inbounds %struct.__RV_hashtbl, ptr %5, i32 0, i32 0
  %6 = load ptr, ptr %slots, align 8
  %7 = load i64, ptr %index, align 8
  %add.ptr = getelementptr inbounds ptr, ptr %6, i64 %7
  %8 = load ptr, ptr %func.addr, align 8
  %call1 = call i32 @__RV_list_find_fmd_ref(ptr noundef %add.ptr, ptr noundef %8, ptr noundef %prev)
  %tobool = icmp ne i32 %call1, 0
  br i1 %tobool, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %9 = load ptr, ptr %prev, align 8
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %retval, align 8
  br label %return

if.end3:                                          ; preds = %if.end
  store ptr null, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end3, %if.then2, %if.then
  %11 = load ptr, ptr %retval, align 8
  ret ptr %11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_hashtbl_insert_fmd(ptr noundef %tbl, ptr noundef %fmd) #0 {
entry:
  %retval = alloca ptr, align 8
  %tbl.addr = alloca ptr, align 8
  %fmd.addr = alloca ptr, align 8
  %index = alloca i64, align 8
  %prev = alloca ptr, align 8
  store ptr %tbl, ptr %tbl.addr, align 8
  store ptr %fmd, ptr %fmd.addr, align 8
  %0 = load ptr, ptr %tbl.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load ptr, ptr %fmd.addr, align 8
  %cmp1 = icmp eq ptr %1, null
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store ptr null, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %2 = load ptr, ptr %fmd.addr, align 8
  %func = getelementptr inbounds %struct.__RV_fmd, ptr %2, i32 0, i32 2
  %3 = load ptr, ptr %func, align 8
  %4 = ptrtoint ptr %3 to i64
  %5 = load ptr, ptr %tbl.addr, align 8
  %capacity = getelementptr inbounds %struct.__RV_hashtbl, ptr %5, i32 0, i32 1
  %6 = load i64, ptr %capacity, align 8
  %call = call i64 @__RV_hashtbl_hash(i64 noundef %4, i64 noundef %6)
  store i64 %call, ptr %index, align 8
  %7 = load ptr, ptr %tbl.addr, align 8
  %slots = getelementptr inbounds %struct.__RV_hashtbl, ptr %7, i32 0, i32 0
  %8 = load ptr, ptr %slots, align 8
  %9 = load i64, ptr %index, align 8
  %add.ptr = getelementptr inbounds ptr, ptr %8, i64 %9
  %10 = load ptr, ptr %fmd.addr, align 8
  %call2 = call i32 @__RV_list_insert_fmd(ptr noundef %add.ptr, ptr noundef %10, ptr noundef %prev)
  %tobool = icmp ne i32 %call2, 0
  br i1 %tobool, label %if.then3, label %if.end11

if.then3:                                         ; preds = %if.end
  %11 = load ptr, ptr %prev, align 8
  %12 = load ptr, ptr %tbl.addr, align 8
  %slots4 = getelementptr inbounds %struct.__RV_hashtbl, ptr %12, i32 0, i32 0
  %13 = load ptr, ptr %slots4, align 8
  %14 = load i64, ptr %index, align 8
  %add.ptr5 = getelementptr inbounds ptr, ptr %13, i64 %14
  %cmp6 = icmp eq ptr %11, %add.ptr5
  br i1 %cmp6, label %land.lhs.true, label %if.end9

land.lhs.true:                                    ; preds = %if.then3
  %15 = load ptr, ptr %prev, align 8
  %16 = load ptr, ptr %15, align 8
  %next = getelementptr inbounds %struct.__RV_fmd, ptr %16, i32 0, i32 3
  %17 = load ptr, ptr %next, align 8
  %cmp7 = icmp eq ptr %17, null
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %land.lhs.true
  %18 = load ptr, ptr %tbl.addr, align 8
  %size = getelementptr inbounds %struct.__RV_hashtbl, ptr %18, i32 0, i32 2
  %19 = load i64, ptr %size, align 8
  %inc = add i64 %19, 1
  store i64 %inc, ptr %size, align 8
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %land.lhs.true, %if.then3
  %20 = load ptr, ptr %tbl.addr, align 8
  %count = getelementptr inbounds %struct.__RV_hashtbl, ptr %20, i32 0, i32 3
  %21 = load i64, ptr %count, align 8
  %inc10 = add i64 %21, 1
  store i64 %inc10, ptr %count, align 8
  %22 = load ptr, ptr %tbl.addr, align 8
  call void @__RV_hashtbl_resize_fmd(ptr noundef %22)
  br label %if.end11

if.end11:                                         ; preds = %if.end9, %if.end
  %23 = load ptr, ptr %fmd.addr, align 8
  store ptr %23, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end11, %if.then
  %24 = load ptr, ptr %retval, align 8
  ret ptr %24
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_hashtbl_resize_fmd(ptr noundef %tbl) #0 {
entry:
  %tbl.addr = alloca ptr, align 8
  %new_tbl = alloca ptr, align 8
  store ptr %tbl, ptr %tbl.addr, align 8
  %0 = load ptr, ptr %tbl.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load ptr, ptr %tbl.addr, align 8
  %count = getelementptr inbounds %struct.__RV_hashtbl, ptr %1, i32 0, i32 3
  %2 = load i64, ptr %count, align 8
  %3 = load ptr, ptr %tbl.addr, align 8
  %size = getelementptr inbounds %struct.__RV_hashtbl, ptr %3, i32 0, i32 2
  %4 = load i64, ptr %size, align 8
  %mul = mul i64 3, %4
  %cmp1 = icmp ule i64 %2, %mul
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %5 = load ptr, ptr %tbl.addr, align 8
  %capacity = getelementptr inbounds %struct.__RV_hashtbl, ptr %5, i32 0, i32 1
  %6 = load i64, ptr %capacity, align 8
  %mul2 = mul i64 2, %6
  %call = call ptr @__RV_hashtbl_create(i64 noundef %mul2)
  store ptr %call, ptr %new_tbl, align 8
  %7 = load ptr, ptr %tbl.addr, align 8
  %8 = load ptr, ptr %new_tbl, align 8
  %call3 = call ptr @__RV_hashtbl_transfer_fmds(ptr noundef %7, ptr noundef %8)
  store ptr %call3, ptr %new_tbl, align 8
  %9 = load ptr, ptr %tbl.addr, align 8
  %slots = getelementptr inbounds %struct.__RV_hashtbl, ptr %9, i32 0, i32 0
  %10 = load ptr, ptr %slots, align 8
  call void @free(ptr noundef %10) #13
  %11 = load ptr, ptr %new_tbl, align 8
  %slots4 = getelementptr inbounds %struct.__RV_hashtbl, ptr %11, i32 0, i32 0
  %12 = load ptr, ptr %slots4, align 8
  %13 = load ptr, ptr %tbl.addr, align 8
  %slots5 = getelementptr inbounds %struct.__RV_hashtbl, ptr %13, i32 0, i32 0
  store ptr %12, ptr %slots5, align 8
  %14 = load ptr, ptr %new_tbl, align 8
  %capacity6 = getelementptr inbounds %struct.__RV_hashtbl, ptr %14, i32 0, i32 1
  %15 = load i64, ptr %capacity6, align 8
  %16 = load ptr, ptr %tbl.addr, align 8
  %capacity7 = getelementptr inbounds %struct.__RV_hashtbl, ptr %16, i32 0, i32 1
  store i64 %15, ptr %capacity7, align 8
  %17 = load ptr, ptr %new_tbl, align 8
  %size8 = getelementptr inbounds %struct.__RV_hashtbl, ptr %17, i32 0, i32 2
  %18 = load i64, ptr %size8, align 8
  %19 = load ptr, ptr %tbl.addr, align 8
  %size9 = getelementptr inbounds %struct.__RV_hashtbl, ptr %19, i32 0, i32 2
  store i64 %18, ptr %size9, align 8
  %20 = load ptr, ptr %new_tbl, align 8
  %count10 = getelementptr inbounds %struct.__RV_hashtbl, ptr %20, i32 0, i32 3
  %21 = load i64, ptr %count10, align 8
  %22 = load ptr, ptr %tbl.addr, align 8
  %count11 = getelementptr inbounds %struct.__RV_hashtbl, ptr %22, i32 0, i32 3
  store i64 %21, ptr %count11, align 8
  %23 = load ptr, ptr %new_tbl, align 8
  call void @free(ptr noundef %23) #13
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_hashtbl_insert_fmd_func(ptr noundef %tbl, ptr noundef %func, i8 noundef zeroext %capacity) #0 {
entry:
  %retval = alloca ptr, align 8
  %tbl.addr = alloca ptr, align 8
  %func.addr = alloca ptr, align 8
  %capacity.addr = alloca i8, align 1
  %index = alloca i64, align 8
  %prev = alloca ptr, align 8
  %cur = alloca ptr, align 8
  store ptr %tbl, ptr %tbl.addr, align 8
  store ptr %func, ptr %func.addr, align 8
  store i8 %capacity, ptr %capacity.addr, align 1
  %0 = load ptr, ptr %tbl.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store ptr null, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %func.addr, align 8
  %2 = ptrtoint ptr %1 to i64
  %3 = load ptr, ptr %tbl.addr, align 8
  %capacity1 = getelementptr inbounds %struct.__RV_hashtbl, ptr %3, i32 0, i32 1
  %4 = load i64, ptr %capacity1, align 8
  %call = call i64 @__RV_hashtbl_hash(i64 noundef %2, i64 noundef %4)
  store i64 %call, ptr %index, align 8
  %5 = load ptr, ptr %tbl.addr, align 8
  %slots = getelementptr inbounds %struct.__RV_hashtbl, ptr %5, i32 0, i32 0
  %6 = load ptr, ptr %slots, align 8
  %7 = load i64, ptr %index, align 8
  %add.ptr = getelementptr inbounds ptr, ptr %6, i64 %7
  %8 = load ptr, ptr %func.addr, align 8
  %9 = load i8, ptr %capacity.addr, align 1
  %call2 = call i32 @__RV_list_insert_fmd_func(ptr noundef %add.ptr, ptr noundef %8, i8 noundef zeroext %9, ptr noundef %prev)
  %tobool = icmp ne i32 %call2, 0
  br i1 %tobool, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  %10 = load ptr, ptr %prev, align 8
  %11 = load ptr, ptr %10, align 8
  %12 = load i8, ptr %capacity.addr, align 1
  call void @__RV_fmd_resize_pmds(ptr noundef %11, i8 noundef zeroext %12, i8 noundef zeroext 0)
  %13 = load ptr, ptr %prev, align 8
  %14 = load ptr, ptr %13, align 8
  store ptr %14, ptr %retval, align 8
  br label %return

if.end4:                                          ; preds = %if.end
  %15 = load ptr, ptr %prev, align 8
  %16 = load ptr, ptr %15, align 8
  store ptr %16, ptr %cur, align 8
  %17 = load ptr, ptr %prev, align 8
  %18 = load ptr, ptr %tbl.addr, align 8
  %slots5 = getelementptr inbounds %struct.__RV_hashtbl, ptr %18, i32 0, i32 0
  %19 = load ptr, ptr %slots5, align 8
  %20 = load i64, ptr %index, align 8
  %add.ptr6 = getelementptr inbounds ptr, ptr %19, i64 %20
  %cmp7 = icmp eq ptr %17, %add.ptr6
  br i1 %cmp7, label %land.lhs.true, label %if.end10

land.lhs.true:                                    ; preds = %if.end4
  %21 = load ptr, ptr %cur, align 8
  %next = getelementptr inbounds %struct.__RV_fmd, ptr %21, i32 0, i32 3
  %22 = load ptr, ptr %next, align 8
  %cmp8 = icmp eq ptr %22, null
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %land.lhs.true
  %23 = load ptr, ptr %tbl.addr, align 8
  %size = getelementptr inbounds %struct.__RV_hashtbl, ptr %23, i32 0, i32 2
  %24 = load i64, ptr %size, align 8
  %inc = add i64 %24, 1
  store i64 %inc, ptr %size, align 8
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %land.lhs.true, %if.end4
  %25 = load ptr, ptr %tbl.addr, align 8
  %count = getelementptr inbounds %struct.__RV_hashtbl, ptr %25, i32 0, i32 3
  %26 = load i64, ptr %count, align 8
  %inc11 = add i64 %26, 1
  store i64 %inc11, ptr %count, align 8
  %27 = load ptr, ptr %tbl.addr, align 8
  call void @__RV_hashtbl_resize_fmd(ptr noundef %27)
  %28 = load ptr, ptr %cur, align 8
  store ptr %28, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end10, %if.then3, %if.then
  %29 = load ptr, ptr %retval, align 8
  ret ptr %29
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__RV_hashtbl_remove_fmd(ptr noundef %tbl, ptr noundef %func) #0 {
entry:
  %retval = alloca i32, align 4
  %tbl.addr = alloca ptr, align 8
  %func.addr = alloca ptr, align 8
  %index = alloca i64, align 8
  %prev = alloca ptr, align 8
  store ptr %tbl, ptr %tbl.addr, align 8
  store ptr %func, ptr %func.addr, align 8
  %0 = load ptr, ptr %tbl.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load ptr, ptr %func.addr, align 8
  %2 = ptrtoint ptr %1 to i64
  %3 = load ptr, ptr %tbl.addr, align 8
  %capacity = getelementptr inbounds %struct.__RV_hashtbl, ptr %3, i32 0, i32 1
  %4 = load i64, ptr %capacity, align 8
  %call = call i64 @__RV_hashtbl_hash(i64 noundef %2, i64 noundef %4)
  store i64 %call, ptr %index, align 8
  %5 = load ptr, ptr %tbl.addr, align 8
  %slots = getelementptr inbounds %struct.__RV_hashtbl, ptr %5, i32 0, i32 0
  %6 = load ptr, ptr %slots, align 8
  %7 = load i64, ptr %index, align 8
  %add.ptr = getelementptr inbounds ptr, ptr %6, i64 %7
  %8 = load ptr, ptr %func.addr, align 8
  %call1 = call i32 @__RV_list_remove_fmd(ptr noundef %add.ptr, ptr noundef %8, ptr noundef %prev)
  %tobool = icmp ne i32 %call1, 0
  br i1 %tobool, label %if.end3, label %if.then2

if.then2:                                         ; preds = %if.end
  store i32 0, ptr %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  %9 = load ptr, ptr %prev, align 8
  %10 = load ptr, ptr %tbl.addr, align 8
  %slots4 = getelementptr inbounds %struct.__RV_hashtbl, ptr %10, i32 0, i32 0
  %11 = load ptr, ptr %slots4, align 8
  %12 = load i64, ptr %index, align 8
  %add.ptr5 = getelementptr inbounds ptr, ptr %11, i64 %12
  %cmp6 = icmp eq ptr %9, %add.ptr5
  br i1 %cmp6, label %land.lhs.true, label %if.end9

land.lhs.true:                                    ; preds = %if.end3
  %13 = load ptr, ptr %prev, align 8
  %14 = load ptr, ptr %13, align 8
  %cmp7 = icmp eq ptr %14, null
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %land.lhs.true
  %15 = load ptr, ptr %tbl.addr, align 8
  %size = getelementptr inbounds %struct.__RV_hashtbl, ptr %15, i32 0, i32 2
  %16 = load i64, ptr %size, align 8
  %dec = add i64 %16, -1
  store i64 %dec, ptr %size, align 8
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %land.lhs.true, %if.end3
  %17 = load ptr, ptr %tbl.addr, align 8
  %count = getelementptr inbounds %struct.__RV_hashtbl, ptr %17, i32 0, i32 3
  %18 = load i64, ptr %count, align 8
  %dec10 = add i64 %18, -1
  store i64 %dec10, ptr %count, align 8
  store i32 1, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end9, %if.then2, %if.then
  %19 = load i32, ptr %retval, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_hashtbl_transfer_fmds(ptr noundef %old_tbl, ptr noundef %new_tbl) #0 {
entry:
  %retval = alloca ptr, align 8
  %old_tbl.addr = alloca ptr, align 8
  %new_tbl.addr = alloca ptr, align 8
  %i = alloca i64, align 8
  %fmd = alloca ptr, align 8
  %fmd1 = alloca ptr, align 8
  store ptr %old_tbl, ptr %old_tbl.addr, align 8
  store ptr %new_tbl, ptr %new_tbl.addr, align 8
  %0 = load ptr, ptr %new_tbl.addr, align 8
  %cmp = icmp eq ptr null, %0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %old_tbl.addr, align 8
  store ptr %1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %old_tbl.addr, align 8
  %cmp1 = icmp eq ptr null, %2
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %3 = load ptr, ptr %new_tbl.addr, align 8
  store ptr %3, ptr %retval, align 8
  br label %return

if.end3:                                          ; preds = %if.end
  store i64 0, ptr %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, ptr %i, align 8
  %5 = load ptr, ptr %old_tbl.addr, align 8
  %capacity = getelementptr inbounds %struct.__RV_hashtbl, ptr %5, i32 0, i32 1
  %6 = load i64, ptr %capacity, align 8
  %cmp4 = icmp ult i64 %4, %6
  br i1 %cmp4, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load ptr, ptr %old_tbl.addr, align 8
  %slots = getelementptr inbounds %struct.__RV_hashtbl, ptr %7, i32 0, i32 0
  %8 = load ptr, ptr %slots, align 8
  %9 = load i64, ptr %i, align 8
  %arrayidx = getelementptr inbounds ptr, ptr %8, i64 %9
  %10 = load ptr, ptr %arrayidx, align 8
  store ptr %10, ptr %fmd, align 8
  %11 = load ptr, ptr %old_tbl.addr, align 8
  %slots5 = getelementptr inbounds %struct.__RV_hashtbl, ptr %11, i32 0, i32 0
  %12 = load ptr, ptr %slots5, align 8
  %13 = load i64, ptr %i, align 8
  %arrayidx6 = getelementptr inbounds ptr, ptr %12, i64 %13
  store ptr null, ptr %arrayidx6, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.body
  %14 = load ptr, ptr %fmd, align 8
  %cmp7 = icmp ne ptr %14, null
  br i1 %cmp7, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %15 = load ptr, ptr %fmd, align 8
  %next = getelementptr inbounds %struct.__RV_fmd, ptr %15, i32 0, i32 3
  %16 = load ptr, ptr %next, align 8
  store ptr %16, ptr %fmd1, align 8
  %17 = load ptr, ptr %fmd, align 8
  %next8 = getelementptr inbounds %struct.__RV_fmd, ptr %17, i32 0, i32 3
  store ptr null, ptr %next8, align 8
  %18 = load ptr, ptr %new_tbl.addr, align 8
  %19 = load ptr, ptr %fmd, align 8
  %call = call ptr @__RV_hashtbl_insert_fmd(ptr noundef %18, ptr noundef %19)
  %20 = load ptr, ptr %fmd1, align 8
  store ptr %20, ptr %fmd, align 8
  br label %while.cond, !llvm.loop !19

while.end:                                        ; preds = %while.cond
  br label %for.inc

for.inc:                                          ; preds = %while.end
  %21 = load i64, ptr %i, align 8
  %inc = add i64 %21, 1
  store i64 %inc, ptr %i, align 8
  br label %for.cond, !llvm.loop !20

for.end:                                          ; preds = %for.cond
  %22 = load ptr, ptr %old_tbl.addr, align 8
  %size = getelementptr inbounds %struct.__RV_hashtbl, ptr %22, i32 0, i32 2
  store i64 0, ptr %size, align 8
  %23 = load ptr, ptr %old_tbl.addr, align 8
  %count = getelementptr inbounds %struct.__RV_hashtbl, ptr %23, i32 0, i32 3
  store i64 0, ptr %count, align 8
  %24 = load ptr, ptr %new_tbl.addr, align 8
  store ptr %24, ptr %retval, align 8
  br label %return

return:                                           ; preds = %for.end, %if.then2, %if.then
  %25 = load ptr, ptr %retval, align 8
  ret ptr %25
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_hashtbl_get_hashtbl_ref_fmd() #0 {
entry:
  %0 = load ptr, ptr @__RV_hashtbl_get_hashtbl_ref_fmd.tbl, align 8
  %cmp = icmp eq ptr null, %0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call ptr @__RV_hashtbl_create(i64 noundef 1024)
  store ptr %call, ptr @__RV_hashtbl_get_hashtbl_ref_fmd.tbl, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret ptr @__RV_hashtbl_get_hashtbl_ref_fmd.tbl
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_hashtbl_get_hashtbl_fmd() #0 {
entry:
  %call = call ptr @__RV_hashtbl_get_hashtbl_ref_fmd()
  %0 = load ptr, ptr %call, align 8
  ret ptr %0
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__RV_sstrlen(ptr noundef %str) #0 {
entry:
  %str.addr = alloca ptr, align 8
  %length = alloca i32, align 4
  store ptr %str, ptr %str.addr, align 8
  store i32 0, ptr %length, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load ptr, ptr %str.addr, align 8
  %tobool = icmp ne ptr %0, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %1 = load ptr, ptr %str.addr, align 8
  %2 = load i8, ptr %1, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %3 = phi i1 [ false, %while.cond ], [ %cmp, %land.rhs ]
  br i1 %3, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %4 = load i32, ptr %length, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, ptr %length, align 4
  %5 = load ptr, ptr %str.addr, align 8
  %incdec.ptr = getelementptr inbounds i8, ptr %5, i32 1
  store ptr %incdec.ptr, ptr %str.addr, align 8
  br label %while.cond, !llvm.loop !21

while.end:                                        ; preds = %land.end
  %6 = load i32, ptr %length, align 4
  ret i32 %6
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_pmd_tbl_create(ptr noundef %ptra) #0 {
entry:
  %ptra.addr = alloca ptr, align 8
  %tbl = alloca ptr, align 8
  store ptr %ptra, ptr %ptra.addr, align 8
  %call = call ptr @__RV_trie_get_trie_pmd()
  store ptr %call, ptr %tbl, align 8
  %0 = load ptr, ptr %tbl, align 8
  %1 = load ptr, ptr %ptra.addr, align 8
  %call1 = call ptr @__RV_trie_insert_pmd_ptr(ptr noundef %0, ptr noundef %1)
  ret ptr %call1
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_pmd_tbl_lookup(ptr noundef %ptra) #0 {
entry:
  %ptra.addr = alloca ptr, align 8
  %tbl = alloca ptr, align 8
  store ptr %ptra, ptr %ptra.addr, align 8
  %call = call ptr @__RV_trie_get_trie_pmd()
  store ptr %call, ptr %tbl, align 8
  %0 = load ptr, ptr %tbl, align 8
  %1 = load ptr, ptr %ptra.addr, align 8
  %call1 = call ptr @__RV_trie_find_pmd(ptr noundef %0, ptr noundef %1)
  ret ptr %call1
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_pmd_tbl_print(ptr noundef %ptra, ptr noundef %ptr_name) #0 {
entry:
  %ptra.addr = alloca ptr, align 8
  %ptr_name.addr = alloca ptr, align 8
  %pmd = alloca ptr, align 8
  store ptr %ptra, ptr %ptra.addr, align 8
  store ptr %ptr_name, ptr %ptr_name.addr, align 8
  %0 = load ptr, ptr %ptra.addr, align 8
  %call = call ptr @__RV_pmd_tbl_lookup(ptr noundef %0)
  store ptr %call, ptr %pmd, align 8
  %1 = load ptr, ptr %pmd, align 8
  %tobool = icmp ne ptr %1, null
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %ptr_name.addr, align 8
  %3 = load ptr, ptr %ptra.addr, align 8
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %2, ptr noundef %3)
  br label %if.end10

if.else:                                          ; preds = %entry
  %4 = load ptr, ptr %ptr_name.addr, align 8
  %5 = load ptr, ptr %ptra.addr, align 8
  %6 = load ptr, ptr %pmd, align 8
  %base = getelementptr inbounds %struct.__RV_pmd, ptr %6, i32 0, i32 0
  %7 = load ptr, ptr %base, align 8
  %8 = load ptr, ptr %pmd, align 8
  %bound = getelementptr inbounds %struct.__RV_pmd, ptr %8, i32 0, i32 1
  %9 = load ptr, ptr %bound, align 8
  %call2 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, ptr noundef %4, ptr noundef %5, ptr noundef %7, ptr noundef %9)
  %10 = load ptr, ptr %pmd, align 8
  %snda = getelementptr inbounds %struct.__RV_pmd, ptr %10, i32 0, i32 2
  %11 = load ptr, ptr %snda, align 8
  %tobool3 = icmp ne ptr %11, null
  br i1 %tobool3, label %if.else6, label %if.then4

if.then4:                                         ; preds = %if.else
  %call5 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %if.end

if.else6:                                         ; preds = %if.else
  %12 = load ptr, ptr %pmd, align 8
  %snda7 = getelementptr inbounds %struct.__RV_pmd, ptr %12, i32 0, i32 2
  %13 = load ptr, ptr %snda7, align 8
  %stat = getelementptr inbounds %struct.__RV_stat_node, ptr %13, i32 0, i32 0
  %14 = load i32, ptr %stat, align 8
  %15 = load ptr, ptr %pmd, align 8
  %snda8 = getelementptr inbounds %struct.__RV_pmd, ptr %15, i32 0, i32 2
  %16 = load ptr, ptr %snda8, align 8
  %count = getelementptr inbounds %struct.__RV_stat_node, ptr %16, i32 0, i32 1
  %17 = load i64, ptr %count, align 8
  %call9 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %14, i64 noundef %17)
  br label %if.end

if.end:                                           ; preds = %if.else6, %if.then4
  br label %if.end10

if.end10:                                         ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_pmd_tbl_update_sa(ptr noundef %ptra, ptr noundef %snda, ptr noundef %base, ptr noundef %bound) #0 {
entry:
  %ptra.addr = alloca ptr, align 8
  %snda.addr = alloca ptr, align 8
  %base.addr = alloca ptr, align 8
  %bound.addr = alloca ptr, align 8
  %tbl = alloca ptr, align 8
  %pmd = alloca ptr, align 8
  store ptr %ptra, ptr %ptra.addr, align 8
  store ptr %snda, ptr %snda.addr, align 8
  store ptr %base, ptr %base.addr, align 8
  store ptr %bound, ptr %bound.addr, align 8
  %call = call ptr @__RV_trie_get_trie_pmd()
  store ptr %call, ptr %tbl, align 8
  %0 = load ptr, ptr %tbl, align 8
  %1 = load ptr, ptr %ptra.addr, align 8
  %call1 = call ptr @__RV_trie_insert_pmd_ptr(ptr noundef %0, ptr noundef %1)
  store ptr %call1, ptr %pmd, align 8
  %2 = load ptr, ptr %pmd, align 8
  %3 = load ptr, ptr %snda.addr, align 8
  call void @__RV_pmd_c_snda(ptr noundef %2, ptr noundef %3)
  %4 = load ptr, ptr %base.addr, align 8
  %5 = load ptr, ptr %pmd, align 8
  %base2 = getelementptr inbounds %struct.__RV_pmd, ptr %5, i32 0, i32 0
  store ptr %4, ptr %base2, align 8
  %6 = load ptr, ptr %bound.addr, align 8
  %7 = load ptr, ptr %pmd, align 8
  %bound3 = getelementptr inbounds %struct.__RV_pmd, ptr %7, i32 0, i32 1
  store ptr %6, ptr %bound3, align 8
  %8 = load ptr, ptr %pmd, align 8
  ret ptr %8
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_pmd_tbl_update_sa_ret(ptr noundef %ptra, ptr noundef %snda, ptr noundef %base, ptr noundef %bound, ptr noundef %ret) #0 {
entry:
  %ptra.addr = alloca ptr, align 8
  %snda.addr = alloca ptr, align 8
  %base.addr = alloca ptr, align 8
  %bound.addr = alloca ptr, align 8
  %ret.addr = alloca ptr, align 8
  store ptr %ptra, ptr %ptra.addr, align 8
  store ptr %snda, ptr %snda.addr, align 8
  store ptr %base, ptr %base.addr, align 8
  store ptr %bound, ptr %bound.addr, align 8
  store ptr %ret, ptr %ret.addr, align 8
  %0 = load ptr, ptr %ptra.addr, align 8
  %1 = load ptr, ptr %snda.addr, align 8
  %2 = load ptr, ptr %base.addr, align 8
  %3 = load ptr, ptr %bound.addr, align 8
  %call = call ptr @__RV_pmd_tbl_update_sa(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3)
  %4 = load ptr, ptr %ret.addr, align 8
  ret ptr %4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_pmd_tbl_update_ns(ptr noundef %ptra, i32 noundef %stat, ptr noundef %base, ptr noundef %bound) #0 {
entry:
  %ptra.addr = alloca ptr, align 8
  %stat.addr = alloca i32, align 4
  %base.addr = alloca ptr, align 8
  %bound.addr = alloca ptr, align 8
  %snda = alloca ptr, align 8
  store ptr %ptra, ptr %ptra.addr, align 8
  store i32 %stat, ptr %stat.addr, align 4
  store ptr %base, ptr %base.addr, align 8
  store ptr %bound, ptr %bound.addr, align 8
  %0 = load i32, ptr %stat.addr, align 4
  %call = call ptr @__RV_stat_node_create(i32 noundef %0, i64 noundef 0)
  store ptr %call, ptr %snda, align 8
  %1 = load ptr, ptr %ptra.addr, align 8
  %2 = load ptr, ptr %snda, align 8
  %3 = load ptr, ptr %base.addr, align 8
  %4 = load ptr, ptr %bound.addr, align 8
  %call1 = call ptr @__RV_pmd_tbl_update_sa(ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4)
  ret ptr %call1
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_pmd_tbl_update_pmd(ptr noundef %ptra, ptr noundef %pmd) #0 {
entry:
  %retval = alloca ptr, align 8
  %ptra.addr = alloca ptr, align 8
  %pmd.addr = alloca ptr, align 8
  store ptr %ptra, ptr %ptra.addr, align 8
  store ptr %pmd, ptr %pmd.addr, align 8
  %0 = load ptr, ptr %pmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %ptra.addr, align 8
  %call = call ptr @__RV_pmd_tbl_update_sa(ptr noundef %1, ptr noundef null, ptr noundef null, ptr noundef null)
  store ptr %call, ptr %retval, align 8
  br label %return

if.else:                                          ; preds = %entry
  %2 = load ptr, ptr %ptra.addr, align 8
  %3 = load ptr, ptr %pmd.addr, align 8
  %snda = getelementptr inbounds %struct.__RV_pmd, ptr %3, i32 0, i32 2
  %4 = load ptr, ptr %snda, align 8
  %5 = load ptr, ptr %pmd.addr, align 8
  %base = getelementptr inbounds %struct.__RV_pmd, ptr %5, i32 0, i32 0
  %6 = load ptr, ptr %base, align 8
  %7 = load ptr, ptr %pmd.addr, align 8
  %bound = getelementptr inbounds %struct.__RV_pmd, ptr %7, i32 0, i32 1
  %8 = load ptr, ptr %bound, align 8
  %call1 = call ptr @__RV_pmd_tbl_update_sa(ptr noundef %2, ptr noundef %4, ptr noundef %6, ptr noundef %8)
  store ptr %call1, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.else, %if.then
  %9 = load ptr, ptr %retval, align 8
  ret ptr %9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_pmd_tbl_update_pmd_ret(ptr noundef %ptra, ptr noundef %pmd, ptr noundef %ret) #0 {
entry:
  %ptra.addr = alloca ptr, align 8
  %pmd.addr = alloca ptr, align 8
  %ret.addr = alloca ptr, align 8
  store ptr %ptra, ptr %ptra.addr, align 8
  store ptr %pmd, ptr %pmd.addr, align 8
  store ptr %ret, ptr %ret.addr, align 8
  %0 = load ptr, ptr %ptra.addr, align 8
  %1 = load ptr, ptr %pmd.addr, align 8
  %call = call ptr @__RV_pmd_tbl_update_pmd(ptr noundef %0, ptr noundef %1)
  %2 = load ptr, ptr %ret.addr, align 8
  ret ptr %2
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_pmd_tbl_update_fpmd(ptr noundef %ptra, ptr noundef %fpmd) #0 {
entry:
  %retval = alloca ptr, align 8
  %ptra.addr = alloca ptr, align 8
  %fpmd.addr = alloca ptr, align 8
  store ptr %ptra, ptr %ptra.addr, align 8
  store ptr %fpmd, ptr %fpmd.addr, align 8
  %0 = load ptr, ptr %fpmd.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %ptra.addr, align 8
  %call = call ptr @__RV_pmd_tbl_update_sa(ptr noundef %1, ptr noundef null, ptr noundef null, ptr noundef null)
  store ptr %call, ptr %retval, align 8
  br label %return

if.else:                                          ; preds = %entry
  %2 = load ptr, ptr %ptra.addr, align 8
  %3 = load ptr, ptr %fpmd.addr, align 8
  %snda = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %3, i32 0, i32 2
  %4 = load ptr, ptr %snda, align 8
  %5 = load ptr, ptr %fpmd.addr, align 8
  %base = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %5, i32 0, i32 0
  %6 = load ptr, ptr %base, align 8
  %7 = load ptr, ptr %fpmd.addr, align 8
  %bound = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %7, i32 0, i32 1
  %8 = load ptr, ptr %bound, align 8
  %call1 = call ptr @__RV_pmd_tbl_update_sa(ptr noundef %2, ptr noundef %4, ptr noundef %6, ptr noundef %8)
  store ptr %call1, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.else, %if.then
  %9 = load ptr, ptr %retval, align 8
  ret ptr %9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_pmd_tbl_update_ptr(ptr noundef %ptra, ptr noundef %ptra1) #0 {
entry:
  %ptra.addr = alloca ptr, align 8
  %ptra1.addr = alloca ptr, align 8
  %pmd1 = alloca ptr, align 8
  store ptr %ptra, ptr %ptra.addr, align 8
  store ptr %ptra1, ptr %ptra1.addr, align 8
  %0 = load ptr, ptr %ptra1.addr, align 8
  %call = call ptr @__RV_pmd_tbl_lookup(ptr noundef %0)
  store ptr %call, ptr %pmd1, align 8
  %1 = load ptr, ptr %ptra.addr, align 8
  %2 = load ptr, ptr %pmd1, align 8
  %call1 = call ptr @__RV_pmd_tbl_update_pmd(ptr noundef %1, ptr noundef %2)
  ret ptr %call1
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_pmd_tbl_update_ptr_ret(ptr noundef %ptra, ptr noundef %ptra1, ptr noundef %ret) #0 {
entry:
  %ptra.addr = alloca ptr, align 8
  %ptra1.addr = alloca ptr, align 8
  %ret.addr = alloca ptr, align 8
  store ptr %ptra, ptr %ptra.addr, align 8
  store ptr %ptra1, ptr %ptra1.addr, align 8
  store ptr %ret, ptr %ret.addr, align 8
  %0 = load ptr, ptr %ptra.addr, align 8
  %1 = load ptr, ptr %ptra1.addr, align 8
  %call = call ptr @__RV_pmd_tbl_update_ptr(ptr noundef %0, ptr noundef %1)
  %2 = load ptr, ptr %ret.addr, align 8
  ret ptr %2
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_pmd_tbl_update_null(ptr noundef %ptra) #0 {
entry:
  %ptra.addr = alloca ptr, align 8
  %tbl = alloca ptr, align 8
  %pmd = alloca ptr, align 8
  store ptr %ptra, ptr %ptra.addr, align 8
  %call = call ptr @__RV_trie_get_trie_pmd()
  store ptr %call, ptr %tbl, align 8
  %0 = load ptr, ptr %tbl, align 8
  %1 = load ptr, ptr %ptra.addr, align 8
  %call1 = call ptr @__RV_trie_insert_pmd_ptr(ptr noundef %0, ptr noundef %1)
  store ptr %call1, ptr %pmd, align 8
  %2 = load ptr, ptr %pmd, align 8
  call void @__RV_pmd_set_null(ptr noundef %2)
  %3 = load ptr, ptr %pmd, align 8
  ret ptr %3
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_pmd_tbl_remove(ptr noundef %ptra) #0 {
entry:
  %ptra.addr = alloca ptr, align 8
  %tbl = alloca ptr, align 8
  store ptr %ptra, ptr %ptra.addr, align 8
  %call = call ptr @__RV_trie_get_trie_pmd()
  store ptr %call, ptr %tbl, align 8
  %0 = load ptr, ptr %tbl, align 8
  %1 = load ptr, ptr %ptra.addr, align 8
  %call1 = call i32 @__RV_trie_remove_pmd(ptr noundef %0, ptr noundef %1)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_pmd_tbl_remove_pa(ptr noundef %array, i64 noundef %size) #0 {
entry:
  %array.addr = alloca ptr, align 8
  %size.addr = alloca i64, align 8
  %i = alloca i64, align 8
  %tbl = alloca ptr, align 8
  store ptr %array, ptr %array.addr, align 8
  store i64 %size, ptr %size.addr, align 8
  %call = call ptr @__RV_trie_get_trie_pmd()
  store ptr %call, ptr %tbl, align 8
  store i64 0, ptr %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, ptr %i, align 8
  %1 = load i64, ptr %size.addr, align 8
  %cmp = icmp ult i64 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %tbl, align 8
  %3 = load ptr, ptr %array.addr, align 8
  %4 = load i64, ptr %i, align 8
  %add.ptr = getelementptr inbounds ptr, ptr %3, i64 %4
  %call1 = call i32 @__RV_trie_remove_pmd(ptr noundef %2, ptr noundef %add.ptr)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i64, ptr %i, align 8
  %inc = add i64 %5, 1
  store i64 %inc, ptr %i, align 8
  br label %for.cond, !llvm.loop !22

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_pmd_var_remove_pa(ptr noundef %array, i64 noundef %size) #0 {
entry:
  %array.addr = alloca ptr, align 8
  %size.addr = alloca i64, align 8
  %i = alloca i64, align 8
  store ptr %array, ptr %array.addr, align 8
  store i64 %size, ptr %size.addr, align 8
  store i64 0, ptr %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, ptr %i, align 8
  %1 = load i64, ptr %size.addr, align 8
  %cmp = icmp ult i64 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %array.addr, align 8
  %3 = load i64, ptr %i, align 8
  %add.ptr = getelementptr inbounds %struct.__RV_pmd, ptr %2, i64 %3
  call void @__RV_pmd_set_null(ptr noundef %add.ptr)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i64, ptr %i, align 8
  %inc = add i64 %4, 1
  store i64 %inc, ptr %i, align 8
  br label %for.cond, !llvm.loop !23

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_pmd_tbl_update_argv(i32 noundef %argc, ptr noundef %argv_addr, ptr noundef %argv) #0 {
entry:
  %argc.addr = alloca i32, align 4
  %argv_addr.addr = alloca ptr, align 8
  %argv.addr = alloca ptr, align 8
  %i = alloca i32, align 4
  %sa = alloca ptr, align 8
  store i32 %argc, ptr %argc.addr, align 4
  store ptr %argv_addr, ptr %argv_addr.addr, align 8
  store ptr %argv, ptr %argv.addr, align 8
  %call = call ptr @__RV_stat_node_create(i32 noundef 5, i64 noundef 0)
  store ptr %call, ptr %sa, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %1 = load i32, ptr %argc.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %argv.addr, align 8
  %3 = load i32, ptr %i, align 4
  %idx.ext = sext i32 %3 to i64
  %add.ptr = getelementptr inbounds ptr, ptr %2, i64 %idx.ext
  %4 = load ptr, ptr %sa, align 8
  %5 = load ptr, ptr %argv.addr, align 8
  %6 = load i32, ptr %i, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds ptr, ptr %5, i64 %idxprom
  %7 = load ptr, ptr %arrayidx, align 8
  %8 = load ptr, ptr %argv.addr, align 8
  %9 = load i32, ptr %i, align 4
  %idxprom1 = sext i32 %9 to i64
  %arrayidx2 = getelementptr inbounds ptr, ptr %8, i64 %idxprom1
  %10 = load ptr, ptr %arrayidx2, align 8
  %11 = load ptr, ptr %argv.addr, align 8
  %12 = load i32, ptr %i, align 4
  %idxprom3 = sext i32 %12 to i64
  %arrayidx4 = getelementptr inbounds ptr, ptr %11, i64 %idxprom3
  %13 = load ptr, ptr %arrayidx4, align 8
  %call5 = call i32 @__RV_sstrlen(ptr noundef %13)
  %idx.ext6 = sext i32 %call5 to i64
  %add.ptr7 = getelementptr inbounds i8, ptr %10, i64 %idx.ext6
  %add.ptr8 = getelementptr inbounds i8, ptr %add.ptr7, i64 1
  %call9 = call ptr @__RV_pmd_tbl_update_sa(ptr noundef %add.ptr, ptr noundef %4, ptr noundef %7, ptr noundef %add.ptr8)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32, ptr %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !24

for.end:                                          ; preds = %for.cond
  %15 = load ptr, ptr %argv_addr.addr, align 8
  %16 = load ptr, ptr %sa, align 8
  %17 = load ptr, ptr %argv.addr, align 8
  %18 = load ptr, ptr %argv.addr, align 8
  %19 = load i32, ptr %argc.addr, align 4
  %idx.ext10 = sext i32 %19 to i64
  %add.ptr11 = getelementptr inbounds ptr, ptr %18, i64 %idx.ext10
  %call12 = call ptr @__RV_pmd_tbl_update_sa(ptr noundef %15, ptr noundef %16, ptr noundef %17, ptr noundef %add.ptr11)
  ret ptr %call12
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_pmd_var_update_argv(i32 noundef %argc, ptr noundef %argv_pmd, ptr noundef %argv) #0 {
entry:
  %argc.addr = alloca i32, align 4
  %argv_pmd.addr = alloca ptr, align 8
  %argv.addr = alloca ptr, align 8
  %i = alloca i32, align 4
  %sa = alloca ptr, align 8
  store i32 %argc, ptr %argc.addr, align 4
  store ptr %argv_pmd, ptr %argv_pmd.addr, align 8
  store ptr %argv, ptr %argv.addr, align 8
  %call = call ptr @__RV_stat_node_create(i32 noundef 5, i64 noundef 0)
  store ptr %call, ptr %sa, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %1 = load i32, ptr %argc.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %argv.addr, align 8
  %3 = load i32, ptr %i, align 4
  %idx.ext = sext i32 %3 to i64
  %add.ptr = getelementptr inbounds ptr, ptr %2, i64 %idx.ext
  %4 = load ptr, ptr %sa, align 8
  %5 = load ptr, ptr %argv.addr, align 8
  %6 = load i32, ptr %i, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds ptr, ptr %5, i64 %idxprom
  %7 = load ptr, ptr %arrayidx, align 8
  %8 = load ptr, ptr %argv.addr, align 8
  %9 = load i32, ptr %i, align 4
  %idxprom1 = sext i32 %9 to i64
  %arrayidx2 = getelementptr inbounds ptr, ptr %8, i64 %idxprom1
  %10 = load ptr, ptr %arrayidx2, align 8
  %11 = load ptr, ptr %argv.addr, align 8
  %12 = load i32, ptr %i, align 4
  %idxprom3 = sext i32 %12 to i64
  %arrayidx4 = getelementptr inbounds ptr, ptr %11, i64 %idxprom3
  %13 = load ptr, ptr %arrayidx4, align 8
  %call5 = call i32 @__RV_sstrlen(ptr noundef %13)
  %idx.ext6 = sext i32 %call5 to i64
  %add.ptr7 = getelementptr inbounds i8, ptr %10, i64 %idx.ext6
  %add.ptr8 = getelementptr inbounds i8, ptr %add.ptr7, i64 1
  %call9 = call ptr @__RV_pmd_tbl_update_sa(ptr noundef %add.ptr, ptr noundef %4, ptr noundef %7, ptr noundef %add.ptr8)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32, ptr %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !25

for.end:                                          ; preds = %for.cond
  %15 = load ptr, ptr %argv_pmd.addr, align 8
  %16 = load ptr, ptr %sa, align 8
  %17 = load ptr, ptr %argv.addr, align 8
  %18 = load ptr, ptr %argv.addr, align 8
  %19 = load i32, ptr %argc.addr, align 4
  %idx.ext10 = sext i32 %19 to i64
  %add.ptr11 = getelementptr inbounds ptr, ptr %18, i64 %idx.ext10
  %call12 = call ptr @__RV_pmd_set(ptr noundef %15, ptr noundef %16, i32 noundef 0, ptr noundef %17, ptr noundef %add.ptr11)
  ret ptr %call12
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_pmd_tbl_remove_argv(i32 noundef %argc, ptr noundef %argv_addr, ptr noundef %argv) #0 {
entry:
  %argc.addr = alloca i32, align 4
  %argv_addr.addr = alloca ptr, align 8
  %argv.addr = alloca ptr, align 8
  store i32 %argc, ptr %argc.addr, align 4
  store ptr %argv_addr, ptr %argv_addr.addr, align 8
  store ptr %argv, ptr %argv.addr, align 8
  %0 = load ptr, ptr %argv.addr, align 8
  %1 = load i32, ptr %argc.addr, align 4
  %conv = sext i32 %1 to i64
  call void @__RV_pmd_tbl_remove_pa(ptr noundef %0, i64 noundef %conv)
  %2 = load ptr, ptr %argv_addr.addr, align 8
  call void @__RV_pmd_tbl_remove(ptr noundef %2)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_pmd_var_remove_argv(i32 noundef %argc, ptr noundef %argv_pmd, ptr noundef %argv) #0 {
entry:
  %argc.addr = alloca i32, align 4
  %argv_pmd.addr = alloca ptr, align 8
  %argv.addr = alloca ptr, align 8
  store i32 %argc, ptr %argc.addr, align 4
  store ptr %argv_pmd, ptr %argv_pmd.addr, align 8
  store ptr %argv, ptr %argv.addr, align 8
  %0 = load ptr, ptr %argv.addr, align 8
  %1 = load i32, ptr %argc.addr, align 4
  %conv = sext i32 %1 to i64
  call void @__RV_pmd_tbl_remove_pa(ptr noundef %0, i64 noundef %conv)
  %2 = load ptr, ptr %argv_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %2)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_pmd_tbl_update_envp(ptr noundef %envp_addr, ptr noundef %envp) #0 {
entry:
  %envp_addr.addr = alloca ptr, align 8
  %envp.addr = alloca ptr, align 8
  %i = alloca i32, align 4
  %sa = alloca ptr, align 8
  store ptr %envp_addr, ptr %envp_addr.addr, align 8
  store ptr %envp, ptr %envp.addr, align 8
  store i32 0, ptr %i, align 4
  %call = call ptr @__RV_stat_node_create(i32 noundef 5, i64 noundef 0)
  store ptr %call, ptr %sa, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load ptr, ptr %envp.addr, align 8
  %1 = load i32, ptr %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds ptr, ptr %0, i64 %idxprom
  %2 = load ptr, ptr %arrayidx, align 8
  %cmp = icmp ne ptr %2, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load ptr, ptr %envp.addr, align 8
  %4 = load i32, ptr %i, align 4
  %idx.ext = sext i32 %4 to i64
  %add.ptr = getelementptr inbounds ptr, ptr %3, i64 %idx.ext
  %5 = load ptr, ptr %sa, align 8
  %6 = load ptr, ptr %envp.addr, align 8
  %7 = load i32, ptr %i, align 4
  %idxprom1 = sext i32 %7 to i64
  %arrayidx2 = getelementptr inbounds ptr, ptr %6, i64 %idxprom1
  %8 = load ptr, ptr %arrayidx2, align 8
  %9 = load ptr, ptr %envp.addr, align 8
  %10 = load i32, ptr %i, align 4
  %idxprom3 = sext i32 %10 to i64
  %arrayidx4 = getelementptr inbounds ptr, ptr %9, i64 %idxprom3
  %11 = load ptr, ptr %arrayidx4, align 8
  %12 = load ptr, ptr %envp.addr, align 8
  %13 = load i32, ptr %i, align 4
  %idxprom5 = sext i32 %13 to i64
  %arrayidx6 = getelementptr inbounds ptr, ptr %12, i64 %idxprom5
  %14 = load ptr, ptr %arrayidx6, align 8
  %call7 = call i32 @__RV_sstrlen(ptr noundef %14)
  %idx.ext8 = sext i32 %call7 to i64
  %add.ptr9 = getelementptr inbounds i8, ptr %11, i64 %idx.ext8
  %add.ptr10 = getelementptr inbounds i8, ptr %add.ptr9, i64 1
  %call11 = call ptr @__RV_pmd_tbl_update_sa(ptr noundef %add.ptr, ptr noundef %5, ptr noundef %8, ptr noundef %add.ptr10)
  %15 = load i32, ptr %i, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, ptr %i, align 4
  br label %while.cond, !llvm.loop !26

while.end:                                        ; preds = %while.cond
  %16 = load ptr, ptr %envp_addr.addr, align 8
  %17 = load ptr, ptr %sa, align 8
  %18 = load ptr, ptr %envp.addr, align 8
  %19 = load ptr, ptr %envp.addr, align 8
  %20 = load i32, ptr %i, align 4
  %idx.ext12 = sext i32 %20 to i64
  %add.ptr13 = getelementptr inbounds ptr, ptr %19, i64 %idx.ext12
  %add.ptr14 = getelementptr inbounds ptr, ptr %add.ptr13, i64 1
  %call15 = call ptr @__RV_pmd_tbl_update_sa(ptr noundef %16, ptr noundef %17, ptr noundef %18, ptr noundef %add.ptr14)
  ret ptr %call15
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_pmd_var_update_envp(ptr noundef %envp_pmd, ptr noundef %envp) #0 {
entry:
  %envp_pmd.addr = alloca ptr, align 8
  %envp.addr = alloca ptr, align 8
  %i = alloca i32, align 4
  %sa = alloca ptr, align 8
  store ptr %envp_pmd, ptr %envp_pmd.addr, align 8
  store ptr %envp, ptr %envp.addr, align 8
  store i32 0, ptr %i, align 4
  %call = call ptr @__RV_stat_node_create(i32 noundef 5, i64 noundef 0)
  store ptr %call, ptr %sa, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load ptr, ptr %envp.addr, align 8
  %1 = load i32, ptr %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds ptr, ptr %0, i64 %idxprom
  %2 = load ptr, ptr %arrayidx, align 8
  %cmp = icmp ne ptr %2, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load ptr, ptr %envp.addr, align 8
  %4 = load i32, ptr %i, align 4
  %idx.ext = sext i32 %4 to i64
  %add.ptr = getelementptr inbounds ptr, ptr %3, i64 %idx.ext
  %5 = load ptr, ptr %sa, align 8
  %6 = load ptr, ptr %envp.addr, align 8
  %7 = load i32, ptr %i, align 4
  %idxprom1 = sext i32 %7 to i64
  %arrayidx2 = getelementptr inbounds ptr, ptr %6, i64 %idxprom1
  %8 = load ptr, ptr %arrayidx2, align 8
  %9 = load ptr, ptr %envp.addr, align 8
  %10 = load i32, ptr %i, align 4
  %idxprom3 = sext i32 %10 to i64
  %arrayidx4 = getelementptr inbounds ptr, ptr %9, i64 %idxprom3
  %11 = load ptr, ptr %arrayidx4, align 8
  %12 = load ptr, ptr %envp.addr, align 8
  %13 = load i32, ptr %i, align 4
  %idxprom5 = sext i32 %13 to i64
  %arrayidx6 = getelementptr inbounds ptr, ptr %12, i64 %idxprom5
  %14 = load ptr, ptr %arrayidx6, align 8
  %call7 = call i32 @__RV_sstrlen(ptr noundef %14)
  %idx.ext8 = sext i32 %call7 to i64
  %add.ptr9 = getelementptr inbounds i8, ptr %11, i64 %idx.ext8
  %add.ptr10 = getelementptr inbounds i8, ptr %add.ptr9, i64 1
  %call11 = call ptr @__RV_pmd_tbl_update_sa(ptr noundef %add.ptr, ptr noundef %5, ptr noundef %8, ptr noundef %add.ptr10)
  %15 = load i32, ptr %i, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, ptr %i, align 4
  br label %while.cond, !llvm.loop !27

while.end:                                        ; preds = %while.cond
  %16 = load ptr, ptr %envp_pmd.addr, align 8
  %17 = load ptr, ptr %sa, align 8
  %18 = load ptr, ptr %envp.addr, align 8
  %19 = load ptr, ptr %envp.addr, align 8
  %20 = load i32, ptr %i, align 4
  %idx.ext12 = sext i32 %20 to i64
  %add.ptr13 = getelementptr inbounds ptr, ptr %19, i64 %idx.ext12
  %add.ptr14 = getelementptr inbounds ptr, ptr %add.ptr13, i64 1
  %call15 = call ptr @__RV_pmd_set(ptr noundef %16, ptr noundef %17, i32 noundef 0, ptr noundef %18, ptr noundef %add.ptr14)
  ret ptr %call15
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_pmd_tbl_remove_envp(ptr noundef %envp_addr, ptr noundef %envp) #0 {
entry:
  %envp_addr.addr = alloca ptr, align 8
  %envp.addr = alloca ptr, align 8
  %i = alloca i32, align 4
  store ptr %envp_addr, ptr %envp_addr.addr, align 8
  store ptr %envp, ptr %envp.addr, align 8
  store i32 0, ptr %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load ptr, ptr %envp.addr, align 8
  %1 = load i32, ptr %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds ptr, ptr %0, i64 %idxprom
  %2 = load ptr, ptr %arrayidx, align 8
  %cmp = icmp ne ptr %2, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load ptr, ptr %envp.addr, align 8
  %4 = load i32, ptr %i, align 4
  %idx.ext = sext i32 %4 to i64
  %add.ptr = getelementptr inbounds ptr, ptr %3, i64 %idx.ext
  call void @__RV_pmd_tbl_remove(ptr noundef %add.ptr)
  %5 = load i32, ptr %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, ptr %i, align 4
  br label %while.cond, !llvm.loop !28

while.end:                                        ; preds = %while.cond
  %6 = load ptr, ptr %envp_addr.addr, align 8
  call void @__RV_pmd_tbl_remove(ptr noundef %6)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_pmd_var_remove_envp(ptr noundef %envp_pmd, ptr noundef %envp) #0 {
entry:
  %envp_pmd.addr = alloca ptr, align 8
  %envp.addr = alloca ptr, align 8
  %i = alloca i32, align 4
  store ptr %envp_pmd, ptr %envp_pmd.addr, align 8
  store ptr %envp, ptr %envp.addr, align 8
  store i32 0, ptr %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load ptr, ptr %envp.addr, align 8
  %1 = load i32, ptr %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds ptr, ptr %0, i64 %idxprom
  %2 = load ptr, ptr %arrayidx, align 8
  %cmp = icmp ne ptr %2, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load ptr, ptr %envp.addr, align 8
  %4 = load i32, ptr %i, align 4
  %idx.ext = sext i32 %4 to i64
  %add.ptr = getelementptr inbounds ptr, ptr %3, i64 %idx.ext
  call void @__RV_pmd_tbl_remove(ptr noundef %add.ptr)
  %5 = load i32, ptr %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, ptr %i, align 4
  br label %while.cond, !llvm.loop !29

while.end:                                        ; preds = %while.cond
  %6 = load ptr, ptr %envp_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %6)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_fmd_tbl_create(ptr noundef %func, i8 noundef zeroext %capacity) #0 {
entry:
  %func.addr = alloca ptr, align 8
  %capacity.addr = alloca i8, align 1
  %tbl = alloca ptr, align 8
  %fmd = alloca ptr, align 8
  store ptr %func, ptr %func.addr, align 8
  store i8 %capacity, ptr %capacity.addr, align 1
  %call = call ptr @__RV_hashtbl_get_hashtbl_fmd()
  store ptr %call, ptr %tbl, align 8
  %0 = load ptr, ptr %tbl, align 8
  %1 = load ptr, ptr %func.addr, align 8
  %2 = load i8, ptr %capacity.addr, align 1
  %call1 = call ptr @__RV_hashtbl_insert_fmd_func(ptr noundef %0, ptr noundef %1, i8 noundef zeroext %2)
  store ptr %call1, ptr %fmd, align 8
  %3 = load ptr, ptr %fmd, align 8
  call void @__RV_fmd_set_null(ptr noundef %3)
  %4 = load ptr, ptr %fmd, align 8
  ret ptr %4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_fmd_tbl_lookup(ptr noundef %func) #0 {
entry:
  %func.addr = alloca ptr, align 8
  %tbl = alloca ptr, align 8
  store ptr %func, ptr %func.addr, align 8
  %call = call ptr @__RV_hashtbl_get_hashtbl_fmd()
  store ptr %call, ptr %tbl, align 8
  %0 = load ptr, ptr %tbl, align 8
  %1 = load ptr, ptr %func.addr, align 8
  %call1 = call ptr @__RV_hashtbl_find_fmd(ptr noundef %0, ptr noundef %1)
  ret ptr %call1
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_fmd_tbl_lookup_fpmd(ptr noundef %func, i8 noundef zeroext %i) #0 {
entry:
  %func.addr = alloca ptr, align 8
  %i.addr = alloca i8, align 1
  %fmd = alloca ptr, align 8
  store ptr %func, ptr %func.addr, align 8
  store i8 %i, ptr %i.addr, align 1
  %0 = load ptr, ptr %func.addr, align 8
  %call = call ptr @__RV_fmd_tbl_lookup(ptr noundef %0)
  store ptr %call, ptr %fmd, align 8
  %1 = load ptr, ptr %fmd, align 8
  %2 = load i8, ptr %i.addr, align 1
  %call1 = call ptr @__RV_fmd_get_fmd_pmd(ptr noundef %1, i8 noundef zeroext %2)
  ret ptr %call1
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_fmd_tbl_print(ptr noundef %func, i8 noundef zeroext %i, ptr noundef %func_name) #0 {
entry:
  %func.addr = alloca ptr, align 8
  %i.addr = alloca i8, align 1
  %func_name.addr = alloca ptr, align 8
  %fpmd = alloca ptr, align 8
  store ptr %func, ptr %func.addr, align 8
  store i8 %i, ptr %i.addr, align 1
  store ptr %func_name, ptr %func_name.addr, align 8
  %0 = load ptr, ptr %func.addr, align 8
  %1 = load i8, ptr %i.addr, align 1
  %call = call ptr @__RV_fmd_tbl_lookup_fpmd(ptr noundef %0, i8 noundef zeroext %1)
  store ptr %call, ptr %fpmd, align 8
  %2 = load ptr, ptr %fpmd, align 8
  %tobool = icmp ne ptr %2, null
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i8, ptr %i.addr, align 1
  %conv = zext i8 %4 to i32
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %3, i32 noundef %conv)
  br label %if.end11

if.else:                                          ; preds = %entry
  %5 = load ptr, ptr %func_name.addr, align 8
  %6 = load i8, ptr %i.addr, align 1
  %conv2 = zext i8 %6 to i32
  %7 = load ptr, ptr %fpmd, align 8
  %base = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %7, i32 0, i32 0
  %8 = load ptr, ptr %base, align 8
  %9 = load ptr, ptr %fpmd, align 8
  %bound = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %9, i32 0, i32 1
  %10 = load ptr, ptr %bound, align 8
  %call3 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, ptr noundef %5, i32 noundef %conv2, ptr noundef %8, ptr noundef %10)
  %11 = load ptr, ptr %fpmd, align 8
  %snda = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %11, i32 0, i32 2
  %12 = load ptr, ptr %snda, align 8
  %tobool4 = icmp ne ptr %12, null
  br i1 %tobool4, label %if.else7, label %if.then5

if.then5:                                         ; preds = %if.else
  %call6 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %if.end

if.else7:                                         ; preds = %if.else
  %13 = load ptr, ptr %fpmd, align 8
  %snda8 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %13, i32 0, i32 2
  %14 = load ptr, ptr %snda8, align 8
  %stat = getelementptr inbounds %struct.__RV_stat_node, ptr %14, i32 0, i32 0
  %15 = load i32, ptr %stat, align 8
  %16 = load ptr, ptr %fpmd, align 8
  %snda9 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %16, i32 0, i32 2
  %17 = load ptr, ptr %snda9, align 8
  %count = getelementptr inbounds %struct.__RV_stat_node, ptr %17, i32 0, i32 1
  %18 = load i64, ptr %count, align 8
  %call10 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %15, i64 noundef %18)
  br label %if.end

if.end:                                           ; preds = %if.else7, %if.then5
  br label %if.end11

if.end11:                                         ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_fmd_tbl_update_pmd(ptr noundef %func, i8 noundef zeroext %i, ptr noundef %pmd) #0 {
entry:
  %func.addr = alloca ptr, align 8
  %i.addr = alloca i8, align 1
  %pmd.addr = alloca ptr, align 8
  %fmd = alloca ptr, align 8
  store ptr %func, ptr %func.addr, align 8
  store i8 %i, ptr %i.addr, align 1
  store ptr %pmd, ptr %pmd.addr, align 8
  %0 = load ptr, ptr %func.addr, align 8
  %call = call ptr @__RV_fmd_tbl_lookup(ptr noundef %0)
  store ptr %call, ptr %fmd, align 8
  %1 = load ptr, ptr %fmd, align 8
  %2 = load i8, ptr %i.addr, align 1
  %3 = load ptr, ptr %pmd.addr, align 8
  call void @__RV_fmd_cp_pmd(ptr noundef %1, i8 noundef zeroext %2, ptr noundef %3)
  %4 = load ptr, ptr %fmd, align 8
  ret ptr %4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_fmd_tbl_remove(ptr noundef %func) #0 {
entry:
  %func.addr = alloca ptr, align 8
  %fmd = alloca ptr, align 8
  store ptr %func, ptr %func.addr, align 8
  %0 = load ptr, ptr %func.addr, align 8
  %call = call ptr @__RV_fmd_tbl_lookup(ptr noundef %0)
  store ptr %call, ptr %fmd, align 8
  %1 = load ptr, ptr %fmd, align 8
  call void @__RV_fmd_set_null(ptr noundef %1)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_check_dpv(ptr noundef %pmd, ptr noundef %ptr, i64 noundef %size, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %line, i32 noundef %column, ptr noundef %ptr_name) #0 {
entry:
  %retval = alloca ptr, align 8
  %pmd.addr = alloca ptr, align 8
  %ptr.addr = alloca ptr, align 8
  %size.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %line.addr = alloca i32, align 4
  %column.addr = alloca i32, align 4
  %ptr_name.addr = alloca ptr, align 8
  %stat = alloca i32, align 4
  store ptr %pmd, ptr %pmd.addr, align 8
  store ptr %ptr, ptr %ptr.addr, align 8
  store i64 %size, ptr %size.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %line, ptr %line.addr, align 4
  store i32 %column, ptr %column.addr, align 4
  store ptr %ptr_name, ptr %ptr_name.addr, align 8
  %0 = load ptr, ptr %pmd.addr, align 8
  %call = call i32 @__RV_pmd_get_stat(ptr noundef %0)
  store i32 %call, ptr %stat, align 4
  %1 = load ptr, ptr %ptr.addr, align 8
  %cmp = icmp eq ptr %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr @stderr, align 8
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load ptr, ptr %file_name.addr, align 8
  %6 = load i32, ptr %line.addr, align 4
  %7 = load i32, ptr %column.addr, align 4
  %8 = load ptr, ptr %ptr_name.addr, align 8
  %call1 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %2, ptr noundef @.str.13, ptr noundef %3, ptr noundef %4, ptr noundef %5, i32 noundef %6, i32 noundef %7, ptr noundef %8)
  %9 = load i64, ptr @__RV_error_count, align 8
  %inc = add i64 %9, 1
  store i64 %inc, ptr @__RV_error_count, align 8
  %10 = load ptr, ptr %ptr.addr, align 8
  store ptr %10, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %11 = load ptr, ptr %pmd.addr, align 8
  %cmp2 = icmp eq ptr %11, null
  br i1 %cmp2, label %if.then5, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %12 = load ptr, ptr %pmd.addr, align 8
  %pmdflag = getelementptr inbounds %struct.__RV_pmd, ptr %12, i32 0, i32 3
  %13 = load i8, ptr %pmdflag, align 8
  %conv = zext i8 %13 to i32
  %cmp3 = icmp eq i32 %conv, 0
  br i1 %cmp3, label %if.then5, label %if.end8

if.then5:                                         ; preds = %lor.lhs.false, %if.end
  %14 = load ptr, ptr @stderr, align 8
  %15 = load ptr, ptr %file_name.addr, align 8
  %16 = load ptr, ptr %func_name.addr, align 8
  %17 = load ptr, ptr %file_name.addr, align 8
  %18 = load i32, ptr %line.addr, align 4
  %19 = load i32, ptr %column.addr, align 4
  %20 = load ptr, ptr %ptr_name.addr, align 8
  %21 = load ptr, ptr %ptr.addr, align 8
  %22 = load i64, ptr %size.addr, align 8
  %call6 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %14, ptr noundef @.str.14, ptr noundef %15, ptr noundef %16, ptr noundef %17, i32 noundef %18, i32 noundef %19, ptr noundef %20, ptr noundef %21, i64 noundef %22)
  %23 = load i64, ptr @__RV_error_count, align 8
  %inc7 = add i64 %23, 1
  store i64 %inc7, ptr @__RV_error_count, align 8
  %24 = load ptr, ptr %ptr.addr, align 8
  store ptr %24, ptr %retval, align 8
  br label %return

if.end8:                                          ; preds = %lor.lhs.false
  %25 = load i32, ptr %stat, align 4
  %cmp9 = icmp eq i32 %25, 0
  br i1 %cmp9, label %if.then11, label %if.end14

if.then11:                                        ; preds = %if.end8
  %26 = load ptr, ptr @stderr, align 8
  %27 = load ptr, ptr %file_name.addr, align 8
  %28 = load ptr, ptr %func_name.addr, align 8
  %29 = load ptr, ptr %file_name.addr, align 8
  %30 = load i32, ptr %line.addr, align 4
  %31 = load i32, ptr %column.addr, align 4
  %32 = load ptr, ptr %ptr_name.addr, align 8
  %33 = load ptr, ptr %ptr.addr, align 8
  %34 = load i64, ptr %size.addr, align 8
  %35 = load ptr, ptr %pmd.addr, align 8
  %base = getelementptr inbounds %struct.__RV_pmd, ptr %35, i32 0, i32 0
  %36 = load ptr, ptr %base, align 8
  %37 = load ptr, ptr %pmd.addr, align 8
  %bound = getelementptr inbounds %struct.__RV_pmd, ptr %37, i32 0, i32 1
  %38 = load ptr, ptr %bound, align 8
  %call12 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %26, ptr noundef @.str.15, ptr noundef %27, ptr noundef %28, ptr noundef %29, i32 noundef %30, i32 noundef %31, ptr noundef %32, ptr noundef %33, i64 noundef %34, ptr noundef %36, ptr noundef %38)
  %39 = load i64, ptr @__RV_error_count, align 8
  %inc13 = add i64 %39, 1
  store i64 %inc13, ptr @__RV_error_count, align 8
  %40 = load ptr, ptr %ptr.addr, align 8
  store ptr %40, ptr %retval, align 8
  br label %return

if.end14:                                         ; preds = %if.end8
  %41 = load i32, ptr %stat, align 4
  %cmp15 = icmp eq i32 %41, 1
  br i1 %cmp15, label %if.then17, label %if.end21

if.then17:                                        ; preds = %if.end14
  %42 = load ptr, ptr @stderr, align 8
  %43 = load ptr, ptr %file_name.addr, align 8
  %44 = load ptr, ptr %func_name.addr, align 8
  %45 = load ptr, ptr %file_name.addr, align 8
  %46 = load i32, ptr %line.addr, align 4
  %47 = load i32, ptr %column.addr, align 4
  %48 = load ptr, ptr %ptr_name.addr, align 8
  %49 = load ptr, ptr %ptr.addr, align 8
  %50 = load i64, ptr %size.addr, align 8
  %51 = load ptr, ptr %pmd.addr, align 8
  %base18 = getelementptr inbounds %struct.__RV_pmd, ptr %51, i32 0, i32 0
  %52 = load ptr, ptr %base18, align 8
  %call19 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %42, ptr noundef @.str.16, ptr noundef %43, ptr noundef %44, ptr noundef %45, i32 noundef %46, i32 noundef %47, ptr noundef %48, ptr noundef %49, i64 noundef %50, ptr noundef %52)
  %53 = load i64, ptr @__RV_error_count, align 8
  %inc20 = add i64 %53, 1
  store i64 %inc20, ptr @__RV_error_count, align 8
  %54 = load ptr, ptr %ptr.addr, align 8
  store ptr %54, ptr %retval, align 8
  br label %return

if.end21:                                         ; preds = %if.end14
  %55 = load ptr, ptr %ptr.addr, align 8
  %56 = load ptr, ptr %pmd.addr, align 8
  %base22 = getelementptr inbounds %struct.__RV_pmd, ptr %56, i32 0, i32 0
  %57 = load ptr, ptr %base22, align 8
  %cmp23 = icmp ult ptr %55, %57
  br i1 %cmp23, label %if.then33, label %lor.lhs.false25

lor.lhs.false25:                                  ; preds = %if.end21
  %58 = load ptr, ptr %ptr.addr, align 8
  %59 = load i64, ptr %size.addr, align 8
  %add.ptr = getelementptr inbounds i8, ptr %58, i64 %59
  %60 = load ptr, ptr %pmd.addr, align 8
  %bound26 = getelementptr inbounds %struct.__RV_pmd, ptr %60, i32 0, i32 1
  %61 = load ptr, ptr %bound26, align 8
  %cmp27 = icmp ugt ptr %add.ptr, %61
  br i1 %cmp27, label %if.then33, label %lor.lhs.false29

lor.lhs.false29:                                  ; preds = %lor.lhs.false25
  %62 = load ptr, ptr %ptr.addr, align 8
  %63 = load i64, ptr %size.addr, align 8
  %add.ptr30 = getelementptr inbounds i8, ptr %62, i64 %63
  %64 = load ptr, ptr %ptr.addr, align 8
  %cmp31 = icmp ult ptr %add.ptr30, %64
  br i1 %cmp31, label %if.then33, label %if.end38

if.then33:                                        ; preds = %lor.lhs.false29, %lor.lhs.false25, %if.end21
  %65 = load ptr, ptr @stderr, align 8
  %66 = load ptr, ptr %file_name.addr, align 8
  %67 = load ptr, ptr %func_name.addr, align 8
  %68 = load ptr, ptr %file_name.addr, align 8
  %69 = load i32, ptr %line.addr, align 4
  %70 = load i32, ptr %column.addr, align 4
  %71 = load ptr, ptr %ptr_name.addr, align 8
  %72 = load ptr, ptr %ptr.addr, align 8
  %73 = load i64, ptr %size.addr, align 8
  %74 = load ptr, ptr %pmd.addr, align 8
  %base34 = getelementptr inbounds %struct.__RV_pmd, ptr %74, i32 0, i32 0
  %75 = load ptr, ptr %base34, align 8
  %76 = load ptr, ptr %pmd.addr, align 8
  %bound35 = getelementptr inbounds %struct.__RV_pmd, ptr %76, i32 0, i32 1
  %77 = load ptr, ptr %bound35, align 8
  %call36 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %65, ptr noundef @.str.17, ptr noundef %66, ptr noundef %67, ptr noundef %68, i32 noundef %69, i32 noundef %70, ptr noundef %71, ptr noundef %72, i64 noundef %73, ptr noundef %75, ptr noundef %77)
  %78 = load i64, ptr @__RV_error_count, align 8
  %inc37 = add i64 %78, 1
  store i64 %inc37, ptr @__RV_error_count, align 8
  %79 = load ptr, ptr %ptr.addr, align 8
  store ptr %79, ptr %retval, align 8
  br label %return

if.end38:                                         ; preds = %lor.lhs.false29
  %80 = load ptr, ptr %ptr.addr, align 8
  store ptr %80, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end38, %if.then33, %if.then17, %if.then11, %if.then5, %if.then
  %81 = load ptr, ptr %retval, align 8
  ret ptr %81
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__RV_check_dpv_ss(ptr noundef %pmd, ptr noundef %ptr, i64 noundef %subscript, i64 noundef %size, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %line, i32 noundef %column, ptr noundef %ptr_name) #0 {
entry:
  %pmd.addr = alloca ptr, align 8
  %ptr.addr = alloca ptr, align 8
  %subscript.addr = alloca i64, align 8
  %size.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %line.addr = alloca i32, align 4
  %column.addr = alloca i32, align 4
  %ptr_name.addr = alloca ptr, align 8
  store ptr %pmd, ptr %pmd.addr, align 8
  store ptr %ptr, ptr %ptr.addr, align 8
  store i64 %subscript, ptr %subscript.addr, align 8
  store i64 %size, ptr %size.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %line, ptr %line.addr, align 4
  store i32 %column, ptr %column.addr, align 4
  store ptr %ptr_name, ptr %ptr_name.addr, align 8
  %0 = load ptr, ptr %pmd.addr, align 8
  %1 = load ptr, ptr %ptr.addr, align 8
  %2 = load i64, ptr %subscript.addr, align 8
  %3 = load i64, ptr %size.addr, align 8
  %mul = mul i64 %2, %3
  %add.ptr = getelementptr inbounds i8, ptr %1, i64 %mul
  %4 = load i64, ptr %size.addr, align 8
  %5 = load ptr, ptr %file_name.addr, align 8
  %6 = load ptr, ptr %func_name.addr, align 8
  %7 = load i32, ptr %line.addr, align 4
  %8 = load i32, ptr %column.addr, align 4
  %9 = load ptr, ptr %ptr_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %add.ptr, i64 noundef %4, ptr noundef %5, ptr noundef %6, i32 noundef %7, i32 noundef %8, ptr noundef %9)
  %10 = load i64, ptr %subscript.addr, align 8
  ret i64 %10
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_check_dpfv(ptr noundef %pmd, ptr noundef %ptr, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %line, i32 noundef %column, ptr noundef %ptr_name) #0 {
entry:
  %retval = alloca ptr, align 8
  %pmd.addr = alloca ptr, align 8
  %ptr.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %line.addr = alloca i32, align 4
  %column.addr = alloca i32, align 4
  %ptr_name.addr = alloca ptr, align 8
  %stat = alloca i32, align 4
  store ptr %pmd, ptr %pmd.addr, align 8
  store ptr %ptr, ptr %ptr.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %line, ptr %line.addr, align 4
  store i32 %column, ptr %column.addr, align 4
  store ptr %ptr_name, ptr %ptr_name.addr, align 8
  %0 = load ptr, ptr %pmd.addr, align 8
  %call = call i32 @__RV_pmd_get_stat(ptr noundef %0)
  store i32 %call, ptr %stat, align 4
  %1 = load ptr, ptr %ptr.addr, align 8
  %cmp = icmp eq ptr %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr @stderr, align 8
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load ptr, ptr %file_name.addr, align 8
  %6 = load i32, ptr %line.addr, align 4
  %7 = load i32, ptr %column.addr, align 4
  %8 = load ptr, ptr %ptr_name.addr, align 8
  %call1 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %2, ptr noundef @.str.13, ptr noundef %3, ptr noundef %4, ptr noundef %5, i32 noundef %6, i32 noundef %7, ptr noundef %8)
  %9 = load i64, ptr @__RV_error_count, align 8
  %inc = add i64 %9, 1
  store i64 %inc, ptr @__RV_error_count, align 8
  %10 = load ptr, ptr %ptr.addr, align 8
  store ptr %10, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %11 = load ptr, ptr %pmd.addr, align 8
  %cmp2 = icmp eq ptr %11, null
  br i1 %cmp2, label %if.then5, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %12 = load ptr, ptr %pmd.addr, align 8
  %pmdflag = getelementptr inbounds %struct.__RV_pmd, ptr %12, i32 0, i32 3
  %13 = load i8, ptr %pmdflag, align 8
  %conv = zext i8 %13 to i32
  %cmp3 = icmp eq i32 %conv, 0
  br i1 %cmp3, label %if.then5, label %if.end8

if.then5:                                         ; preds = %lor.lhs.false, %if.end
  %14 = load ptr, ptr @stderr, align 8
  %15 = load ptr, ptr %file_name.addr, align 8
  %16 = load ptr, ptr %func_name.addr, align 8
  %17 = load ptr, ptr %file_name.addr, align 8
  %18 = load i32, ptr %line.addr, align 4
  %19 = load i32, ptr %column.addr, align 4
  %20 = load ptr, ptr %ptr_name.addr, align 8
  %21 = load ptr, ptr %ptr.addr, align 8
  %call6 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %14, ptr noundef @.str.18, ptr noundef %15, ptr noundef %16, ptr noundef %17, i32 noundef %18, i32 noundef %19, ptr noundef %20, ptr noundef %21)
  %22 = load i64, ptr @__RV_error_count, align 8
  %inc7 = add i64 %22, 1
  store i64 %inc7, ptr @__RV_error_count, align 8
  %23 = load ptr, ptr %ptr.addr, align 8
  store ptr %23, ptr %retval, align 8
  br label %return

if.end8:                                          ; preds = %lor.lhs.false
  %24 = load i32, ptr %stat, align 4
  %cmp9 = icmp eq i32 %24, 0
  br i1 %cmp9, label %if.then11, label %if.end14

if.then11:                                        ; preds = %if.end8
  %25 = load ptr, ptr @stderr, align 8
  %26 = load ptr, ptr %file_name.addr, align 8
  %27 = load ptr, ptr %func_name.addr, align 8
  %28 = load ptr, ptr %file_name.addr, align 8
  %29 = load i32, ptr %line.addr, align 4
  %30 = load i32, ptr %column.addr, align 4
  %31 = load ptr, ptr %ptr_name.addr, align 8
  %32 = load ptr, ptr %ptr.addr, align 8
  %33 = load ptr, ptr %pmd.addr, align 8
  %base = getelementptr inbounds %struct.__RV_pmd, ptr %33, i32 0, i32 0
  %34 = load ptr, ptr %base, align 8
  %35 = load ptr, ptr %pmd.addr, align 8
  %bound = getelementptr inbounds %struct.__RV_pmd, ptr %35, i32 0, i32 1
  %36 = load ptr, ptr %bound, align 8
  %call12 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %25, ptr noundef @.str.19, ptr noundef %26, ptr noundef %27, ptr noundef %28, i32 noundef %29, i32 noundef %30, ptr noundef %31, ptr noundef %32, ptr noundef %34, ptr noundef %36)
  %37 = load i64, ptr @__RV_error_count, align 8
  %inc13 = add i64 %37, 1
  store i64 %inc13, ptr @__RV_error_count, align 8
  %38 = load ptr, ptr %ptr.addr, align 8
  store ptr %38, ptr %retval, align 8
  br label %return

if.end14:                                         ; preds = %if.end8
  %39 = load i32, ptr %stat, align 4
  %cmp15 = icmp ne i32 %39, 1
  br i1 %cmp15, label %land.lhs.true, label %if.end24

land.lhs.true:                                    ; preds = %if.end14
  %40 = load i32, ptr %stat, align 4
  %cmp17 = icmp ne i32 %40, 6
  br i1 %cmp17, label %if.then19, label %if.end24

if.then19:                                        ; preds = %land.lhs.true
  %41 = load ptr, ptr @stderr, align 8
  %42 = load ptr, ptr %file_name.addr, align 8
  %43 = load ptr, ptr %func_name.addr, align 8
  %44 = load ptr, ptr %file_name.addr, align 8
  %45 = load i32, ptr %line.addr, align 4
  %46 = load i32, ptr %column.addr, align 4
  %47 = load ptr, ptr %ptr_name.addr, align 8
  %48 = load ptr, ptr %ptr.addr, align 8
  %49 = load ptr, ptr %pmd.addr, align 8
  %base20 = getelementptr inbounds %struct.__RV_pmd, ptr %49, i32 0, i32 0
  %50 = load ptr, ptr %base20, align 8
  %51 = load ptr, ptr %pmd.addr, align 8
  %bound21 = getelementptr inbounds %struct.__RV_pmd, ptr %51, i32 0, i32 1
  %52 = load ptr, ptr %bound21, align 8
  %call22 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %41, ptr noundef @.str.20, ptr noundef %42, ptr noundef %43, ptr noundef %44, i32 noundef %45, i32 noundef %46, ptr noundef %47, ptr noundef %48, ptr noundef %50, ptr noundef %52)
  %53 = load i64, ptr @__RV_error_count, align 8
  %inc23 = add i64 %53, 1
  store i64 %inc23, ptr @__RV_error_count, align 8
  %54 = load ptr, ptr %ptr.addr, align 8
  store ptr %54, ptr %retval, align 8
  br label %return

if.end24:                                         ; preds = %land.lhs.true, %if.end14
  %55 = load ptr, ptr %ptr.addr, align 8
  %56 = load ptr, ptr %pmd.addr, align 8
  %base25 = getelementptr inbounds %struct.__RV_pmd, ptr %56, i32 0, i32 0
  %57 = load ptr, ptr %base25, align 8
  %cmp26 = icmp ne ptr %55, %57
  br i1 %cmp26, label %if.then28, label %if.end32

if.then28:                                        ; preds = %if.end24
  %58 = load ptr, ptr @stderr, align 8
  %59 = load ptr, ptr %file_name.addr, align 8
  %60 = load ptr, ptr %func_name.addr, align 8
  %61 = load ptr, ptr %file_name.addr, align 8
  %62 = load i32, ptr %line.addr, align 4
  %63 = load i32, ptr %column.addr, align 4
  %64 = load ptr, ptr %ptr_name.addr, align 8
  %65 = load ptr, ptr %ptr.addr, align 8
  %66 = load ptr, ptr %pmd.addr, align 8
  %base29 = getelementptr inbounds %struct.__RV_pmd, ptr %66, i32 0, i32 0
  %67 = load ptr, ptr %base29, align 8
  %call30 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %58, ptr noundef @.str.21, ptr noundef %59, ptr noundef %60, ptr noundef %61, i32 noundef %62, i32 noundef %63, ptr noundef %64, ptr noundef %65, ptr noundef %67)
  %68 = load i64, ptr @__RV_error_count, align 8
  %inc31 = add i64 %68, 1
  store i64 %inc31, ptr @__RV_error_count, align 8
  %69 = load ptr, ptr %ptr.addr, align 8
  store ptr %69, ptr %retval, align 8
  br label %return

if.end32:                                         ; preds = %if.end24
  %70 = load ptr, ptr %ptr.addr, align 8
  store ptr %70, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end32, %if.then28, %if.then19, %if.then11, %if.then5, %if.then
  %71 = load ptr, ptr %retval, align 8
  ret ptr %71
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_check_dpc(ptr noundef %base, ptr noundef %bound, ptr noundef %ptr, i64 noundef %size, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %line, i32 noundef %column, ptr noundef %ptr_name) #0 {
entry:
  %retval = alloca ptr, align 8
  %base.addr = alloca ptr, align 8
  %bound.addr = alloca ptr, align 8
  %ptr.addr = alloca ptr, align 8
  %size.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %line.addr = alloca i32, align 4
  %column.addr = alloca i32, align 4
  %ptr_name.addr = alloca ptr, align 8
  store ptr %base, ptr %base.addr, align 8
  store ptr %bound, ptr %bound.addr, align 8
  store ptr %ptr, ptr %ptr.addr, align 8
  store i64 %size, ptr %size.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %line, ptr %line.addr, align 4
  store i32 %column, ptr %column.addr, align 4
  store ptr %ptr_name, ptr %ptr_name.addr, align 8
  %0 = load ptr, ptr %ptr.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load ptr, ptr %file_name.addr, align 8
  %5 = load i32, ptr %line.addr, align 4
  %6 = load i32, ptr %column.addr, align 4
  %7 = load ptr, ptr %ptr_name.addr, align 8
  %call = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %1, ptr noundef @.str.13, ptr noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load i64, ptr @__RV_error_count, align 8
  %inc = add i64 %8, 1
  store i64 %inc, ptr @__RV_error_count, align 8
  %9 = load ptr, ptr %ptr.addr, align 8
  store ptr %9, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %10 = load ptr, ptr %ptr.addr, align 8
  %11 = load ptr, ptr %base.addr, align 8
  %cmp1 = icmp ult ptr %10, %11
  br i1 %cmp1, label %if.then6, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %12 = load ptr, ptr %ptr.addr, align 8
  %13 = load i64, ptr %size.addr, align 8
  %add.ptr = getelementptr inbounds i8, ptr %12, i64 %13
  %14 = load ptr, ptr %bound.addr, align 8
  %cmp2 = icmp ugt ptr %add.ptr, %14
  br i1 %cmp2, label %if.then6, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %15 = load ptr, ptr %ptr.addr, align 8
  %16 = load i64, ptr %size.addr, align 8
  %add.ptr4 = getelementptr inbounds i8, ptr %15, i64 %16
  %17 = load ptr, ptr %ptr.addr, align 8
  %cmp5 = icmp ult ptr %add.ptr4, %17
  br i1 %cmp5, label %if.then6, label %if.end9

if.then6:                                         ; preds = %lor.lhs.false3, %lor.lhs.false, %if.end
  %18 = load ptr, ptr @stderr, align 8
  %19 = load ptr, ptr %file_name.addr, align 8
  %20 = load ptr, ptr %func_name.addr, align 8
  %21 = load ptr, ptr %file_name.addr, align 8
  %22 = load i32, ptr %line.addr, align 4
  %23 = load i32, ptr %column.addr, align 4
  %24 = load ptr, ptr %ptr_name.addr, align 8
  %25 = load ptr, ptr %ptr.addr, align 8
  %26 = load i64, ptr %size.addr, align 8
  %27 = load ptr, ptr %base.addr, align 8
  %28 = load ptr, ptr %bound.addr, align 8
  %call7 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %18, ptr noundef @.str.17, ptr noundef %19, ptr noundef %20, ptr noundef %21, i32 noundef %22, i32 noundef %23, ptr noundef %24, ptr noundef %25, i64 noundef %26, ptr noundef %27, ptr noundef %28)
  %29 = load i64, ptr @__RV_error_count, align 8
  %inc8 = add i64 %29, 1
  store i64 %inc8, ptr @__RV_error_count, align 8
  %30 = load ptr, ptr %ptr.addr, align 8
  store ptr %30, ptr %retval, align 8
  br label %return

if.end9:                                          ; preds = %lor.lhs.false3
  %31 = load ptr, ptr %ptr.addr, align 8
  store ptr %31, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end9, %if.then6, %if.then
  %32 = load ptr, ptr %retval, align 8
  ret ptr %32
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__RV_check_dpc_ss(ptr noundef %base, ptr noundef %bound, ptr noundef %ptr, i64 noundef %subscript, i64 noundef %size, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %line, i32 noundef %column, ptr noundef %ptr_name) #0 {
entry:
  %base.addr = alloca ptr, align 8
  %bound.addr = alloca ptr, align 8
  %ptr.addr = alloca ptr, align 8
  %subscript.addr = alloca i64, align 8
  %size.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %line.addr = alloca i32, align 4
  %column.addr = alloca i32, align 4
  %ptr_name.addr = alloca ptr, align 8
  store ptr %base, ptr %base.addr, align 8
  store ptr %bound, ptr %bound.addr, align 8
  store ptr %ptr, ptr %ptr.addr, align 8
  store i64 %subscript, ptr %subscript.addr, align 8
  store i64 %size, ptr %size.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %line, ptr %line.addr, align 4
  store i32 %column, ptr %column.addr, align 4
  store ptr %ptr_name, ptr %ptr_name.addr, align 8
  %0 = load ptr, ptr %base.addr, align 8
  %1 = load ptr, ptr %bound.addr, align 8
  %2 = load ptr, ptr %ptr.addr, align 8
  %3 = load i64, ptr %subscript.addr, align 8
  %4 = load i64, ptr %size.addr, align 8
  %mul = mul i64 %3, %4
  %add.ptr = getelementptr inbounds i8, ptr %2, i64 %mul
  %5 = load i64, ptr %size.addr, align 8
  %6 = load ptr, ptr %file_name.addr, align 8
  %7 = load ptr, ptr %func_name.addr, align 8
  %8 = load i32, ptr %line.addr, align 4
  %9 = load i32, ptr %column.addr, align 4
  %10 = load ptr, ptr %ptr_name.addr, align 8
  %call = call ptr @__RV_check_dpc(ptr noundef %0, ptr noundef %1, ptr noundef %add.ptr, i64 noundef %5, ptr noundef %6, ptr noundef %7, i32 noundef %8, i32 noundef %9, ptr noundef %10)
  %11 = load i64, ptr %subscript.addr, align 8
  ret i64 %11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__RV_check_dpfc(ptr noundef %base, ptr noundef %bound, ptr noundef %ptr, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %line, i32 noundef %column, ptr noundef %ptr_name) #0 {
entry:
  %retval = alloca ptr, align 8
  %base.addr = alloca ptr, align 8
  %bound.addr = alloca ptr, align 8
  %ptr.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %line.addr = alloca i32, align 4
  %column.addr = alloca i32, align 4
  %ptr_name.addr = alloca ptr, align 8
  store ptr %base, ptr %base.addr, align 8
  store ptr %bound, ptr %bound.addr, align 8
  store ptr %ptr, ptr %ptr.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %line, ptr %line.addr, align 4
  store i32 %column, ptr %column.addr, align 4
  store ptr %ptr_name, ptr %ptr_name.addr, align 8
  %0 = load ptr, ptr %ptr.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load ptr, ptr %file_name.addr, align 8
  %5 = load i32, ptr %line.addr, align 4
  %6 = load i32, ptr %column.addr, align 4
  %7 = load ptr, ptr %ptr_name.addr, align 8
  %call = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %1, ptr noundef @.str.13, ptr noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load i64, ptr @__RV_error_count, align 8
  %inc = add i64 %8, 1
  store i64 %inc, ptr @__RV_error_count, align 8
  %9 = load ptr, ptr %ptr.addr, align 8
  store ptr %9, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %10 = load ptr, ptr %ptr.addr, align 8
  %11 = load ptr, ptr %base.addr, align 8
  %cmp1 = icmp ne ptr %10, %11
  br i1 %cmp1, label %if.then2, label %if.end5

if.then2:                                         ; preds = %if.end
  %12 = load ptr, ptr @stderr, align 8
  %13 = load ptr, ptr %file_name.addr, align 8
  %14 = load ptr, ptr %func_name.addr, align 8
  %15 = load ptr, ptr %file_name.addr, align 8
  %16 = load i32, ptr %line.addr, align 4
  %17 = load i32, ptr %column.addr, align 4
  %18 = load ptr, ptr %ptr_name.addr, align 8
  %19 = load ptr, ptr %ptr.addr, align 8
  %20 = load ptr, ptr %base.addr, align 8
  %call3 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %12, ptr noundef @.str.21, ptr noundef %13, ptr noundef %14, ptr noundef %15, i32 noundef %16, i32 noundef %17, ptr noundef %18, ptr noundef %19, ptr noundef %20)
  %21 = load i64, ptr @__RV_error_count, align 8
  %inc4 = add i64 %21, 1
  store i64 %inc4, ptr @__RV_error_count, align 8
  %22 = load ptr, ptr %ptr.addr, align 8
  store ptr %22, ptr %retval, align 8
  br label %return

if.end5:                                          ; preds = %if.end
  %23 = load ptr, ptr %ptr.addr, align 8
  store ptr %23, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end5, %if.then2, %if.then
  %24 = load ptr, ptr %retval, align 8
  ret ptr %24
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_getopt(ptr noundef %argv_pmd, ptr noundef %options_pmd, i32 noundef %argc, ptr noundef %argv, ptr noundef %options, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %a_line, i32 noundef %a_col, ptr noundef %a_name, i32 noundef %o_line, i32 noundef %o_col, ptr noundef %o_name) #0 {
entry:
  %argv_pmd.addr = alloca ptr, align 8
  %options_pmd.addr = alloca ptr, align 8
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca ptr, align 8
  %options.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %a_line.addr = alloca i32, align 4
  %a_col.addr = alloca i32, align 4
  %a_name.addr = alloca ptr, align 8
  %o_line.addr = alloca i32, align 4
  %o_col.addr = alloca i32, align 4
  %o_name.addr = alloca ptr, align 8
  %ret = alloca i32, align 4
  %i = alloca i32, align 4
  %pmd = alloca ptr, align 8
  store ptr %argv_pmd, ptr %argv_pmd.addr, align 8
  store ptr %options_pmd, ptr %options_pmd.addr, align 8
  store i32 %argc, ptr %argc.addr, align 4
  store ptr %argv, ptr %argv.addr, align 8
  store ptr %options, ptr %options.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %a_line, ptr %a_line.addr, align 4
  store i32 %a_col, ptr %a_col.addr, align 4
  store ptr %a_name, ptr %a_name.addr, align 8
  store i32 %o_line, ptr %o_line.addr, align 4
  store i32 %o_col, ptr %o_col.addr, align 4
  store ptr %o_name, ptr %o_name.addr, align 8
  %0 = load ptr, ptr %options_pmd.addr, align 8
  %1 = load ptr, ptr %options.addr, align 8
  %2 = load ptr, ptr %options.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %o_line.addr, align 4
  %6 = load i32, ptr %o_col.addr, align 4
  %7 = load ptr, ptr %o_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load i32, ptr %argc.addr, align 4
  %9 = load ptr, ptr %argv.addr, align 8
  %10 = load ptr, ptr %options.addr, align 8
  %call2 = call i32 @getopt(i32 noundef %8, ptr noundef %9, ptr noundef %10) #13
  store i32 %call2, ptr %ret, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %11 = load i32, ptr %i, align 4
  %12 = load i32, ptr %argc.addr, align 4
  %cmp = icmp slt i32 %11, %12
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %13 = load ptr, ptr %argv.addr, align 8
  %14 = load i32, ptr %i, align 4
  %idxprom = sext i32 %14 to i64
  %arrayidx = getelementptr inbounds ptr, ptr %13, i64 %idxprom
  %call4 = call ptr @__RV_pmd_tbl_lookup(ptr noundef %arrayidx)
  store ptr %call4, ptr %pmd, align 8
  %15 = load ptr, ptr %pmd, align 8
  %16 = load ptr, ptr %argv.addr, align 8
  %17 = load i32, ptr %i, align 4
  %idxprom5 = sext i32 %17 to i64
  %arrayidx6 = getelementptr inbounds ptr, ptr %16, i64 %idxprom5
  %18 = load ptr, ptr %arrayidx6, align 8
  call void @__RV_pmd_set_base(ptr noundef %15, ptr noundef %18)
  %19 = load ptr, ptr %pmd, align 8
  %20 = load ptr, ptr %argv.addr, align 8
  %21 = load i32, ptr %i, align 4
  %idxprom7 = sext i32 %21 to i64
  %arrayidx8 = getelementptr inbounds ptr, ptr %20, i64 %idxprom7
  %22 = load ptr, ptr %arrayidx8, align 8
  %23 = load ptr, ptr %argv.addr, align 8
  %24 = load i32, ptr %i, align 4
  %idxprom9 = sext i32 %24 to i64
  %arrayidx10 = getelementptr inbounds ptr, ptr %23, i64 %idxprom9
  %25 = load ptr, ptr %arrayidx10, align 8
  %call11 = call i32 @__RV_sstrlen(ptr noundef %25)
  %idx.ext = sext i32 %call11 to i64
  %add.ptr = getelementptr inbounds i8, ptr %22, i64 %idx.ext
  %add.ptr12 = getelementptr inbounds i8, ptr %add.ptr, i64 1
  call void @__RV_pmd_set_bound(ptr noundef %19, ptr noundef %add.ptr12)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %26 = load i32, ptr %i, align 4
  %inc = add nsw i32 %26, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !30

for.end:                                          ; preds = %for.cond
  %27 = load ptr, ptr @optarg, align 8
  %cmp13 = icmp eq ptr %27, null
  br i1 %cmp13, label %if.then, label %if.else

if.then:                                          ; preds = %for.end
  call void @__RV_pmd_tbl_remove(ptr noundef @optarg)
  br label %if.end35

if.else:                                          ; preds = %for.end
  store i32 0, ptr %i, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc32, %if.else
  %28 = load i32, ptr %i, align 4
  %29 = load i32, ptr %argc.addr, align 4
  %cmp16 = icmp slt i32 %28, %29
  br i1 %cmp16, label %for.body18, label %for.end34

for.body18:                                       ; preds = %for.cond15
  %30 = load ptr, ptr %argv.addr, align 8
  %31 = load i32, ptr %i, align 4
  %idxprom19 = sext i32 %31 to i64
  %arrayidx20 = getelementptr inbounds ptr, ptr %30, i64 %idxprom19
  %call21 = call ptr @__RV_pmd_tbl_lookup(ptr noundef %arrayidx20)
  store ptr %call21, ptr %pmd, align 8
  %32 = load ptr, ptr %pmd, align 8
  %call22 = call ptr @__RV_pmd_get_base(ptr noundef %32)
  %33 = load ptr, ptr @optarg, align 8
  %cmp23 = icmp ule ptr %call22, %33
  br i1 %cmp23, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body18
  %34 = load ptr, ptr @optarg, align 8
  %35 = load ptr, ptr %pmd, align 8
  %call25 = call ptr @__RV_pmd_get_bound(ptr noundef %35)
  %cmp26 = icmp ult ptr %34, %call25
  br i1 %cmp26, label %if.then28, label %if.end

if.then28:                                        ; preds = %land.lhs.true
  %36 = load ptr, ptr %argv.addr, align 8
  %37 = load i32, ptr %i, align 4
  %idxprom29 = sext i32 %37 to i64
  %arrayidx30 = getelementptr inbounds ptr, ptr %36, i64 %idxprom29
  %call31 = call ptr @__RV_pmd_tbl_update_ptr(ptr noundef @optarg, ptr noundef %arrayidx30)
  br label %if.end

if.end:                                           ; preds = %if.then28, %land.lhs.true, %for.body18
  br label %for.inc32

for.inc32:                                        ; preds = %if.end
  %38 = load i32, ptr %i, align 4
  %inc33 = add nsw i32 %38, 1
  store i32 %inc33, ptr %i, align 4
  br label %for.cond15, !llvm.loop !31

for.end34:                                        ; preds = %for.cond15
  br label %if.end35

if.end35:                                         ; preds = %for.end34, %if.then
  %39 = load ptr, ptr %argv_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %39)
  %40 = load ptr, ptr %options_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %40)
  %41 = load i32, ptr %ret, align 4
  ret i32 %41
}

; Function Attrs: nounwind
declare i32 @getopt(i32 noundef, ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @_RV_frexp(ptr noundef %exponent_pmd, double noundef %x, ptr noundef %exponent, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %e_line, i32 noundef %e_col, ptr noundef %e_name) #0 {
entry:
  %exponent_pmd.addr = alloca ptr, align 8
  %x.addr = alloca double, align 8
  %exponent.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %e_line.addr = alloca i32, align 4
  %e_col.addr = alloca i32, align 4
  %e_name.addr = alloca ptr, align 8
  store ptr %exponent_pmd, ptr %exponent_pmd.addr, align 8
  store double %x, ptr %x.addr, align 8
  store ptr %exponent, ptr %exponent.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %e_line, ptr %e_line.addr, align 4
  store i32 %e_col, ptr %e_col.addr, align 4
  store ptr %e_name, ptr %e_name.addr, align 8
  %0 = load ptr, ptr %exponent_pmd.addr, align 8
  %1 = load ptr, ptr %exponent.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %e_line.addr, align 4
  %5 = load i32, ptr %e_col.addr, align 4
  %6 = load ptr, ptr %e_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 4, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %exponent_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %7)
  %8 = load double, ptr %x.addr, align 8
  %9 = load ptr, ptr %exponent.addr, align 8
  %call1 = call double @frexp(double noundef %8, ptr noundef %9) #13
  ret double %call1
}

; Function Attrs: nounwind
declare double @frexp(double noundef, ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @_RV_modf(ptr noundef %integer_pmd, double noundef %x, ptr noundef %integer, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %i_line, i32 noundef %i_col, ptr noundef %i_name) #0 {
entry:
  %integer_pmd.addr = alloca ptr, align 8
  %x.addr = alloca double, align 8
  %integer.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %i_line.addr = alloca i32, align 4
  %i_col.addr = alloca i32, align 4
  %i_name.addr = alloca ptr, align 8
  store ptr %integer_pmd, ptr %integer_pmd.addr, align 8
  store double %x, ptr %x.addr, align 8
  store ptr %integer, ptr %integer.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %i_line, ptr %i_line.addr, align 4
  store i32 %i_col, ptr %i_col.addr, align 4
  store ptr %i_name, ptr %i_name.addr, align 8
  %0 = load ptr, ptr %integer_pmd.addr, align 8
  %1 = load ptr, ptr %integer.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %i_line.addr, align 4
  %5 = load i32, ptr %i_col.addr, align 4
  %6 = load ptr, ptr %i_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 8, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %integer_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %7)
  %8 = load double, ptr %x.addr, align 8
  %9 = load ptr, ptr %integer.addr, align 8
  %call1 = call double @modf(double noundef %8, ptr noundef %9) #13
  ret double %call1
}

; Function Attrs: nounwind
declare double @modf(double noundef, ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV__IO_getc(ptr noundef %fp_pmd, ptr noundef %fp, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name) #0 {
entry:
  %fp_pmd.addr = alloca ptr, align 8
  %fp.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store ptr %fp, ptr %fp.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  %0 = load ptr, ptr %fp_pmd.addr, align 8
  %1 = load ptr, ptr %fp.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %f_line.addr, align 4
  %5 = load i32, ptr %f_col.addr, align 4
  %6 = load ptr, ptr %f_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 216, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %7)
  %8 = load ptr, ptr %fp.addr, align 8
  %call1 = call i32 @getc(ptr noundef %8)
  ret i32 %call1
}

declare i32 @getc(ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV__IO_putc(ptr noundef %fp_pmd, i32 noundef %ch, ptr noundef %fp, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name) #0 {
entry:
  %fp_pmd.addr = alloca ptr, align 8
  %ch.addr = alloca i32, align 4
  %fp.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store i32 %ch, ptr %ch.addr, align 4
  store ptr %fp, ptr %fp.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  %0 = load ptr, ptr %fp_pmd.addr, align 8
  %1 = load ptr, ptr %fp.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %f_line.addr, align 4
  %5 = load i32, ptr %f_col.addr, align 4
  %6 = load ptr, ptr %f_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 216, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %7)
  %8 = load i32, ptr %ch.addr, align 4
  %9 = load ptr, ptr %fp.addr, align 8
  %call1 = call i32 @putc(i32 noundef %8, ptr noundef %9)
  ret i32 %call1
}

declare i32 @putc(i32 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_RV_clearerr(ptr noundef %fp_pmd, ptr noundef %fp, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name) #0 {
entry:
  %fp_pmd.addr = alloca ptr, align 8
  %fp.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store ptr %fp, ptr %fp.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  %0 = load ptr, ptr %fp_pmd.addr, align 8
  %1 = load ptr, ptr %fp.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %f_line.addr, align 4
  %5 = load i32, ptr %f_col.addr, align 4
  %6 = load ptr, ptr %f_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 216, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %7)
  %8 = load ptr, ptr %fp.addr, align 8
  call void @clearerr(ptr noundef %8) #13
  ret void
}

; Function Attrs: nounwind
declare void @clearerr(ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_fclose(ptr noundef %fp_pmd, ptr noundef %fp, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name) #0 {
entry:
  %fp_pmd.addr = alloca ptr, align 8
  %fp.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store ptr %fp, ptr %fp.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  %0 = load ptr, ptr %fp_pmd.addr, align 8
  %1 = load ptr, ptr %fp.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %f_line.addr, align 4
  %5 = load i32, ptr %f_col.addr, align 4
  %6 = load ptr, ptr %f_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 216, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_set_stat(ptr noundef %7, i32 noundef 0)
  %8 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %8)
  %9 = load ptr, ptr %fp.addr, align 8
  %call1 = call i32 @fclose(ptr noundef %9)
  ret i32 %call1
}

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_fdopen(ptr noundef %ret_pmd, ptr noundef %mode_pmd, i32 noundef %fd, ptr noundef %mode, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %m_line, i32 noundef %m_col, ptr noundef %m_name) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %mode_pmd.addr = alloca ptr, align 8
  %fd.addr = alloca i32, align 4
  %mode.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %m_line.addr = alloca i32, align 4
  %m_col.addr = alloca i32, align 4
  %m_name.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store ptr %mode_pmd, ptr %mode_pmd.addr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  store ptr %mode, ptr %mode.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %m_line, ptr %m_line.addr, align 4
  store i32 %m_col, ptr %m_col.addr, align 4
  store ptr %m_name, ptr %m_name.addr, align 8
  %0 = load ptr, ptr %mode_pmd.addr, align 8
  %1 = load ptr, ptr %mode.addr, align 8
  %2 = load ptr, ptr %mode.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %m_line.addr, align 4
  %6 = load i32, ptr %m_col.addr, align 4
  %7 = load ptr, ptr %m_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load i32, ptr %fd.addr, align 4
  %9 = load ptr, ptr %mode.addr, align 8
  %call2 = call noalias ptr @fdopen(i32 noundef %8, ptr noundef %9) #13
  store ptr %call2, ptr %ret, align 8
  %10 = load ptr, ptr %ret, align 8
  %cmp = icmp eq ptr %10, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %11 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %11)
  br label %if.end

if.else:                                          ; preds = %entry
  %12 = load ptr, ptr %ret_pmd.addr, align 8
  %13 = load ptr, ptr %ret, align 8
  %14 = load ptr, ptr %ret, align 8
  %add.ptr = getelementptr inbounds %struct._IO_FILE, ptr %14, i64 1
  %call4 = call ptr @__RV_pmd_set(ptr noundef %12, ptr noundef null, i32 noundef 4, ptr noundef %13, ptr noundef %add.ptr)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %15 = load ptr, ptr %mode_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %15)
  %16 = load ptr, ptr %ret, align 8
  ret ptr %16
}

; Function Attrs: nounwind
declare noalias ptr @fdopen(i32 noundef, ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_feof(ptr noundef %fp_pmd, ptr noundef %fp, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name) #0 {
entry:
  %fp_pmd.addr = alloca ptr, align 8
  %fp.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store ptr %fp, ptr %fp.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  %0 = load ptr, ptr %fp_pmd.addr, align 8
  %1 = load ptr, ptr %fp.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %f_line.addr, align 4
  %5 = load i32, ptr %f_col.addr, align 4
  %6 = load ptr, ptr %f_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 216, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %7)
  %8 = load ptr, ptr %fp.addr, align 8
  %call1 = call i32 @feof(ptr noundef %8) #13
  ret i32 %call1
}

; Function Attrs: nounwind
declare i32 @feof(ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_ferror(ptr noundef %fp_pmd, ptr noundef %fp, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name) #0 {
entry:
  %fp_pmd.addr = alloca ptr, align 8
  %fp.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store ptr %fp, ptr %fp.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  %0 = load ptr, ptr %fp_pmd.addr, align 8
  %1 = load ptr, ptr %fp.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %f_line.addr, align 4
  %5 = load i32, ptr %f_col.addr, align 4
  %6 = load ptr, ptr %f_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 216, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %7)
  %8 = load ptr, ptr %fp.addr, align 8
  %call1 = call i32 @ferror(ptr noundef %8) #13
  ret i32 %call1
}

; Function Attrs: nounwind
declare i32 @ferror(ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_fflush(ptr noundef %fp_pmd, ptr noundef %fp, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name) #0 {
entry:
  %fp_pmd.addr = alloca ptr, align 8
  %fp.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store ptr %fp, ptr %fp.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  %0 = load ptr, ptr %fp_pmd.addr, align 8
  %1 = load ptr, ptr %fp.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %f_line.addr, align 4
  %5 = load i32, ptr %f_col.addr, align 4
  %6 = load ptr, ptr %f_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 216, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %7)
  %8 = load ptr, ptr %fp.addr, align 8
  %call1 = call i32 @fflush(ptr noundef %8)
  ret i32 %call1
}

declare i32 @fflush(ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_fgetc(ptr noundef %fp_pmd, ptr noundef %fp, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name) #0 {
entry:
  %fp_pmd.addr = alloca ptr, align 8
  %fp.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store ptr %fp, ptr %fp.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  %0 = load ptr, ptr %fp_pmd.addr, align 8
  %1 = load ptr, ptr %fp.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %f_line.addr, align 4
  %5 = load i32, ptr %f_col.addr, align 4
  %6 = load ptr, ptr %f_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 216, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %7)
  %8 = load ptr, ptr %fp.addr, align 8
  %call1 = call i32 @fgetc(ptr noundef %8)
  ret i32 %call1
}

declare i32 @fgetc(ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_fgetpos(ptr noundef %fp_pmd, ptr noundef %pos_pmd, ptr noundef %fp, ptr noundef %pos, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name, i32 noundef %p_line, i32 noundef %p_col, ptr noundef %p_name) #0 {
entry:
  %fp_pmd.addr = alloca ptr, align 8
  %pos_pmd.addr = alloca ptr, align 8
  %fp.addr = alloca ptr, align 8
  %pos.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  %p_line.addr = alloca i32, align 4
  %p_col.addr = alloca i32, align 4
  %p_name.addr = alloca ptr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store ptr %pos_pmd, ptr %pos_pmd.addr, align 8
  store ptr %fp, ptr %fp.addr, align 8
  store ptr %pos, ptr %pos.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  store i32 %p_line, ptr %p_line.addr, align 4
  store i32 %p_col, ptr %p_col.addr, align 4
  store ptr %p_name, ptr %p_name.addr, align 8
  %0 = load ptr, ptr %fp_pmd.addr, align 8
  %1 = load ptr, ptr %fp.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %f_line.addr, align 4
  %5 = load i32, ptr %f_col.addr, align 4
  %6 = load ptr, ptr %f_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 216, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %pos_pmd.addr, align 8
  %8 = load ptr, ptr %pos.addr, align 8
  %9 = load ptr, ptr %file_name.addr, align 8
  %10 = load ptr, ptr %func_name.addr, align 8
  %11 = load i32, ptr %p_line.addr, align 4
  %12 = load i32, ptr %p_col.addr, align 4
  %13 = load ptr, ptr %p_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %7, ptr noundef %8, i64 noundef 16, ptr noundef %9, ptr noundef %10, i32 noundef %11, i32 noundef %12, ptr noundef %13)
  %14 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %14)
  %15 = load ptr, ptr %pos_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %15)
  %16 = load ptr, ptr %fp.addr, align 8
  %17 = load ptr, ptr %pos.addr, align 8
  %call2 = call i32 @fgetpos(ptr noundef %16, ptr noundef %17)
  ret i32 %call2
}

declare i32 @fgetpos(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_fgets(ptr noundef %ret_pmd, ptr noundef %str_pmd, ptr noundef %fp_pmd, ptr noundef %str, i32 noundef %n, ptr noundef %fp, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %str_pmd.addr = alloca ptr, align 8
  %fp_pmd.addr = alloca ptr, align 8
  %str.addr = alloca ptr, align 8
  %n.addr = alloca i32, align 4
  %fp.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store ptr %str_pmd, ptr %str_pmd.addr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store ptr %str, ptr %str.addr, align 8
  store i32 %n, ptr %n.addr, align 4
  store ptr %fp, ptr %fp.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  %0 = load ptr, ptr %fp_pmd.addr, align 8
  %1 = load ptr, ptr %fp.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %f_line.addr, align 4
  %5 = load i32, ptr %f_col.addr, align 4
  %6 = load ptr, ptr %f_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 216, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %str.addr, align 8
  %8 = load i32, ptr %n.addr, align 4
  %9 = load ptr, ptr %fp.addr, align 8
  %call1 = call ptr @fgets(ptr noundef %7, i32 noundef %8, ptr noundef %9)
  store ptr %call1, ptr %ret, align 8
  %10 = load ptr, ptr %str_pmd.addr, align 8
  %11 = load ptr, ptr %str.addr, align 8
  %12 = load ptr, ptr %str.addr, align 8
  %call2 = call i32 @__RV_sstrlen(ptr noundef %12)
  %add = add nsw i32 %call2, 1
  %conv = sext i32 %add to i64
  %13 = load ptr, ptr %file_name.addr, align 8
  %14 = load ptr, ptr %func_name.addr, align 8
  %15 = load i32, ptr %s_line.addr, align 4
  %16 = load i32, ptr %s_col.addr, align 4
  %17 = load ptr, ptr %s_name.addr, align 8
  %call3 = call ptr @__RV_check_dpv(ptr noundef %10, ptr noundef %11, i64 noundef %conv, ptr noundef %13, ptr noundef %14, i32 noundef %15, i32 noundef %16, ptr noundef %17)
  %18 = load ptr, ptr %ret, align 8
  %cmp = icmp eq ptr %18, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %19 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %19)
  br label %if.end

if.else:                                          ; preds = %entry
  %20 = load ptr, ptr %ret_pmd.addr, align 8
  %21 = load ptr, ptr %str_pmd.addr, align 8
  %call5 = call ptr @__RV_pmd_cp_pmd(ptr noundef %20, ptr noundef %21)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %22 = load ptr, ptr %str_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %22)
  %23 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %23)
  %24 = load ptr, ptr %ret, align 8
  ret ptr %24
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_fileno(ptr noundef %fp_pmd, ptr noundef %fp, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name) #0 {
entry:
  %fp_pmd.addr = alloca ptr, align 8
  %fp.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store ptr %fp, ptr %fp.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  %0 = load ptr, ptr %fp_pmd.addr, align 8
  %1 = load ptr, ptr %fp.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %f_line.addr, align 4
  %5 = load i32, ptr %f_col.addr, align 4
  %6 = load ptr, ptr %f_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 216, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %7)
  %8 = load ptr, ptr %fp.addr, align 8
  %call1 = call i32 @fileno(ptr noundef %8) #13
  ret i32 %call1
}

; Function Attrs: nounwind
declare i32 @fileno(ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_fopen(ptr noundef %ret_pmd, ptr noundef %filename_pmd, ptr noundef %mode_pmd, ptr noundef %filename, ptr noundef %mode, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name, i32 noundef %m_line, i32 noundef %m_col, ptr noundef %m_name) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %filename_pmd.addr = alloca ptr, align 8
  %mode_pmd.addr = alloca ptr, align 8
  %filename.addr = alloca ptr, align 8
  %mode.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  %m_line.addr = alloca i32, align 4
  %m_col.addr = alloca i32, align 4
  %m_name.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store ptr %filename_pmd, ptr %filename_pmd.addr, align 8
  store ptr %mode_pmd, ptr %mode_pmd.addr, align 8
  store ptr %filename, ptr %filename.addr, align 8
  store ptr %mode, ptr %mode.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  store i32 %m_line, ptr %m_line.addr, align 4
  store i32 %m_col, ptr %m_col.addr, align 4
  store ptr %m_name, ptr %m_name.addr, align 8
  %0 = load ptr, ptr %filename_pmd.addr, align 8
  %1 = load ptr, ptr %filename.addr, align 8
  %2 = load ptr, ptr %filename.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %f_line.addr, align 4
  %6 = load i32, ptr %f_col.addr, align 4
  %7 = load ptr, ptr %f_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %mode_pmd.addr, align 8
  %9 = load ptr, ptr %mode.addr, align 8
  %10 = load ptr, ptr %mode.addr, align 8
  %call2 = call i32 @__RV_sstrlen(ptr noundef %10)
  %add3 = add nsw i32 %call2, 1
  %conv4 = sext i32 %add3 to i64
  %11 = load ptr, ptr %file_name.addr, align 8
  %12 = load ptr, ptr %func_name.addr, align 8
  %13 = load i32, ptr %m_line.addr, align 4
  %14 = load i32, ptr %m_col.addr, align 4
  %15 = load ptr, ptr %m_name.addr, align 8
  %call5 = call ptr @__RV_check_dpv(ptr noundef %8, ptr noundef %9, i64 noundef %conv4, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, ptr noundef %15)
  %16 = load ptr, ptr %filename.addr, align 8
  %17 = load ptr, ptr %mode.addr, align 8
  %call6 = call noalias ptr @fopen(ptr noundef %16, ptr noundef %17)
  store ptr %call6, ptr %ret, align 8
  %18 = load ptr, ptr %ret, align 8
  %cmp = icmp eq ptr %18, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %19 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %19)
  br label %if.end

if.else:                                          ; preds = %entry
  %20 = load ptr, ptr %ret_pmd.addr, align 8
  %21 = load ptr, ptr %ret, align 8
  %22 = load ptr, ptr %ret, align 8
  %add.ptr = getelementptr inbounds %struct._IO_FILE, ptr %22, i64 1
  %call8 = call ptr @__RV_pmd_set(ptr noundef %20, ptr noundef null, i32 noundef 4, ptr noundef %21, ptr noundef %add.ptr)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %23 = load ptr, ptr %filename_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %23)
  %24 = load ptr, ptr %mode_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %24)
  %25 = load ptr, ptr %ret, align 8
  ret ptr %25
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_fputc(ptr noundef %fp_pmd, i32 noundef %ch, ptr noundef %fp, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name) #0 {
entry:
  %fp_pmd.addr = alloca ptr, align 8
  %ch.addr = alloca i32, align 4
  %fp.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store i32 %ch, ptr %ch.addr, align 4
  store ptr %fp, ptr %fp.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  %0 = load ptr, ptr %fp_pmd.addr, align 8
  %1 = load ptr, ptr %fp.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %f_line.addr, align 4
  %5 = load i32, ptr %f_col.addr, align 4
  %6 = load ptr, ptr %f_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 216, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %7)
  %8 = load i32, ptr %ch.addr, align 4
  %9 = load ptr, ptr %fp.addr, align 8
  %call1 = call i32 @fputc(i32 noundef %8, ptr noundef %9)
  ret i32 %call1
}

declare i32 @fputc(i32 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_fputs(ptr noundef %str_pmd, ptr noundef %fp_pmd, ptr noundef %str, ptr noundef %fp, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name) #0 {
entry:
  %str_pmd.addr = alloca ptr, align 8
  %fp_pmd.addr = alloca ptr, align 8
  %str.addr = alloca ptr, align 8
  %fp.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  store ptr %str_pmd, ptr %str_pmd.addr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store ptr %str, ptr %str.addr, align 8
  store ptr %fp, ptr %fp.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  %0 = load ptr, ptr %str_pmd.addr, align 8
  %1 = load ptr, ptr %str.addr, align 8
  %2 = load ptr, ptr %str.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %fp_pmd.addr, align 8
  %9 = load ptr, ptr %fp.addr, align 8
  %10 = load ptr, ptr %file_name.addr, align 8
  %11 = load ptr, ptr %func_name.addr, align 8
  %12 = load i32, ptr %f_line.addr, align 4
  %13 = load i32, ptr %f_col.addr, align 4
  %14 = load ptr, ptr %f_name.addr, align 8
  %call2 = call ptr @__RV_check_dpv(ptr noundef %8, ptr noundef %9, i64 noundef 216, ptr noundef %10, ptr noundef %11, i32 noundef %12, i32 noundef %13, ptr noundef %14)
  %15 = load ptr, ptr %str_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %15)
  %16 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %16)
  %17 = load ptr, ptr %str.addr, align 8
  %18 = load ptr, ptr %fp.addr, align 8
  %call3 = call i32 @fputs(ptr noundef %17, ptr noundef %18)
  ret i32 %call3
}

declare i32 @fputs(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @_RV_fread(ptr noundef %ptr_pmd, ptr noundef %fp_pmd, ptr noundef %ptr, i64 noundef %size, i64 noundef %nmemb, ptr noundef %fp, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %p_line, i32 noundef %p_col, ptr noundef %p_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name) #0 {
entry:
  %ptr_pmd.addr = alloca ptr, align 8
  %fp_pmd.addr = alloca ptr, align 8
  %ptr.addr = alloca ptr, align 8
  %size.addr = alloca i64, align 8
  %nmemb.addr = alloca i64, align 8
  %fp.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %p_line.addr = alloca i32, align 4
  %p_col.addr = alloca i32, align 4
  %p_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  store ptr %ptr_pmd, ptr %ptr_pmd.addr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store ptr %ptr, ptr %ptr.addr, align 8
  store i64 %size, ptr %size.addr, align 8
  store i64 %nmemb, ptr %nmemb.addr, align 8
  store ptr %fp, ptr %fp.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %p_line, ptr %p_line.addr, align 4
  store i32 %p_col, ptr %p_col.addr, align 4
  store ptr %p_name, ptr %p_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  %0 = load ptr, ptr %ptr_pmd.addr, align 8
  %1 = load ptr, ptr %ptr.addr, align 8
  %2 = load i64, ptr %size.addr, align 8
  %3 = load i64, ptr %nmemb.addr, align 8
  %mul = mul i64 %2, %3
  %4 = load ptr, ptr %file_name.addr, align 8
  %5 = load ptr, ptr %func_name.addr, align 8
  %6 = load i32, ptr %p_line.addr, align 4
  %7 = load i32, ptr %p_col.addr, align 4
  %8 = load ptr, ptr %p_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %mul, ptr noundef %4, ptr noundef %5, i32 noundef %6, i32 noundef %7, ptr noundef %8)
  %9 = load ptr, ptr %fp_pmd.addr, align 8
  %10 = load ptr, ptr %fp.addr, align 8
  %11 = load ptr, ptr %file_name.addr, align 8
  %12 = load ptr, ptr %func_name.addr, align 8
  %13 = load i32, ptr %f_line.addr, align 4
  %14 = load i32, ptr %f_col.addr, align 4
  %15 = load ptr, ptr %f_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %9, ptr noundef %10, i64 noundef 216, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, ptr noundef %15)
  %16 = load ptr, ptr %ptr_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %16)
  %17 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %17)
  %18 = load ptr, ptr %ptr.addr, align 8
  %19 = load i64, ptr %size.addr, align 8
  %20 = load i64, ptr %nmemb.addr, align 8
  %21 = load ptr, ptr %fp.addr, align 8
  %call2 = call i64 @fread(ptr noundef %18, i64 noundef %19, i64 noundef %20, ptr noundef %21)
  ret i64 %call2
}

declare i64 @fread(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_freopen(ptr noundef %ret_pmd, ptr noundef %filename_pmd, ptr noundef %mode_pmd, ptr noundef %fp_pmd, ptr noundef %filename, ptr noundef %mode, ptr noundef %fp, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name, i32 noundef %m_line, i32 noundef %m_col, ptr noundef %m_name, i32 noundef %p_line, i32 noundef %p_col, ptr noundef %p_name) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %filename_pmd.addr = alloca ptr, align 8
  %mode_pmd.addr = alloca ptr, align 8
  %fp_pmd.addr = alloca ptr, align 8
  %filename.addr = alloca ptr, align 8
  %mode.addr = alloca ptr, align 8
  %fp.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  %m_line.addr = alloca i32, align 4
  %m_col.addr = alloca i32, align 4
  %m_name.addr = alloca ptr, align 8
  %p_line.addr = alloca i32, align 4
  %p_col.addr = alloca i32, align 4
  %p_name.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store ptr %filename_pmd, ptr %filename_pmd.addr, align 8
  store ptr %mode_pmd, ptr %mode_pmd.addr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store ptr %filename, ptr %filename.addr, align 8
  store ptr %mode, ptr %mode.addr, align 8
  store ptr %fp, ptr %fp.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  store i32 %m_line, ptr %m_line.addr, align 4
  store i32 %m_col, ptr %m_col.addr, align 4
  store ptr %m_name, ptr %m_name.addr, align 8
  store i32 %p_line, ptr %p_line.addr, align 4
  store i32 %p_col, ptr %p_col.addr, align 4
  store ptr %p_name, ptr %p_name.addr, align 8
  %0 = load ptr, ptr %filename_pmd.addr, align 8
  %1 = load ptr, ptr %filename.addr, align 8
  %2 = load ptr, ptr %filename.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %f_line.addr, align 4
  %6 = load i32, ptr %f_col.addr, align 4
  %7 = load ptr, ptr %f_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %mode_pmd.addr, align 8
  %9 = load ptr, ptr %mode.addr, align 8
  %10 = load ptr, ptr %mode.addr, align 8
  %call2 = call i32 @__RV_sstrlen(ptr noundef %10)
  %add3 = add nsw i32 %call2, 1
  %conv4 = sext i32 %add3 to i64
  %11 = load ptr, ptr %file_name.addr, align 8
  %12 = load ptr, ptr %func_name.addr, align 8
  %13 = load i32, ptr %m_line.addr, align 4
  %14 = load i32, ptr %m_col.addr, align 4
  %15 = load ptr, ptr %m_name.addr, align 8
  %call5 = call ptr @__RV_check_dpv(ptr noundef %8, ptr noundef %9, i64 noundef %conv4, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, ptr noundef %15)
  %16 = load ptr, ptr %fp_pmd.addr, align 8
  %17 = load ptr, ptr %fp.addr, align 8
  %18 = load ptr, ptr %file_name.addr, align 8
  %19 = load ptr, ptr %func_name.addr, align 8
  %20 = load i32, ptr %p_line.addr, align 4
  %21 = load i32, ptr %p_col.addr, align 4
  %22 = load ptr, ptr %p_name.addr, align 8
  %call6 = call ptr @__RV_check_dpv(ptr noundef %16, ptr noundef %17, i64 noundef 216, ptr noundef %18, ptr noundef %19, i32 noundef %20, i32 noundef %21, ptr noundef %22)
  %23 = load ptr, ptr %filename.addr, align 8
  %24 = load ptr, ptr %mode.addr, align 8
  %25 = load ptr, ptr %fp.addr, align 8
  %call7 = call ptr @freopen(ptr noundef %23, ptr noundef %24, ptr noundef %25)
  store ptr %call7, ptr %ret, align 8
  %26 = load ptr, ptr %ret, align 8
  %cmp = icmp eq ptr %26, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %27 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %27)
  br label %if.end

if.else:                                          ; preds = %entry
  %28 = load ptr, ptr %ret_pmd.addr, align 8
  %29 = load ptr, ptr %ret, align 8
  %30 = load ptr, ptr %ret, align 8
  %add.ptr = getelementptr inbounds %struct._IO_FILE, ptr %30, i64 1
  %call9 = call ptr @__RV_pmd_set(ptr noundef %28, ptr noundef null, i32 noundef 4, ptr noundef %29, ptr noundef %add.ptr)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %31 = load ptr, ptr %filename_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %31)
  %32 = load ptr, ptr %mode_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %32)
  %33 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %33)
  %34 = load ptr, ptr %ret, align 8
  ret ptr %34
}

declare ptr @freopen(ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_fseek(ptr noundef %fp_pmd, ptr noundef %fp, i64 noundef %offset, i32 noundef %whence, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name) #0 {
entry:
  %fp_pmd.addr = alloca ptr, align 8
  %fp.addr = alloca ptr, align 8
  %offset.addr = alloca i64, align 8
  %whence.addr = alloca i32, align 4
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store ptr %fp, ptr %fp.addr, align 8
  store i64 %offset, ptr %offset.addr, align 8
  store i32 %whence, ptr %whence.addr, align 4
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  %0 = load ptr, ptr %fp_pmd.addr, align 8
  %1 = load ptr, ptr %fp.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %f_line.addr, align 4
  %5 = load i32, ptr %f_col.addr, align 4
  %6 = load ptr, ptr %f_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 216, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %7)
  %8 = load ptr, ptr %fp.addr, align 8
  %9 = load i64, ptr %offset.addr, align 8
  %10 = load i32, ptr %whence.addr, align 4
  %call1 = call i32 @fseek(ptr noundef %8, i64 noundef %9, i32 noundef %10)
  ret i32 %call1
}

declare i32 @fseek(ptr noundef, i64 noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_fsetpos(ptr noundef %fp_pmd, ptr noundef %pos_pmd, ptr noundef %fp, ptr noundef %pos, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name, i32 noundef %p_line, i32 noundef %p_col, ptr noundef %p_name) #0 {
entry:
  %fp_pmd.addr = alloca ptr, align 8
  %pos_pmd.addr = alloca ptr, align 8
  %fp.addr = alloca ptr, align 8
  %pos.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  %p_line.addr = alloca i32, align 4
  %p_col.addr = alloca i32, align 4
  %p_name.addr = alloca ptr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store ptr %pos_pmd, ptr %pos_pmd.addr, align 8
  store ptr %fp, ptr %fp.addr, align 8
  store ptr %pos, ptr %pos.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  store i32 %p_line, ptr %p_line.addr, align 4
  store i32 %p_col, ptr %p_col.addr, align 4
  store ptr %p_name, ptr %p_name.addr, align 8
  %0 = load ptr, ptr %fp_pmd.addr, align 8
  %1 = load ptr, ptr %fp.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %f_line.addr, align 4
  %5 = load i32, ptr %f_col.addr, align 4
  %6 = load ptr, ptr %f_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 216, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %pos_pmd.addr, align 8
  %8 = load ptr, ptr %pos.addr, align 8
  %9 = load ptr, ptr %file_name.addr, align 8
  %10 = load ptr, ptr %func_name.addr, align 8
  %11 = load i32, ptr %p_line.addr, align 4
  %12 = load i32, ptr %p_col.addr, align 4
  %13 = load ptr, ptr %p_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %7, ptr noundef %8, i64 noundef 16, ptr noundef %9, ptr noundef %10, i32 noundef %11, i32 noundef %12, ptr noundef %13)
  %14 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %14)
  %15 = load ptr, ptr %pos_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %15)
  %16 = load ptr, ptr %fp.addr, align 8
  %17 = load ptr, ptr %pos.addr, align 8
  %call2 = call i32 @fsetpos(ptr noundef %16, ptr noundef %17)
  ret i32 %call2
}

declare i32 @fsetpos(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @_RV_ftell(ptr noundef %fp_pmd, ptr noundef %fp, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name) #0 {
entry:
  %fp_pmd.addr = alloca ptr, align 8
  %fp.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store ptr %fp, ptr %fp.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  %0 = load ptr, ptr %fp_pmd.addr, align 8
  %1 = load ptr, ptr %fp.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %f_line.addr, align 4
  %5 = load i32, ptr %f_col.addr, align 4
  %6 = load ptr, ptr %f_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 216, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %7)
  %8 = load ptr, ptr %fp.addr, align 8
  %call1 = call i64 @ftell(ptr noundef %8)
  ret i64 %call1
}

declare i64 @ftell(ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @_RV_fwrite(ptr noundef %ptr_pmd, ptr noundef %fp_pmd, ptr noundef %ptr, i64 noundef %size, i64 noundef %nmemb, ptr noundef %fp, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %p_line, i32 noundef %p_col, ptr noundef %p_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name) #0 {
entry:
  %ptr_pmd.addr = alloca ptr, align 8
  %fp_pmd.addr = alloca ptr, align 8
  %ptr.addr = alloca ptr, align 8
  %size.addr = alloca i64, align 8
  %nmemb.addr = alloca i64, align 8
  %fp.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %p_line.addr = alloca i32, align 4
  %p_col.addr = alloca i32, align 4
  %p_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  store ptr %ptr_pmd, ptr %ptr_pmd.addr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store ptr %ptr, ptr %ptr.addr, align 8
  store i64 %size, ptr %size.addr, align 8
  store i64 %nmemb, ptr %nmemb.addr, align 8
  store ptr %fp, ptr %fp.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %p_line, ptr %p_line.addr, align 4
  store i32 %p_col, ptr %p_col.addr, align 4
  store ptr %p_name, ptr %p_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  %0 = load ptr, ptr %ptr_pmd.addr, align 8
  %1 = load ptr, ptr %ptr.addr, align 8
  %2 = load i64, ptr %size.addr, align 8
  %3 = load i64, ptr %nmemb.addr, align 8
  %mul = mul i64 %2, %3
  %4 = load ptr, ptr %file_name.addr, align 8
  %5 = load ptr, ptr %func_name.addr, align 8
  %6 = load i32, ptr %p_line.addr, align 4
  %7 = load i32, ptr %p_col.addr, align 4
  %8 = load ptr, ptr %p_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %mul, ptr noundef %4, ptr noundef %5, i32 noundef %6, i32 noundef %7, ptr noundef %8)
  %9 = load ptr, ptr %fp_pmd.addr, align 8
  %10 = load ptr, ptr %fp.addr, align 8
  %11 = load ptr, ptr %file_name.addr, align 8
  %12 = load ptr, ptr %func_name.addr, align 8
  %13 = load i32, ptr %f_line.addr, align 4
  %14 = load i32, ptr %f_col.addr, align 4
  %15 = load ptr, ptr %f_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %9, ptr noundef %10, i64 noundef 216, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, ptr noundef %15)
  %16 = load ptr, ptr %ptr_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %16)
  %17 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %17)
  %18 = load ptr, ptr %ptr.addr, align 8
  %19 = load i64, ptr %size.addr, align 8
  %20 = load i64, ptr %nmemb.addr, align 8
  %21 = load ptr, ptr %fp.addr, align 8
  %call2 = call i64 @fwrite(ptr noundef %18, i64 noundef %19, i64 noundef %20, ptr noundef %21)
  ret i64 %call2
}

declare i64 @fwrite(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_getc(ptr noundef %fp_pmd, ptr noundef %fp, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name) #0 {
entry:
  %fp_pmd.addr = alloca ptr, align 8
  %fp.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store ptr %fp, ptr %fp.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  %0 = load ptr, ptr %fp_pmd.addr, align 8
  %1 = load ptr, ptr %fp.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %f_line.addr, align 4
  %5 = load i32, ptr %f_col.addr, align 4
  %6 = load ptr, ptr %f_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 216, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %7)
  %8 = load ptr, ptr %fp.addr, align 8
  %call1 = call i32 @getc(ptr noundef %8)
  ret i32 %call1
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_gets(ptr noundef %str_pmd, ptr noundef %str, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %str_pmd.addr = alloca ptr, align 8
  %str.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  %ret = alloca i32, align 4
  store ptr %str_pmd, ptr %str_pmd.addr, align 8
  store ptr %str, ptr %str.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  %0 = load ptr, ptr %str.addr, align 8
  %1 = load ptr, ptr @stdin, align 8
  %call = call ptr @fgets(ptr noundef %0, i32 noundef 1024, ptr noundef %1)
  store ptr %call, ptr %str.addr, align 8
  %2 = load ptr, ptr %str.addr, align 8
  %tobool = icmp ne ptr %2, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %3 = load ptr, ptr %str.addr, align 8
  %call1 = call i32 @__RV_sstrlen(ptr noundef %3)
  store i32 %call1, ptr %ret, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  store i32 0, ptr %ret, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load ptr, ptr %str_pmd.addr, align 8
  %5 = load ptr, ptr %str.addr, align 8
  %6 = load ptr, ptr %str.addr, align 8
  %call2 = call i32 @__RV_sstrlen(ptr noundef %6)
  %add = add nsw i32 %call2, 1
  %conv = sext i32 %add to i64
  %7 = load ptr, ptr %file_name.addr, align 8
  %8 = load ptr, ptr %func_name.addr, align 8
  %9 = load i32, ptr %s_line.addr, align 4
  %10 = load i32, ptr %s_col.addr, align 4
  %11 = load ptr, ptr %s_name.addr, align 8
  %call3 = call ptr @__RV_check_dpv(ptr noundef %4, ptr noundef %5, i64 noundef %conv, ptr noundef %7, ptr noundef %8, i32 noundef %9, i32 noundef %10, ptr noundef %11)
  %12 = load ptr, ptr %str_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %12)
  %13 = load i32, ptr %ret, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_pclose(ptr noundef %fp_pmd, ptr noundef %fp, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name) #0 {
entry:
  %fp_pmd.addr = alloca ptr, align 8
  %fp.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store ptr %fp, ptr %fp.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  %0 = load ptr, ptr %fp_pmd.addr, align 8
  %1 = load ptr, ptr %fp.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %f_line.addr, align 4
  %5 = load i32, ptr %f_col.addr, align 4
  %6 = load ptr, ptr %f_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 216, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_set_stat(ptr noundef %7, i32 noundef 0)
  %8 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %8)
  %9 = load ptr, ptr %fp.addr, align 8
  %call1 = call i32 @pclose(ptr noundef %9)
  ret i32 %call1
}

declare i32 @pclose(ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_RV_perror(ptr noundef %str_pmd, ptr noundef %str, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %str_pmd.addr = alloca ptr, align 8
  %str.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  store ptr %str_pmd, ptr %str_pmd.addr, align 8
  store ptr %str, ptr %str.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  %0 = load ptr, ptr %str_pmd.addr, align 8
  %1 = load ptr, ptr %str.addr, align 8
  %2 = load ptr, ptr %str.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %str_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %8)
  %9 = load ptr, ptr %str.addr, align 8
  call void @perror(ptr noundef %9)
  ret void
}

declare void @perror(ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_popen(ptr noundef %ret_pmd, ptr noundef %filename_pmd, ptr noundef %mode_pmd, ptr noundef %filename, ptr noundef %mode, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name, i32 noundef %m_line, i32 noundef %m_col, ptr noundef %m_name) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %filename_pmd.addr = alloca ptr, align 8
  %mode_pmd.addr = alloca ptr, align 8
  %filename.addr = alloca ptr, align 8
  %mode.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  %m_line.addr = alloca i32, align 4
  %m_col.addr = alloca i32, align 4
  %m_name.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store ptr %filename_pmd, ptr %filename_pmd.addr, align 8
  store ptr %mode_pmd, ptr %mode_pmd.addr, align 8
  store ptr %filename, ptr %filename.addr, align 8
  store ptr %mode, ptr %mode.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  store i32 %m_line, ptr %m_line.addr, align 4
  store i32 %m_col, ptr %m_col.addr, align 4
  store ptr %m_name, ptr %m_name.addr, align 8
  %0 = load ptr, ptr %filename_pmd.addr, align 8
  %1 = load ptr, ptr %filename.addr, align 8
  %2 = load ptr, ptr %filename.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %f_line.addr, align 4
  %6 = load i32, ptr %f_col.addr, align 4
  %7 = load ptr, ptr %f_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %mode_pmd.addr, align 8
  %9 = load ptr, ptr %mode.addr, align 8
  %10 = load ptr, ptr %mode.addr, align 8
  %call2 = call i32 @__RV_sstrlen(ptr noundef %10)
  %add3 = add nsw i32 %call2, 1
  %conv4 = sext i32 %add3 to i64
  %11 = load ptr, ptr %file_name.addr, align 8
  %12 = load ptr, ptr %func_name.addr, align 8
  %13 = load i32, ptr %m_line.addr, align 4
  %14 = load i32, ptr %m_col.addr, align 4
  %15 = load ptr, ptr %m_name.addr, align 8
  %call5 = call ptr @__RV_check_dpv(ptr noundef %8, ptr noundef %9, i64 noundef %conv4, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, ptr noundef %15)
  %16 = load ptr, ptr %filename.addr, align 8
  %17 = load ptr, ptr %mode.addr, align 8
  %call6 = call noalias ptr @popen(ptr noundef %16, ptr noundef %17)
  store ptr %call6, ptr %ret, align 8
  %18 = load ptr, ptr %ret, align 8
  %cmp = icmp eq ptr %18, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %19 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %19)
  br label %if.end

if.else:                                          ; preds = %entry
  %20 = load ptr, ptr %ret_pmd.addr, align 8
  %21 = load ptr, ptr %ret, align 8
  %22 = load ptr, ptr %ret, align 8
  %add.ptr = getelementptr inbounds %struct._IO_FILE, ptr %22, i64 1
  %call8 = call ptr @__RV_pmd_set(ptr noundef %20, ptr noundef null, i32 noundef 4, ptr noundef %21, ptr noundef %add.ptr)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %23 = load ptr, ptr %filename_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %23)
  %24 = load ptr, ptr %mode_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %24)
  %25 = load ptr, ptr %ret, align 8
  ret ptr %25
}

declare noalias ptr @popen(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_putc(ptr noundef %fp_pmd, i32 noundef %ch, ptr noundef %fp, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name) #0 {
entry:
  %fp_pmd.addr = alloca ptr, align 8
  %ch.addr = alloca i32, align 4
  %fp.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store i32 %ch, ptr %ch.addr, align 4
  store ptr %fp, ptr %fp.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  %0 = load ptr, ptr %fp_pmd.addr, align 8
  %1 = load ptr, ptr %fp.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %f_line.addr, align 4
  %5 = load i32, ptr %f_col.addr, align 4
  %6 = load ptr, ptr %f_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 216, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %7)
  %8 = load i32, ptr %ch.addr, align 4
  %9 = load ptr, ptr %fp.addr, align 8
  %call1 = call i32 @putc(i32 noundef %8, ptr noundef %9)
  ret i32 %call1
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_puts(ptr noundef %str_pmd, ptr noundef %str, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %str_pmd.addr = alloca ptr, align 8
  %str.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  store ptr %str_pmd, ptr %str_pmd.addr, align 8
  store ptr %str, ptr %str.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  %0 = load ptr, ptr %str_pmd.addr, align 8
  %1 = load ptr, ptr %str.addr, align 8
  %2 = load ptr, ptr %str.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %str_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %8)
  %9 = load ptr, ptr %str.addr, align 8
  %call2 = call i32 @puts(ptr noundef %9)
  ret i32 %call2
}

declare i32 @puts(ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_remove(ptr noundef %filename_pmd, ptr noundef %filename, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name) #0 {
entry:
  %filename_pmd.addr = alloca ptr, align 8
  %filename.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  store ptr %filename_pmd, ptr %filename_pmd.addr, align 8
  store ptr %filename, ptr %filename.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  %0 = load ptr, ptr %filename_pmd.addr, align 8
  %1 = load ptr, ptr %filename.addr, align 8
  %2 = load ptr, ptr %filename.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %f_line.addr, align 4
  %6 = load i32, ptr %f_col.addr, align 4
  %7 = load ptr, ptr %f_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %filename_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %8)
  %9 = load ptr, ptr %filename.addr, align 8
  %call2 = call i32 @remove(ptr noundef %9) #13
  ret i32 %call2
}

; Function Attrs: nounwind
declare i32 @remove(ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_rename(ptr noundef %old_pmd, ptr noundef %new_pmd, ptr noundef %old_filename, ptr noundef %new_filename, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name, i32 noundef %n_line, i32 noundef %n_col, ptr noundef %n_name) #0 {
entry:
  %old_pmd.addr = alloca ptr, align 8
  %new_pmd.addr = alloca ptr, align 8
  %old_filename.addr = alloca ptr, align 8
  %new_filename.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  %n_line.addr = alloca i32, align 4
  %n_col.addr = alloca i32, align 4
  %n_name.addr = alloca ptr, align 8
  store ptr %old_pmd, ptr %old_pmd.addr, align 8
  store ptr %new_pmd, ptr %new_pmd.addr, align 8
  store ptr %old_filename, ptr %old_filename.addr, align 8
  store ptr %new_filename, ptr %new_filename.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  store i32 %n_line, ptr %n_line.addr, align 4
  store i32 %n_col, ptr %n_col.addr, align 4
  store ptr %n_name, ptr %n_name.addr, align 8
  %0 = load ptr, ptr %old_pmd.addr, align 8
  %1 = load ptr, ptr %old_filename.addr, align 8
  %2 = load ptr, ptr %old_filename.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %f_line.addr, align 4
  %6 = load i32, ptr %f_col.addr, align 4
  %7 = load ptr, ptr %f_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %new_pmd.addr, align 8
  %9 = load ptr, ptr %new_filename.addr, align 8
  %10 = load ptr, ptr %new_filename.addr, align 8
  %call2 = call i32 @__RV_sstrlen(ptr noundef %10)
  %add3 = add nsw i32 %call2, 1
  %conv4 = sext i32 %add3 to i64
  %11 = load ptr, ptr %file_name.addr, align 8
  %12 = load ptr, ptr %func_name.addr, align 8
  %13 = load i32, ptr %n_line.addr, align 4
  %14 = load i32, ptr %n_col.addr, align 4
  %15 = load ptr, ptr %n_name.addr, align 8
  %call5 = call ptr @__RV_check_dpv(ptr noundef %8, ptr noundef %9, i64 noundef %conv4, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, ptr noundef %15)
  %16 = load ptr, ptr %old_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %16)
  %17 = load ptr, ptr %new_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %17)
  %18 = load ptr, ptr %old_filename.addr, align 8
  %19 = load ptr, ptr %new_filename.addr, align 8
  %call6 = call i32 @rename(ptr noundef %18, ptr noundef %19) #13
  ret i32 %call6
}

; Function Attrs: nounwind
declare i32 @rename(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_RV_rewind(ptr noundef %fp_pmd, ptr noundef %fp, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name) #0 {
entry:
  %fp_pmd.addr = alloca ptr, align 8
  %fp.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store ptr %fp, ptr %fp.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  %0 = load ptr, ptr %fp_pmd.addr, align 8
  %1 = load ptr, ptr %fp.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %f_line.addr, align 4
  %5 = load i32, ptr %f_col.addr, align 4
  %6 = load ptr, ptr %f_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 216, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %7)
  %8 = load ptr, ptr %fp.addr, align 8
  call void @rewind(ptr noundef %8)
  ret void
}

declare void @rewind(ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_RV_setbuf(ptr noundef %fp_pmd, ptr noundef %buffer_pmd, ptr noundef %fp, ptr noundef %buffer, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name, i32 noundef %b_line, i32 noundef %b_col, ptr noundef %b_name) #0 {
entry:
  %fp_pmd.addr = alloca ptr, align 8
  %buffer_pmd.addr = alloca ptr, align 8
  %fp.addr = alloca ptr, align 8
  %buffer.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  %b_line.addr = alloca i32, align 4
  %b_col.addr = alloca i32, align 4
  %b_name.addr = alloca ptr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store ptr %buffer_pmd, ptr %buffer_pmd.addr, align 8
  store ptr %fp, ptr %fp.addr, align 8
  store ptr %buffer, ptr %buffer.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  store i32 %b_line, ptr %b_line.addr, align 4
  store i32 %b_col, ptr %b_col.addr, align 4
  store ptr %b_name, ptr %b_name.addr, align 8
  %0 = load ptr, ptr %fp_pmd.addr, align 8
  %1 = load ptr, ptr %fp.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %f_line.addr, align 4
  %5 = load i32, ptr %f_col.addr, align 4
  %6 = load ptr, ptr %f_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 216, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %buffer.addr, align 8
  %tobool = icmp ne ptr %7, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %8 = load ptr, ptr %buffer_pmd.addr, align 8
  %9 = load ptr, ptr %buffer.addr, align 8
  %10 = load ptr, ptr %file_name.addr, align 8
  %11 = load ptr, ptr %func_name.addr, align 8
  %12 = load i32, ptr %b_line.addr, align 4
  %13 = load i32, ptr %b_col.addr, align 4
  %14 = load ptr, ptr %b_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %8, ptr noundef %9, i64 noundef 1, ptr noundef %10, ptr noundef %11, i32 noundef %12, i32 noundef %13, ptr noundef %14)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %15 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %15)
  %16 = load ptr, ptr %buffer_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %16)
  %17 = load ptr, ptr %fp.addr, align 8
  %18 = load ptr, ptr %buffer.addr, align 8
  call void @setbuf(ptr noundef %17, ptr noundef %18) #13
  ret void
}

; Function Attrs: nounwind
declare void @setbuf(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_setvbuf(ptr noundef %fp_pmd, ptr noundef %buffer_pmd, ptr noundef %fp, ptr noundef %buffer, i32 noundef %mode, i64 noundef %size, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name, i32 noundef %b_line, i32 noundef %b_col, ptr noundef %b_name) #0 {
entry:
  %fp_pmd.addr = alloca ptr, align 8
  %buffer_pmd.addr = alloca ptr, align 8
  %fp.addr = alloca ptr, align 8
  %buffer.addr = alloca ptr, align 8
  %mode.addr = alloca i32, align 4
  %size.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  %b_line.addr = alloca i32, align 4
  %b_col.addr = alloca i32, align 4
  %b_name.addr = alloca ptr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store ptr %buffer_pmd, ptr %buffer_pmd.addr, align 8
  store ptr %fp, ptr %fp.addr, align 8
  store ptr %buffer, ptr %buffer.addr, align 8
  store i32 %mode, ptr %mode.addr, align 4
  store i64 %size, ptr %size.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  store i32 %b_line, ptr %b_line.addr, align 4
  store i32 %b_col, ptr %b_col.addr, align 4
  store ptr %b_name, ptr %b_name.addr, align 8
  %0 = load ptr, ptr %fp_pmd.addr, align 8
  %1 = load ptr, ptr %fp.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %f_line.addr, align 4
  %5 = load i32, ptr %f_col.addr, align 4
  %6 = load ptr, ptr %f_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 216, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %buffer.addr, align 8
  %tobool = icmp ne ptr %7, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %8 = load ptr, ptr %buffer_pmd.addr, align 8
  %9 = load ptr, ptr %buffer.addr, align 8
  %10 = load i64, ptr %size.addr, align 8
  %11 = load ptr, ptr %file_name.addr, align 8
  %12 = load ptr, ptr %func_name.addr, align 8
  %13 = load i32, ptr %b_line.addr, align 4
  %14 = load i32, ptr %b_col.addr, align 4
  %15 = load ptr, ptr %b_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %8, ptr noundef %9, i64 noundef %10, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, ptr noundef %15)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %16 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %16)
  %17 = load ptr, ptr %buffer_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %17)
  %18 = load ptr, ptr %fp.addr, align 8
  %19 = load ptr, ptr %buffer.addr, align 8
  %20 = load i32, ptr %mode.addr, align 4
  %21 = load i64, ptr %size.addr, align 8
  %call2 = call i32 @setvbuf(ptr noundef %18, ptr noundef %19, i32 noundef %20, i64 noundef %21) #13
  ret i32 %call2
}

; Function Attrs: nounwind
declare i32 @setvbuf(ptr noundef, ptr noundef, i32 noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_tmpfile(ptr noundef %ret_pmd) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  %call = call noalias ptr @tmpfile()
  store ptr %call, ptr %ret, align 8
  %0 = load ptr, ptr %ret, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %1)
  br label %if.end

if.else:                                          ; preds = %entry
  %2 = load ptr, ptr %ret_pmd.addr, align 8
  %3 = load ptr, ptr %ret, align 8
  %4 = load ptr, ptr %ret, align 8
  %add.ptr = getelementptr inbounds %struct._IO_FILE, ptr %4, i64 1
  %call1 = call ptr @__RV_pmd_set(ptr noundef %2, ptr noundef null, i32 noundef 4, ptr noundef %3, ptr noundef %add.ptr)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %5 = load ptr, ptr %ret, align 8
  ret ptr %5
}

declare noalias ptr @tmpfile() #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_tmpnam(ptr noundef %ret_pmd, ptr noundef %str_pmd, ptr noundef %str, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %str_pmd.addr = alloca ptr, align 8
  %str.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  %fd = alloca i32, align 4
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store ptr %str_pmd, ptr %str_pmd.addr, align 8
  store ptr %str, ptr %str.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  %0 = load ptr, ptr %str_pmd.addr, align 8
  %1 = load ptr, ptr %str.addr, align 8
  %2 = load ptr, ptr %str.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %call2 = call i32 @mkstemp(ptr noundef @_RV_tmpnam.temp_file)
  store i32 %call2, ptr %fd, align 4
  %call3 = call i32 @unlink(ptr noundef @_RV_tmpnam.temp_file) #13
  %8 = load i32, ptr %fd, align 4
  %call4 = call i32 @close(i32 noundef %8)
  %9 = load ptr, ptr %str.addr, align 8
  %cmp = icmp eq ptr %9, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store ptr @_RV_tmpnam.temp_file, ptr %ret, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  %10 = load ptr, ptr %str.addr, align 8
  %call6 = call ptr @strcpy(ptr noundef %10, ptr noundef @_RV_tmpnam.temp_file) #13
  %11 = load ptr, ptr %str.addr, align 8
  store ptr %11, ptr %ret, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %12 = load ptr, ptr %ret, align 8
  %cmp7 = icmp eq ptr %12, null
  br i1 %cmp7, label %if.then9, label %if.else10

if.then9:                                         ; preds = %if.end
  %13 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %13)
  br label %if.end14

if.else10:                                        ; preds = %if.end
  %14 = load ptr, ptr %ret_pmd.addr, align 8
  %15 = load ptr, ptr @__RV_static_sa, align 8
  %16 = load ptr, ptr %ret, align 8
  %17 = load ptr, ptr %ret, align 8
  %18 = load ptr, ptr %ret, align 8
  %call11 = call i32 @__RV_sstrlen(ptr noundef %18)
  %idx.ext = sext i32 %call11 to i64
  %add.ptr = getelementptr inbounds i8, ptr %17, i64 %idx.ext
  %add.ptr12 = getelementptr inbounds i8, ptr %add.ptr, i64 1
  %call13 = call ptr @__RV_pmd_set(ptr noundef %14, ptr noundef %15, i32 noundef 0, ptr noundef %16, ptr noundef %add.ptr12)
  br label %if.end14

if.end14:                                         ; preds = %if.else10, %if.then9
  %19 = load ptr, ptr %str_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %19)
  %20 = load ptr, ptr %ret, align 8
  ret ptr %20
}

declare i32 @mkstemp(ptr noundef) #1

; Function Attrs: nounwind
declare i32 @unlink(ptr noundef) #3

declare i32 @close(i32 noundef) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_ungetc(ptr noundef %fp_pmd, i32 noundef %ch, ptr noundef %fp, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name) #0 {
entry:
  %fp_pmd.addr = alloca ptr, align 8
  %ch.addr = alloca i32, align 4
  %fp.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store i32 %ch, ptr %ch.addr, align 4
  store ptr %fp, ptr %fp.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  %0 = load ptr, ptr %fp_pmd.addr, align 8
  %1 = load ptr, ptr %fp.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %f_line.addr, align 4
  %5 = load i32, ptr %f_col.addr, align 4
  %6 = load ptr, ptr %f_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 216, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %7)
  %8 = load i32, ptr %ch.addr, align 4
  %9 = load ptr, ptr %fp.addr, align 8
  %call1 = call i32 @ungetc(i32 noundef %8, ptr noundef %9)
  ret i32 %call1
}

declare i32 @ungetc(i32 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_vasprintf(ptr noundef %strp_pmd, ptr noundef %fmt_pmd, ptr noundef %ap_pmd, ptr noundef %strp, ptr noundef %fmt, ptr noundef %ap, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name, i32 noundef %a_line, i32 noundef %a_col, ptr noundef %a_name) #0 {
entry:
  %strp_pmd.addr = alloca ptr, align 8
  %fmt_pmd.addr = alloca ptr, align 8
  %ap_pmd.addr = alloca ptr, align 8
  %strp.addr = alloca ptr, align 8
  %fmt.addr = alloca ptr, align 8
  %ap.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  %a_line.addr = alloca i32, align 4
  %a_col.addr = alloca i32, align 4
  %a_name.addr = alloca ptr, align 8
  %ret = alloca i32, align 4
  store ptr %strp_pmd, ptr %strp_pmd.addr, align 8
  store ptr %fmt_pmd, ptr %fmt_pmd.addr, align 8
  store ptr %ap_pmd, ptr %ap_pmd.addr, align 8
  store ptr %strp, ptr %strp.addr, align 8
  store ptr %fmt, ptr %fmt.addr, align 8
  store ptr %ap, ptr %ap.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  store i32 %a_line, ptr %a_line.addr, align 4
  store i32 %a_col, ptr %a_col.addr, align 4
  store ptr %a_name, ptr %a_name.addr, align 8
  %0 = load ptr, ptr %strp_pmd.addr, align 8
  %1 = load ptr, ptr %strp.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %s_line.addr, align 4
  %5 = load i32, ptr %s_col.addr, align 4
  %6 = load ptr, ptr %s_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 8, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %fmt_pmd.addr, align 8
  %8 = load ptr, ptr %fmt.addr, align 8
  %9 = load ptr, ptr %fmt.addr, align 8
  %call1 = call i32 @__RV_sstrlen(ptr noundef %9)
  %add = add nsw i32 %call1, 1
  %conv = sext i32 %add to i64
  %10 = load ptr, ptr %file_name.addr, align 8
  %11 = load ptr, ptr %func_name.addr, align 8
  %12 = load i32, ptr %f_line.addr, align 4
  %13 = load i32, ptr %f_col.addr, align 4
  %14 = load ptr, ptr %f_name.addr, align 8
  %call2 = call ptr @__RV_check_dpv(ptr noundef %7, ptr noundef %8, i64 noundef %conv, ptr noundef %10, ptr noundef %11, i32 noundef %12, i32 noundef %13, ptr noundef %14)
  %15 = load ptr, ptr %ap_pmd.addr, align 8
  %16 = load ptr, ptr %ap.addr, align 8
  %17 = load ptr, ptr %file_name.addr, align 8
  %18 = load ptr, ptr %func_name.addr, align 8
  %19 = load i32, ptr %a_line.addr, align 4
  %20 = load i32, ptr %a_col.addr, align 4
  %21 = load ptr, ptr %a_name.addr, align 8
  %call3 = call ptr @__RV_check_dpv(ptr noundef %15, ptr noundef %16, i64 noundef 24, ptr noundef %17, ptr noundef %18, i32 noundef %19, i32 noundef %20, ptr noundef %21)
  %22 = load ptr, ptr %strp.addr, align 8
  %23 = load ptr, ptr %fmt.addr, align 8
  %24 = load ptr, ptr %ap.addr, align 8
  %call4 = call i32 @vasprintf(ptr noundef %22, ptr noundef %23, ptr noundef %24)
  store i32 %call4, ptr %ret, align 4
  %25 = load ptr, ptr %strp.addr, align 8
  %26 = load ptr, ptr %strp.addr, align 8
  %27 = load ptr, ptr %26, align 8
  %28 = load ptr, ptr %strp.addr, align 8
  %29 = load ptr, ptr %28, align 8
  %30 = load ptr, ptr %strp.addr, align 8
  %31 = load ptr, ptr %30, align 8
  %call5 = call i32 @__RV_sstrlen(ptr noundef %31)
  %idx.ext = sext i32 %call5 to i64
  %add.ptr = getelementptr inbounds i8, ptr %29, i64 %idx.ext
  %add.ptr6 = getelementptr inbounds i8, ptr %add.ptr, i64 1
  %call7 = call ptr @__RV_pmd_tbl_update_ns(ptr noundef %25, i32 noundef 4, ptr noundef %27, ptr noundef %add.ptr6)
  %32 = load ptr, ptr %strp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %32)
  %33 = load ptr, ptr %fmt_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %33)
  %34 = load ptr, ptr %ap_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %34)
  %35 = load i32, ptr %ret, align 4
  ret i32 %35
}

declare i32 @vasprintf(ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_vfprintf(ptr noundef %fp_pmd, ptr noundef %format_pmd, ptr noundef %arg_pmd, ptr noundef %fp, ptr noundef %format, ptr noundef %arg, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name, i32 noundef %r_line, i32 noundef %r_col, ptr noundef %r_name, i32 noundef %a_line, i32 noundef %a_col, ptr noundef %a_name) #0 {
entry:
  %fp_pmd.addr = alloca ptr, align 8
  %format_pmd.addr = alloca ptr, align 8
  %arg_pmd.addr = alloca ptr, align 8
  %fp.addr = alloca ptr, align 8
  %format.addr = alloca ptr, align 8
  %arg.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  %r_line.addr = alloca i32, align 4
  %r_col.addr = alloca i32, align 4
  %r_name.addr = alloca ptr, align 8
  %a_line.addr = alloca i32, align 4
  %a_col.addr = alloca i32, align 4
  %a_name.addr = alloca ptr, align 8
  store ptr %fp_pmd, ptr %fp_pmd.addr, align 8
  store ptr %format_pmd, ptr %format_pmd.addr, align 8
  store ptr %arg_pmd, ptr %arg_pmd.addr, align 8
  store ptr %fp, ptr %fp.addr, align 8
  store ptr %format, ptr %format.addr, align 8
  store ptr %arg, ptr %arg.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  store i32 %r_line, ptr %r_line.addr, align 4
  store i32 %r_col, ptr %r_col.addr, align 4
  store ptr %r_name, ptr %r_name.addr, align 8
  store i32 %a_line, ptr %a_line.addr, align 4
  store i32 %a_col, ptr %a_col.addr, align 4
  store ptr %a_name, ptr %a_name.addr, align 8
  %0 = load ptr, ptr %fp_pmd.addr, align 8
  %1 = load ptr, ptr %fp.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %f_line.addr, align 4
  %5 = load i32, ptr %f_col.addr, align 4
  %6 = load ptr, ptr %f_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 216, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %format_pmd.addr, align 8
  %8 = load ptr, ptr %format.addr, align 8
  %9 = load ptr, ptr %format.addr, align 8
  %call1 = call i32 @__RV_sstrlen(ptr noundef %9)
  %add = add nsw i32 %call1, 1
  %conv = sext i32 %add to i64
  %10 = load ptr, ptr %file_name.addr, align 8
  %11 = load ptr, ptr %func_name.addr, align 8
  %12 = load i32, ptr %r_line.addr, align 4
  %13 = load i32, ptr %r_col.addr, align 4
  %14 = load ptr, ptr %r_name.addr, align 8
  %call2 = call ptr @__RV_check_dpv(ptr noundef %7, ptr noundef %8, i64 noundef %conv, ptr noundef %10, ptr noundef %11, i32 noundef %12, i32 noundef %13, ptr noundef %14)
  %15 = load ptr, ptr %arg_pmd.addr, align 8
  %16 = load ptr, ptr %arg.addr, align 8
  %17 = load ptr, ptr %file_name.addr, align 8
  %18 = load ptr, ptr %func_name.addr, align 8
  %19 = load i32, ptr %a_line.addr, align 4
  %20 = load i32, ptr %a_col.addr, align 4
  %21 = load ptr, ptr %a_name.addr, align 8
  %call3 = call ptr @__RV_check_dpv(ptr noundef %15, ptr noundef %16, i64 noundef 24, ptr noundef %17, ptr noundef %18, i32 noundef %19, i32 noundef %20, ptr noundef %21)
  %22 = load ptr, ptr %fp_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %22)
  %23 = load ptr, ptr %format_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %23)
  %24 = load ptr, ptr %arg_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %24)
  %25 = load ptr, ptr %fp.addr, align 8
  %26 = load ptr, ptr %format.addr, align 8
  %27 = load ptr, ptr %arg.addr, align 8
  %call4 = call i32 @vfprintf(ptr noundef %25, ptr noundef %26, ptr noundef %27)
  ret i32 %call4
}

declare i32 @vfprintf(ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_vprintf(ptr noundef %format_pmd, ptr noundef %arg_pmd, ptr noundef %format, ptr noundef %arg, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name, i32 noundef %a_line, i32 noundef %a_col, ptr noundef %a_name) #0 {
entry:
  %format_pmd.addr = alloca ptr, align 8
  %arg_pmd.addr = alloca ptr, align 8
  %format.addr = alloca ptr, align 8
  %arg.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  %a_line.addr = alloca i32, align 4
  %a_col.addr = alloca i32, align 4
  %a_name.addr = alloca ptr, align 8
  store ptr %format_pmd, ptr %format_pmd.addr, align 8
  store ptr %arg_pmd, ptr %arg_pmd.addr, align 8
  store ptr %format, ptr %format.addr, align 8
  store ptr %arg, ptr %arg.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  store i32 %a_line, ptr %a_line.addr, align 4
  store i32 %a_col, ptr %a_col.addr, align 4
  store ptr %a_name, ptr %a_name.addr, align 8
  %0 = load ptr, ptr %format_pmd.addr, align 8
  %1 = load ptr, ptr %format.addr, align 8
  %2 = load ptr, ptr %format.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %f_line.addr, align 4
  %6 = load i32, ptr %f_col.addr, align 4
  %7 = load ptr, ptr %f_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %arg_pmd.addr, align 8
  %9 = load ptr, ptr %arg.addr, align 8
  %10 = load ptr, ptr %file_name.addr, align 8
  %11 = load ptr, ptr %func_name.addr, align 8
  %12 = load i32, ptr %a_line.addr, align 4
  %13 = load i32, ptr %a_col.addr, align 4
  %14 = load ptr, ptr %a_name.addr, align 8
  %call2 = call ptr @__RV_check_dpv(ptr noundef %8, ptr noundef %9, i64 noundef 24, ptr noundef %10, ptr noundef %11, i32 noundef %12, i32 noundef %13, ptr noundef %14)
  %15 = load ptr, ptr %format_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %15)
  %16 = load ptr, ptr %arg_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %16)
  %17 = load ptr, ptr %format.addr, align 8
  %18 = load ptr, ptr %arg.addr, align 8
  %call3 = call i32 @vprintf(ptr noundef %17, ptr noundef %18)
  ret i32 %call3
}

declare i32 @vprintf(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_vsprintf(ptr noundef %str_pmd, ptr noundef %format_pmd, ptr noundef %arg_pmd, ptr noundef %str, ptr noundef %format, ptr noundef %arg, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name, i32 noundef %a_line, i32 noundef %a_col, ptr noundef %a_name) #0 {
entry:
  %str_pmd.addr = alloca ptr, align 8
  %format_pmd.addr = alloca ptr, align 8
  %arg_pmd.addr = alloca ptr, align 8
  %str.addr = alloca ptr, align 8
  %format.addr = alloca ptr, align 8
  %arg.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  %a_line.addr = alloca i32, align 4
  %a_col.addr = alloca i32, align 4
  %a_name.addr = alloca ptr, align 8
  %buffer = alloca [8192 x i8], align 16
  %ret = alloca i32, align 4
  store ptr %str_pmd, ptr %str_pmd.addr, align 8
  store ptr %format_pmd, ptr %format_pmd.addr, align 8
  store ptr %arg_pmd, ptr %arg_pmd.addr, align 8
  store ptr %str, ptr %str.addr, align 8
  store ptr %format, ptr %format.addr, align 8
  store ptr %arg, ptr %arg.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  store i32 %a_line, ptr %a_line.addr, align 4
  store i32 %a_col, ptr %a_col.addr, align 4
  store ptr %a_name, ptr %a_name.addr, align 8
  %0 = load ptr, ptr %format_pmd.addr, align 8
  %1 = load ptr, ptr %format.addr, align 8
  %2 = load ptr, ptr %format.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %f_line.addr, align 4
  %6 = load i32, ptr %f_col.addr, align 4
  %7 = load ptr, ptr %f_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %arg_pmd.addr, align 8
  %9 = load ptr, ptr %arg.addr, align 8
  %10 = load ptr, ptr %file_name.addr, align 8
  %11 = load ptr, ptr %func_name.addr, align 8
  %12 = load i32, ptr %a_line.addr, align 4
  %13 = load i32, ptr %a_col.addr, align 4
  %14 = load ptr, ptr %a_name.addr, align 8
  %call2 = call ptr @__RV_check_dpv(ptr noundef %8, ptr noundef %9, i64 noundef 24, ptr noundef %10, ptr noundef %11, i32 noundef %12, i32 noundef %13, ptr noundef %14)
  %arraydecay = getelementptr inbounds [8192 x i8], ptr %buffer, i64 0, i64 0
  %15 = load ptr, ptr %format.addr, align 8
  %16 = load ptr, ptr %arg.addr, align 8
  %call3 = call i32 @vsprintf(ptr noundef %arraydecay, ptr noundef %15, ptr noundef %16) #13
  store i32 %call3, ptr %ret, align 4
  %17 = load ptr, ptr %str_pmd.addr, align 8
  %18 = load ptr, ptr %str.addr, align 8
  %arraydecay4 = getelementptr inbounds [8192 x i8], ptr %buffer, i64 0, i64 0
  %call5 = call i32 @__RV_sstrlen(ptr noundef %arraydecay4)
  %add6 = add nsw i32 %call5, 1
  %conv7 = sext i32 %add6 to i64
  %19 = load ptr, ptr %file_name.addr, align 8
  %20 = load ptr, ptr %func_name.addr, align 8
  %21 = load i32, ptr %s_line.addr, align 4
  %22 = load i32, ptr %s_col.addr, align 4
  %23 = load ptr, ptr %s_name.addr, align 8
  %call8 = call ptr @__RV_check_dpv(ptr noundef %17, ptr noundef %18, i64 noundef %conv7, ptr noundef %19, ptr noundef %20, i32 noundef %21, i32 noundef %22, ptr noundef %23)
  %24 = load ptr, ptr %str.addr, align 8
  %arraydecay9 = getelementptr inbounds [8192 x i8], ptr %buffer, i64 0, i64 0
  %call10 = call ptr @strcpy(ptr noundef %24, ptr noundef %arraydecay9) #13
  %25 = load ptr, ptr %str_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %25)
  %26 = load ptr, ptr %format_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %26)
  %27 = load ptr, ptr %arg_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %27)
  %28 = load i32, ptr %ret, align 4
  ret i32 %28
}

; Function Attrs: nounwind
declare i32 @vsprintf(ptr noundef, ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_stdio_init_code() #0 {
entry:
  %0 = load ptr, ptr @__RV_static_sa, align 8
  %1 = load ptr, ptr @stdin, align 8
  %2 = load ptr, ptr @stdin, align 8
  %add.ptr = getelementptr inbounds %struct._IO_FILE, ptr %2, i64 1
  %call = call ptr @__RV_pmd_tbl_update_sa(ptr noundef @stdin, ptr noundef %0, ptr noundef %1, ptr noundef %add.ptr)
  %3 = load ptr, ptr @__RV_static_sa, align 8
  %4 = load ptr, ptr @stdout, align 8
  %5 = load ptr, ptr @stdout, align 8
  %add.ptr1 = getelementptr inbounds %struct._IO_FILE, ptr %5, i64 1
  %call2 = call ptr @__RV_pmd_tbl_update_sa(ptr noundef @stdout, ptr noundef %3, ptr noundef %4, ptr noundef %add.ptr1)
  %6 = load ptr, ptr @__RV_static_sa, align 8
  %7 = load ptr, ptr @stderr, align 8
  %8 = load ptr, ptr @stderr, align 8
  %add.ptr3 = getelementptr inbounds %struct._IO_FILE, ptr %8, i64 1
  %call4 = call ptr @__RV_pmd_tbl_update_sa(ptr noundef @stderr, ptr noundef %6, ptr noundef %7, ptr noundef %add.ptr3)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_stdio_clear_code() #0 {
entry:
  call void @__RV_pmd_tbl_remove(ptr noundef @stdin)
  call void @__RV_pmd_tbl_remove(ptr noundef @stdout)
  call void @__RV_pmd_tbl_remove(ptr noundef @stderr)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_atexit(ptr noundef %func_pmd, ptr noundef %func, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name) #0 {
entry:
  %func_pmd.addr = alloca ptr, align 8
  %func.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  store ptr %func_pmd, ptr %func_pmd.addr, align 8
  store ptr %func, ptr %func.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  %0 = load ptr, ptr %func_pmd.addr, align 8
  %1 = load ptr, ptr %func.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %f_line.addr, align 4
  %5 = load i32, ptr %f_col.addr, align 4
  %6 = load ptr, ptr %f_name.addr, align 8
  %call = call ptr @__RV_check_dpfv(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %func_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %7)
  %8 = load ptr, ptr %func.addr, align 8
  %call1 = call i32 @atexit(ptr noundef %8) #13
  ret i32 %call1
}

; Function Attrs: nounwind
declare i32 @atexit(ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @_RV_atof(ptr noundef %str_pmd, ptr noundef %str, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %str_pmd.addr = alloca ptr, align 8
  %str.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  store ptr %str_pmd, ptr %str_pmd.addr, align 8
  store ptr %str, ptr %str.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  %0 = load ptr, ptr %str_pmd.addr, align 8
  %1 = load ptr, ptr %str.addr, align 8
  %2 = load ptr, ptr %str.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %str_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %8)
  %9 = load ptr, ptr %str.addr, align 8
  %call2 = call double @atof(ptr noundef %9) #15
  ret double %call2
}

; Function Attrs: nounwind willreturn memory(read)
declare double @atof(ptr noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_atoi(ptr noundef %str_pmd, ptr noundef %str, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %str_pmd.addr = alloca ptr, align 8
  %str.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  store ptr %str_pmd, ptr %str_pmd.addr, align 8
  store ptr %str, ptr %str.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  %0 = load ptr, ptr %str_pmd.addr, align 8
  %1 = load ptr, ptr %str.addr, align 8
  %2 = load ptr, ptr %str.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %str_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %8)
  %9 = load ptr, ptr %str.addr, align 8
  %call2 = call i32 @atoi(ptr noundef %9) #15
  ret i32 %call2
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @_RV_atol(ptr noundef %str_pmd, ptr noundef %str, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %str_pmd.addr = alloca ptr, align 8
  %str.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  store ptr %str_pmd, ptr %str_pmd.addr, align 8
  store ptr %str, ptr %str.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  %0 = load ptr, ptr %str_pmd.addr, align 8
  %1 = load ptr, ptr %str.addr, align 8
  %2 = load ptr, ptr %str.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %str_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %8)
  %9 = load ptr, ptr %str.addr, align 8
  %call2 = call i64 @atol(ptr noundef %9) #15
  ret i64 %call2
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @atol(ptr noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_bsearch(ptr noundef %ret_pmd, ptr noundef %key_pmd, ptr noundef %base_pmd, ptr noundef %compar_pmd, ptr noundef %key, ptr noundef %base, i64 noundef %num, i64 noundef %size, ptr noundef %compar, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %k_line, i32 noundef %k_col, ptr noundef %k_name, i32 noundef %b_line, i32 noundef %b_col, ptr noundef %b_name, i32 noundef %c_line, i32 noundef %c_col, ptr noundef %c_name) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %key_pmd.addr = alloca ptr, align 8
  %base_pmd.addr = alloca ptr, align 8
  %compar_pmd.addr = alloca ptr, align 8
  %key.addr = alloca ptr, align 8
  %base.addr = alloca ptr, align 8
  %num.addr = alloca i64, align 8
  %size.addr = alloca i64, align 8
  %compar.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %k_line.addr = alloca i32, align 4
  %k_col.addr = alloca i32, align 4
  %k_name.addr = alloca ptr, align 8
  %b_line.addr = alloca i32, align 4
  %b_col.addr = alloca i32, align 4
  %b_name.addr = alloca ptr, align 8
  %c_line.addr = alloca i32, align 4
  %c_col.addr = alloca i32, align 4
  %c_name.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store ptr %key_pmd, ptr %key_pmd.addr, align 8
  store ptr %base_pmd, ptr %base_pmd.addr, align 8
  store ptr %compar_pmd, ptr %compar_pmd.addr, align 8
  store ptr %key, ptr %key.addr, align 8
  store ptr %base, ptr %base.addr, align 8
  store i64 %num, ptr %num.addr, align 8
  store i64 %size, ptr %size.addr, align 8
  store ptr %compar, ptr %compar.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %k_line, ptr %k_line.addr, align 4
  store i32 %k_col, ptr %k_col.addr, align 4
  store ptr %k_name, ptr %k_name.addr, align 8
  store i32 %b_line, ptr %b_line.addr, align 4
  store i32 %b_col, ptr %b_col.addr, align 4
  store ptr %b_name, ptr %b_name.addr, align 8
  store i32 %c_line, ptr %c_line.addr, align 4
  store i32 %c_col, ptr %c_col.addr, align 4
  store ptr %c_name, ptr %c_name.addr, align 8
  %0 = load ptr, ptr %key_pmd.addr, align 8
  %1 = load ptr, ptr %key.addr, align 8
  %2 = load i64, ptr %size.addr, align 8
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %k_line.addr, align 4
  %6 = load i32, ptr %k_col.addr, align 4
  %7 = load ptr, ptr %k_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %base_pmd.addr, align 8
  %9 = load ptr, ptr %base.addr, align 8
  %10 = load i64, ptr %num.addr, align 8
  %11 = load i64, ptr %size.addr, align 8
  %mul = mul i64 %10, %11
  %12 = load ptr, ptr %file_name.addr, align 8
  %13 = load ptr, ptr %func_name.addr, align 8
  %14 = load i32, ptr %b_line.addr, align 4
  %15 = load i32, ptr %b_col.addr, align 4
  %16 = load ptr, ptr %b_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %8, ptr noundef %9, i64 noundef %mul, ptr noundef %12, ptr noundef %13, i32 noundef %14, i32 noundef %15, ptr noundef %16)
  %17 = load ptr, ptr %compar_pmd.addr, align 8
  %18 = load ptr, ptr %compar.addr, align 8
  %19 = load ptr, ptr %file_name.addr, align 8
  %20 = load ptr, ptr %func_name.addr, align 8
  %21 = load i32, ptr %c_line.addr, align 4
  %22 = load i32, ptr %c_col.addr, align 4
  %23 = load ptr, ptr %c_name.addr, align 8
  %call2 = call ptr @__RV_check_dpfv(ptr noundef %17, ptr noundef %18, ptr noundef %19, ptr noundef %20, i32 noundef %21, i32 noundef %22, ptr noundef %23)
  %24 = load ptr, ptr %compar.addr, align 8
  %call3 = call ptr @__RV_fmd_tbl_create(ptr noundef %24, i8 noundef zeroext 2)
  %25 = load ptr, ptr %compar.addr, align 8
  %26 = load ptr, ptr %key_pmd.addr, align 8
  %call4 = call ptr @__RV_fmd_tbl_update_pmd(ptr noundef %25, i8 noundef zeroext 0, ptr noundef %26)
  %27 = load ptr, ptr %compar.addr, align 8
  %28 = load ptr, ptr %base_pmd.addr, align 8
  %call5 = call ptr @__RV_fmd_tbl_update_pmd(ptr noundef %27, i8 noundef zeroext 1, ptr noundef %28)
  %29 = load ptr, ptr %key.addr, align 8
  %30 = load ptr, ptr %base.addr, align 8
  %31 = load i64, ptr %num.addr, align 8
  %32 = load i64, ptr %size.addr, align 8
  %33 = load ptr, ptr %compar.addr, align 8
  %call6 = call ptr @bsearch(ptr noundef %29, ptr noundef %30, i64 noundef %31, i64 noundef %32, ptr noundef %33)
  store ptr %call6, ptr %ret, align 8
  %34 = load ptr, ptr %compar.addr, align 8
  call void @__RV_fmd_tbl_remove(ptr noundef %34)
  %35 = load ptr, ptr %ret, align 8
  %cmp = icmp eq ptr %35, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %36 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %36)
  br label %if.end

if.else:                                          ; preds = %entry
  %37 = load ptr, ptr %ret_pmd.addr, align 8
  %38 = load ptr, ptr %base_pmd.addr, align 8
  %call7 = call ptr @__RV_pmd_cp_pmd(ptr noundef %37, ptr noundef %38)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %39 = load ptr, ptr %key_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %39)
  %40 = load ptr, ptr %base_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %40)
  %41 = load ptr, ptr %compar_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %41)
  %42 = load ptr, ptr %ret, align 8
  ret ptr %42
}

declare ptr @bsearch(ptr noundef, ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_calloc(ptr noundef %ret_pmd, i64 noundef %n, i64 noundef %size) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %n.addr = alloca i64, align 8
  %size.addr = alloca i64, align 8
  %ret = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store i64 %n, ptr %n.addr, align 8
  store i64 %size, ptr %size.addr, align 8
  %0 = load i64, ptr %n.addr, align 8
  %1 = load i64, ptr %size.addr, align 8
  %call = call noalias ptr @calloc(i64 noundef %0, i64 noundef %1) #16
  store ptr %call, ptr %ret, align 8
  %2 = load ptr, ptr %ret, align 8
  %cmp = icmp eq ptr %2, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %3 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %3)
  br label %if.end

if.else:                                          ; preds = %entry
  %4 = load ptr, ptr %ret_pmd.addr, align 8
  %5 = load ptr, ptr %ret, align 8
  %6 = load ptr, ptr %ret, align 8
  %7 = load i64, ptr %n.addr, align 8
  %8 = load i64, ptr %size.addr, align 8
  %mul = mul i64 %7, %8
  %add.ptr = getelementptr inbounds i8, ptr %6, i64 %mul
  %call1 = call ptr @__RV_pmd_set(ptr noundef %4, ptr noundef null, i32 noundef 4, ptr noundef %5, ptr noundef %add.ptr)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %9 = load ptr, ptr %ret, align 8
  ret ptr %9
}

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #6

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_RV_free(ptr noundef %ptr_pmd, ptr noundef %ptr, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %p_line, i32 noundef %p_col, ptr noundef %p_name) #0 {
entry:
  %ptr_pmd.addr = alloca ptr, align 8
  %ptr.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %p_line.addr = alloca i32, align 4
  %p_col.addr = alloca i32, align 4
  %p_name.addr = alloca ptr, align 8
  %stat = alloca i32, align 4
  %bound = alloca ptr, align 8
  %p = alloca ptr, align 8
  %ptr_pmd_freed = alloca i8, align 1
  store ptr %ptr_pmd, ptr %ptr_pmd.addr, align 8
  store ptr %ptr, ptr %ptr.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %p_line, ptr %p_line.addr, align 4
  store i32 %p_col, ptr %p_col.addr, align 4
  store ptr %p_name, ptr %p_name.addr, align 8
  %0 = load ptr, ptr %ptr_pmd.addr, align 8
  %call = call i32 @__RV_pmd_get_stat(ptr noundef %0)
  store i32 %call, ptr %stat, align 4
  store i8 0, ptr %ptr_pmd_freed, align 1
  %1 = load ptr, ptr %ptr.addr, align 8
  %cmp = icmp eq ptr %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %if.end47

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %ptr_pmd.addr, align 8
  %cmp1 = icmp eq ptr %2, null
  br i1 %cmp1, label %if.then2, label %if.end5

if.then2:                                         ; preds = %if.end
  %3 = load ptr, ptr @stderr, align 8
  %4 = load ptr, ptr %file_name.addr, align 8
  %5 = load ptr, ptr %func_name.addr, align 8
  %call3 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %3, ptr noundef @.str.22, ptr noundef %4, ptr noundef %5)
  %6 = load ptr, ptr @stderr, align 8
  %7 = load ptr, ptr %file_name.addr, align 8
  %8 = load i32, ptr %p_line.addr, align 4
  %9 = load i32, ptr %p_col.addr, align 4
  %10 = load ptr, ptr %p_name.addr, align 8
  %11 = load ptr, ptr %ptr.addr, align 8
  %call4 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %6, ptr noundef @.str.23, ptr noundef %7, i32 noundef %8, i32 noundef %9, ptr noundef %10, ptr noundef %11)
  %12 = load i64, ptr @__RV_error_count, align 8
  %inc = add i64 %12, 1
  store i64 %inc, ptr @__RV_error_count, align 8
  br label %if.end5

if.end5:                                          ; preds = %if.then2, %if.end
  %13 = load ptr, ptr %ptr_pmd.addr, align 8
  %tobool = icmp ne ptr %13, null
  br i1 %tobool, label %land.lhs.true, label %if.end12

land.lhs.true:                                    ; preds = %if.end5
  %14 = load i32, ptr %stat, align 4
  %cmp6 = icmp eq i32 %14, 0
  br i1 %cmp6, label %if.then7, label %if.end12

if.then7:                                         ; preds = %land.lhs.true
  %15 = load ptr, ptr @stderr, align 8
  %16 = load ptr, ptr %file_name.addr, align 8
  %17 = load ptr, ptr %func_name.addr, align 8
  %call8 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %15, ptr noundef @.str.22, ptr noundef %16, ptr noundef %17)
  %18 = load ptr, ptr @stderr, align 8
  %19 = load ptr, ptr %file_name.addr, align 8
  %20 = load i32, ptr %p_line.addr, align 4
  %21 = load i32, ptr %p_col.addr, align 4
  %22 = load ptr, ptr %p_name.addr, align 8
  %23 = load ptr, ptr %ptr.addr, align 8
  %24 = load ptr, ptr %ptr_pmd.addr, align 8
  %base = getelementptr inbounds %struct.__RV_pmd, ptr %24, i32 0, i32 0
  %25 = load ptr, ptr %base, align 8
  %26 = load ptr, ptr %ptr_pmd.addr, align 8
  %bound9 = getelementptr inbounds %struct.__RV_pmd, ptr %26, i32 0, i32 1
  %27 = load ptr, ptr %bound9, align 8
  %call10 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %18, ptr noundef @.str.24, ptr noundef %19, i32 noundef %20, i32 noundef %21, ptr noundef %22, ptr noundef %23, ptr noundef %25, ptr noundef %27)
  %28 = load i64, ptr @__RV_error_count, align 8
  %inc11 = add i64 %28, 1
  store i64 %inc11, ptr @__RV_error_count, align 8
  br label %if.end12

if.end12:                                         ; preds = %if.then7, %land.lhs.true, %if.end5
  %29 = load ptr, ptr %ptr_pmd.addr, align 8
  %tobool13 = icmp ne ptr %29, null
  br i1 %tobool13, label %land.lhs.true14, label %if.end24

land.lhs.true14:                                  ; preds = %if.end12
  %30 = load i32, ptr %stat, align 4
  %cmp15 = icmp ne i32 %30, 4
  br i1 %cmp15, label %land.lhs.true16, label %if.end24

land.lhs.true16:                                  ; preds = %land.lhs.true14
  %31 = load i32, ptr %stat, align 4
  %cmp17 = icmp ne i32 %31, 6
  br i1 %cmp17, label %if.then18, label %if.end24

if.then18:                                        ; preds = %land.lhs.true16
  %32 = load ptr, ptr @stderr, align 8
  %33 = load ptr, ptr %file_name.addr, align 8
  %34 = load ptr, ptr %func_name.addr, align 8
  %call19 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %32, ptr noundef @.str.22, ptr noundef %33, ptr noundef %34)
  %35 = load ptr, ptr @stderr, align 8
  %36 = load ptr, ptr %file_name.addr, align 8
  %37 = load i32, ptr %p_line.addr, align 4
  %38 = load i32, ptr %p_col.addr, align 4
  %39 = load ptr, ptr %p_name.addr, align 8
  %40 = load ptr, ptr %ptr.addr, align 8
  %41 = load ptr, ptr %ptr_pmd.addr, align 8
  %base20 = getelementptr inbounds %struct.__RV_pmd, ptr %41, i32 0, i32 0
  %42 = load ptr, ptr %base20, align 8
  %43 = load ptr, ptr %ptr_pmd.addr, align 8
  %bound21 = getelementptr inbounds %struct.__RV_pmd, ptr %43, i32 0, i32 1
  %44 = load ptr, ptr %bound21, align 8
  %call22 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %35, ptr noundef @.str.25, ptr noundef %36, i32 noundef %37, i32 noundef %38, ptr noundef %39, ptr noundef %40, ptr noundef %42, ptr noundef %44)
  %45 = load i64, ptr @__RV_error_count, align 8
  %inc23 = add i64 %45, 1
  store i64 %inc23, ptr @__RV_error_count, align 8
  br label %if.end24

if.end24:                                         ; preds = %if.then18, %land.lhs.true16, %land.lhs.true14, %if.end12
  %46 = load ptr, ptr %ptr_pmd.addr, align 8
  %tobool25 = icmp ne ptr %46, null
  br i1 %tobool25, label %land.lhs.true26, label %if.end35

land.lhs.true26:                                  ; preds = %if.end24
  %47 = load ptr, ptr %ptr.addr, align 8
  %48 = load ptr, ptr %ptr_pmd.addr, align 8
  %base27 = getelementptr inbounds %struct.__RV_pmd, ptr %48, i32 0, i32 0
  %49 = load ptr, ptr %base27, align 8
  %cmp28 = icmp ne ptr %47, %49
  br i1 %cmp28, label %if.then29, label %if.end35

if.then29:                                        ; preds = %land.lhs.true26
  %50 = load ptr, ptr @stderr, align 8
  %51 = load ptr, ptr %file_name.addr, align 8
  %52 = load ptr, ptr %func_name.addr, align 8
  %call30 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %50, ptr noundef @.str.22, ptr noundef %51, ptr noundef %52)
  %53 = load ptr, ptr @stderr, align 8
  %54 = load ptr, ptr %file_name.addr, align 8
  %55 = load i32, ptr %p_line.addr, align 4
  %56 = load i32, ptr %p_col.addr, align 4
  %57 = load ptr, ptr %p_name.addr, align 8
  %58 = load ptr, ptr %ptr.addr, align 8
  %59 = load ptr, ptr %ptr_pmd.addr, align 8
  %base31 = getelementptr inbounds %struct.__RV_pmd, ptr %59, i32 0, i32 0
  %60 = load ptr, ptr %base31, align 8
  %61 = load ptr, ptr %ptr_pmd.addr, align 8
  %bound32 = getelementptr inbounds %struct.__RV_pmd, ptr %61, i32 0, i32 1
  %62 = load ptr, ptr %bound32, align 8
  %call33 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %53, ptr noundef @.str.26, ptr noundef %54, i32 noundef %55, i32 noundef %56, ptr noundef %57, ptr noundef %58, ptr noundef %60, ptr noundef %62)
  %63 = load i64, ptr @__RV_error_count, align 8
  %inc34 = add i64 %63, 1
  store i64 %inc34, ptr @__RV_error_count, align 8
  br label %if.end35

if.end35:                                         ; preds = %if.then29, %land.lhs.true26, %if.end24
  %64 = load ptr, ptr %ptr.addr, align 8
  call void @free(ptr noundef %64) #13
  %65 = load ptr, ptr %ptr_pmd.addr, align 8
  %tobool36 = icmp ne ptr %65, null
  br i1 %tobool36, label %if.then37, label %if.end42

if.then37:                                        ; preds = %if.end35
  %66 = load ptr, ptr %ptr_pmd.addr, align 8
  %call38 = call i32 @__RV_pmd_get_stat(ptr noundef %66)
  %cmp39 = icmp eq i32 %call38, 4
  br i1 %cmp39, label %if.then40, label %if.end41

if.then40:                                        ; preds = %if.then37
  %67 = load ptr, ptr %ptr_pmd.addr, align 8
  call void @__RV_pmd_set_stat(ptr noundef %67, i32 noundef 0)
  br label %if.end41

if.end41:                                         ; preds = %if.then40, %if.then37
  br label %if.end42

if.end42:                                         ; preds = %if.end41, %if.end35
  %68 = load ptr, ptr %ptr_pmd.addr, align 8
  %call43 = call ptr @__RV_pmd_get_bound(ptr noundef %68)
  store ptr %call43, ptr %bound, align 8
  %69 = load ptr, ptr %ptr.addr, align 8
  store ptr %69, ptr %p, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end42
  %70 = load ptr, ptr %p, align 8
  %71 = load ptr, ptr %bound, align 8
  %cmp44 = icmp ult ptr %70, %71
  br i1 %cmp44, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i8 0, ptr %ptr_pmd_freed, align 1
  %72 = load ptr, ptr %p, align 8
  call void @__RV_pmd_tbl_remove(ptr noundef %72)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %73 = load ptr, ptr %p, align 8
  %add.ptr = getelementptr inbounds i8, ptr %73, i64 8
  store ptr %add.ptr, ptr %p, align 8
  br label %for.cond, !llvm.loop !32

for.end:                                          ; preds = %for.cond
  %74 = load i8, ptr %ptr_pmd_freed, align 1
  %tobool45 = icmp ne i8 %74, 0
  br i1 %tobool45, label %if.end47, label %if.then46

if.then46:                                        ; preds = %for.end
  %75 = load ptr, ptr %ptr_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %75)
  br label %if.end47

if.end47:                                         ; preds = %if.then, %if.then46, %for.end
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_getenv(ptr noundef %ret_pmd, ptr noundef %name_pmd, ptr noundef %name, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %n_line, i32 noundef %n_col, ptr noundef %n_name) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %name_pmd.addr = alloca ptr, align 8
  %name.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %n_line.addr = alloca i32, align 4
  %n_col.addr = alloca i32, align 4
  %n_name.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store ptr %name_pmd, ptr %name_pmd.addr, align 8
  store ptr %name, ptr %name.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %n_line, ptr %n_line.addr, align 4
  store i32 %n_col, ptr %n_col.addr, align 4
  store ptr %n_name, ptr %n_name.addr, align 8
  %0 = load ptr, ptr %name_pmd.addr, align 8
  %1 = load ptr, ptr %name.addr, align 8
  %2 = load ptr, ptr %name.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %n_line.addr, align 4
  %6 = load i32, ptr %n_col.addr, align 4
  %7 = load ptr, ptr %n_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %name.addr, align 8
  %call2 = call ptr @getenv(ptr noundef %8) #13
  store ptr %call2, ptr %ret, align 8
  %9 = load ptr, ptr %ret, align 8
  %cmp = icmp eq ptr %9, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %10 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %10)
  br label %if.end

if.else:                                          ; preds = %entry
  %11 = load ptr, ptr %ret_pmd.addr, align 8
  %12 = load ptr, ptr @__RV_global_sa, align 8
  %13 = load ptr, ptr %ret, align 8
  %14 = load ptr, ptr %ret, align 8
  %15 = load ptr, ptr %ret, align 8
  %call4 = call i32 @__RV_sstrlen(ptr noundef %15)
  %idx.ext = sext i32 %call4 to i64
  %add.ptr = getelementptr inbounds i8, ptr %14, i64 %idx.ext
  %add.ptr5 = getelementptr inbounds i8, ptr %add.ptr, i64 1
  %call6 = call ptr @__RV_pmd_set(ptr noundef %11, ptr noundef %12, i32 noundef 0, ptr noundef %13, ptr noundef %add.ptr5)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %16 = load ptr, ptr %name_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %16)
  %17 = load ptr, ptr %ret, align 8
  ret ptr %17
}

; Function Attrs: nounwind
declare ptr @getenv(ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_malloc(ptr noundef %ret_pmd, i64 noundef %size) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %size.addr = alloca i64, align 8
  %ret = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store i64 %size, ptr %size.addr, align 8
  %0 = load i64, ptr %size.addr, align 8
  %call = call noalias ptr @malloc(i64 noundef %0) #12
  store ptr %call, ptr %ret, align 8
  %1 = load ptr, ptr %ret, align 8
  %cmp = icmp eq ptr %1, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %2)
  br label %if.end

if.else:                                          ; preds = %entry
  %3 = load ptr, ptr %ret_pmd.addr, align 8
  %4 = load ptr, ptr %ret, align 8
  %5 = load ptr, ptr %ret, align 8
  %6 = load i64, ptr %size.addr, align 8
  %add.ptr = getelementptr inbounds i8, ptr %5, i64 %6
  %call1 = call ptr @__RV_pmd_set(ptr noundef %3, ptr noundef null, i32 noundef 4, ptr noundef %4, ptr noundef %add.ptr)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %7 = load ptr, ptr %ret, align 8
  ret ptr %7
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_mblen(ptr noundef %str_pmd, ptr noundef %str, i64 noundef %n, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %str_pmd.addr = alloca ptr, align 8
  %str.addr = alloca ptr, align 8
  %n.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  store ptr %str_pmd, ptr %str_pmd.addr, align 8
  store ptr %str, ptr %str.addr, align 8
  store i64 %n, ptr %n.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  %0 = load ptr, ptr %str_pmd.addr, align 8
  %1 = load ptr, ptr %str.addr, align 8
  %2 = load ptr, ptr %str.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %str_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %8)
  %9 = load ptr, ptr %str.addr, align 8
  %10 = load i64, ptr %n.addr, align 8
  %call2 = call i32 @mblen(ptr noundef %9, i64 noundef %10) #13
  ret i32 %call2
}

; Function Attrs: nounwind
declare i32 @mblen(ptr noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @_RV_mbstowcs(ptr noundef %pwcs_pmd, ptr noundef %str_pmd, ptr noundef %pwcs, ptr noundef %str, i64 noundef %n, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %p_line, i32 noundef %p_col, ptr noundef %p_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %pwcs_pmd.addr = alloca ptr, align 8
  %str_pmd.addr = alloca ptr, align 8
  %pwcs.addr = alloca ptr, align 8
  %str.addr = alloca ptr, align 8
  %n.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %p_line.addr = alloca i32, align 4
  %p_col.addr = alloca i32, align 4
  %p_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  store ptr %pwcs_pmd, ptr %pwcs_pmd.addr, align 8
  store ptr %str_pmd, ptr %str_pmd.addr, align 8
  store ptr %pwcs, ptr %pwcs.addr, align 8
  store ptr %str, ptr %str.addr, align 8
  store i64 %n, ptr %n.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %p_line, ptr %p_line.addr, align 4
  store i32 %p_col, ptr %p_col.addr, align 4
  store ptr %p_name, ptr %p_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  %0 = load ptr, ptr %pwcs_pmd.addr, align 8
  %1 = load ptr, ptr %pwcs.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %p_line.addr, align 4
  %5 = load i32, ptr %p_col.addr, align 4
  %6 = load ptr, ptr %p_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 4, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %str_pmd.addr, align 8
  %8 = load ptr, ptr %str.addr, align 8
  %9 = load ptr, ptr %str.addr, align 8
  %call1 = call i32 @__RV_sstrlen(ptr noundef %9)
  %add = add nsw i32 %call1, 1
  %conv = sext i32 %add to i64
  %10 = load ptr, ptr %file_name.addr, align 8
  %11 = load ptr, ptr %func_name.addr, align 8
  %12 = load i32, ptr %s_line.addr, align 4
  %13 = load i32, ptr %s_col.addr, align 4
  %14 = load ptr, ptr %s_name.addr, align 8
  %call2 = call ptr @__RV_check_dpv(ptr noundef %7, ptr noundef %8, i64 noundef %conv, ptr noundef %10, ptr noundef %11, i32 noundef %12, i32 noundef %13, ptr noundef %14)
  %15 = load ptr, ptr %pwcs_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %15)
  %16 = load ptr, ptr %str_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %16)
  %17 = load ptr, ptr %pwcs.addr, align 8
  %18 = load ptr, ptr %str.addr, align 8
  %19 = load i64, ptr %n.addr, align 8
  %call3 = call i64 @mbstowcs(ptr noundef %17, ptr noundef %18, i64 noundef %19) #13
  ret i64 %call3
}

; Function Attrs: nounwind
declare i64 @mbstowcs(ptr noundef, ptr noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_mbtowc(ptr noundef %pwc_pmd, ptr noundef %str_pmd, ptr noundef %pwc, ptr noundef %str, i64 noundef %n, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %p_line, i32 noundef %p_col, ptr noundef %p_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %pwc_pmd.addr = alloca ptr, align 8
  %str_pmd.addr = alloca ptr, align 8
  %pwc.addr = alloca ptr, align 8
  %str.addr = alloca ptr, align 8
  %n.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %p_line.addr = alloca i32, align 4
  %p_col.addr = alloca i32, align 4
  %p_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  store ptr %pwc_pmd, ptr %pwc_pmd.addr, align 8
  store ptr %str_pmd, ptr %str_pmd.addr, align 8
  store ptr %pwc, ptr %pwc.addr, align 8
  store ptr %str, ptr %str.addr, align 8
  store i64 %n, ptr %n.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %p_line, ptr %p_line.addr, align 4
  store i32 %p_col, ptr %p_col.addr, align 4
  store ptr %p_name, ptr %p_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  %0 = load ptr, ptr %pwc_pmd.addr, align 8
  %1 = load ptr, ptr %pwc.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %p_line.addr, align 4
  %5 = load i32, ptr %p_col.addr, align 4
  %6 = load ptr, ptr %p_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 4, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %str_pmd.addr, align 8
  %8 = load ptr, ptr %str.addr, align 8
  %9 = load ptr, ptr %str.addr, align 8
  %call1 = call i32 @__RV_sstrlen(ptr noundef %9)
  %add = add nsw i32 %call1, 1
  %conv = sext i32 %add to i64
  %10 = load ptr, ptr %file_name.addr, align 8
  %11 = load ptr, ptr %func_name.addr, align 8
  %12 = load i32, ptr %s_line.addr, align 4
  %13 = load i32, ptr %s_col.addr, align 4
  %14 = load ptr, ptr %s_name.addr, align 8
  %call2 = call ptr @__RV_check_dpv(ptr noundef %7, ptr noundef %8, i64 noundef %conv, ptr noundef %10, ptr noundef %11, i32 noundef %12, i32 noundef %13, ptr noundef %14)
  %15 = load ptr, ptr %pwc_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %15)
  %16 = load ptr, ptr %str_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %16)
  %17 = load ptr, ptr %pwc.addr, align 8
  %18 = load ptr, ptr %str.addr, align 8
  %19 = load i64, ptr %n.addr, align 8
  %call3 = call i32 @mbtowc(ptr noundef %17, ptr noundef %18, i64 noundef %19) #13
  ret i32 %call3
}

; Function Attrs: nounwind
declare i32 @mbtowc(ptr noundef, ptr noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_putenv(ptr noundef %str_pmd, ptr noundef %__string, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %str_pmd.addr = alloca ptr, align 8
  %__string.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  store ptr %str_pmd, ptr %str_pmd.addr, align 8
  store ptr %__string, ptr %__string.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  %0 = load ptr, ptr %str_pmd.addr, align 8
  %1 = load ptr, ptr %__string.addr, align 8
  %2 = load ptr, ptr %__string.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %str_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %8)
  %9 = load ptr, ptr %__string.addr, align 8
  %call2 = call i32 @putenv(ptr noundef %9) #13
  ret i32 %call2
}

; Function Attrs: nounwind
declare i32 @putenv(ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_RV_qsort(ptr noundef %base_pmd, ptr noundef %compar_pmd, ptr noundef %base, i64 noundef %num, i64 noundef %size, ptr noundef %compar, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %b_line, i32 noundef %b_col, ptr noundef %b_name, i32 noundef %c_line, i32 noundef %c_col, ptr noundef %c_name) #0 {
entry:
  %base_pmd.addr = alloca ptr, align 8
  %compar_pmd.addr = alloca ptr, align 8
  %base.addr = alloca ptr, align 8
  %num.addr = alloca i64, align 8
  %size.addr = alloca i64, align 8
  %compar.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %b_line.addr = alloca i32, align 4
  %b_col.addr = alloca i32, align 4
  %b_name.addr = alloca ptr, align 8
  %c_line.addr = alloca i32, align 4
  %c_col.addr = alloca i32, align 4
  %c_name.addr = alloca ptr, align 8
  store ptr %base_pmd, ptr %base_pmd.addr, align 8
  store ptr %compar_pmd, ptr %compar_pmd.addr, align 8
  store ptr %base, ptr %base.addr, align 8
  store i64 %num, ptr %num.addr, align 8
  store i64 %size, ptr %size.addr, align 8
  store ptr %compar, ptr %compar.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %b_line, ptr %b_line.addr, align 4
  store i32 %b_col, ptr %b_col.addr, align 4
  store ptr %b_name, ptr %b_name.addr, align 8
  store i32 %c_line, ptr %c_line.addr, align 4
  store i32 %c_col, ptr %c_col.addr, align 4
  store ptr %c_name, ptr %c_name.addr, align 8
  %0 = load ptr, ptr %base_pmd.addr, align 8
  %1 = load ptr, ptr %base.addr, align 8
  %2 = load i64, ptr %num.addr, align 8
  %3 = load i64, ptr %size.addr, align 8
  %mul = mul i64 %2, %3
  %4 = load ptr, ptr %file_name.addr, align 8
  %5 = load ptr, ptr %func_name.addr, align 8
  %6 = load i32, ptr %b_line.addr, align 4
  %7 = load i32, ptr %b_col.addr, align 4
  %8 = load ptr, ptr %b_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %mul, ptr noundef %4, ptr noundef %5, i32 noundef %6, i32 noundef %7, ptr noundef %8)
  %9 = load ptr, ptr %compar_pmd.addr, align 8
  %10 = load ptr, ptr %compar.addr, align 8
  %11 = load ptr, ptr %file_name.addr, align 8
  %12 = load ptr, ptr %func_name.addr, align 8
  %13 = load i32, ptr %c_line.addr, align 4
  %14 = load i32, ptr %c_col.addr, align 4
  %15 = load ptr, ptr %c_name.addr, align 8
  %call1 = call ptr @__RV_check_dpfv(ptr noundef %9, ptr noundef %10, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, ptr noundef %15)
  %16 = load ptr, ptr %compar.addr, align 8
  %call2 = call ptr @__RV_fmd_tbl_create(ptr noundef %16, i8 noundef zeroext 2)
  %17 = load ptr, ptr %compar.addr, align 8
  %18 = load ptr, ptr %base_pmd.addr, align 8
  %call3 = call ptr @__RV_fmd_tbl_update_pmd(ptr noundef %17, i8 noundef zeroext 0, ptr noundef %18)
  %19 = load ptr, ptr %compar.addr, align 8
  %20 = load ptr, ptr %base_pmd.addr, align 8
  %call4 = call ptr @__RV_fmd_tbl_update_pmd(ptr noundef %19, i8 noundef zeroext 1, ptr noundef %20)
  %21 = load ptr, ptr %base.addr, align 8
  %22 = load i64, ptr %num.addr, align 8
  %23 = load i64, ptr %size.addr, align 8
  %24 = load ptr, ptr %compar.addr, align 8
  call void @qsort(ptr noundef %21, i64 noundef %22, i64 noundef %23, ptr noundef %24)
  %25 = load ptr, ptr %compar.addr, align 8
  call void @__RV_fmd_tbl_remove(ptr noundef %25)
  %26 = load ptr, ptr %base_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %26)
  %27 = load ptr, ptr %compar_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %27)
  ret void
}

declare void @qsort(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_realloc(ptr noundef %ret_pmd, ptr noundef %ptr_pmd, ptr noundef %ptr, i64 noundef %newsize, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %p_line, i32 noundef %p_col, ptr noundef %p_name) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %ptr_pmd.addr = alloca ptr, align 8
  %ptr.addr = alloca ptr, align 8
  %newsize.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %p_line.addr = alloca i32, align 4
  %p_col.addr = alloca i32, align 4
  %p_name.addr = alloca ptr, align 8
  %ptr_pmd_freed = alloca i8, align 1
  %bound = alloca ptr, align 8
  %p = alloca ptr, align 8
  %p_pmd = alloca ptr, align 8
  %ret = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store ptr %ptr_pmd, ptr %ptr_pmd.addr, align 8
  store ptr %ptr, ptr %ptr.addr, align 8
  store i64 %newsize, ptr %newsize.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %p_line, ptr %p_line.addr, align 4
  store i32 %p_col, ptr %p_col.addr, align 4
  store ptr %p_name, ptr %p_name.addr, align 8
  store i8 0, ptr %ptr_pmd_freed, align 1
  %0 = load ptr, ptr %ptr.addr, align 8
  %1 = load i64, ptr %newsize.addr, align 8
  %call = call ptr @realloc(ptr noundef %0, i64 noundef %1) #17
  store ptr %call, ptr %ret, align 8
  %2 = load ptr, ptr %ret, align 8
  %3 = load ptr, ptr %ptr.addr, align 8
  %cmp = icmp eq ptr %2, %3
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %4 = load ptr, ptr %ptr_pmd.addr, align 8
  call void @__RV_pmd_set_stat(ptr noundef %4, i32 noundef 4)
  %5 = load ptr, ptr %ptr_pmd.addr, align 8
  %6 = load ptr, ptr %ret, align 8
  call void @__RV_pmd_set_base(ptr noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %ptr_pmd.addr, align 8
  %8 = load ptr, ptr %ret, align 8
  %9 = load i64, ptr %newsize.addr, align 8
  %add.ptr = getelementptr inbounds i8, ptr %8, i64 %9
  call void @__RV_pmd_set_bound(ptr noundef %7, ptr noundef %add.ptr)
  %10 = load ptr, ptr %ret_pmd.addr, align 8
  %11 = load ptr, ptr %ptr_pmd.addr, align 8
  %call1 = call ptr @__RV_pmd_cp_pmd(ptr noundef %10, ptr noundef %11)
  br label %if.end18

if.else:                                          ; preds = %entry
  %12 = load ptr, ptr %ptr_pmd.addr, align 8
  %tobool = icmp ne ptr %12, null
  br i1 %tobool, label %if.then2, label %if.end6

if.then2:                                         ; preds = %if.else
  %13 = load ptr, ptr %ptr_pmd.addr, align 8
  %call3 = call i32 @__RV_pmd_get_stat(ptr noundef %13)
  %cmp4 = icmp eq i32 %call3, 4
  br i1 %cmp4, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.then2
  %14 = load ptr, ptr %ptr_pmd.addr, align 8
  call void @__RV_pmd_set_stat(ptr noundef %14, i32 noundef 0)
  br label %if.end

if.end:                                           ; preds = %if.then5, %if.then2
  br label %if.end6

if.end6:                                          ; preds = %if.end, %if.else
  %15 = load ptr, ptr %ptr_pmd.addr, align 8
  %call7 = call ptr @__RV_pmd_get_bound(ptr noundef %15)
  store ptr %call7, ptr %bound, align 8
  %16 = load ptr, ptr %ptr.addr, align 8
  store ptr %16, ptr %p, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end6
  %17 = load ptr, ptr %p, align 8
  %18 = load ptr, ptr %bound, align 8
  %cmp8 = icmp ult ptr %17, %18
  br i1 %cmp8, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %19 = load ptr, ptr %p, align 8
  %call9 = call ptr @__RV_pmd_tbl_lookup(ptr noundef %19)
  store ptr %call9, ptr %p_pmd, align 8
  %20 = load ptr, ptr %p_pmd, align 8
  %tobool10 = icmp ne ptr %20, null
  br i1 %tobool10, label %if.then11, label %if.end14

if.then11:                                        ; preds = %for.body
  %21 = load ptr, ptr %ret, align 8
  %22 = load ptr, ptr %p, align 8
  %23 = load ptr, ptr %ptr.addr, align 8
  %sub.ptr.lhs.cast = ptrtoint ptr %22 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %23 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %add.ptr12 = getelementptr inbounds i8, ptr %21, i64 %sub.ptr.sub
  %24 = load ptr, ptr %p_pmd, align 8
  %call13 = call ptr @__RV_pmd_tbl_update_pmd(ptr noundef %add.ptr12, ptr noundef %24)
  store i8 0, ptr %ptr_pmd_freed, align 1
  %25 = load ptr, ptr %p, align 8
  call void @__RV_pmd_tbl_remove(ptr noundef %25)
  br label %if.end14

if.end14:                                         ; preds = %if.then11, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end14
  %26 = load ptr, ptr %p, align 8
  %add.ptr15 = getelementptr inbounds i8, ptr %26, i64 8
  store ptr %add.ptr15, ptr %p, align 8
  br label %for.cond, !llvm.loop !33

for.end:                                          ; preds = %for.cond
  %27 = load ptr, ptr %ret_pmd.addr, align 8
  %28 = load ptr, ptr %ret, align 8
  %29 = load ptr, ptr %ret, align 8
  %30 = load i64, ptr %newsize.addr, align 8
  %add.ptr16 = getelementptr inbounds i8, ptr %29, i64 %30
  %call17 = call ptr @__RV_pmd_set(ptr noundef %27, ptr noundef null, i32 noundef 4, ptr noundef %28, ptr noundef %add.ptr16)
  br label %if.end18

if.end18:                                         ; preds = %for.end, %if.then
  %31 = load i8, ptr %ptr_pmd_freed, align 1
  %tobool19 = icmp ne i8 %31, 0
  br i1 %tobool19, label %if.end21, label %if.then20

if.then20:                                        ; preds = %if.end18
  %32 = load ptr, ptr %ptr_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %32)
  br label %if.end21

if.end21:                                         ; preds = %if.then20, %if.end18
  %33 = load ptr, ptr %ret, align 8
  ret ptr %33
}

; Function Attrs: nounwind allocsize(1)
declare ptr @realloc(ptr noundef, i64 noundef) #7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @_RV_strtod(ptr noundef %str_pmd, ptr noundef %endptr_pmd, ptr noundef %str, ptr noundef %endptr, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name, i32 noundef %e_line, i32 noundef %e_col, ptr noundef %e_name) #0 {
entry:
  %str_pmd.addr = alloca ptr, align 8
  %endptr_pmd.addr = alloca ptr, align 8
  %str.addr = alloca ptr, align 8
  %endptr.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  %e_line.addr = alloca i32, align 4
  %e_col.addr = alloca i32, align 4
  %e_name.addr = alloca ptr, align 8
  %tmp = alloca double, align 8
  store ptr %str_pmd, ptr %str_pmd.addr, align 8
  store ptr %endptr_pmd, ptr %endptr_pmd.addr, align 8
  store ptr %str, ptr %str.addr, align 8
  store ptr %endptr, ptr %endptr.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  store i32 %e_line, ptr %e_line.addr, align 4
  store i32 %e_col, ptr %e_col.addr, align 4
  store ptr %e_name, ptr %e_name.addr, align 8
  %0 = load ptr, ptr %str_pmd.addr, align 8
  %1 = load ptr, ptr %str.addr, align 8
  %2 = load ptr, ptr %str.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %endptr.addr, align 8
  %tobool = icmp ne ptr %8, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %9 = load ptr, ptr %endptr_pmd.addr, align 8
  %10 = load ptr, ptr %endptr.addr, align 8
  %11 = load ptr, ptr %file_name.addr, align 8
  %12 = load ptr, ptr %func_name.addr, align 8
  %13 = load i32, ptr %e_line.addr, align 4
  %14 = load i32, ptr %e_col.addr, align 4
  %15 = load ptr, ptr %e_name.addr, align 8
  %call2 = call ptr @__RV_check_dpv(ptr noundef %9, ptr noundef %10, i64 noundef 8, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, ptr noundef %15)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %16 = load ptr, ptr %str.addr, align 8
  %17 = load ptr, ptr %endptr.addr, align 8
  %call3 = call double @strtod(ptr noundef %16, ptr noundef %17) #13
  store double %call3, ptr %tmp, align 8
  %18 = load ptr, ptr %endptr.addr, align 8
  %tobool4 = icmp ne ptr %18, null
  br i1 %tobool4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.end
  %19 = load ptr, ptr %endptr.addr, align 8
  %20 = load ptr, ptr %str_pmd.addr, align 8
  %call6 = call ptr @__RV_pmd_tbl_update_pmd(ptr noundef %19, ptr noundef %20)
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.end
  %21 = load ptr, ptr %str_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %21)
  %22 = load ptr, ptr %endptr_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %22)
  %23 = load double, ptr %tmp, align 8
  ret double %23
}

; Function Attrs: nounwind
declare double @strtod(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @_RV_strtol(ptr noundef %str_pmd, ptr noundef %endptr_pmd, ptr noundef %str, ptr noundef %endptr, i32 noundef %base, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name, i32 noundef %e_line, i32 noundef %e_col, ptr noundef %e_name) #0 {
entry:
  %str_pmd.addr = alloca ptr, align 8
  %endptr_pmd.addr = alloca ptr, align 8
  %str.addr = alloca ptr, align 8
  %endptr.addr = alloca ptr, align 8
  %base.addr = alloca i32, align 4
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  %e_line.addr = alloca i32, align 4
  %e_col.addr = alloca i32, align 4
  %e_name.addr = alloca ptr, align 8
  %tmp = alloca i64, align 8
  store ptr %str_pmd, ptr %str_pmd.addr, align 8
  store ptr %endptr_pmd, ptr %endptr_pmd.addr, align 8
  store ptr %str, ptr %str.addr, align 8
  store ptr %endptr, ptr %endptr.addr, align 8
  store i32 %base, ptr %base.addr, align 4
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  store i32 %e_line, ptr %e_line.addr, align 4
  store i32 %e_col, ptr %e_col.addr, align 4
  store ptr %e_name, ptr %e_name.addr, align 8
  %0 = load ptr, ptr %str_pmd.addr, align 8
  %1 = load ptr, ptr %str.addr, align 8
  %2 = load ptr, ptr %str.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %endptr.addr, align 8
  %tobool = icmp ne ptr %8, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %9 = load ptr, ptr %endptr_pmd.addr, align 8
  %10 = load ptr, ptr %endptr.addr, align 8
  %11 = load ptr, ptr %file_name.addr, align 8
  %12 = load ptr, ptr %func_name.addr, align 8
  %13 = load i32, ptr %e_line.addr, align 4
  %14 = load i32, ptr %e_col.addr, align 4
  %15 = load ptr, ptr %e_name.addr, align 8
  %call2 = call ptr @__RV_check_dpv(ptr noundef %9, ptr noundef %10, i64 noundef 8, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, ptr noundef %15)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %16 = load ptr, ptr %str.addr, align 8
  %17 = load ptr, ptr %endptr.addr, align 8
  %18 = load i32, ptr %base.addr, align 4
  %call3 = call i64 @strtol(ptr noundef %16, ptr noundef %17, i32 noundef %18) #13
  store i64 %call3, ptr %tmp, align 8
  %19 = load ptr, ptr %endptr.addr, align 8
  %tobool4 = icmp ne ptr %19, null
  br i1 %tobool4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.end
  %20 = load ptr, ptr %endptr.addr, align 8
  %21 = load ptr, ptr %str_pmd.addr, align 8
  %call6 = call ptr @__RV_pmd_tbl_update_pmd(ptr noundef %20, ptr noundef %21)
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.end
  %22 = load ptr, ptr %str_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %22)
  %23 = load ptr, ptr %endptr_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %23)
  %24 = load i64, ptr %tmp, align 8
  ret i64 %24
}

; Function Attrs: nounwind
declare i64 @strtol(ptr noundef, ptr noundef, i32 noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @_RV_strtoul(ptr noundef %str_pmd, ptr noundef %endptr_pmd, ptr noundef %str, ptr noundef %endptr, i32 noundef %base, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name, i32 noundef %e_line, i32 noundef %e_col, ptr noundef %e_name) #0 {
entry:
  %str_pmd.addr = alloca ptr, align 8
  %endptr_pmd.addr = alloca ptr, align 8
  %str.addr = alloca ptr, align 8
  %endptr.addr = alloca ptr, align 8
  %base.addr = alloca i32, align 4
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  %e_line.addr = alloca i32, align 4
  %e_col.addr = alloca i32, align 4
  %e_name.addr = alloca ptr, align 8
  %tmp = alloca i64, align 8
  store ptr %str_pmd, ptr %str_pmd.addr, align 8
  store ptr %endptr_pmd, ptr %endptr_pmd.addr, align 8
  store ptr %str, ptr %str.addr, align 8
  store ptr %endptr, ptr %endptr.addr, align 8
  store i32 %base, ptr %base.addr, align 4
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  store i32 %e_line, ptr %e_line.addr, align 4
  store i32 %e_col, ptr %e_col.addr, align 4
  store ptr %e_name, ptr %e_name.addr, align 8
  %0 = load ptr, ptr %str_pmd.addr, align 8
  %1 = load ptr, ptr %str.addr, align 8
  %2 = load ptr, ptr %str.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %endptr.addr, align 8
  %tobool = icmp ne ptr %8, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %9 = load ptr, ptr %endptr_pmd.addr, align 8
  %10 = load ptr, ptr %endptr.addr, align 8
  %11 = load ptr, ptr %file_name.addr, align 8
  %12 = load ptr, ptr %func_name.addr, align 8
  %13 = load i32, ptr %e_line.addr, align 4
  %14 = load i32, ptr %e_col.addr, align 4
  %15 = load ptr, ptr %e_name.addr, align 8
  %call2 = call ptr @__RV_check_dpv(ptr noundef %9, ptr noundef %10, i64 noundef 8, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, ptr noundef %15)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %16 = load ptr, ptr %str.addr, align 8
  %17 = load ptr, ptr %endptr.addr, align 8
  %18 = load i32, ptr %base.addr, align 4
  %call3 = call i64 @strtoul(ptr noundef %16, ptr noundef %17, i32 noundef %18) #13
  store i64 %call3, ptr %tmp, align 8
  %19 = load ptr, ptr %endptr.addr, align 8
  %tobool4 = icmp ne ptr %19, null
  br i1 %tobool4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.end
  %20 = load ptr, ptr %endptr.addr, align 8
  %21 = load ptr, ptr %str_pmd.addr, align 8
  %call6 = call ptr @__RV_pmd_tbl_update_pmd(ptr noundef %20, ptr noundef %21)
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.end
  %22 = load ptr, ptr %str_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %22)
  %23 = load ptr, ptr %endptr_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %23)
  %24 = load i64, ptr %tmp, align 8
  ret i64 %24
}

; Function Attrs: nounwind
declare i64 @strtoul(ptr noundef, ptr noundef, i32 noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_system(ptr noundef %str_pmd, ptr noundef %str, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %str_pmd.addr = alloca ptr, align 8
  %str.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  store ptr %str_pmd, ptr %str_pmd.addr, align 8
  store ptr %str, ptr %str.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  %0 = load ptr, ptr %str_pmd.addr, align 8
  %1 = load ptr, ptr %str.addr, align 8
  %2 = load ptr, ptr %str.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %str_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %8)
  %9 = load ptr, ptr %str.addr, align 8
  %call2 = call i32 @system(ptr noundef %9)
  ret i32 %call2
}

declare i32 @system(ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @_RV_wcstombs(ptr noundef %str_pmd, ptr noundef %pwcs_pmd, ptr noundef %str, ptr noundef %pwcs, i64 noundef %n, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name, i32 noundef %p_line, i32 noundef %p_col, ptr noundef %p_name) #0 {
entry:
  %str_pmd.addr = alloca ptr, align 8
  %pwcs_pmd.addr = alloca ptr, align 8
  %str.addr = alloca ptr, align 8
  %pwcs.addr = alloca ptr, align 8
  %n.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  %p_line.addr = alloca i32, align 4
  %p_col.addr = alloca i32, align 4
  %p_name.addr = alloca ptr, align 8
  store ptr %str_pmd, ptr %str_pmd.addr, align 8
  store ptr %pwcs_pmd, ptr %pwcs_pmd.addr, align 8
  store ptr %str, ptr %str.addr, align 8
  store ptr %pwcs, ptr %pwcs.addr, align 8
  store i64 %n, ptr %n.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  store i32 %p_line, ptr %p_line.addr, align 4
  store i32 %p_col, ptr %p_col.addr, align 4
  store ptr %p_name, ptr %p_name.addr, align 8
  %0 = load ptr, ptr %str_pmd.addr, align 8
  %1 = load ptr, ptr %str.addr, align 8
  %2 = load ptr, ptr %str.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %pwcs_pmd.addr, align 8
  %9 = load ptr, ptr %pwcs.addr, align 8
  %10 = load ptr, ptr %file_name.addr, align 8
  %11 = load ptr, ptr %func_name.addr, align 8
  %12 = load i32, ptr %p_line.addr, align 4
  %13 = load i32, ptr %p_col.addr, align 4
  %14 = load ptr, ptr %p_name.addr, align 8
  %call2 = call ptr @__RV_check_dpv(ptr noundef %8, ptr noundef %9, i64 noundef 4, ptr noundef %10, ptr noundef %11, i32 noundef %12, i32 noundef %13, ptr noundef %14)
  %15 = load ptr, ptr %str_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %15)
  %16 = load ptr, ptr %pwcs_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %16)
  %17 = load ptr, ptr %str.addr, align 8
  %18 = load ptr, ptr %pwcs.addr, align 8
  %19 = load i64, ptr %n.addr, align 8
  %call3 = call i64 @wcstombs(ptr noundef %17, ptr noundef %18, i64 noundef %19) #13
  ret i64 %call3
}

; Function Attrs: nounwind
declare i64 @wcstombs(ptr noundef, ptr noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_wctomb(ptr noundef %str_pmd, ptr noundef %str, i32 noundef %wchar, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %str_pmd.addr = alloca ptr, align 8
  %str.addr = alloca ptr, align 8
  %wchar.addr = alloca i32, align 4
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  store ptr %str_pmd, ptr %str_pmd.addr, align 8
  store ptr %str, ptr %str.addr, align 8
  store i32 %wchar, ptr %wchar.addr, align 4
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  %0 = load ptr, ptr %str_pmd.addr, align 8
  %1 = load ptr, ptr %str.addr, align 8
  %2 = load ptr, ptr %str.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %str_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %8)
  %9 = load ptr, ptr %str.addr, align 8
  %10 = load i32, ptr %wchar.addr, align 4
  %call2 = call i32 @wctomb(ptr noundef %9, i32 noundef %10) #13
  ret i32 %call2
}

; Function Attrs: nounwind
declare i32 @wctomb(ptr noundef, i32 noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_RV_bcopy(ptr noundef %src_pmd, ptr noundef %dest_pmd, ptr noundef %src, ptr noundef %dest, i64 noundef %n, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name, i32 noundef %d_line, i32 noundef %d_col, ptr noundef %d_name) #0 {
entry:
  %src_pmd.addr = alloca ptr, align 8
  %dest_pmd.addr = alloca ptr, align 8
  %src.addr = alloca ptr, align 8
  %dest.addr = alloca ptr, align 8
  %n.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  %d_line.addr = alloca i32, align 4
  %d_col.addr = alloca i32, align 4
  %d_name.addr = alloca ptr, align 8
  %p = alloca ptr, align 8
  %p_pmd = alloca ptr, align 8
  store ptr %src_pmd, ptr %src_pmd.addr, align 8
  store ptr %dest_pmd, ptr %dest_pmd.addr, align 8
  store ptr %src, ptr %src.addr, align 8
  store ptr %dest, ptr %dest.addr, align 8
  store i64 %n, ptr %n.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  store i32 %d_line, ptr %d_line.addr, align 4
  store i32 %d_col, ptr %d_col.addr, align 4
  store ptr %d_name, ptr %d_name.addr, align 8
  %0 = load ptr, ptr %src_pmd.addr, align 8
  %1 = load ptr, ptr %src.addr, align 8
  %2 = load i64, ptr %n.addr, align 8
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %dest_pmd.addr, align 8
  %9 = load ptr, ptr %dest.addr, align 8
  %10 = load i64, ptr %n.addr, align 8
  %11 = load ptr, ptr %file_name.addr, align 8
  %12 = load ptr, ptr %func_name.addr, align 8
  %13 = load i32, ptr %d_line.addr, align 4
  %14 = load i32, ptr %d_col.addr, align 4
  %15 = load ptr, ptr %d_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %8, ptr noundef %9, i64 noundef %10, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, ptr noundef %15)
  %16 = load ptr, ptr %dest.addr, align 8
  %17 = load ptr, ptr %src.addr, align 8
  %cmp = icmp ult ptr %16, %17
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %18 = load i64, ptr %n.addr, align 8
  %cmp2 = icmp ugt i64 %18, 0
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %19 = load ptr, ptr %src.addr, align 8
  %20 = ptrtoint ptr %19 to i64
  %and = and i64 %20, -8
  %21 = inttoptr i64 %and to ptr
  store ptr %21, ptr %p, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %22 = load ptr, ptr %p, align 8
  %23 = load ptr, ptr %src.addr, align 8
  %24 = load i64, ptr %n.addr, align 8
  %add.ptr = getelementptr inbounds i8, ptr %23, i64 %24
  %cmp3 = icmp ult ptr %22, %add.ptr
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %25 = load ptr, ptr %p, align 8
  %26 = load ptr, ptr %src.addr, align 8
  %cmp4 = icmp ult ptr %25, %26
  br i1 %cmp4, label %if.then5, label %if.end

if.then5:                                         ; preds = %for.body
  br label %for.inc

if.end:                                           ; preds = %for.body
  %27 = load ptr, ptr %p, align 8
  %call6 = call ptr @__RV_pmd_tbl_lookup(ptr noundef %27)
  store ptr %call6, ptr %p_pmd, align 8
  %28 = load ptr, ptr %p_pmd, align 8
  %tobool = icmp ne ptr %28, null
  br i1 %tobool, label %if.then7, label %if.end10

if.then7:                                         ; preds = %if.end
  %29 = load ptr, ptr %dest.addr, align 8
  %30 = load ptr, ptr %p, align 8
  %31 = load ptr, ptr %src.addr, align 8
  %sub.ptr.lhs.cast = ptrtoint ptr %30 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %31 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %add.ptr8 = getelementptr inbounds i8, ptr %29, i64 %sub.ptr.sub
  %32 = load ptr, ptr %p_pmd, align 8
  %call9 = call ptr @__RV_pmd_tbl_update_pmd(ptr noundef %add.ptr8, ptr noundef %32)
  br label %if.end10

if.end10:                                         ; preds = %if.then7, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end10, %if.then5
  %33 = load ptr, ptr %p, align 8
  %add.ptr11 = getelementptr inbounds i8, ptr %33, i64 8
  store ptr %add.ptr11, ptr %p, align 8
  br label %for.cond, !llvm.loop !34

for.end:                                          ; preds = %for.cond
  br label %if.end35

if.else:                                          ; preds = %land.lhs.true, %entry
  %34 = load ptr, ptr %dest.addr, align 8
  %35 = load ptr, ptr %src.addr, align 8
  %cmp12 = icmp ugt ptr %34, %35
  br i1 %cmp12, label %land.lhs.true13, label %if.end34

land.lhs.true13:                                  ; preds = %if.else
  %36 = load i64, ptr %n.addr, align 8
  %cmp14 = icmp ugt i64 %36, 0
  br i1 %cmp14, label %if.then15, label %if.end34

if.then15:                                        ; preds = %land.lhs.true13
  %37 = load ptr, ptr %src.addr, align 8
  %38 = load i64, ptr %n.addr, align 8
  %add.ptr16 = getelementptr inbounds i8, ptr %37, i64 %38
  %add.ptr17 = getelementptr inbounds i8, ptr %add.ptr16, i64 -1
  %39 = ptrtoint ptr %add.ptr17 to i64
  %and18 = and i64 %39, -8
  %40 = inttoptr i64 %and18 to ptr
  store ptr %40, ptr %p, align 8
  br label %for.cond19

for.cond19:                                       ; preds = %for.inc31, %if.then15
  %41 = load ptr, ptr %p, align 8
  %42 = load ptr, ptr %src.addr, align 8
  %cmp20 = icmp uge ptr %41, %42
  br i1 %cmp20, label %for.body21, label %for.end33

for.body21:                                       ; preds = %for.cond19
  %43 = load ptr, ptr %p, align 8
  %call22 = call ptr @__RV_pmd_tbl_lookup(ptr noundef %43)
  store ptr %call22, ptr %p_pmd, align 8
  %44 = load ptr, ptr %p_pmd, align 8
  %tobool23 = icmp ne ptr %44, null
  br i1 %tobool23, label %if.then24, label %if.end30

if.then24:                                        ; preds = %for.body21
  %45 = load ptr, ptr %dest.addr, align 8
  %46 = load ptr, ptr %p, align 8
  %47 = load ptr, ptr %src.addr, align 8
  %sub.ptr.lhs.cast25 = ptrtoint ptr %46 to i64
  %sub.ptr.rhs.cast26 = ptrtoint ptr %47 to i64
  %sub.ptr.sub27 = sub i64 %sub.ptr.lhs.cast25, %sub.ptr.rhs.cast26
  %add.ptr28 = getelementptr inbounds i8, ptr %45, i64 %sub.ptr.sub27
  %48 = load ptr, ptr %p_pmd, align 8
  %call29 = call ptr @__RV_pmd_tbl_update_pmd(ptr noundef %add.ptr28, ptr noundef %48)
  br label %if.end30

if.end30:                                         ; preds = %if.then24, %for.body21
  br label %for.inc31

for.inc31:                                        ; preds = %if.end30
  %49 = load ptr, ptr %p, align 8
  %add.ptr32 = getelementptr inbounds i8, ptr %49, i64 -8
  store ptr %add.ptr32, ptr %p, align 8
  br label %for.cond19, !llvm.loop !35

for.end33:                                        ; preds = %for.cond19
  br label %if.end34

if.end34:                                         ; preds = %for.end33, %land.lhs.true13, %if.else
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %for.end
  %50 = load ptr, ptr %dest_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %50)
  %51 = load ptr, ptr %src_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %51)
  %52 = load ptr, ptr %src.addr, align 8
  %53 = load ptr, ptr %dest.addr, align 8
  %54 = load i64, ptr %n.addr, align 8
  call void @bcopy(ptr noundef %52, ptr noundef %53, i64 noundef %54) #13
  ret void
}

; Function Attrs: nounwind
declare void @bcopy(ptr noundef, ptr noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_RV_bzero(ptr noundef %s_pmd, ptr noundef %s, i64 noundef %n, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %s_pmd.addr = alloca ptr, align 8
  %s.addr = alloca ptr, align 8
  %n.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  store ptr %s_pmd, ptr %s_pmd.addr, align 8
  store ptr %s, ptr %s.addr, align 8
  store i64 %n, ptr %n.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  %0 = load ptr, ptr %s_pmd.addr, align 8
  %1 = load ptr, ptr %s.addr, align 8
  %2 = load i64, ptr %n.addr, align 8
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %s_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %8)
  %9 = load ptr, ptr %s.addr, align 8
  %10 = load i64, ptr %n.addr, align 8
  call void @llvm.memset.p0.i64(ptr align 1 %9, i8 0, i64 %10, i1 false)
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_memccpy(ptr noundef %ret_pmd, ptr noundef %dest_pmd, ptr noundef %src_pmd, ptr noundef %dest, ptr noundef %src, i32 noundef %c, i64 noundef %n, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %d_line, i32 noundef %d_col, ptr noundef %d_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %dest_pmd.addr = alloca ptr, align 8
  %src_pmd.addr = alloca ptr, align 8
  %dest.addr = alloca ptr, align 8
  %src.addr = alloca ptr, align 8
  %c.addr = alloca i32, align 4
  %n.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %d_line.addr = alloca i32, align 4
  %d_col.addr = alloca i32, align 4
  %d_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store ptr %dest_pmd, ptr %dest_pmd.addr, align 8
  store ptr %src_pmd, ptr %src_pmd.addr, align 8
  store ptr %dest, ptr %dest.addr, align 8
  store ptr %src, ptr %src.addr, align 8
  store i32 %c, ptr %c.addr, align 4
  store i64 %n, ptr %n.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %d_line, ptr %d_line.addr, align 4
  store i32 %d_col, ptr %d_col.addr, align 4
  store ptr %d_name, ptr %d_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  %0 = load ptr, ptr %src_pmd.addr, align 8
  %1 = load ptr, ptr %src.addr, align 8
  %2 = load i64, ptr %n.addr, align 8
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %dest_pmd.addr, align 8
  %9 = load ptr, ptr %dest.addr, align 8
  %10 = load i64, ptr %n.addr, align 8
  %11 = load ptr, ptr %file_name.addr, align 8
  %12 = load ptr, ptr %func_name.addr, align 8
  %13 = load i32, ptr %d_line.addr, align 4
  %14 = load i32, ptr %d_col.addr, align 4
  %15 = load ptr, ptr %d_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %8, ptr noundef %9, i64 noundef %10, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, ptr noundef %15)
  %16 = load ptr, ptr %dest.addr, align 8
  %17 = load ptr, ptr %src.addr, align 8
  %18 = load i32, ptr %c.addr, align 4
  %19 = load i64, ptr %n.addr, align 8
  %call2 = call ptr @memccpy(ptr noundef %16, ptr noundef %17, i32 noundef %18, i64 noundef %19) #13
  store ptr %call2, ptr %ret, align 8
  %20 = load ptr, ptr %ret, align 8
  %cmp = icmp eq ptr %20, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %21 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %21)
  br label %if.end

if.else:                                          ; preds = %entry
  %22 = load ptr, ptr %ret_pmd.addr, align 8
  %23 = load ptr, ptr %dest_pmd.addr, align 8
  %call3 = call ptr @__RV_pmd_cp_pmd(ptr noundef %22, ptr noundef %23)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %24 = load ptr, ptr %src_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %24)
  %25 = load ptr, ptr %dest_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %25)
  %26 = load ptr, ptr %ret, align 8
  ret ptr %26
}

; Function Attrs: nounwind
declare ptr @memccpy(ptr noundef, ptr noundef, i32 noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_memchr(ptr noundef %ret_pmd, ptr noundef %src_pmd, ptr noundef %src, i32 noundef %c, i64 noundef %n, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %src_pmd.addr = alloca ptr, align 8
  %src.addr = alloca ptr, align 8
  %c.addr = alloca i32, align 4
  %n.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store ptr %src_pmd, ptr %src_pmd.addr, align 8
  store ptr %src, ptr %src.addr, align 8
  store i32 %c, ptr %c.addr, align 4
  store i64 %n, ptr %n.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  %0 = load ptr, ptr %src_pmd.addr, align 8
  %1 = load ptr, ptr %src.addr, align 8
  %2 = load i64, ptr %n.addr, align 8
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %src.addr, align 8
  %9 = load i32, ptr %c.addr, align 4
  %10 = load i64, ptr %n.addr, align 8
  %call1 = call ptr @memchr(ptr noundef %8, i32 noundef %9, i64 noundef %10) #15
  store ptr %call1, ptr %ret, align 8
  %11 = load ptr, ptr %ret, align 8
  %cmp = icmp eq ptr %11, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %12 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %12)
  br label %if.end

if.else:                                          ; preds = %entry
  %13 = load ptr, ptr %ret_pmd.addr, align 8
  %14 = load ptr, ptr %src_pmd.addr, align 8
  %call2 = call ptr @__RV_pmd_cp_pmd(ptr noundef %13, ptr noundef %14)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %15 = load ptr, ptr %src_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %15)
  %16 = load ptr, ptr %ret, align 8
  ret ptr %16
}

; Function Attrs: nounwind willreturn memory(read)
declare ptr @memchr(ptr noundef, i32 noundef, i64 noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_memcmp(ptr noundef %str1_pmd, ptr noundef %str2_pmd, ptr noundef %str1, ptr noundef %str2, i64 noundef %n, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s1_line, i32 noundef %s1_col, ptr noundef %s1_name, i32 noundef %s2_line, i32 noundef %s2_col, ptr noundef %s2_name) #0 {
entry:
  %str1_pmd.addr = alloca ptr, align 8
  %str2_pmd.addr = alloca ptr, align 8
  %str1.addr = alloca ptr, align 8
  %str2.addr = alloca ptr, align 8
  %n.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s1_line.addr = alloca i32, align 4
  %s1_col.addr = alloca i32, align 4
  %s1_name.addr = alloca ptr, align 8
  %s2_line.addr = alloca i32, align 4
  %s2_col.addr = alloca i32, align 4
  %s2_name.addr = alloca ptr, align 8
  store ptr %str1_pmd, ptr %str1_pmd.addr, align 8
  store ptr %str2_pmd, ptr %str2_pmd.addr, align 8
  store ptr %str1, ptr %str1.addr, align 8
  store ptr %str2, ptr %str2.addr, align 8
  store i64 %n, ptr %n.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s1_line, ptr %s1_line.addr, align 4
  store i32 %s1_col, ptr %s1_col.addr, align 4
  store ptr %s1_name, ptr %s1_name.addr, align 8
  store i32 %s2_line, ptr %s2_line.addr, align 4
  store i32 %s2_col, ptr %s2_col.addr, align 4
  store ptr %s2_name, ptr %s2_name.addr, align 8
  %0 = load ptr, ptr %str1_pmd.addr, align 8
  %1 = load ptr, ptr %str1.addr, align 8
  %2 = load i64, ptr %n.addr, align 8
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s1_line.addr, align 4
  %6 = load i32, ptr %s1_col.addr, align 4
  %7 = load ptr, ptr %s1_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %str2_pmd.addr, align 8
  %9 = load ptr, ptr %str2.addr, align 8
  %10 = load i64, ptr %n.addr, align 8
  %11 = load ptr, ptr %file_name.addr, align 8
  %12 = load ptr, ptr %func_name.addr, align 8
  %13 = load i32, ptr %s2_line.addr, align 4
  %14 = load i32, ptr %s2_col.addr, align 4
  %15 = load ptr, ptr %s2_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %8, ptr noundef %9, i64 noundef %10, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, ptr noundef %15)
  %16 = load ptr, ptr %str1_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %16)
  %17 = load ptr, ptr %str2_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %17)
  %18 = load ptr, ptr %str1.addr, align 8
  %19 = load ptr, ptr %str2.addr, align 8
  %20 = load i64, ptr %n.addr, align 8
  %call2 = call i32 @memcmp(ptr noundef %18, ptr noundef %19, i64 noundef %20) #15
  ret i32 %call2
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @memcmp(ptr noundef, ptr noundef, i64 noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_memcpy(ptr noundef %ret_pmd, ptr noundef %dest_pmd, ptr noundef %src_pmd, ptr noundef %dest, ptr noundef %src, i64 noundef %n, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %d_line, i32 noundef %d_col, ptr noundef %d_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %dest_pmd.addr = alloca ptr, align 8
  %src_pmd.addr = alloca ptr, align 8
  %dest.addr = alloca ptr, align 8
  %src.addr = alloca ptr, align 8
  %n.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %d_line.addr = alloca i32, align 4
  %d_col.addr = alloca i32, align 4
  %d_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  %p = alloca ptr, align 8
  %p_pmd = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store ptr %dest_pmd, ptr %dest_pmd.addr, align 8
  store ptr %src_pmd, ptr %src_pmd.addr, align 8
  store ptr %dest, ptr %dest.addr, align 8
  store ptr %src, ptr %src.addr, align 8
  store i64 %n, ptr %n.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %d_line, ptr %d_line.addr, align 4
  store i32 %d_col, ptr %d_col.addr, align 4
  store ptr %d_name, ptr %d_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  %0 = load ptr, ptr %src_pmd.addr, align 8
  %1 = load ptr, ptr %src.addr, align 8
  %2 = load i64, ptr %n.addr, align 8
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %dest_pmd.addr, align 8
  %9 = load ptr, ptr %dest.addr, align 8
  %10 = load i64, ptr %n.addr, align 8
  %11 = load ptr, ptr %file_name.addr, align 8
  %12 = load ptr, ptr %func_name.addr, align 8
  %13 = load i32, ptr %d_line.addr, align 4
  %14 = load i32, ptr %d_col.addr, align 4
  %15 = load ptr, ptr %d_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %8, ptr noundef %9, i64 noundef %10, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, ptr noundef %15)
  %16 = load ptr, ptr %dest.addr, align 8
  %17 = load ptr, ptr %src.addr, align 8
  %18 = load i64, ptr %n.addr, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %16, ptr align 1 %17, i64 %18, i1 false)
  store ptr %16, ptr %ret, align 8
  %19 = load ptr, ptr %dest.addr, align 8
  %20 = load ptr, ptr %src.addr, align 8
  %cmp = icmp ult ptr %19, %20
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %21 = load i64, ptr %n.addr, align 8
  %cmp2 = icmp ugt i64 %21, 0
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %22 = load ptr, ptr %src.addr, align 8
  %23 = ptrtoint ptr %22 to i64
  %and = and i64 %23, -8
  %24 = inttoptr i64 %and to ptr
  store ptr %24, ptr %p, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %25 = load ptr, ptr %p, align 8
  %26 = load ptr, ptr %src.addr, align 8
  %27 = load i64, ptr %n.addr, align 8
  %add.ptr = getelementptr inbounds i8, ptr %26, i64 %27
  %cmp3 = icmp ult ptr %25, %add.ptr
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %28 = load ptr, ptr %p, align 8
  %29 = load ptr, ptr %src.addr, align 8
  %cmp4 = icmp ult ptr %28, %29
  br i1 %cmp4, label %if.then5, label %if.end

if.then5:                                         ; preds = %for.body
  br label %for.inc

if.end:                                           ; preds = %for.body
  %30 = load ptr, ptr %p, align 8
  %call6 = call ptr @__RV_pmd_tbl_lookup(ptr noundef %30)
  store ptr %call6, ptr %p_pmd, align 8
  %31 = load ptr, ptr %p_pmd, align 8
  %tobool = icmp ne ptr %31, null
  br i1 %tobool, label %if.then7, label %if.end10

if.then7:                                         ; preds = %if.end
  %32 = load ptr, ptr %dest.addr, align 8
  %33 = load ptr, ptr %p, align 8
  %34 = load ptr, ptr %src.addr, align 8
  %sub.ptr.lhs.cast = ptrtoint ptr %33 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %34 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %add.ptr8 = getelementptr inbounds i8, ptr %32, i64 %sub.ptr.sub
  %35 = load ptr, ptr %p_pmd, align 8
  %call9 = call ptr @__RV_pmd_tbl_update_pmd(ptr noundef %add.ptr8, ptr noundef %35)
  br label %if.end10

if.end10:                                         ; preds = %if.then7, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end10, %if.then5
  %36 = load ptr, ptr %p, align 8
  %add.ptr11 = getelementptr inbounds i8, ptr %36, i64 8
  store ptr %add.ptr11, ptr %p, align 8
  br label %for.cond, !llvm.loop !36

for.end:                                          ; preds = %for.cond
  br label %if.end35

if.else:                                          ; preds = %land.lhs.true, %entry
  %37 = load ptr, ptr %dest.addr, align 8
  %38 = load ptr, ptr %src.addr, align 8
  %cmp12 = icmp ugt ptr %37, %38
  br i1 %cmp12, label %land.lhs.true13, label %if.end34

land.lhs.true13:                                  ; preds = %if.else
  %39 = load i64, ptr %n.addr, align 8
  %cmp14 = icmp ugt i64 %39, 0
  br i1 %cmp14, label %if.then15, label %if.end34

if.then15:                                        ; preds = %land.lhs.true13
  %40 = load ptr, ptr %src.addr, align 8
  %41 = load i64, ptr %n.addr, align 8
  %add.ptr16 = getelementptr inbounds i8, ptr %40, i64 %41
  %add.ptr17 = getelementptr inbounds i8, ptr %add.ptr16, i64 -1
  %42 = ptrtoint ptr %add.ptr17 to i64
  %and18 = and i64 %42, -8
  %43 = inttoptr i64 %and18 to ptr
  store ptr %43, ptr %p, align 8
  br label %for.cond19

for.cond19:                                       ; preds = %for.inc31, %if.then15
  %44 = load ptr, ptr %p, align 8
  %45 = load ptr, ptr %src.addr, align 8
  %cmp20 = icmp uge ptr %44, %45
  br i1 %cmp20, label %for.body21, label %for.end33

for.body21:                                       ; preds = %for.cond19
  %46 = load ptr, ptr %p, align 8
  %call22 = call ptr @__RV_pmd_tbl_lookup(ptr noundef %46)
  store ptr %call22, ptr %p_pmd, align 8
  %47 = load ptr, ptr %p_pmd, align 8
  %tobool23 = icmp ne ptr %47, null
  br i1 %tobool23, label %if.then24, label %if.end30

if.then24:                                        ; preds = %for.body21
  %48 = load ptr, ptr %dest.addr, align 8
  %49 = load ptr, ptr %p, align 8
  %50 = load ptr, ptr %src.addr, align 8
  %sub.ptr.lhs.cast25 = ptrtoint ptr %49 to i64
  %sub.ptr.rhs.cast26 = ptrtoint ptr %50 to i64
  %sub.ptr.sub27 = sub i64 %sub.ptr.lhs.cast25, %sub.ptr.rhs.cast26
  %add.ptr28 = getelementptr inbounds i8, ptr %48, i64 %sub.ptr.sub27
  %51 = load ptr, ptr %p_pmd, align 8
  %call29 = call ptr @__RV_pmd_tbl_update_pmd(ptr noundef %add.ptr28, ptr noundef %51)
  br label %if.end30

if.end30:                                         ; preds = %if.then24, %for.body21
  br label %for.inc31

for.inc31:                                        ; preds = %if.end30
  %52 = load ptr, ptr %p, align 8
  %add.ptr32 = getelementptr inbounds i8, ptr %52, i64 -8
  store ptr %add.ptr32, ptr %p, align 8
  br label %for.cond19, !llvm.loop !37

for.end33:                                        ; preds = %for.cond19
  br label %if.end34

if.end34:                                         ; preds = %for.end33, %land.lhs.true13, %if.else
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %for.end
  %53 = load ptr, ptr %ret, align 8
  %cmp36 = icmp eq ptr %53, null
  br i1 %cmp36, label %if.then37, label %if.else38

if.then37:                                        ; preds = %if.end35
  %54 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %54)
  br label %if.end40

if.else38:                                        ; preds = %if.end35
  %55 = load ptr, ptr %ret_pmd.addr, align 8
  %56 = load ptr, ptr %dest_pmd.addr, align 8
  %call39 = call ptr @__RV_pmd_cp_pmd(ptr noundef %55, ptr noundef %56)
  br label %if.end40

if.end40:                                         ; preds = %if.else38, %if.then37
  %57 = load ptr, ptr %src_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %57)
  %58 = load ptr, ptr %dest_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %58)
  %59 = load ptr, ptr %ret, align 8
  ret ptr %59
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #9

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_memmove(ptr noundef %ret_pmd, ptr noundef %dest_pmd, ptr noundef %src_pmd, ptr noundef %dest, ptr noundef %src, i64 noundef %n, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %d_line, i32 noundef %d_col, ptr noundef %d_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %dest_pmd.addr = alloca ptr, align 8
  %src_pmd.addr = alloca ptr, align 8
  %dest.addr = alloca ptr, align 8
  %src.addr = alloca ptr, align 8
  %n.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %d_line.addr = alloca i32, align 4
  %d_col.addr = alloca i32, align 4
  %d_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  %p = alloca ptr, align 8
  %p_pmd = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store ptr %dest_pmd, ptr %dest_pmd.addr, align 8
  store ptr %src_pmd, ptr %src_pmd.addr, align 8
  store ptr %dest, ptr %dest.addr, align 8
  store ptr %src, ptr %src.addr, align 8
  store i64 %n, ptr %n.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %d_line, ptr %d_line.addr, align 4
  store i32 %d_col, ptr %d_col.addr, align 4
  store ptr %d_name, ptr %d_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  %0 = load ptr, ptr %src_pmd.addr, align 8
  %1 = load ptr, ptr %src.addr, align 8
  %2 = load i64, ptr %n.addr, align 8
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %dest_pmd.addr, align 8
  %9 = load ptr, ptr %dest.addr, align 8
  %10 = load i64, ptr %n.addr, align 8
  %11 = load ptr, ptr %file_name.addr, align 8
  %12 = load ptr, ptr %func_name.addr, align 8
  %13 = load i32, ptr %d_line.addr, align 4
  %14 = load i32, ptr %d_col.addr, align 4
  %15 = load ptr, ptr %d_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %8, ptr noundef %9, i64 noundef %10, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, ptr noundef %15)
  %16 = load ptr, ptr %dest.addr, align 8
  %17 = load ptr, ptr %src.addr, align 8
  %18 = load i64, ptr %n.addr, align 8
  call void @llvm.memmove.p0.p0.i64(ptr align 1 %16, ptr align 1 %17, i64 %18, i1 false)
  store ptr %16, ptr %ret, align 8
  %19 = load ptr, ptr %dest.addr, align 8
  %20 = load ptr, ptr %src.addr, align 8
  %cmp = icmp ult ptr %19, %20
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %21 = load i64, ptr %n.addr, align 8
  %cmp2 = icmp ugt i64 %21, 0
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %22 = load ptr, ptr %src.addr, align 8
  %23 = ptrtoint ptr %22 to i64
  %and = and i64 %23, -8
  %24 = inttoptr i64 %and to ptr
  store ptr %24, ptr %p, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %25 = load ptr, ptr %p, align 8
  %26 = load ptr, ptr %src.addr, align 8
  %27 = load i64, ptr %n.addr, align 8
  %add.ptr = getelementptr inbounds i8, ptr %26, i64 %27
  %cmp3 = icmp ult ptr %25, %add.ptr
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %28 = load ptr, ptr %p, align 8
  %29 = load ptr, ptr %src.addr, align 8
  %cmp4 = icmp ult ptr %28, %29
  br i1 %cmp4, label %if.then5, label %if.end

if.then5:                                         ; preds = %for.body
  br label %for.inc

if.end:                                           ; preds = %for.body
  %30 = load ptr, ptr %p, align 8
  %call6 = call ptr @__RV_pmd_tbl_lookup(ptr noundef %30)
  store ptr %call6, ptr %p_pmd, align 8
  %31 = load ptr, ptr %p_pmd, align 8
  %tobool = icmp ne ptr %31, null
  br i1 %tobool, label %if.then7, label %if.end10

if.then7:                                         ; preds = %if.end
  %32 = load ptr, ptr %dest.addr, align 8
  %33 = load ptr, ptr %p, align 8
  %34 = load ptr, ptr %src.addr, align 8
  %sub.ptr.lhs.cast = ptrtoint ptr %33 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %34 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %add.ptr8 = getelementptr inbounds i8, ptr %32, i64 %sub.ptr.sub
  %35 = load ptr, ptr %p_pmd, align 8
  %call9 = call ptr @__RV_pmd_tbl_update_pmd(ptr noundef %add.ptr8, ptr noundef %35)
  br label %if.end10

if.end10:                                         ; preds = %if.then7, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end10, %if.then5
  %36 = load ptr, ptr %p, align 8
  %add.ptr11 = getelementptr inbounds i8, ptr %36, i64 8
  store ptr %add.ptr11, ptr %p, align 8
  br label %for.cond, !llvm.loop !38

for.end:                                          ; preds = %for.cond
  br label %if.end35

if.else:                                          ; preds = %land.lhs.true, %entry
  %37 = load ptr, ptr %dest.addr, align 8
  %38 = load ptr, ptr %src.addr, align 8
  %cmp12 = icmp ugt ptr %37, %38
  br i1 %cmp12, label %land.lhs.true13, label %if.end34

land.lhs.true13:                                  ; preds = %if.else
  %39 = load i64, ptr %n.addr, align 8
  %cmp14 = icmp ugt i64 %39, 0
  br i1 %cmp14, label %if.then15, label %if.end34

if.then15:                                        ; preds = %land.lhs.true13
  %40 = load ptr, ptr %src.addr, align 8
  %41 = load i64, ptr %n.addr, align 8
  %add.ptr16 = getelementptr inbounds i8, ptr %40, i64 %41
  %add.ptr17 = getelementptr inbounds i8, ptr %add.ptr16, i64 -1
  %42 = ptrtoint ptr %add.ptr17 to i64
  %and18 = and i64 %42, -8
  %43 = inttoptr i64 %and18 to ptr
  store ptr %43, ptr %p, align 8
  br label %for.cond19

for.cond19:                                       ; preds = %for.inc31, %if.then15
  %44 = load ptr, ptr %p, align 8
  %45 = load ptr, ptr %src.addr, align 8
  %cmp20 = icmp uge ptr %44, %45
  br i1 %cmp20, label %for.body21, label %for.end33

for.body21:                                       ; preds = %for.cond19
  %46 = load ptr, ptr %p, align 8
  %call22 = call ptr @__RV_pmd_tbl_lookup(ptr noundef %46)
  store ptr %call22, ptr %p_pmd, align 8
  %47 = load ptr, ptr %p_pmd, align 8
  %tobool23 = icmp ne ptr %47, null
  br i1 %tobool23, label %if.then24, label %if.end30

if.then24:                                        ; preds = %for.body21
  %48 = load ptr, ptr %dest.addr, align 8
  %49 = load ptr, ptr %p, align 8
  %50 = load ptr, ptr %src.addr, align 8
  %sub.ptr.lhs.cast25 = ptrtoint ptr %49 to i64
  %sub.ptr.rhs.cast26 = ptrtoint ptr %50 to i64
  %sub.ptr.sub27 = sub i64 %sub.ptr.lhs.cast25, %sub.ptr.rhs.cast26
  %add.ptr28 = getelementptr inbounds i8, ptr %48, i64 %sub.ptr.sub27
  %51 = load ptr, ptr %p_pmd, align 8
  %call29 = call ptr @__RV_pmd_tbl_update_pmd(ptr noundef %add.ptr28, ptr noundef %51)
  br label %if.end30

if.end30:                                         ; preds = %if.then24, %for.body21
  br label %for.inc31

for.inc31:                                        ; preds = %if.end30
  %52 = load ptr, ptr %p, align 8
  %add.ptr32 = getelementptr inbounds i8, ptr %52, i64 -8
  store ptr %add.ptr32, ptr %p, align 8
  br label %for.cond19, !llvm.loop !39

for.end33:                                        ; preds = %for.cond19
  br label %if.end34

if.end34:                                         ; preds = %for.end33, %land.lhs.true13, %if.else
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %for.end
  %53 = load ptr, ptr %ret, align 8
  %cmp36 = icmp eq ptr %53, null
  br i1 %cmp36, label %if.then37, label %if.else38

if.then37:                                        ; preds = %if.end35
  %54 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %54)
  br label %if.end40

if.else38:                                        ; preds = %if.end35
  %55 = load ptr, ptr %ret_pmd.addr, align 8
  %56 = load ptr, ptr %dest_pmd.addr, align 8
  %call39 = call ptr @__RV_pmd_cp_pmd(ptr noundef %55, ptr noundef %56)
  br label %if.end40

if.end40:                                         ; preds = %if.else38, %if.then37
  %57 = load ptr, ptr %src_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %57)
  %58 = load ptr, ptr %dest_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %58)
  %59 = load ptr, ptr %ret, align 8
  ret ptr %59
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memmove.p0.p0.i64(ptr nocapture writeonly, ptr nocapture readonly, i64, i1 immarg) #9

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_memset(ptr noundef %ret_pmd, ptr noundef %str_pmd, ptr noundef %str, i32 noundef %c, i64 noundef %n, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %str_pmd.addr = alloca ptr, align 8
  %str.addr = alloca ptr, align 8
  %c.addr = alloca i32, align 4
  %n.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store ptr %str_pmd, ptr %str_pmd.addr, align 8
  store ptr %str, ptr %str.addr, align 8
  store i32 %c, ptr %c.addr, align 4
  store i64 %n, ptr %n.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  %0 = load ptr, ptr %str_pmd.addr, align 8
  %1 = load ptr, ptr %str.addr, align 8
  %2 = load i64, ptr %n.addr, align 8
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %str.addr, align 8
  %9 = load i32, ptr %c.addr, align 4
  %10 = trunc i32 %9 to i8
  %11 = load i64, ptr %n.addr, align 8
  call void @llvm.memset.p0.i64(ptr align 1 %8, i8 %10, i64 %11, i1 false)
  store ptr %8, ptr %ret, align 8
  %12 = load ptr, ptr %ret, align 8
  %cmp = icmp eq ptr %12, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %13 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %13)
  br label %if.end

if.else:                                          ; preds = %entry
  %14 = load ptr, ptr %ret_pmd.addr, align 8
  %15 = load ptr, ptr %str_pmd.addr, align 8
  %call1 = call ptr @__RV_pmd_cp_pmd(ptr noundef %14, ptr noundef %15)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %16 = load ptr, ptr %str_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %16)
  %17 = load ptr, ptr %ret, align 8
  ret ptr %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_strcasecmp(ptr noundef %str1_pmd, ptr noundef %str2_pmd, ptr noundef %str1, ptr noundef %str2, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s1_line, i32 noundef %s1_col, ptr noundef %s1_name, i32 noundef %s2_line, i32 noundef %s2_col, ptr noundef %s2_name) #0 {
entry:
  %str1_pmd.addr = alloca ptr, align 8
  %str2_pmd.addr = alloca ptr, align 8
  %str1.addr = alloca ptr, align 8
  %str2.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s1_line.addr = alloca i32, align 4
  %s1_col.addr = alloca i32, align 4
  %s1_name.addr = alloca ptr, align 8
  %s2_line.addr = alloca i32, align 4
  %s2_col.addr = alloca i32, align 4
  %s2_name.addr = alloca ptr, align 8
  %i = alloca i32, align 4
  store ptr %str1_pmd, ptr %str1_pmd.addr, align 8
  store ptr %str2_pmd, ptr %str2_pmd.addr, align 8
  store ptr %str1, ptr %str1.addr, align 8
  store ptr %str2, ptr %str2.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s1_line, ptr %s1_line.addr, align 4
  store i32 %s1_col, ptr %s1_col.addr, align 4
  store ptr %s1_name, ptr %s1_name.addr, align 8
  store i32 %s2_line, ptr %s2_line.addr, align 4
  store i32 %s2_col, ptr %s2_col.addr, align 4
  store ptr %s2_name, ptr %s2_name.addr, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load ptr, ptr %str1.addr, align 8
  %1 = load i32, ptr %i, align 4
  %idxprom = zext i32 %1 to i64
  %arrayidx = getelementptr inbounds i8, ptr %0, i64 %idxprom
  %2 = load i8, ptr %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %3 = load ptr, ptr %str2.addr, align 8
  %4 = load i32, ptr %i, align 4
  %idxprom2 = zext i32 %4 to i64
  %arrayidx3 = getelementptr inbounds i8, ptr %3, i64 %idxprom2
  %5 = load i8, ptr %arrayidx3, align 1
  %conv4 = sext i8 %5 to i32
  %cmp5 = icmp ne i32 %conv4, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %6 = phi i1 [ false, %for.cond ], [ %cmp5, %land.rhs ]
  br i1 %6, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %7 = load ptr, ptr %str1.addr, align 8
  %8 = load i32, ptr %i, align 4
  %idxprom7 = zext i32 %8 to i64
  %arrayidx8 = getelementptr inbounds i8, ptr %7, i64 %idxprom7
  %9 = load i8, ptr %arrayidx8, align 1
  %conv9 = sext i8 %9 to i32
  %call = call i32 @tolower(i32 noundef %conv9) #15
  %10 = load ptr, ptr %str2.addr, align 8
  %11 = load i32, ptr %i, align 4
  %idxprom10 = zext i32 %11 to i64
  %arrayidx11 = getelementptr inbounds i8, ptr %10, i64 %idxprom10
  %12 = load i8, ptr %arrayidx11, align 1
  %conv12 = sext i8 %12 to i32
  %call13 = call i32 @tolower(i32 noundef %conv12) #15
  %cmp14 = icmp ne i32 %call, %call13
  br i1 %cmp14, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %13 = load i32, ptr %i, align 4
  %inc = add i32 %13, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !40

for.end:                                          ; preds = %if.then, %land.end
  %14 = load ptr, ptr %str1_pmd.addr, align 8
  %15 = load ptr, ptr %str1.addr, align 8
  %16 = load i32, ptr %i, align 4
  %add = add i32 %16, 1
  %conv16 = zext i32 %add to i64
  %17 = load ptr, ptr %file_name.addr, align 8
  %18 = load ptr, ptr %func_name.addr, align 8
  %19 = load i32, ptr %s1_line.addr, align 4
  %20 = load i32, ptr %s1_col.addr, align 4
  %21 = load ptr, ptr %s1_name.addr, align 8
  %call17 = call ptr @__RV_check_dpv(ptr noundef %14, ptr noundef %15, i64 noundef %conv16, ptr noundef %17, ptr noundef %18, i32 noundef %19, i32 noundef %20, ptr noundef %21)
  %22 = load ptr, ptr %str2_pmd.addr, align 8
  %23 = load ptr, ptr %str2.addr, align 8
  %24 = load i32, ptr %i, align 4
  %add18 = add i32 %24, 1
  %conv19 = zext i32 %add18 to i64
  %25 = load ptr, ptr %file_name.addr, align 8
  %26 = load ptr, ptr %func_name.addr, align 8
  %27 = load i32, ptr %s2_line.addr, align 4
  %28 = load i32, ptr %s2_col.addr, align 4
  %29 = load ptr, ptr %s2_name.addr, align 8
  %call20 = call ptr @__RV_check_dpv(ptr noundef %22, ptr noundef %23, i64 noundef %conv19, ptr noundef %25, ptr noundef %26, i32 noundef %27, i32 noundef %28, ptr noundef %29)
  %30 = load ptr, ptr %str2_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %30)
  %31 = load ptr, ptr %str1_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %31)
  %32 = load ptr, ptr %str1.addr, align 8
  %33 = load ptr, ptr %str2.addr, align 8
  %call21 = call i32 @strcasecmp(ptr noundef %32, ptr noundef %33) #15
  ret i32 %call21
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @tolower(i32 noundef) #5

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcasecmp(ptr noundef, ptr noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_strcat(ptr noundef %ret_pmd, ptr noundef %dest_pmd, ptr noundef %src_pmd, ptr noundef %dest, ptr noundef %src, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %d_line, i32 noundef %d_col, ptr noundef %d_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %dest_pmd.addr = alloca ptr, align 8
  %src_pmd.addr = alloca ptr, align 8
  %dest.addr = alloca ptr, align 8
  %src.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %d_line.addr = alloca i32, align 4
  %d_col.addr = alloca i32, align 4
  %d_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store ptr %dest_pmd, ptr %dest_pmd.addr, align 8
  store ptr %src_pmd, ptr %src_pmd.addr, align 8
  store ptr %dest, ptr %dest.addr, align 8
  store ptr %src, ptr %src.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %d_line, ptr %d_line.addr, align 4
  store i32 %d_col, ptr %d_col.addr, align 4
  store ptr %d_name, ptr %d_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  %0 = load ptr, ptr %dest_pmd.addr, align 8
  %1 = load ptr, ptr %dest.addr, align 8
  %2 = load ptr, ptr %dest.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %3 = load ptr, ptr %src.addr, align 8
  %call1 = call i32 @__RV_sstrlen(ptr noundef %3)
  %add = add nsw i32 %call, %call1
  %add2 = add nsw i32 %add, 1
  %conv = sext i32 %add2 to i64
  %4 = load ptr, ptr %file_name.addr, align 8
  %5 = load ptr, ptr %func_name.addr, align 8
  %6 = load i32, ptr %d_line.addr, align 4
  %7 = load i32, ptr %d_col.addr, align 4
  %8 = load ptr, ptr %d_name.addr, align 8
  %call3 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %4, ptr noundef %5, i32 noundef %6, i32 noundef %7, ptr noundef %8)
  %9 = load ptr, ptr %src_pmd.addr, align 8
  %10 = load ptr, ptr %src.addr, align 8
  %11 = load ptr, ptr %src.addr, align 8
  %call4 = call i32 @__RV_sstrlen(ptr noundef %11)
  %add5 = add nsw i32 %call4, 1
  %conv6 = sext i32 %add5 to i64
  %12 = load ptr, ptr %file_name.addr, align 8
  %13 = load ptr, ptr %func_name.addr, align 8
  %14 = load i32, ptr %s_line.addr, align 4
  %15 = load i32, ptr %s_col.addr, align 4
  %16 = load ptr, ptr %s_name.addr, align 8
  %call7 = call ptr @__RV_check_dpv(ptr noundef %9, ptr noundef %10, i64 noundef %conv6, ptr noundef %12, ptr noundef %13, i32 noundef %14, i32 noundef %15, ptr noundef %16)
  %17 = load ptr, ptr %dest.addr, align 8
  %18 = load ptr, ptr %src.addr, align 8
  %call8 = call ptr @strcat(ptr noundef %17, ptr noundef %18) #13
  store ptr %call8, ptr %ret, align 8
  %19 = load ptr, ptr %ret, align 8
  %cmp = icmp eq ptr %19, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %20 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %20)
  br label %if.end

if.else:                                          ; preds = %entry
  %21 = load ptr, ptr %ret_pmd.addr, align 8
  %22 = load ptr, ptr %dest_pmd.addr, align 8
  %call10 = call ptr @__RV_pmd_cp_pmd(ptr noundef %21, ptr noundef %22)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %23 = load ptr, ptr %dest_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %23)
  %24 = load ptr, ptr %src_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %24)
  %25 = load ptr, ptr %ret, align 8
  ret ptr %25
}

; Function Attrs: nounwind
declare ptr @strcat(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_strchr(ptr noundef %ret_pmd, ptr noundef %src_pmd, ptr noundef %src, i32 noundef %c, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %src_pmd.addr = alloca ptr, align 8
  %src.addr = alloca ptr, align 8
  %c.addr = alloca i32, align 4
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  %i = alloca i32, align 4
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store ptr %src_pmd, ptr %src_pmd.addr, align 8
  store ptr %src, ptr %src.addr, align 8
  store i32 %c, ptr %c.addr, align 4
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load ptr, ptr %src.addr, align 8
  %1 = load i32, ptr %i, align 4
  %idxprom = zext i32 %1 to i64
  %arrayidx = getelementptr inbounds i8, ptr %0, i64 %idxprom
  %2 = load i8, ptr %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load ptr, ptr %src.addr, align 8
  %4 = load i32, ptr %i, align 4
  %idxprom2 = zext i32 %4 to i64
  %arrayidx3 = getelementptr inbounds i8, ptr %3, i64 %idxprom2
  %5 = load i8, ptr %arrayidx3, align 1
  %conv4 = sext i8 %5 to i32
  %6 = load i32, ptr %c.addr, align 4
  %cmp5 = icmp eq i32 %conv4, %6
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %7 = load i32, ptr %i, align 4
  %inc = add i32 %7, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !41

for.end:                                          ; preds = %if.then, %for.cond
  %8 = load ptr, ptr %src_pmd.addr, align 8
  %9 = load ptr, ptr %src.addr, align 8
  %10 = load i32, ptr %i, align 4
  %add = add i32 %10, 1
  %conv7 = zext i32 %add to i64
  %11 = load ptr, ptr %file_name.addr, align 8
  %12 = load ptr, ptr %func_name.addr, align 8
  %13 = load i32, ptr %s_line.addr, align 4
  %14 = load i32, ptr %s_col.addr, align 4
  %15 = load ptr, ptr %s_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %8, ptr noundef %9, i64 noundef %conv7, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, ptr noundef %15)
  %16 = load ptr, ptr %src.addr, align 8
  %17 = load i32, ptr %c.addr, align 4
  %call8 = call ptr @strchr(ptr noundef %16, i32 noundef %17) #15
  store ptr %call8, ptr %ret, align 8
  %18 = load ptr, ptr %ret, align 8
  %cmp9 = icmp eq ptr %18, null
  br i1 %cmp9, label %if.then11, label %if.else

if.then11:                                        ; preds = %for.end
  %19 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %19)
  br label %if.end13

if.else:                                          ; preds = %for.end
  %20 = load ptr, ptr %ret_pmd.addr, align 8
  %21 = load ptr, ptr %src_pmd.addr, align 8
  %call12 = call ptr @__RV_pmd_cp_pmd(ptr noundef %20, ptr noundef %21)
  br label %if.end13

if.end13:                                         ; preds = %if.else, %if.then11
  %22 = load ptr, ptr %src_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %22)
  %23 = load ptr, ptr %ret, align 8
  ret ptr %23
}

; Function Attrs: nounwind willreturn memory(read)
declare ptr @strchr(ptr noundef, i32 noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_strcmp(ptr noundef %str1_pmd, ptr noundef %str2_pmd, ptr noundef %str1, ptr noundef %str2, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s1_line, i32 noundef %s1_col, ptr noundef %s1_name, i32 noundef %s2_line, i32 noundef %s2_col, ptr noundef %s2_name) #0 {
entry:
  %str1_pmd.addr = alloca ptr, align 8
  %str2_pmd.addr = alloca ptr, align 8
  %str1.addr = alloca ptr, align 8
  %str2.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s1_line.addr = alloca i32, align 4
  %s1_col.addr = alloca i32, align 4
  %s1_name.addr = alloca ptr, align 8
  %s2_line.addr = alloca i32, align 4
  %s2_col.addr = alloca i32, align 4
  %s2_name.addr = alloca ptr, align 8
  %i = alloca i32, align 4
  store ptr %str1_pmd, ptr %str1_pmd.addr, align 8
  store ptr %str2_pmd, ptr %str2_pmd.addr, align 8
  store ptr %str1, ptr %str1.addr, align 8
  store ptr %str2, ptr %str2.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s1_line, ptr %s1_line.addr, align 4
  store i32 %s1_col, ptr %s1_col.addr, align 4
  store ptr %s1_name, ptr %s1_name.addr, align 8
  store i32 %s2_line, ptr %s2_line.addr, align 4
  store i32 %s2_col, ptr %s2_col.addr, align 4
  store ptr %s2_name, ptr %s2_name.addr, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load ptr, ptr %str1.addr, align 8
  %1 = load i32, ptr %i, align 4
  %idxprom = zext i32 %1 to i64
  %arrayidx = getelementptr inbounds i8, ptr %0, i64 %idxprom
  %2 = load i8, ptr %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %3 = load ptr, ptr %str2.addr, align 8
  %4 = load i32, ptr %i, align 4
  %idxprom2 = zext i32 %4 to i64
  %arrayidx3 = getelementptr inbounds i8, ptr %3, i64 %idxprom2
  %5 = load i8, ptr %arrayidx3, align 1
  %conv4 = sext i8 %5 to i32
  %cmp5 = icmp ne i32 %conv4, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %6 = phi i1 [ false, %for.cond ], [ %cmp5, %land.rhs ]
  br i1 %6, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %7 = load ptr, ptr %str1.addr, align 8
  %8 = load i32, ptr %i, align 4
  %idxprom7 = zext i32 %8 to i64
  %arrayidx8 = getelementptr inbounds i8, ptr %7, i64 %idxprom7
  %9 = load i8, ptr %arrayidx8, align 1
  %conv9 = sext i8 %9 to i32
  %10 = load ptr, ptr %str2.addr, align 8
  %11 = load i32, ptr %i, align 4
  %idxprom10 = zext i32 %11 to i64
  %arrayidx11 = getelementptr inbounds i8, ptr %10, i64 %idxprom10
  %12 = load i8, ptr %arrayidx11, align 1
  %conv12 = sext i8 %12 to i32
  %cmp13 = icmp ne i32 %conv9, %conv12
  br i1 %cmp13, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %13 = load i32, ptr %i, align 4
  %inc = add i32 %13, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !42

for.end:                                          ; preds = %if.then, %land.end
  %14 = load ptr, ptr %str1_pmd.addr, align 8
  %15 = load ptr, ptr %str1.addr, align 8
  %16 = load i32, ptr %i, align 4
  %add = add i32 %16, 1
  %conv15 = zext i32 %add to i64
  %17 = load ptr, ptr %file_name.addr, align 8
  %18 = load ptr, ptr %func_name.addr, align 8
  %19 = load i32, ptr %s1_line.addr, align 4
  %20 = load i32, ptr %s1_col.addr, align 4
  %21 = load ptr, ptr %s1_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %14, ptr noundef %15, i64 noundef %conv15, ptr noundef %17, ptr noundef %18, i32 noundef %19, i32 noundef %20, ptr noundef %21)
  %22 = load ptr, ptr %str2_pmd.addr, align 8
  %23 = load ptr, ptr %str2.addr, align 8
  %24 = load i32, ptr %i, align 4
  %add16 = add i32 %24, 1
  %conv17 = zext i32 %add16 to i64
  %25 = load ptr, ptr %file_name.addr, align 8
  %26 = load ptr, ptr %func_name.addr, align 8
  %27 = load i32, ptr %s2_line.addr, align 4
  %28 = load i32, ptr %s2_col.addr, align 4
  %29 = load ptr, ptr %s2_name.addr, align 8
  %call18 = call ptr @__RV_check_dpv(ptr noundef %22, ptr noundef %23, i64 noundef %conv17, ptr noundef %25, ptr noundef %26, i32 noundef %27, i32 noundef %28, ptr noundef %29)
  %30 = load ptr, ptr %str2_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %30)
  %31 = load ptr, ptr %str1_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %31)
  %32 = load ptr, ptr %str1.addr, align 8
  %33 = load ptr, ptr %str2.addr, align 8
  %call19 = call i32 @strcmp(ptr noundef %32, ptr noundef %33) #15
  ret i32 %call19
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_strcoll(ptr noundef %str1_pmd, ptr noundef %str2_pmd, ptr noundef %str1, ptr noundef %str2, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s1_line, i32 noundef %s1_col, ptr noundef %s1_name, i32 noundef %s2_line, i32 noundef %s2_col, ptr noundef %s2_name) #0 {
entry:
  %str1_pmd.addr = alloca ptr, align 8
  %str2_pmd.addr = alloca ptr, align 8
  %str1.addr = alloca ptr, align 8
  %str2.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s1_line.addr = alloca i32, align 4
  %s1_col.addr = alloca i32, align 4
  %s1_name.addr = alloca ptr, align 8
  %s2_line.addr = alloca i32, align 4
  %s2_col.addr = alloca i32, align 4
  %s2_name.addr = alloca ptr, align 8
  store ptr %str1_pmd, ptr %str1_pmd.addr, align 8
  store ptr %str2_pmd, ptr %str2_pmd.addr, align 8
  store ptr %str1, ptr %str1.addr, align 8
  store ptr %str2, ptr %str2.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s1_line, ptr %s1_line.addr, align 4
  store i32 %s1_col, ptr %s1_col.addr, align 4
  store ptr %s1_name, ptr %s1_name.addr, align 8
  store i32 %s2_line, ptr %s2_line.addr, align 4
  store i32 %s2_col, ptr %s2_col.addr, align 4
  store ptr %s2_name, ptr %s2_name.addr, align 8
  %0 = load ptr, ptr %str1_pmd.addr, align 8
  %1 = load ptr, ptr %str1.addr, align 8
  %2 = load ptr, ptr %str1.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s1_line.addr, align 4
  %6 = load i32, ptr %s1_col.addr, align 4
  %7 = load ptr, ptr %s1_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %str2_pmd.addr, align 8
  %9 = load ptr, ptr %str2.addr, align 8
  %10 = load ptr, ptr %str2.addr, align 8
  %call2 = call i32 @__RV_sstrlen(ptr noundef %10)
  %add3 = add nsw i32 %call2, 1
  %conv4 = sext i32 %add3 to i64
  %11 = load ptr, ptr %file_name.addr, align 8
  %12 = load ptr, ptr %func_name.addr, align 8
  %13 = load i32, ptr %s2_line.addr, align 4
  %14 = load i32, ptr %s2_col.addr, align 4
  %15 = load ptr, ptr %s2_name.addr, align 8
  %call5 = call ptr @__RV_check_dpv(ptr noundef %8, ptr noundef %9, i64 noundef %conv4, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, ptr noundef %15)
  %16 = load ptr, ptr %str1_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %16)
  %17 = load ptr, ptr %str2_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %17)
  %18 = load ptr, ptr %str1.addr, align 8
  %19 = load ptr, ptr %str2.addr, align 8
  %call6 = call i32 @strcoll(ptr noundef %18, ptr noundef %19) #15
  ret i32 %call6
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcoll(ptr noundef, ptr noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_strcpy(ptr noundef %ret_pmd, ptr noundef %dest_pmd, ptr noundef %src_pmd, ptr noundef %dest, ptr noundef %src, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %d_line, i32 noundef %d_col, ptr noundef %d_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %dest_pmd.addr = alloca ptr, align 8
  %src_pmd.addr = alloca ptr, align 8
  %dest.addr = alloca ptr, align 8
  %src.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %d_line.addr = alloca i32, align 4
  %d_col.addr = alloca i32, align 4
  %d_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store ptr %dest_pmd, ptr %dest_pmd.addr, align 8
  store ptr %src_pmd, ptr %src_pmd.addr, align 8
  store ptr %dest, ptr %dest.addr, align 8
  store ptr %src, ptr %src.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %d_line, ptr %d_line.addr, align 4
  store i32 %d_col, ptr %d_col.addr, align 4
  store ptr %d_name, ptr %d_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  %0 = load ptr, ptr %src_pmd.addr, align 8
  %1 = load ptr, ptr %src.addr, align 8
  %2 = load ptr, ptr %src.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %dest_pmd.addr, align 8
  %9 = load ptr, ptr %dest.addr, align 8
  %10 = load ptr, ptr %src.addr, align 8
  %call2 = call i32 @__RV_sstrlen(ptr noundef %10)
  %add3 = add nsw i32 %call2, 1
  %conv4 = sext i32 %add3 to i64
  %11 = load ptr, ptr %file_name.addr, align 8
  %12 = load ptr, ptr %func_name.addr, align 8
  %13 = load i32, ptr %d_line.addr, align 4
  %14 = load i32, ptr %d_col.addr, align 4
  %15 = load ptr, ptr %d_name.addr, align 8
  %call5 = call ptr @__RV_check_dpv(ptr noundef %8, ptr noundef %9, i64 noundef %conv4, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, ptr noundef %15)
  %16 = load ptr, ptr %dest.addr, align 8
  %17 = load ptr, ptr %src.addr, align 8
  %call6 = call ptr @strcpy(ptr noundef %16, ptr noundef %17) #13
  store ptr %call6, ptr %ret, align 8
  %18 = load ptr, ptr %ret, align 8
  %cmp = icmp eq ptr %18, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %19 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %19)
  br label %if.end

if.else:                                          ; preds = %entry
  %20 = load ptr, ptr %ret_pmd.addr, align 8
  %21 = load ptr, ptr %dest_pmd.addr, align 8
  %call8 = call ptr @__RV_pmd_cp_pmd(ptr noundef %20, ptr noundef %21)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %22 = load ptr, ptr %dest_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %22)
  %23 = load ptr, ptr %src_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %23)
  %24 = load ptr, ptr %ret, align 8
  ret ptr %24
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @_RV_strcspn(ptr noundef %str1_pmd, ptr noundef %str2_pmd, ptr noundef %str1, ptr noundef %str2, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s1_line, i32 noundef %s1_col, ptr noundef %s1_name, i32 noundef %s2_line, i32 noundef %s2_col, ptr noundef %s2_name) #0 {
entry:
  %str1_pmd.addr = alloca ptr, align 8
  %str2_pmd.addr = alloca ptr, align 8
  %str1.addr = alloca ptr, align 8
  %str2.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s1_line.addr = alloca i32, align 4
  %s1_col.addr = alloca i32, align 4
  %s1_name.addr = alloca ptr, align 8
  %s2_line.addr = alloca i32, align 4
  %s2_col.addr = alloca i32, align 4
  %s2_name.addr = alloca ptr, align 8
  store ptr %str1_pmd, ptr %str1_pmd.addr, align 8
  store ptr %str2_pmd, ptr %str2_pmd.addr, align 8
  store ptr %str1, ptr %str1.addr, align 8
  store ptr %str2, ptr %str2.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s1_line, ptr %s1_line.addr, align 4
  store i32 %s1_col, ptr %s1_col.addr, align 4
  store ptr %s1_name, ptr %s1_name.addr, align 8
  store i32 %s2_line, ptr %s2_line.addr, align 4
  store i32 %s2_col, ptr %s2_col.addr, align 4
  store ptr %s2_name, ptr %s2_name.addr, align 8
  %0 = load ptr, ptr %str1_pmd.addr, align 8
  %1 = load ptr, ptr %str1.addr, align 8
  %2 = load ptr, ptr %str1.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s1_line.addr, align 4
  %6 = load i32, ptr %s1_col.addr, align 4
  %7 = load ptr, ptr %s1_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %str2_pmd.addr, align 8
  %9 = load ptr, ptr %str2.addr, align 8
  %10 = load ptr, ptr %str2.addr, align 8
  %call2 = call i32 @__RV_sstrlen(ptr noundef %10)
  %add3 = add nsw i32 %call2, 1
  %conv4 = sext i32 %add3 to i64
  %11 = load ptr, ptr %file_name.addr, align 8
  %12 = load ptr, ptr %func_name.addr, align 8
  %13 = load i32, ptr %s2_line.addr, align 4
  %14 = load i32, ptr %s2_col.addr, align 4
  %15 = load ptr, ptr %s2_name.addr, align 8
  %call5 = call ptr @__RV_check_dpv(ptr noundef %8, ptr noundef %9, i64 noundef %conv4, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, ptr noundef %15)
  %16 = load ptr, ptr %str1_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %16)
  %17 = load ptr, ptr %str2_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %17)
  %18 = load ptr, ptr %str1.addr, align 8
  %19 = load ptr, ptr %str2.addr, align 8
  %call6 = call i64 @strcspn(ptr noundef %18, ptr noundef %19) #15
  ret i64 %call6
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_strdup(ptr noundef %ret_pmd, ptr noundef %str_pmd, ptr noundef %str, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %str_pmd.addr = alloca ptr, align 8
  %str.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store ptr %str_pmd, ptr %str_pmd.addr, align 8
  store ptr %str, ptr %str.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  %0 = load ptr, ptr %str_pmd.addr, align 8
  %1 = load ptr, ptr %str.addr, align 8
  %2 = load ptr, ptr %str.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %str.addr, align 8
  %call2 = call noalias ptr @strdup(ptr noundef %8) #13
  store ptr %call2, ptr %ret, align 8
  %9 = load ptr, ptr %ret, align 8
  %cmp = icmp eq ptr %9, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %10 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %10)
  br label %if.end

if.else:                                          ; preds = %entry
  %11 = load ptr, ptr %ret_pmd.addr, align 8
  %12 = load ptr, ptr %ret, align 8
  %13 = load ptr, ptr %ret, align 8
  %14 = load ptr, ptr %str.addr, align 8
  %call4 = call i32 @__RV_sstrlen(ptr noundef %14)
  %idx.ext = sext i32 %call4 to i64
  %add.ptr = getelementptr inbounds i8, ptr %13, i64 %idx.ext
  %add.ptr5 = getelementptr inbounds i8, ptr %add.ptr, i64 1
  %call6 = call ptr @__RV_pmd_set(ptr noundef %11, ptr noundef null, i32 noundef 4, ptr noundef %12, ptr noundef %add.ptr5)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %15 = load ptr, ptr %str_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %15)
  %16 = load ptr, ptr %ret, align 8
  ret ptr %16
}

; Function Attrs: nounwind
declare noalias ptr @strdup(ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_strerror(ptr noundef %ret_pmd, i32 noundef %errnum) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %errnum.addr = alloca i32, align 4
  %ret = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store i32 %errnum, ptr %errnum.addr, align 4
  %0 = load i32, ptr %errnum.addr, align 4
  %call = call ptr @strerror(i32 noundef %0) #13
  store ptr %call, ptr %ret, align 8
  %1 = load ptr, ptr %ret, align 8
  %cmp = icmp eq ptr %1, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %2)
  br label %if.end

if.else:                                          ; preds = %entry
  %3 = load ptr, ptr %ret_pmd.addr, align 8
  %4 = load ptr, ptr @__RV_global_sa, align 8
  %5 = load ptr, ptr %ret, align 8
  %6 = load ptr, ptr %ret, align 8
  %7 = load ptr, ptr %ret, align 8
  %call1 = call i32 @__RV_sstrlen(ptr noundef %7)
  %idx.ext = sext i32 %call1 to i64
  %add.ptr = getelementptr inbounds i8, ptr %6, i64 %idx.ext
  %add.ptr2 = getelementptr inbounds i8, ptr %add.ptr, i64 1
  %call3 = call ptr @__RV_pmd_set(ptr noundef %3, ptr noundef %4, i32 noundef 0, ptr noundef %5, ptr noundef %add.ptr2)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %8 = load ptr, ptr %ret, align 8
  ret ptr %8
}

; Function Attrs: nounwind
declare ptr @strerror(i32 noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @_RV_strlen(ptr noundef %str_pmd, ptr noundef %str, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %str_pmd.addr = alloca ptr, align 8
  %str.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  store ptr %str_pmd, ptr %str_pmd.addr, align 8
  store ptr %str, ptr %str.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  %0 = load ptr, ptr %str_pmd.addr, align 8
  %1 = load ptr, ptr %str.addr, align 8
  %2 = load ptr, ptr %str.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %str_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %8)
  %9 = load ptr, ptr %str.addr, align 8
  %call2 = call i64 @strlen(ptr noundef %9) #15
  ret i64 %call2
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_strncasecmp(ptr noundef %str1_pmd, ptr noundef %str2_pmd, ptr noundef %str1, ptr noundef %str2, i64 noundef %n, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s1_line, i32 noundef %s1_col, ptr noundef %s1_name, i32 noundef %s2_line, i32 noundef %s2_col, ptr noundef %s2_name) #0 {
entry:
  %str1_pmd.addr = alloca ptr, align 8
  %str2_pmd.addr = alloca ptr, align 8
  %str1.addr = alloca ptr, align 8
  %str2.addr = alloca ptr, align 8
  %n.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s1_line.addr = alloca i32, align 4
  %s1_col.addr = alloca i32, align 4
  %s1_name.addr = alloca ptr, align 8
  %s2_line.addr = alloca i32, align 4
  %s2_col.addr = alloca i32, align 4
  %s2_name.addr = alloca ptr, align 8
  %i = alloca i32, align 4
  store ptr %str1_pmd, ptr %str1_pmd.addr, align 8
  store ptr %str2_pmd, ptr %str2_pmd.addr, align 8
  store ptr %str1, ptr %str1.addr, align 8
  store ptr %str2, ptr %str2.addr, align 8
  store i64 %n, ptr %n.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s1_line, ptr %s1_line.addr, align 4
  store i32 %s1_col, ptr %s1_col.addr, align 4
  store ptr %s1_name, ptr %s1_name.addr, align 8
  store i32 %s2_line, ptr %s2_line.addr, align 4
  store i32 %s2_col, ptr %s2_col.addr, align 4
  store ptr %s2_name, ptr %s2_name.addr, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %conv = zext i32 %0 to i64
  %1 = load i64, ptr %n.addr, align 8
  %sub = sub i64 %1, 1
  %cmp = icmp ult i64 %conv, %sub
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %str1.addr, align 8
  %3 = load i32, ptr %i, align 4
  %idxprom = zext i32 %3 to i64
  %arrayidx = getelementptr inbounds i8, ptr %2, i64 %idxprom
  %4 = load i8, ptr %arrayidx, align 1
  %conv2 = sext i8 %4 to i32
  %cmp3 = icmp eq i32 %conv2, 0
  br i1 %cmp3, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %5 = load ptr, ptr %str2.addr, align 8
  %6 = load i32, ptr %i, align 4
  %idxprom5 = zext i32 %6 to i64
  %arrayidx6 = getelementptr inbounds i8, ptr %5, i64 %idxprom5
  %7 = load i8, ptr %arrayidx6, align 1
  %conv7 = sext i8 %7 to i32
  %cmp8 = icmp eq i32 %conv7, 0
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %for.body
  br label %for.end

if.end:                                           ; preds = %lor.lhs.false
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %8 = load i32, ptr %i, align 4
  %inc = add i32 %8, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !43

for.end:                                          ; preds = %if.then, %for.cond
  %9 = load ptr, ptr %str1_pmd.addr, align 8
  %10 = load ptr, ptr %str1.addr, align 8
  %11 = load i32, ptr %i, align 4
  %add = add i32 %11, 1
  %conv10 = zext i32 %add to i64
  %12 = load ptr, ptr %file_name.addr, align 8
  %13 = load ptr, ptr %func_name.addr, align 8
  %14 = load i32, ptr %s1_line.addr, align 4
  %15 = load i32, ptr %s1_col.addr, align 4
  %16 = load ptr, ptr %s1_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %9, ptr noundef %10, i64 noundef %conv10, ptr noundef %12, ptr noundef %13, i32 noundef %14, i32 noundef %15, ptr noundef %16)
  %17 = load ptr, ptr %str2_pmd.addr, align 8
  %18 = load ptr, ptr %str2.addr, align 8
  %19 = load i32, ptr %i, align 4
  %add11 = add i32 %19, 1
  %conv12 = zext i32 %add11 to i64
  %20 = load ptr, ptr %file_name.addr, align 8
  %21 = load ptr, ptr %func_name.addr, align 8
  %22 = load i32, ptr %s2_line.addr, align 4
  %23 = load i32, ptr %s2_col.addr, align 4
  %24 = load ptr, ptr %s2_name.addr, align 8
  %call13 = call ptr @__RV_check_dpv(ptr noundef %17, ptr noundef %18, i64 noundef %conv12, ptr noundef %20, ptr noundef %21, i32 noundef %22, i32 noundef %23, ptr noundef %24)
  %25 = load ptr, ptr %str1_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %25)
  %26 = load ptr, ptr %str2_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %26)
  %27 = load ptr, ptr %str1.addr, align 8
  %28 = load ptr, ptr %str2.addr, align 8
  %29 = load i64, ptr %n.addr, align 8
  %call14 = call i32 @strncasecmp(ptr noundef %27, ptr noundef %28, i64 noundef %29) #15
  ret i32 %call14
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strncasecmp(ptr noundef, ptr noundef, i64 noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_strncat(ptr noundef %ret_pmd, ptr noundef %dest_pmd, ptr noundef %src_pmd, ptr noundef %dest, ptr noundef %src, i64 noundef %n, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %d_line, i32 noundef %d_col, ptr noundef %d_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %dest_pmd.addr = alloca ptr, align 8
  %src_pmd.addr = alloca ptr, align 8
  %dest.addr = alloca ptr, align 8
  %src.addr = alloca ptr, align 8
  %n.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %d_line.addr = alloca i32, align 4
  %d_col.addr = alloca i32, align 4
  %d_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  %i = alloca i32, align 4
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store ptr %dest_pmd, ptr %dest_pmd.addr, align 8
  store ptr %src_pmd, ptr %src_pmd.addr, align 8
  store ptr %dest, ptr %dest.addr, align 8
  store ptr %src, ptr %src.addr, align 8
  store i64 %n, ptr %n.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %d_line, ptr %d_line.addr, align 4
  store i32 %d_col, ptr %d_col.addr, align 4
  store ptr %d_name, ptr %d_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %conv = sext i32 %0 to i64
  %1 = load i64, ptr %n.addr, align 8
  %cmp = icmp ult i64 %conv, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %src.addr, align 8
  %3 = load i32, ptr %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds i8, ptr %2, i64 %idxprom
  %4 = load i8, ptr %arrayidx, align 1
  %conv2 = sext i8 %4 to i32
  %cmp3 = icmp eq i32 %conv2, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %5 = load i32, ptr %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !44

for.end:                                          ; preds = %if.then, %for.cond
  %6 = load ptr, ptr %dest_pmd.addr, align 8
  %7 = load ptr, ptr %dest.addr, align 8
  %8 = load ptr, ptr %dest.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %8)
  %9 = load i32, ptr %i, align 4
  %add = add nsw i32 %call, %9
  %add5 = add nsw i32 %add, 1
  %conv6 = sext i32 %add5 to i64
  %10 = load ptr, ptr %file_name.addr, align 8
  %11 = load ptr, ptr %func_name.addr, align 8
  %12 = load i32, ptr %d_line.addr, align 4
  %13 = load i32, ptr %d_col.addr, align 4
  %14 = load ptr, ptr %d_name.addr, align 8
  %call7 = call ptr @__RV_check_dpv(ptr noundef %6, ptr noundef %7, i64 noundef %conv6, ptr noundef %10, ptr noundef %11, i32 noundef %12, i32 noundef %13, ptr noundef %14)
  %15 = load ptr, ptr %src_pmd.addr, align 8
  %16 = load ptr, ptr %src.addr, align 8
  %17 = load i32, ptr %i, align 4
  %conv8 = sext i32 %17 to i64
  %18 = load i64, ptr %n.addr, align 8
  %cmp9 = icmp eq i64 %conv8, %18
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.end
  %19 = load i64, ptr %n.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %for.end
  %20 = load i32, ptr %i, align 4
  %add11 = add nsw i32 %20, 1
  %conv12 = sext i32 %add11 to i64
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %19, %cond.true ], [ %conv12, %cond.false ]
  %21 = load ptr, ptr %file_name.addr, align 8
  %22 = load ptr, ptr %func_name.addr, align 8
  %23 = load i32, ptr %s_line.addr, align 4
  %24 = load i32, ptr %s_col.addr, align 4
  %25 = load ptr, ptr %s_name.addr, align 8
  %call13 = call ptr @__RV_check_dpv(ptr noundef %15, ptr noundef %16, i64 noundef %cond, ptr noundef %21, ptr noundef %22, i32 noundef %23, i32 noundef %24, ptr noundef %25)
  %26 = load ptr, ptr %dest.addr, align 8
  %27 = load ptr, ptr %src.addr, align 8
  %28 = load i64, ptr %n.addr, align 8
  %call14 = call ptr @strncat(ptr noundef %26, ptr noundef %27, i64 noundef %28) #13
  store ptr %call14, ptr %ret, align 8
  %29 = load ptr, ptr %ret, align 8
  %cmp15 = icmp eq ptr %29, null
  br i1 %cmp15, label %if.then17, label %if.else

if.then17:                                        ; preds = %cond.end
  %30 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %30)
  br label %if.end19

if.else:                                          ; preds = %cond.end
  %31 = load ptr, ptr %ret_pmd.addr, align 8
  %32 = load ptr, ptr %dest_pmd.addr, align 8
  %call18 = call ptr @__RV_pmd_cp_pmd(ptr noundef %31, ptr noundef %32)
  br label %if.end19

if.end19:                                         ; preds = %if.else, %if.then17
  %33 = load ptr, ptr %src_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %33)
  %34 = load ptr, ptr %dest_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %34)
  %35 = load ptr, ptr %ret, align 8
  ret ptr %35
}

; Function Attrs: nounwind
declare ptr @strncat(ptr noundef, ptr noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_strncmp(ptr noundef %str1_pmd, ptr noundef %str2_pmd, ptr noundef %str1, ptr noundef %str2, i64 noundef %n, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s1_line, i32 noundef %s1_col, ptr noundef %s1_name, i32 noundef %s2_line, i32 noundef %s2_col, ptr noundef %s2_name) #0 {
entry:
  %str1_pmd.addr = alloca ptr, align 8
  %str2_pmd.addr = alloca ptr, align 8
  %str1.addr = alloca ptr, align 8
  %str2.addr = alloca ptr, align 8
  %n.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s1_line.addr = alloca i32, align 4
  %s1_col.addr = alloca i32, align 4
  %s1_name.addr = alloca ptr, align 8
  %s2_line.addr = alloca i32, align 4
  %s2_col.addr = alloca i32, align 4
  %s2_name.addr = alloca ptr, align 8
  %i = alloca i32, align 4
  store ptr %str1_pmd, ptr %str1_pmd.addr, align 8
  store ptr %str2_pmd, ptr %str2_pmd.addr, align 8
  store ptr %str1, ptr %str1.addr, align 8
  store ptr %str2, ptr %str2.addr, align 8
  store i64 %n, ptr %n.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s1_line, ptr %s1_line.addr, align 4
  store i32 %s1_col, ptr %s1_col.addr, align 4
  store ptr %s1_name, ptr %s1_name.addr, align 8
  store i32 %s2_line, ptr %s2_line.addr, align 4
  store i32 %s2_col, ptr %s2_col.addr, align 4
  store ptr %s2_name, ptr %s2_name.addr, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %conv = zext i32 %0 to i64
  %1 = load i64, ptr %n.addr, align 8
  %sub = sub i64 %1, 1
  %cmp = icmp ult i64 %conv, %sub
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %str1.addr, align 8
  %3 = load i32, ptr %i, align 4
  %idxprom = zext i32 %3 to i64
  %arrayidx = getelementptr inbounds i8, ptr %2, i64 %idxprom
  %4 = load i8, ptr %arrayidx, align 1
  %conv2 = sext i8 %4 to i32
  %cmp3 = icmp eq i32 %conv2, 0
  br i1 %cmp3, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %5 = load ptr, ptr %str2.addr, align 8
  %6 = load i32, ptr %i, align 4
  %idxprom5 = zext i32 %6 to i64
  %arrayidx6 = getelementptr inbounds i8, ptr %5, i64 %idxprom5
  %7 = load i8, ptr %arrayidx6, align 1
  %conv7 = sext i8 %7 to i32
  %cmp8 = icmp eq i32 %conv7, 0
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %for.body
  br label %for.end

if.end:                                           ; preds = %lor.lhs.false
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %8 = load i32, ptr %i, align 4
  %inc = add i32 %8, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !45

for.end:                                          ; preds = %if.then, %for.cond
  %9 = load ptr, ptr %str1_pmd.addr, align 8
  %10 = load ptr, ptr %str1.addr, align 8
  %11 = load i32, ptr %i, align 4
  %add = add i32 %11, 1
  %conv10 = zext i32 %add to i64
  %12 = load ptr, ptr %file_name.addr, align 8
  %13 = load ptr, ptr %func_name.addr, align 8
  %14 = load i32, ptr %s1_line.addr, align 4
  %15 = load i32, ptr %s1_col.addr, align 4
  %16 = load ptr, ptr %s1_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %9, ptr noundef %10, i64 noundef %conv10, ptr noundef %12, ptr noundef %13, i32 noundef %14, i32 noundef %15, ptr noundef %16)
  %17 = load ptr, ptr %str2_pmd.addr, align 8
  %18 = load ptr, ptr %str2.addr, align 8
  %19 = load i32, ptr %i, align 4
  %add11 = add i32 %19, 1
  %conv12 = zext i32 %add11 to i64
  %20 = load ptr, ptr %file_name.addr, align 8
  %21 = load ptr, ptr %func_name.addr, align 8
  %22 = load i32, ptr %s2_line.addr, align 4
  %23 = load i32, ptr %s2_col.addr, align 4
  %24 = load ptr, ptr %s2_name.addr, align 8
  %call13 = call ptr @__RV_check_dpv(ptr noundef %17, ptr noundef %18, i64 noundef %conv12, ptr noundef %20, ptr noundef %21, i32 noundef %22, i32 noundef %23, ptr noundef %24)
  %25 = load ptr, ptr %str1_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %25)
  %26 = load ptr, ptr %str2_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %26)
  %27 = load ptr, ptr %str1.addr, align 8
  %28 = load ptr, ptr %str2.addr, align 8
  %29 = load i64, ptr %n.addr, align 8
  %call14 = call i32 @strncmp(ptr noundef %27, ptr noundef %28, i64 noundef %29) #15
  ret i32 %call14
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strncmp(ptr noundef, ptr noundef, i64 noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_strncpy(ptr noundef %ret_pmd, ptr noundef %dest_pmd, ptr noundef %src_pmd, ptr noundef %dest, ptr noundef %src, i64 noundef %n, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %d_line, i32 noundef %d_col, ptr noundef %d_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %dest_pmd.addr = alloca ptr, align 8
  %src_pmd.addr = alloca ptr, align 8
  %dest.addr = alloca ptr, align 8
  %src.addr = alloca ptr, align 8
  %n.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %d_line.addr = alloca i32, align 4
  %d_col.addr = alloca i32, align 4
  %d_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  %i = alloca i32, align 4
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store ptr %dest_pmd, ptr %dest_pmd.addr, align 8
  store ptr %src_pmd, ptr %src_pmd.addr, align 8
  store ptr %dest, ptr %dest.addr, align 8
  store ptr %src, ptr %src.addr, align 8
  store i64 %n, ptr %n.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %d_line, ptr %d_line.addr, align 4
  store i32 %d_col, ptr %d_col.addr, align 4
  store ptr %d_name, ptr %d_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %conv = sext i32 %0 to i64
  %1 = load i64, ptr %n.addr, align 8
  %sub = sub i64 %1, 1
  %cmp = icmp ult i64 %conv, %sub
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %src.addr, align 8
  %3 = load i32, ptr %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds i8, ptr %2, i64 %idxprom
  %4 = load i8, ptr %arrayidx, align 1
  %conv2 = sext i8 %4 to i32
  %cmp3 = icmp eq i32 %conv2, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %5 = load i32, ptr %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !46

for.end:                                          ; preds = %if.then, %for.cond
  %6 = load ptr, ptr %src_pmd.addr, align 8
  %7 = load ptr, ptr %src.addr, align 8
  %8 = load i32, ptr %i, align 4
  %add = add nsw i32 %8, 1
  %conv5 = sext i32 %add to i64
  %9 = load ptr, ptr %file_name.addr, align 8
  %10 = load ptr, ptr %func_name.addr, align 8
  %11 = load i32, ptr %s_line.addr, align 4
  %12 = load i32, ptr %s_col.addr, align 4
  %13 = load ptr, ptr %s_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %6, ptr noundef %7, i64 noundef %conv5, ptr noundef %9, ptr noundef %10, i32 noundef %11, i32 noundef %12, ptr noundef %13)
  %14 = load ptr, ptr %dest_pmd.addr, align 8
  %15 = load ptr, ptr %dest.addr, align 8
  %16 = load i64, ptr %n.addr, align 8
  %17 = load ptr, ptr %file_name.addr, align 8
  %18 = load ptr, ptr %func_name.addr, align 8
  %19 = load i32, ptr %d_line.addr, align 4
  %20 = load i32, ptr %d_col.addr, align 4
  %21 = load ptr, ptr %d_name.addr, align 8
  %call6 = call ptr @__RV_check_dpv(ptr noundef %14, ptr noundef %15, i64 noundef %16, ptr noundef %17, ptr noundef %18, i32 noundef %19, i32 noundef %20, ptr noundef %21)
  %22 = load ptr, ptr %dest.addr, align 8
  %23 = load ptr, ptr %src.addr, align 8
  %24 = load i64, ptr %n.addr, align 8
  %call7 = call ptr @strncpy(ptr noundef %22, ptr noundef %23, i64 noundef %24) #13
  store ptr %call7, ptr %ret, align 8
  %25 = load ptr, ptr %ret, align 8
  %cmp8 = icmp eq ptr %25, null
  br i1 %cmp8, label %if.then10, label %if.else

if.then10:                                        ; preds = %for.end
  %26 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %26)
  br label %if.end12

if.else:                                          ; preds = %for.end
  %27 = load ptr, ptr %ret_pmd.addr, align 8
  %28 = load ptr, ptr %dest_pmd.addr, align 8
  %call11 = call ptr @__RV_pmd_cp_pmd(ptr noundef %27, ptr noundef %28)
  br label %if.end12

if.end12:                                         ; preds = %if.else, %if.then10
  %29 = load ptr, ptr %src_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %29)
  %30 = load ptr, ptr %dest_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %30)
  %31 = load ptr, ptr %ret, align 8
  ret ptr %31
}

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_strpbrk(ptr noundef %ret_pmd, ptr noundef %str1_pmd, ptr noundef %str2_pmd, ptr noundef %str1, ptr noundef %str2, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s1_line, i32 noundef %s1_col, ptr noundef %s1_name, i32 noundef %s2_line, i32 noundef %s2_col, ptr noundef %s2_name) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %str1_pmd.addr = alloca ptr, align 8
  %str2_pmd.addr = alloca ptr, align 8
  %str1.addr = alloca ptr, align 8
  %str2.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s1_line.addr = alloca i32, align 4
  %s1_col.addr = alloca i32, align 4
  %s1_name.addr = alloca ptr, align 8
  %s2_line.addr = alloca i32, align 4
  %s2_col.addr = alloca i32, align 4
  %s2_name.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store ptr %str1_pmd, ptr %str1_pmd.addr, align 8
  store ptr %str2_pmd, ptr %str2_pmd.addr, align 8
  store ptr %str1, ptr %str1.addr, align 8
  store ptr %str2, ptr %str2.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s1_line, ptr %s1_line.addr, align 4
  store i32 %s1_col, ptr %s1_col.addr, align 4
  store ptr %s1_name, ptr %s1_name.addr, align 8
  store i32 %s2_line, ptr %s2_line.addr, align 4
  store i32 %s2_col, ptr %s2_col.addr, align 4
  store ptr %s2_name, ptr %s2_name.addr, align 8
  %0 = load ptr, ptr %str1_pmd.addr, align 8
  %1 = load ptr, ptr %str1.addr, align 8
  %2 = load ptr, ptr %str1.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s1_line.addr, align 4
  %6 = load i32, ptr %s1_col.addr, align 4
  %7 = load ptr, ptr %s1_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %str2_pmd.addr, align 8
  %9 = load ptr, ptr %str2.addr, align 8
  %10 = load ptr, ptr %str2.addr, align 8
  %call2 = call i32 @__RV_sstrlen(ptr noundef %10)
  %add3 = add nsw i32 %call2, 1
  %conv4 = sext i32 %add3 to i64
  %11 = load ptr, ptr %file_name.addr, align 8
  %12 = load ptr, ptr %func_name.addr, align 8
  %13 = load i32, ptr %s2_line.addr, align 4
  %14 = load i32, ptr %s2_col.addr, align 4
  %15 = load ptr, ptr %s2_name.addr, align 8
  %call5 = call ptr @__RV_check_dpv(ptr noundef %8, ptr noundef %9, i64 noundef %conv4, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, ptr noundef %15)
  %16 = load ptr, ptr %str1.addr, align 8
  %17 = load ptr, ptr %str2.addr, align 8
  %call6 = call ptr @strpbrk(ptr noundef %16, ptr noundef %17) #15
  store ptr %call6, ptr %ret, align 8
  %18 = load ptr, ptr %ret, align 8
  %cmp = icmp eq ptr %18, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %19 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %19)
  br label %if.end

if.else:                                          ; preds = %entry
  %20 = load ptr, ptr %ret_pmd.addr, align 8
  %21 = load ptr, ptr %str1_pmd.addr, align 8
  %call8 = call ptr @__RV_pmd_cp_pmd(ptr noundef %20, ptr noundef %21)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %22 = load ptr, ptr %str2_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %22)
  %23 = load ptr, ptr %str1_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %23)
  %24 = load ptr, ptr %ret, align 8
  ret ptr %24
}

; Function Attrs: nounwind willreturn memory(read)
declare ptr @strpbrk(ptr noundef, ptr noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_strrchr(ptr noundef %ret_pmd, ptr noundef %str_pmd, ptr noundef %str, i32 noundef %c, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %str_pmd.addr = alloca ptr, align 8
  %str.addr = alloca ptr, align 8
  %c.addr = alloca i32, align 4
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store ptr %str_pmd, ptr %str_pmd.addr, align 8
  store ptr %str, ptr %str.addr, align 8
  store i32 %c, ptr %c.addr, align 4
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  %0 = load ptr, ptr %str_pmd.addr, align 8
  %1 = load ptr, ptr %str.addr, align 8
  %2 = load ptr, ptr %str.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %str.addr, align 8
  %9 = load i32, ptr %c.addr, align 4
  %call2 = call ptr @strrchr(ptr noundef %8, i32 noundef %9) #15
  store ptr %call2, ptr %ret, align 8
  %10 = load ptr, ptr %ret, align 8
  %cmp = icmp eq ptr %10, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %11 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %11)
  br label %if.end

if.else:                                          ; preds = %entry
  %12 = load ptr, ptr %ret_pmd.addr, align 8
  %13 = load ptr, ptr %str_pmd.addr, align 8
  %call4 = call ptr @__RV_pmd_cp_pmd(ptr noundef %12, ptr noundef %13)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %14 = load ptr, ptr %str_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %14)
  %15 = load ptr, ptr %ret, align 8
  ret ptr %15
}

; Function Attrs: nounwind willreturn memory(read)
declare ptr @strrchr(ptr noundef, i32 noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_strsignal(ptr noundef %ret_pmd, i32 noundef %__sig) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %__sig.addr = alloca i32, align 4
  %ret = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store i32 %__sig, ptr %__sig.addr, align 4
  %0 = load i32, ptr %__sig.addr, align 4
  %call = call ptr @strsignal(i32 noundef %0) #13
  store ptr %call, ptr %ret, align 8
  %1 = load ptr, ptr %ret, align 8
  %cmp = icmp eq ptr %1, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %2)
  br label %if.end

if.else:                                          ; preds = %entry
  %3 = load ptr, ptr %ret_pmd.addr, align 8
  %4 = load ptr, ptr @__RV_library_sa, align 8
  %5 = load ptr, ptr %ret, align 8
  %6 = load ptr, ptr %ret, align 8
  %7 = load ptr, ptr %ret, align 8
  %call1 = call i32 @__RV_sstrlen(ptr noundef %7)
  %idx.ext = sext i32 %call1 to i64
  %add.ptr = getelementptr inbounds i8, ptr %6, i64 %idx.ext
  %add.ptr2 = getelementptr inbounds i8, ptr %add.ptr, i64 1
  %call3 = call ptr @__RV_pmd_set(ptr noundef %3, ptr noundef %4, i32 noundef 0, ptr noundef %5, ptr noundef %add.ptr2)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %8 = load ptr, ptr %ret, align 8
  ret ptr %8
}

; Function Attrs: nounwind
declare ptr @strsignal(i32 noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @_RV_strspn(ptr noundef %str1_pmd, ptr noundef %str2_pmd, ptr noundef %str1, ptr noundef %str2, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name, i32 noundef %t_line, i32 noundef %t_col, ptr noundef %t_name) #0 {
entry:
  %str1_pmd.addr = alloca ptr, align 8
  %str2_pmd.addr = alloca ptr, align 8
  %str1.addr = alloca ptr, align 8
  %str2.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  %t_line.addr = alloca i32, align 4
  %t_col.addr = alloca i32, align 4
  %t_name.addr = alloca ptr, align 8
  store ptr %str1_pmd, ptr %str1_pmd.addr, align 8
  store ptr %str2_pmd, ptr %str2_pmd.addr, align 8
  store ptr %str1, ptr %str1.addr, align 8
  store ptr %str2, ptr %str2.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  store i32 %t_line, ptr %t_line.addr, align 4
  store i32 %t_col, ptr %t_col.addr, align 4
  store ptr %t_name, ptr %t_name.addr, align 8
  %0 = load ptr, ptr %str1_pmd.addr, align 8
  %1 = load ptr, ptr %str1.addr, align 8
  %2 = load ptr, ptr %str1.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %str2_pmd.addr, align 8
  %9 = load ptr, ptr %str2.addr, align 8
  %10 = load ptr, ptr %str2.addr, align 8
  %call2 = call i32 @__RV_sstrlen(ptr noundef %10)
  %add3 = add nsw i32 %call2, 1
  %conv4 = sext i32 %add3 to i64
  %11 = load ptr, ptr %file_name.addr, align 8
  %12 = load ptr, ptr %func_name.addr, align 8
  %13 = load i32, ptr %t_line.addr, align 4
  %14 = load i32, ptr %t_col.addr, align 4
  %15 = load ptr, ptr %t_name.addr, align 8
  %call5 = call ptr @__RV_check_dpv(ptr noundef %8, ptr noundef %9, i64 noundef %conv4, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, ptr noundef %15)
  %16 = load ptr, ptr %str1_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %16)
  %17 = load ptr, ptr %str2_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %17)
  %18 = load ptr, ptr %str1.addr, align 8
  %19 = load ptr, ptr %str2.addr, align 8
  %call6 = call i64 @strspn(ptr noundef %18, ptr noundef %19) #15
  ret i64 %call6
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strspn(ptr noundef, ptr noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_strstr(ptr noundef %ret_pmd, ptr noundef %haystack_pmd, ptr noundef %needle_pmd, ptr noundef %haystack, ptr noundef %needle, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %h_line, i32 noundef %h_col, ptr noundef %h_name, i32 noundef %n_line, i32 noundef %n_col, ptr noundef %n_name) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %haystack_pmd.addr = alloca ptr, align 8
  %needle_pmd.addr = alloca ptr, align 8
  %haystack.addr = alloca ptr, align 8
  %needle.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %h_line.addr = alloca i32, align 4
  %h_col.addr = alloca i32, align 4
  %h_name.addr = alloca ptr, align 8
  %n_line.addr = alloca i32, align 4
  %n_col.addr = alloca i32, align 4
  %n_name.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store ptr %haystack_pmd, ptr %haystack_pmd.addr, align 8
  store ptr %needle_pmd, ptr %needle_pmd.addr, align 8
  store ptr %haystack, ptr %haystack.addr, align 8
  store ptr %needle, ptr %needle.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %h_line, ptr %h_line.addr, align 4
  store i32 %h_col, ptr %h_col.addr, align 4
  store ptr %h_name, ptr %h_name.addr, align 8
  store i32 %n_line, ptr %n_line.addr, align 4
  store i32 %n_col, ptr %n_col.addr, align 4
  store ptr %n_name, ptr %n_name.addr, align 8
  %0 = load ptr, ptr %haystack_pmd.addr, align 8
  %1 = load ptr, ptr %haystack.addr, align 8
  %2 = load ptr, ptr %haystack.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %h_line.addr, align 4
  %6 = load i32, ptr %h_col.addr, align 4
  %7 = load ptr, ptr %h_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %needle_pmd.addr, align 8
  %9 = load ptr, ptr %needle.addr, align 8
  %10 = load ptr, ptr %needle.addr, align 8
  %call2 = call i32 @__RV_sstrlen(ptr noundef %10)
  %add3 = add nsw i32 %call2, 1
  %conv4 = sext i32 %add3 to i64
  %11 = load ptr, ptr %file_name.addr, align 8
  %12 = load ptr, ptr %func_name.addr, align 8
  %13 = load i32, ptr %n_line.addr, align 4
  %14 = load i32, ptr %n_col.addr, align 4
  %15 = load ptr, ptr %n_name.addr, align 8
  %call5 = call ptr @__RV_check_dpv(ptr noundef %8, ptr noundef %9, i64 noundef %conv4, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, ptr noundef %15)
  %16 = load ptr, ptr %haystack.addr, align 8
  %17 = load ptr, ptr %needle.addr, align 8
  %call6 = call ptr @strstr(ptr noundef %16, ptr noundef %17) #15
  store ptr %call6, ptr %ret, align 8
  %18 = load ptr, ptr %ret, align 8
  %cmp = icmp eq ptr %18, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %19 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %19)
  br label %if.end

if.else:                                          ; preds = %entry
  %20 = load ptr, ptr %ret_pmd.addr, align 8
  %21 = load ptr, ptr %haystack_pmd.addr, align 8
  %call8 = call ptr @__RV_pmd_cp_pmd(ptr noundef %20, ptr noundef %21)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %22 = load ptr, ptr %haystack_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %22)
  %23 = load ptr, ptr %needle_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %23)
  %24 = load ptr, ptr %ret, align 8
  ret ptr %24
}

; Function Attrs: nounwind willreturn memory(read)
declare ptr @strstr(ptr noundef, ptr noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_strtok(ptr noundef %ret_pmd, ptr noundef %str_pmd, ptr noundef %delim_pmd, ptr noundef %str, ptr noundef %delim, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name, i32 noundef %d_line, i32 noundef %d_col, ptr noundef %d_name) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %str_pmd.addr = alloca ptr, align 8
  %delim_pmd.addr = alloca ptr, align 8
  %str.addr = alloca ptr, align 8
  %delim.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  %d_line.addr = alloca i32, align 4
  %d_col.addr = alloca i32, align 4
  %d_name.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store ptr %str_pmd, ptr %str_pmd.addr, align 8
  store ptr %delim_pmd, ptr %delim_pmd.addr, align 8
  store ptr %str, ptr %str.addr, align 8
  store ptr %delim, ptr %delim.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  store i32 %d_line, ptr %d_line.addr, align 4
  store i32 %d_col, ptr %d_col.addr, align 4
  store ptr %d_name, ptr %d_name.addr, align 8
  %0 = load ptr, ptr %str.addr, align 8
  %tobool = icmp ne ptr %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %str_pmd.addr, align 8
  %call = call ptr @__RV_pmd_cp_pmd(ptr noundef @_RV_strtok.pmd, ptr noundef %1)
  %2 = load ptr, ptr %str_pmd.addr, align 8
  %3 = load ptr, ptr %str.addr, align 8
  %4 = load ptr, ptr %str.addr, align 8
  %call1 = call i32 @__RV_sstrlen(ptr noundef %4)
  %add = add nsw i32 %call1, 1
  %conv = sext i32 %add to i64
  %5 = load ptr, ptr %file_name.addr, align 8
  %6 = load ptr, ptr %func_name.addr, align 8
  %7 = load i32, ptr %s_line.addr, align 4
  %8 = load i32, ptr %s_col.addr, align 4
  %9 = load ptr, ptr %s_name.addr, align 8
  %call2 = call ptr @__RV_check_dpv(ptr noundef %2, ptr noundef %3, i64 noundef %conv, ptr noundef %5, ptr noundef %6, i32 noundef %7, i32 noundef %8, ptr noundef %9)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %10 = load ptr, ptr %delim_pmd.addr, align 8
  %11 = load ptr, ptr %delim.addr, align 8
  %12 = load ptr, ptr %delim.addr, align 8
  %call3 = call i32 @__RV_sstrlen(ptr noundef %12)
  %add4 = add nsw i32 %call3, 1
  %conv5 = sext i32 %add4 to i64
  %13 = load ptr, ptr %file_name.addr, align 8
  %14 = load ptr, ptr %func_name.addr, align 8
  %15 = load i32, ptr %d_line.addr, align 4
  %16 = load i32, ptr %d_col.addr, align 4
  %17 = load ptr, ptr %d_name.addr, align 8
  %call6 = call ptr @__RV_check_dpv(ptr noundef %10, ptr noundef %11, i64 noundef %conv5, ptr noundef %13, ptr noundef %14, i32 noundef %15, i32 noundef %16, ptr noundef %17)
  %18 = load ptr, ptr %str.addr, align 8
  %19 = load ptr, ptr %delim.addr, align 8
  %call7 = call ptr @strtok(ptr noundef %18, ptr noundef %19) #13
  store ptr %call7, ptr %ret, align 8
  %20 = load ptr, ptr %ret, align 8
  %cmp = icmp eq ptr %20, null
  br i1 %cmp, label %if.then9, label %if.else

if.then9:                                         ; preds = %if.end
  %21 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %21)
  br label %if.end11

if.else:                                          ; preds = %if.end
  %22 = load ptr, ptr %ret_pmd.addr, align 8
  %call10 = call ptr @__RV_pmd_cp_pmd(ptr noundef %22, ptr noundef @_RV_strtok.pmd)
  br label %if.end11

if.end11:                                         ; preds = %if.else, %if.then9
  %23 = load ptr, ptr %delim_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %23)
  %24 = load ptr, ptr %str_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %24)
  %25 = load ptr, ptr %ret, align 8
  ret ptr %25
}

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @_RV_strxfrm(ptr noundef %dest_pmd, ptr noundef %src_pmd, ptr noundef %dest, ptr noundef %src, i64 noundef %n, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %d_line, i32 noundef %d_col, ptr noundef %d_name, i32 noundef %s_line, i32 noundef %s_col, ptr noundef %s_name) #0 {
entry:
  %dest_pmd.addr = alloca ptr, align 8
  %src_pmd.addr = alloca ptr, align 8
  %dest.addr = alloca ptr, align 8
  %src.addr = alloca ptr, align 8
  %n.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %d_line.addr = alloca i32, align 4
  %d_col.addr = alloca i32, align 4
  %d_name.addr = alloca ptr, align 8
  %s_line.addr = alloca i32, align 4
  %s_col.addr = alloca i32, align 4
  %s_name.addr = alloca ptr, align 8
  store ptr %dest_pmd, ptr %dest_pmd.addr, align 8
  store ptr %src_pmd, ptr %src_pmd.addr, align 8
  store ptr %dest, ptr %dest.addr, align 8
  store ptr %src, ptr %src.addr, align 8
  store i64 %n, ptr %n.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %d_line, ptr %d_line.addr, align 4
  store i32 %d_col, ptr %d_col.addr, align 4
  store ptr %d_name, ptr %d_name.addr, align 8
  store i32 %s_line, ptr %s_line.addr, align 4
  store i32 %s_col, ptr %s_col.addr, align 4
  store ptr %s_name, ptr %s_name.addr, align 8
  %0 = load ptr, ptr %src_pmd.addr, align 8
  %1 = load ptr, ptr %src.addr, align 8
  %2 = load i64, ptr %n.addr, align 8
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %s_line.addr, align 4
  %6 = load i32, ptr %s_col.addr, align 4
  %7 = load ptr, ptr %s_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %dest_pmd.addr, align 8
  %9 = load ptr, ptr %dest.addr, align 8
  %10 = load i64, ptr %n.addr, align 8
  %11 = load ptr, ptr %file_name.addr, align 8
  %12 = load ptr, ptr %func_name.addr, align 8
  %13 = load i32, ptr %d_line.addr, align 4
  %14 = load i32, ptr %d_col.addr, align 4
  %15 = load ptr, ptr %d_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %8, ptr noundef %9, i64 noundef %10, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, ptr noundef %15)
  %16 = load ptr, ptr %src_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %16)
  %17 = load ptr, ptr %dest_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %17)
  %18 = load ptr, ptr %dest.addr, align 8
  %19 = load ptr, ptr %src.addr, align 8
  %20 = load i64, ptr %n.addr, align 8
  %call2 = call i64 @strxfrm(ptr noundef %18, ptr noundef %19, i64 noundef %20) #13
  ret i64 %call2
}

; Function Attrs: nounwind
declare i64 @strxfrm(ptr noundef, ptr noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_select(ptr noundef %readfds_pmd, ptr noundef %writefds_pmd, ptr noundef %exceptfds_pmd, ptr noundef %timeout_pmd, i32 noundef %__nfds, ptr noalias noundef %__readfds, ptr noalias noundef %__writefds, ptr noalias noundef %__exceptfds, ptr noalias noundef %__timeout, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %r_line, i32 noundef %r_col, ptr noundef %r_name, i32 noundef %w_line, i32 noundef %w_col, ptr noundef %w_name, i32 noundef %e_line, i32 noundef %e_col, ptr noundef %e_name, i32 noundef %t_line, i32 noundef %t_col, ptr noundef %t_name) #0 {
entry:
  %readfds_pmd.addr = alloca ptr, align 8
  %writefds_pmd.addr = alloca ptr, align 8
  %exceptfds_pmd.addr = alloca ptr, align 8
  %timeout_pmd.addr = alloca ptr, align 8
  %__nfds.addr = alloca i32, align 4
  %__readfds.addr = alloca ptr, align 8
  %__writefds.addr = alloca ptr, align 8
  %__exceptfds.addr = alloca ptr, align 8
  %__timeout.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %r_line.addr = alloca i32, align 4
  %r_col.addr = alloca i32, align 4
  %r_name.addr = alloca ptr, align 8
  %w_line.addr = alloca i32, align 4
  %w_col.addr = alloca i32, align 4
  %w_name.addr = alloca ptr, align 8
  %e_line.addr = alloca i32, align 4
  %e_col.addr = alloca i32, align 4
  %e_name.addr = alloca ptr, align 8
  %t_line.addr = alloca i32, align 4
  %t_col.addr = alloca i32, align 4
  %t_name.addr = alloca ptr, align 8
  store ptr %readfds_pmd, ptr %readfds_pmd.addr, align 8
  store ptr %writefds_pmd, ptr %writefds_pmd.addr, align 8
  store ptr %exceptfds_pmd, ptr %exceptfds_pmd.addr, align 8
  store ptr %timeout_pmd, ptr %timeout_pmd.addr, align 8
  store i32 %__nfds, ptr %__nfds.addr, align 4
  store ptr %__readfds, ptr %__readfds.addr, align 8
  store ptr %__writefds, ptr %__writefds.addr, align 8
  store ptr %__exceptfds, ptr %__exceptfds.addr, align 8
  store ptr %__timeout, ptr %__timeout.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %r_line, ptr %r_line.addr, align 4
  store i32 %r_col, ptr %r_col.addr, align 4
  store ptr %r_name, ptr %r_name.addr, align 8
  store i32 %w_line, ptr %w_line.addr, align 4
  store i32 %w_col, ptr %w_col.addr, align 4
  store ptr %w_name, ptr %w_name.addr, align 8
  store i32 %e_line, ptr %e_line.addr, align 4
  store i32 %e_col, ptr %e_col.addr, align 4
  store ptr %e_name, ptr %e_name.addr, align 8
  store i32 %t_line, ptr %t_line.addr, align 4
  store i32 %t_col, ptr %t_col.addr, align 4
  store ptr %t_name, ptr %t_name.addr, align 8
  %0 = load ptr, ptr %readfds_pmd.addr, align 8
  %1 = load ptr, ptr %__readfds.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %r_line.addr, align 4
  %5 = load i32, ptr %r_col.addr, align 4
  %6 = load ptr, ptr %r_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 128, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %writefds_pmd.addr, align 8
  %8 = load ptr, ptr %__writefds.addr, align 8
  %9 = load ptr, ptr %file_name.addr, align 8
  %10 = load ptr, ptr %func_name.addr, align 8
  %11 = load i32, ptr %w_line.addr, align 4
  %12 = load i32, ptr %w_col.addr, align 4
  %13 = load ptr, ptr %w_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %7, ptr noundef %8, i64 noundef 128, ptr noundef %9, ptr noundef %10, i32 noundef %11, i32 noundef %12, ptr noundef %13)
  %14 = load ptr, ptr %exceptfds_pmd.addr, align 8
  %15 = load ptr, ptr %__exceptfds.addr, align 8
  %16 = load ptr, ptr %file_name.addr, align 8
  %17 = load ptr, ptr %func_name.addr, align 8
  %18 = load i32, ptr %e_line.addr, align 4
  %19 = load i32, ptr %e_col.addr, align 4
  %20 = load ptr, ptr %e_name.addr, align 8
  %call2 = call ptr @__RV_check_dpv(ptr noundef %14, ptr noundef %15, i64 noundef 128, ptr noundef %16, ptr noundef %17, i32 noundef %18, i32 noundef %19, ptr noundef %20)
  %21 = load ptr, ptr %__timeout.addr, align 8
  %tobool = icmp ne ptr %21, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %22 = load ptr, ptr %timeout_pmd.addr, align 8
  %23 = load ptr, ptr %__timeout.addr, align 8
  %24 = load ptr, ptr %file_name.addr, align 8
  %25 = load ptr, ptr %func_name.addr, align 8
  %26 = load i32, ptr %t_line.addr, align 4
  %27 = load i32, ptr %t_col.addr, align 4
  %28 = load ptr, ptr %t_name.addr, align 8
  %call3 = call ptr @__RV_check_dpv(ptr noundef %22, ptr noundef %23, i64 noundef 16, ptr noundef %24, ptr noundef %25, i32 noundef %26, i32 noundef %27, ptr noundef %28)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %29 = load ptr, ptr %readfds_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %29)
  %30 = load ptr, ptr %writefds_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %30)
  %31 = load ptr, ptr %exceptfds_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %31)
  %32 = load ptr, ptr %timeout_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %32)
  %33 = load i32, ptr %__nfds.addr, align 4
  %34 = load ptr, ptr %__readfds.addr, align 8
  %35 = load ptr, ptr %__writefds.addr, align 8
  %36 = load ptr, ptr %__exceptfds.addr, align 8
  %37 = load ptr, ptr %__timeout.addr, align 8
  %call4 = call i32 @select(i32 noundef %33, ptr noundef %34, ptr noundef %35, ptr noundef %36, ptr noundef %37)
  ret i32 %call4
}

declare i32 @select(i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_access(ptr noundef %name_pmd, ptr noundef %__name, i32 noundef %__type, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %n_line, i32 noundef %n_col, ptr noundef %n_name) #0 {
entry:
  %name_pmd.addr = alloca ptr, align 8
  %__name.addr = alloca ptr, align 8
  %__type.addr = alloca i32, align 4
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %n_line.addr = alloca i32, align 4
  %n_col.addr = alloca i32, align 4
  %n_name.addr = alloca ptr, align 8
  store ptr %name_pmd, ptr %name_pmd.addr, align 8
  store ptr %__name, ptr %__name.addr, align 8
  store i32 %__type, ptr %__type.addr, align 4
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %n_line, ptr %n_line.addr, align 4
  store i32 %n_col, ptr %n_col.addr, align 4
  store ptr %n_name, ptr %n_name.addr, align 8
  %0 = load ptr, ptr %name_pmd.addr, align 8
  %1 = load ptr, ptr %__name.addr, align 8
  %2 = load ptr, ptr %__name.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %n_line.addr, align 4
  %6 = load i32, ptr %n_col.addr, align 4
  %7 = load ptr, ptr %n_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %name_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %8)
  %9 = load ptr, ptr %__name.addr, align 8
  %10 = load i32, ptr %__type.addr, align 4
  %call2 = call i32 @access(ptr noundef %9, i32 noundef %10) #13
  ret i32 %call2
}

; Function Attrs: nounwind
declare i32 @access(ptr noundef, i32 noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_chdir(ptr noundef %path_pmd, ptr noundef %__path, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %p_line, i32 noundef %p_col, ptr noundef %p_name) #0 {
entry:
  %path_pmd.addr = alloca ptr, align 8
  %__path.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %p_line.addr = alloca i32, align 4
  %p_col.addr = alloca i32, align 4
  %p_name.addr = alloca ptr, align 8
  store ptr %path_pmd, ptr %path_pmd.addr, align 8
  store ptr %__path, ptr %__path.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %p_line, ptr %p_line.addr, align 4
  store i32 %p_col, ptr %p_col.addr, align 4
  store ptr %p_name, ptr %p_name.addr, align 8
  %0 = load ptr, ptr %path_pmd.addr, align 8
  %1 = load ptr, ptr %__path.addr, align 8
  %2 = load ptr, ptr %__path.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %p_line.addr, align 4
  %6 = load i32, ptr %p_col.addr, align 4
  %7 = load ptr, ptr %p_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %path_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %8)
  %9 = load ptr, ptr %__path.addr, align 8
  %call2 = call i32 @chdir(ptr noundef %9) #13
  ret i32 %call2
}

; Function Attrs: nounwind
declare i32 @chdir(ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_execv(ptr noundef %path_pmd, ptr noundef %argv_pmd, ptr noundef %__path, ptr noundef %__argv, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %p_line, i32 noundef %p_col, ptr noundef %p_name, i32 noundef %a_line, i32 noundef %a_col, ptr noundef %a_name) #0 {
entry:
  %path_pmd.addr = alloca ptr, align 8
  %argv_pmd.addr = alloca ptr, align 8
  %__path.addr = alloca ptr, align 8
  %__argv.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %p_line.addr = alloca i32, align 4
  %p_col.addr = alloca i32, align 4
  %p_name.addr = alloca ptr, align 8
  %a_line.addr = alloca i32, align 4
  %a_col.addr = alloca i32, align 4
  %a_name.addr = alloca ptr, align 8
  %i = alloca i32, align 4
  store ptr %path_pmd, ptr %path_pmd.addr, align 8
  store ptr %argv_pmd, ptr %argv_pmd.addr, align 8
  store ptr %__path, ptr %__path.addr, align 8
  store ptr %__argv, ptr %__argv.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %p_line, ptr %p_line.addr, align 4
  store i32 %p_col, ptr %p_col.addr, align 4
  store ptr %p_name, ptr %p_name.addr, align 8
  store i32 %a_line, ptr %a_line.addr, align 4
  store i32 %a_col, ptr %a_col.addr, align 4
  store ptr %a_name, ptr %a_name.addr, align 8
  store i32 0, ptr %i, align 4
  %0 = load ptr, ptr %path_pmd.addr, align 8
  %1 = load ptr, ptr %__path.addr, align 8
  %2 = load ptr, ptr %__path.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %p_line.addr, align 4
  %6 = load i32, ptr %p_col.addr, align 4
  %7 = load ptr, ptr %p_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %8 = load ptr, ptr %__argv.addr, align 8
  %9 = load i32, ptr %i, align 4
  %idxprom = sext i32 %9 to i64
  %arrayidx = getelementptr inbounds ptr, ptr %8, i64 %idxprom
  %10 = load ptr, ptr %arrayidx, align 8
  %cmp = icmp ne ptr %10, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %11 = load ptr, ptr %__argv.addr, align 8
  %12 = load i32, ptr %i, align 4
  %idxprom3 = sext i32 %12 to i64
  %arrayidx4 = getelementptr inbounds ptr, ptr %11, i64 %idxprom3
  %call5 = call ptr @__RV_pmd_tbl_lookup(ptr noundef %arrayidx4)
  %13 = load ptr, ptr %__argv.addr, align 8
  %14 = load i32, ptr %i, align 4
  %idxprom6 = sext i32 %14 to i64
  %arrayidx7 = getelementptr inbounds ptr, ptr %13, i64 %idxprom6
  %15 = load ptr, ptr %arrayidx7, align 8
  %16 = load ptr, ptr %__argv.addr, align 8
  %17 = load i32, ptr %i, align 4
  %idxprom8 = sext i32 %17 to i64
  %arrayidx9 = getelementptr inbounds ptr, ptr %16, i64 %idxprom8
  %18 = load ptr, ptr %arrayidx9, align 8
  %call10 = call i32 @__RV_sstrlen(ptr noundef %18)
  %add11 = add nsw i32 %call10, 1
  %conv12 = sext i32 %add11 to i64
  %19 = load ptr, ptr %file_name.addr, align 8
  %20 = load ptr, ptr %func_name.addr, align 8
  %21 = load i32, ptr %a_line.addr, align 4
  %22 = load i32, ptr %a_col.addr, align 4
  %23 = load ptr, ptr %a_name.addr, align 8
  %call13 = call ptr @__RV_check_dpv(ptr noundef %call5, ptr noundef %15, i64 noundef %conv12, ptr noundef %19, ptr noundef %20, i32 noundef %21, i32 noundef %22, ptr noundef %23)
  %24 = load i32, ptr %i, align 4
  %inc = add nsw i32 %24, 1
  store i32 %inc, ptr %i, align 4
  br label %while.cond, !llvm.loop !47

while.end:                                        ; preds = %while.cond
  %25 = load ptr, ptr %argv_pmd.addr, align 8
  %26 = load ptr, ptr %__argv.addr, align 8
  %27 = load i32, ptr %i, align 4
  %add14 = add nsw i32 %27, 1
  %conv15 = sext i32 %add14 to i64
  %mul = mul i64 8, %conv15
  %28 = load ptr, ptr %file_name.addr, align 8
  %29 = load ptr, ptr %func_name.addr, align 8
  %30 = load i32, ptr %a_line.addr, align 4
  %31 = load i32, ptr %a_col.addr, align 4
  %32 = load ptr, ptr %a_name.addr, align 8
  %call16 = call ptr @__RV_check_dpv(ptr noundef %25, ptr noundef %26, i64 noundef %mul, ptr noundef %28, ptr noundef %29, i32 noundef %30, i32 noundef %31, ptr noundef %32)
  %33 = load ptr, ptr %path_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %33)
  %34 = load ptr, ptr %argv_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %34)
  %35 = load ptr, ptr %__path.addr, align 8
  %36 = load ptr, ptr %__argv.addr, align 8
  %call17 = call i32 @execv(ptr noundef %35, ptr noundef %36) #13
  ret i32 %call17
}

; Function Attrs: nounwind
declare i32 @execv(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_execvp(ptr noundef %file_pmd, ptr noundef %argv_pmd, ptr noundef %__file, ptr noundef %__argv, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name, i32 noundef %a_line, i32 noundef %a_col, ptr noundef %a_name) #0 {
entry:
  %file_pmd.addr = alloca ptr, align 8
  %argv_pmd.addr = alloca ptr, align 8
  %__file.addr = alloca ptr, align 8
  %__argv.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  %a_line.addr = alloca i32, align 4
  %a_col.addr = alloca i32, align 4
  %a_name.addr = alloca ptr, align 8
  %i = alloca i32, align 4
  store ptr %file_pmd, ptr %file_pmd.addr, align 8
  store ptr %argv_pmd, ptr %argv_pmd.addr, align 8
  store ptr %__file, ptr %__file.addr, align 8
  store ptr %__argv, ptr %__argv.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  store i32 %a_line, ptr %a_line.addr, align 4
  store i32 %a_col, ptr %a_col.addr, align 4
  store ptr %a_name, ptr %a_name.addr, align 8
  store i32 0, ptr %i, align 4
  %0 = load ptr, ptr %file_pmd.addr, align 8
  %1 = load ptr, ptr %__file.addr, align 8
  %2 = load ptr, ptr %__file.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %f_line.addr, align 4
  %6 = load i32, ptr %f_col.addr, align 4
  %7 = load ptr, ptr %f_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %8 = load ptr, ptr %__argv.addr, align 8
  %9 = load i32, ptr %i, align 4
  %idxprom = sext i32 %9 to i64
  %arrayidx = getelementptr inbounds ptr, ptr %8, i64 %idxprom
  %10 = load ptr, ptr %arrayidx, align 8
  %cmp = icmp ne ptr %10, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %11 = load ptr, ptr %__argv.addr, align 8
  %12 = load i32, ptr %i, align 4
  %idxprom3 = sext i32 %12 to i64
  %arrayidx4 = getelementptr inbounds ptr, ptr %11, i64 %idxprom3
  %call5 = call ptr @__RV_pmd_tbl_lookup(ptr noundef %arrayidx4)
  %13 = load ptr, ptr %__argv.addr, align 8
  %14 = load i32, ptr %i, align 4
  %idxprom6 = sext i32 %14 to i64
  %arrayidx7 = getelementptr inbounds ptr, ptr %13, i64 %idxprom6
  %15 = load ptr, ptr %arrayidx7, align 8
  %16 = load ptr, ptr %__argv.addr, align 8
  %17 = load i32, ptr %i, align 4
  %idxprom8 = sext i32 %17 to i64
  %arrayidx9 = getelementptr inbounds ptr, ptr %16, i64 %idxprom8
  %18 = load ptr, ptr %arrayidx9, align 8
  %call10 = call i32 @__RV_sstrlen(ptr noundef %18)
  %add11 = add nsw i32 %call10, 1
  %conv12 = sext i32 %add11 to i64
  %19 = load ptr, ptr %file_name.addr, align 8
  %20 = load ptr, ptr %func_name.addr, align 8
  %21 = load i32, ptr %a_line.addr, align 4
  %22 = load i32, ptr %a_col.addr, align 4
  %23 = load ptr, ptr %a_name.addr, align 8
  %call13 = call ptr @__RV_check_dpv(ptr noundef %call5, ptr noundef %15, i64 noundef %conv12, ptr noundef %19, ptr noundef %20, i32 noundef %21, i32 noundef %22, ptr noundef %23)
  %24 = load i32, ptr %i, align 4
  %inc = add nsw i32 %24, 1
  store i32 %inc, ptr %i, align 4
  br label %while.cond, !llvm.loop !48

while.end:                                        ; preds = %while.cond
  %25 = load ptr, ptr %argv_pmd.addr, align 8
  %26 = load ptr, ptr %__argv.addr, align 8
  %27 = load i32, ptr %i, align 4
  %add14 = add nsw i32 %27, 1
  %conv15 = sext i32 %add14 to i64
  %mul = mul i64 8, %conv15
  %28 = load ptr, ptr %file_name.addr, align 8
  %29 = load ptr, ptr %func_name.addr, align 8
  %30 = load i32, ptr %a_line.addr, align 4
  %31 = load i32, ptr %a_col.addr, align 4
  %32 = load ptr, ptr %a_name.addr, align 8
  %call16 = call ptr @__RV_check_dpv(ptr noundef %25, ptr noundef %26, i64 noundef %mul, ptr noundef %28, ptr noundef %29, i32 noundef %30, i32 noundef %31, ptr noundef %32)
  %33 = load ptr, ptr %file_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %33)
  %34 = load ptr, ptr %argv_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %34)
  %35 = load ptr, ptr %__file.addr, align 8
  %36 = load ptr, ptr %__argv.addr, align 8
  %call17 = call i32 @execvp(ptr noundef %35, ptr noundef %36) #13
  ret i32 %call17
}

; Function Attrs: nounwind
declare i32 @execvp(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @_RV_getcwd(ptr noundef %ret_pmd, ptr noundef %buf_pmd, ptr noundef %buf, i64 noundef %size, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %b_line, i32 noundef %b_col, ptr noundef %b_name) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %buf_pmd.addr = alloca ptr, align 8
  %buf.addr = alloca ptr, align 8
  %size.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %b_line.addr = alloca i32, align 4
  %b_col.addr = alloca i32, align 4
  %b_name.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store ptr %buf_pmd, ptr %buf_pmd.addr, align 8
  store ptr %buf, ptr %buf.addr, align 8
  store i64 %size, ptr %size.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %b_line, ptr %b_line.addr, align 4
  store i32 %b_col, ptr %b_col.addr, align 4
  store ptr %b_name, ptr %b_name.addr, align 8
  %0 = load ptr, ptr %buf_pmd.addr, align 8
  %1 = load ptr, ptr %buf.addr, align 8
  %2 = load i64, ptr %size.addr, align 8
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %b_line.addr, align 4
  %6 = load i32, ptr %b_col.addr, align 4
  %7 = load ptr, ptr %b_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %buf.addr, align 8
  %9 = load i64, ptr %size.addr, align 8
  %call1 = call ptr @getcwd(ptr noundef %8, i64 noundef %9) #13
  store ptr %call1, ptr %ret, align 8
  %10 = load ptr, ptr %ret, align 8
  %cmp = icmp eq ptr %10, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %11 = load ptr, ptr %ret_pmd.addr, align 8
  call void @__RV_pmd_set_null(ptr noundef %11)
  br label %if.end

if.else:                                          ; preds = %entry
  %12 = load ptr, ptr %ret_pmd.addr, align 8
  %13 = load ptr, ptr %buf_pmd.addr, align 8
  %call2 = call ptr @__RV_pmd_cp_pmd(ptr noundef %12, ptr noundef %13)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %14 = load ptr, ptr %buf_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %14)
  %15 = load ptr, ptr %ret, align 8
  ret ptr %15
}

; Function Attrs: nounwind
declare ptr @getcwd(ptr noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_link(ptr noundef %from_pmd, ptr noundef %to_pmd, ptr noundef %__from, ptr noundef %__to, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name, i32 noundef %t_line, i32 noundef %t_col, ptr noundef %t_name) #0 {
entry:
  %from_pmd.addr = alloca ptr, align 8
  %to_pmd.addr = alloca ptr, align 8
  %__from.addr = alloca ptr, align 8
  %__to.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  %t_line.addr = alloca i32, align 4
  %t_col.addr = alloca i32, align 4
  %t_name.addr = alloca ptr, align 8
  store ptr %from_pmd, ptr %from_pmd.addr, align 8
  store ptr %to_pmd, ptr %to_pmd.addr, align 8
  store ptr %__from, ptr %__from.addr, align 8
  store ptr %__to, ptr %__to.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  store i32 %t_line, ptr %t_line.addr, align 4
  store i32 %t_col, ptr %t_col.addr, align 4
  store ptr %t_name, ptr %t_name.addr, align 8
  %0 = load ptr, ptr %from_pmd.addr, align 8
  %1 = load ptr, ptr %__from.addr, align 8
  %2 = load ptr, ptr %__from.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %f_line.addr, align 4
  %6 = load i32, ptr %f_col.addr, align 4
  %7 = load ptr, ptr %f_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %to_pmd.addr, align 8
  %9 = load ptr, ptr %__to.addr, align 8
  %10 = load ptr, ptr %__to.addr, align 8
  %call2 = call i32 @__RV_sstrlen(ptr noundef %10)
  %add3 = add nsw i32 %call2, 1
  %conv4 = sext i32 %add3 to i64
  %11 = load ptr, ptr %file_name.addr, align 8
  %12 = load ptr, ptr %func_name.addr, align 8
  %13 = load i32, ptr %t_line.addr, align 4
  %14 = load i32, ptr %t_col.addr, align 4
  %15 = load ptr, ptr %t_name.addr, align 8
  %call5 = call ptr @__RV_check_dpv(ptr noundef %8, ptr noundef %9, i64 noundef %conv4, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, ptr noundef %15)
  %16 = load ptr, ptr %from_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %16)
  %17 = load ptr, ptr %to_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %17)
  %18 = load ptr, ptr %__from.addr, align 8
  %19 = load ptr, ptr %__to.addr, align 8
  %call6 = call i32 @link(ptr noundef %18, ptr noundef %19) #13
  ret i32 %call6
}

; Function Attrs: nounwind
declare i32 @link(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_pipe(ptr noundef %pipedes_pmd, ptr noundef %__pipedes, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %p_line, i32 noundef %p_col, ptr noundef %p_name) #0 {
entry:
  %pipedes_pmd.addr = alloca ptr, align 8
  %__pipedes.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %p_line.addr = alloca i32, align 4
  %p_col.addr = alloca i32, align 4
  %p_name.addr = alloca ptr, align 8
  store ptr %pipedes_pmd, ptr %pipedes_pmd.addr, align 8
  store ptr %__pipedes, ptr %__pipedes.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %p_line, ptr %p_line.addr, align 4
  store i32 %p_col, ptr %p_col.addr, align 4
  store ptr %p_name, ptr %p_name.addr, align 8
  %0 = load ptr, ptr %pipedes_pmd.addr, align 8
  %1 = load ptr, ptr %__pipedes.addr, align 8
  %2 = load ptr, ptr %file_name.addr, align 8
  %3 = load ptr, ptr %func_name.addr, align 8
  %4 = load i32, ptr %p_line.addr, align 4
  %5 = load i32, ptr %p_col.addr, align 4
  %6 = load ptr, ptr %p_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef 4, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %pipedes_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %7)
  %8 = load ptr, ptr %__pipedes.addr, align 8
  %call1 = call i32 @pipe(ptr noundef %8) #13
  ret i32 %call1
}

; Function Attrs: nounwind
declare i32 @pipe(ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @_RV_read(ptr noundef %buf_pmd, i32 noundef %fd, ptr noundef %buf, i64 noundef %nbytes, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %b_line, i32 noundef %b_col, ptr noundef %b_name) #0 {
entry:
  %buf_pmd.addr = alloca ptr, align 8
  %fd.addr = alloca i32, align 4
  %buf.addr = alloca ptr, align 8
  %nbytes.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %b_line.addr = alloca i32, align 4
  %b_col.addr = alloca i32, align 4
  %b_name.addr = alloca ptr, align 8
  store ptr %buf_pmd, ptr %buf_pmd.addr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  store ptr %buf, ptr %buf.addr, align 8
  store i64 %nbytes, ptr %nbytes.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %b_line, ptr %b_line.addr, align 4
  store i32 %b_col, ptr %b_col.addr, align 4
  store ptr %b_name, ptr %b_name.addr, align 8
  %0 = load ptr, ptr %buf_pmd.addr, align 8
  %1 = load ptr, ptr %buf.addr, align 8
  %2 = load i64, ptr %nbytes.addr, align 8
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %b_line.addr, align 4
  %6 = load i32, ptr %b_col.addr, align 4
  %7 = load ptr, ptr %b_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %buf_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %8)
  %9 = load i32, ptr %fd.addr, align 4
  %10 = load ptr, ptr %buf.addr, align 8
  %11 = load i64, ptr %nbytes.addr, align 8
  %call1 = call i64 @read(i32 noundef %9, ptr noundef %10, i64 noundef %11)
  ret i64 %call1
}

declare i64 @read(i32 noundef, ptr noundef, i64 noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_rmdir(ptr noundef %path_pmd, ptr noundef %__path, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %p_line, i32 noundef %p_col, ptr noundef %p_name) #0 {
entry:
  %path_pmd.addr = alloca ptr, align 8
  %__path.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %p_line.addr = alloca i32, align 4
  %p_col.addr = alloca i32, align 4
  %p_name.addr = alloca ptr, align 8
  store ptr %path_pmd, ptr %path_pmd.addr, align 8
  store ptr %__path, ptr %__path.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %p_line, ptr %p_line.addr, align 4
  store i32 %p_col, ptr %p_col.addr, align 4
  store ptr %p_name, ptr %p_name.addr, align 8
  %0 = load ptr, ptr %path_pmd.addr, align 8
  %1 = load ptr, ptr %__path.addr, align 8
  %2 = load ptr, ptr %__path.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %p_line.addr, align 4
  %6 = load i32, ptr %p_col.addr, align 4
  %7 = load ptr, ptr %p_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %path_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %8)
  %9 = load ptr, ptr %__path.addr, align 8
  %call2 = call i32 @rmdir(ptr noundef %9) #13
  ret i32 %call2
}

; Function Attrs: nounwind
declare i32 @rmdir(ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_truncate(ptr noundef %file_pmd, ptr noundef %__file, i64 noundef %__length, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %f_line, i32 noundef %f_col, ptr noundef %f_name) #0 {
entry:
  %file_pmd.addr = alloca ptr, align 8
  %__file.addr = alloca ptr, align 8
  %__length.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %f_line.addr = alloca i32, align 4
  %f_col.addr = alloca i32, align 4
  %f_name.addr = alloca ptr, align 8
  store ptr %file_pmd, ptr %file_pmd.addr, align 8
  store ptr %__file, ptr %__file.addr, align 8
  store i64 %__length, ptr %__length.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %f_line, ptr %f_line.addr, align 4
  store i32 %f_col, ptr %f_col.addr, align 4
  store ptr %f_name, ptr %f_name.addr, align 8
  %0 = load ptr, ptr %file_pmd.addr, align 8
  %1 = load ptr, ptr %__file.addr, align 8
  %2 = load ptr, ptr %__file.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %f_line.addr, align 4
  %6 = load i32, ptr %f_col.addr, align 4
  %7 = load ptr, ptr %f_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %file_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %8)
  %9 = load ptr, ptr %__file.addr, align 8
  %10 = load i64, ptr %__length.addr, align 8
  %call2 = call i32 @truncate(ptr noundef %9, i64 noundef %10) #13
  ret i32 %call2
}

; Function Attrs: nounwind
declare i32 @truncate(ptr noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_unlink(ptr noundef %path_pmd, ptr noundef %path, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %p_line, i32 noundef %p_col, ptr noundef %p_name) #0 {
entry:
  %path_pmd.addr = alloca ptr, align 8
  %path.addr = alloca ptr, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %p_line.addr = alloca i32, align 4
  %p_col.addr = alloca i32, align 4
  %p_name.addr = alloca ptr, align 8
  store ptr %path_pmd, ptr %path_pmd.addr, align 8
  store ptr %path, ptr %path.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %p_line, ptr %p_line.addr, align 4
  store i32 %p_col, ptr %p_col.addr, align 4
  store ptr %p_name, ptr %p_name.addr, align 8
  %0 = load ptr, ptr %path_pmd.addr, align 8
  %1 = load ptr, ptr %path.addr, align 8
  %2 = load ptr, ptr %path.addr, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %2)
  %add = add nsw i32 %call, 1
  %conv = sext i32 %add to i64
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %p_line.addr, align 4
  %6 = load i32, ptr %p_col.addr, align 4
  %7 = load ptr, ptr %p_name.addr, align 8
  %call1 = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %conv, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %path_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %8)
  %9 = load ptr, ptr %path.addr, align 8
  %call2 = call i32 @unlink(ptr noundef %9) #13
  ret i32 %call2
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @_RV_write(ptr noundef %buf_pmd, i32 noundef %fd, ptr noundef %buf, i64 noundef %nbytes, ptr noundef %file_name, ptr noundef %func_name, i32 noundef %b_line, i32 noundef %b_col, ptr noundef %b_name) #0 {
entry:
  %buf_pmd.addr = alloca ptr, align 8
  %fd.addr = alloca i32, align 4
  %buf.addr = alloca ptr, align 8
  %nbytes.addr = alloca i64, align 8
  %file_name.addr = alloca ptr, align 8
  %func_name.addr = alloca ptr, align 8
  %b_line.addr = alloca i32, align 4
  %b_col.addr = alloca i32, align 4
  %b_name.addr = alloca ptr, align 8
  store ptr %buf_pmd, ptr %buf_pmd.addr, align 8
  store i32 %fd, ptr %fd.addr, align 4
  store ptr %buf, ptr %buf.addr, align 8
  store i64 %nbytes, ptr %nbytes.addr, align 8
  store ptr %file_name, ptr %file_name.addr, align 8
  store ptr %func_name, ptr %func_name.addr, align 8
  store i32 %b_line, ptr %b_line.addr, align 4
  store i32 %b_col, ptr %b_col.addr, align 4
  store ptr %b_name, ptr %b_name.addr, align 8
  %0 = load ptr, ptr %buf_pmd.addr, align 8
  %1 = load ptr, ptr %buf.addr, align 8
  %2 = load i64, ptr %nbytes.addr, align 8
  %3 = load ptr, ptr %file_name.addr, align 8
  %4 = load ptr, ptr %func_name.addr, align 8
  %5 = load i32, ptr %b_line.addr, align 4
  %6 = load i32, ptr %b_col.addr, align 4
  %7 = load ptr, ptr %b_name.addr, align 8
  %call = call ptr @__RV_check_dpv(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %buf_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %8)
  %9 = load i32, ptr %fd.addr, align 4
  %10 = load ptr, ptr %buf.addr, align 8
  %11 = load i64, ptr %nbytes.addr, align 8
  %call1 = call i64 @write(i32 noundef %9, ptr noundef %10, i64 noundef %11)
  ret i64 %call1
}

declare i64 @write(i32 noundef, ptr noundef, i64 noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_unistd_init_code() #0 {
entry:
  %i = alloca i32, align 4
  store i32 0, ptr %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load ptr, ptr @environ, align 8
  %1 = load i32, ptr %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds ptr, ptr %0, i64 %idxprom
  %2 = load ptr, ptr %arrayidx, align 8
  %cmp = icmp ne ptr %2, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load ptr, ptr @environ, align 8
  %4 = load i32, ptr %i, align 4
  %idx.ext = sext i32 %4 to i64
  %add.ptr = getelementptr inbounds ptr, ptr %3, i64 %idx.ext
  %5 = load ptr, ptr @__RV_global_sa, align 8
  %6 = load ptr, ptr @environ, align 8
  %7 = load i32, ptr %i, align 4
  %idxprom1 = sext i32 %7 to i64
  %arrayidx2 = getelementptr inbounds ptr, ptr %6, i64 %idxprom1
  %8 = load ptr, ptr %arrayidx2, align 8
  %9 = load ptr, ptr @environ, align 8
  %10 = load i32, ptr %i, align 4
  %idxprom3 = sext i32 %10 to i64
  %arrayidx4 = getelementptr inbounds ptr, ptr %9, i64 %idxprom3
  %11 = load ptr, ptr %arrayidx4, align 8
  %12 = load ptr, ptr @environ, align 8
  %13 = load i32, ptr %i, align 4
  %idxprom5 = sext i32 %13 to i64
  %arrayidx6 = getelementptr inbounds ptr, ptr %12, i64 %idxprom5
  %14 = load ptr, ptr %arrayidx6, align 8
  %call = call i32 @__RV_sstrlen(ptr noundef %14)
  %idx.ext7 = sext i32 %call to i64
  %add.ptr8 = getelementptr inbounds i8, ptr %11, i64 %idx.ext7
  %add.ptr9 = getelementptr inbounds i8, ptr %add.ptr8, i64 1
  %call10 = call ptr @__RV_pmd_tbl_update_sa(ptr noundef %add.ptr, ptr noundef %5, ptr noundef %8, ptr noundef %add.ptr9)
  %15 = load i32, ptr %i, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, ptr %i, align 4
  br label %while.cond, !llvm.loop !49

while.end:                                        ; preds = %while.cond
  %16 = load ptr, ptr @__RV_global_sa, align 8
  %17 = load ptr, ptr @environ, align 8
  %18 = load ptr, ptr @environ, align 8
  %19 = load i32, ptr %i, align 4
  %idx.ext11 = sext i32 %19 to i64
  %add.ptr12 = getelementptr inbounds ptr, ptr %18, i64 %idx.ext11
  %add.ptr13 = getelementptr inbounds ptr, ptr %add.ptr12, i64 1
  %call14 = call ptr @__RV_pmd_tbl_update_sa(ptr noundef @environ, ptr noundef %16, ptr noundef %17, ptr noundef %add.ptr13)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_unistd_clear_code() #0 {
entry:
  %i = alloca i32, align 4
  store i32 0, ptr %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load ptr, ptr @environ, align 8
  %1 = load i32, ptr %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds ptr, ptr %0, i64 %idxprom
  %2 = load ptr, ptr %arrayidx, align 8
  %cmp = icmp ne ptr %2, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load ptr, ptr @environ, align 8
  %4 = load i32, ptr %i, align 4
  %idx.ext = sext i32 %4 to i64
  %add.ptr = getelementptr inbounds ptr, ptr %3, i64 %idx.ext
  call void @__RV_pmd_tbl_remove(ptr noundef %add.ptr)
  %5 = load i32, ptr %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, ptr %i, align 4
  br label %while.cond, !llvm.loop !50

while.end:                                        ; preds = %while.cond
  call void @__RV_pmd_tbl_remove(ptr noundef @environ)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_call_wrapper_by_ptr(ptr noundef %fp, ...) #0 {
entry:
  %fp.addr = alloca ptr, align 8
  %vl = alloca [1 x %struct.__va_list_tag], align 16
  %ret_addr = alloca ptr, align 8
  %ret_pmd = alloca ptr, align 8
  %size = alloca i64, align 8
  %ret_addr29 = alloca ptr, align 8
  %ret_pmd42 = alloca ptr, align 8
  %ptr_pmd = alloca ptr, align 8
  %ptr = alloca ptr, align 8
  %newsize = alloca i32, align 4
  %file_name = alloca ptr, align 8
  %func_name = alloca ptr, align 8
  %p_line = alloca i32, align 4
  %p_col = alloca i32, align 4
  %p_name = alloca ptr, align 8
  %ptr_pmd157 = alloca ptr, align 8
  %ptr170 = alloca ptr, align 8
  %file_name183 = alloca ptr, align 8
  %func_name196 = alloca ptr, align 8
  %p_line209 = alloca i32, align 4
  %p_col222 = alloca i32, align 4
  %p_name235 = alloca ptr, align 8
  %ret_addr253 = alloca ptr, align 8
  %ret_pmd266 = alloca ptr, align 8
  %dest_pmd = alloca ptr, align 8
  %src_pmd = alloca ptr, align 8
  %dest = alloca ptr, align 8
  %src = alloca ptr, align 8
  %n = alloca i64, align 8
  %file_name339 = alloca ptr, align 8
  %func_name352 = alloca ptr, align 8
  %d_line = alloca i32, align 4
  %d_col = alloca i32, align 4
  %d_name = alloca ptr, align 8
  %s_line = alloca i32, align 4
  %s_col = alloca i32, align 4
  %s_name = alloca ptr, align 8
  store ptr %fp, ptr %fp.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  call void @llvm.va_start(ptr %arraydecay)
  %0 = load ptr, ptr %fp.addr, align 8
  %cmp = icmp eq ptr %0, @malloc
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay1, i32 0, i32 0
  %gp_offset = load i32, ptr %gp_offset_p, align 16
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %if.then
  %1 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay1, i32 0, i32 3
  %reg_save_area = load ptr, ptr %1, align 16
  %2 = getelementptr i8, ptr %reg_save_area, i32 %gp_offset
  %3 = add i32 %gp_offset, 8
  store i32 %3, ptr %gp_offset_p, align 16
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %if.then
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay1, i32 0, i32 2
  %overflow_arg_area = load ptr, ptr %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8, ptr %overflow_arg_area, i32 8
  store ptr %overflow_arg_area.next, ptr %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi ptr [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %4 = load ptr, ptr %vaarg.addr, align 8
  store ptr %4, ptr %ret_addr, align 8
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p3 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay2, i32 0, i32 0
  %gp_offset4 = load i32, ptr %gp_offset_p3, align 16
  %fits_in_gp5 = icmp ule i32 %gp_offset4, 40
  br i1 %fits_in_gp5, label %vaarg.in_reg6, label %vaarg.in_mem8

vaarg.in_reg6:                                    ; preds = %vaarg.end
  %5 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay2, i32 0, i32 3
  %reg_save_area7 = load ptr, ptr %5, align 16
  %6 = getelementptr i8, ptr %reg_save_area7, i32 %gp_offset4
  %7 = add i32 %gp_offset4, 8
  store i32 %7, ptr %gp_offset_p3, align 16
  br label %vaarg.end12

vaarg.in_mem8:                                    ; preds = %vaarg.end
  %overflow_arg_area_p9 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay2, i32 0, i32 2
  %overflow_arg_area10 = load ptr, ptr %overflow_arg_area_p9, align 8
  %overflow_arg_area.next11 = getelementptr i8, ptr %overflow_arg_area10, i32 8
  store ptr %overflow_arg_area.next11, ptr %overflow_arg_area_p9, align 8
  br label %vaarg.end12

vaarg.end12:                                      ; preds = %vaarg.in_mem8, %vaarg.in_reg6
  %vaarg.addr13 = phi ptr [ %6, %vaarg.in_reg6 ], [ %overflow_arg_area10, %vaarg.in_mem8 ]
  %8 = load ptr, ptr %vaarg.addr13, align 8
  store ptr %8, ptr %ret_pmd, align 8
  %arraydecay14 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p15 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay14, i32 0, i32 0
  %gp_offset16 = load i32, ptr %gp_offset_p15, align 16
  %fits_in_gp17 = icmp ule i32 %gp_offset16, 40
  br i1 %fits_in_gp17, label %vaarg.in_reg18, label %vaarg.in_mem20

vaarg.in_reg18:                                   ; preds = %vaarg.end12
  %9 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay14, i32 0, i32 3
  %reg_save_area19 = load ptr, ptr %9, align 16
  %10 = getelementptr i8, ptr %reg_save_area19, i32 %gp_offset16
  %11 = add i32 %gp_offset16, 8
  store i32 %11, ptr %gp_offset_p15, align 16
  br label %vaarg.end24

vaarg.in_mem20:                                   ; preds = %vaarg.end12
  %overflow_arg_area_p21 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay14, i32 0, i32 2
  %overflow_arg_area22 = load ptr, ptr %overflow_arg_area_p21, align 8
  %overflow_arg_area.next23 = getelementptr i8, ptr %overflow_arg_area22, i32 8
  store ptr %overflow_arg_area.next23, ptr %overflow_arg_area_p21, align 8
  br label %vaarg.end24

vaarg.end24:                                      ; preds = %vaarg.in_mem20, %vaarg.in_reg18
  %vaarg.addr25 = phi ptr [ %10, %vaarg.in_reg18 ], [ %overflow_arg_area22, %vaarg.in_mem20 ]
  %12 = load i64, ptr %vaarg.addr25, align 8
  store i64 %12, ptr %size, align 8
  %arraydecay26 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  call void @llvm.va_end(ptr %arraydecay26)
  %13 = load ptr, ptr %ret_pmd, align 8
  %14 = load i64, ptr %size, align 8
  %call = call ptr @_RV_malloc(ptr noundef %13, i64 noundef %14)
  %15 = load ptr, ptr %ret_addr, align 8
  store ptr %call, ptr %15, align 8
  br label %return

if.end:                                           ; preds = %entry
  %16 = load ptr, ptr %fp.addr, align 8
  %cmp27 = icmp eq ptr %16, @realloc
  br i1 %cmp27, label %if.then28, label %if.end153

if.then28:                                        ; preds = %if.end
  %arraydecay30 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p31 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay30, i32 0, i32 0
  %gp_offset32 = load i32, ptr %gp_offset_p31, align 16
  %fits_in_gp33 = icmp ule i32 %gp_offset32, 40
  br i1 %fits_in_gp33, label %vaarg.in_reg34, label %vaarg.in_mem36

vaarg.in_reg34:                                   ; preds = %if.then28
  %17 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay30, i32 0, i32 3
  %reg_save_area35 = load ptr, ptr %17, align 16
  %18 = getelementptr i8, ptr %reg_save_area35, i32 %gp_offset32
  %19 = add i32 %gp_offset32, 8
  store i32 %19, ptr %gp_offset_p31, align 16
  br label %vaarg.end40

vaarg.in_mem36:                                   ; preds = %if.then28
  %overflow_arg_area_p37 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay30, i32 0, i32 2
  %overflow_arg_area38 = load ptr, ptr %overflow_arg_area_p37, align 8
  %overflow_arg_area.next39 = getelementptr i8, ptr %overflow_arg_area38, i32 8
  store ptr %overflow_arg_area.next39, ptr %overflow_arg_area_p37, align 8
  br label %vaarg.end40

vaarg.end40:                                      ; preds = %vaarg.in_mem36, %vaarg.in_reg34
  %vaarg.addr41 = phi ptr [ %18, %vaarg.in_reg34 ], [ %overflow_arg_area38, %vaarg.in_mem36 ]
  %20 = load ptr, ptr %vaarg.addr41, align 8
  store ptr %20, ptr %ret_addr29, align 8
  %arraydecay43 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p44 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay43, i32 0, i32 0
  %gp_offset45 = load i32, ptr %gp_offset_p44, align 16
  %fits_in_gp46 = icmp ule i32 %gp_offset45, 40
  br i1 %fits_in_gp46, label %vaarg.in_reg47, label %vaarg.in_mem49

vaarg.in_reg47:                                   ; preds = %vaarg.end40
  %21 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay43, i32 0, i32 3
  %reg_save_area48 = load ptr, ptr %21, align 16
  %22 = getelementptr i8, ptr %reg_save_area48, i32 %gp_offset45
  %23 = add i32 %gp_offset45, 8
  store i32 %23, ptr %gp_offset_p44, align 16
  br label %vaarg.end53

vaarg.in_mem49:                                   ; preds = %vaarg.end40
  %overflow_arg_area_p50 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay43, i32 0, i32 2
  %overflow_arg_area51 = load ptr, ptr %overflow_arg_area_p50, align 8
  %overflow_arg_area.next52 = getelementptr i8, ptr %overflow_arg_area51, i32 8
  store ptr %overflow_arg_area.next52, ptr %overflow_arg_area_p50, align 8
  br label %vaarg.end53

vaarg.end53:                                      ; preds = %vaarg.in_mem49, %vaarg.in_reg47
  %vaarg.addr54 = phi ptr [ %22, %vaarg.in_reg47 ], [ %overflow_arg_area51, %vaarg.in_mem49 ]
  %24 = load ptr, ptr %vaarg.addr54, align 8
  store ptr %24, ptr %ret_pmd42, align 8
  %arraydecay55 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p56 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay55, i32 0, i32 0
  %gp_offset57 = load i32, ptr %gp_offset_p56, align 16
  %fits_in_gp58 = icmp ule i32 %gp_offset57, 40
  br i1 %fits_in_gp58, label %vaarg.in_reg59, label %vaarg.in_mem61

vaarg.in_reg59:                                   ; preds = %vaarg.end53
  %25 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay55, i32 0, i32 3
  %reg_save_area60 = load ptr, ptr %25, align 16
  %26 = getelementptr i8, ptr %reg_save_area60, i32 %gp_offset57
  %27 = add i32 %gp_offset57, 8
  store i32 %27, ptr %gp_offset_p56, align 16
  br label %vaarg.end65

vaarg.in_mem61:                                   ; preds = %vaarg.end53
  %overflow_arg_area_p62 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay55, i32 0, i32 2
  %overflow_arg_area63 = load ptr, ptr %overflow_arg_area_p62, align 8
  %overflow_arg_area.next64 = getelementptr i8, ptr %overflow_arg_area63, i32 8
  store ptr %overflow_arg_area.next64, ptr %overflow_arg_area_p62, align 8
  br label %vaarg.end65

vaarg.end65:                                      ; preds = %vaarg.in_mem61, %vaarg.in_reg59
  %vaarg.addr66 = phi ptr [ %26, %vaarg.in_reg59 ], [ %overflow_arg_area63, %vaarg.in_mem61 ]
  %28 = load ptr, ptr %vaarg.addr66, align 8
  store ptr %28, ptr %ptr_pmd, align 8
  %arraydecay67 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p68 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay67, i32 0, i32 0
  %gp_offset69 = load i32, ptr %gp_offset_p68, align 16
  %fits_in_gp70 = icmp ule i32 %gp_offset69, 40
  br i1 %fits_in_gp70, label %vaarg.in_reg71, label %vaarg.in_mem73

vaarg.in_reg71:                                   ; preds = %vaarg.end65
  %29 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay67, i32 0, i32 3
  %reg_save_area72 = load ptr, ptr %29, align 16
  %30 = getelementptr i8, ptr %reg_save_area72, i32 %gp_offset69
  %31 = add i32 %gp_offset69, 8
  store i32 %31, ptr %gp_offset_p68, align 16
  br label %vaarg.end77

vaarg.in_mem73:                                   ; preds = %vaarg.end65
  %overflow_arg_area_p74 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay67, i32 0, i32 2
  %overflow_arg_area75 = load ptr, ptr %overflow_arg_area_p74, align 8
  %overflow_arg_area.next76 = getelementptr i8, ptr %overflow_arg_area75, i32 8
  store ptr %overflow_arg_area.next76, ptr %overflow_arg_area_p74, align 8
  br label %vaarg.end77

vaarg.end77:                                      ; preds = %vaarg.in_mem73, %vaarg.in_reg71
  %vaarg.addr78 = phi ptr [ %30, %vaarg.in_reg71 ], [ %overflow_arg_area75, %vaarg.in_mem73 ]
  %32 = load ptr, ptr %vaarg.addr78, align 8
  store ptr %32, ptr %ptr, align 8
  %arraydecay79 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p80 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay79, i32 0, i32 0
  %gp_offset81 = load i32, ptr %gp_offset_p80, align 16
  %fits_in_gp82 = icmp ule i32 %gp_offset81, 40
  br i1 %fits_in_gp82, label %vaarg.in_reg83, label %vaarg.in_mem85

vaarg.in_reg83:                                   ; preds = %vaarg.end77
  %33 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay79, i32 0, i32 3
  %reg_save_area84 = load ptr, ptr %33, align 16
  %34 = getelementptr i8, ptr %reg_save_area84, i32 %gp_offset81
  %35 = add i32 %gp_offset81, 8
  store i32 %35, ptr %gp_offset_p80, align 16
  br label %vaarg.end89

vaarg.in_mem85:                                   ; preds = %vaarg.end77
  %overflow_arg_area_p86 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay79, i32 0, i32 2
  %overflow_arg_area87 = load ptr, ptr %overflow_arg_area_p86, align 8
  %overflow_arg_area.next88 = getelementptr i8, ptr %overflow_arg_area87, i32 8
  store ptr %overflow_arg_area.next88, ptr %overflow_arg_area_p86, align 8
  br label %vaarg.end89

vaarg.end89:                                      ; preds = %vaarg.in_mem85, %vaarg.in_reg83
  %vaarg.addr90 = phi ptr [ %34, %vaarg.in_reg83 ], [ %overflow_arg_area87, %vaarg.in_mem85 ]
  %36 = load i32, ptr %vaarg.addr90, align 4
  store i32 %36, ptr %newsize, align 4
  %arraydecay91 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p92 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay91, i32 0, i32 0
  %gp_offset93 = load i32, ptr %gp_offset_p92, align 16
  %fits_in_gp94 = icmp ule i32 %gp_offset93, 40
  br i1 %fits_in_gp94, label %vaarg.in_reg95, label %vaarg.in_mem97

vaarg.in_reg95:                                   ; preds = %vaarg.end89
  %37 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay91, i32 0, i32 3
  %reg_save_area96 = load ptr, ptr %37, align 16
  %38 = getelementptr i8, ptr %reg_save_area96, i32 %gp_offset93
  %39 = add i32 %gp_offset93, 8
  store i32 %39, ptr %gp_offset_p92, align 16
  br label %vaarg.end101

vaarg.in_mem97:                                   ; preds = %vaarg.end89
  %overflow_arg_area_p98 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay91, i32 0, i32 2
  %overflow_arg_area99 = load ptr, ptr %overflow_arg_area_p98, align 8
  %overflow_arg_area.next100 = getelementptr i8, ptr %overflow_arg_area99, i32 8
  store ptr %overflow_arg_area.next100, ptr %overflow_arg_area_p98, align 8
  br label %vaarg.end101

vaarg.end101:                                     ; preds = %vaarg.in_mem97, %vaarg.in_reg95
  %vaarg.addr102 = phi ptr [ %38, %vaarg.in_reg95 ], [ %overflow_arg_area99, %vaarg.in_mem97 ]
  %40 = load ptr, ptr %vaarg.addr102, align 8
  store ptr %40, ptr %file_name, align 8
  %arraydecay103 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p104 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay103, i32 0, i32 0
  %gp_offset105 = load i32, ptr %gp_offset_p104, align 16
  %fits_in_gp106 = icmp ule i32 %gp_offset105, 40
  br i1 %fits_in_gp106, label %vaarg.in_reg107, label %vaarg.in_mem109

vaarg.in_reg107:                                  ; preds = %vaarg.end101
  %41 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay103, i32 0, i32 3
  %reg_save_area108 = load ptr, ptr %41, align 16
  %42 = getelementptr i8, ptr %reg_save_area108, i32 %gp_offset105
  %43 = add i32 %gp_offset105, 8
  store i32 %43, ptr %gp_offset_p104, align 16
  br label %vaarg.end113

vaarg.in_mem109:                                  ; preds = %vaarg.end101
  %overflow_arg_area_p110 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay103, i32 0, i32 2
  %overflow_arg_area111 = load ptr, ptr %overflow_arg_area_p110, align 8
  %overflow_arg_area.next112 = getelementptr i8, ptr %overflow_arg_area111, i32 8
  store ptr %overflow_arg_area.next112, ptr %overflow_arg_area_p110, align 8
  br label %vaarg.end113

vaarg.end113:                                     ; preds = %vaarg.in_mem109, %vaarg.in_reg107
  %vaarg.addr114 = phi ptr [ %42, %vaarg.in_reg107 ], [ %overflow_arg_area111, %vaarg.in_mem109 ]
  %44 = load ptr, ptr %vaarg.addr114, align 8
  store ptr %44, ptr %func_name, align 8
  %arraydecay115 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p116 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay115, i32 0, i32 0
  %gp_offset117 = load i32, ptr %gp_offset_p116, align 16
  %fits_in_gp118 = icmp ule i32 %gp_offset117, 40
  br i1 %fits_in_gp118, label %vaarg.in_reg119, label %vaarg.in_mem121

vaarg.in_reg119:                                  ; preds = %vaarg.end113
  %45 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay115, i32 0, i32 3
  %reg_save_area120 = load ptr, ptr %45, align 16
  %46 = getelementptr i8, ptr %reg_save_area120, i32 %gp_offset117
  %47 = add i32 %gp_offset117, 8
  store i32 %47, ptr %gp_offset_p116, align 16
  br label %vaarg.end125

vaarg.in_mem121:                                  ; preds = %vaarg.end113
  %overflow_arg_area_p122 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay115, i32 0, i32 2
  %overflow_arg_area123 = load ptr, ptr %overflow_arg_area_p122, align 8
  %overflow_arg_area.next124 = getelementptr i8, ptr %overflow_arg_area123, i32 8
  store ptr %overflow_arg_area.next124, ptr %overflow_arg_area_p122, align 8
  br label %vaarg.end125

vaarg.end125:                                     ; preds = %vaarg.in_mem121, %vaarg.in_reg119
  %vaarg.addr126 = phi ptr [ %46, %vaarg.in_reg119 ], [ %overflow_arg_area123, %vaarg.in_mem121 ]
  %48 = load i32, ptr %vaarg.addr126, align 4
  store i32 %48, ptr %p_line, align 4
  %arraydecay127 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p128 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay127, i32 0, i32 0
  %gp_offset129 = load i32, ptr %gp_offset_p128, align 16
  %fits_in_gp130 = icmp ule i32 %gp_offset129, 40
  br i1 %fits_in_gp130, label %vaarg.in_reg131, label %vaarg.in_mem133

vaarg.in_reg131:                                  ; preds = %vaarg.end125
  %49 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay127, i32 0, i32 3
  %reg_save_area132 = load ptr, ptr %49, align 16
  %50 = getelementptr i8, ptr %reg_save_area132, i32 %gp_offset129
  %51 = add i32 %gp_offset129, 8
  store i32 %51, ptr %gp_offset_p128, align 16
  br label %vaarg.end137

vaarg.in_mem133:                                  ; preds = %vaarg.end125
  %overflow_arg_area_p134 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay127, i32 0, i32 2
  %overflow_arg_area135 = load ptr, ptr %overflow_arg_area_p134, align 8
  %overflow_arg_area.next136 = getelementptr i8, ptr %overflow_arg_area135, i32 8
  store ptr %overflow_arg_area.next136, ptr %overflow_arg_area_p134, align 8
  br label %vaarg.end137

vaarg.end137:                                     ; preds = %vaarg.in_mem133, %vaarg.in_reg131
  %vaarg.addr138 = phi ptr [ %50, %vaarg.in_reg131 ], [ %overflow_arg_area135, %vaarg.in_mem133 ]
  %52 = load i32, ptr %vaarg.addr138, align 4
  store i32 %52, ptr %p_col, align 4
  %arraydecay139 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p140 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay139, i32 0, i32 0
  %gp_offset141 = load i32, ptr %gp_offset_p140, align 16
  %fits_in_gp142 = icmp ule i32 %gp_offset141, 40
  br i1 %fits_in_gp142, label %vaarg.in_reg143, label %vaarg.in_mem145

vaarg.in_reg143:                                  ; preds = %vaarg.end137
  %53 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay139, i32 0, i32 3
  %reg_save_area144 = load ptr, ptr %53, align 16
  %54 = getelementptr i8, ptr %reg_save_area144, i32 %gp_offset141
  %55 = add i32 %gp_offset141, 8
  store i32 %55, ptr %gp_offset_p140, align 16
  br label %vaarg.end149

vaarg.in_mem145:                                  ; preds = %vaarg.end137
  %overflow_arg_area_p146 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay139, i32 0, i32 2
  %overflow_arg_area147 = load ptr, ptr %overflow_arg_area_p146, align 8
  %overflow_arg_area.next148 = getelementptr i8, ptr %overflow_arg_area147, i32 8
  store ptr %overflow_arg_area.next148, ptr %overflow_arg_area_p146, align 8
  br label %vaarg.end149

vaarg.end149:                                     ; preds = %vaarg.in_mem145, %vaarg.in_reg143
  %vaarg.addr150 = phi ptr [ %54, %vaarg.in_reg143 ], [ %overflow_arg_area147, %vaarg.in_mem145 ]
  %56 = load ptr, ptr %vaarg.addr150, align 8
  store ptr %56, ptr %p_name, align 8
  %arraydecay151 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  call void @llvm.va_end(ptr %arraydecay151)
  %57 = load ptr, ptr %ret_pmd42, align 8
  %58 = load ptr, ptr %ptr_pmd, align 8
  %59 = load ptr, ptr %ptr, align 8
  %60 = load i32, ptr %newsize, align 4
  %conv = zext i32 %60 to i64
  %61 = load ptr, ptr %file_name, align 8
  %62 = load ptr, ptr %func_name, align 8
  %63 = load i32, ptr %p_line, align 4
  %64 = load i32, ptr %p_col, align 4
  %65 = load ptr, ptr %p_name, align 8
  %call152 = call ptr @_RV_realloc(ptr noundef %57, ptr noundef %58, ptr noundef %59, i64 noundef %conv, ptr noundef %61, ptr noundef %62, i32 noundef %63, i32 noundef %64, ptr noundef %65)
  %66 = load ptr, ptr %ret_addr29, align 8
  store ptr %call152, ptr %66, align 8
  br label %return

if.end153:                                        ; preds = %if.end
  %67 = load ptr, ptr %fp.addr, align 8
  %cmp154 = icmp eq ptr %67, @free
  br i1 %cmp154, label %if.then156, label %if.end249

if.then156:                                       ; preds = %if.end153
  %arraydecay158 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p159 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay158, i32 0, i32 0
  %gp_offset160 = load i32, ptr %gp_offset_p159, align 16
  %fits_in_gp161 = icmp ule i32 %gp_offset160, 40
  br i1 %fits_in_gp161, label %vaarg.in_reg162, label %vaarg.in_mem164

vaarg.in_reg162:                                  ; preds = %if.then156
  %68 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay158, i32 0, i32 3
  %reg_save_area163 = load ptr, ptr %68, align 16
  %69 = getelementptr i8, ptr %reg_save_area163, i32 %gp_offset160
  %70 = add i32 %gp_offset160, 8
  store i32 %70, ptr %gp_offset_p159, align 16
  br label %vaarg.end168

vaarg.in_mem164:                                  ; preds = %if.then156
  %overflow_arg_area_p165 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay158, i32 0, i32 2
  %overflow_arg_area166 = load ptr, ptr %overflow_arg_area_p165, align 8
  %overflow_arg_area.next167 = getelementptr i8, ptr %overflow_arg_area166, i32 8
  store ptr %overflow_arg_area.next167, ptr %overflow_arg_area_p165, align 8
  br label %vaarg.end168

vaarg.end168:                                     ; preds = %vaarg.in_mem164, %vaarg.in_reg162
  %vaarg.addr169 = phi ptr [ %69, %vaarg.in_reg162 ], [ %overflow_arg_area166, %vaarg.in_mem164 ]
  %71 = load ptr, ptr %vaarg.addr169, align 8
  store ptr %71, ptr %ptr_pmd157, align 8
  %arraydecay171 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p172 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay171, i32 0, i32 0
  %gp_offset173 = load i32, ptr %gp_offset_p172, align 16
  %fits_in_gp174 = icmp ule i32 %gp_offset173, 40
  br i1 %fits_in_gp174, label %vaarg.in_reg175, label %vaarg.in_mem177

vaarg.in_reg175:                                  ; preds = %vaarg.end168
  %72 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay171, i32 0, i32 3
  %reg_save_area176 = load ptr, ptr %72, align 16
  %73 = getelementptr i8, ptr %reg_save_area176, i32 %gp_offset173
  %74 = add i32 %gp_offset173, 8
  store i32 %74, ptr %gp_offset_p172, align 16
  br label %vaarg.end181

vaarg.in_mem177:                                  ; preds = %vaarg.end168
  %overflow_arg_area_p178 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay171, i32 0, i32 2
  %overflow_arg_area179 = load ptr, ptr %overflow_arg_area_p178, align 8
  %overflow_arg_area.next180 = getelementptr i8, ptr %overflow_arg_area179, i32 8
  store ptr %overflow_arg_area.next180, ptr %overflow_arg_area_p178, align 8
  br label %vaarg.end181

vaarg.end181:                                     ; preds = %vaarg.in_mem177, %vaarg.in_reg175
  %vaarg.addr182 = phi ptr [ %73, %vaarg.in_reg175 ], [ %overflow_arg_area179, %vaarg.in_mem177 ]
  %75 = load ptr, ptr %vaarg.addr182, align 8
  store ptr %75, ptr %ptr170, align 8
  %arraydecay184 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p185 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay184, i32 0, i32 0
  %gp_offset186 = load i32, ptr %gp_offset_p185, align 16
  %fits_in_gp187 = icmp ule i32 %gp_offset186, 40
  br i1 %fits_in_gp187, label %vaarg.in_reg188, label %vaarg.in_mem190

vaarg.in_reg188:                                  ; preds = %vaarg.end181
  %76 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay184, i32 0, i32 3
  %reg_save_area189 = load ptr, ptr %76, align 16
  %77 = getelementptr i8, ptr %reg_save_area189, i32 %gp_offset186
  %78 = add i32 %gp_offset186, 8
  store i32 %78, ptr %gp_offset_p185, align 16
  br label %vaarg.end194

vaarg.in_mem190:                                  ; preds = %vaarg.end181
  %overflow_arg_area_p191 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay184, i32 0, i32 2
  %overflow_arg_area192 = load ptr, ptr %overflow_arg_area_p191, align 8
  %overflow_arg_area.next193 = getelementptr i8, ptr %overflow_arg_area192, i32 8
  store ptr %overflow_arg_area.next193, ptr %overflow_arg_area_p191, align 8
  br label %vaarg.end194

vaarg.end194:                                     ; preds = %vaarg.in_mem190, %vaarg.in_reg188
  %vaarg.addr195 = phi ptr [ %77, %vaarg.in_reg188 ], [ %overflow_arg_area192, %vaarg.in_mem190 ]
  %79 = load ptr, ptr %vaarg.addr195, align 8
  store ptr %79, ptr %file_name183, align 8
  %arraydecay197 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p198 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay197, i32 0, i32 0
  %gp_offset199 = load i32, ptr %gp_offset_p198, align 16
  %fits_in_gp200 = icmp ule i32 %gp_offset199, 40
  br i1 %fits_in_gp200, label %vaarg.in_reg201, label %vaarg.in_mem203

vaarg.in_reg201:                                  ; preds = %vaarg.end194
  %80 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay197, i32 0, i32 3
  %reg_save_area202 = load ptr, ptr %80, align 16
  %81 = getelementptr i8, ptr %reg_save_area202, i32 %gp_offset199
  %82 = add i32 %gp_offset199, 8
  store i32 %82, ptr %gp_offset_p198, align 16
  br label %vaarg.end207

vaarg.in_mem203:                                  ; preds = %vaarg.end194
  %overflow_arg_area_p204 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay197, i32 0, i32 2
  %overflow_arg_area205 = load ptr, ptr %overflow_arg_area_p204, align 8
  %overflow_arg_area.next206 = getelementptr i8, ptr %overflow_arg_area205, i32 8
  store ptr %overflow_arg_area.next206, ptr %overflow_arg_area_p204, align 8
  br label %vaarg.end207

vaarg.end207:                                     ; preds = %vaarg.in_mem203, %vaarg.in_reg201
  %vaarg.addr208 = phi ptr [ %81, %vaarg.in_reg201 ], [ %overflow_arg_area205, %vaarg.in_mem203 ]
  %83 = load ptr, ptr %vaarg.addr208, align 8
  store ptr %83, ptr %func_name196, align 8
  %arraydecay210 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p211 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay210, i32 0, i32 0
  %gp_offset212 = load i32, ptr %gp_offset_p211, align 16
  %fits_in_gp213 = icmp ule i32 %gp_offset212, 40
  br i1 %fits_in_gp213, label %vaarg.in_reg214, label %vaarg.in_mem216

vaarg.in_reg214:                                  ; preds = %vaarg.end207
  %84 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay210, i32 0, i32 3
  %reg_save_area215 = load ptr, ptr %84, align 16
  %85 = getelementptr i8, ptr %reg_save_area215, i32 %gp_offset212
  %86 = add i32 %gp_offset212, 8
  store i32 %86, ptr %gp_offset_p211, align 16
  br label %vaarg.end220

vaarg.in_mem216:                                  ; preds = %vaarg.end207
  %overflow_arg_area_p217 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay210, i32 0, i32 2
  %overflow_arg_area218 = load ptr, ptr %overflow_arg_area_p217, align 8
  %overflow_arg_area.next219 = getelementptr i8, ptr %overflow_arg_area218, i32 8
  store ptr %overflow_arg_area.next219, ptr %overflow_arg_area_p217, align 8
  br label %vaarg.end220

vaarg.end220:                                     ; preds = %vaarg.in_mem216, %vaarg.in_reg214
  %vaarg.addr221 = phi ptr [ %85, %vaarg.in_reg214 ], [ %overflow_arg_area218, %vaarg.in_mem216 ]
  %87 = load i32, ptr %vaarg.addr221, align 4
  store i32 %87, ptr %p_line209, align 4
  %arraydecay223 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p224 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay223, i32 0, i32 0
  %gp_offset225 = load i32, ptr %gp_offset_p224, align 16
  %fits_in_gp226 = icmp ule i32 %gp_offset225, 40
  br i1 %fits_in_gp226, label %vaarg.in_reg227, label %vaarg.in_mem229

vaarg.in_reg227:                                  ; preds = %vaarg.end220
  %88 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay223, i32 0, i32 3
  %reg_save_area228 = load ptr, ptr %88, align 16
  %89 = getelementptr i8, ptr %reg_save_area228, i32 %gp_offset225
  %90 = add i32 %gp_offset225, 8
  store i32 %90, ptr %gp_offset_p224, align 16
  br label %vaarg.end233

vaarg.in_mem229:                                  ; preds = %vaarg.end220
  %overflow_arg_area_p230 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay223, i32 0, i32 2
  %overflow_arg_area231 = load ptr, ptr %overflow_arg_area_p230, align 8
  %overflow_arg_area.next232 = getelementptr i8, ptr %overflow_arg_area231, i32 8
  store ptr %overflow_arg_area.next232, ptr %overflow_arg_area_p230, align 8
  br label %vaarg.end233

vaarg.end233:                                     ; preds = %vaarg.in_mem229, %vaarg.in_reg227
  %vaarg.addr234 = phi ptr [ %89, %vaarg.in_reg227 ], [ %overflow_arg_area231, %vaarg.in_mem229 ]
  %91 = load i32, ptr %vaarg.addr234, align 4
  store i32 %91, ptr %p_col222, align 4
  %arraydecay236 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p237 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay236, i32 0, i32 0
  %gp_offset238 = load i32, ptr %gp_offset_p237, align 16
  %fits_in_gp239 = icmp ule i32 %gp_offset238, 40
  br i1 %fits_in_gp239, label %vaarg.in_reg240, label %vaarg.in_mem242

vaarg.in_reg240:                                  ; preds = %vaarg.end233
  %92 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay236, i32 0, i32 3
  %reg_save_area241 = load ptr, ptr %92, align 16
  %93 = getelementptr i8, ptr %reg_save_area241, i32 %gp_offset238
  %94 = add i32 %gp_offset238, 8
  store i32 %94, ptr %gp_offset_p237, align 16
  br label %vaarg.end246

vaarg.in_mem242:                                  ; preds = %vaarg.end233
  %overflow_arg_area_p243 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay236, i32 0, i32 2
  %overflow_arg_area244 = load ptr, ptr %overflow_arg_area_p243, align 8
  %overflow_arg_area.next245 = getelementptr i8, ptr %overflow_arg_area244, i32 8
  store ptr %overflow_arg_area.next245, ptr %overflow_arg_area_p243, align 8
  br label %vaarg.end246

vaarg.end246:                                     ; preds = %vaarg.in_mem242, %vaarg.in_reg240
  %vaarg.addr247 = phi ptr [ %93, %vaarg.in_reg240 ], [ %overflow_arg_area244, %vaarg.in_mem242 ]
  %95 = load ptr, ptr %vaarg.addr247, align 8
  store ptr %95, ptr %p_name235, align 8
  %arraydecay248 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  call void @llvm.va_end(ptr %arraydecay248)
  %96 = load ptr, ptr %ptr_pmd157, align 8
  %97 = load ptr, ptr %ptr170, align 8
  %98 = load ptr, ptr %file_name183, align 8
  %99 = load ptr, ptr %func_name196, align 8
  %100 = load i32, ptr %p_line209, align 4
  %101 = load i32, ptr %p_col222, align 4
  %102 = load ptr, ptr %p_name235, align 8
  call void @_RV_free(ptr noundef %96, ptr noundef %97, ptr noundef %98, ptr noundef %99, i32 noundef %100, i32 noundef %101, ptr noundef %102)
  br label %return

if.end249:                                        ; preds = %if.end153
  %103 = load ptr, ptr %fp.addr, align 8
  %cmp250 = icmp eq ptr %103, @memcpy
  br i1 %cmp250, label %if.then252, label %if.end439

if.then252:                                       ; preds = %if.end249
  %arraydecay254 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p255 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay254, i32 0, i32 0
  %gp_offset256 = load i32, ptr %gp_offset_p255, align 16
  %fits_in_gp257 = icmp ule i32 %gp_offset256, 40
  br i1 %fits_in_gp257, label %vaarg.in_reg258, label %vaarg.in_mem260

vaarg.in_reg258:                                  ; preds = %if.then252
  %104 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay254, i32 0, i32 3
  %reg_save_area259 = load ptr, ptr %104, align 16
  %105 = getelementptr i8, ptr %reg_save_area259, i32 %gp_offset256
  %106 = add i32 %gp_offset256, 8
  store i32 %106, ptr %gp_offset_p255, align 16
  br label %vaarg.end264

vaarg.in_mem260:                                  ; preds = %if.then252
  %overflow_arg_area_p261 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay254, i32 0, i32 2
  %overflow_arg_area262 = load ptr, ptr %overflow_arg_area_p261, align 8
  %overflow_arg_area.next263 = getelementptr i8, ptr %overflow_arg_area262, i32 8
  store ptr %overflow_arg_area.next263, ptr %overflow_arg_area_p261, align 8
  br label %vaarg.end264

vaarg.end264:                                     ; preds = %vaarg.in_mem260, %vaarg.in_reg258
  %vaarg.addr265 = phi ptr [ %105, %vaarg.in_reg258 ], [ %overflow_arg_area262, %vaarg.in_mem260 ]
  %107 = load ptr, ptr %vaarg.addr265, align 8
  store ptr %107, ptr %ret_addr253, align 8
  %arraydecay267 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p268 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay267, i32 0, i32 0
  %gp_offset269 = load i32, ptr %gp_offset_p268, align 16
  %fits_in_gp270 = icmp ule i32 %gp_offset269, 40
  br i1 %fits_in_gp270, label %vaarg.in_reg271, label %vaarg.in_mem273

vaarg.in_reg271:                                  ; preds = %vaarg.end264
  %108 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay267, i32 0, i32 3
  %reg_save_area272 = load ptr, ptr %108, align 16
  %109 = getelementptr i8, ptr %reg_save_area272, i32 %gp_offset269
  %110 = add i32 %gp_offset269, 8
  store i32 %110, ptr %gp_offset_p268, align 16
  br label %vaarg.end277

vaarg.in_mem273:                                  ; preds = %vaarg.end264
  %overflow_arg_area_p274 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay267, i32 0, i32 2
  %overflow_arg_area275 = load ptr, ptr %overflow_arg_area_p274, align 8
  %overflow_arg_area.next276 = getelementptr i8, ptr %overflow_arg_area275, i32 8
  store ptr %overflow_arg_area.next276, ptr %overflow_arg_area_p274, align 8
  br label %vaarg.end277

vaarg.end277:                                     ; preds = %vaarg.in_mem273, %vaarg.in_reg271
  %vaarg.addr278 = phi ptr [ %109, %vaarg.in_reg271 ], [ %overflow_arg_area275, %vaarg.in_mem273 ]
  %111 = load ptr, ptr %vaarg.addr278, align 8
  store ptr %111, ptr %ret_pmd266, align 8
  %arraydecay279 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p280 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay279, i32 0, i32 0
  %gp_offset281 = load i32, ptr %gp_offset_p280, align 16
  %fits_in_gp282 = icmp ule i32 %gp_offset281, 40
  br i1 %fits_in_gp282, label %vaarg.in_reg283, label %vaarg.in_mem285

vaarg.in_reg283:                                  ; preds = %vaarg.end277
  %112 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay279, i32 0, i32 3
  %reg_save_area284 = load ptr, ptr %112, align 16
  %113 = getelementptr i8, ptr %reg_save_area284, i32 %gp_offset281
  %114 = add i32 %gp_offset281, 8
  store i32 %114, ptr %gp_offset_p280, align 16
  br label %vaarg.end289

vaarg.in_mem285:                                  ; preds = %vaarg.end277
  %overflow_arg_area_p286 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay279, i32 0, i32 2
  %overflow_arg_area287 = load ptr, ptr %overflow_arg_area_p286, align 8
  %overflow_arg_area.next288 = getelementptr i8, ptr %overflow_arg_area287, i32 8
  store ptr %overflow_arg_area.next288, ptr %overflow_arg_area_p286, align 8
  br label %vaarg.end289

vaarg.end289:                                     ; preds = %vaarg.in_mem285, %vaarg.in_reg283
  %vaarg.addr290 = phi ptr [ %113, %vaarg.in_reg283 ], [ %overflow_arg_area287, %vaarg.in_mem285 ]
  %115 = load ptr, ptr %vaarg.addr290, align 8
  store ptr %115, ptr %dest_pmd, align 8
  %arraydecay291 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p292 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay291, i32 0, i32 0
  %gp_offset293 = load i32, ptr %gp_offset_p292, align 16
  %fits_in_gp294 = icmp ule i32 %gp_offset293, 40
  br i1 %fits_in_gp294, label %vaarg.in_reg295, label %vaarg.in_mem297

vaarg.in_reg295:                                  ; preds = %vaarg.end289
  %116 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay291, i32 0, i32 3
  %reg_save_area296 = load ptr, ptr %116, align 16
  %117 = getelementptr i8, ptr %reg_save_area296, i32 %gp_offset293
  %118 = add i32 %gp_offset293, 8
  store i32 %118, ptr %gp_offset_p292, align 16
  br label %vaarg.end301

vaarg.in_mem297:                                  ; preds = %vaarg.end289
  %overflow_arg_area_p298 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay291, i32 0, i32 2
  %overflow_arg_area299 = load ptr, ptr %overflow_arg_area_p298, align 8
  %overflow_arg_area.next300 = getelementptr i8, ptr %overflow_arg_area299, i32 8
  store ptr %overflow_arg_area.next300, ptr %overflow_arg_area_p298, align 8
  br label %vaarg.end301

vaarg.end301:                                     ; preds = %vaarg.in_mem297, %vaarg.in_reg295
  %vaarg.addr302 = phi ptr [ %117, %vaarg.in_reg295 ], [ %overflow_arg_area299, %vaarg.in_mem297 ]
  %119 = load ptr, ptr %vaarg.addr302, align 8
  store ptr %119, ptr %src_pmd, align 8
  %arraydecay303 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p304 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay303, i32 0, i32 0
  %gp_offset305 = load i32, ptr %gp_offset_p304, align 16
  %fits_in_gp306 = icmp ule i32 %gp_offset305, 40
  br i1 %fits_in_gp306, label %vaarg.in_reg307, label %vaarg.in_mem309

vaarg.in_reg307:                                  ; preds = %vaarg.end301
  %120 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay303, i32 0, i32 3
  %reg_save_area308 = load ptr, ptr %120, align 16
  %121 = getelementptr i8, ptr %reg_save_area308, i32 %gp_offset305
  %122 = add i32 %gp_offset305, 8
  store i32 %122, ptr %gp_offset_p304, align 16
  br label %vaarg.end313

vaarg.in_mem309:                                  ; preds = %vaarg.end301
  %overflow_arg_area_p310 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay303, i32 0, i32 2
  %overflow_arg_area311 = load ptr, ptr %overflow_arg_area_p310, align 8
  %overflow_arg_area.next312 = getelementptr i8, ptr %overflow_arg_area311, i32 8
  store ptr %overflow_arg_area.next312, ptr %overflow_arg_area_p310, align 8
  br label %vaarg.end313

vaarg.end313:                                     ; preds = %vaarg.in_mem309, %vaarg.in_reg307
  %vaarg.addr314 = phi ptr [ %121, %vaarg.in_reg307 ], [ %overflow_arg_area311, %vaarg.in_mem309 ]
  %123 = load ptr, ptr %vaarg.addr314, align 8
  store ptr %123, ptr %dest, align 8
  %arraydecay315 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p316 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay315, i32 0, i32 0
  %gp_offset317 = load i32, ptr %gp_offset_p316, align 16
  %fits_in_gp318 = icmp ule i32 %gp_offset317, 40
  br i1 %fits_in_gp318, label %vaarg.in_reg319, label %vaarg.in_mem321

vaarg.in_reg319:                                  ; preds = %vaarg.end313
  %124 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay315, i32 0, i32 3
  %reg_save_area320 = load ptr, ptr %124, align 16
  %125 = getelementptr i8, ptr %reg_save_area320, i32 %gp_offset317
  %126 = add i32 %gp_offset317, 8
  store i32 %126, ptr %gp_offset_p316, align 16
  br label %vaarg.end325

vaarg.in_mem321:                                  ; preds = %vaarg.end313
  %overflow_arg_area_p322 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay315, i32 0, i32 2
  %overflow_arg_area323 = load ptr, ptr %overflow_arg_area_p322, align 8
  %overflow_arg_area.next324 = getelementptr i8, ptr %overflow_arg_area323, i32 8
  store ptr %overflow_arg_area.next324, ptr %overflow_arg_area_p322, align 8
  br label %vaarg.end325

vaarg.end325:                                     ; preds = %vaarg.in_mem321, %vaarg.in_reg319
  %vaarg.addr326 = phi ptr [ %125, %vaarg.in_reg319 ], [ %overflow_arg_area323, %vaarg.in_mem321 ]
  %127 = load ptr, ptr %vaarg.addr326, align 8
  store ptr %127, ptr %src, align 8
  %arraydecay327 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p328 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay327, i32 0, i32 0
  %gp_offset329 = load i32, ptr %gp_offset_p328, align 16
  %fits_in_gp330 = icmp ule i32 %gp_offset329, 40
  br i1 %fits_in_gp330, label %vaarg.in_reg331, label %vaarg.in_mem333

vaarg.in_reg331:                                  ; preds = %vaarg.end325
  %128 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay327, i32 0, i32 3
  %reg_save_area332 = load ptr, ptr %128, align 16
  %129 = getelementptr i8, ptr %reg_save_area332, i32 %gp_offset329
  %130 = add i32 %gp_offset329, 8
  store i32 %130, ptr %gp_offset_p328, align 16
  br label %vaarg.end337

vaarg.in_mem333:                                  ; preds = %vaarg.end325
  %overflow_arg_area_p334 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay327, i32 0, i32 2
  %overflow_arg_area335 = load ptr, ptr %overflow_arg_area_p334, align 8
  %overflow_arg_area.next336 = getelementptr i8, ptr %overflow_arg_area335, i32 8
  store ptr %overflow_arg_area.next336, ptr %overflow_arg_area_p334, align 8
  br label %vaarg.end337

vaarg.end337:                                     ; preds = %vaarg.in_mem333, %vaarg.in_reg331
  %vaarg.addr338 = phi ptr [ %129, %vaarg.in_reg331 ], [ %overflow_arg_area335, %vaarg.in_mem333 ]
  %131 = load i64, ptr %vaarg.addr338, align 8
  store i64 %131, ptr %n, align 8
  %arraydecay340 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p341 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay340, i32 0, i32 0
  %gp_offset342 = load i32, ptr %gp_offset_p341, align 16
  %fits_in_gp343 = icmp ule i32 %gp_offset342, 40
  br i1 %fits_in_gp343, label %vaarg.in_reg344, label %vaarg.in_mem346

vaarg.in_reg344:                                  ; preds = %vaarg.end337
  %132 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay340, i32 0, i32 3
  %reg_save_area345 = load ptr, ptr %132, align 16
  %133 = getelementptr i8, ptr %reg_save_area345, i32 %gp_offset342
  %134 = add i32 %gp_offset342, 8
  store i32 %134, ptr %gp_offset_p341, align 16
  br label %vaarg.end350

vaarg.in_mem346:                                  ; preds = %vaarg.end337
  %overflow_arg_area_p347 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay340, i32 0, i32 2
  %overflow_arg_area348 = load ptr, ptr %overflow_arg_area_p347, align 8
  %overflow_arg_area.next349 = getelementptr i8, ptr %overflow_arg_area348, i32 8
  store ptr %overflow_arg_area.next349, ptr %overflow_arg_area_p347, align 8
  br label %vaarg.end350

vaarg.end350:                                     ; preds = %vaarg.in_mem346, %vaarg.in_reg344
  %vaarg.addr351 = phi ptr [ %133, %vaarg.in_reg344 ], [ %overflow_arg_area348, %vaarg.in_mem346 ]
  %135 = load ptr, ptr %vaarg.addr351, align 8
  store ptr %135, ptr %file_name339, align 8
  %arraydecay353 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p354 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay353, i32 0, i32 0
  %gp_offset355 = load i32, ptr %gp_offset_p354, align 16
  %fits_in_gp356 = icmp ule i32 %gp_offset355, 40
  br i1 %fits_in_gp356, label %vaarg.in_reg357, label %vaarg.in_mem359

vaarg.in_reg357:                                  ; preds = %vaarg.end350
  %136 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay353, i32 0, i32 3
  %reg_save_area358 = load ptr, ptr %136, align 16
  %137 = getelementptr i8, ptr %reg_save_area358, i32 %gp_offset355
  %138 = add i32 %gp_offset355, 8
  store i32 %138, ptr %gp_offset_p354, align 16
  br label %vaarg.end363

vaarg.in_mem359:                                  ; preds = %vaarg.end350
  %overflow_arg_area_p360 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay353, i32 0, i32 2
  %overflow_arg_area361 = load ptr, ptr %overflow_arg_area_p360, align 8
  %overflow_arg_area.next362 = getelementptr i8, ptr %overflow_arg_area361, i32 8
  store ptr %overflow_arg_area.next362, ptr %overflow_arg_area_p360, align 8
  br label %vaarg.end363

vaarg.end363:                                     ; preds = %vaarg.in_mem359, %vaarg.in_reg357
  %vaarg.addr364 = phi ptr [ %137, %vaarg.in_reg357 ], [ %overflow_arg_area361, %vaarg.in_mem359 ]
  %139 = load ptr, ptr %vaarg.addr364, align 8
  store ptr %139, ptr %func_name352, align 8
  %arraydecay365 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p366 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay365, i32 0, i32 0
  %gp_offset367 = load i32, ptr %gp_offset_p366, align 16
  %fits_in_gp368 = icmp ule i32 %gp_offset367, 40
  br i1 %fits_in_gp368, label %vaarg.in_reg369, label %vaarg.in_mem371

vaarg.in_reg369:                                  ; preds = %vaarg.end363
  %140 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay365, i32 0, i32 3
  %reg_save_area370 = load ptr, ptr %140, align 16
  %141 = getelementptr i8, ptr %reg_save_area370, i32 %gp_offset367
  %142 = add i32 %gp_offset367, 8
  store i32 %142, ptr %gp_offset_p366, align 16
  br label %vaarg.end375

vaarg.in_mem371:                                  ; preds = %vaarg.end363
  %overflow_arg_area_p372 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay365, i32 0, i32 2
  %overflow_arg_area373 = load ptr, ptr %overflow_arg_area_p372, align 8
  %overflow_arg_area.next374 = getelementptr i8, ptr %overflow_arg_area373, i32 8
  store ptr %overflow_arg_area.next374, ptr %overflow_arg_area_p372, align 8
  br label %vaarg.end375

vaarg.end375:                                     ; preds = %vaarg.in_mem371, %vaarg.in_reg369
  %vaarg.addr376 = phi ptr [ %141, %vaarg.in_reg369 ], [ %overflow_arg_area373, %vaarg.in_mem371 ]
  %143 = load i32, ptr %vaarg.addr376, align 4
  store i32 %143, ptr %d_line, align 4
  %arraydecay377 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p378 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay377, i32 0, i32 0
  %gp_offset379 = load i32, ptr %gp_offset_p378, align 16
  %fits_in_gp380 = icmp ule i32 %gp_offset379, 40
  br i1 %fits_in_gp380, label %vaarg.in_reg381, label %vaarg.in_mem383

vaarg.in_reg381:                                  ; preds = %vaarg.end375
  %144 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay377, i32 0, i32 3
  %reg_save_area382 = load ptr, ptr %144, align 16
  %145 = getelementptr i8, ptr %reg_save_area382, i32 %gp_offset379
  %146 = add i32 %gp_offset379, 8
  store i32 %146, ptr %gp_offset_p378, align 16
  br label %vaarg.end387

vaarg.in_mem383:                                  ; preds = %vaarg.end375
  %overflow_arg_area_p384 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay377, i32 0, i32 2
  %overflow_arg_area385 = load ptr, ptr %overflow_arg_area_p384, align 8
  %overflow_arg_area.next386 = getelementptr i8, ptr %overflow_arg_area385, i32 8
  store ptr %overflow_arg_area.next386, ptr %overflow_arg_area_p384, align 8
  br label %vaarg.end387

vaarg.end387:                                     ; preds = %vaarg.in_mem383, %vaarg.in_reg381
  %vaarg.addr388 = phi ptr [ %145, %vaarg.in_reg381 ], [ %overflow_arg_area385, %vaarg.in_mem383 ]
  %147 = load i32, ptr %vaarg.addr388, align 4
  store i32 %147, ptr %d_col, align 4
  %arraydecay389 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p390 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay389, i32 0, i32 0
  %gp_offset391 = load i32, ptr %gp_offset_p390, align 16
  %fits_in_gp392 = icmp ule i32 %gp_offset391, 40
  br i1 %fits_in_gp392, label %vaarg.in_reg393, label %vaarg.in_mem395

vaarg.in_reg393:                                  ; preds = %vaarg.end387
  %148 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay389, i32 0, i32 3
  %reg_save_area394 = load ptr, ptr %148, align 16
  %149 = getelementptr i8, ptr %reg_save_area394, i32 %gp_offset391
  %150 = add i32 %gp_offset391, 8
  store i32 %150, ptr %gp_offset_p390, align 16
  br label %vaarg.end399

vaarg.in_mem395:                                  ; preds = %vaarg.end387
  %overflow_arg_area_p396 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay389, i32 0, i32 2
  %overflow_arg_area397 = load ptr, ptr %overflow_arg_area_p396, align 8
  %overflow_arg_area.next398 = getelementptr i8, ptr %overflow_arg_area397, i32 8
  store ptr %overflow_arg_area.next398, ptr %overflow_arg_area_p396, align 8
  br label %vaarg.end399

vaarg.end399:                                     ; preds = %vaarg.in_mem395, %vaarg.in_reg393
  %vaarg.addr400 = phi ptr [ %149, %vaarg.in_reg393 ], [ %overflow_arg_area397, %vaarg.in_mem395 ]
  %151 = load ptr, ptr %vaarg.addr400, align 8
  store ptr %151, ptr %d_name, align 8
  %arraydecay401 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p402 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay401, i32 0, i32 0
  %gp_offset403 = load i32, ptr %gp_offset_p402, align 16
  %fits_in_gp404 = icmp ule i32 %gp_offset403, 40
  br i1 %fits_in_gp404, label %vaarg.in_reg405, label %vaarg.in_mem407

vaarg.in_reg405:                                  ; preds = %vaarg.end399
  %152 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay401, i32 0, i32 3
  %reg_save_area406 = load ptr, ptr %152, align 16
  %153 = getelementptr i8, ptr %reg_save_area406, i32 %gp_offset403
  %154 = add i32 %gp_offset403, 8
  store i32 %154, ptr %gp_offset_p402, align 16
  br label %vaarg.end411

vaarg.in_mem407:                                  ; preds = %vaarg.end399
  %overflow_arg_area_p408 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay401, i32 0, i32 2
  %overflow_arg_area409 = load ptr, ptr %overflow_arg_area_p408, align 8
  %overflow_arg_area.next410 = getelementptr i8, ptr %overflow_arg_area409, i32 8
  store ptr %overflow_arg_area.next410, ptr %overflow_arg_area_p408, align 8
  br label %vaarg.end411

vaarg.end411:                                     ; preds = %vaarg.in_mem407, %vaarg.in_reg405
  %vaarg.addr412 = phi ptr [ %153, %vaarg.in_reg405 ], [ %overflow_arg_area409, %vaarg.in_mem407 ]
  %155 = load i32, ptr %vaarg.addr412, align 4
  store i32 %155, ptr %s_line, align 4
  %arraydecay413 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p414 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay413, i32 0, i32 0
  %gp_offset415 = load i32, ptr %gp_offset_p414, align 16
  %fits_in_gp416 = icmp ule i32 %gp_offset415, 40
  br i1 %fits_in_gp416, label %vaarg.in_reg417, label %vaarg.in_mem419

vaarg.in_reg417:                                  ; preds = %vaarg.end411
  %156 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay413, i32 0, i32 3
  %reg_save_area418 = load ptr, ptr %156, align 16
  %157 = getelementptr i8, ptr %reg_save_area418, i32 %gp_offset415
  %158 = add i32 %gp_offset415, 8
  store i32 %158, ptr %gp_offset_p414, align 16
  br label %vaarg.end423

vaarg.in_mem419:                                  ; preds = %vaarg.end411
  %overflow_arg_area_p420 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay413, i32 0, i32 2
  %overflow_arg_area421 = load ptr, ptr %overflow_arg_area_p420, align 8
  %overflow_arg_area.next422 = getelementptr i8, ptr %overflow_arg_area421, i32 8
  store ptr %overflow_arg_area.next422, ptr %overflow_arg_area_p420, align 8
  br label %vaarg.end423

vaarg.end423:                                     ; preds = %vaarg.in_mem419, %vaarg.in_reg417
  %vaarg.addr424 = phi ptr [ %157, %vaarg.in_reg417 ], [ %overflow_arg_area421, %vaarg.in_mem419 ]
  %159 = load i32, ptr %vaarg.addr424, align 4
  store i32 %159, ptr %s_col, align 4
  %arraydecay425 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  %gp_offset_p426 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay425, i32 0, i32 0
  %gp_offset427 = load i32, ptr %gp_offset_p426, align 16
  %fits_in_gp428 = icmp ule i32 %gp_offset427, 40
  br i1 %fits_in_gp428, label %vaarg.in_reg429, label %vaarg.in_mem431

vaarg.in_reg429:                                  ; preds = %vaarg.end423
  %160 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay425, i32 0, i32 3
  %reg_save_area430 = load ptr, ptr %160, align 16
  %161 = getelementptr i8, ptr %reg_save_area430, i32 %gp_offset427
  %162 = add i32 %gp_offset427, 8
  store i32 %162, ptr %gp_offset_p426, align 16
  br label %vaarg.end435

vaarg.in_mem431:                                  ; preds = %vaarg.end423
  %overflow_arg_area_p432 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay425, i32 0, i32 2
  %overflow_arg_area433 = load ptr, ptr %overflow_arg_area_p432, align 8
  %overflow_arg_area.next434 = getelementptr i8, ptr %overflow_arg_area433, i32 8
  store ptr %overflow_arg_area.next434, ptr %overflow_arg_area_p432, align 8
  br label %vaarg.end435

vaarg.end435:                                     ; preds = %vaarg.in_mem431, %vaarg.in_reg429
  %vaarg.addr436 = phi ptr [ %161, %vaarg.in_reg429 ], [ %overflow_arg_area433, %vaarg.in_mem431 ]
  %163 = load ptr, ptr %vaarg.addr436, align 8
  store ptr %163, ptr %s_name, align 8
  %arraydecay437 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %vl, i64 0, i64 0
  call void @llvm.va_end(ptr %arraydecay437)
  %164 = load ptr, ptr %ret_pmd266, align 8
  %165 = load ptr, ptr %dest_pmd, align 8
  %166 = load ptr, ptr %src_pmd, align 8
  %167 = load ptr, ptr %dest, align 8
  %168 = load ptr, ptr %src, align 8
  %169 = load i64, ptr %n, align 8
  %170 = load ptr, ptr %file_name339, align 8
  %171 = load ptr, ptr %func_name352, align 8
  %172 = load i32, ptr %d_line, align 4
  %173 = load i32, ptr %d_col, align 4
  %174 = load ptr, ptr %d_name, align 8
  %175 = load i32, ptr %s_line, align 4
  %176 = load i32, ptr %s_col, align 4
  %177 = load ptr, ptr %s_name, align 8
  %call438 = call ptr @_RV_memcpy(ptr noundef %164, ptr noundef %165, ptr noundef %166, ptr noundef %167, ptr noundef %168, i64 noundef %169, ptr noundef %170, ptr noundef %171, i32 noundef %172, i32 noundef %173, ptr noundef %174, i32 noundef %175, i32 noundef %176, ptr noundef %177)
  %178 = load ptr, ptr %ret_addr253, align 8
  store ptr %call438, ptr %178, align 8
  br label %return

if.end439:                                        ; preds = %if.end249
  %179 = load ptr, ptr @stderr, align 8
  %180 = load ptr, ptr %fp.addr, align 8
  %call440 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %179, ptr noundef @.str.27, ptr noundef %180)
  call void @abort() #14
  unreachable

return:                                           ; preds = %vaarg.end435, %vaarg.end246, %vaarg.end149, %vaarg.end24
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_start(ptr) #10

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end(ptr) #10

; Function Attrs: nounwind
declare ptr @memcpy(ptr noundef, ptr noundef, i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @abort() #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__RV_has_wrapper(ptr noundef %fp) #0 {
entry:
  %retval = alloca i32, align 4
  %fp.addr = alloca ptr, align 8
  store ptr %fp, ptr %fp.addr, align 8
  %0 = load ptr, ptr %fp.addr, align 8
  %cmp = icmp eq ptr %0, @access
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load ptr, ptr %fp.addr, align 8
  %cmp1 = icmp eq ptr %1, @atexit
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load ptr, ptr %fp.addr, align 8
  %cmp3 = icmp eq ptr %2, @atof
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %3 = load ptr, ptr %fp.addr, align 8
  %cmp5 = icmp eq ptr %3, @atoi
  br i1 %cmp5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false4
  %4 = load ptr, ptr %fp.addr, align 8
  %cmp7 = icmp eq ptr %4, @atol
  br i1 %cmp7, label %if.then, label %lor.lhs.false8

lor.lhs.false8:                                   ; preds = %lor.lhs.false6
  %5 = load ptr, ptr %fp.addr, align 8
  %cmp9 = icmp eq ptr %5, @bsearch
  br i1 %cmp9, label %if.then, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %lor.lhs.false8
  %6 = load ptr, ptr %fp.addr, align 8
  %cmp11 = icmp eq ptr %6, @calloc
  br i1 %cmp11, label %if.then, label %lor.lhs.false12

lor.lhs.false12:                                  ; preds = %lor.lhs.false10
  %7 = load ptr, ptr %fp.addr, align 8
  %cmp13 = icmp eq ptr %7, @chdir
  br i1 %cmp13, label %if.then, label %lor.lhs.false14

lor.lhs.false14:                                  ; preds = %lor.lhs.false12
  %8 = load ptr, ptr %fp.addr, align 8
  %cmp15 = icmp eq ptr %8, @clearerr
  br i1 %cmp15, label %if.then, label %lor.lhs.false16

lor.lhs.false16:                                  ; preds = %lor.lhs.false14
  %9 = load ptr, ptr %fp.addr, align 8
  %cmp17 = icmp eq ptr %9, @execv
  br i1 %cmp17, label %if.then, label %lor.lhs.false18

lor.lhs.false18:                                  ; preds = %lor.lhs.false16
  %10 = load ptr, ptr %fp.addr, align 8
  %cmp19 = icmp eq ptr %10, @execvp
  br i1 %cmp19, label %if.then, label %lor.lhs.false20

lor.lhs.false20:                                  ; preds = %lor.lhs.false18
  %11 = load ptr, ptr %fp.addr, align 8
  %cmp21 = icmp eq ptr %11, @fclose
  br i1 %cmp21, label %if.then, label %lor.lhs.false22

lor.lhs.false22:                                  ; preds = %lor.lhs.false20
  %12 = load ptr, ptr %fp.addr, align 8
  %cmp23 = icmp eq ptr %12, @feof
  br i1 %cmp23, label %if.then, label %lor.lhs.false24

lor.lhs.false24:                                  ; preds = %lor.lhs.false22
  %13 = load ptr, ptr %fp.addr, align 8
  %cmp25 = icmp eq ptr %13, @ferror
  br i1 %cmp25, label %if.then, label %lor.lhs.false26

lor.lhs.false26:                                  ; preds = %lor.lhs.false24
  %14 = load ptr, ptr %fp.addr, align 8
  %cmp27 = icmp eq ptr %14, @fflush
  br i1 %cmp27, label %if.then, label %lor.lhs.false28

lor.lhs.false28:                                  ; preds = %lor.lhs.false26
  %15 = load ptr, ptr %fp.addr, align 8
  %cmp29 = icmp eq ptr %15, @fgetc
  br i1 %cmp29, label %if.then, label %lor.lhs.false30

lor.lhs.false30:                                  ; preds = %lor.lhs.false28
  %16 = load ptr, ptr %fp.addr, align 8
  %cmp31 = icmp eq ptr %16, @fgetpos
  br i1 %cmp31, label %if.then, label %lor.lhs.false32

lor.lhs.false32:                                  ; preds = %lor.lhs.false30
  %17 = load ptr, ptr %fp.addr, align 8
  %cmp33 = icmp eq ptr %17, @fgets
  br i1 %cmp33, label %if.then, label %lor.lhs.false34

lor.lhs.false34:                                  ; preds = %lor.lhs.false32
  %18 = load ptr, ptr %fp.addr, align 8
  %cmp35 = icmp eq ptr %18, @fopen
  br i1 %cmp35, label %if.then, label %lor.lhs.false36

lor.lhs.false36:                                  ; preds = %lor.lhs.false34
  %19 = load ptr, ptr %fp.addr, align 8
  %cmp37 = icmp eq ptr %19, @fprintf
  br i1 %cmp37, label %if.then, label %lor.lhs.false38

lor.lhs.false38:                                  ; preds = %lor.lhs.false36
  %20 = load ptr, ptr %fp.addr, align 8
  %cmp39 = icmp eq ptr %20, @fputc
  br i1 %cmp39, label %if.then, label %lor.lhs.false40

lor.lhs.false40:                                  ; preds = %lor.lhs.false38
  %21 = load ptr, ptr %fp.addr, align 8
  %cmp41 = icmp eq ptr %21, @fputs
  br i1 %cmp41, label %if.then, label %lor.lhs.false42

lor.lhs.false42:                                  ; preds = %lor.lhs.false40
  %22 = load ptr, ptr %fp.addr, align 8
  %cmp43 = icmp eq ptr %22, @fread
  br i1 %cmp43, label %if.then, label %lor.lhs.false44

lor.lhs.false44:                                  ; preds = %lor.lhs.false42
  %23 = load ptr, ptr %fp.addr, align 8
  %cmp45 = icmp eq ptr %23, @free
  br i1 %cmp45, label %if.then, label %lor.lhs.false46

lor.lhs.false46:                                  ; preds = %lor.lhs.false44
  %24 = load ptr, ptr %fp.addr, align 8
  %cmp47 = icmp eq ptr %24, @freopen
  br i1 %cmp47, label %if.then, label %lor.lhs.false48

lor.lhs.false48:                                  ; preds = %lor.lhs.false46
  %25 = load ptr, ptr %fp.addr, align 8
  %cmp49 = icmp eq ptr %25, @frexp
  br i1 %cmp49, label %if.then, label %lor.lhs.false50

lor.lhs.false50:                                  ; preds = %lor.lhs.false48
  %26 = load ptr, ptr %fp.addr, align 8
  %cmp51 = icmp eq ptr %26, @__isoc99_fscanf
  br i1 %cmp51, label %if.then, label %lor.lhs.false52

lor.lhs.false52:                                  ; preds = %lor.lhs.false50
  %27 = load ptr, ptr %fp.addr, align 8
  %cmp53 = icmp eq ptr %27, @fseek
  br i1 %cmp53, label %if.then, label %lor.lhs.false54

lor.lhs.false54:                                  ; preds = %lor.lhs.false52
  %28 = load ptr, ptr %fp.addr, align 8
  %cmp55 = icmp eq ptr %28, @fsetpos
  br i1 %cmp55, label %if.then, label %lor.lhs.false56

lor.lhs.false56:                                  ; preds = %lor.lhs.false54
  %29 = load ptr, ptr %fp.addr, align 8
  %cmp57 = icmp eq ptr %29, @ftell
  br i1 %cmp57, label %if.then, label %lor.lhs.false58

lor.lhs.false58:                                  ; preds = %lor.lhs.false56
  %30 = load ptr, ptr %fp.addr, align 8
  %cmp59 = icmp eq ptr %30, @fwrite
  br i1 %cmp59, label %if.then, label %lor.lhs.false60

lor.lhs.false60:                                  ; preds = %lor.lhs.false58
  %31 = load ptr, ptr %fp.addr, align 8
  %cmp61 = icmp eq ptr %31, @getc
  br i1 %cmp61, label %if.then, label %lor.lhs.false62

lor.lhs.false62:                                  ; preds = %lor.lhs.false60
  %32 = load ptr, ptr %fp.addr, align 8
  %cmp63 = icmp eq ptr %32, @getcwd
  br i1 %cmp63, label %if.then, label %lor.lhs.false64

lor.lhs.false64:                                  ; preds = %lor.lhs.false62
  %33 = load ptr, ptr %fp.addr, align 8
  %cmp65 = icmp eq ptr %33, @getenv
  br i1 %cmp65, label %if.then, label %lor.lhs.false66

lor.lhs.false66:                                  ; preds = %lor.lhs.false64
  %34 = load ptr, ptr %fp.addr, align 8
  %cmp67 = icmp eq ptr %34, @link
  br i1 %cmp67, label %if.then, label %lor.lhs.false68

lor.lhs.false68:                                  ; preds = %lor.lhs.false66
  %35 = load ptr, ptr %fp.addr, align 8
  %cmp69 = icmp eq ptr %35, @malloc
  br i1 %cmp69, label %if.then, label %lor.lhs.false70

lor.lhs.false70:                                  ; preds = %lor.lhs.false68
  %36 = load ptr, ptr %fp.addr, align 8
  %cmp71 = icmp eq ptr %36, @mblen
  br i1 %cmp71, label %if.then, label %lor.lhs.false72

lor.lhs.false72:                                  ; preds = %lor.lhs.false70
  %37 = load ptr, ptr %fp.addr, align 8
  %cmp73 = icmp eq ptr %37, @mbstowcs
  br i1 %cmp73, label %if.then, label %lor.lhs.false74

lor.lhs.false74:                                  ; preds = %lor.lhs.false72
  %38 = load ptr, ptr %fp.addr, align 8
  %cmp75 = icmp eq ptr %38, @mbtowc
  br i1 %cmp75, label %if.then, label %lor.lhs.false76

lor.lhs.false76:                                  ; preds = %lor.lhs.false74
  %39 = load ptr, ptr %fp.addr, align 8
  %cmp77 = icmp eq ptr %39, @memchr
  br i1 %cmp77, label %if.then, label %lor.lhs.false78

lor.lhs.false78:                                  ; preds = %lor.lhs.false76
  %40 = load ptr, ptr %fp.addr, align 8
  %cmp79 = icmp eq ptr %40, @memcmp
  br i1 %cmp79, label %if.then, label %lor.lhs.false80

lor.lhs.false80:                                  ; preds = %lor.lhs.false78
  %41 = load ptr, ptr %fp.addr, align 8
  %cmp81 = icmp eq ptr %41, @memcpy
  br i1 %cmp81, label %if.then, label %lor.lhs.false82

lor.lhs.false82:                                  ; preds = %lor.lhs.false80
  %42 = load ptr, ptr %fp.addr, align 8
  %cmp83 = icmp eq ptr %42, @memmove
  br i1 %cmp83, label %if.then, label %lor.lhs.false84

lor.lhs.false84:                                  ; preds = %lor.lhs.false82
  %43 = load ptr, ptr %fp.addr, align 8
  %cmp85 = icmp eq ptr %43, @memset
  br i1 %cmp85, label %if.then, label %lor.lhs.false86

lor.lhs.false86:                                  ; preds = %lor.lhs.false84
  %44 = load ptr, ptr %fp.addr, align 8
  %cmp87 = icmp eq ptr %44, @modf
  br i1 %cmp87, label %if.then, label %lor.lhs.false88

lor.lhs.false88:                                  ; preds = %lor.lhs.false86
  %45 = load ptr, ptr %fp.addr, align 8
  %cmp89 = icmp eq ptr %45, @perror
  br i1 %cmp89, label %if.then, label %lor.lhs.false90

lor.lhs.false90:                                  ; preds = %lor.lhs.false88
  %46 = load ptr, ptr %fp.addr, align 8
  %cmp91 = icmp eq ptr %46, @pipe
  br i1 %cmp91, label %if.then, label %lor.lhs.false92

lor.lhs.false92:                                  ; preds = %lor.lhs.false90
  %47 = load ptr, ptr %fp.addr, align 8
  %cmp93 = icmp eq ptr %47, @printf
  br i1 %cmp93, label %if.then, label %lor.lhs.false94

lor.lhs.false94:                                  ; preds = %lor.lhs.false92
  %48 = load ptr, ptr %fp.addr, align 8
  %cmp95 = icmp eq ptr %48, @putc
  br i1 %cmp95, label %if.then, label %lor.lhs.false96

lor.lhs.false96:                                  ; preds = %lor.lhs.false94
  %49 = load ptr, ptr %fp.addr, align 8
  %cmp97 = icmp eq ptr %49, @puts
  br i1 %cmp97, label %if.then, label %lor.lhs.false98

lor.lhs.false98:                                  ; preds = %lor.lhs.false96
  %50 = load ptr, ptr %fp.addr, align 8
  %cmp99 = icmp eq ptr %50, @qsort
  br i1 %cmp99, label %if.then, label %lor.lhs.false100

lor.lhs.false100:                                 ; preds = %lor.lhs.false98
  %51 = load ptr, ptr %fp.addr, align 8
  %cmp101 = icmp eq ptr %51, @read
  br i1 %cmp101, label %if.then, label %lor.lhs.false102

lor.lhs.false102:                                 ; preds = %lor.lhs.false100
  %52 = load ptr, ptr %fp.addr, align 8
  %cmp103 = icmp eq ptr %52, @realloc
  br i1 %cmp103, label %if.then, label %lor.lhs.false104

lor.lhs.false104:                                 ; preds = %lor.lhs.false102
  %53 = load ptr, ptr %fp.addr, align 8
  %cmp105 = icmp eq ptr %53, @remove
  br i1 %cmp105, label %if.then, label %lor.lhs.false106

lor.lhs.false106:                                 ; preds = %lor.lhs.false104
  %54 = load ptr, ptr %fp.addr, align 8
  %cmp107 = icmp eq ptr %54, @rename
  br i1 %cmp107, label %if.then, label %lor.lhs.false108

lor.lhs.false108:                                 ; preds = %lor.lhs.false106
  %55 = load ptr, ptr %fp.addr, align 8
  %cmp109 = icmp eq ptr %55, @rewind
  br i1 %cmp109, label %if.then, label %lor.lhs.false110

lor.lhs.false110:                                 ; preds = %lor.lhs.false108
  %56 = load ptr, ptr %fp.addr, align 8
  %cmp111 = icmp eq ptr %56, @rmdir
  br i1 %cmp111, label %if.then, label %lor.lhs.false112

lor.lhs.false112:                                 ; preds = %lor.lhs.false110
  %57 = load ptr, ptr %fp.addr, align 8
  %cmp113 = icmp eq ptr %57, @__isoc99_scanf
  br i1 %cmp113, label %if.then, label %lor.lhs.false114

lor.lhs.false114:                                 ; preds = %lor.lhs.false112
  %58 = load ptr, ptr %fp.addr, align 8
  %cmp115 = icmp eq ptr %58, @select
  br i1 %cmp115, label %if.then, label %lor.lhs.false116

lor.lhs.false116:                                 ; preds = %lor.lhs.false114
  %59 = load ptr, ptr %fp.addr, align 8
  %cmp117 = icmp eq ptr %59, @setbuf
  br i1 %cmp117, label %if.then, label %lor.lhs.false118

lor.lhs.false118:                                 ; preds = %lor.lhs.false116
  %60 = load ptr, ptr %fp.addr, align 8
  %cmp119 = icmp eq ptr %60, @setvbuf
  br i1 %cmp119, label %if.then, label %lor.lhs.false120

lor.lhs.false120:                                 ; preds = %lor.lhs.false118
  %61 = load ptr, ptr %fp.addr, align 8
  %cmp121 = icmp eq ptr %61, @sprintf
  br i1 %cmp121, label %if.then, label %lor.lhs.false122

lor.lhs.false122:                                 ; preds = %lor.lhs.false120
  %62 = load ptr, ptr %fp.addr, align 8
  %cmp123 = icmp eq ptr %62, @__isoc99_sscanf
  br i1 %cmp123, label %if.then, label %lor.lhs.false124

lor.lhs.false124:                                 ; preds = %lor.lhs.false122
  %63 = load ptr, ptr %fp.addr, align 8
  %cmp125 = icmp eq ptr %63, @strcat
  br i1 %cmp125, label %if.then, label %lor.lhs.false126

lor.lhs.false126:                                 ; preds = %lor.lhs.false124
  %64 = load ptr, ptr %fp.addr, align 8
  %cmp127 = icmp eq ptr %64, @strchr
  br i1 %cmp127, label %if.then, label %lor.lhs.false128

lor.lhs.false128:                                 ; preds = %lor.lhs.false126
  %65 = load ptr, ptr %fp.addr, align 8
  %cmp129 = icmp eq ptr %65, @strcmp
  br i1 %cmp129, label %if.then, label %lor.lhs.false130

lor.lhs.false130:                                 ; preds = %lor.lhs.false128
  %66 = load ptr, ptr %fp.addr, align 8
  %cmp131 = icmp eq ptr %66, @strcoll
  br i1 %cmp131, label %if.then, label %lor.lhs.false132

lor.lhs.false132:                                 ; preds = %lor.lhs.false130
  %67 = load ptr, ptr %fp.addr, align 8
  %cmp133 = icmp eq ptr %67, @strcpy
  br i1 %cmp133, label %if.then, label %lor.lhs.false134

lor.lhs.false134:                                 ; preds = %lor.lhs.false132
  %68 = load ptr, ptr %fp.addr, align 8
  %cmp135 = icmp eq ptr %68, @strcspn
  br i1 %cmp135, label %if.then, label %lor.lhs.false136

lor.lhs.false136:                                 ; preds = %lor.lhs.false134
  %69 = load ptr, ptr %fp.addr, align 8
  %cmp137 = icmp eq ptr %69, @strerror
  br i1 %cmp137, label %if.then, label %lor.lhs.false138

lor.lhs.false138:                                 ; preds = %lor.lhs.false136
  %70 = load ptr, ptr %fp.addr, align 8
  %cmp139 = icmp eq ptr %70, @strlen
  br i1 %cmp139, label %if.then, label %lor.lhs.false140

lor.lhs.false140:                                 ; preds = %lor.lhs.false138
  %71 = load ptr, ptr %fp.addr, align 8
  %cmp141 = icmp eq ptr %71, @strncat
  br i1 %cmp141, label %if.then, label %lor.lhs.false142

lor.lhs.false142:                                 ; preds = %lor.lhs.false140
  %72 = load ptr, ptr %fp.addr, align 8
  %cmp143 = icmp eq ptr %72, @strncmp
  br i1 %cmp143, label %if.then, label %lor.lhs.false144

lor.lhs.false144:                                 ; preds = %lor.lhs.false142
  %73 = load ptr, ptr %fp.addr, align 8
  %cmp145 = icmp eq ptr %73, @strncpy
  br i1 %cmp145, label %if.then, label %lor.lhs.false146

lor.lhs.false146:                                 ; preds = %lor.lhs.false144
  %74 = load ptr, ptr %fp.addr, align 8
  %cmp147 = icmp eq ptr %74, @strpbrk
  br i1 %cmp147, label %if.then, label %lor.lhs.false148

lor.lhs.false148:                                 ; preds = %lor.lhs.false146
  %75 = load ptr, ptr %fp.addr, align 8
  %cmp149 = icmp eq ptr %75, @strrchr
  br i1 %cmp149, label %if.then, label %lor.lhs.false150

lor.lhs.false150:                                 ; preds = %lor.lhs.false148
  %76 = load ptr, ptr %fp.addr, align 8
  %cmp151 = icmp eq ptr %76, @strspn
  br i1 %cmp151, label %if.then, label %lor.lhs.false152

lor.lhs.false152:                                 ; preds = %lor.lhs.false150
  %77 = load ptr, ptr %fp.addr, align 8
  %cmp153 = icmp eq ptr %77, @strstr
  br i1 %cmp153, label %if.then, label %lor.lhs.false154

lor.lhs.false154:                                 ; preds = %lor.lhs.false152
  %78 = load ptr, ptr %fp.addr, align 8
  %cmp155 = icmp eq ptr %78, @strtod
  br i1 %cmp155, label %if.then, label %lor.lhs.false156

lor.lhs.false156:                                 ; preds = %lor.lhs.false154
  %79 = load ptr, ptr %fp.addr, align 8
  %cmp157 = icmp eq ptr %79, @strtok
  br i1 %cmp157, label %if.then, label %lor.lhs.false158

lor.lhs.false158:                                 ; preds = %lor.lhs.false156
  %80 = load ptr, ptr %fp.addr, align 8
  %cmp159 = icmp eq ptr %80, @strtol
  br i1 %cmp159, label %if.then, label %lor.lhs.false160

lor.lhs.false160:                                 ; preds = %lor.lhs.false158
  %81 = load ptr, ptr %fp.addr, align 8
  %cmp161 = icmp eq ptr %81, @strtoul
  br i1 %cmp161, label %if.then, label %lor.lhs.false162

lor.lhs.false162:                                 ; preds = %lor.lhs.false160
  %82 = load ptr, ptr %fp.addr, align 8
  %cmp163 = icmp eq ptr %82, @strxfrm
  br i1 %cmp163, label %if.then, label %lor.lhs.false164

lor.lhs.false164:                                 ; preds = %lor.lhs.false162
  %83 = load ptr, ptr %fp.addr, align 8
  %cmp165 = icmp eq ptr %83, @system
  br i1 %cmp165, label %if.then, label %lor.lhs.false166

lor.lhs.false166:                                 ; preds = %lor.lhs.false164
  %84 = load ptr, ptr %fp.addr, align 8
  %cmp167 = icmp eq ptr %84, @tmpfile
  br i1 %cmp167, label %if.then, label %lor.lhs.false168

lor.lhs.false168:                                 ; preds = %lor.lhs.false166
  %85 = load ptr, ptr %fp.addr, align 8
  %cmp169 = icmp eq ptr %85, @ungetc
  br i1 %cmp169, label %if.then, label %lor.lhs.false170

lor.lhs.false170:                                 ; preds = %lor.lhs.false168
  %86 = load ptr, ptr %fp.addr, align 8
  %cmp171 = icmp eq ptr %86, @unlink
  br i1 %cmp171, label %if.then, label %lor.lhs.false172

lor.lhs.false172:                                 ; preds = %lor.lhs.false170
  %87 = load ptr, ptr %fp.addr, align 8
  %cmp173 = icmp eq ptr %87, @vasprintf
  br i1 %cmp173, label %if.then, label %lor.lhs.false174

lor.lhs.false174:                                 ; preds = %lor.lhs.false172
  %88 = load ptr, ptr %fp.addr, align 8
  %cmp175 = icmp eq ptr %88, @vfprintf
  br i1 %cmp175, label %if.then, label %lor.lhs.false176

lor.lhs.false176:                                 ; preds = %lor.lhs.false174
  %89 = load ptr, ptr %fp.addr, align 8
  %cmp177 = icmp eq ptr %89, @vprintf
  br i1 %cmp177, label %if.then, label %lor.lhs.false178

lor.lhs.false178:                                 ; preds = %lor.lhs.false176
  %90 = load ptr, ptr %fp.addr, align 8
  %cmp179 = icmp eq ptr %90, @vsprintf
  br i1 %cmp179, label %if.then, label %lor.lhs.false180

lor.lhs.false180:                                 ; preds = %lor.lhs.false178
  %91 = load ptr, ptr %fp.addr, align 8
  %cmp181 = icmp eq ptr %91, @wcstombs
  br i1 %cmp181, label %if.then, label %lor.lhs.false182

lor.lhs.false182:                                 ; preds = %lor.lhs.false180
  %92 = load ptr, ptr %fp.addr, align 8
  %cmp183 = icmp eq ptr %92, @wctomb
  br i1 %cmp183, label %if.then, label %lor.lhs.false184

lor.lhs.false184:                                 ; preds = %lor.lhs.false182
  %93 = load ptr, ptr %fp.addr, align 8
  %cmp185 = icmp eq ptr %93, @write
  br i1 %cmp185, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false184, %lor.lhs.false182, %lor.lhs.false180, %lor.lhs.false178, %lor.lhs.false176, %lor.lhs.false174, %lor.lhs.false172, %lor.lhs.false170, %lor.lhs.false168, %lor.lhs.false166, %lor.lhs.false164, %lor.lhs.false162, %lor.lhs.false160, %lor.lhs.false158, %lor.lhs.false156, %lor.lhs.false154, %lor.lhs.false152, %lor.lhs.false150, %lor.lhs.false148, %lor.lhs.false146, %lor.lhs.false144, %lor.lhs.false142, %lor.lhs.false140, %lor.lhs.false138, %lor.lhs.false136, %lor.lhs.false134, %lor.lhs.false132, %lor.lhs.false130, %lor.lhs.false128, %lor.lhs.false126, %lor.lhs.false124, %lor.lhs.false122, %lor.lhs.false120, %lor.lhs.false118, %lor.lhs.false116, %lor.lhs.false114, %lor.lhs.false112, %lor.lhs.false110, %lor.lhs.false108, %lor.lhs.false106, %lor.lhs.false104, %lor.lhs.false102, %lor.lhs.false100, %lor.lhs.false98, %lor.lhs.false96, %lor.lhs.false94, %lor.lhs.false92, %lor.lhs.false90, %lor.lhs.false88, %lor.lhs.false86, %lor.lhs.false84, %lor.lhs.false82, %lor.lhs.false80, %lor.lhs.false78, %lor.lhs.false76, %lor.lhs.false74, %lor.lhs.false72, %lor.lhs.false70, %lor.lhs.false68, %lor.lhs.false66, %lor.lhs.false64, %lor.lhs.false62, %lor.lhs.false60, %lor.lhs.false58, %lor.lhs.false56, %lor.lhs.false54, %lor.lhs.false52, %lor.lhs.false50, %lor.lhs.false48, %lor.lhs.false46, %lor.lhs.false44, %lor.lhs.false42, %lor.lhs.false40, %lor.lhs.false38, %lor.lhs.false36, %lor.lhs.false34, %lor.lhs.false32, %lor.lhs.false30, %lor.lhs.false28, %lor.lhs.false26, %lor.lhs.false24, %lor.lhs.false22, %lor.lhs.false20, %lor.lhs.false18, %lor.lhs.false16, %lor.lhs.false14, %lor.lhs.false12, %lor.lhs.false10, %lor.lhs.false8, %lor.lhs.false6, %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  store i32 1, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false184
  store i32 0, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %94 = load i32, ptr %retval, align 4
  ret i32 %94
}

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: nounwind
declare ptr @memmove(ptr noundef, ptr noundef, i64 noundef) #3

; Function Attrs: nounwind
declare ptr @memset(ptr noundef, i32 noundef, i64 noundef) #3

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #3

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(ptr noundef, ptr noundef, ...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__RV_global_init_code() #0 {
entry:
  %call = call ptr @__RV_stat_node_create(i32 noundef 1, i64 noundef 1)
  store ptr %call, ptr @__RV_function_sa, align 8
  %call1 = call ptr @__RV_stat_node_create(i32 noundef 2, i64 noundef 1)
  store ptr %call1, ptr @__RV_global_sa, align 8
  %call2 = call ptr @__RV_stat_node_create(i32 noundef 3, i64 noundef 1)
  store ptr %call2, ptr @__RV_static_sa, align 8
  %call3 = call ptr @__RV_stat_node_create(i32 noundef 6, i64 noundef 1)
  store ptr %call3, ptr @__RV_library_sa, align 8
  call void @__RV_stdio_init_code()
  call void @__RV_unistd_init_code()
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @polybench_start_instruments() #0 {
entry:
  %__RV_stack_sa = alloca ptr, align 8
  %_RV_ret_flag = alloca i8, align 1
  %call = call ptr @__RV_stat_node_create(i32 noundef 5, i64 noundef 1)
  store ptr %call, ptr %__RV_stack_sa, align 8
  store i8 0, ptr %_RV_ret_flag, align 1
  br label %_RV_lbl_100901833916600

_RV_lbl_100901833916600:                          ; preds = %entry
  %0 = load ptr, ptr %__RV_stack_sa, align 8
  %stat = getelementptr inbounds %struct.__RV_stat_node, ptr %0, i32 0, i32 0
  store i32 0, ptr %stat, align 8
  %1 = load ptr, ptr %__RV_stack_sa, align 8
  %call1 = call i32 @__RV_stat_node_dec(ptr noundef %1)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @polybench_stop_instruments() #0 {
entry:
  %__RV_stack_sa = alloca ptr, align 8
  %_RV_ret_flag = alloca i8, align 1
  %call = call ptr @__RV_stat_node_create(i32 noundef 5, i64 noundef 1)
  store ptr %call, ptr %__RV_stack_sa, align 8
  store i8 0, ptr %_RV_ret_flag, align 1
  br label %_RV_lbl_100901833916808

_RV_lbl_100901833916808:                          ; preds = %entry
  %0 = load ptr, ptr %__RV_stack_sa, align 8
  %stat = getelementptr inbounds %struct.__RV_stat_node, ptr %0, i32 0, i32 0
  store i32 0, ptr %stat, align 8
  %1 = load ptr, ptr %__RV_stack_sa, align 8
  %call1 = call i32 @__RV_stat_node_dec(ptr noundef %1)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @polybench_print_instruments() #0 {
entry:
  %__RV_stack_sa = alloca ptr, align 8
  %_RV_ret_flag = alloca i8, align 1
  %call = call ptr @__RV_stat_node_create(i32 noundef 5, i64 noundef 1)
  store ptr %call, ptr %__RV_stack_sa, align 8
  store i8 0, ptr %_RV_ret_flag, align 1
  br label %_RV_lbl_100901833917016

_RV_lbl_100901833917016:                          ; preds = %entry
  %0 = load ptr, ptr %__RV_stack_sa, align 8
  %stat = getelementptr inbounds %struct.__RV_stat_node, ptr %0, i32 0, i32 0
  store i32 0, ptr %stat, align 8
  %1 = load ptr, ptr %__RV_stack_sa, align 8
  %call1 = call i32 @__RV_stat_node_dec(ptr noundef %1)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @polybench_prevent_dce(ptr noundef %ptr) #0 {
entry:
  %ptr.addr = alloca ptr, align 8
  %__RV_stack_sa = alloca ptr, align 8
  %_RV_ret_flag = alloca i8, align 1
  %_RV_pmd_ptr_100901833917056 = alloca %struct.__RV_pmd, align 8
  %_RV_param_pmds = alloca ptr, align 8
  store ptr %ptr, ptr %ptr.addr, align 8
  %call = call ptr @__RV_stat_node_create(i32 noundef 5, i64 noundef 1)
  store ptr %call, ptr %__RV_stack_sa, align 8
  store i8 0, ptr %_RV_ret_flag, align 1
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_ptr_100901833917056, i8 0, i64 32, i1 false)
  %call1 = call ptr @__RV_fmd_tbl_lookup_fpmd(ptr noundef @polybench_prevent_dce, i8 noundef zeroext 0)
  %call2 = call ptr @__RV_pmd_cp_fmd_pmd(ptr noundef %_RV_pmd_ptr_100901833917056, ptr noundef %call1)
  store ptr %call2, ptr %_RV_param_pmds, align 8
  br label %_RV_lbl_100901833917368

_RV_lbl_100901833917368:                          ; preds = %entry
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_ptr_100901833917056)
  %0 = load ptr, ptr %__RV_stack_sa, align 8
  %stat = getelementptr inbounds %struct.__RV_stat_node, ptr %0, i32 0, i32 0
  store i32 0, ptr %stat, align 8
  %1 = load ptr, ptr %__RV_stack_sa, align 8
  %call3 = call i32 @__RV_stat_node_dec(ptr noundef %1)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_RV_polybench_prevent_dce(ptr noundef %p1_pmd, ptr noundef %p1) #0 {
entry:
  %p1_pmd.addr = alloca ptr, align 8
  %p1.addr = alloca ptr, align 8
  store ptr %p1_pmd, ptr %p1_pmd.addr, align 8
  store ptr %p1, ptr %p1.addr, align 8
  %call = call ptr @__RV_fmd_tbl_create(ptr noundef @polybench_prevent_dce, i8 noundef zeroext 1)
  %0 = load ptr, ptr %p1_pmd.addr, align 8
  %call1 = call ptr @__RV_fmd_tbl_update_pmd(ptr noundef @polybench_prevent_dce, i8 noundef zeroext 0, ptr noundef %0)
  %1 = load ptr, ptr %p1.addr, align 8
  call void @polybench_prevent_dce(ptr noundef %1)
  call void @__RV_fmd_tbl_remove(ptr noundef @polybench_prevent_dce)
  %2 = load ptr, ptr %p1_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %2)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_RV_main(i32 noundef %argc, ptr noundef %argv) #0 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca ptr, align 8
  %__RV_stack_sa = alloca ptr, align 8
  %_RV_ret_flag = alloca i8, align 1
  %_RV_ret_val = alloca i32, align 4
  %_RV_pmd_argv_100901833917536 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_C_100901833919136 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_A_100901833924560 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_B_100901833925792 = alloca %struct.__RV_pmd, align 8
  %_RV_param_pmds = alloca ptr, align 8
  %ni = alloca i32, align 4
  %nj = alloca i32, align 4
  %nk = alloca i32, align 4
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %C = alloca ptr, align 8
  %A = alloca ptr, align 8
  %B = alloca ptr, align 8
  store i32 %argc, ptr %argc.addr, align 4
  store ptr %argv, ptr %argv.addr, align 8
  %call = call ptr @__RV_stat_node_create(i32 noundef 5, i64 noundef 1)
  store ptr %call, ptr %__RV_stack_sa, align 8
  store i8 0, ptr %_RV_ret_flag, align 1
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_argv_100901833917536, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_C_100901833919136, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_A_100901833924560, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_B_100901833925792, i8 0, i64 32, i1 false)
  %0 = load i32, ptr %argc.addr, align 4
  %1 = load ptr, ptr %argv.addr, align 8
  %call1 = call ptr @__RV_pmd_var_update_argv(i32 noundef %0, ptr noundef %_RV_pmd_argv_100901833917536, ptr noundef %1)
  store ptr %call1, ptr %_RV_param_pmds, align 8
  store i32 1024, ptr %ni, align 4
  store i32 1024, ptr %nj, align 4
  store i32 1024, ptr %nk, align 4
  %2 = load i32, ptr %nj, align 4
  %3 = zext i32 %2 to i64
  %4 = load i32, ptr %nj, align 4
  %5 = zext i32 %4 to i64
  %6 = load i32, ptr %ni, align 4
  %7 = load i32, ptr %nj, align 4
  %mul = mul nsw i32 %6, %7
  %conv = sext i32 %mul to i64
  %mul2 = mul i64 %conv, 8
  %call3 = call noalias ptr @malloc(i64 noundef %mul2) #12
  store ptr %call3, ptr %C, align 8
  %8 = load i32, ptr %nk, align 4
  %9 = zext i32 %8 to i64
  %10 = load i32, ptr %nk, align 4
  %11 = zext i32 %10 to i64
  %12 = load i32, ptr %ni, align 4
  %13 = load i32, ptr %nk, align 4
  %mul4 = mul nsw i32 %12, %13
  %conv5 = sext i32 %mul4 to i64
  %mul6 = mul i64 %conv5, 8
  %call7 = call noalias ptr @malloc(i64 noundef %mul6) #12
  store ptr %call7, ptr %A, align 8
  %14 = load i32, ptr %nj, align 4
  %15 = zext i32 %14 to i64
  %16 = load i32, ptr %nj, align 4
  %17 = zext i32 %16 to i64
  %18 = load i32, ptr %nk, align 4
  %19 = load i32, ptr %nj, align 4
  %mul8 = mul nsw i32 %18, %19
  %conv9 = sext i32 %mul8 to i64
  %mul10 = mul i64 %conv9, 8
  %call11 = call noalias ptr @malloc(i64 noundef %mul10) #12
  store ptr %call11, ptr %B, align 8
  %20 = load ptr, ptr %__RV_stack_sa, align 8
  %add.ptr = getelementptr inbounds double, ptr %alpha, i64 1
  %call12 = call ptr @__RV_pmd_create(ptr noundef null, ptr noundef %20, i32 noundef 5, ptr noundef %alpha, ptr noundef %add.ptr)
  %21 = load ptr, ptr %__RV_stack_sa, align 8
  %add.ptr13 = getelementptr inbounds double, ptr %beta, i64 1
  %call14 = call ptr @__RV_pmd_create(ptr noundef null, ptr noundef %21, i32 noundef 5, ptr noundef %beta, ptr noundef %add.ptr13)
  %22 = load i32, ptr %ni, align 4
  %23 = load i32, ptr %nj, align 4
  %24 = load i32, ptr %nk, align 4
  %25 = load i32, ptr %nj, align 4
  %26 = zext i32 %25 to i64
  %27 = load ptr, ptr %C, align 8
  %28 = load i32, ptr %nk, align 4
  %29 = zext i32 %28 to i64
  %30 = load ptr, ptr %A, align 8
  %31 = load i32, ptr %nj, align 4
  %32 = zext i32 %31 to i64
  %33 = load ptr, ptr %B, align 8
  call void @_RV_init_array(ptr noundef %call12, ptr noundef %call14, ptr noundef %_RV_pmd_C_100901833919136, ptr noundef %_RV_pmd_A_100901833924560, ptr noundef %_RV_pmd_B_100901833925792, i32 noundef %22, i32 noundef %23, i32 noundef %24, ptr noundef %alpha, ptr noundef %beta, ptr noundef %27, ptr noundef %30, ptr noundef %33)
  call void @polybench_start_instruments()
  %34 = load i32, ptr %ni, align 4
  %35 = load i32, ptr %nj, align 4
  %36 = load i32, ptr %nk, align 4
  %37 = load double, ptr %alpha, align 8
  %38 = load double, ptr %beta, align 8
  %39 = load i32, ptr %nj, align 4
  %40 = zext i32 %39 to i64
  %41 = load ptr, ptr %C, align 8
  %42 = load i32, ptr %nk, align 4
  %43 = zext i32 %42 to i64
  %44 = load ptr, ptr %A, align 8
  %45 = load i32, ptr %nj, align 4
  %46 = zext i32 %45 to i64
  %47 = load ptr, ptr %B, align 8
  call void @_RV_kernel_gemm(ptr noundef %_RV_pmd_C_100901833919136, ptr noundef %_RV_pmd_A_100901833924560, ptr noundef %_RV_pmd_B_100901833925792, i32 noundef %34, i32 noundef %35, i32 noundef %36, double noundef %37, double noundef %38, ptr noundef %41, ptr noundef %44, ptr noundef %47)
  call void @polybench_stop_instruments()
  call void @polybench_print_instruments()
  %48 = load i32, ptr %ni, align 4
  %49 = load i32, ptr %nj, align 4
  %50 = load i32, ptr %nj, align 4
  %51 = zext i32 %50 to i64
  %52 = load ptr, ptr %C, align 8
  call void @_RV_print_array(ptr noundef %_RV_pmd_C_100901833919136, i32 noundef %48, i32 noundef %49, ptr noundef %52)
  %53 = load ptr, ptr %C, align 8
  call void @free(ptr noundef %53) #13
  %54 = load ptr, ptr %A, align 8
  call void @free(ptr noundef %54) #13
  %55 = load ptr, ptr %B, align 8
  call void @free(ptr noundef %55) #13
  store i32 0, ptr %_RV_ret_val, align 4
  store i8 1, ptr %_RV_ret_flag, align 1
  br label %_RV_lbl_100901833934328

_RV_lbl_100901833934328:                          ; preds = %entry
  %56 = load i32, ptr %argc.addr, align 4
  %57 = load ptr, ptr %argv.addr, align 8
  call void @__RV_pmd_var_remove_argv(i32 noundef %56, ptr noundef %_RV_pmd_argv_100901833917536, ptr noundef %57)
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_C_100901833919136)
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_A_100901833924560)
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_B_100901833925792)
  %58 = load ptr, ptr %__RV_stack_sa, align 8
  %stat = getelementptr inbounds %struct.__RV_stat_node, ptr %58, i32 0, i32 0
  store i32 0, ptr %stat, align 8
  %59 = load ptr, ptr %__RV_stack_sa, align 8
  %call15 = call i32 @__RV_stat_node_dec(ptr noundef %59)
  %60 = load i32, ptr %_RV_ret_val, align 4
  ret i32 %60
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @_RV_init_array(ptr noundef %p4_pmd, ptr noundef %p5_pmd, ptr noundef %p6_pmd, ptr noundef %p7_pmd, ptr noundef %p8_pmd, i32 noundef %p1, i32 noundef %p2, i32 noundef %p3, ptr noundef %p4, ptr noundef %p5, ptr noundef %p6, ptr noundef %p7, ptr noundef %p8) #0 {
entry:
  %p4_pmd.addr = alloca ptr, align 8
  %p5_pmd.addr = alloca ptr, align 8
  %p6_pmd.addr = alloca ptr, align 8
  %p7_pmd.addr = alloca ptr, align 8
  %p8_pmd.addr = alloca ptr, align 8
  %p1.addr = alloca i32, align 4
  %p2.addr = alloca i32, align 4
  %p3.addr = alloca i32, align 4
  %p4.addr = alloca ptr, align 8
  %p5.addr = alloca ptr, align 8
  %p6.addr = alloca ptr, align 8
  %p7.addr = alloca ptr, align 8
  %p8.addr = alloca ptr, align 8
  store ptr %p4_pmd, ptr %p4_pmd.addr, align 8
  store ptr %p5_pmd, ptr %p5_pmd.addr, align 8
  store ptr %p6_pmd, ptr %p6_pmd.addr, align 8
  store ptr %p7_pmd, ptr %p7_pmd.addr, align 8
  store ptr %p8_pmd, ptr %p8_pmd.addr, align 8
  store i32 %p1, ptr %p1.addr, align 4
  store i32 %p2, ptr %p2.addr, align 4
  store i32 %p3, ptr %p3.addr, align 4
  store ptr %p4, ptr %p4.addr, align 8
  store ptr %p5, ptr %p5.addr, align 8
  store ptr %p6, ptr %p6.addr, align 8
  store ptr %p7, ptr %p7.addr, align 8
  store ptr %p8, ptr %p8.addr, align 8
  %0 = load i32, ptr %p2.addr, align 4
  %1 = zext i32 %0 to i64
  %2 = load i32, ptr %p3.addr, align 4
  %3 = zext i32 %2 to i64
  %4 = load i32, ptr %p2.addr, align 4
  %5 = zext i32 %4 to i64
  %call = call ptr @__RV_fmd_tbl_create(ptr noundef @init_array, i8 noundef zeroext 5)
  %6 = load ptr, ptr %p4_pmd.addr, align 8
  %call1 = call ptr @__RV_fmd_tbl_update_pmd(ptr noundef @init_array, i8 noundef zeroext 0, ptr noundef %6)
  %7 = load ptr, ptr %p5_pmd.addr, align 8
  %call2 = call ptr @__RV_fmd_tbl_update_pmd(ptr noundef @init_array, i8 noundef zeroext 1, ptr noundef %7)
  %8 = load ptr, ptr %p6_pmd.addr, align 8
  %call3 = call ptr @__RV_fmd_tbl_update_pmd(ptr noundef @init_array, i8 noundef zeroext 2, ptr noundef %8)
  %9 = load ptr, ptr %p7_pmd.addr, align 8
  %call4 = call ptr @__RV_fmd_tbl_update_pmd(ptr noundef @init_array, i8 noundef zeroext 3, ptr noundef %9)
  %10 = load ptr, ptr %p8_pmd.addr, align 8
  %call5 = call ptr @__RV_fmd_tbl_update_pmd(ptr noundef @init_array, i8 noundef zeroext 4, ptr noundef %10)
  %11 = load i32, ptr %p1.addr, align 4
  %12 = load i32, ptr %p2.addr, align 4
  %13 = load i32, ptr %p3.addr, align 4
  %14 = load ptr, ptr %p4.addr, align 8
  %15 = load ptr, ptr %p5.addr, align 8
  %16 = load ptr, ptr %p6.addr, align 8
  %17 = load ptr, ptr %p7.addr, align 8
  %18 = load ptr, ptr %p8.addr, align 8
  call void @init_array(i32 noundef %11, i32 noundef %12, i32 noundef %13, ptr noundef %14, ptr noundef %15, ptr noundef %16, ptr noundef %17, ptr noundef %18)
  call void @__RV_fmd_tbl_remove(ptr noundef @init_array)
  %19 = load ptr, ptr %p4_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %19)
  %20 = load ptr, ptr %p5_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %20)
  %21 = load ptr, ptr %p6_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %21)
  %22 = load ptr, ptr %p7_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %22)
  %23 = load ptr, ptr %p8_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %23)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @_RV_kernel_gemm(ptr noundef %p6_pmd, ptr noundef %p7_pmd, ptr noundef %p8_pmd, i32 noundef %p1, i32 noundef %p2, i32 noundef %p3, double noundef %p4, double noundef %p5, ptr noundef %p6, ptr noundef %p7, ptr noundef %p8) #0 {
entry:
  %p6_pmd.addr = alloca ptr, align 8
  %p7_pmd.addr = alloca ptr, align 8
  %p8_pmd.addr = alloca ptr, align 8
  %p1.addr = alloca i32, align 4
  %p2.addr = alloca i32, align 4
  %p3.addr = alloca i32, align 4
  %p4.addr = alloca double, align 8
  %p5.addr = alloca double, align 8
  %p6.addr = alloca ptr, align 8
  %p7.addr = alloca ptr, align 8
  %p8.addr = alloca ptr, align 8
  store ptr %p6_pmd, ptr %p6_pmd.addr, align 8
  store ptr %p7_pmd, ptr %p7_pmd.addr, align 8
  store ptr %p8_pmd, ptr %p8_pmd.addr, align 8
  store i32 %p1, ptr %p1.addr, align 4
  store i32 %p2, ptr %p2.addr, align 4
  store i32 %p3, ptr %p3.addr, align 4
  store double %p4, ptr %p4.addr, align 8
  store double %p5, ptr %p5.addr, align 8
  store ptr %p6, ptr %p6.addr, align 8
  store ptr %p7, ptr %p7.addr, align 8
  store ptr %p8, ptr %p8.addr, align 8
  %0 = load i32, ptr %p2.addr, align 4
  %1 = zext i32 %0 to i64
  %2 = load i32, ptr %p3.addr, align 4
  %3 = zext i32 %2 to i64
  %4 = load i32, ptr %p2.addr, align 4
  %5 = zext i32 %4 to i64
  %call = call ptr @__RV_fmd_tbl_create(ptr noundef @kernel_gemm, i8 noundef zeroext 3)
  %6 = load ptr, ptr %p6_pmd.addr, align 8
  %call1 = call ptr @__RV_fmd_tbl_update_pmd(ptr noundef @kernel_gemm, i8 noundef zeroext 0, ptr noundef %6)
  %7 = load ptr, ptr %p7_pmd.addr, align 8
  %call2 = call ptr @__RV_fmd_tbl_update_pmd(ptr noundef @kernel_gemm, i8 noundef zeroext 1, ptr noundef %7)
  %8 = load ptr, ptr %p8_pmd.addr, align 8
  %call3 = call ptr @__RV_fmd_tbl_update_pmd(ptr noundef @kernel_gemm, i8 noundef zeroext 2, ptr noundef %8)
  %9 = load i32, ptr %p1.addr, align 4
  %10 = load i32, ptr %p2.addr, align 4
  %11 = load i32, ptr %p3.addr, align 4
  %12 = load double, ptr %p4.addr, align 8
  %13 = load double, ptr %p5.addr, align 8
  %14 = load ptr, ptr %p6.addr, align 8
  %15 = load ptr, ptr %p7.addr, align 8
  %16 = load ptr, ptr %p8.addr, align 8
  call void @kernel_gemm(i32 noundef %9, i32 noundef %10, i32 noundef %11, double noundef %12, double noundef %13, ptr noundef %14, ptr noundef %15, ptr noundef %16)
  call void @__RV_fmd_tbl_remove(ptr noundef @kernel_gemm)
  %17 = load ptr, ptr %p6_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %17)
  %18 = load ptr, ptr %p7_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %18)
  %19 = load ptr, ptr %p8_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %19)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @_RV_print_array(ptr noundef %p3_pmd, i32 noundef %p1, i32 noundef %p2, ptr noundef %p3) #0 {
entry:
  %p3_pmd.addr = alloca ptr, align 8
  %p1.addr = alloca i32, align 4
  %p2.addr = alloca i32, align 4
  %p3.addr = alloca ptr, align 8
  store ptr %p3_pmd, ptr %p3_pmd.addr, align 8
  store i32 %p1, ptr %p1.addr, align 4
  store i32 %p2, ptr %p2.addr, align 4
  store ptr %p3, ptr %p3.addr, align 8
  %0 = load i32, ptr %p2.addr, align 4
  %1 = zext i32 %0 to i64
  %call = call ptr @__RV_fmd_tbl_create(ptr noundef @print_array, i8 noundef zeroext 1)
  %2 = load ptr, ptr %p3_pmd.addr, align 8
  %call1 = call ptr @__RV_fmd_tbl_update_pmd(ptr noundef @print_array, i8 noundef zeroext 0, ptr noundef %2)
  %3 = load i32, ptr %p1.addr, align 4
  %4 = load i32, ptr %p2.addr, align 4
  %5 = load ptr, ptr %p3.addr, align 8
  call void @print_array(i32 noundef %3, i32 noundef %4, ptr noundef %5)
  call void @__RV_fmd_tbl_remove(ptr noundef @print_array)
  %6 = load ptr, ptr %p3_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %6)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %argc, ptr noundef %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca ptr, align 8
  %ret_val = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  store i32 %argc, ptr %argc.addr, align 4
  store ptr %argv, ptr %argv.addr, align 8
  call void @__RV_global_init_code()
  %0 = load i32, ptr %argc.addr, align 4
  %1 = load ptr, ptr %argv.addr, align 8
  %call = call i32 @_RV_main(i32 noundef %0, ptr noundef %1)
  store i32 %call, ptr %ret_val, align 4
  call void @__RV_print_error_count()
  %2 = load i32, ptr %ret_val, align 4
  ret i32 %2
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @init_array(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, ptr noundef %alpha, ptr noundef %beta, ptr noundef %C, ptr noundef %A, ptr noundef %B) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %alpha.addr = alloca ptr, align 8
  %beta.addr = alloca ptr, align 8
  %C.addr = alloca ptr, align 8
  %A.addr = alloca ptr, align 8
  %B.addr = alloca ptr, align 8
  %__RV_stack_sa = alloca ptr, align 8
  %_RV_ret_flag = alloca i8, align 1
  %_RV_bc_flag_100901833899968 = alloca i8, align 1
  %_RV_bc_flag_100901833899936 = alloca i8, align 1
  %_RV_bc_flag_100901833901336 = alloca i8, align 1
  %_RV_bc_flag_100901833901304 = alloca i8, align 1
  %_RV_bc_flag_100901833902704 = alloca i8, align 1
  %_RV_bc_flag_100901833902672 = alloca i8, align 1
  %_RV_pmd_alpha_100901833888848 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_beta_100901833888976 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_C_100901833889424 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_A_100901833889872 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_B_100901833890320 = alloca %struct.__RV_pmd, align 8
  %_RV_param_pmds = alloca ptr, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, ptr %ni.addr, align 4
  store i32 %nj, ptr %nj.addr, align 4
  store i32 %nk, ptr %nk.addr, align 4
  store ptr %alpha, ptr %alpha.addr, align 8
  store ptr %beta, ptr %beta.addr, align 8
  store ptr %C, ptr %C.addr, align 8
  store ptr %A, ptr %A.addr, align 8
  store ptr %B, ptr %B.addr, align 8
  %0 = load i32, ptr %nj.addr, align 4
  %1 = zext i32 %0 to i64
  %2 = load i32, ptr %nk.addr, align 4
  %3 = zext i32 %2 to i64
  %4 = load i32, ptr %nj.addr, align 4
  %5 = zext i32 %4 to i64
  %call = call ptr @__RV_stat_node_create(i32 noundef 5, i64 noundef 1)
  store ptr %call, ptr %__RV_stack_sa, align 8
  store i8 0, ptr %_RV_ret_flag, align 1
  store i8 0, ptr %_RV_bc_flag_100901833899968, align 1
  store i8 0, ptr %_RV_bc_flag_100901833899936, align 1
  store i8 0, ptr %_RV_bc_flag_100901833901336, align 1
  store i8 0, ptr %_RV_bc_flag_100901833901304, align 1
  store i8 0, ptr %_RV_bc_flag_100901833902704, align 1
  store i8 0, ptr %_RV_bc_flag_100901833902672, align 1
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_alpha_100901833888848, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_beta_100901833888976, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_C_100901833889424, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_A_100901833889872, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_B_100901833890320, i8 0, i64 32, i1 false)
  %call1 = call ptr @__RV_fmd_tbl_lookup_fpmd(ptr noundef @init_array, i8 noundef zeroext 0)
  %call2 = call ptr @__RV_pmd_cp_fmd_pmd(ptr noundef %_RV_pmd_alpha_100901833888848, ptr noundef %call1)
  %call3 = call ptr @__RV_fmd_tbl_lookup_fpmd(ptr noundef @init_array, i8 noundef zeroext 1)
  %call4 = call ptr @__RV_pmd_cp_fmd_pmd(ptr noundef %_RV_pmd_beta_100901833888976, ptr noundef %call3)
  %call5 = call ptr @__RV_fmd_tbl_lookup_fpmd(ptr noundef @init_array, i8 noundef zeroext 2)
  %call6 = call ptr @__RV_pmd_cp_fmd_pmd(ptr noundef %_RV_pmd_C_100901833889424, ptr noundef %call5)
  %call7 = call ptr @__RV_fmd_tbl_lookup_fpmd(ptr noundef @init_array, i8 noundef zeroext 3)
  %call8 = call ptr @__RV_pmd_cp_fmd_pmd(ptr noundef %_RV_pmd_A_100901833889872, ptr noundef %call7)
  %call9 = call ptr @__RV_fmd_tbl_lookup_fpmd(ptr noundef @init_array, i8 noundef zeroext 4)
  %call10 = call ptr @__RV_pmd_cp_fmd_pmd(ptr noundef %_RV_pmd_B_100901833890320, ptr noundef %call9)
  store ptr %call10, ptr %_RV_param_pmds, align 8
  %6 = load ptr, ptr %alpha.addr, align 8
  store double 3.241200e+04, ptr %6, align 8
  %7 = load ptr, ptr %beta.addr, align 8
  store double 2.123000e+03, ptr %7, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc41, %entry
  %8 = load i32, ptr %i, align 4
  %9 = load i32, ptr %ni.addr, align 4
  %cmp = icmp slt i32 %8, %9
  br i1 %cmp, label %for.body, label %for.end43

for.body:                                         ; preds = %for.cond
  store i32 0, ptr %j, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc, %for.body
  %10 = load i32, ptr %j, align 4
  %11 = load i32, ptr %nj.addr, align 4
  %cmp12 = icmp slt i32 %10, %11
  br i1 %cmp12, label %for.body13, label %for.end

for.body13:                                       ; preds = %for.cond11
  %12 = load i32, ptr %i, align 4
  %conv = sitofp i32 %12 to double
  %13 = load i32, ptr %j, align 4
  %conv14 = sitofp i32 %13 to double
  %mul = fmul double %conv, %conv14
  %14 = load i32, ptr %ni.addr, align 4
  %conv15 = sitofp i32 %14 to double
  %div = fdiv double %mul, %conv15
  %15 = load ptr, ptr %C.addr, align 8
  %16 = load i32, ptr %i, align 4
  %idxprom = sext i32 %16 to i64
  %17 = mul nsw i64 %idxprom, %1
  %arrayidx = getelementptr inbounds double, ptr %15, i64 %17
  %18 = load i32, ptr %j, align 4
  %idxprom16 = sext i32 %18 to i64
  %arrayidx17 = getelementptr inbounds double, ptr %arrayidx, i64 %idxprom16
  store double %div, ptr %arrayidx17, align 8
  br label %_RV_lbl_100901833899936

_RV_lbl_100901833899936:                          ; preds = %for.body13
  %19 = load i8, ptr %_RV_ret_flag, align 1
  %tobool = icmp ne i8 %19, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %_RV_lbl_100901833899936
  br label %_RV_lbl_100901833899968

if.end:                                           ; preds = %_RV_lbl_100901833899936
  %20 = load i8, ptr %_RV_bc_flag_100901833899936, align 1
  %conv18 = zext i8 %20 to i32
  %cmp19 = icmp eq i32 %conv18, 1
  br i1 %cmp19, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end
  store i8 0, ptr %_RV_bc_flag_100901833899936, align 1
  br label %for.end

if.end22:                                         ; preds = %if.end
  %21 = load i8, ptr %_RV_bc_flag_100901833899936, align 1
  %conv23 = zext i8 %21 to i32
  %cmp24 = icmp eq i32 %conv23, 2
  br i1 %cmp24, label %if.then26, label %if.end27

if.then26:                                        ; preds = %if.end22
  store i8 0, ptr %_RV_bc_flag_100901833899936, align 1
  br label %if.end27

if.end27:                                         ; preds = %if.then26, %if.end22
  br label %for.inc

for.inc:                                          ; preds = %if.end27
  %22 = load i32, ptr %j, align 4
  %inc = add nsw i32 %22, 1
  store i32 %inc, ptr %j, align 4
  br label %for.cond11, !llvm.loop !51

for.end:                                          ; preds = %if.then21, %for.cond11
  br label %_RV_lbl_100901833899968

_RV_lbl_100901833899968:                          ; preds = %for.end, %if.then
  %23 = load i8, ptr %_RV_ret_flag, align 1
  %tobool28 = icmp ne i8 %23, 0
  br i1 %tobool28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %_RV_lbl_100901833899968
  br label %_RV_lbl_100901833902816

if.end30:                                         ; preds = %_RV_lbl_100901833899968
  %24 = load i8, ptr %_RV_bc_flag_100901833899968, align 1
  %conv31 = zext i8 %24 to i32
  %cmp32 = icmp eq i32 %conv31, 1
  br i1 %cmp32, label %if.then34, label %if.end35

if.then34:                                        ; preds = %if.end30
  store i8 0, ptr %_RV_bc_flag_100901833899968, align 1
  br label %for.end43

if.end35:                                         ; preds = %if.end30
  %25 = load i8, ptr %_RV_bc_flag_100901833899968, align 1
  %conv36 = zext i8 %25 to i32
  %cmp37 = icmp eq i32 %conv36, 2
  br i1 %cmp37, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end35
  store i8 0, ptr %_RV_bc_flag_100901833899968, align 1
  br label %if.end40

if.end40:                                         ; preds = %if.then39, %if.end35
  br label %for.inc41

for.inc41:                                        ; preds = %if.end40
  %26 = load i32, ptr %i, align 4
  %inc42 = add nsw i32 %26, 1
  store i32 %inc42, ptr %i, align 4
  br label %for.cond, !llvm.loop !52

for.end43:                                        ; preds = %if.then34, %for.cond
  store i32 0, ptr %i, align 4
  br label %for.cond44

for.cond44:                                       ; preds = %for.inc90, %for.end43
  %27 = load i32, ptr %i, align 4
  %28 = load i32, ptr %ni.addr, align 4
  %cmp45 = icmp slt i32 %27, %28
  br i1 %cmp45, label %for.body47, label %for.end92

for.body47:                                       ; preds = %for.cond44
  store i32 0, ptr %j, align 4
  br label %for.cond48

for.cond48:                                       ; preds = %for.inc74, %for.body47
  %29 = load i32, ptr %j, align 4
  %30 = load i32, ptr %nk.addr, align 4
  %cmp49 = icmp slt i32 %29, %30
  br i1 %cmp49, label %for.body51, label %for.end76

for.body51:                                       ; preds = %for.cond48
  %31 = load i32, ptr %i, align 4
  %conv52 = sitofp i32 %31 to double
  %32 = load i32, ptr %j, align 4
  %conv53 = sitofp i32 %32 to double
  %mul54 = fmul double %conv52, %conv53
  %33 = load i32, ptr %ni.addr, align 4
  %conv55 = sitofp i32 %33 to double
  %div56 = fdiv double %mul54, %conv55
  %34 = load ptr, ptr %A.addr, align 8
  %35 = load i32, ptr %i, align 4
  %idxprom57 = sext i32 %35 to i64
  %36 = mul nsw i64 %idxprom57, %3
  %arrayidx58 = getelementptr inbounds double, ptr %34, i64 %36
  %37 = load i32, ptr %j, align 4
  %idxprom59 = sext i32 %37 to i64
  %arrayidx60 = getelementptr inbounds double, ptr %arrayidx58, i64 %idxprom59
  store double %div56, ptr %arrayidx60, align 8
  br label %_RV_lbl_100901833901304

_RV_lbl_100901833901304:                          ; preds = %for.body51
  %38 = load i8, ptr %_RV_ret_flag, align 1
  %tobool61 = icmp ne i8 %38, 0
  br i1 %tobool61, label %if.then62, label %if.end63

if.then62:                                        ; preds = %_RV_lbl_100901833901304
  br label %_RV_lbl_100901833901336

if.end63:                                         ; preds = %_RV_lbl_100901833901304
  %39 = load i8, ptr %_RV_bc_flag_100901833901304, align 1
  %conv64 = zext i8 %39 to i32
  %cmp65 = icmp eq i32 %conv64, 1
  br i1 %cmp65, label %if.then67, label %if.end68

if.then67:                                        ; preds = %if.end63
  store i8 0, ptr %_RV_bc_flag_100901833901304, align 1
  br label %for.end76

if.end68:                                         ; preds = %if.end63
  %40 = load i8, ptr %_RV_bc_flag_100901833901304, align 1
  %conv69 = zext i8 %40 to i32
  %cmp70 = icmp eq i32 %conv69, 2
  br i1 %cmp70, label %if.then72, label %if.end73

if.then72:                                        ; preds = %if.end68
  store i8 0, ptr %_RV_bc_flag_100901833901304, align 1
  br label %if.end73

if.end73:                                         ; preds = %if.then72, %if.end68
  br label %for.inc74

for.inc74:                                        ; preds = %if.end73
  %41 = load i32, ptr %j, align 4
  %inc75 = add nsw i32 %41, 1
  store i32 %inc75, ptr %j, align 4
  br label %for.cond48, !llvm.loop !53

for.end76:                                        ; preds = %if.then67, %for.cond48
  br label %_RV_lbl_100901833901336

_RV_lbl_100901833901336:                          ; preds = %for.end76, %if.then62
  %42 = load i8, ptr %_RV_ret_flag, align 1
  %tobool77 = icmp ne i8 %42, 0
  br i1 %tobool77, label %if.then78, label %if.end79

if.then78:                                        ; preds = %_RV_lbl_100901833901336
  br label %_RV_lbl_100901833902816

if.end79:                                         ; preds = %_RV_lbl_100901833901336
  %43 = load i8, ptr %_RV_bc_flag_100901833901336, align 1
  %conv80 = zext i8 %43 to i32
  %cmp81 = icmp eq i32 %conv80, 1
  br i1 %cmp81, label %if.then83, label %if.end84

if.then83:                                        ; preds = %if.end79
  store i8 0, ptr %_RV_bc_flag_100901833901336, align 1
  br label %for.end92

if.end84:                                         ; preds = %if.end79
  %44 = load i8, ptr %_RV_bc_flag_100901833901336, align 1
  %conv85 = zext i8 %44 to i32
  %cmp86 = icmp eq i32 %conv85, 2
  br i1 %cmp86, label %if.then88, label %if.end89

if.then88:                                        ; preds = %if.end84
  store i8 0, ptr %_RV_bc_flag_100901833901336, align 1
  br label %if.end89

if.end89:                                         ; preds = %if.then88, %if.end84
  br label %for.inc90

for.inc90:                                        ; preds = %if.end89
  %45 = load i32, ptr %i, align 4
  %inc91 = add nsw i32 %45, 1
  store i32 %inc91, ptr %i, align 4
  br label %for.cond44, !llvm.loop !54

for.end92:                                        ; preds = %if.then83, %for.cond44
  store i32 0, ptr %i, align 4
  br label %for.cond93

for.cond93:                                       ; preds = %for.inc139, %for.end92
  %46 = load i32, ptr %i, align 4
  %47 = load i32, ptr %nk.addr, align 4
  %cmp94 = icmp slt i32 %46, %47
  br i1 %cmp94, label %for.body96, label %for.end141

for.body96:                                       ; preds = %for.cond93
  store i32 0, ptr %j, align 4
  br label %for.cond97

for.cond97:                                       ; preds = %for.inc123, %for.body96
  %48 = load i32, ptr %j, align 4
  %49 = load i32, ptr %nj.addr, align 4
  %cmp98 = icmp slt i32 %48, %49
  br i1 %cmp98, label %for.body100, label %for.end125

for.body100:                                      ; preds = %for.cond97
  %50 = load i32, ptr %i, align 4
  %conv101 = sitofp i32 %50 to double
  %51 = load i32, ptr %j, align 4
  %conv102 = sitofp i32 %51 to double
  %mul103 = fmul double %conv101, %conv102
  %52 = load i32, ptr %ni.addr, align 4
  %conv104 = sitofp i32 %52 to double
  %div105 = fdiv double %mul103, %conv104
  %53 = load ptr, ptr %B.addr, align 8
  %54 = load i32, ptr %i, align 4
  %idxprom106 = sext i32 %54 to i64
  %55 = mul nsw i64 %idxprom106, %5
  %arrayidx107 = getelementptr inbounds double, ptr %53, i64 %55
  %56 = load i32, ptr %j, align 4
  %idxprom108 = sext i32 %56 to i64
  %arrayidx109 = getelementptr inbounds double, ptr %arrayidx107, i64 %idxprom108
  store double %div105, ptr %arrayidx109, align 8
  br label %_RV_lbl_100901833902672

_RV_lbl_100901833902672:                          ; preds = %for.body100
  %57 = load i8, ptr %_RV_ret_flag, align 1
  %tobool110 = icmp ne i8 %57, 0
  br i1 %tobool110, label %if.then111, label %if.end112

if.then111:                                       ; preds = %_RV_lbl_100901833902672
  br label %_RV_lbl_100901833902704

if.end112:                                        ; preds = %_RV_lbl_100901833902672
  %58 = load i8, ptr %_RV_bc_flag_100901833902672, align 1
  %conv113 = zext i8 %58 to i32
  %cmp114 = icmp eq i32 %conv113, 1
  br i1 %cmp114, label %if.then116, label %if.end117

if.then116:                                       ; preds = %if.end112
  store i8 0, ptr %_RV_bc_flag_100901833902672, align 1
  br label %for.end125

if.end117:                                        ; preds = %if.end112
  %59 = load i8, ptr %_RV_bc_flag_100901833902672, align 1
  %conv118 = zext i8 %59 to i32
  %cmp119 = icmp eq i32 %conv118, 2
  br i1 %cmp119, label %if.then121, label %if.end122

if.then121:                                       ; preds = %if.end117
  store i8 0, ptr %_RV_bc_flag_100901833902672, align 1
  br label %if.end122

if.end122:                                        ; preds = %if.then121, %if.end117
  br label %for.inc123

for.inc123:                                       ; preds = %if.end122
  %60 = load i32, ptr %j, align 4
  %inc124 = add nsw i32 %60, 1
  store i32 %inc124, ptr %j, align 4
  br label %for.cond97, !llvm.loop !55

for.end125:                                       ; preds = %if.then116, %for.cond97
  br label %_RV_lbl_100901833902704

_RV_lbl_100901833902704:                          ; preds = %for.end125, %if.then111
  %61 = load i8, ptr %_RV_ret_flag, align 1
  %tobool126 = icmp ne i8 %61, 0
  br i1 %tobool126, label %if.then127, label %if.end128

if.then127:                                       ; preds = %_RV_lbl_100901833902704
  br label %_RV_lbl_100901833902816

if.end128:                                        ; preds = %_RV_lbl_100901833902704
  %62 = load i8, ptr %_RV_bc_flag_100901833902704, align 1
  %conv129 = zext i8 %62 to i32
  %cmp130 = icmp eq i32 %conv129, 1
  br i1 %cmp130, label %if.then132, label %if.end133

if.then132:                                       ; preds = %if.end128
  store i8 0, ptr %_RV_bc_flag_100901833902704, align 1
  br label %for.end141

if.end133:                                        ; preds = %if.end128
  %63 = load i8, ptr %_RV_bc_flag_100901833902704, align 1
  %conv134 = zext i8 %63 to i32
  %cmp135 = icmp eq i32 %conv134, 2
  br i1 %cmp135, label %if.then137, label %if.end138

if.then137:                                       ; preds = %if.end133
  store i8 0, ptr %_RV_bc_flag_100901833902704, align 1
  br label %if.end138

if.end138:                                        ; preds = %if.then137, %if.end133
  br label %for.inc139

for.inc139:                                       ; preds = %if.end138
  %64 = load i32, ptr %i, align 4
  %inc140 = add nsw i32 %64, 1
  store i32 %inc140, ptr %i, align 4
  br label %for.cond93, !llvm.loop !56

for.end141:                                       ; preds = %if.then132, %for.cond93
  br label %_RV_lbl_100901833902816

_RV_lbl_100901833902816:                          ; preds = %for.end141, %if.then127, %if.then78, %if.then29
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_alpha_100901833888848)
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_beta_100901833888976)
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_C_100901833889424)
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_A_100901833889872)
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_B_100901833890320)
  %65 = load ptr, ptr %__RV_stack_sa, align 8
  %stat = getelementptr inbounds %struct.__RV_stat_node, ptr %65, i32 0, i32 0
  store i32 0, ptr %stat, align 8
  %66 = load ptr, ptr %__RV_stack_sa, align 8
  %call142 = call i32 @__RV_stat_node_dec(ptr noundef %66)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @kernel_gemm(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, double noundef %alpha, double noundef %beta, ptr noundef %C, ptr noundef %A, ptr noundef %B) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %beta.addr = alloca double, align 8
  %C.addr = alloca ptr, align 8
  %A.addr = alloca ptr, align 8
  %B.addr = alloca ptr, align 8
  %__RV_stack_sa = alloca ptr, align 8
  %_RV_ret_flag = alloca i8, align 1
  %_RV_bc_flag_100901833916224 = alloca i8, align 1
  %_RV_bc_flag_100901833916192 = alloca i8, align 1
  %_RV_bc_flag_100901833916088 = alloca i8, align 1
  %_RV_pmd_C_100901833911584 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_A_100901833912032 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_B_100901833912480 = alloca %struct.__RV_pmd, align 8
  %_RV_param_pmds = alloca ptr, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %ni, ptr %ni.addr, align 4
  store i32 %nj, ptr %nj.addr, align 4
  store i32 %nk, ptr %nk.addr, align 4
  store double %alpha, ptr %alpha.addr, align 8
  store double %beta, ptr %beta.addr, align 8
  store ptr %C, ptr %C.addr, align 8
  store ptr %A, ptr %A.addr, align 8
  store ptr %B, ptr %B.addr, align 8
  %0 = load i32, ptr %nj.addr, align 4
  %1 = zext i32 %0 to i64
  %2 = load i32, ptr %nk.addr, align 4
  %3 = zext i32 %2 to i64
  %4 = load i32, ptr %nj.addr, align 4
  %5 = zext i32 %4 to i64
  %call = call ptr @__RV_stat_node_create(i32 noundef 5, i64 noundef 1)
  store ptr %call, ptr %__RV_stack_sa, align 8
  store i8 0, ptr %_RV_ret_flag, align 1
  store i8 0, ptr %_RV_bc_flag_100901833916224, align 1
  store i8 0, ptr %_RV_bc_flag_100901833916192, align 1
  store i8 0, ptr %_RV_bc_flag_100901833916088, align 1
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_C_100901833911584, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_A_100901833912032, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_B_100901833912480, i8 0, i64 32, i1 false)
  %call1 = call ptr @__RV_fmd_tbl_lookup_fpmd(ptr noundef @kernel_gemm, i8 noundef zeroext 0)
  %call2 = call ptr @__RV_pmd_cp_fmd_pmd(ptr noundef %_RV_pmd_C_100901833911584, ptr noundef %call1)
  %call3 = call ptr @__RV_fmd_tbl_lookup_fpmd(ptr noundef @kernel_gemm, i8 noundef zeroext 1)
  %call4 = call ptr @__RV_pmd_cp_fmd_pmd(ptr noundef %_RV_pmd_A_100901833912032, ptr noundef %call3)
  %call5 = call ptr @__RV_fmd_tbl_lookup_fpmd(ptr noundef @kernel_gemm, i8 noundef zeroext 2)
  %call6 = call ptr @__RV_pmd_cp_fmd_pmd(ptr noundef %_RV_pmd_B_100901833912480, ptr noundef %call5)
  store ptr %call6, ptr %_RV_param_pmds, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc67, %entry
  %6 = load i32, ptr %i, align 4
  %7 = load i32, ptr %ni.addr, align 4
  %cmp = icmp slt i32 %6, %7
  br i1 %cmp, label %for.body, label %for.end69

for.body:                                         ; preds = %for.cond
  store i32 0, ptr %j, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc51, %for.body
  %8 = load i32, ptr %j, align 4
  %9 = load i32, ptr %nj.addr, align 4
  %cmp8 = icmp slt i32 %8, %9
  br i1 %cmp8, label %for.body9, label %for.end53

for.body9:                                        ; preds = %for.cond7
  %10 = load double, ptr %beta.addr, align 8
  %11 = load ptr, ptr %C.addr, align 8
  %12 = load i32, ptr %i, align 4
  %idxprom = sext i32 %12 to i64
  %13 = mul nsw i64 %idxprom, %1
  %arrayidx = getelementptr inbounds double, ptr %11, i64 %13
  %14 = load i32, ptr %j, align 4
  %idxprom10 = sext i32 %14 to i64
  %arrayidx11 = getelementptr inbounds double, ptr %arrayidx, i64 %idxprom10
  %15 = load double, ptr %arrayidx11, align 8
  %mul = fmul double %15, %10
  store double %mul, ptr %arrayidx11, align 8
  store i32 0, ptr %k, align 4
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc, %for.body9
  %16 = load i32, ptr %k, align 4
  %17 = load i32, ptr %nk.addr, align 4
  %cmp13 = icmp slt i32 %16, %17
  br i1 %cmp13, label %for.body14, label %for.end

for.body14:                                       ; preds = %for.cond12
  %18 = load double, ptr %alpha.addr, align 8
  %19 = load ptr, ptr %A.addr, align 8
  %20 = load i32, ptr %i, align 4
  %idxprom15 = sext i32 %20 to i64
  %21 = mul nsw i64 %idxprom15, %3
  %arrayidx16 = getelementptr inbounds double, ptr %19, i64 %21
  %22 = load i32, ptr %k, align 4
  %idxprom17 = sext i32 %22 to i64
  %arrayidx18 = getelementptr inbounds double, ptr %arrayidx16, i64 %idxprom17
  %23 = load double, ptr %arrayidx18, align 8
  %mul19 = fmul double %18, %23
  %24 = load ptr, ptr %B.addr, align 8
  %25 = load i32, ptr %k, align 4
  %idxprom20 = sext i32 %25 to i64
  %26 = mul nsw i64 %idxprom20, %5
  %arrayidx21 = getelementptr inbounds double, ptr %24, i64 %26
  %27 = load i32, ptr %j, align 4
  %idxprom22 = sext i32 %27 to i64
  %arrayidx23 = getelementptr inbounds double, ptr %arrayidx21, i64 %idxprom22
  %28 = load double, ptr %arrayidx23, align 8
  %29 = load ptr, ptr %C.addr, align 8
  %30 = load i32, ptr %i, align 4
  %idxprom25 = sext i32 %30 to i64
  %31 = mul nsw i64 %idxprom25, %1
  %arrayidx26 = getelementptr inbounds double, ptr %29, i64 %31
  %32 = load i32, ptr %j, align 4
  %idxprom27 = sext i32 %32 to i64
  %arrayidx28 = getelementptr inbounds double, ptr %arrayidx26, i64 %idxprom27
  %33 = load double, ptr %arrayidx28, align 8
  %34 = call double @llvm.fmuladd.f64(double %mul19, double %28, double %33)
  store double %34, ptr %arrayidx28, align 8
  br label %_RV_lbl_100901833916088

_RV_lbl_100901833916088:                          ; preds = %for.body14
  %35 = load i8, ptr %_RV_ret_flag, align 1
  %tobool = icmp ne i8 %35, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %_RV_lbl_100901833916088
  br label %_RV_lbl_100901833916192

if.end:                                           ; preds = %_RV_lbl_100901833916088
  %36 = load i8, ptr %_RV_bc_flag_100901833916088, align 1
  %conv = zext i8 %36 to i32
  %cmp29 = icmp eq i32 %conv, 1
  br i1 %cmp29, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end
  store i8 0, ptr %_RV_bc_flag_100901833916088, align 1
  br label %for.end

if.end32:                                         ; preds = %if.end
  %37 = load i8, ptr %_RV_bc_flag_100901833916088, align 1
  %conv33 = zext i8 %37 to i32
  %cmp34 = icmp eq i32 %conv33, 2
  br i1 %cmp34, label %if.then36, label %if.end37

if.then36:                                        ; preds = %if.end32
  store i8 0, ptr %_RV_bc_flag_100901833916088, align 1
  br label %if.end37

if.end37:                                         ; preds = %if.then36, %if.end32
  br label %for.inc

for.inc:                                          ; preds = %if.end37
  %38 = load i32, ptr %k, align 4
  %inc = add nsw i32 %38, 1
  store i32 %inc, ptr %k, align 4
  br label %for.cond12, !llvm.loop !57

for.end:                                          ; preds = %if.then31, %for.cond12
  br label %_RV_lbl_100901833916192

_RV_lbl_100901833916192:                          ; preds = %for.end, %if.then
  %39 = load i8, ptr %_RV_ret_flag, align 1
  %tobool38 = icmp ne i8 %39, 0
  br i1 %tobool38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %_RV_lbl_100901833916192
  br label %_RV_lbl_100901833916224

if.end40:                                         ; preds = %_RV_lbl_100901833916192
  %40 = load i8, ptr %_RV_bc_flag_100901833916192, align 1
  %conv41 = zext i8 %40 to i32
  %cmp42 = icmp eq i32 %conv41, 1
  br i1 %cmp42, label %if.then44, label %if.end45

if.then44:                                        ; preds = %if.end40
  store i8 0, ptr %_RV_bc_flag_100901833916192, align 1
  br label %for.end53

if.end45:                                         ; preds = %if.end40
  %41 = load i8, ptr %_RV_bc_flag_100901833916192, align 1
  %conv46 = zext i8 %41 to i32
  %cmp47 = icmp eq i32 %conv46, 2
  br i1 %cmp47, label %if.then49, label %if.end50

if.then49:                                        ; preds = %if.end45
  store i8 0, ptr %_RV_bc_flag_100901833916192, align 1
  br label %if.end50

if.end50:                                         ; preds = %if.then49, %if.end45
  br label %for.inc51

for.inc51:                                        ; preds = %if.end50
  %42 = load i32, ptr %j, align 4
  %inc52 = add nsw i32 %42, 1
  store i32 %inc52, ptr %j, align 4
  br label %for.cond7, !llvm.loop !58

for.end53:                                        ; preds = %if.then44, %for.cond7
  br label %_RV_lbl_100901833916224

_RV_lbl_100901833916224:                          ; preds = %for.end53, %if.then39
  %43 = load i8, ptr %_RV_ret_flag, align 1
  %tobool54 = icmp ne i8 %43, 0
  br i1 %tobool54, label %if.then55, label %if.end56

if.then55:                                        ; preds = %_RV_lbl_100901833916224
  br label %_RV_lbl_100901833916336

if.end56:                                         ; preds = %_RV_lbl_100901833916224
  %44 = load i8, ptr %_RV_bc_flag_100901833916224, align 1
  %conv57 = zext i8 %44 to i32
  %cmp58 = icmp eq i32 %conv57, 1
  br i1 %cmp58, label %if.then60, label %if.end61

if.then60:                                        ; preds = %if.end56
  store i8 0, ptr %_RV_bc_flag_100901833916224, align 1
  br label %for.end69

if.end61:                                         ; preds = %if.end56
  %45 = load i8, ptr %_RV_bc_flag_100901833916224, align 1
  %conv62 = zext i8 %45 to i32
  %cmp63 = icmp eq i32 %conv62, 2
  br i1 %cmp63, label %if.then65, label %if.end66

if.then65:                                        ; preds = %if.end61
  store i8 0, ptr %_RV_bc_flag_100901833916224, align 1
  br label %if.end66

if.end66:                                         ; preds = %if.then65, %if.end61
  br label %for.inc67

for.inc67:                                        ; preds = %if.end66
  %46 = load i32, ptr %i, align 4
  %inc68 = add nsw i32 %46, 1
  store i32 %inc68, ptr %i, align 4
  br label %for.cond, !llvm.loop !59

for.end69:                                        ; preds = %if.then60, %for.cond
  br label %_RV_lbl_100901833916336

_RV_lbl_100901833916336:                          ; preds = %for.end69, %if.then55
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_C_100901833911584)
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_A_100901833912032)
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_B_100901833912480)
  %47 = load ptr, ptr %__RV_stack_sa, align 8
  %stat = getelementptr inbounds %struct.__RV_stat_node, ptr %47, i32 0, i32 0
  store i32 0, ptr %stat, align 8
  %48 = load ptr, ptr %__RV_stack_sa, align 8
  %call70 = call i32 @__RV_stat_node_dec(ptr noundef %48)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #11

; Function Attrs: noinline nounwind optnone uwtable
define internal void @print_array(i32 noundef %ni, i32 noundef %nj, ptr noundef %C) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %C.addr = alloca ptr, align 8
  %__RV_stack_sa = alloca ptr, align 8
  %_RV_ret_flag = alloca i8, align 1
  %_RV_bc_flag_100901833906744 = alloca i8, align 1
  %_RV_bc_flag_100901833906712 = alloca i8, align 1
  %_RV_pmd_C_100901833903472 = alloca %struct.__RV_pmd, align 8
  %_RV_param_pmds = alloca ptr, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, ptr %ni.addr, align 4
  store i32 %nj, ptr %nj.addr, align 4
  store ptr %C, ptr %C.addr, align 8
  %0 = load i32, ptr %nj.addr, align 4
  %1 = zext i32 %0 to i64
  %call = call ptr @__RV_stat_node_create(i32 noundef 5, i64 noundef 1)
  store ptr %call, ptr %__RV_stack_sa, align 8
  store i8 0, ptr %_RV_ret_flag, align 1
  store i8 0, ptr %_RV_bc_flag_100901833906744, align 1
  store i8 0, ptr %_RV_bc_flag_100901833906712, align 1
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_C_100901833903472, i8 0, i64 32, i1 false)
  %call1 = call ptr @__RV_fmd_tbl_lookup_fpmd(ptr noundef @print_array, i8 noundef zeroext 0)
  %call2 = call ptr @__RV_pmd_cp_fmd_pmd(ptr noundef %_RV_pmd_C_100901833903472, ptr noundef %call1)
  store ptr %call2, ptr %_RV_param_pmds, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc46, %entry
  %2 = load i32, ptr %i, align 4
  %3 = load i32, ptr %ni.addr, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end48

for.body:                                         ; preds = %for.cond
  store i32 0, ptr %j, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc, %for.body
  %4 = load i32, ptr %j, align 4
  %5 = load i32, ptr %nj.addr, align 4
  %cmp4 = icmp slt i32 %4, %5
  br i1 %cmp4, label %for.body5, label %for.end

for.body5:                                        ; preds = %for.cond3
  %6 = load ptr, ptr @stderr, align 8
  %7 = load ptr, ptr %C.addr, align 8
  %8 = load i32, ptr %i, align 4
  %idxprom = sext i32 %8 to i64
  %9 = mul nsw i64 %idxprom, %1
  %arrayidx = getelementptr inbounds double, ptr %7, i64 %9
  %10 = load i32, ptr %j, align 4
  %idxprom6 = sext i32 %10 to i64
  %arrayidx7 = getelementptr inbounds double, ptr %arrayidx, i64 %idxprom6
  %11 = load double, ptr %arrayidx7, align 8
  %call8 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %6, ptr noundef @.str.28, double noundef %11)
  %12 = load i32, ptr %i, align 4
  %13 = load i32, ptr %ni.addr, align 4
  %mul = mul nsw i32 %12, %13
  %14 = load i32, ptr %j, align 4
  %add = add nsw i32 %mul, %14
  %rem = srem i32 %add, 20
  %cmp9 = icmp eq i32 %rem, 0
  br i1 %cmp9, label %if.then, label %if.end19

if.then:                                          ; preds = %for.body5
  %15 = load ptr, ptr @stderr, align 8
  %call10 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %15, ptr noundef @.str.29)
  br label %_RV_lbl_100901833906560

_RV_lbl_100901833906560:                          ; preds = %if.then
  %16 = load i8, ptr %_RV_ret_flag, align 1
  %tobool = icmp ne i8 %16, 0
  br i1 %tobool, label %if.then11, label %if.end

if.then11:                                        ; preds = %_RV_lbl_100901833906560
  br label %_RV_lbl_100901833906712

if.end:                                           ; preds = %_RV_lbl_100901833906560
  %17 = load i8, ptr %_RV_bc_flag_100901833906712, align 1
  %conv = zext i8 %17 to i32
  %cmp12 = icmp eq i32 %conv, 1
  br i1 %cmp12, label %if.then17, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %18 = load i8, ptr %_RV_bc_flag_100901833906712, align 1
  %conv14 = zext i8 %18 to i32
  %cmp15 = icmp eq i32 %conv14, 2
  br i1 %cmp15, label %if.then17, label %if.end18

if.then17:                                        ; preds = %lor.lhs.false, %if.end
  br label %_RV_lbl_100901833906712

if.end18:                                         ; preds = %lor.lhs.false
  br label %if.end19

if.end19:                                         ; preds = %if.end18, %for.body5
  br label %_RV_lbl_100901833906712

_RV_lbl_100901833906712:                          ; preds = %if.end19, %if.then17, %if.then11
  %19 = load i8, ptr %_RV_ret_flag, align 1
  %tobool20 = icmp ne i8 %19, 0
  br i1 %tobool20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %_RV_lbl_100901833906712
  br label %_RV_lbl_100901833906744

if.end22:                                         ; preds = %_RV_lbl_100901833906712
  %20 = load i8, ptr %_RV_bc_flag_100901833906712, align 1
  %conv23 = zext i8 %20 to i32
  %cmp24 = icmp eq i32 %conv23, 1
  br i1 %cmp24, label %if.then26, label %if.end27

if.then26:                                        ; preds = %if.end22
  store i8 0, ptr %_RV_bc_flag_100901833906712, align 1
  br label %for.end

if.end27:                                         ; preds = %if.end22
  %21 = load i8, ptr %_RV_bc_flag_100901833906712, align 1
  %conv28 = zext i8 %21 to i32
  %cmp29 = icmp eq i32 %conv28, 2
  br i1 %cmp29, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end27
  store i8 0, ptr %_RV_bc_flag_100901833906712, align 1
  br label %if.end32

if.end32:                                         ; preds = %if.then31, %if.end27
  br label %for.inc

for.inc:                                          ; preds = %if.end32
  %22 = load i32, ptr %j, align 4
  %inc = add nsw i32 %22, 1
  store i32 %inc, ptr %j, align 4
  br label %for.cond3, !llvm.loop !60

for.end:                                          ; preds = %if.then26, %for.cond3
  br label %_RV_lbl_100901833906744

_RV_lbl_100901833906744:                          ; preds = %for.end, %if.then21
  %23 = load i8, ptr %_RV_ret_flag, align 1
  %tobool33 = icmp ne i8 %23, 0
  br i1 %tobool33, label %if.then34, label %if.end35

if.then34:                                        ; preds = %_RV_lbl_100901833906744
  br label %_RV_lbl_100901833907144

if.end35:                                         ; preds = %_RV_lbl_100901833906744
  %24 = load i8, ptr %_RV_bc_flag_100901833906744, align 1
  %conv36 = zext i8 %24 to i32
  %cmp37 = icmp eq i32 %conv36, 1
  br i1 %cmp37, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end35
  store i8 0, ptr %_RV_bc_flag_100901833906744, align 1
  br label %for.end48

if.end40:                                         ; preds = %if.end35
  %25 = load i8, ptr %_RV_bc_flag_100901833906744, align 1
  %conv41 = zext i8 %25 to i32
  %cmp42 = icmp eq i32 %conv41, 2
  br i1 %cmp42, label %if.then44, label %if.end45

if.then44:                                        ; preds = %if.end40
  store i8 0, ptr %_RV_bc_flag_100901833906744, align 1
  br label %if.end45

if.end45:                                         ; preds = %if.then44, %if.end40
  br label %for.inc46

for.inc46:                                        ; preds = %if.end45
  %26 = load i32, ptr %i, align 4
  %inc47 = add nsw i32 %26, 1
  store i32 %inc47, ptr %i, align 4
  br label %for.cond, !llvm.loop !61

for.end48:                                        ; preds = %if.then39, %for.cond
  %27 = load ptr, ptr @stderr, align 8
  %call49 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %27, ptr noundef @.str.29)
  br label %_RV_lbl_100901833907144

_RV_lbl_100901833907144:                          ; preds = %for.end48, %if.then34
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_C_100901833903472)
  %28 = load ptr, ptr %__RV_stack_sa, align 8
  %stat = getelementptr inbounds %struct.__RV_stat_node, ptr %28, i32 0, i32 0
  store i32 0, ptr %stat, align 8
  %29 = load ptr, ptr %__RV_stack_sa, align 8
  %call50 = call i32 @__RV_stat_node_dec(ptr noundef %29)
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind allocsize(1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #9 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #10 = { nocallback nofree nosync nounwind willreturn }
attributes #11 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #12 = { nounwind allocsize(0) }
attributes #13 = { nounwind }
attributes #14 = { noreturn nounwind }
attributes #15 = { nounwind willreturn memory(read) }
attributes #16 = { nounwind allocsize(0,1) }
attributes #17 = { nounwind allocsize(1) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
!19 = distinct !{!19, !7}
!20 = distinct !{!20, !7}
!21 = distinct !{!21, !7}
!22 = distinct !{!22, !7}
!23 = distinct !{!23, !7}
!24 = distinct !{!24, !7}
!25 = distinct !{!25, !7}
!26 = distinct !{!26, !7}
!27 = distinct !{!27, !7}
!28 = distinct !{!28, !7}
!29 = distinct !{!29, !7}
!30 = distinct !{!30, !7}
!31 = distinct !{!31, !7}
!32 = distinct !{!32, !7}
!33 = distinct !{!33, !7}
!34 = distinct !{!34, !7}
!35 = distinct !{!35, !7}
!36 = distinct !{!36, !7}
!37 = distinct !{!37, !7}
!38 = distinct !{!38, !7}
!39 = distinct !{!39, !7}
!40 = distinct !{!40, !7}
!41 = distinct !{!41, !7}
!42 = distinct !{!42, !7}
!43 = distinct !{!43, !7}
!44 = distinct !{!44, !7}
!45 = distinct !{!45, !7}
!46 = distinct !{!46, !7}
!47 = distinct !{!47, !7}
!48 = distinct !{!48, !7}
!49 = distinct !{!49, !7}
!50 = distinct !{!50, !7}
!51 = distinct !{!51, !7}
!52 = distinct !{!52, !7}
!53 = distinct !{!53, !7}
!54 = distinct !{!54, !7}
!55 = distinct !{!55, !7}
!56 = distinct !{!56, !7}
!57 = distinct !{!57, !7}
!58 = distinct !{!58, !7}
!59 = distinct !{!59, !7}
!60 = distinct !{!60, !7}
!61 = distinct !{!61, !7}

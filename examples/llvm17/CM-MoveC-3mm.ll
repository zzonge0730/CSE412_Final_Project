; ModuleID = 'MoveC-3mm.ll'
source_filename = "MoveC-3mm.c"
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
@.str.6 = private unnamed_addr constant [43 x i8] c"error: memory leak of the block [%p, %p).\0A\00", align 1
@.str.7 = private unnamed_addr constant [85 x i8] c"error: memory leak of the block [%p, %p), the last pointer is a function parameter.\0A\00", align 1
@_RV_TRIE_PRIMARY_ENTRIES = dso_local constant i64 8388608, align 8
@_RV_TRIE_SECONDARY_ENTRIES = dso_local constant i64 4194304, align 8
@.str.8 = private unnamed_addr constant [27 x i8] c"trie_primary != (void *)-1\00", align 1
@.str.9 = private unnamed_addr constant [16 x i8] c"./_RV_memsafe.c\00", align 1
@__PRETTY_FUNCTION__.__RV_trie_create = private unnamed_addr constant [34 x i8] c"__RV_pmd **__RV_trie_create(void)\00", align 1
@.str.10 = private unnamed_addr constant [28 x i8] c"trie_secondary != (void*)-1\00", align 1
@__PRETTY_FUNCTION__.__RV_trie_create_secondary = private unnamed_addr constant [43 x i8] c"__RV_pmd *__RV_trie_create_secondary(void)\00", align 1
@__RV_trie_get_trie_ref_pmd.tbl = internal global ptr null, align 8
@__RV_hashtbl_get_hashtbl_ref_fmd.tbl = internal global ptr null, align 8
@.str.11 = private unnamed_addr constant [43 x i8] c"The pmd of %s (addr = %p) does not exist.\0A\00", align 1
@.str.12 = private unnamed_addr constant [49 x i8] c"The pmd of %s (addr = %p) is [%p, %p), status = \00", align 1
@.str.13 = private unnamed_addr constant [43 x i8] c"The fpmd of %s (param %d) does not exist.\0A\00", align 1
@.str.14 = private unnamed_addr constant [49 x i8] c"The fpmd of %s (param %d) is [%p, %p), status = \00", align 1
@.str.15 = private unnamed_addr constant [91 x i8] c"%s: In function '%s':\0A%s:%d:%d: error: dereferenced pointer '%s' is NULL. [spatial error]\0A\00", align 1
@.str.16 = private unnamed_addr constant [150 x i8] c"%s: In function '%s':\0A%s:%d:%d: error: dereferenced pointer '%s' (val = %p, size = %lu) points to an invalid object (uninitialized). [spatial error]\0A\00", align 1
@.str.17 = private unnamed_addr constant [164 x i8] c"%s: In function '%s':\0A%s:%d:%d: error: dereferenced pointer '%s' (val = %p, size = %lu) points to an invalid object (original block is [%p, %p)). [temporal error]\0A\00", align 1
@.str.18 = private unnamed_addr constant [148 x i8] c"%s: In function '%s':\0A%s:%d:%d: error: dereferenced pointer '%s' (val = %p, size = %lu) points to a function %p, not a data block. [segment error]\0A\00", align 1
@.str.19 = private unnamed_addr constant [135 x i8] c"%s: In function '%s':\0A%s:%d:%d: error: dereferenced pointer '%s' (val = %p, size = %lu) is out of the block [%p, %p). [spatial error]\0A\00", align 1
@.str.20 = private unnamed_addr constant [138 x i8] c"%s: In function '%s':\0A%s:%d:%d: error: dereferenced pointer '%s' (val = %p) points to an invalid object (uninitialized). [spatial error]\0A\00", align 1
@.str.21 = private unnamed_addr constant [152 x i8] c"%s: In function '%s':\0A%s:%d:%d: error: dereferenced pointer '%s' (val = %p) points to an invalid object (original block is [%p, %p)). [temporal error]\0A\00", align 1
@.str.22 = private unnamed_addr constant [150 x i8] c"%s: In function '%s':\0A%s:%d:%d: error: dereferenced pointer '%s' (val = %p) does not point to a function, but a data block [%p, %p). [segment error]\0A\00", align 1
@.str.23 = private unnamed_addr constant [132 x i8] c"%s: In function '%s':\0A%s:%d:%d: error: dereferenced pointer '%s' (val = %p) is not the address of the function %p. [spatial error]\0A\00", align 1
@optarg = external global ptr, align 8
@stdin = external global ptr, align 8
@_RV_tmpnam.temp_file = internal global [20 x i8] c"tmp_XXXXXX\00\00\00\00\00\00\00\00\00\00", align 16
@__RV_static_sa = dso_local global ptr null, align 8
@stdout = external global ptr, align 8
@.str.24 = private unnamed_addr constant [23 x i8] c"%s: In function '%s':\0A\00", align 1
@.str.25 = private unnamed_addr constant [109 x i8] c"%s:%d:%d: error: freed pointer '%s' (val = %p) points to an invalid object (uninitialized). [spatial error]\0A\00", align 1
@.str.26 = private unnamed_addr constant [137 x i8] c"%s:%d:%d: error: freed pointer '%s' (val = %p) points to an invalid object (original block is [%p, %p)). [temporal error][illegal free]\0A\00", align 1
@.str.27 = private unnamed_addr constant [140 x i8] c"%s:%d:%d: error: freed pointer '%s' (val = %p) does not point to a heap object (original block is [%p, %p)). [segment error][illegal free]\0A\00", align 1
@.str.28 = private unnamed_addr constant [132 x i8] c"%s:%d:%d: error: freed pointer '%s' (val = %p) is not the base address (original block is [%p, %p)). [spatial error][illegal free]\0A\00", align 1
@__RV_global_sa = dso_local global ptr null, align 8
@__RV_library_sa = dso_local global ptr null, align 8
@_RV_strtok.pmd = internal global %struct.__RV_pmd zeroinitializer, align 8
@environ = external global ptr, align 8
@.str.29 = private unnamed_addr constant [46 x i8] c"error: unhandled call wrapper by pointer %p.\0A\00", align 1
@__RV_function_sa = dso_local global ptr null, align 8
@.str.30 = private unnamed_addr constant [11 x i8] c"3mm-base.c\00", align 1
@.str.31 = private unnamed_addr constant [5 x i8] c"main\00", align 1
@.str.32 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.33 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.34 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.35 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.36 = private unnamed_addr constant [2 x i8] c"E\00", align 1
@.str.37 = private unnamed_addr constant [2 x i8] c"F\00", align 1
@.str.38 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.39 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.40 = private unnamed_addr constant [8 x i8] c"argv[0]\00", align 1
@.str.41 = private unnamed_addr constant [7 x i8] c"strcmp\00", align 1
@.str.42 = private unnamed_addr constant [3 x i8] c"\22\22\00", align 1
@.str.43 = private unnamed_addr constant [5 x i8] c"free\00", align 1
@.str.44 = private unnamed_addr constant [10 x i8] c"(void *)E\00", align 1
@.str.45 = private unnamed_addr constant [10 x i8] c"(void *)A\00", align 1
@.str.46 = private unnamed_addr constant [10 x i8] c"(void *)B\00", align 1
@.str.47 = private unnamed_addr constant [10 x i8] c"(void *)F\00", align 1
@.str.48 = private unnamed_addr constant [10 x i8] c"(void *)C\00", align 1
@.str.49 = private unnamed_addr constant [10 x i8] c"(void *)D\00", align 1
@.str.50 = private unnamed_addr constant [10 x i8] c"(void *)G\00", align 1
@.str.51 = private unnamed_addr constant [11 x i8] c"init_array\00", align 1
@.str.52 = private unnamed_addr constant [5 x i8] c"A[i]\00", align 1
@.str.53 = private unnamed_addr constant [8 x i8] c"A[i][j]\00", align 1
@.str.54 = private unnamed_addr constant [5 x i8] c"B[i]\00", align 1
@.str.55 = private unnamed_addr constant [8 x i8] c"B[i][j]\00", align 1
@.str.56 = private unnamed_addr constant [5 x i8] c"C[i]\00", align 1
@.str.57 = private unnamed_addr constant [8 x i8] c"C[i][j]\00", align 1
@.str.58 = private unnamed_addr constant [5 x i8] c"D[i]\00", align 1
@.str.59 = private unnamed_addr constant [8 x i8] c"D[i][j]\00", align 1
@.str.60 = private unnamed_addr constant [11 x i8] c"kernel_3mm\00", align 1
@.str.61 = private unnamed_addr constant [5 x i8] c"E[i]\00", align 1
@.str.62 = private unnamed_addr constant [8 x i8] c"E[i][j]\00", align 1
@.str.63 = private unnamed_addr constant [8 x i8] c"A[i][k]\00", align 1
@.str.64 = private unnamed_addr constant [5 x i8] c"B[k]\00", align 1
@.str.65 = private unnamed_addr constant [8 x i8] c"B[k][j]\00", align 1
@.str.66 = private unnamed_addr constant [5 x i8] c"F[i]\00", align 1
@.str.67 = private unnamed_addr constant [8 x i8] c"F[i][j]\00", align 1
@.str.68 = private unnamed_addr constant [8 x i8] c"C[i][k]\00", align 1
@.str.69 = private unnamed_addr constant [5 x i8] c"D[k]\00", align 1
@.str.70 = private unnamed_addr constant [8 x i8] c"D[k][j]\00", align 1
@.str.71 = private unnamed_addr constant [5 x i8] c"G[i]\00", align 1
@.str.72 = private unnamed_addr constant [8 x i8] c"G[i][j]\00", align 1
@.str.73 = private unnamed_addr constant [8 x i8] c"E[i][k]\00", align 1
@.str.74 = private unnamed_addr constant [5 x i8] c"F[k]\00", align 1
@.str.75 = private unnamed_addr constant [8 x i8] c"F[k][j]\00", align 1
@.str.76 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.77 = private unnamed_addr constant [12 x i8] c"print_array\00", align 1
@.str.78 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.79 = private unnamed_addr constant [36 x i8] c"3mm-base.c: In function 'fprintf':\0A\00", align 1
@.str.80 = private unnamed_addr constant [137 x i8] c"3mm-base.c:56:19: error: the format string \22%%0.2lf \22 takes %d format specifiers but fprintf has only 1 data arguments. [spatial error]\0A\00", align 1
@.str.81 = private unnamed_addr constant [8 x i8] c"fprintf\00", align 1
@.str.82 = private unnamed_addr constant [7 x i8] c"stderr\00", align 1
@.str.83 = private unnamed_addr constant [10 x i8] c"\22%0.2lf \22\00", align 1
@.str.84 = private unnamed_addr constant [131 x i8] c"3mm-base.c:57:47: error: the format string \22\\n\22 takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\0A\00", align 1
@.str.85 = private unnamed_addr constant [5 x i8] c"\22\\n\22\00", align 1
@.str.86 = private unnamed_addr constant [131 x i8] c"3mm-base.c:59:20: error: the format string \22\\n\22 takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\0A\00", align 1

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

if.end3:                                          ; preds = %if.else, %if.then1, %if.then
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
  br i1 %cmp2, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.end
  %4 = load ptr, ptr @stderr, align 8
  %5 = load ptr, ptr %pmd.addr, align 8
  %base = getelementptr inbounds %struct.__RV_pmd, ptr %5, i32 0, i32 0
  %6 = load ptr, ptr %base, align 8
  %7 = load ptr, ptr %pmd.addr, align 8
  %bound = getelementptr inbounds %struct.__RV_pmd, ptr %7, i32 0, i32 1
  %8 = load ptr, ptr %bound, align 8
  %call5 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %4, ptr noundef @.str.6, ptr noundef %6, ptr noundef %8)
  %9 = load i64, ptr @__RV_error_count, align 8
  %inc = add i64 %9, 1
  store i64 %inc, ptr @__RV_error_count, align 8
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %if.end
  %10 = load ptr, ptr %pmd.addr, align 8
  %snda7 = getelementptr inbounds %struct.__RV_pmd, ptr %10, i32 0, i32 2
  store ptr null, ptr %snda7, align 8
  br label %return

return:                                           ; preds = %if.end6, %if.then
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

if.end4:                                          ; preds = %if.then3, %if.end, %if.then
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

if.end5:                                          ; preds = %if.then3, %if.end, %if.then
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
  br i1 %cmp1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %3 = load ptr, ptr @stderr, align 8
  %4 = load ptr, ptr %fpmd.addr, align 8
  %base = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %4, i32 0, i32 0
  %5 = load ptr, ptr %base, align 8
  %6 = load ptr, ptr %fpmd.addr, align 8
  %bound = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %6, i32 0, i32 1
  %7 = load ptr, ptr %bound, align 8
  %call3 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %3, ptr noundef @.str.7, ptr noundef %5, ptr noundef %7)
  %8 = load i64, ptr @__RV_error_count, align 8
  %inc = add i64 %8, 1
  store i64 %inc, ptr @__RV_error_count, align 8
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.end
  %9 = load ptr, ptr %fpmd.addr, align 8
  %snda5 = getelementptr inbounds %struct.__RV_fmd_pmd, ptr %9, i32 0, i32 2
  store ptr null, ptr %snda5, align 8
  br label %return

return:                                           ; preds = %if.end4, %if.then
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

if.end5:                                          ; preds = %if.else, %if.then2, %if.then
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

for.end:                                          ; preds = %for.cond, %if.then
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

for.end:                                          ; preds = %for.cond, %if.then
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
  call void @__assert_fail(ptr noundef @.str.8, ptr noundef @.str.9, i32 noundef 872, ptr noundef @__PRETTY_FUNCTION__.__RV_trie_create) #14
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
  call void @__assert_fail(ptr noundef @.str.10, ptr noundef @.str.9, i32 noundef 887, ptr noundef @__PRETTY_FUNCTION__.__RV_trie_create_secondary) #14
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

while.body:                                       ; preds = %if.end6, %entry
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
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %2, ptr noundef %3)
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
  %call2 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, ptr noundef %4, ptr noundef %5, ptr noundef %7, ptr noundef %9)
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
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, ptr noundef %3, i32 noundef %conv)
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
  %call3 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, ptr noundef %5, i32 noundef %conv2, ptr noundef %8, ptr noundef %10)
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
  %call1 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %2, ptr noundef @.str.15, ptr noundef %3, ptr noundef %4, ptr noundef %5, i32 noundef %6, i32 noundef %7, ptr noundef %8)
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
  %call6 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %14, ptr noundef @.str.16, ptr noundef %15, ptr noundef %16, ptr noundef %17, i32 noundef %18, i32 noundef %19, ptr noundef %20, ptr noundef %21, i64 noundef %22)
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
  %call12 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %26, ptr noundef @.str.17, ptr noundef %27, ptr noundef %28, ptr noundef %29, i32 noundef %30, i32 noundef %31, ptr noundef %32, ptr noundef %33, i64 noundef %34, ptr noundef %36, ptr noundef %38)
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
  %call19 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %42, ptr noundef @.str.18, ptr noundef %43, ptr noundef %44, ptr noundef %45, i32 noundef %46, i32 noundef %47, ptr noundef %48, ptr noundef %49, i64 noundef %50, ptr noundef %52)
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
  %call36 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %65, ptr noundef @.str.19, ptr noundef %66, ptr noundef %67, ptr noundef %68, i32 noundef %69, i32 noundef %70, ptr noundef %71, ptr noundef %72, i64 noundef %73, ptr noundef %75, ptr noundef %77)
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
  %call1 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %2, ptr noundef @.str.15, ptr noundef %3, ptr noundef %4, ptr noundef %5, i32 noundef %6, i32 noundef %7, ptr noundef %8)
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
  %call6 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %14, ptr noundef @.str.20, ptr noundef %15, ptr noundef %16, ptr noundef %17, i32 noundef %18, i32 noundef %19, ptr noundef %20, ptr noundef %21)
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
  %call12 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %25, ptr noundef @.str.21, ptr noundef %26, ptr noundef %27, ptr noundef %28, i32 noundef %29, i32 noundef %30, ptr noundef %31, ptr noundef %32, ptr noundef %34, ptr noundef %36)
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
  %call22 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %41, ptr noundef @.str.22, ptr noundef %42, ptr noundef %43, ptr noundef %44, i32 noundef %45, i32 noundef %46, ptr noundef %47, ptr noundef %48, ptr noundef %50, ptr noundef %52)
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
  %call30 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %58, ptr noundef @.str.23, ptr noundef %59, ptr noundef %60, ptr noundef %61, i32 noundef %62, i32 noundef %63, ptr noundef %64, ptr noundef %65, ptr noundef %67)
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
  %call = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %1, ptr noundef @.str.15, ptr noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
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
  %call7 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %18, ptr noundef @.str.19, ptr noundef %19, ptr noundef %20, ptr noundef %21, i32 noundef %22, i32 noundef %23, ptr noundef %24, ptr noundef %25, i64 noundef %26, ptr noundef %27, ptr noundef %28)
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
  %call = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %1, ptr noundef @.str.15, ptr noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7)
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
  %call3 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %12, ptr noundef @.str.23, ptr noundef %13, ptr noundef %14, ptr noundef %15, i32 noundef %16, i32 noundef %17, ptr noundef %18, ptr noundef %19, ptr noundef %20)
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
  %call3 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %3, ptr noundef @.str.24, ptr noundef %4, ptr noundef %5)
  %6 = load ptr, ptr @stderr, align 8
  %7 = load ptr, ptr %file_name.addr, align 8
  %8 = load i32, ptr %p_line.addr, align 4
  %9 = load i32, ptr %p_col.addr, align 4
  %10 = load ptr, ptr %p_name.addr, align 8
  %11 = load ptr, ptr %ptr.addr, align 8
  %call4 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %6, ptr noundef @.str.25, ptr noundef %7, i32 noundef %8, i32 noundef %9, ptr noundef %10, ptr noundef %11)
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
  %call8 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %15, ptr noundef @.str.24, ptr noundef %16, ptr noundef %17)
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
  %call10 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %18, ptr noundef @.str.26, ptr noundef %19, i32 noundef %20, i32 noundef %21, ptr noundef %22, ptr noundef %23, ptr noundef %25, ptr noundef %27)
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
  %call19 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %32, ptr noundef @.str.24, ptr noundef %33, ptr noundef %34)
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
  %call22 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %35, ptr noundef @.str.27, ptr noundef %36, i32 noundef %37, i32 noundef %38, ptr noundef %39, ptr noundef %40, ptr noundef %42, ptr noundef %44)
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
  %call30 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %50, ptr noundef @.str.24, ptr noundef %51, ptr noundef %52)
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
  %call33 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %53, ptr noundef @.str.28, ptr noundef %54, i32 noundef %55, i32 noundef %56, ptr noundef %57, ptr noundef %58, ptr noundef %60, ptr noundef %62)
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

if.end47:                                         ; preds = %if.then46, %for.end, %if.then
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
  %call440 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %179, ptr noundef @.str.29, ptr noundef %180)
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
define dso_local i32 @_RV_main(i32 noundef %argc, ptr noundef %argv) #0 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca ptr, align 8
  %__RV_stack_sa = alloca ptr, align 8
  %_RV_ret_flag = alloca i8, align 1
  %_RV_ret_val = alloca i32, align 4
  %_RV_pmd_argv_105309783249632 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_E_105309783251424 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_A_105309783252928 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_B_105309783254320 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_F_105309783255712 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_C_105309783257104 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_D_105309783258496 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_G_105309783259888 = alloca %struct.__RV_pmd, align 8
  %_RV_param_pmds = alloca ptr, align 8
  %ni = alloca i32, align 4
  %nj = alloca i32, align 4
  %nk = alloca i32, align 4
  %nl = alloca i32, align 4
  %nm = alloca i32, align 4
  %E = alloca ptr, align 8
  %A = alloca ptr, align 8
  %B = alloca ptr, align 8
  %F = alloca ptr, align 8
  %C = alloca ptr, align 8
  %D = alloca ptr, align 8
  %G = alloca ptr, align 8
  store i32 %argc, ptr %argc.addr, align 4
  store ptr %argv, ptr %argv.addr, align 8
  %call = call ptr @__RV_stat_node_create(i32 noundef 5, i64 noundef 1)
  store ptr %call, ptr %__RV_stack_sa, align 8
  store i8 0, ptr %_RV_ret_flag, align 1
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_argv_105309783249632, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_E_105309783251424, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_A_105309783252928, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_B_105309783254320, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_F_105309783255712, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_C_105309783257104, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_D_105309783258496, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_G_105309783259888, i8 0, i64 32, i1 false)
  %0 = load i32, ptr %argc.addr, align 4
  %1 = load ptr, ptr %argv.addr, align 8
  %call1 = call ptr @__RV_pmd_var_update_argv(i32 noundef %0, ptr noundef %_RV_pmd_argv_105309783249632, ptr noundef %1)
  store ptr %call1, ptr %_RV_param_pmds, align 8
  store i32 1024, ptr %ni, align 4
  store i32 1024, ptr %nj, align 4
  store i32 1024, ptr %nk, align 4
  store i32 1024, ptr %nl, align 4
  store i32 1024, ptr %nm, align 4
  %call2 = call ptr @_RV_polybench_alloc_data_105309783252224(ptr noundef %_RV_pmd_E_105309783251424, i64 noundef 1048576, i32 noundef 8)
  store ptr %call2, ptr %E, align 8
  %call3 = call ptr @_RV_polybench_alloc_data_105309783253680(ptr noundef %_RV_pmd_A_105309783252928, i64 noundef 1048576, i32 noundef 8)
  store ptr %call3, ptr %A, align 8
  %call4 = call ptr @_RV_polybench_alloc_data_105309783255072(ptr noundef %_RV_pmd_B_105309783254320, i64 noundef 1048576, i32 noundef 8)
  store ptr %call4, ptr %B, align 8
  %call5 = call ptr @_RV_polybench_alloc_data_105309783256464(ptr noundef %_RV_pmd_F_105309783255712, i64 noundef 1048576, i32 noundef 8)
  store ptr %call5, ptr %F, align 8
  %call6 = call ptr @_RV_polybench_alloc_data_105309783257856(ptr noundef %_RV_pmd_C_105309783257104, i64 noundef 1048576, i32 noundef 8)
  store ptr %call6, ptr %C, align 8
  %call7 = call ptr @_RV_polybench_alloc_data_105309783259248(ptr noundef %_RV_pmd_D_105309783258496, i64 noundef 1048576, i32 noundef 8)
  store ptr %call7, ptr %D, align 8
  %call8 = call ptr @_RV_polybench_alloc_data_105309783260640(ptr noundef %_RV_pmd_G_105309783259888, i64 noundef 1048576, i32 noundef 8)
  store ptr %call8, ptr %G, align 8
  %2 = load i32, ptr %ni, align 4
  %3 = load i32, ptr %nj, align 4
  %4 = load i32, ptr %nk, align 4
  %5 = load i32, ptr %nl, align 4
  %6 = load i32, ptr %nm, align 4
  %7 = load ptr, ptr %A, align 8
  %call9 = call ptr @__RV_check_dpv(ptr noundef %_RV_pmd_A_105309783252928, ptr noundef %7, i64 noundef 8388608, ptr noundef @.str.30, ptr noundef @.str.31, i32 noundef 127, i32 noundef 10, ptr noundef @.str.32)
  %arraydecay = getelementptr inbounds [1024 x [1024 x double]], ptr %call9, i64 0, i64 0
  %8 = load ptr, ptr %B, align 8
  %call10 = call ptr @__RV_check_dpv(ptr noundef %_RV_pmd_B_105309783254320, ptr noundef %8, i64 noundef 8388608, ptr noundef @.str.30, ptr noundef @.str.31, i32 noundef 128, i32 noundef 10, ptr noundef @.str.33)
  %arraydecay11 = getelementptr inbounds [1024 x [1024 x double]], ptr %call10, i64 0, i64 0
  %9 = load ptr, ptr %C, align 8
  %call12 = call ptr @__RV_check_dpv(ptr noundef %_RV_pmd_C_105309783257104, ptr noundef %9, i64 noundef 8388608, ptr noundef @.str.30, ptr noundef @.str.31, i32 noundef 129, i32 noundef 10, ptr noundef @.str.34)
  %arraydecay13 = getelementptr inbounds [1024 x [1024 x double]], ptr %call12, i64 0, i64 0
  %10 = load ptr, ptr %D, align 8
  %call14 = call ptr @__RV_check_dpv(ptr noundef %_RV_pmd_D_105309783258496, ptr noundef %10, i64 noundef 8388608, ptr noundef @.str.30, ptr noundef @.str.31, i32 noundef 130, i32 noundef 10, ptr noundef @.str.35)
  %arraydecay15 = getelementptr inbounds [1024 x [1024 x double]], ptr %call14, i64 0, i64 0
  call void @_RV_init_array(ptr noundef %_RV_pmd_A_105309783252928, ptr noundef %_RV_pmd_B_105309783254320, ptr noundef %_RV_pmd_C_105309783257104, ptr noundef %_RV_pmd_D_105309783258496, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %arraydecay, ptr noundef %arraydecay11, ptr noundef %arraydecay13, ptr noundef %arraydecay15)
  %11 = load i32, ptr %ni, align 4
  %12 = load i32, ptr %nj, align 4
  %13 = load i32, ptr %nk, align 4
  %14 = load i32, ptr %nl, align 4
  %15 = load i32, ptr %nm, align 4
  %16 = load ptr, ptr %E, align 8
  %call16 = call ptr @__RV_check_dpv(ptr noundef %_RV_pmd_E_105309783251424, ptr noundef %16, i64 noundef 8388608, ptr noundef @.str.30, ptr noundef @.str.31, i32 noundef 137, i32 noundef 10, ptr noundef @.str.36)
  %arraydecay17 = getelementptr inbounds [1024 x [1024 x double]], ptr %call16, i64 0, i64 0
  %17 = load ptr, ptr %A, align 8
  %call18 = call ptr @__RV_check_dpv(ptr noundef %_RV_pmd_A_105309783252928, ptr noundef %17, i64 noundef 8388608, ptr noundef @.str.30, ptr noundef @.str.31, i32 noundef 138, i32 noundef 10, ptr noundef @.str.32)
  %arraydecay19 = getelementptr inbounds [1024 x [1024 x double]], ptr %call18, i64 0, i64 0
  %18 = load ptr, ptr %B, align 8
  %call20 = call ptr @__RV_check_dpv(ptr noundef %_RV_pmd_B_105309783254320, ptr noundef %18, i64 noundef 8388608, ptr noundef @.str.30, ptr noundef @.str.31, i32 noundef 139, i32 noundef 10, ptr noundef @.str.33)
  %arraydecay21 = getelementptr inbounds [1024 x [1024 x double]], ptr %call20, i64 0, i64 0
  %19 = load ptr, ptr %F, align 8
  %call22 = call ptr @__RV_check_dpv(ptr noundef %_RV_pmd_F_105309783255712, ptr noundef %19, i64 noundef 8388608, ptr noundef @.str.30, ptr noundef @.str.31, i32 noundef 140, i32 noundef 10, ptr noundef @.str.37)
  %arraydecay23 = getelementptr inbounds [1024 x [1024 x double]], ptr %call22, i64 0, i64 0
  %20 = load ptr, ptr %C, align 8
  %call24 = call ptr @__RV_check_dpv(ptr noundef %_RV_pmd_C_105309783257104, ptr noundef %20, i64 noundef 8388608, ptr noundef @.str.30, ptr noundef @.str.31, i32 noundef 141, i32 noundef 10, ptr noundef @.str.34)
  %arraydecay25 = getelementptr inbounds [1024 x [1024 x double]], ptr %call24, i64 0, i64 0
  %21 = load ptr, ptr %D, align 8
  %call26 = call ptr @__RV_check_dpv(ptr noundef %_RV_pmd_D_105309783258496, ptr noundef %21, i64 noundef 8388608, ptr noundef @.str.30, ptr noundef @.str.31, i32 noundef 142, i32 noundef 10, ptr noundef @.str.35)
  %arraydecay27 = getelementptr inbounds [1024 x [1024 x double]], ptr %call26, i64 0, i64 0
  %22 = load ptr, ptr %G, align 8
  %call28 = call ptr @__RV_check_dpv(ptr noundef %_RV_pmd_G_105309783259888, ptr noundef %22, i64 noundef 8388608, ptr noundef @.str.30, ptr noundef @.str.31, i32 noundef 143, i32 noundef 10, ptr noundef @.str.38)
  %arraydecay29 = getelementptr inbounds [1024 x [1024 x double]], ptr %call28, i64 0, i64 0
  call void @_RV_kernel_3mm(ptr noundef %_RV_pmd_E_105309783251424, ptr noundef %_RV_pmd_A_105309783252928, ptr noundef %_RV_pmd_B_105309783254320, ptr noundef %_RV_pmd_F_105309783255712, ptr noundef %_RV_pmd_C_105309783257104, ptr noundef %_RV_pmd_D_105309783258496, ptr noundef %_RV_pmd_G_105309783259888, i32 noundef %11, i32 noundef %12, i32 noundef %13, i32 noundef %14, i32 noundef %15, ptr noundef %arraydecay17, ptr noundef %arraydecay19, ptr noundef %arraydecay21, ptr noundef %arraydecay23, ptr noundef %arraydecay25, ptr noundef %arraydecay27, ptr noundef %arraydecay29)
  %23 = load i32, ptr %argc.addr, align 4
  %cmp = icmp sgt i32 %23, 42
  br i1 %cmp, label %land.lhs.true, label %if.end39

land.lhs.true:                                    ; preds = %entry
  %24 = load ptr, ptr %argv.addr, align 8
  %arrayidx = getelementptr inbounds ptr, ptr %24, i64 0
  %call30 = call ptr @__RV_pmd_tbl_lookup(ptr noundef %arrayidx)
  %25 = load ptr, ptr @__RV_global_sa, align 8
  %call31 = call ptr @__RV_pmd_create(ptr noundef null, ptr noundef %25, i32 noundef 2, ptr noundef @.str.39, ptr noundef getelementptr inbounds (i8, ptr @.str.39, i64 1))
  %26 = load ptr, ptr %argv.addr, align 8
  %27 = load ptr, ptr %argv.addr, align 8
  %call32 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_argv_105309783249632, ptr noundef %27, i64 noundef 0, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.31, i32 noundef 151, i32 noundef 39, ptr noundef @.str.40)
  %arrayidx33 = getelementptr inbounds ptr, ptr %26, i64 %call32
  %28 = load ptr, ptr %arrayidx33, align 8
  %call34 = call i32 @_RV_strcmp(ptr noundef %call30, ptr noundef %call31, ptr noundef %28, ptr noundef @.str.39, ptr noundef @.str.30, ptr noundef @.str.41, i32 noundef 151, i32 noundef 32, ptr noundef @.str.40, i32 noundef 151, i32 noundef 45, ptr noundef @.str.42)
  %tobool = icmp ne i32 %call34, 0
  br i1 %tobool, label %if.end39, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %29 = load i32, ptr %ni, align 4
  %30 = load i32, ptr %nl, align 4
  %31 = load ptr, ptr %G, align 8
  %call35 = call ptr @__RV_check_dpv(ptr noundef %_RV_pmd_G_105309783259888, ptr noundef %31, i64 noundef 8388608, ptr noundef @.str.30, ptr noundef @.str.31, i32 noundef 151, i32 noundef 78, ptr noundef @.str.38)
  %arraydecay36 = getelementptr inbounds [1024 x [1024 x double]], ptr %call35, i64 0, i64 0
  call void @_RV_print_array(ptr noundef %_RV_pmd_G_105309783259888, i32 noundef %29, i32 noundef %30, ptr noundef %arraydecay36)
  br label %_RV_lbl_105309783266720

_RV_lbl_105309783266720:                          ; preds = %if.then
  %32 = load i8, ptr %_RV_ret_flag, align 1
  %tobool37 = icmp ne i8 %32, 0
  br i1 %tobool37, label %if.then38, label %if.end

if.then38:                                        ; preds = %_RV_lbl_105309783266720
  br label %_RV_lbl_105309783268544

if.end:                                           ; preds = %_RV_lbl_105309783266720
  br label %if.end39

if.end39:                                         ; preds = %if.end, %land.lhs.true, %entry
  %33 = load ptr, ptr %E, align 8
  call void @_RV_free(ptr noundef %_RV_pmd_E_105309783251424, ptr noundef %33, ptr noundef @.str.30, ptr noundef @.str.43, i32 noundef 154, i32 noundef 10, ptr noundef @.str.44)
  %34 = load ptr, ptr %A, align 8
  call void @_RV_free(ptr noundef %_RV_pmd_A_105309783252928, ptr noundef %34, ptr noundef @.str.30, ptr noundef @.str.43, i32 noundef 155, i32 noundef 10, ptr noundef @.str.45)
  %35 = load ptr, ptr %B, align 8
  call void @_RV_free(ptr noundef %_RV_pmd_B_105309783254320, ptr noundef %35, ptr noundef @.str.30, ptr noundef @.str.43, i32 noundef 156, i32 noundef 10, ptr noundef @.str.46)
  %36 = load ptr, ptr %F, align 8
  call void @_RV_free(ptr noundef %_RV_pmd_F_105309783255712, ptr noundef %36, ptr noundef @.str.30, ptr noundef @.str.43, i32 noundef 157, i32 noundef 10, ptr noundef @.str.47)
  %37 = load ptr, ptr %C, align 8
  call void @_RV_free(ptr noundef %_RV_pmd_C_105309783257104, ptr noundef %37, ptr noundef @.str.30, ptr noundef @.str.43, i32 noundef 158, i32 noundef 10, ptr noundef @.str.48)
  %38 = load ptr, ptr %D, align 8
  call void @_RV_free(ptr noundef %_RV_pmd_D_105309783258496, ptr noundef %38, ptr noundef @.str.30, ptr noundef @.str.43, i32 noundef 159, i32 noundef 10, ptr noundef @.str.49)
  %39 = load ptr, ptr %G, align 8
  call void @_RV_free(ptr noundef %_RV_pmd_G_105309783259888, ptr noundef %39, ptr noundef @.str.30, ptr noundef @.str.43, i32 noundef 160, i32 noundef 10, ptr noundef @.str.50)
  store i32 0, ptr %_RV_ret_val, align 4
  store i8 1, ptr %_RV_ret_flag, align 1
  br label %_RV_lbl_105309783268544

_RV_lbl_105309783268544:                          ; preds = %if.end39, %if.then38
  %40 = load i32, ptr %argc.addr, align 4
  %41 = load ptr, ptr %argv.addr, align 8
  call void @__RV_pmd_var_remove_argv(i32 noundef %40, ptr noundef %_RV_pmd_argv_105309783249632, ptr noundef %41)
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_E_105309783251424)
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_A_105309783252928)
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_B_105309783254320)
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_F_105309783255712)
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_C_105309783257104)
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_D_105309783258496)
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_G_105309783259888)
  %42 = load ptr, ptr %__RV_stack_sa, align 8
  %stat = getelementptr inbounds %struct.__RV_stat_node, ptr %42, i32 0, i32 0
  store i32 0, ptr %stat, align 8
  %43 = load ptr, ptr %__RV_stack_sa, align 8
  %call40 = call i32 @__RV_stat_node_dec(ptr noundef %43)
  %44 = load i32, ptr %_RV_ret_val, align 4
  ret i32 %44
}

; Function Attrs: noinline nounwind optnone uwtable
define internal ptr @_RV_polybench_alloc_data_105309783252224(ptr noundef %ret_pmd, i64 noundef %p1, i32 noundef %p2) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %p1.addr = alloca i64, align 8
  %p2.addr = alloca i32, align 4
  %ret_val = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store i64 %p1, ptr %p1.addr, align 8
  store i32 %p2, ptr %p2.addr, align 4
  %0 = load i64, ptr %p1.addr, align 8
  %1 = load i32, ptr %p2.addr, align 4
  %call = call ptr @polybench_alloc_data(i64 noundef %0, i32 noundef %1)
  store ptr %call, ptr %ret_val, align 8
  %2 = load ptr, ptr %ret_pmd.addr, align 8
  %3 = load ptr, ptr @__RV_library_sa, align 8
  %call1 = call ptr @__RV_pmd_set(ptr noundef %2, ptr noundef %3, i32 noundef 0, ptr noundef inttoptr (i64 1 to ptr), ptr noundef inttoptr (i64 -1 to ptr))
  %4 = load ptr, ptr %ret_val, align 8
  ret ptr %4
}

; Function Attrs: noinline nounwind optnone uwtable
define internal ptr @_RV_polybench_alloc_data_105309783253680(ptr noundef %ret_pmd, i64 noundef %p1, i32 noundef %p2) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %p1.addr = alloca i64, align 8
  %p2.addr = alloca i32, align 4
  %ret_val = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store i64 %p1, ptr %p1.addr, align 8
  store i32 %p2, ptr %p2.addr, align 4
  %0 = load i64, ptr %p1.addr, align 8
  %1 = load i32, ptr %p2.addr, align 4
  %call = call ptr @polybench_alloc_data(i64 noundef %0, i32 noundef %1)
  store ptr %call, ptr %ret_val, align 8
  %2 = load ptr, ptr %ret_pmd.addr, align 8
  %3 = load ptr, ptr @__RV_library_sa, align 8
  %call1 = call ptr @__RV_pmd_set(ptr noundef %2, ptr noundef %3, i32 noundef 0, ptr noundef inttoptr (i64 1 to ptr), ptr noundef inttoptr (i64 -1 to ptr))
  %4 = load ptr, ptr %ret_val, align 8
  ret ptr %4
}

; Function Attrs: noinline nounwind optnone uwtable
define internal ptr @_RV_polybench_alloc_data_105309783255072(ptr noundef %ret_pmd, i64 noundef %p1, i32 noundef %p2) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %p1.addr = alloca i64, align 8
  %p2.addr = alloca i32, align 4
  %ret_val = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store i64 %p1, ptr %p1.addr, align 8
  store i32 %p2, ptr %p2.addr, align 4
  %0 = load i64, ptr %p1.addr, align 8
  %1 = load i32, ptr %p2.addr, align 4
  %call = call ptr @polybench_alloc_data(i64 noundef %0, i32 noundef %1)
  store ptr %call, ptr %ret_val, align 8
  %2 = load ptr, ptr %ret_pmd.addr, align 8
  %3 = load ptr, ptr @__RV_library_sa, align 8
  %call1 = call ptr @__RV_pmd_set(ptr noundef %2, ptr noundef %3, i32 noundef 0, ptr noundef inttoptr (i64 1 to ptr), ptr noundef inttoptr (i64 -1 to ptr))
  %4 = load ptr, ptr %ret_val, align 8
  ret ptr %4
}

; Function Attrs: noinline nounwind optnone uwtable
define internal ptr @_RV_polybench_alloc_data_105309783256464(ptr noundef %ret_pmd, i64 noundef %p1, i32 noundef %p2) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %p1.addr = alloca i64, align 8
  %p2.addr = alloca i32, align 4
  %ret_val = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store i64 %p1, ptr %p1.addr, align 8
  store i32 %p2, ptr %p2.addr, align 4
  %0 = load i64, ptr %p1.addr, align 8
  %1 = load i32, ptr %p2.addr, align 4
  %call = call ptr @polybench_alloc_data(i64 noundef %0, i32 noundef %1)
  store ptr %call, ptr %ret_val, align 8
  %2 = load ptr, ptr %ret_pmd.addr, align 8
  %3 = load ptr, ptr @__RV_library_sa, align 8
  %call1 = call ptr @__RV_pmd_set(ptr noundef %2, ptr noundef %3, i32 noundef 0, ptr noundef inttoptr (i64 1 to ptr), ptr noundef inttoptr (i64 -1 to ptr))
  %4 = load ptr, ptr %ret_val, align 8
  ret ptr %4
}

; Function Attrs: noinline nounwind optnone uwtable
define internal ptr @_RV_polybench_alloc_data_105309783257856(ptr noundef %ret_pmd, i64 noundef %p1, i32 noundef %p2) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %p1.addr = alloca i64, align 8
  %p2.addr = alloca i32, align 4
  %ret_val = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store i64 %p1, ptr %p1.addr, align 8
  store i32 %p2, ptr %p2.addr, align 4
  %0 = load i64, ptr %p1.addr, align 8
  %1 = load i32, ptr %p2.addr, align 4
  %call = call ptr @polybench_alloc_data(i64 noundef %0, i32 noundef %1)
  store ptr %call, ptr %ret_val, align 8
  %2 = load ptr, ptr %ret_pmd.addr, align 8
  %3 = load ptr, ptr @__RV_library_sa, align 8
  %call1 = call ptr @__RV_pmd_set(ptr noundef %2, ptr noundef %3, i32 noundef 0, ptr noundef inttoptr (i64 1 to ptr), ptr noundef inttoptr (i64 -1 to ptr))
  %4 = load ptr, ptr %ret_val, align 8
  ret ptr %4
}

; Function Attrs: noinline nounwind optnone uwtable
define internal ptr @_RV_polybench_alloc_data_105309783259248(ptr noundef %ret_pmd, i64 noundef %p1, i32 noundef %p2) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %p1.addr = alloca i64, align 8
  %p2.addr = alloca i32, align 4
  %ret_val = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store i64 %p1, ptr %p1.addr, align 8
  store i32 %p2, ptr %p2.addr, align 4
  %0 = load i64, ptr %p1.addr, align 8
  %1 = load i32, ptr %p2.addr, align 4
  %call = call ptr @polybench_alloc_data(i64 noundef %0, i32 noundef %1)
  store ptr %call, ptr %ret_val, align 8
  %2 = load ptr, ptr %ret_pmd.addr, align 8
  %3 = load ptr, ptr @__RV_library_sa, align 8
  %call1 = call ptr @__RV_pmd_set(ptr noundef %2, ptr noundef %3, i32 noundef 0, ptr noundef inttoptr (i64 1 to ptr), ptr noundef inttoptr (i64 -1 to ptr))
  %4 = load ptr, ptr %ret_val, align 8
  ret ptr %4
}

; Function Attrs: noinline nounwind optnone uwtable
define internal ptr @_RV_polybench_alloc_data_105309783260640(ptr noundef %ret_pmd, i64 noundef %p1, i32 noundef %p2) #0 {
entry:
  %ret_pmd.addr = alloca ptr, align 8
  %p1.addr = alloca i64, align 8
  %p2.addr = alloca i32, align 4
  %ret_val = alloca ptr, align 8
  store ptr %ret_pmd, ptr %ret_pmd.addr, align 8
  store i64 %p1, ptr %p1.addr, align 8
  store i32 %p2, ptr %p2.addr, align 4
  %0 = load i64, ptr %p1.addr, align 8
  %1 = load i32, ptr %p2.addr, align 4
  %call = call ptr @polybench_alloc_data(i64 noundef %0, i32 noundef %1)
  store ptr %call, ptr %ret_val, align 8
  %2 = load ptr, ptr %ret_pmd.addr, align 8
  %3 = load ptr, ptr @__RV_library_sa, align 8
  %call1 = call ptr @__RV_pmd_set(ptr noundef %2, ptr noundef %3, i32 noundef 0, ptr noundef inttoptr (i64 1 to ptr), ptr noundef inttoptr (i64 -1 to ptr))
  %4 = load ptr, ptr %ret_val, align 8
  ret ptr %4
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @_RV_init_array(ptr noundef %p6_pmd, ptr noundef %p7_pmd, ptr noundef %p8_pmd, ptr noundef %p9_pmd, i32 noundef %p1, i32 noundef %p2, i32 noundef %p3, i32 noundef %p4, i32 noundef %p5, ptr noundef %p6, ptr noundef %p7, ptr noundef %p8, ptr noundef %p9) #0 {
entry:
  %p6_pmd.addr = alloca ptr, align 8
  %p7_pmd.addr = alloca ptr, align 8
  %p8_pmd.addr = alloca ptr, align 8
  %p9_pmd.addr = alloca ptr, align 8
  %p1.addr = alloca i32, align 4
  %p2.addr = alloca i32, align 4
  %p3.addr = alloca i32, align 4
  %p4.addr = alloca i32, align 4
  %p5.addr = alloca i32, align 4
  %p6.addr = alloca ptr, align 8
  %p7.addr = alloca ptr, align 8
  %p8.addr = alloca ptr, align 8
  %p9.addr = alloca ptr, align 8
  store ptr %p6_pmd, ptr %p6_pmd.addr, align 8
  store ptr %p7_pmd, ptr %p7_pmd.addr, align 8
  store ptr %p8_pmd, ptr %p8_pmd.addr, align 8
  store ptr %p9_pmd, ptr %p9_pmd.addr, align 8
  store i32 %p1, ptr %p1.addr, align 4
  store i32 %p2, ptr %p2.addr, align 4
  store i32 %p3, ptr %p3.addr, align 4
  store i32 %p4, ptr %p4.addr, align 4
  store i32 %p5, ptr %p5.addr, align 4
  store ptr %p6, ptr %p6.addr, align 8
  store ptr %p7, ptr %p7.addr, align 8
  store ptr %p8, ptr %p8.addr, align 8
  store ptr %p9, ptr %p9.addr, align 8
  %call = call ptr @__RV_fmd_tbl_create(ptr noundef @init_array, i8 noundef zeroext 4)
  %0 = load ptr, ptr %p6_pmd.addr, align 8
  %call1 = call ptr @__RV_fmd_tbl_update_pmd(ptr noundef @init_array, i8 noundef zeroext 0, ptr noundef %0)
  %1 = load ptr, ptr %p7_pmd.addr, align 8
  %call2 = call ptr @__RV_fmd_tbl_update_pmd(ptr noundef @init_array, i8 noundef zeroext 1, ptr noundef %1)
  %2 = load ptr, ptr %p8_pmd.addr, align 8
  %call3 = call ptr @__RV_fmd_tbl_update_pmd(ptr noundef @init_array, i8 noundef zeroext 2, ptr noundef %2)
  %3 = load ptr, ptr %p9_pmd.addr, align 8
  %call4 = call ptr @__RV_fmd_tbl_update_pmd(ptr noundef @init_array, i8 noundef zeroext 3, ptr noundef %3)
  %4 = load i32, ptr %p1.addr, align 4
  %5 = load i32, ptr %p2.addr, align 4
  %6 = load i32, ptr %p3.addr, align 4
  %7 = load i32, ptr %p4.addr, align 4
  %8 = load i32, ptr %p5.addr, align 4
  %9 = load ptr, ptr %p6.addr, align 8
  %10 = load ptr, ptr %p7.addr, align 8
  %11 = load ptr, ptr %p8.addr, align 8
  %12 = load ptr, ptr %p9.addr, align 8
  call void @init_array(i32 noundef %4, i32 noundef %5, i32 noundef %6, i32 noundef %7, i32 noundef %8, ptr noundef %9, ptr noundef %10, ptr noundef %11, ptr noundef %12)
  call void @__RV_fmd_tbl_remove(ptr noundef @init_array)
  %13 = load ptr, ptr %p6_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %13)
  %14 = load ptr, ptr %p7_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %14)
  %15 = load ptr, ptr %p8_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %15)
  %16 = load ptr, ptr %p9_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %16)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @_RV_kernel_3mm(ptr noundef %p6_pmd, ptr noundef %p7_pmd, ptr noundef %p8_pmd, ptr noundef %p9_pmd, ptr noundef %p10_pmd, ptr noundef %p11_pmd, ptr noundef %p12_pmd, i32 noundef %p1, i32 noundef %p2, i32 noundef %p3, i32 noundef %p4, i32 noundef %p5, ptr noundef %p6, ptr noundef %p7, ptr noundef %p8, ptr noundef %p9, ptr noundef %p10, ptr noundef %p11, ptr noundef %p12) #0 {
entry:
  %p6_pmd.addr = alloca ptr, align 8
  %p7_pmd.addr = alloca ptr, align 8
  %p8_pmd.addr = alloca ptr, align 8
  %p9_pmd.addr = alloca ptr, align 8
  %p10_pmd.addr = alloca ptr, align 8
  %p11_pmd.addr = alloca ptr, align 8
  %p12_pmd.addr = alloca ptr, align 8
  %p1.addr = alloca i32, align 4
  %p2.addr = alloca i32, align 4
  %p3.addr = alloca i32, align 4
  %p4.addr = alloca i32, align 4
  %p5.addr = alloca i32, align 4
  %p6.addr = alloca ptr, align 8
  %p7.addr = alloca ptr, align 8
  %p8.addr = alloca ptr, align 8
  %p9.addr = alloca ptr, align 8
  %p10.addr = alloca ptr, align 8
  %p11.addr = alloca ptr, align 8
  %p12.addr = alloca ptr, align 8
  store ptr %p6_pmd, ptr %p6_pmd.addr, align 8
  store ptr %p7_pmd, ptr %p7_pmd.addr, align 8
  store ptr %p8_pmd, ptr %p8_pmd.addr, align 8
  store ptr %p9_pmd, ptr %p9_pmd.addr, align 8
  store ptr %p10_pmd, ptr %p10_pmd.addr, align 8
  store ptr %p11_pmd, ptr %p11_pmd.addr, align 8
  store ptr %p12_pmd, ptr %p12_pmd.addr, align 8
  store i32 %p1, ptr %p1.addr, align 4
  store i32 %p2, ptr %p2.addr, align 4
  store i32 %p3, ptr %p3.addr, align 4
  store i32 %p4, ptr %p4.addr, align 4
  store i32 %p5, ptr %p5.addr, align 4
  store ptr %p6, ptr %p6.addr, align 8
  store ptr %p7, ptr %p7.addr, align 8
  store ptr %p8, ptr %p8.addr, align 8
  store ptr %p9, ptr %p9.addr, align 8
  store ptr %p10, ptr %p10.addr, align 8
  store ptr %p11, ptr %p11.addr, align 8
  store ptr %p12, ptr %p12.addr, align 8
  %call = call ptr @__RV_fmd_tbl_create(ptr noundef @kernel_3mm, i8 noundef zeroext 7)
  %0 = load ptr, ptr %p6_pmd.addr, align 8
  %call1 = call ptr @__RV_fmd_tbl_update_pmd(ptr noundef @kernel_3mm, i8 noundef zeroext 0, ptr noundef %0)
  %1 = load ptr, ptr %p7_pmd.addr, align 8
  %call2 = call ptr @__RV_fmd_tbl_update_pmd(ptr noundef @kernel_3mm, i8 noundef zeroext 1, ptr noundef %1)
  %2 = load ptr, ptr %p8_pmd.addr, align 8
  %call3 = call ptr @__RV_fmd_tbl_update_pmd(ptr noundef @kernel_3mm, i8 noundef zeroext 2, ptr noundef %2)
  %3 = load ptr, ptr %p9_pmd.addr, align 8
  %call4 = call ptr @__RV_fmd_tbl_update_pmd(ptr noundef @kernel_3mm, i8 noundef zeroext 3, ptr noundef %3)
  %4 = load ptr, ptr %p10_pmd.addr, align 8
  %call5 = call ptr @__RV_fmd_tbl_update_pmd(ptr noundef @kernel_3mm, i8 noundef zeroext 4, ptr noundef %4)
  %5 = load ptr, ptr %p11_pmd.addr, align 8
  %call6 = call ptr @__RV_fmd_tbl_update_pmd(ptr noundef @kernel_3mm, i8 noundef zeroext 5, ptr noundef %5)
  %6 = load ptr, ptr %p12_pmd.addr, align 8
  %call7 = call ptr @__RV_fmd_tbl_update_pmd(ptr noundef @kernel_3mm, i8 noundef zeroext 6, ptr noundef %6)
  %7 = load i32, ptr %p1.addr, align 4
  %8 = load i32, ptr %p2.addr, align 4
  %9 = load i32, ptr %p3.addr, align 4
  %10 = load i32, ptr %p4.addr, align 4
  %11 = load i32, ptr %p5.addr, align 4
  %12 = load ptr, ptr %p6.addr, align 8
  %13 = load ptr, ptr %p7.addr, align 8
  %14 = load ptr, ptr %p8.addr, align 8
  %15 = load ptr, ptr %p9.addr, align 8
  %16 = load ptr, ptr %p10.addr, align 8
  %17 = load ptr, ptr %p11.addr, align 8
  %18 = load ptr, ptr %p12.addr, align 8
  call void @kernel_3mm(i32 noundef %7, i32 noundef %8, i32 noundef %9, i32 noundef %10, i32 noundef %11, ptr noundef %12, ptr noundef %13, ptr noundef %14, ptr noundef %15, ptr noundef %16, ptr noundef %17, ptr noundef %18)
  call void @__RV_fmd_tbl_remove(ptr noundef @kernel_3mm)
  %19 = load ptr, ptr %p6_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %19)
  %20 = load ptr, ptr %p7_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %20)
  %21 = load ptr, ptr %p8_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %21)
  %22 = load ptr, ptr %p9_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %22)
  %23 = load ptr, ptr %p10_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %23)
  %24 = load ptr, ptr %p11_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %24)
  %25 = load ptr, ptr %p12_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %25)
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
  %call = call ptr @__RV_fmd_tbl_create(ptr noundef @print_array, i8 noundef zeroext 1)
  %0 = load ptr, ptr %p3_pmd.addr, align 8
  %call1 = call ptr @__RV_fmd_tbl_update_pmd(ptr noundef @print_array, i8 noundef zeroext 0, ptr noundef %0)
  %1 = load i32, ptr %p1.addr, align 4
  %2 = load i32, ptr %p2.addr, align 4
  %3 = load ptr, ptr %p3.addr, align 8
  call void @print_array(i32 noundef %1, i32 noundef %2, ptr noundef %3)
  call void @__RV_fmd_tbl_remove(ptr noundef @print_array)
  %4 = load ptr, ptr %p3_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %4)
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

declare ptr @polybench_alloc_data(i64 noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @init_array(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, i32 noundef %nl, i32 noundef %nm, ptr noundef %A, ptr noundef %B, ptr noundef %C, ptr noundef %D) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %nm.addr = alloca i32, align 4
  %A.addr = alloca ptr, align 8
  %B.addr = alloca ptr, align 8
  %C.addr = alloca ptr, align 8
  %D.addr = alloca ptr, align 8
  %__RV_stack_sa = alloca ptr, align 8
  %_RV_ret_flag = alloca i8, align 1
  %_RV_bc_flag_105309783223928 = alloca i8, align 1
  %_RV_bc_flag_105309783223896 = alloca i8, align 1
  %_RV_bc_flag_105309783225392 = alloca i8, align 1
  %_RV_bc_flag_105309783225360 = alloca i8, align 1
  %_RV_bc_flag_105309783226856 = alloca i8, align 1
  %_RV_bc_flag_105309783226824 = alloca i8, align 1
  %_RV_bc_flag_105309783228320 = alloca i8, align 1
  %_RV_bc_flag_105309783228288 = alloca i8, align 1
  %_RV_pmd_A_105309783176048 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_B_105309783176464 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_C_105309783176880 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_D_105309783177296 = alloca %struct.__RV_pmd, align 8
  %_RV_param_pmds = alloca ptr, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, ptr %ni.addr, align 4
  store i32 %nj, ptr %nj.addr, align 4
  store i32 %nk, ptr %nk.addr, align 4
  store i32 %nl, ptr %nl.addr, align 4
  store i32 %nm, ptr %nm.addr, align 4
  store ptr %A, ptr %A.addr, align 8
  store ptr %B, ptr %B.addr, align 8
  store ptr %C, ptr %C.addr, align 8
  store ptr %D, ptr %D.addr, align 8
  %call = call ptr @__RV_stat_node_create(i32 noundef 5, i64 noundef 1)
  store ptr %call, ptr %__RV_stack_sa, align 8
  store i8 0, ptr %_RV_ret_flag, align 1
  store i8 0, ptr %_RV_bc_flag_105309783223928, align 1
  store i8 0, ptr %_RV_bc_flag_105309783223896, align 1
  store i8 0, ptr %_RV_bc_flag_105309783225392, align 1
  store i8 0, ptr %_RV_bc_flag_105309783225360, align 1
  store i8 0, ptr %_RV_bc_flag_105309783226856, align 1
  store i8 0, ptr %_RV_bc_flag_105309783226824, align 1
  store i8 0, ptr %_RV_bc_flag_105309783228320, align 1
  store i8 0, ptr %_RV_bc_flag_105309783228288, align 1
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_A_105309783176048, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_B_105309783176464, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_C_105309783176880, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_D_105309783177296, i8 0, i64 32, i1 false)
  %call1 = call ptr @__RV_fmd_tbl_lookup_fpmd(ptr noundef @init_array, i8 noundef zeroext 0)
  %call2 = call ptr @__RV_pmd_cp_fmd_pmd(ptr noundef %_RV_pmd_A_105309783176048, ptr noundef %call1)
  %call3 = call ptr @__RV_fmd_tbl_lookup_fpmd(ptr noundef @init_array, i8 noundef zeroext 1)
  %call4 = call ptr @__RV_pmd_cp_fmd_pmd(ptr noundef %_RV_pmd_B_105309783176464, ptr noundef %call3)
  %call5 = call ptr @__RV_fmd_tbl_lookup_fpmd(ptr noundef @init_array, i8 noundef zeroext 2)
  %call6 = call ptr @__RV_pmd_cp_fmd_pmd(ptr noundef %_RV_pmd_C_105309783176880, ptr noundef %call5)
  %call7 = call ptr @__RV_fmd_tbl_lookup_fpmd(ptr noundef @init_array, i8 noundef zeroext 3)
  %call8 = call ptr @__RV_pmd_cp_fmd_pmd(ptr noundef %_RV_pmd_D_105309783177296, ptr noundef %call7)
  store ptr %call8, ptr %_RV_param_pmds, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc43, %entry
  %0 = load i32, ptr %i, align 4
  %1 = load i32, ptr %ni.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end45

for.body:                                         ; preds = %for.cond
  store i32 0, ptr %j, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc, %for.body
  %2 = load i32, ptr %j, align 4
  %3 = load i32, ptr %nk.addr, align 4
  %cmp10 = icmp slt i32 %2, %3
  br i1 %cmp10, label %for.body11, label %for.end

for.body11:                                       ; preds = %for.cond9
  %4 = load i32, ptr %i, align 4
  %conv = sitofp i32 %4 to double
  %5 = load i32, ptr %j, align 4
  %conv12 = sitofp i32 %5 to double
  %mul = fmul double %conv, %conv12
  %6 = load i32, ptr %ni.addr, align 4
  %conv13 = sitofp i32 %6 to double
  %div = fdiv double %mul, %conv13
  %7 = load ptr, ptr %A.addr, align 8
  %8 = load ptr, ptr %A.addr, align 8
  %9 = load i32, ptr %i, align 4
  %conv14 = sext i32 %9 to i64
  %call15 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_A_105309783176048, ptr noundef %8, i64 noundef %conv14, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.51, i32 noundef 33, i32 noundef 9, ptr noundef @.str.52)
  %arrayidx = getelementptr inbounds [1024 x double], ptr %7, i64 %call15
  %10 = load ptr, ptr %A.addr, align 8
  %11 = load i32, ptr %i, align 4
  %idxprom = sext i32 %11 to i64
  %arrayidx16 = getelementptr inbounds [1024 x double], ptr %10, i64 %idxprom
  %arraydecay = getelementptr inbounds [1024 x double], ptr %arrayidx16, i64 0, i64 0
  %12 = load i32, ptr %j, align 4
  %conv17 = sext i32 %12 to i64
  %call18 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_A_105309783176048, ptr noundef %arraydecay, i64 noundef %conv17, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.51, i32 noundef 33, i32 noundef 12, ptr noundef @.str.53)
  %arrayidx19 = getelementptr inbounds [1024 x double], ptr %arrayidx, i64 0, i64 %call18
  store double %div, ptr %arrayidx19, align 8
  br label %_RV_lbl_105309783223896

_RV_lbl_105309783223896:                          ; preds = %for.body11
  %13 = load i8, ptr %_RV_ret_flag, align 1
  %tobool = icmp ne i8 %13, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %_RV_lbl_105309783223896
  br label %_RV_lbl_105309783223928

if.end:                                           ; preds = %_RV_lbl_105309783223896
  %14 = load i8, ptr %_RV_bc_flag_105309783223896, align 1
  %conv20 = zext i8 %14 to i32
  %cmp21 = icmp eq i32 %conv20, 1
  br i1 %cmp21, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end
  store i8 0, ptr %_RV_bc_flag_105309783223896, align 1
  br label %for.end

if.end24:                                         ; preds = %if.end
  %15 = load i8, ptr %_RV_bc_flag_105309783223896, align 1
  %conv25 = zext i8 %15 to i32
  %cmp26 = icmp eq i32 %conv25, 2
  br i1 %cmp26, label %if.then28, label %if.end29

if.then28:                                        ; preds = %if.end24
  store i8 0, ptr %_RV_bc_flag_105309783223896, align 1
  br label %if.end29

if.end29:                                         ; preds = %if.then28, %if.end24
  br label %for.inc

for.inc:                                          ; preds = %if.end29
  %16 = load i32, ptr %j, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, ptr %j, align 4
  br label %for.cond9, !llvm.loop !51

for.end:                                          ; preds = %if.then23, %for.cond9
  br label %_RV_lbl_105309783223928

_RV_lbl_105309783223928:                          ; preds = %for.end, %if.then
  %17 = load i8, ptr %_RV_ret_flag, align 1
  %tobool30 = icmp ne i8 %17, 0
  br i1 %tobool30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %_RV_lbl_105309783223928
  br label %_RV_lbl_105309783228432

if.end32:                                         ; preds = %_RV_lbl_105309783223928
  %18 = load i8, ptr %_RV_bc_flag_105309783223928, align 1
  %conv33 = zext i8 %18 to i32
  %cmp34 = icmp eq i32 %conv33, 1
  br i1 %cmp34, label %if.then36, label %if.end37

if.then36:                                        ; preds = %if.end32
  store i8 0, ptr %_RV_bc_flag_105309783223928, align 1
  br label %for.end45

if.end37:                                         ; preds = %if.end32
  %19 = load i8, ptr %_RV_bc_flag_105309783223928, align 1
  %conv38 = zext i8 %19 to i32
  %cmp39 = icmp eq i32 %conv38, 2
  br i1 %cmp39, label %if.then41, label %if.end42

if.then41:                                        ; preds = %if.end37
  store i8 0, ptr %_RV_bc_flag_105309783223928, align 1
  br label %if.end42

if.end42:                                         ; preds = %if.then41, %if.end37
  br label %for.inc43

for.inc43:                                        ; preds = %if.end42
  %20 = load i32, ptr %i, align 4
  %inc44 = add nsw i32 %20, 1
  store i32 %inc44, ptr %i, align 4
  br label %for.cond, !llvm.loop !52

for.end45:                                        ; preds = %if.then36, %for.cond
  store i32 0, ptr %i, align 4
  br label %for.cond46

for.cond46:                                       ; preds = %for.inc97, %for.end45
  %21 = load i32, ptr %i, align 4
  %22 = load i32, ptr %nk.addr, align 4
  %cmp47 = icmp slt i32 %21, %22
  br i1 %cmp47, label %for.body49, label %for.end99

for.body49:                                       ; preds = %for.cond46
  store i32 0, ptr %j, align 4
  br label %for.cond50

for.cond50:                                       ; preds = %for.inc81, %for.body49
  %23 = load i32, ptr %j, align 4
  %24 = load i32, ptr %nj.addr, align 4
  %cmp51 = icmp slt i32 %23, %24
  br i1 %cmp51, label %for.body53, label %for.end83

for.body53:                                       ; preds = %for.cond50
  %25 = load i32, ptr %i, align 4
  %conv54 = sitofp i32 %25 to double
  %26 = load i32, ptr %j, align 4
  %add = add nsw i32 %26, 1
  %conv55 = sitofp i32 %add to double
  %mul56 = fmul double %conv54, %conv55
  %27 = load i32, ptr %nj.addr, align 4
  %conv57 = sitofp i32 %27 to double
  %div58 = fdiv double %mul56, %conv57
  %28 = load ptr, ptr %B.addr, align 8
  %29 = load ptr, ptr %B.addr, align 8
  %30 = load i32, ptr %i, align 4
  %conv59 = sext i32 %30 to i64
  %call60 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_B_105309783176464, ptr noundef %29, i64 noundef %conv59, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.51, i32 noundef 36, i32 noundef 9, ptr noundef @.str.54)
  %arrayidx61 = getelementptr inbounds [1024 x double], ptr %28, i64 %call60
  %31 = load ptr, ptr %B.addr, align 8
  %32 = load i32, ptr %i, align 4
  %idxprom62 = sext i32 %32 to i64
  %arrayidx63 = getelementptr inbounds [1024 x double], ptr %31, i64 %idxprom62
  %arraydecay64 = getelementptr inbounds [1024 x double], ptr %arrayidx63, i64 0, i64 0
  %33 = load i32, ptr %j, align 4
  %conv65 = sext i32 %33 to i64
  %call66 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_B_105309783176464, ptr noundef %arraydecay64, i64 noundef %conv65, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.51, i32 noundef 36, i32 noundef 12, ptr noundef @.str.55)
  %arrayidx67 = getelementptr inbounds [1024 x double], ptr %arrayidx61, i64 0, i64 %call66
  store double %div58, ptr %arrayidx67, align 8
  br label %_RV_lbl_105309783225360

_RV_lbl_105309783225360:                          ; preds = %for.body53
  %34 = load i8, ptr %_RV_ret_flag, align 1
  %tobool68 = icmp ne i8 %34, 0
  br i1 %tobool68, label %if.then69, label %if.end70

if.then69:                                        ; preds = %_RV_lbl_105309783225360
  br label %_RV_lbl_105309783225392

if.end70:                                         ; preds = %_RV_lbl_105309783225360
  %35 = load i8, ptr %_RV_bc_flag_105309783225360, align 1
  %conv71 = zext i8 %35 to i32
  %cmp72 = icmp eq i32 %conv71, 1
  br i1 %cmp72, label %if.then74, label %if.end75

if.then74:                                        ; preds = %if.end70
  store i8 0, ptr %_RV_bc_flag_105309783225360, align 1
  br label %for.end83

if.end75:                                         ; preds = %if.end70
  %36 = load i8, ptr %_RV_bc_flag_105309783225360, align 1
  %conv76 = zext i8 %36 to i32
  %cmp77 = icmp eq i32 %conv76, 2
  br i1 %cmp77, label %if.then79, label %if.end80

if.then79:                                        ; preds = %if.end75
  store i8 0, ptr %_RV_bc_flag_105309783225360, align 1
  br label %if.end80

if.end80:                                         ; preds = %if.then79, %if.end75
  br label %for.inc81

for.inc81:                                        ; preds = %if.end80
  %37 = load i32, ptr %j, align 4
  %inc82 = add nsw i32 %37, 1
  store i32 %inc82, ptr %j, align 4
  br label %for.cond50, !llvm.loop !53

for.end83:                                        ; preds = %if.then74, %for.cond50
  br label %_RV_lbl_105309783225392

_RV_lbl_105309783225392:                          ; preds = %for.end83, %if.then69
  %38 = load i8, ptr %_RV_ret_flag, align 1
  %tobool84 = icmp ne i8 %38, 0
  br i1 %tobool84, label %if.then85, label %if.end86

if.then85:                                        ; preds = %_RV_lbl_105309783225392
  br label %_RV_lbl_105309783228432

if.end86:                                         ; preds = %_RV_lbl_105309783225392
  %39 = load i8, ptr %_RV_bc_flag_105309783225392, align 1
  %conv87 = zext i8 %39 to i32
  %cmp88 = icmp eq i32 %conv87, 1
  br i1 %cmp88, label %if.then90, label %if.end91

if.then90:                                        ; preds = %if.end86
  store i8 0, ptr %_RV_bc_flag_105309783225392, align 1
  br label %for.end99

if.end91:                                         ; preds = %if.end86
  %40 = load i8, ptr %_RV_bc_flag_105309783225392, align 1
  %conv92 = zext i8 %40 to i32
  %cmp93 = icmp eq i32 %conv92, 2
  br i1 %cmp93, label %if.then95, label %if.end96

if.then95:                                        ; preds = %if.end91
  store i8 0, ptr %_RV_bc_flag_105309783225392, align 1
  br label %if.end96

if.end96:                                         ; preds = %if.then95, %if.end91
  br label %for.inc97

for.inc97:                                        ; preds = %if.end96
  %41 = load i32, ptr %i, align 4
  %inc98 = add nsw i32 %41, 1
  store i32 %inc98, ptr %i, align 4
  br label %for.cond46, !llvm.loop !54

for.end99:                                        ; preds = %if.then90, %for.cond46
  store i32 0, ptr %i, align 4
  br label %for.cond100

for.cond100:                                      ; preds = %for.inc152, %for.end99
  %42 = load i32, ptr %i, align 4
  %43 = load i32, ptr %nj.addr, align 4
  %cmp101 = icmp slt i32 %42, %43
  br i1 %cmp101, label %for.body103, label %for.end154

for.body103:                                      ; preds = %for.cond100
  store i32 0, ptr %j, align 4
  br label %for.cond104

for.cond104:                                      ; preds = %for.inc136, %for.body103
  %44 = load i32, ptr %j, align 4
  %45 = load i32, ptr %nm.addr, align 4
  %cmp105 = icmp slt i32 %44, %45
  br i1 %cmp105, label %for.body107, label %for.end138

for.body107:                                      ; preds = %for.cond104
  %46 = load i32, ptr %i, align 4
  %conv108 = sitofp i32 %46 to double
  %47 = load i32, ptr %j, align 4
  %add109 = add nsw i32 %47, 3
  %conv110 = sitofp i32 %add109 to double
  %mul111 = fmul double %conv108, %conv110
  %48 = load i32, ptr %nl.addr, align 4
  %conv112 = sitofp i32 %48 to double
  %div113 = fdiv double %mul111, %conv112
  %49 = load ptr, ptr %C.addr, align 8
  %50 = load ptr, ptr %C.addr, align 8
  %51 = load i32, ptr %i, align 4
  %conv114 = sext i32 %51 to i64
  %call115 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_C_105309783176880, ptr noundef %50, i64 noundef %conv114, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.51, i32 noundef 39, i32 noundef 9, ptr noundef @.str.56)
  %arrayidx116 = getelementptr inbounds [1024 x double], ptr %49, i64 %call115
  %52 = load ptr, ptr %C.addr, align 8
  %53 = load i32, ptr %i, align 4
  %idxprom117 = sext i32 %53 to i64
  %arrayidx118 = getelementptr inbounds [1024 x double], ptr %52, i64 %idxprom117
  %arraydecay119 = getelementptr inbounds [1024 x double], ptr %arrayidx118, i64 0, i64 0
  %54 = load i32, ptr %j, align 4
  %conv120 = sext i32 %54 to i64
  %call121 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_C_105309783176880, ptr noundef %arraydecay119, i64 noundef %conv120, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.51, i32 noundef 39, i32 noundef 12, ptr noundef @.str.57)
  %arrayidx122 = getelementptr inbounds [1024 x double], ptr %arrayidx116, i64 0, i64 %call121
  store double %div113, ptr %arrayidx122, align 8
  br label %_RV_lbl_105309783226824

_RV_lbl_105309783226824:                          ; preds = %for.body107
  %55 = load i8, ptr %_RV_ret_flag, align 1
  %tobool123 = icmp ne i8 %55, 0
  br i1 %tobool123, label %if.then124, label %if.end125

if.then124:                                       ; preds = %_RV_lbl_105309783226824
  br label %_RV_lbl_105309783226856

if.end125:                                        ; preds = %_RV_lbl_105309783226824
  %56 = load i8, ptr %_RV_bc_flag_105309783226824, align 1
  %conv126 = zext i8 %56 to i32
  %cmp127 = icmp eq i32 %conv126, 1
  br i1 %cmp127, label %if.then129, label %if.end130

if.then129:                                       ; preds = %if.end125
  store i8 0, ptr %_RV_bc_flag_105309783226824, align 1
  br label %for.end138

if.end130:                                        ; preds = %if.end125
  %57 = load i8, ptr %_RV_bc_flag_105309783226824, align 1
  %conv131 = zext i8 %57 to i32
  %cmp132 = icmp eq i32 %conv131, 2
  br i1 %cmp132, label %if.then134, label %if.end135

if.then134:                                       ; preds = %if.end130
  store i8 0, ptr %_RV_bc_flag_105309783226824, align 1
  br label %if.end135

if.end135:                                        ; preds = %if.then134, %if.end130
  br label %for.inc136

for.inc136:                                       ; preds = %if.end135
  %58 = load i32, ptr %j, align 4
  %inc137 = add nsw i32 %58, 1
  store i32 %inc137, ptr %j, align 4
  br label %for.cond104, !llvm.loop !55

for.end138:                                       ; preds = %if.then129, %for.cond104
  br label %_RV_lbl_105309783226856

_RV_lbl_105309783226856:                          ; preds = %for.end138, %if.then124
  %59 = load i8, ptr %_RV_ret_flag, align 1
  %tobool139 = icmp ne i8 %59, 0
  br i1 %tobool139, label %if.then140, label %if.end141

if.then140:                                       ; preds = %_RV_lbl_105309783226856
  br label %_RV_lbl_105309783228432

if.end141:                                        ; preds = %_RV_lbl_105309783226856
  %60 = load i8, ptr %_RV_bc_flag_105309783226856, align 1
  %conv142 = zext i8 %60 to i32
  %cmp143 = icmp eq i32 %conv142, 1
  br i1 %cmp143, label %if.then145, label %if.end146

if.then145:                                       ; preds = %if.end141
  store i8 0, ptr %_RV_bc_flag_105309783226856, align 1
  br label %for.end154

if.end146:                                        ; preds = %if.end141
  %61 = load i8, ptr %_RV_bc_flag_105309783226856, align 1
  %conv147 = zext i8 %61 to i32
  %cmp148 = icmp eq i32 %conv147, 2
  br i1 %cmp148, label %if.then150, label %if.end151

if.then150:                                       ; preds = %if.end146
  store i8 0, ptr %_RV_bc_flag_105309783226856, align 1
  br label %if.end151

if.end151:                                        ; preds = %if.then150, %if.end146
  br label %for.inc152

for.inc152:                                       ; preds = %if.end151
  %62 = load i32, ptr %i, align 4
  %inc153 = add nsw i32 %62, 1
  store i32 %inc153, ptr %i, align 4
  br label %for.cond100, !llvm.loop !56

for.end154:                                       ; preds = %if.then145, %for.cond100
  store i32 0, ptr %i, align 4
  br label %for.cond155

for.cond155:                                      ; preds = %for.inc207, %for.end154
  %63 = load i32, ptr %i, align 4
  %64 = load i32, ptr %nm.addr, align 4
  %cmp156 = icmp slt i32 %63, %64
  br i1 %cmp156, label %for.body158, label %for.end209

for.body158:                                      ; preds = %for.cond155
  store i32 0, ptr %j, align 4
  br label %for.cond159

for.cond159:                                      ; preds = %for.inc191, %for.body158
  %65 = load i32, ptr %j, align 4
  %66 = load i32, ptr %nl.addr, align 4
  %cmp160 = icmp slt i32 %65, %66
  br i1 %cmp160, label %for.body162, label %for.end193

for.body162:                                      ; preds = %for.cond159
  %67 = load i32, ptr %i, align 4
  %conv163 = sitofp i32 %67 to double
  %68 = load i32, ptr %j, align 4
  %add164 = add nsw i32 %68, 2
  %conv165 = sitofp i32 %add164 to double
  %mul166 = fmul double %conv163, %conv165
  %69 = load i32, ptr %nk.addr, align 4
  %conv167 = sitofp i32 %69 to double
  %div168 = fdiv double %mul166, %conv167
  %70 = load ptr, ptr %D.addr, align 8
  %71 = load ptr, ptr %D.addr, align 8
  %72 = load i32, ptr %i, align 4
  %conv169 = sext i32 %72 to i64
  %call170 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_D_105309783177296, ptr noundef %71, i64 noundef %conv169, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.51, i32 noundef 42, i32 noundef 9, ptr noundef @.str.58)
  %arrayidx171 = getelementptr inbounds [1024 x double], ptr %70, i64 %call170
  %73 = load ptr, ptr %D.addr, align 8
  %74 = load i32, ptr %i, align 4
  %idxprom172 = sext i32 %74 to i64
  %arrayidx173 = getelementptr inbounds [1024 x double], ptr %73, i64 %idxprom172
  %arraydecay174 = getelementptr inbounds [1024 x double], ptr %arrayidx173, i64 0, i64 0
  %75 = load i32, ptr %j, align 4
  %conv175 = sext i32 %75 to i64
  %call176 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_D_105309783177296, ptr noundef %arraydecay174, i64 noundef %conv175, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.51, i32 noundef 42, i32 noundef 12, ptr noundef @.str.59)
  %arrayidx177 = getelementptr inbounds [1024 x double], ptr %arrayidx171, i64 0, i64 %call176
  store double %div168, ptr %arrayidx177, align 8
  br label %_RV_lbl_105309783228288

_RV_lbl_105309783228288:                          ; preds = %for.body162
  %76 = load i8, ptr %_RV_ret_flag, align 1
  %tobool178 = icmp ne i8 %76, 0
  br i1 %tobool178, label %if.then179, label %if.end180

if.then179:                                       ; preds = %_RV_lbl_105309783228288
  br label %_RV_lbl_105309783228320

if.end180:                                        ; preds = %_RV_lbl_105309783228288
  %77 = load i8, ptr %_RV_bc_flag_105309783228288, align 1
  %conv181 = zext i8 %77 to i32
  %cmp182 = icmp eq i32 %conv181, 1
  br i1 %cmp182, label %if.then184, label %if.end185

if.then184:                                       ; preds = %if.end180
  store i8 0, ptr %_RV_bc_flag_105309783228288, align 1
  br label %for.end193

if.end185:                                        ; preds = %if.end180
  %78 = load i8, ptr %_RV_bc_flag_105309783228288, align 1
  %conv186 = zext i8 %78 to i32
  %cmp187 = icmp eq i32 %conv186, 2
  br i1 %cmp187, label %if.then189, label %if.end190

if.then189:                                       ; preds = %if.end185
  store i8 0, ptr %_RV_bc_flag_105309783228288, align 1
  br label %if.end190

if.end190:                                        ; preds = %if.then189, %if.end185
  br label %for.inc191

for.inc191:                                       ; preds = %if.end190
  %79 = load i32, ptr %j, align 4
  %inc192 = add nsw i32 %79, 1
  store i32 %inc192, ptr %j, align 4
  br label %for.cond159, !llvm.loop !57

for.end193:                                       ; preds = %if.then184, %for.cond159
  br label %_RV_lbl_105309783228320

_RV_lbl_105309783228320:                          ; preds = %for.end193, %if.then179
  %80 = load i8, ptr %_RV_ret_flag, align 1
  %tobool194 = icmp ne i8 %80, 0
  br i1 %tobool194, label %if.then195, label %if.end196

if.then195:                                       ; preds = %_RV_lbl_105309783228320
  br label %_RV_lbl_105309783228432

if.end196:                                        ; preds = %_RV_lbl_105309783228320
  %81 = load i8, ptr %_RV_bc_flag_105309783228320, align 1
  %conv197 = zext i8 %81 to i32
  %cmp198 = icmp eq i32 %conv197, 1
  br i1 %cmp198, label %if.then200, label %if.end201

if.then200:                                       ; preds = %if.end196
  store i8 0, ptr %_RV_bc_flag_105309783228320, align 1
  br label %for.end209

if.end201:                                        ; preds = %if.end196
  %82 = load i8, ptr %_RV_bc_flag_105309783228320, align 1
  %conv202 = zext i8 %82 to i32
  %cmp203 = icmp eq i32 %conv202, 2
  br i1 %cmp203, label %if.then205, label %if.end206

if.then205:                                       ; preds = %if.end201
  store i8 0, ptr %_RV_bc_flag_105309783228320, align 1
  br label %if.end206

if.end206:                                        ; preds = %if.then205, %if.end201
  br label %for.inc207

for.inc207:                                       ; preds = %if.end206
  %83 = load i32, ptr %i, align 4
  %inc208 = add nsw i32 %83, 1
  store i32 %inc208, ptr %i, align 4
  br label %for.cond155, !llvm.loop !58

for.end209:                                       ; preds = %if.then200, %for.cond155
  br label %_RV_lbl_105309783228432

_RV_lbl_105309783228432:                          ; preds = %for.end209, %if.then195, %if.then140, %if.then85, %if.then31
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_A_105309783176048)
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_B_105309783176464)
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_C_105309783176880)
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_D_105309783177296)
  %84 = load ptr, ptr %__RV_stack_sa, align 8
  %stat = getelementptr inbounds %struct.__RV_stat_node, ptr %84, i32 0, i32 0
  store i32 0, ptr %stat, align 8
  %85 = load ptr, ptr %__RV_stack_sa, align 8
  %call210 = call i32 @__RV_stat_node_dec(ptr noundef %85)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @kernel_3mm(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, i32 noundef %nl, i32 noundef %nm, ptr noundef %E, ptr noundef %A, ptr noundef %B, ptr noundef %F, ptr noundef %C, ptr noundef %D, ptr noundef %G) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %nm.addr = alloca i32, align 4
  %E.addr = alloca ptr, align 8
  %A.addr = alloca ptr, align 8
  %B.addr = alloca ptr, align 8
  %F.addr = alloca ptr, align 8
  %C.addr = alloca ptr, align 8
  %D.addr = alloca ptr, align 8
  %G.addr = alloca ptr, align 8
  %__RV_stack_sa = alloca ptr, align 8
  %_RV_ret_flag = alloca i8, align 1
  %_RV_bc_flag_105309783243304 = alloca i8, align 1
  %_RV_bc_flag_105309783243272 = alloca i8, align 1
  %_RV_bc_flag_105309783243168 = alloca i8, align 1
  %_RV_bc_flag_105309783246992 = alloca i8, align 1
  %_RV_bc_flag_105309783246960 = alloca i8, align 1
  %_RV_bc_flag_105309783246856 = alloca i8, align 1
  %_RV_bc_flag_105309783249320 = alloca i8, align 1
  %_RV_bc_flag_105309783249288 = alloca i8, align 1
  %_RV_bc_flag_105309783249184 = alloca i8, align 1
  %_RV_pmd_E_105309783237384 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_A_105309783237800 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_B_105309783238216 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_F_105309783238632 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_C_105309783239048 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_D_105309783239464 = alloca %struct.__RV_pmd, align 8
  %_RV_pmd_G_105309783239880 = alloca %struct.__RV_pmd, align 8
  %_RV_param_pmds = alloca ptr, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %ni, ptr %ni.addr, align 4
  store i32 %nj, ptr %nj.addr, align 4
  store i32 %nk, ptr %nk.addr, align 4
  store i32 %nl, ptr %nl.addr, align 4
  store i32 %nm, ptr %nm.addr, align 4
  store ptr %E, ptr %E.addr, align 8
  store ptr %A, ptr %A.addr, align 8
  store ptr %B, ptr %B.addr, align 8
  store ptr %F, ptr %F.addr, align 8
  store ptr %C, ptr %C.addr, align 8
  store ptr %D, ptr %D.addr, align 8
  store ptr %G, ptr %G.addr, align 8
  %call = call ptr @__RV_stat_node_create(i32 noundef 5, i64 noundef 1)
  store ptr %call, ptr %__RV_stack_sa, align 8
  store i8 0, ptr %_RV_ret_flag, align 1
  store i8 0, ptr %_RV_bc_flag_105309783243304, align 1
  store i8 0, ptr %_RV_bc_flag_105309783243272, align 1
  store i8 0, ptr %_RV_bc_flag_105309783243168, align 1
  store i8 0, ptr %_RV_bc_flag_105309783246992, align 1
  store i8 0, ptr %_RV_bc_flag_105309783246960, align 1
  store i8 0, ptr %_RV_bc_flag_105309783246856, align 1
  store i8 0, ptr %_RV_bc_flag_105309783249320, align 1
  store i8 0, ptr %_RV_bc_flag_105309783249288, align 1
  store i8 0, ptr %_RV_bc_flag_105309783249184, align 1
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_E_105309783237384, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_A_105309783237800, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_B_105309783238216, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_F_105309783238632, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_C_105309783239048, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_D_105309783239464, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_G_105309783239880, i8 0, i64 32, i1 false)
  %call1 = call ptr @__RV_fmd_tbl_lookup_fpmd(ptr noundef @kernel_3mm, i8 noundef zeroext 0)
  %call2 = call ptr @__RV_pmd_cp_fmd_pmd(ptr noundef %_RV_pmd_E_105309783237384, ptr noundef %call1)
  %call3 = call ptr @__RV_fmd_tbl_lookup_fpmd(ptr noundef @kernel_3mm, i8 noundef zeroext 1)
  %call4 = call ptr @__RV_pmd_cp_fmd_pmd(ptr noundef %_RV_pmd_A_105309783237800, ptr noundef %call3)
  %call5 = call ptr @__RV_fmd_tbl_lookup_fpmd(ptr noundef @kernel_3mm, i8 noundef zeroext 2)
  %call6 = call ptr @__RV_pmd_cp_fmd_pmd(ptr noundef %_RV_pmd_B_105309783238216, ptr noundef %call5)
  %call7 = call ptr @__RV_fmd_tbl_lookup_fpmd(ptr noundef @kernel_3mm, i8 noundef zeroext 3)
  %call8 = call ptr @__RV_pmd_cp_fmd_pmd(ptr noundef %_RV_pmd_F_105309783238632, ptr noundef %call7)
  %call9 = call ptr @__RV_fmd_tbl_lookup_fpmd(ptr noundef @kernel_3mm, i8 noundef zeroext 4)
  %call10 = call ptr @__RV_pmd_cp_fmd_pmd(ptr noundef %_RV_pmd_C_105309783239048, ptr noundef %call9)
  %call11 = call ptr @__RV_fmd_tbl_lookup_fpmd(ptr noundef @kernel_3mm, i8 noundef zeroext 5)
  %call12 = call ptr @__RV_pmd_cp_fmd_pmd(ptr noundef %_RV_pmd_D_105309783239464, ptr noundef %call11)
  %call13 = call ptr @__RV_fmd_tbl_lookup_fpmd(ptr noundef @kernel_3mm, i8 noundef zeroext 6)
  %call14 = call ptr @__RV_pmd_cp_fmd_pmd(ptr noundef %_RV_pmd_G_105309783239880, ptr noundef %call13)
  store ptr %call14, ptr %_RV_param_pmds, align 8
  store i32 0, ptr %i, align 4
  %cm_spawn_env_malloc117 = call ptr @__catamaran_alloc_env(i64 160)
  %cm_meta_slab_buf118 = call ptr @__catamaran_alloc_env(i64 32)
  %cm_meta_buf_i8119 = bitcast ptr %cm_meta_slab_buf118 to ptr
  %cm_meta_src_i8120 = bitcast ptr %_RV_pmd_E_105309783237384 to ptr
  call void @__catamaran_copy_metadata(ptr %cm_meta_buf_i8119, ptr %cm_meta_src_i8120, i64 32)
  %cm_env_slot_meta_ptr121 = getelementptr i8, ptr %cm_spawn_env_malloc117, i64 0
  %cm_env_slot_pptr122 = bitcast ptr %cm_env_slot_meta_ptr121 to ptr
  store ptr %cm_meta_slab_buf118, ptr %cm_env_slot_pptr122, align 8
  %cm_meta_slab_buf123 = call ptr @__catamaran_alloc_env(i64 32)
  %cm_meta_buf_i8124 = bitcast ptr %cm_meta_slab_buf123 to ptr
  %cm_meta_src_i8125 = bitcast ptr %_RV_pmd_A_105309783237800 to ptr
  call void @__catamaran_copy_metadata(ptr %cm_meta_buf_i8124, ptr %cm_meta_src_i8125, i64 32)
  %cm_env_slot_meta_ptr126 = getelementptr i8, ptr %cm_spawn_env_malloc117, i64 8
  %cm_env_slot_pptr127 = bitcast ptr %cm_env_slot_meta_ptr126 to ptr
  store ptr %cm_meta_slab_buf123, ptr %cm_env_slot_pptr127, align 8
  %cm_meta_slab_buf128 = call ptr @__catamaran_alloc_env(i64 32)
  %cm_meta_buf_i8129 = bitcast ptr %cm_meta_slab_buf128 to ptr
  %cm_meta_src_i8130 = bitcast ptr %_RV_pmd_B_105309783238216 to ptr
  call void @__catamaran_copy_metadata(ptr %cm_meta_buf_i8129, ptr %cm_meta_src_i8130, i64 32)
  %cm_env_slot_meta_ptr131 = getelementptr i8, ptr %cm_spawn_env_malloc117, i64 16
  %cm_env_slot_pptr132 = bitcast ptr %cm_env_slot_meta_ptr131 to ptr
  store ptr %cm_meta_slab_buf128, ptr %cm_env_slot_pptr132, align 8
  %cm_spawn_slot_ptr133 = getelementptr i8, ptr %cm_spawn_env_malloc117, i64 24
  %cm_spawn_slot134 = bitcast ptr %cm_spawn_slot_ptr133 to ptr
  store ptr %_RV_bc_flag_105309783243168, ptr %cm_spawn_slot134, align 8
  %cm_spawn_slot_ptr135 = getelementptr i8, ptr %cm_spawn_env_malloc117, i64 32
  %cm_spawn_slot136 = bitcast ptr %cm_spawn_slot_ptr135 to ptr
  store ptr %_RV_ret_flag, ptr %cm_spawn_slot136, align 8
  %cm_spawn_slot_ptr137 = getelementptr i8, ptr %cm_spawn_env_malloc117, i64 40
  %cm_spawn_slot138 = bitcast ptr %cm_spawn_slot_ptr137 to ptr
  store ptr %i, ptr %cm_spawn_slot138, align 8
  %cm_spawn_slot_ptr139 = getelementptr i8, ptr %cm_spawn_env_malloc117, i64 48
  %cm_spawn_slot140 = bitcast ptr %cm_spawn_slot_ptr139 to ptr
  store ptr %ni.addr, ptr %cm_spawn_slot140, align 8
  %cm_spawn_slot_ptr141 = getelementptr i8, ptr %cm_spawn_env_malloc117, i64 56
  %cm_spawn_slot142 = bitcast ptr %cm_spawn_slot_ptr141 to ptr
  store ptr %_RV_bc_flag_105309783243304, ptr %cm_spawn_slot142, align 8
  %cm_spawn_slot_ptr143 = getelementptr i8, ptr %cm_spawn_env_malloc117, i64 64
  %cm_spawn_slot144 = bitcast ptr %cm_spawn_slot_ptr143 to ptr
  store ptr %k, ptr %cm_spawn_slot144, align 8
  %cm_spawn_slot_ptr145 = getelementptr i8, ptr %cm_spawn_env_malloc117, i64 72
  %cm_spawn_slot146 = bitcast ptr %cm_spawn_slot_ptr145 to ptr
  store ptr %nk.addr, ptr %cm_spawn_slot146, align 8
  %cm_spawn_slot_ptr147 = getelementptr i8, ptr %cm_spawn_env_malloc117, i64 80
  %cm_spawn_slot148 = bitcast ptr %cm_spawn_slot_ptr147 to ptr
  store ptr %_RV_bc_flag_105309783243272, ptr %cm_spawn_slot148, align 8
  %cm_spawn_slot_ptr149 = getelementptr i8, ptr %cm_spawn_env_malloc117, i64 88
  %cm_spawn_slot150 = bitcast ptr %cm_spawn_slot_ptr149 to ptr
  store ptr %j, ptr %cm_spawn_slot150, align 8
  %cm_spawn_slot_ptr151 = getelementptr i8, ptr %cm_spawn_env_malloc117, i64 96
  %cm_spawn_slot152 = bitcast ptr %cm_spawn_slot_ptr151 to ptr
  store ptr %nj.addr, ptr %cm_spawn_slot152, align 8
  %cm_spawn_slot_ptr153 = getelementptr i8, ptr %cm_spawn_env_malloc117, i64 104
  %cm_spawn_slot154 = bitcast ptr %cm_spawn_slot_ptr153 to ptr
  store ptr %E.addr, ptr %cm_spawn_slot154, align 8
  %cm_spawn_slot_ptr155 = getelementptr i8, ptr %cm_spawn_env_malloc117, i64 112
  %cm_spawn_slot156 = bitcast ptr %cm_spawn_slot_ptr155 to ptr
  store ptr %A.addr, ptr %cm_spawn_slot156, align 8
  %cm_spawn_slot_ptr157 = getelementptr i8, ptr %cm_spawn_env_malloc117, i64 120
  %cm_spawn_slot158 = bitcast ptr %cm_spawn_slot_ptr157 to ptr
  store ptr %B.addr, ptr %cm_spawn_slot158, align 8
  %cm_meta_slab_buf159 = call ptr @__catamaran_alloc_env(i64 32)
  %cm_meta_buf_i8160 = bitcast ptr %cm_meta_slab_buf159 to ptr
  %cm_meta_src_i8161 = bitcast ptr %_RV_pmd_F_105309783238632 to ptr
  call void @__catamaran_copy_metadata(ptr %cm_meta_buf_i8160, ptr %cm_meta_src_i8161, i64 32)
  %cm_env_slot_meta_ptr162 = getelementptr i8, ptr %cm_spawn_env_malloc117, i64 128
  %cm_env_slot_pptr163 = bitcast ptr %cm_env_slot_meta_ptr162 to ptr
  store ptr %cm_meta_slab_buf159, ptr %cm_env_slot_pptr163, align 8
  %cm_meta_slab_buf164 = call ptr @__catamaran_alloc_env(i64 32)
  %cm_meta_buf_i8165 = bitcast ptr %cm_meta_slab_buf164 to ptr
  %cm_meta_src_i8166 = bitcast ptr %_RV_pmd_C_105309783239048 to ptr
  call void @__catamaran_copy_metadata(ptr %cm_meta_buf_i8165, ptr %cm_meta_src_i8166, i64 32)
  %cm_env_slot_meta_ptr167 = getelementptr i8, ptr %cm_spawn_env_malloc117, i64 136
  %cm_env_slot_pptr168 = bitcast ptr %cm_env_slot_meta_ptr167 to ptr
  store ptr %cm_meta_slab_buf164, ptr %cm_env_slot_pptr168, align 8
  %cm_meta_slab_buf169 = call ptr @__catamaran_alloc_env(i64 32)
  %cm_meta_buf_i8170 = bitcast ptr %cm_meta_slab_buf169 to ptr
  %cm_meta_src_i8171 = bitcast ptr %_RV_pmd_D_105309783239464 to ptr
  call void @__catamaran_copy_metadata(ptr %cm_meta_buf_i8170, ptr %cm_meta_src_i8171, i64 32)
  %cm_env_slot_meta_ptr172 = getelementptr i8, ptr %cm_spawn_env_malloc117, i64 144
  %cm_env_slot_pptr173 = bitcast ptr %cm_env_slot_meta_ptr172 to ptr
  store ptr %cm_meta_slab_buf169, ptr %cm_env_slot_pptr173, align 8
  %cm_meta_slab_buf174 = call ptr @__catamaran_alloc_env(i64 32)
  %cm_meta_buf_i8175 = bitcast ptr %cm_meta_slab_buf174 to ptr
  %cm_meta_src_i8176 = bitcast ptr %_RV_pmd_G_105309783239880 to ptr
  call void @__catamaran_copy_metadata(ptr %cm_meta_buf_i8175, ptr %cm_meta_src_i8176, i64 32)
  %cm_env_slot_meta_ptr177 = getelementptr i8, ptr %cm_spawn_env_malloc117, i64 152
  %cm_env_slot_pptr178 = bitcast ptr %cm_env_slot_meta_ptr177 to ptr
  store ptr %cm_meta_slab_buf174, ptr %cm_env_slot_pptr178, align 8
  call void @_Z5spawnjPFvPvES_(i32 -1051946945, ptr @_spawn_loop_func_98, ptr %cm_spawn_env_malloc117)
  br label %for.cond

for.cond:                                         ; preds = %for.inc93, %entry
  %0 = load i32, ptr %i, align 4
  %1 = load i32, ptr %ni.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end95

for.body:                                         ; preds = %for.cond
  store i32 0, ptr %j, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc77, %for.body
  %2 = load i32, ptr %j, align 4
  %3 = load i32, ptr %nj.addr, align 4
  %cmp16 = icmp slt i32 %2, %3
  br i1 %cmp16, label %for.body17, label %for.end79

for.body17:                                       ; preds = %for.cond15
  %4 = load ptr, ptr %E.addr, align 8
  %5 = load ptr, ptr %E.addr, align 8
  %6 = load i32, ptr %i, align 4
  %conv = sext i32 %6 to i64
  %call18 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_E_105309783237384, ptr noundef %5, i64 noundef %conv, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 82, i32 noundef 4, ptr noundef @.str.61)
  %arrayidx = getelementptr inbounds [1024 x double], ptr %4, i64 %call18
  %7 = load ptr, ptr %E.addr, align 8
  %8 = load i32, ptr %i, align 4
  %idxprom = sext i32 %8 to i64
  %arrayidx19 = getelementptr inbounds [1024 x double], ptr %7, i64 %idxprom
  %arraydecay = getelementptr inbounds [1024 x double], ptr %arrayidx19, i64 0, i64 0
  %9 = load i32, ptr %j, align 4
  %conv20 = sext i32 %9 to i64
  %call21 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_E_105309783237384, ptr noundef %arraydecay, i64 noundef %conv20, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 82, i32 noundef 7, ptr noundef @.str.62)
  %arrayidx22 = getelementptr inbounds [1024 x double], ptr %arrayidx, i64 0, i64 %call21
  store double 0.000000e+00, ptr %arrayidx22, align 8
  store i32 0, ptr %k, align 4
  br label %for.cond23

for.cond23:                                       ; preds = %for.inc, %for.body17
  %10 = load i32, ptr %k, align 4
  %11 = load i32, ptr %nk.addr, align 4
  %cmp24 = icmp slt i32 %10, %11
  br i1 %cmp24, label %for.body26, label %for.end

for.body26:                                       ; preds = %for.cond23
  %12 = load ptr, ptr %A.addr, align 8
  %13 = load ptr, ptr %A.addr, align 8
  %14 = load i32, ptr %i, align 4
  %conv27 = sext i32 %14 to i64
  %call28 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_A_105309783237800, ptr noundef %13, i64 noundef %conv27, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 84, i32 noundef 17, ptr noundef @.str.52)
  %arrayidx29 = getelementptr inbounds [1024 x double], ptr %12, i64 %call28
  %15 = load ptr, ptr %A.addr, align 8
  %16 = load i32, ptr %i, align 4
  %idxprom30 = sext i32 %16 to i64
  %arrayidx31 = getelementptr inbounds [1024 x double], ptr %15, i64 %idxprom30
  %arraydecay32 = getelementptr inbounds [1024 x double], ptr %arrayidx31, i64 0, i64 0
  %17 = load i32, ptr %k, align 4
  %conv33 = sext i32 %17 to i64
  %call34 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_A_105309783237800, ptr noundef %arraydecay32, i64 noundef %conv33, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 84, i32 noundef 20, ptr noundef @.str.63)
  %arrayidx35 = getelementptr inbounds [1024 x double], ptr %arrayidx29, i64 0, i64 %call34
  %18 = load double, ptr %arrayidx35, align 8
  %19 = load ptr, ptr %B.addr, align 8
  %20 = load ptr, ptr %B.addr, align 8
  %21 = load i32, ptr %k, align 4
  %conv36 = sext i32 %21 to i64
  %call37 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_B_105309783238216, ptr noundef %20, i64 noundef %conv36, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 84, i32 noundef 27, ptr noundef @.str.64)
  %arrayidx38 = getelementptr inbounds [1024 x double], ptr %19, i64 %call37
  %22 = load ptr, ptr %B.addr, align 8
  %23 = load i32, ptr %k, align 4
  %idxprom39 = sext i32 %23 to i64
  %arrayidx40 = getelementptr inbounds [1024 x double], ptr %22, i64 %idxprom39
  %arraydecay41 = getelementptr inbounds [1024 x double], ptr %arrayidx40, i64 0, i64 0
  %24 = load i32, ptr %j, align 4
  %conv42 = sext i32 %24 to i64
  %call43 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_B_105309783238216, ptr noundef %arraydecay41, i64 noundef %conv42, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 84, i32 noundef 30, ptr noundef @.str.65)
  %arrayidx44 = getelementptr inbounds [1024 x double], ptr %arrayidx38, i64 0, i64 %call43
  %25 = load double, ptr %arrayidx44, align 8
  %26 = load ptr, ptr %E.addr, align 8
  %27 = load ptr, ptr %E.addr, align 8
  %28 = load i32, ptr %i, align 4
  %conv45 = sext i32 %28 to i64
  %call46 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_E_105309783237384, ptr noundef %27, i64 noundef %conv45, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 84, i32 noundef 6, ptr noundef @.str.61)
  %arrayidx47 = getelementptr inbounds [1024 x double], ptr %26, i64 %call46
  %29 = load ptr, ptr %E.addr, align 8
  %30 = load i32, ptr %i, align 4
  %idxprom48 = sext i32 %30 to i64
  %arrayidx49 = getelementptr inbounds [1024 x double], ptr %29, i64 %idxprom48
  %arraydecay50 = getelementptr inbounds [1024 x double], ptr %arrayidx49, i64 0, i64 0
  %31 = load i32, ptr %j, align 4
  %conv51 = sext i32 %31 to i64
  %call52 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_E_105309783237384, ptr noundef %arraydecay50, i64 noundef %conv51, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 84, i32 noundef 9, ptr noundef @.str.62)
  %arrayidx53 = getelementptr inbounds [1024 x double], ptr %arrayidx47, i64 0, i64 %call52
  %32 = load double, ptr %arrayidx53, align 8
  %33 = call double @llvm.fmuladd.f64(double %18, double %25, double %32)
  store double %33, ptr %arrayidx53, align 8
  br label %_RV_lbl_105309783243168

_RV_lbl_105309783243168:                          ; preds = %for.body26
  %34 = load i8, ptr %_RV_ret_flag, align 1
  %tobool = icmp ne i8 %34, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %_RV_lbl_105309783243168
  br label %_RV_lbl_105309783243272

if.end:                                           ; preds = %_RV_lbl_105309783243168
  %35 = load i8, ptr %_RV_bc_flag_105309783243168, align 1
  %conv54 = zext i8 %35 to i32
  %cmp55 = icmp eq i32 %conv54, 1
  br i1 %cmp55, label %if.then57, label %if.end58

if.then57:                                        ; preds = %if.end
  store i8 0, ptr %_RV_bc_flag_105309783243168, align 1
  br label %for.end

if.end58:                                         ; preds = %if.end
  %36 = load i8, ptr %_RV_bc_flag_105309783243168, align 1
  %conv59 = zext i8 %36 to i32
  %cmp60 = icmp eq i32 %conv59, 2
  br i1 %cmp60, label %if.then62, label %if.end63

if.then62:                                        ; preds = %if.end58
  store i8 0, ptr %_RV_bc_flag_105309783243168, align 1
  br label %if.end63

if.end63:                                         ; preds = %if.then62, %if.end58
  br label %for.inc

for.inc:                                          ; preds = %if.end63
  %37 = load i32, ptr %k, align 4
  %inc = add nsw i32 %37, 1
  store i32 %inc, ptr %k, align 4
  br label %for.cond23, !llvm.loop !59

for.end:                                          ; preds = %if.then57, %for.cond23
  br label %_RV_lbl_105309783243272

_RV_lbl_105309783243272:                          ; preds = %for.end, %if.then
  %38 = load i8, ptr %_RV_ret_flag, align 1
  %tobool64 = icmp ne i8 %38, 0
  br i1 %tobool64, label %if.then65, label %if.end66

if.then65:                                        ; preds = %_RV_lbl_105309783243272
  br label %_RV_lbl_105309783243304

if.end66:                                         ; preds = %_RV_lbl_105309783243272
  %39 = load i8, ptr %_RV_bc_flag_105309783243272, align 1
  %conv67 = zext i8 %39 to i32
  %cmp68 = icmp eq i32 %conv67, 1
  br i1 %cmp68, label %if.then70, label %if.end71

if.then70:                                        ; preds = %if.end66
  store i8 0, ptr %_RV_bc_flag_105309783243272, align 1
  br label %for.end79

if.end71:                                         ; preds = %if.end66
  %40 = load i8, ptr %_RV_bc_flag_105309783243272, align 1
  %conv72 = zext i8 %40 to i32
  %cmp73 = icmp eq i32 %conv72, 2
  br i1 %cmp73, label %if.then75, label %if.end76

if.then75:                                        ; preds = %if.end71
  store i8 0, ptr %_RV_bc_flag_105309783243272, align 1
  br label %if.end76

if.end76:                                         ; preds = %if.then75, %if.end71
  br label %for.inc77

for.inc77:                                        ; preds = %if.end76
  %41 = load i32, ptr %j, align 4
  %inc78 = add nsw i32 %41, 1
  store i32 %inc78, ptr %j, align 4
  br label %for.cond15, !llvm.loop !60

for.end79:                                        ; preds = %if.then70, %for.cond15
  br label %_RV_lbl_105309783243304

_RV_lbl_105309783243304:                          ; preds = %for.end79, %if.then65
  %42 = load i8, ptr %_RV_ret_flag, align 1
  %tobool80 = icmp ne i8 %42, 0
  br i1 %tobool80, label %if.then81, label %if.end82

if.then81:                                        ; preds = %_RV_lbl_105309783243304
  br label %_RV_lbl_105309783249432

if.end82:                                         ; preds = %_RV_lbl_105309783243304
  %43 = load i8, ptr %_RV_bc_flag_105309783243304, align 1
  %conv83 = zext i8 %43 to i32
  %cmp84 = icmp eq i32 %conv83, 1
  br i1 %cmp84, label %if.then86, label %if.end87

if.then86:                                        ; preds = %if.end82
  store i8 0, ptr %_RV_bc_flag_105309783243304, align 1
  br label %for.end95

if.end87:                                         ; preds = %if.end82
  %44 = load i8, ptr %_RV_bc_flag_105309783243304, align 1
  %conv88 = zext i8 %44 to i32
  %cmp89 = icmp eq i32 %conv88, 2
  br i1 %cmp89, label %if.then91, label %if.end92

if.then91:                                        ; preds = %if.end87
  store i8 0, ptr %_RV_bc_flag_105309783243304, align 1
  br label %if.end92

if.end92:                                         ; preds = %if.then91, %if.end87
  br label %for.inc93

for.inc93:                                        ; preds = %if.end92
  %45 = load i32, ptr %i, align 4
  %inc94 = add nsw i32 %45, 1
  store i32 %inc94, ptr %i, align 4
  br label %for.cond, !llvm.loop !61

for.end95:                                        ; preds = %if.then86, %for.cond
  store i32 0, ptr %i, align 4
  %cm_spawn_env_malloc55 = call ptr @__catamaran_alloc_env(i64 160)
  %cm_meta_slab_buf56 = call ptr @__catamaran_alloc_env(i64 32)
  %cm_meta_buf_i857 = bitcast ptr %cm_meta_slab_buf56 to ptr
  %cm_meta_src_i858 = bitcast ptr %_RV_pmd_C_105309783239048 to ptr
  call void @__catamaran_copy_metadata(ptr %cm_meta_buf_i857, ptr %cm_meta_src_i858, i64 32)
  %cm_env_slot_meta_ptr59 = getelementptr i8, ptr %cm_spawn_env_malloc55, i64 0
  %cm_env_slot_pptr60 = bitcast ptr %cm_env_slot_meta_ptr59 to ptr
  store ptr %cm_meta_slab_buf56, ptr %cm_env_slot_pptr60, align 8
  %cm_meta_slab_buf61 = call ptr @__catamaran_alloc_env(i64 32)
  %cm_meta_buf_i862 = bitcast ptr %cm_meta_slab_buf61 to ptr
  %cm_meta_src_i863 = bitcast ptr %_RV_pmd_D_105309783239464 to ptr
  call void @__catamaran_copy_metadata(ptr %cm_meta_buf_i862, ptr %cm_meta_src_i863, i64 32)
  %cm_env_slot_meta_ptr64 = getelementptr i8, ptr %cm_spawn_env_malloc55, i64 8
  %cm_env_slot_pptr65 = bitcast ptr %cm_env_slot_meta_ptr64 to ptr
  store ptr %cm_meta_slab_buf61, ptr %cm_env_slot_pptr65, align 8
  %cm_meta_slab_buf66 = call ptr @__catamaran_alloc_env(i64 32)
  %cm_meta_buf_i867 = bitcast ptr %cm_meta_slab_buf66 to ptr
  %cm_meta_src_i868 = bitcast ptr %_RV_pmd_F_105309783238632 to ptr
  call void @__catamaran_copy_metadata(ptr %cm_meta_buf_i867, ptr %cm_meta_src_i868, i64 32)
  %cm_env_slot_meta_ptr69 = getelementptr i8, ptr %cm_spawn_env_malloc55, i64 16
  %cm_env_slot_pptr70 = bitcast ptr %cm_env_slot_meta_ptr69 to ptr
  store ptr %cm_meta_slab_buf66, ptr %cm_env_slot_pptr70, align 8
  %cm_spawn_slot_ptr71 = getelementptr i8, ptr %cm_spawn_env_malloc55, i64 24
  %cm_spawn_slot72 = bitcast ptr %cm_spawn_slot_ptr71 to ptr
  store ptr %i, ptr %cm_spawn_slot72, align 8
  %cm_spawn_slot_ptr73 = getelementptr i8, ptr %cm_spawn_env_malloc55, i64 32
  %cm_spawn_slot74 = bitcast ptr %cm_spawn_slot_ptr73 to ptr
  store ptr %_RV_bc_flag_105309783246856, ptr %cm_spawn_slot74, align 8
  %cm_spawn_slot_ptr75 = getelementptr i8, ptr %cm_spawn_env_malloc55, i64 40
  %cm_spawn_slot76 = bitcast ptr %cm_spawn_slot_ptr75 to ptr
  store ptr %_RV_ret_flag, ptr %cm_spawn_slot76, align 8
  %cm_spawn_slot_ptr77 = getelementptr i8, ptr %cm_spawn_env_malloc55, i64 48
  %cm_spawn_slot78 = bitcast ptr %cm_spawn_slot_ptr77 to ptr
  store ptr %j, ptr %cm_spawn_slot78, align 8
  %cm_spawn_slot_ptr79 = getelementptr i8, ptr %cm_spawn_env_malloc55, i64 56
  %cm_spawn_slot80 = bitcast ptr %cm_spawn_slot_ptr79 to ptr
  store ptr %C.addr, ptr %cm_spawn_slot80, align 8
  %cm_spawn_slot_ptr81 = getelementptr i8, ptr %cm_spawn_env_malloc55, i64 64
  %cm_spawn_slot82 = bitcast ptr %cm_spawn_slot_ptr81 to ptr
  store ptr %k, ptr %cm_spawn_slot82, align 8
  %cm_spawn_slot_ptr83 = getelementptr i8, ptr %cm_spawn_env_malloc55, i64 72
  %cm_spawn_slot84 = bitcast ptr %cm_spawn_slot_ptr83 to ptr
  store ptr %D.addr, ptr %cm_spawn_slot84, align 8
  %cm_spawn_slot_ptr85 = getelementptr i8, ptr %cm_spawn_env_malloc55, i64 80
  %cm_spawn_slot86 = bitcast ptr %cm_spawn_slot_ptr85 to ptr
  store ptr %F.addr, ptr %cm_spawn_slot86, align 8
  %cm_spawn_slot_ptr87 = getelementptr i8, ptr %cm_spawn_env_malloc55, i64 88
  %cm_spawn_slot88 = bitcast ptr %cm_spawn_slot_ptr87 to ptr
  store ptr %nm.addr, ptr %cm_spawn_slot88, align 8
  %cm_spawn_slot_ptr89 = getelementptr i8, ptr %cm_spawn_env_malloc55, i64 96
  %cm_spawn_slot90 = bitcast ptr %cm_spawn_slot_ptr89 to ptr
  store ptr %_RV_bc_flag_105309783246960, ptr %cm_spawn_slot90, align 8
  %cm_spawn_slot_ptr91 = getelementptr i8, ptr %cm_spawn_env_malloc55, i64 104
  %cm_spawn_slot92 = bitcast ptr %cm_spawn_slot_ptr91 to ptr
  store ptr %nl.addr, ptr %cm_spawn_slot92, align 8
  %cm_spawn_slot_ptr93 = getelementptr i8, ptr %cm_spawn_env_malloc55, i64 112
  %cm_spawn_slot94 = bitcast ptr %cm_spawn_slot_ptr93 to ptr
  store ptr %nj.addr, ptr %cm_spawn_slot94, align 8
  %cm_spawn_slot_ptr95 = getelementptr i8, ptr %cm_spawn_env_malloc55, i64 120
  %cm_spawn_slot96 = bitcast ptr %cm_spawn_slot_ptr95 to ptr
  store ptr %_RV_bc_flag_105309783246992, ptr %cm_spawn_slot96, align 8
  %cm_meta_slab_buf97 = call ptr @__catamaran_alloc_env(i64 32)
  %cm_meta_buf_i898 = bitcast ptr %cm_meta_slab_buf97 to ptr
  %cm_meta_src_i899 = bitcast ptr %_RV_pmd_E_105309783237384 to ptr
  call void @__catamaran_copy_metadata(ptr %cm_meta_buf_i898, ptr %cm_meta_src_i899, i64 32)
  %cm_env_slot_meta_ptr100 = getelementptr i8, ptr %cm_spawn_env_malloc55, i64 128
  %cm_env_slot_pptr101 = bitcast ptr %cm_env_slot_meta_ptr100 to ptr
  store ptr %cm_meta_slab_buf97, ptr %cm_env_slot_pptr101, align 8
  %cm_meta_slab_buf102 = call ptr @__catamaran_alloc_env(i64 32)
  %cm_meta_buf_i8103 = bitcast ptr %cm_meta_slab_buf102 to ptr
  %cm_meta_src_i8104 = bitcast ptr %_RV_pmd_A_105309783237800 to ptr
  call void @__catamaran_copy_metadata(ptr %cm_meta_buf_i8103, ptr %cm_meta_src_i8104, i64 32)
  %cm_env_slot_meta_ptr105 = getelementptr i8, ptr %cm_spawn_env_malloc55, i64 136
  %cm_env_slot_pptr106 = bitcast ptr %cm_env_slot_meta_ptr105 to ptr
  store ptr %cm_meta_slab_buf102, ptr %cm_env_slot_pptr106, align 8
  %cm_meta_slab_buf107 = call ptr @__catamaran_alloc_env(i64 32)
  %cm_meta_buf_i8108 = bitcast ptr %cm_meta_slab_buf107 to ptr
  %cm_meta_src_i8109 = bitcast ptr %_RV_pmd_B_105309783238216 to ptr
  call void @__catamaran_copy_metadata(ptr %cm_meta_buf_i8108, ptr %cm_meta_src_i8109, i64 32)
  %cm_env_slot_meta_ptr110 = getelementptr i8, ptr %cm_spawn_env_malloc55, i64 144
  %cm_env_slot_pptr111 = bitcast ptr %cm_env_slot_meta_ptr110 to ptr
  store ptr %cm_meta_slab_buf107, ptr %cm_env_slot_pptr111, align 8
  %cm_meta_slab_buf112 = call ptr @__catamaran_alloc_env(i64 32)
  %cm_meta_buf_i8113 = bitcast ptr %cm_meta_slab_buf112 to ptr
  %cm_meta_src_i8114 = bitcast ptr %_RV_pmd_G_105309783239880 to ptr
  call void @__catamaran_copy_metadata(ptr %cm_meta_buf_i8113, ptr %cm_meta_src_i8114, i64 32)
  %cm_env_slot_meta_ptr115 = getelementptr i8, ptr %cm_spawn_env_malloc55, i64 152
  %cm_env_slot_pptr116 = bitcast ptr %cm_env_slot_meta_ptr115 to ptr
  store ptr %cm_meta_slab_buf112, ptr %cm_env_slot_pptr116, align 8
  call void @_Z5spawnjPFvPvES_(i32 -1219394422, ptr @_spawn_loop_func_92, ptr %cm_spawn_env_malloc55)
  br label %for.cond96

for.cond96:                                       ; preds = %for.inc189, %for.end95
  %46 = load i32, ptr %i, align 4
  %47 = load i32, ptr %nj.addr, align 4
  %cmp97 = icmp slt i32 %46, %47
  br i1 %cmp97, label %for.body99, label %for.end191

for.body99:                                       ; preds = %for.cond96
  store i32 0, ptr %j, align 4
  br label %for.cond100

for.cond100:                                      ; preds = %for.inc173, %for.body99
  %48 = load i32, ptr %j, align 4
  %49 = load i32, ptr %nl.addr, align 4
  %cmp101 = icmp slt i32 %48, %49
  br i1 %cmp101, label %for.body103, label %for.end175

for.body103:                                      ; preds = %for.cond100
  %50 = load ptr, ptr %F.addr, align 8
  %51 = load ptr, ptr %F.addr, align 8
  %52 = load i32, ptr %i, align 4
  %conv104 = sext i32 %52 to i64
  %call105 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_F_105309783238632, ptr noundef %51, i64 noundef %conv104, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 90, i32 noundef 4, ptr noundef @.str.66)
  %arrayidx106 = getelementptr inbounds [1024 x double], ptr %50, i64 %call105
  %53 = load ptr, ptr %F.addr, align 8
  %54 = load i32, ptr %i, align 4
  %idxprom107 = sext i32 %54 to i64
  %arrayidx108 = getelementptr inbounds [1024 x double], ptr %53, i64 %idxprom107
  %arraydecay109 = getelementptr inbounds [1024 x double], ptr %arrayidx108, i64 0, i64 0
  %55 = load i32, ptr %j, align 4
  %conv110 = sext i32 %55 to i64
  %call111 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_F_105309783238632, ptr noundef %arraydecay109, i64 noundef %conv110, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 90, i32 noundef 7, ptr noundef @.str.67)
  %arrayidx112 = getelementptr inbounds [1024 x double], ptr %arrayidx106, i64 0, i64 %call111
  store double 0.000000e+00, ptr %arrayidx112, align 8
  store i32 0, ptr %k, align 4
  br label %for.cond113

for.cond113:                                      ; preds = %for.inc157, %for.body103
  %56 = load i32, ptr %k, align 4
  %57 = load i32, ptr %nm.addr, align 4
  %cmp114 = icmp slt i32 %56, %57
  br i1 %cmp114, label %for.body116, label %for.end159

for.body116:                                      ; preds = %for.cond113
  %58 = load ptr, ptr %C.addr, align 8
  %59 = load ptr, ptr %C.addr, align 8
  %60 = load i32, ptr %i, align 4
  %conv117 = sext i32 %60 to i64
  %call118 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_C_105309783239048, ptr noundef %59, i64 noundef %conv117, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 92, i32 noundef 17, ptr noundef @.str.56)
  %arrayidx119 = getelementptr inbounds [1024 x double], ptr %58, i64 %call118
  %61 = load ptr, ptr %C.addr, align 8
  %62 = load i32, ptr %i, align 4
  %idxprom120 = sext i32 %62 to i64
  %arrayidx121 = getelementptr inbounds [1024 x double], ptr %61, i64 %idxprom120
  %arraydecay122 = getelementptr inbounds [1024 x double], ptr %arrayidx121, i64 0, i64 0
  %63 = load i32, ptr %k, align 4
  %conv123 = sext i32 %63 to i64
  %call124 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_C_105309783239048, ptr noundef %arraydecay122, i64 noundef %conv123, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 92, i32 noundef 20, ptr noundef @.str.68)
  %arrayidx125 = getelementptr inbounds [1024 x double], ptr %arrayidx119, i64 0, i64 %call124
  %64 = load double, ptr %arrayidx125, align 8
  %65 = load ptr, ptr %D.addr, align 8
  %66 = load ptr, ptr %D.addr, align 8
  %67 = load i32, ptr %k, align 4
  %conv126 = sext i32 %67 to i64
  %call127 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_D_105309783239464, ptr noundef %66, i64 noundef %conv126, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 92, i32 noundef 27, ptr noundef @.str.69)
  %arrayidx128 = getelementptr inbounds [1024 x double], ptr %65, i64 %call127
  %68 = load ptr, ptr %D.addr, align 8
  %69 = load i32, ptr %k, align 4
  %idxprom129 = sext i32 %69 to i64
  %arrayidx130 = getelementptr inbounds [1024 x double], ptr %68, i64 %idxprom129
  %arraydecay131 = getelementptr inbounds [1024 x double], ptr %arrayidx130, i64 0, i64 0
  %70 = load i32, ptr %j, align 4
  %conv132 = sext i32 %70 to i64
  %call133 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_D_105309783239464, ptr noundef %arraydecay131, i64 noundef %conv132, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 92, i32 noundef 30, ptr noundef @.str.70)
  %arrayidx134 = getelementptr inbounds [1024 x double], ptr %arrayidx128, i64 0, i64 %call133
  %71 = load double, ptr %arrayidx134, align 8
  %72 = load ptr, ptr %F.addr, align 8
  %73 = load ptr, ptr %F.addr, align 8
  %74 = load i32, ptr %i, align 4
  %conv135 = sext i32 %74 to i64
  %call136 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_F_105309783238632, ptr noundef %73, i64 noundef %conv135, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 92, i32 noundef 6, ptr noundef @.str.66)
  %arrayidx137 = getelementptr inbounds [1024 x double], ptr %72, i64 %call136
  %75 = load ptr, ptr %F.addr, align 8
  %76 = load i32, ptr %i, align 4
  %idxprom138 = sext i32 %76 to i64
  %arrayidx139 = getelementptr inbounds [1024 x double], ptr %75, i64 %idxprom138
  %arraydecay140 = getelementptr inbounds [1024 x double], ptr %arrayidx139, i64 0, i64 0
  %77 = load i32, ptr %j, align 4
  %conv141 = sext i32 %77 to i64
  %call142 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_F_105309783238632, ptr noundef %arraydecay140, i64 noundef %conv141, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 92, i32 noundef 9, ptr noundef @.str.67)
  %arrayidx143 = getelementptr inbounds [1024 x double], ptr %arrayidx137, i64 0, i64 %call142
  %78 = load double, ptr %arrayidx143, align 8
  %79 = call double @llvm.fmuladd.f64(double %64, double %71, double %78)
  store double %79, ptr %arrayidx143, align 8
  br label %_RV_lbl_105309783246856

_RV_lbl_105309783246856:                          ; preds = %for.body116
  %80 = load i8, ptr %_RV_ret_flag, align 1
  %tobool144 = icmp ne i8 %80, 0
  br i1 %tobool144, label %if.then145, label %if.end146

if.then145:                                       ; preds = %_RV_lbl_105309783246856
  br label %_RV_lbl_105309783246960

if.end146:                                        ; preds = %_RV_lbl_105309783246856
  %81 = load i8, ptr %_RV_bc_flag_105309783246856, align 1
  %conv147 = zext i8 %81 to i32
  %cmp148 = icmp eq i32 %conv147, 1
  br i1 %cmp148, label %if.then150, label %if.end151

if.then150:                                       ; preds = %if.end146
  store i8 0, ptr %_RV_bc_flag_105309783246856, align 1
  br label %for.end159

if.end151:                                        ; preds = %if.end146
  %82 = load i8, ptr %_RV_bc_flag_105309783246856, align 1
  %conv152 = zext i8 %82 to i32
  %cmp153 = icmp eq i32 %conv152, 2
  br i1 %cmp153, label %if.then155, label %if.end156

if.then155:                                       ; preds = %if.end151
  store i8 0, ptr %_RV_bc_flag_105309783246856, align 1
  br label %if.end156

if.end156:                                        ; preds = %if.then155, %if.end151
  br label %for.inc157

for.inc157:                                       ; preds = %if.end156
  %83 = load i32, ptr %k, align 4
  %inc158 = add nsw i32 %83, 1
  store i32 %inc158, ptr %k, align 4
  br label %for.cond113, !llvm.loop !62

for.end159:                                       ; preds = %if.then150, %for.cond113
  br label %_RV_lbl_105309783246960

_RV_lbl_105309783246960:                          ; preds = %for.end159, %if.then145
  %84 = load i8, ptr %_RV_ret_flag, align 1
  %tobool160 = icmp ne i8 %84, 0
  br i1 %tobool160, label %if.then161, label %if.end162

if.then161:                                       ; preds = %_RV_lbl_105309783246960
  br label %_RV_lbl_105309783246992

if.end162:                                        ; preds = %_RV_lbl_105309783246960
  %85 = load i8, ptr %_RV_bc_flag_105309783246960, align 1
  %conv163 = zext i8 %85 to i32
  %cmp164 = icmp eq i32 %conv163, 1
  br i1 %cmp164, label %if.then166, label %if.end167

if.then166:                                       ; preds = %if.end162
  store i8 0, ptr %_RV_bc_flag_105309783246960, align 1
  br label %for.end175

if.end167:                                        ; preds = %if.end162
  %86 = load i8, ptr %_RV_bc_flag_105309783246960, align 1
  %conv168 = zext i8 %86 to i32
  %cmp169 = icmp eq i32 %conv168, 2
  br i1 %cmp169, label %if.then171, label %if.end172

if.then171:                                       ; preds = %if.end167
  store i8 0, ptr %_RV_bc_flag_105309783246960, align 1
  br label %if.end172

if.end172:                                        ; preds = %if.then171, %if.end167
  br label %for.inc173

for.inc173:                                       ; preds = %if.end172
  %87 = load i32, ptr %j, align 4
  %inc174 = add nsw i32 %87, 1
  store i32 %inc174, ptr %j, align 4
  br label %for.cond100, !llvm.loop !63

for.end175:                                       ; preds = %if.then166, %for.cond100
  br label %_RV_lbl_105309783246992

_RV_lbl_105309783246992:                          ; preds = %for.end175, %if.then161
  %88 = load i8, ptr %_RV_ret_flag, align 1
  %tobool176 = icmp ne i8 %88, 0
  br i1 %tobool176, label %if.then177, label %if.end178

if.then177:                                       ; preds = %_RV_lbl_105309783246992
  br label %_RV_lbl_105309783249432

if.end178:                                        ; preds = %_RV_lbl_105309783246992
  %89 = load i8, ptr %_RV_bc_flag_105309783246992, align 1
  %conv179 = zext i8 %89 to i32
  %cmp180 = icmp eq i32 %conv179, 1
  br i1 %cmp180, label %if.then182, label %if.end183

if.then182:                                       ; preds = %if.end178
  store i8 0, ptr %_RV_bc_flag_105309783246992, align 1
  br label %for.end191

if.end183:                                        ; preds = %if.end178
  %90 = load i8, ptr %_RV_bc_flag_105309783246992, align 1
  %conv184 = zext i8 %90 to i32
  %cmp185 = icmp eq i32 %conv184, 2
  br i1 %cmp185, label %if.then187, label %if.end188

if.then187:                                       ; preds = %if.end183
  store i8 0, ptr %_RV_bc_flag_105309783246992, align 1
  br label %if.end188

if.end188:                                        ; preds = %if.then187, %if.end183
  br label %for.inc189

for.inc189:                                       ; preds = %if.end188
  %91 = load i32, ptr %i, align 4
  %inc190 = add nsw i32 %91, 1
  store i32 %inc190, ptr %i, align 4
  br label %for.cond96, !llvm.loop !64

for.end191:                                       ; preds = %if.then182, %for.cond96
  store i32 0, ptr %i, align 4
  %cm_spawn_env_malloc = call ptr @__catamaran_alloc_env(i64 160)
  %cm_meta_slab_buf = call ptr @__catamaran_alloc_env(i64 32)
  %cm_meta_buf_i8 = bitcast ptr %cm_meta_slab_buf to ptr
  %cm_meta_src_i8 = bitcast ptr %_RV_pmd_E_105309783237384 to ptr
  call void @__catamaran_copy_metadata(ptr %cm_meta_buf_i8, ptr %cm_meta_src_i8, i64 32)
  %cm_env_slot_meta_ptr = getelementptr i8, ptr %cm_spawn_env_malloc, i64 0
  %cm_env_slot_pptr = bitcast ptr %cm_env_slot_meta_ptr to ptr
  store ptr %cm_meta_slab_buf, ptr %cm_env_slot_pptr, align 8
  %cm_meta_slab_buf1 = call ptr @__catamaran_alloc_env(i64 32)
  %cm_meta_buf_i82 = bitcast ptr %cm_meta_slab_buf1 to ptr
  %cm_meta_src_i83 = bitcast ptr %_RV_pmd_F_105309783238632 to ptr
  call void @__catamaran_copy_metadata(ptr %cm_meta_buf_i82, ptr %cm_meta_src_i83, i64 32)
  %cm_env_slot_meta_ptr4 = getelementptr i8, ptr %cm_spawn_env_malloc, i64 8
  %cm_env_slot_pptr5 = bitcast ptr %cm_env_slot_meta_ptr4 to ptr
  store ptr %cm_meta_slab_buf1, ptr %cm_env_slot_pptr5, align 8
  %cm_meta_slab_buf6 = call ptr @__catamaran_alloc_env(i64 32)
  %cm_meta_buf_i87 = bitcast ptr %cm_meta_slab_buf6 to ptr
  %cm_meta_src_i88 = bitcast ptr %_RV_pmd_G_105309783239880 to ptr
  call void @__catamaran_copy_metadata(ptr %cm_meta_buf_i87, ptr %cm_meta_src_i88, i64 32)
  %cm_env_slot_meta_ptr9 = getelementptr i8, ptr %cm_spawn_env_malloc, i64 16
  %cm_env_slot_pptr10 = bitcast ptr %cm_env_slot_meta_ptr9 to ptr
  store ptr %cm_meta_slab_buf6, ptr %cm_env_slot_pptr10, align 8
  %cm_spawn_slot_ptr = getelementptr i8, ptr %cm_spawn_env_malloc, i64 24
  %cm_spawn_slot = bitcast ptr %cm_spawn_slot_ptr to ptr
  store ptr %_RV_bc_flag_105309783249184, ptr %cm_spawn_slot, align 8
  %cm_spawn_slot_ptr11 = getelementptr i8, ptr %cm_spawn_env_malloc, i64 32
  %cm_spawn_slot12 = bitcast ptr %cm_spawn_slot_ptr11 to ptr
  store ptr %k, ptr %cm_spawn_slot12, align 8
  %cm_spawn_slot_ptr13 = getelementptr i8, ptr %cm_spawn_env_malloc, i64 40
  %cm_spawn_slot14 = bitcast ptr %cm_spawn_slot_ptr13 to ptr
  store ptr %E.addr, ptr %cm_spawn_slot14, align 8
  %cm_spawn_slot_ptr15 = getelementptr i8, ptr %cm_spawn_env_malloc, i64 48
  %cm_spawn_slot16 = bitcast ptr %cm_spawn_slot_ptr15 to ptr
  store ptr %i, ptr %cm_spawn_slot16, align 8
  %cm_spawn_slot_ptr17 = getelementptr i8, ptr %cm_spawn_env_malloc, i64 56
  %cm_spawn_slot18 = bitcast ptr %cm_spawn_slot_ptr17 to ptr
  store ptr %F.addr, ptr %cm_spawn_slot18, align 8
  %cm_spawn_slot_ptr19 = getelementptr i8, ptr %cm_spawn_env_malloc, i64 64
  %cm_spawn_slot20 = bitcast ptr %cm_spawn_slot_ptr19 to ptr
  store ptr %j, ptr %cm_spawn_slot20, align 8
  %cm_spawn_slot_ptr21 = getelementptr i8, ptr %cm_spawn_env_malloc, i64 72
  %cm_spawn_slot22 = bitcast ptr %cm_spawn_slot_ptr21 to ptr
  store ptr %G.addr, ptr %cm_spawn_slot22, align 8
  %cm_spawn_slot_ptr23 = getelementptr i8, ptr %cm_spawn_env_malloc, i64 80
  %cm_spawn_slot24 = bitcast ptr %cm_spawn_slot_ptr23 to ptr
  store ptr %_RV_bc_flag_105309783249320, ptr %cm_spawn_slot24, align 8
  %cm_spawn_slot_ptr25 = getelementptr i8, ptr %cm_spawn_env_malloc, i64 88
  %cm_spawn_slot26 = bitcast ptr %cm_spawn_slot_ptr25 to ptr
  store ptr %nj.addr, ptr %cm_spawn_slot26, align 8
  %cm_spawn_slot_ptr27 = getelementptr i8, ptr %cm_spawn_env_malloc, i64 96
  %cm_spawn_slot28 = bitcast ptr %cm_spawn_slot_ptr27 to ptr
  store ptr %_RV_ret_flag, ptr %cm_spawn_slot28, align 8
  %cm_spawn_slot_ptr29 = getelementptr i8, ptr %cm_spawn_env_malloc, i64 104
  %cm_spawn_slot30 = bitcast ptr %cm_spawn_slot_ptr29 to ptr
  store ptr %nl.addr, ptr %cm_spawn_slot30, align 8
  %cm_spawn_slot_ptr31 = getelementptr i8, ptr %cm_spawn_env_malloc, i64 112
  %cm_spawn_slot32 = bitcast ptr %cm_spawn_slot_ptr31 to ptr
  store ptr %ni.addr, ptr %cm_spawn_slot32, align 8
  %cm_spawn_slot_ptr33 = getelementptr i8, ptr %cm_spawn_env_malloc, i64 120
  %cm_spawn_slot34 = bitcast ptr %cm_spawn_slot_ptr33 to ptr
  store ptr %_RV_bc_flag_105309783249288, ptr %cm_spawn_slot34, align 8
  %cm_meta_slab_buf35 = call ptr @__catamaran_alloc_env(i64 32)
  %cm_meta_buf_i836 = bitcast ptr %cm_meta_slab_buf35 to ptr
  %cm_meta_src_i837 = bitcast ptr %_RV_pmd_A_105309783237800 to ptr
  call void @__catamaran_copy_metadata(ptr %cm_meta_buf_i836, ptr %cm_meta_src_i837, i64 32)
  %cm_env_slot_meta_ptr38 = getelementptr i8, ptr %cm_spawn_env_malloc, i64 128
  %cm_env_slot_pptr39 = bitcast ptr %cm_env_slot_meta_ptr38 to ptr
  store ptr %cm_meta_slab_buf35, ptr %cm_env_slot_pptr39, align 8
  %cm_meta_slab_buf40 = call ptr @__catamaran_alloc_env(i64 32)
  %cm_meta_buf_i841 = bitcast ptr %cm_meta_slab_buf40 to ptr
  %cm_meta_src_i842 = bitcast ptr %_RV_pmd_B_105309783238216 to ptr
  call void @__catamaran_copy_metadata(ptr %cm_meta_buf_i841, ptr %cm_meta_src_i842, i64 32)
  %cm_env_slot_meta_ptr43 = getelementptr i8, ptr %cm_spawn_env_malloc, i64 136
  %cm_env_slot_pptr44 = bitcast ptr %cm_env_slot_meta_ptr43 to ptr
  store ptr %cm_meta_slab_buf40, ptr %cm_env_slot_pptr44, align 8
  %cm_meta_slab_buf45 = call ptr @__catamaran_alloc_env(i64 32)
  %cm_meta_buf_i846 = bitcast ptr %cm_meta_slab_buf45 to ptr
  %cm_meta_src_i847 = bitcast ptr %_RV_pmd_C_105309783239048 to ptr
  call void @__catamaran_copy_metadata(ptr %cm_meta_buf_i846, ptr %cm_meta_src_i847, i64 32)
  %cm_env_slot_meta_ptr48 = getelementptr i8, ptr %cm_spawn_env_malloc, i64 144
  %cm_env_slot_pptr49 = bitcast ptr %cm_env_slot_meta_ptr48 to ptr
  store ptr %cm_meta_slab_buf45, ptr %cm_env_slot_pptr49, align 8
  %cm_meta_slab_buf50 = call ptr @__catamaran_alloc_env(i64 32)
  %cm_meta_buf_i851 = bitcast ptr %cm_meta_slab_buf50 to ptr
  %cm_meta_src_i852 = bitcast ptr %_RV_pmd_D_105309783239464 to ptr
  call void @__catamaran_copy_metadata(ptr %cm_meta_buf_i851, ptr %cm_meta_src_i852, i64 32)
  %cm_env_slot_meta_ptr53 = getelementptr i8, ptr %cm_spawn_env_malloc, i64 152
  %cm_env_slot_pptr54 = bitcast ptr %cm_env_slot_meta_ptr53 to ptr
  store ptr %cm_meta_slab_buf50, ptr %cm_env_slot_pptr54, align 8
  call void @_Z5spawnjPFvPvES_(i32 1239423707, ptr @_spawn_loop_func_86, ptr %cm_spawn_env_malloc)
  br label %for.cond192

for.cond192:                                      ; preds = %for.inc285, %for.end191
  %92 = load i32, ptr %i, align 4
  %93 = load i32, ptr %ni.addr, align 4
  %cmp193 = icmp slt i32 %92, %93
  br i1 %cmp193, label %for.body195, label %for.end287

for.body195:                                      ; preds = %for.cond192
  store i32 0, ptr %j, align 4
  br label %for.cond196

for.cond196:                                      ; preds = %for.inc269, %for.body195
  %94 = load i32, ptr %j, align 4
  %95 = load i32, ptr %nl.addr, align 4
  %cmp197 = icmp slt i32 %94, %95
  br i1 %cmp197, label %for.body199, label %for.end271

for.body199:                                      ; preds = %for.cond196
  %96 = load ptr, ptr %G.addr, align 8
  %97 = load ptr, ptr %G.addr, align 8
  %98 = load i32, ptr %i, align 4
  %conv200 = sext i32 %98 to i64
  %call201 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_G_105309783239880, ptr noundef %97, i64 noundef %conv200, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 98, i32 noundef 4, ptr noundef @.str.71)
  %arrayidx202 = getelementptr inbounds [1024 x double], ptr %96, i64 %call201
  %99 = load ptr, ptr %G.addr, align 8
  %100 = load i32, ptr %i, align 4
  %idxprom203 = sext i32 %100 to i64
  %arrayidx204 = getelementptr inbounds [1024 x double], ptr %99, i64 %idxprom203
  %arraydecay205 = getelementptr inbounds [1024 x double], ptr %arrayidx204, i64 0, i64 0
  %101 = load i32, ptr %j, align 4
  %conv206 = sext i32 %101 to i64
  %call207 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_G_105309783239880, ptr noundef %arraydecay205, i64 noundef %conv206, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 98, i32 noundef 7, ptr noundef @.str.72)
  %arrayidx208 = getelementptr inbounds [1024 x double], ptr %arrayidx202, i64 0, i64 %call207
  store double 0.000000e+00, ptr %arrayidx208, align 8
  store i32 0, ptr %k, align 4
  br label %for.cond209

for.cond209:                                      ; preds = %for.inc253, %for.body199
  %102 = load i32, ptr %k, align 4
  %103 = load i32, ptr %nj.addr, align 4
  %cmp210 = icmp slt i32 %102, %103
  br i1 %cmp210, label %for.body212, label %for.end255

for.body212:                                      ; preds = %for.cond209
  %104 = load ptr, ptr %E.addr, align 8
  %105 = load ptr, ptr %E.addr, align 8
  %106 = load i32, ptr %i, align 4
  %conv213 = sext i32 %106 to i64
  %call214 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_E_105309783237384, ptr noundef %105, i64 noundef %conv213, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 100, i32 noundef 17, ptr noundef @.str.61)
  %arrayidx215 = getelementptr inbounds [1024 x double], ptr %104, i64 %call214
  %107 = load ptr, ptr %E.addr, align 8
  %108 = load i32, ptr %i, align 4
  %idxprom216 = sext i32 %108 to i64
  %arrayidx217 = getelementptr inbounds [1024 x double], ptr %107, i64 %idxprom216
  %arraydecay218 = getelementptr inbounds [1024 x double], ptr %arrayidx217, i64 0, i64 0
  %109 = load i32, ptr %k, align 4
  %conv219 = sext i32 %109 to i64
  %call220 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_E_105309783237384, ptr noundef %arraydecay218, i64 noundef %conv219, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 100, i32 noundef 20, ptr noundef @.str.73)
  %arrayidx221 = getelementptr inbounds [1024 x double], ptr %arrayidx215, i64 0, i64 %call220
  %110 = load double, ptr %arrayidx221, align 8
  %111 = load ptr, ptr %F.addr, align 8
  %112 = load ptr, ptr %F.addr, align 8
  %113 = load i32, ptr %k, align 4
  %conv222 = sext i32 %113 to i64
  %call223 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_F_105309783238632, ptr noundef %112, i64 noundef %conv222, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 100, i32 noundef 27, ptr noundef @.str.74)
  %arrayidx224 = getelementptr inbounds [1024 x double], ptr %111, i64 %call223
  %114 = load ptr, ptr %F.addr, align 8
  %115 = load i32, ptr %k, align 4
  %idxprom225 = sext i32 %115 to i64
  %arrayidx226 = getelementptr inbounds [1024 x double], ptr %114, i64 %idxprom225
  %arraydecay227 = getelementptr inbounds [1024 x double], ptr %arrayidx226, i64 0, i64 0
  %116 = load i32, ptr %j, align 4
  %conv228 = sext i32 %116 to i64
  %call229 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_F_105309783238632, ptr noundef %arraydecay227, i64 noundef %conv228, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 100, i32 noundef 30, ptr noundef @.str.75)
  %arrayidx230 = getelementptr inbounds [1024 x double], ptr %arrayidx224, i64 0, i64 %call229
  %117 = load double, ptr %arrayidx230, align 8
  %118 = load ptr, ptr %G.addr, align 8
  %119 = load ptr, ptr %G.addr, align 8
  %120 = load i32, ptr %i, align 4
  %conv231 = sext i32 %120 to i64
  %call232 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_G_105309783239880, ptr noundef %119, i64 noundef %conv231, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 100, i32 noundef 6, ptr noundef @.str.71)
  %arrayidx233 = getelementptr inbounds [1024 x double], ptr %118, i64 %call232
  %121 = load ptr, ptr %G.addr, align 8
  %122 = load i32, ptr %i, align 4
  %idxprom234 = sext i32 %122 to i64
  %arrayidx235 = getelementptr inbounds [1024 x double], ptr %121, i64 %idxprom234
  %arraydecay236 = getelementptr inbounds [1024 x double], ptr %arrayidx235, i64 0, i64 0
  %123 = load i32, ptr %j, align 4
  %conv237 = sext i32 %123 to i64
  %call238 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_G_105309783239880, ptr noundef %arraydecay236, i64 noundef %conv237, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 100, i32 noundef 9, ptr noundef @.str.72)
  %arrayidx239 = getelementptr inbounds [1024 x double], ptr %arrayidx233, i64 0, i64 %call238
  %124 = load double, ptr %arrayidx239, align 8
  %125 = call double @llvm.fmuladd.f64(double %110, double %117, double %124)
  store double %125, ptr %arrayidx239, align 8
  br label %_RV_lbl_105309783249184

_RV_lbl_105309783249184:                          ; preds = %for.body212
  %126 = load i8, ptr %_RV_ret_flag, align 1
  %tobool240 = icmp ne i8 %126, 0
  br i1 %tobool240, label %if.then241, label %if.end242

if.then241:                                       ; preds = %_RV_lbl_105309783249184
  br label %_RV_lbl_105309783249288

if.end242:                                        ; preds = %_RV_lbl_105309783249184
  %127 = load i8, ptr %_RV_bc_flag_105309783249184, align 1
  %conv243 = zext i8 %127 to i32
  %cmp244 = icmp eq i32 %conv243, 1
  br i1 %cmp244, label %if.then246, label %if.end247

if.then246:                                       ; preds = %if.end242
  store i8 0, ptr %_RV_bc_flag_105309783249184, align 1
  br label %for.end255

if.end247:                                        ; preds = %if.end242
  %128 = load i8, ptr %_RV_bc_flag_105309783249184, align 1
  %conv248 = zext i8 %128 to i32
  %cmp249 = icmp eq i32 %conv248, 2
  br i1 %cmp249, label %if.then251, label %if.end252

if.then251:                                       ; preds = %if.end247
  store i8 0, ptr %_RV_bc_flag_105309783249184, align 1
  br label %if.end252

if.end252:                                        ; preds = %if.then251, %if.end247
  br label %for.inc253

for.inc253:                                       ; preds = %if.end252
  %129 = load i32, ptr %k, align 4
  %inc254 = add nsw i32 %129, 1
  store i32 %inc254, ptr %k, align 4
  br label %for.cond209, !llvm.loop !65

for.end255:                                       ; preds = %if.then246, %for.cond209
  br label %_RV_lbl_105309783249288

_RV_lbl_105309783249288:                          ; preds = %for.end255, %if.then241
  %130 = load i8, ptr %_RV_ret_flag, align 1
  %tobool256 = icmp ne i8 %130, 0
  br i1 %tobool256, label %if.then257, label %if.end258

if.then257:                                       ; preds = %_RV_lbl_105309783249288
  br label %_RV_lbl_105309783249320

if.end258:                                        ; preds = %_RV_lbl_105309783249288
  %131 = load i8, ptr %_RV_bc_flag_105309783249288, align 1
  %conv259 = zext i8 %131 to i32
  %cmp260 = icmp eq i32 %conv259, 1
  br i1 %cmp260, label %if.then262, label %if.end263

if.then262:                                       ; preds = %if.end258
  store i8 0, ptr %_RV_bc_flag_105309783249288, align 1
  br label %for.end271

if.end263:                                        ; preds = %if.end258
  %132 = load i8, ptr %_RV_bc_flag_105309783249288, align 1
  %conv264 = zext i8 %132 to i32
  %cmp265 = icmp eq i32 %conv264, 2
  br i1 %cmp265, label %if.then267, label %if.end268

if.then267:                                       ; preds = %if.end263
  store i8 0, ptr %_RV_bc_flag_105309783249288, align 1
  br label %if.end268

if.end268:                                        ; preds = %if.then267, %if.end263
  br label %for.inc269

for.inc269:                                       ; preds = %if.end268
  %133 = load i32, ptr %j, align 4
  %inc270 = add nsw i32 %133, 1
  store i32 %inc270, ptr %j, align 4
  br label %for.cond196, !llvm.loop !66

for.end271:                                       ; preds = %if.then262, %for.cond196
  br label %_RV_lbl_105309783249320

_RV_lbl_105309783249320:                          ; preds = %for.end271, %if.then257
  %134 = load i8, ptr %_RV_ret_flag, align 1
  %tobool272 = icmp ne i8 %134, 0
  br i1 %tobool272, label %if.then273, label %if.end274

if.then273:                                       ; preds = %_RV_lbl_105309783249320
  br label %_RV_lbl_105309783249432

if.end274:                                        ; preds = %_RV_lbl_105309783249320
  %135 = load i8, ptr %_RV_bc_flag_105309783249320, align 1
  %conv275 = zext i8 %135 to i32
  %cmp276 = icmp eq i32 %conv275, 1
  br i1 %cmp276, label %if.then278, label %if.end279

if.then278:                                       ; preds = %if.end274
  store i8 0, ptr %_RV_bc_flag_105309783249320, align 1
  br label %for.end287

if.end279:                                        ; preds = %if.end274
  %136 = load i8, ptr %_RV_bc_flag_105309783249320, align 1
  %conv280 = zext i8 %136 to i32
  %cmp281 = icmp eq i32 %conv280, 2
  br i1 %cmp281, label %if.then283, label %if.end284

if.then283:                                       ; preds = %if.end279
  store i8 0, ptr %_RV_bc_flag_105309783249320, align 1
  br label %if.end284

if.end284:                                        ; preds = %if.then283, %if.end279
  br label %for.inc285

for.inc285:                                       ; preds = %if.end284
  %137 = load i32, ptr %i, align 4
  %inc286 = add nsw i32 %137, 1
  store i32 %inc286, ptr %i, align 4
  br label %for.cond192, !llvm.loop !67

for.end287:                                       ; preds = %if.then278, %for.cond192
  br label %_RV_lbl_105309783249432

_RV_lbl_105309783249432:                          ; preds = %for.end287, %if.then273, %if.then177, %if.then81
  call void @_Z4joinj(i32 1239423707)
  call void @__catamaran_reset_slab()
  call void @_Z4joinj(i32 -1219394422)
  call void @__catamaran_reset_slab()
  call void @_Z4joinj(i32 -1051946945)
  call void @__catamaran_reset_slab()
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_E_105309783237384)
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_A_105309783237800)
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_B_105309783238216)
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_F_105309783238632)
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_C_105309783239048)
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_D_105309783239464)
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_G_105309783239880)
  %138 = load ptr, ptr %__RV_stack_sa, align 8
  %stat = getelementptr inbounds %struct.__RV_stat_node, ptr %138, i32 0, i32 0
  store i32 0, ptr %stat, align 8
  %139 = load ptr, ptr %__RV_stack_sa, align 8
  %call288 = call i32 @__RV_stat_node_dec(ptr noundef %139)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #11

; Function Attrs: noinline nounwind optnone uwtable
define internal void @print_array(i32 noundef %ni, i32 noundef %nl, ptr noundef %G) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %G.addr = alloca ptr, align 8
  %__RV_stack_sa = alloca ptr, align 8
  %_RV_ret_flag = alloca i8, align 1
  %_RV_bc_flag_105309783235992 = alloca i8, align 1
  %_RV_bc_flag_105309783235960 = alloca i8, align 1
  %_RV_pmd_G_105309783229056 = alloca %struct.__RV_pmd, align 8
  %_RV_param_pmds = alloca ptr, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, ptr %ni.addr, align 4
  store i32 %nl, ptr %nl.addr, align 4
  store ptr %G, ptr %G.addr, align 8
  %call = call ptr @__RV_stat_node_create(i32 noundef 5, i64 noundef 1)
  store ptr %call, ptr %__RV_stack_sa, align 8
  store i8 0, ptr %_RV_ret_flag, align 1
  store i8 0, ptr %_RV_bc_flag_105309783235992, align 1
  store i8 0, ptr %_RV_bc_flag_105309783235960, align 1
  call void @llvm.memset.p0.i64(ptr align 8 %_RV_pmd_G_105309783229056, i8 0, i64 32, i1 false)
  %call1 = call ptr @__RV_fmd_tbl_lookup_fpmd(ptr noundef @print_array, i8 noundef zeroext 0)
  %call2 = call ptr @__RV_pmd_cp_fmd_pmd(ptr noundef %_RV_pmd_G_105309783229056, ptr noundef %call1)
  store ptr %call2, ptr %_RV_param_pmds, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc55, %entry
  %0 = load i32, ptr %i, align 4
  %1 = load i32, ptr %ni.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end57

for.body:                                         ; preds = %for.cond
  store i32 0, ptr %j, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc, %for.body
  %2 = load i32, ptr %j, align 4
  %3 = load i32, ptr %nl.addr, align 4
  %cmp4 = icmp slt i32 %2, %3
  br i1 %cmp4, label %for.body5, label %for.end

for.body5:                                        ; preds = %for.cond3
  %call6 = call ptr @__RV_pmd_tbl_lookup(ptr noundef @stderr)
  %4 = load ptr, ptr @__RV_global_sa, align 8
  %call7 = call ptr @__RV_pmd_create(ptr noundef null, ptr noundef %4, i32 noundef 2, ptr noundef @.str.76, ptr noundef getelementptr inbounds (i8, ptr @.str.76, i64 8))
  %5 = load ptr, ptr @stderr, align 8
  %6 = load ptr, ptr %G.addr, align 8
  %7 = load ptr, ptr %G.addr, align 8
  %8 = load i32, ptr %i, align 4
  %conv = sext i32 %8 to i64
  %call8 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_G_105309783229056, ptr noundef %7, i64 noundef %conv, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.77, i32 noundef 56, i32 noundef 43, ptr noundef @.str.71)
  %arrayidx = getelementptr inbounds [1024 x double], ptr %6, i64 %call8
  %9 = load ptr, ptr %G.addr, align 8
  %10 = load i32, ptr %i, align 4
  %idxprom = sext i32 %10 to i64
  %arrayidx9 = getelementptr inbounds [1024 x double], ptr %9, i64 %idxprom
  %arraydecay = getelementptr inbounds [1024 x double], ptr %arrayidx9, i64 0, i64 0
  %11 = load i32, ptr %j, align 4
  %conv10 = sext i32 %11 to i64
  %call11 = call i64 @__RV_check_dpv_ss(ptr noundef %_RV_pmd_G_105309783229056, ptr noundef %arraydecay, i64 noundef %conv10, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.77, i32 noundef 56, i32 noundef 46, ptr noundef @.str.72)
  %arrayidx12 = getelementptr inbounds [1024 x double], ptr %arrayidx, i64 0, i64 %call11
  %12 = load double, ptr %arrayidx12, align 8
  %call13 = call i32 @_RV_fprintf_105309783230944(ptr noundef %call6, ptr noundef %call7, ptr noundef %5, ptr noundef @.str.76, double noundef %12)
  %13 = load i32, ptr %i, align 4
  %14 = load i32, ptr %ni.addr, align 4
  %mul = mul nsw i32 %13, %14
  %15 = load i32, ptr %j, align 4
  %add = add nsw i32 %mul, %15
  %rem = srem i32 %add, 20
  %cmp14 = icmp eq i32 %rem, 0
  br i1 %cmp14, label %if.then, label %if.end28

if.then:                                          ; preds = %for.body5
  %call16 = call ptr @__RV_pmd_tbl_lookup(ptr noundef @stderr)
  %16 = load ptr, ptr @__RV_global_sa, align 8
  %call17 = call ptr @__RV_pmd_create(ptr noundef null, ptr noundef %16, i32 noundef 2, ptr noundef @.str.78, ptr noundef getelementptr inbounds (i8, ptr @.str.78, i64 2))
  %17 = load ptr, ptr @stderr, align 8
  %call18 = call i32 @_RV_fprintf_105309783235808(ptr noundef %call16, ptr noundef %call17, ptr noundef %17, ptr noundef @.str.78)
  br label %_RV_lbl_105309783235808

_RV_lbl_105309783235808:                          ; preds = %if.then
  %18 = load i8, ptr %_RV_ret_flag, align 1
  %tobool = icmp ne i8 %18, 0
  br i1 %tobool, label %if.then19, label %if.end

if.then19:                                        ; preds = %_RV_lbl_105309783235808
  br label %_RV_lbl_105309783235960

if.end:                                           ; preds = %_RV_lbl_105309783235808
  %19 = load i8, ptr %_RV_bc_flag_105309783235960, align 1
  %conv20 = zext i8 %19 to i32
  %cmp21 = icmp eq i32 %conv20, 1
  br i1 %cmp21, label %if.then26, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %20 = load i8, ptr %_RV_bc_flag_105309783235960, align 1
  %conv23 = zext i8 %20 to i32
  %cmp24 = icmp eq i32 %conv23, 2
  br i1 %cmp24, label %if.then26, label %if.end27

if.then26:                                        ; preds = %lor.lhs.false, %if.end
  br label %_RV_lbl_105309783235960

if.end27:                                         ; preds = %lor.lhs.false
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %for.body5
  br label %_RV_lbl_105309783235960

_RV_lbl_105309783235960:                          ; preds = %if.end28, %if.then26, %if.then19
  %21 = load i8, ptr %_RV_ret_flag, align 1
  %tobool29 = icmp ne i8 %21, 0
  br i1 %tobool29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %_RV_lbl_105309783235960
  br label %_RV_lbl_105309783235992

if.end31:                                         ; preds = %_RV_lbl_105309783235960
  %22 = load i8, ptr %_RV_bc_flag_105309783235960, align 1
  %conv32 = zext i8 %22 to i32
  %cmp33 = icmp eq i32 %conv32, 1
  br i1 %cmp33, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.end31
  store i8 0, ptr %_RV_bc_flag_105309783235960, align 1
  br label %for.end

if.end36:                                         ; preds = %if.end31
  %23 = load i8, ptr %_RV_bc_flag_105309783235960, align 1
  %conv37 = zext i8 %23 to i32
  %cmp38 = icmp eq i32 %conv37, 2
  br i1 %cmp38, label %if.then40, label %if.end41

if.then40:                                        ; preds = %if.end36
  store i8 0, ptr %_RV_bc_flag_105309783235960, align 1
  br label %if.end41

if.end41:                                         ; preds = %if.then40, %if.end36
  br label %for.inc

for.inc:                                          ; preds = %if.end41
  %24 = load i32, ptr %j, align 4
  %inc = add nsw i32 %24, 1
  store i32 %inc, ptr %j, align 4
  br label %for.cond3, !llvm.loop !68

for.end:                                          ; preds = %if.then35, %for.cond3
  br label %_RV_lbl_105309783235992

_RV_lbl_105309783235992:                          ; preds = %for.end, %if.then30
  %25 = load i8, ptr %_RV_ret_flag, align 1
  %tobool42 = icmp ne i8 %25, 0
  br i1 %tobool42, label %if.then43, label %if.end44

if.then43:                                        ; preds = %_RV_lbl_105309783235992
  br label %_RV_lbl_105309783236392

if.end44:                                         ; preds = %_RV_lbl_105309783235992
  %26 = load i8, ptr %_RV_bc_flag_105309783235992, align 1
  %conv45 = zext i8 %26 to i32
  %cmp46 = icmp eq i32 %conv45, 1
  br i1 %cmp46, label %if.then48, label %if.end49

if.then48:                                        ; preds = %if.end44
  store i8 0, ptr %_RV_bc_flag_105309783235992, align 1
  br label %for.end57

if.end49:                                         ; preds = %if.end44
  %27 = load i8, ptr %_RV_bc_flag_105309783235992, align 1
  %conv50 = zext i8 %27 to i32
  %cmp51 = icmp eq i32 %conv50, 2
  br i1 %cmp51, label %if.then53, label %if.end54

if.then53:                                        ; preds = %if.end49
  store i8 0, ptr %_RV_bc_flag_105309783235992, align 1
  br label %if.end54

if.end54:                                         ; preds = %if.then53, %if.end49
  br label %for.inc55

for.inc55:                                        ; preds = %if.end54
  %28 = load i32, ptr %i, align 4
  %inc56 = add nsw i32 %28, 1
  store i32 %inc56, ptr %i, align 4
  br label %for.cond, !llvm.loop !69

for.end57:                                        ; preds = %if.then48, %for.cond
  %call58 = call ptr @__RV_pmd_tbl_lookup(ptr noundef @stderr)
  %29 = load ptr, ptr @__RV_global_sa, align 8
  %call59 = call ptr @__RV_pmd_create(ptr noundef null, ptr noundef %29, i32 noundef 2, ptr noundef @.str.78, ptr noundef getelementptr inbounds (i8, ptr @.str.78, i64 2))
  %30 = load ptr, ptr @stderr, align 8
  %call60 = call i32 @_RV_fprintf_105309783236272(ptr noundef %call58, ptr noundef %call59, ptr noundef %30, ptr noundef @.str.78)
  br label %_RV_lbl_105309783236392

_RV_lbl_105309783236392:                          ; preds = %for.end57, %if.then43
  call void @__RV_pmd_set_null(ptr noundef %_RV_pmd_G_105309783229056)
  %31 = load ptr, ptr %__RV_stack_sa, align 8
  %stat = getelementptr inbounds %struct.__RV_stat_node, ptr %31, i32 0, i32 0
  store i32 0, ptr %stat, align 8
  %32 = load ptr, ptr %__RV_stack_sa, align 8
  %call61 = call i32 @__RV_stat_node_dec(ptr noundef %32)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @_RV_fprintf_105309783230944(ptr noundef %stm_pmd, ptr noundef %fmt_pmd, ptr noundef %stream, ptr noundef %fmt, double noundef %vp2) #0 {
entry:
  %stm_pmd.addr = alloca ptr, align 8
  %fmt_pmd.addr = alloca ptr, align 8
  %stream.addr = alloca ptr, align 8
  %fmt.addr = alloca ptr, align 8
  %vp2.addr = alloca double, align 8
  %ret = alloca i32, align 4
  %p = alloca ptr, align 8
  %is_string = alloca [3 x i8], align 1
  %fmt_cnt = alloca i8, align 1
  %i = alloca i8, align 1
  store ptr %stm_pmd, ptr %stm_pmd.addr, align 8
  store ptr %fmt_pmd, ptr %fmt_pmd.addr, align 8
  store ptr %stream, ptr %stream.addr, align 8
  store ptr %fmt, ptr %fmt.addr, align 8
  store double %vp2, ptr %vp2.addr, align 8
  %0 = load ptr, ptr %fmt.addr, align 8
  store ptr %0, ptr %p, align 8
  call void @llvm.memset.p0.i64(ptr align 1 %is_string, i8 0, i64 3, i1 false)
  store i8 0, ptr %fmt_cnt, align 1
  store i8 2, ptr %i, align 1
  br label %while.cond

while.cond:                                       ; preds = %if.end69, %entry
  %1 = load ptr, ptr %p, align 8
  %tobool = icmp ne ptr %1, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %2 = load ptr, ptr %p, align 8
  %3 = load i8, ptr %2, align 1
  %conv = sext i8 %3 to i32
  %cmp = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %4 = phi i1 [ false, %while.cond ], [ %cmp, %land.rhs ]
  br i1 %4, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %5 = load ptr, ptr %p, align 8
  %6 = load i8, ptr %5, align 1
  %conv2 = sext i8 %6 to i32
  %cmp3 = icmp eq i32 %conv2, 37
  br i1 %cmp3, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %while.body
  %7 = load ptr, ptr %p, align 8
  %add.ptr = getelementptr inbounds i8, ptr %7, i64 1
  %8 = load i8, ptr %add.ptr, align 1
  %conv5 = sext i8 %8 to i32
  %cmp6 = icmp eq i32 %conv5, 37
  br i1 %cmp6, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %9 = load ptr, ptr %p, align 8
  %add.ptr8 = getelementptr inbounds i8, ptr %9, i64 2
  store ptr %add.ptr8, ptr %p, align 8
  br label %if.end69

if.else:                                          ; preds = %land.lhs.true, %while.body
  %10 = load ptr, ptr %p, align 8
  %11 = load i8, ptr %10, align 1
  %conv9 = sext i8 %11 to i32
  %cmp10 = icmp eq i32 %conv9, 37
  br i1 %cmp10, label %land.lhs.true12, label %if.else26

land.lhs.true12:                                  ; preds = %if.else
  %12 = load ptr, ptr %p, align 8
  %add.ptr13 = getelementptr inbounds i8, ptr %12, i64 1
  %13 = load i8, ptr %add.ptr13, align 1
  %conv14 = sext i8 %13 to i32
  %cmp15 = icmp eq i32 %conv14, 42
  br i1 %cmp15, label %land.lhs.true17, label %if.else26

land.lhs.true17:                                  ; preds = %land.lhs.true12
  %14 = load ptr, ptr %p, align 8
  %add.ptr18 = getelementptr inbounds i8, ptr %14, i64 2
  %15 = load i8, ptr %add.ptr18, align 1
  %conv19 = sext i8 %15 to i32
  %cmp20 = icmp eq i32 %conv19, 100
  br i1 %cmp20, label %if.then22, label %if.else26

if.then22:                                        ; preds = %land.lhs.true17
  %16 = load ptr, ptr %p, align 8
  %add.ptr23 = getelementptr inbounds i8, ptr %16, i64 3
  store ptr %add.ptr23, ptr %p, align 8
  %17 = load i8, ptr %fmt_cnt, align 1
  %conv24 = zext i8 %17 to i32
  %add = add nsw i32 %conv24, 2
  %conv25 = trunc i32 %add to i8
  store i8 %conv25, ptr %fmt_cnt, align 1
  br label %if.end68

if.else26:                                        ; preds = %land.lhs.true17, %land.lhs.true12, %if.else
  %18 = load ptr, ptr %p, align 8
  %19 = load i8, ptr %18, align 1
  %conv27 = sext i8 %19 to i32
  %cmp28 = icmp eq i32 %conv27, 37
  br i1 %cmp28, label %if.then30, label %if.else65

if.then30:                                        ; preds = %if.else26
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then30
  %20 = load ptr, ptr %p, align 8
  %incdec.ptr = getelementptr inbounds i8, ptr %20, i32 1
  store ptr %incdec.ptr, ptr %p, align 8
  %21 = load ptr, ptr %p, align 8
  %22 = load i8, ptr %21, align 1
  %conv31 = sext i8 %22 to i32
  %cmp32 = icmp sle i32 48, %conv31
  br i1 %cmp32, label %land.lhs.true34, label %if.end

land.lhs.true34:                                  ; preds = %do.body
  %23 = load ptr, ptr %p, align 8
  %24 = load i8, ptr %23, align 1
  %conv35 = sext i8 %24 to i32
  %cmp36 = icmp sle i32 %conv35, 57
  br i1 %cmp36, label %if.then38, label %if.end

if.then38:                                        ; preds = %land.lhs.true34
  br label %do.cond

if.end:                                           ; preds = %land.lhs.true34, %do.body
  %25 = load ptr, ptr %p, align 8
  %26 = load i8, ptr %25, align 1
  %conv39 = sext i8 %26 to i32
  %cmp40 = icmp eq i32 %conv39, 46
  br i1 %cmp40, label %if.then45, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %27 = load ptr, ptr %p, align 8
  %28 = load i8, ptr %27, align 1
  %conv42 = sext i8 %28 to i32
  %cmp43 = icmp eq i32 %conv42, 42
  br i1 %cmp43, label %if.then45, label %if.end46

if.then45:                                        ; preds = %lor.lhs.false, %if.end
  br label %do.cond

if.end46:                                         ; preds = %lor.lhs.false
  %29 = load ptr, ptr %p, align 8
  %30 = load i8, ptr %29, align 1
  %conv47 = sext i8 %30 to i32
  %cmp48 = icmp eq i32 %conv47, 115
  br i1 %cmp48, label %if.then50, label %if.else51

if.then50:                                        ; preds = %if.end46
  %31 = load i8, ptr %i, align 1
  %inc = add i8 %31, 1
  store i8 %inc, ptr %i, align 1
  %idxprom = zext i8 %31 to i64
  %arrayidx = getelementptr inbounds [3 x i8], ptr %is_string, i64 0, i64 %idxprom
  store i8 1, ptr %arrayidx, align 1
  br label %do.end

if.else51:                                        ; preds = %if.end46
  %32 = load ptr, ptr %p, align 8
  %33 = load i8, ptr %32, align 1
  %conv52 = sext i8 %33 to i32
  %cmp53 = icmp eq i32 %conv52, 91
  br i1 %cmp53, label %if.then55, label %if.else59

if.then55:                                        ; preds = %if.else51
  %34 = load i8, ptr %i, align 1
  %inc56 = add i8 %34, 1
  store i8 %inc56, ptr %i, align 1
  %idxprom57 = zext i8 %34 to i64
  %arrayidx58 = getelementptr inbounds [3 x i8], ptr %is_string, i64 0, i64 %idxprom57
  store i8 1, ptr %arrayidx58, align 1
  br label %do.end

if.else59:                                        ; preds = %if.else51
  %35 = load i8, ptr %i, align 1
  %inc60 = add i8 %35, 1
  store i8 %inc60, ptr %i, align 1
  %idxprom61 = zext i8 %35 to i64
  %arrayidx62 = getelementptr inbounds [3 x i8], ptr %is_string, i64 0, i64 %idxprom61
  store i8 0, ptr %arrayidx62, align 1
  br label %do.end

do.cond:                                          ; preds = %if.then45, %if.then38
  br i1 true, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond, %if.else59, %if.then55, %if.then50
  %36 = load ptr, ptr %p, align 8
  %incdec.ptr63 = getelementptr inbounds i8, ptr %36, i32 1
  store ptr %incdec.ptr63, ptr %p, align 8
  %37 = load i8, ptr %fmt_cnt, align 1
  %inc64 = add i8 %37, 1
  store i8 %inc64, ptr %fmt_cnt, align 1
  br label %if.end67

if.else65:                                        ; preds = %if.else26
  %38 = load ptr, ptr %p, align 8
  %incdec.ptr66 = getelementptr inbounds i8, ptr %38, i32 1
  store ptr %incdec.ptr66, ptr %p, align 8
  br label %if.end67

if.end67:                                         ; preds = %if.else65, %do.end
  br label %if.end68

if.end68:                                         ; preds = %if.end67, %if.then22
  br label %if.end69

if.end69:                                         ; preds = %if.end68, %if.then
  br label %while.cond, !llvm.loop !70

while.end:                                        ; preds = %land.end
  %39 = load i8, ptr %fmt_cnt, align 1
  %conv70 = zext i8 %39 to i32
  %cmp71 = icmp sgt i32 %conv70, 1
  br i1 %cmp71, label %if.then73, label %if.end76

if.then73:                                        ; preds = %while.end
  %40 = load ptr, ptr @stderr, align 8
  %call = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %40, ptr noundef @.str.79)
  %41 = load ptr, ptr @stderr, align 8
  %42 = load i8, ptr %fmt_cnt, align 1
  %conv74 = zext i8 %42 to i32
  %call75 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %41, ptr noundef @.str.80, i32 noundef %conv74)
  br label %if.end76

if.end76:                                         ; preds = %if.then73, %while.end
  %43 = load ptr, ptr %stm_pmd.addr, align 8
  %44 = load ptr, ptr %stream.addr, align 8
  %call77 = call ptr @__RV_check_dpv(ptr noundef %43, ptr noundef %44, i64 noundef 216, ptr noundef @.str.30, ptr noundef @.str.81, i32 noundef 149, i32 noundef 16, ptr noundef @.str.82)
  %45 = load ptr, ptr %fmt_pmd.addr, align 8
  %46 = load ptr, ptr %fmt.addr, align 8
  %47 = load ptr, ptr %p, align 8
  %48 = load ptr, ptr %fmt.addr, align 8
  %sub.ptr.lhs.cast = ptrtoint ptr %47 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %48 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %add78 = add nsw i64 %sub.ptr.sub, 1
  %call79 = call ptr @__RV_check_dpv(ptr noundef %45, ptr noundef %46, i64 noundef %add78, ptr noundef @.str.30, ptr noundef @.str.81, i32 noundef 56, i32 noundef 19, ptr noundef @.str.83)
  %49 = load ptr, ptr %stream.addr, align 8
  %50 = load double, ptr %vp2.addr, align 8
  %call80 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %49, ptr noundef @.str.76, double noundef %50)
  store i32 %call80, ptr %ret, align 4
  %51 = load ptr, ptr %stm_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %51)
  %52 = load ptr, ptr %fmt_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %52)
  %53 = load i32, ptr %ret, align 4
  ret i32 %53
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @_RV_fprintf_105309783235808(ptr noundef %stm_pmd, ptr noundef %fmt_pmd, ptr noundef %stream, ptr noundef %fmt) #0 {
entry:
  %stm_pmd.addr = alloca ptr, align 8
  %fmt_pmd.addr = alloca ptr, align 8
  %stream.addr = alloca ptr, align 8
  %fmt.addr = alloca ptr, align 8
  %ret = alloca i32, align 4
  %p = alloca ptr, align 8
  %is_string = alloca [2 x i8], align 1
  %fmt_cnt = alloca i8, align 1
  %i = alloca i8, align 1
  store ptr %stm_pmd, ptr %stm_pmd.addr, align 8
  store ptr %fmt_pmd, ptr %fmt_pmd.addr, align 8
  store ptr %stream, ptr %stream.addr, align 8
  store ptr %fmt, ptr %fmt.addr, align 8
  %0 = load ptr, ptr %fmt.addr, align 8
  store ptr %0, ptr %p, align 8
  call void @llvm.memset.p0.i64(ptr align 1 %is_string, i8 0, i64 2, i1 false)
  store i8 0, ptr %fmt_cnt, align 1
  store i8 2, ptr %i, align 1
  br label %while.cond

while.cond:                                       ; preds = %if.end69, %entry
  %1 = load ptr, ptr %p, align 8
  %tobool = icmp ne ptr %1, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %2 = load ptr, ptr %p, align 8
  %3 = load i8, ptr %2, align 1
  %conv = sext i8 %3 to i32
  %cmp = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %4 = phi i1 [ false, %while.cond ], [ %cmp, %land.rhs ]
  br i1 %4, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %5 = load ptr, ptr %p, align 8
  %6 = load i8, ptr %5, align 1
  %conv2 = sext i8 %6 to i32
  %cmp3 = icmp eq i32 %conv2, 37
  br i1 %cmp3, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %while.body
  %7 = load ptr, ptr %p, align 8
  %add.ptr = getelementptr inbounds i8, ptr %7, i64 1
  %8 = load i8, ptr %add.ptr, align 1
  %conv5 = sext i8 %8 to i32
  %cmp6 = icmp eq i32 %conv5, 37
  br i1 %cmp6, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %9 = load ptr, ptr %p, align 8
  %add.ptr8 = getelementptr inbounds i8, ptr %9, i64 2
  store ptr %add.ptr8, ptr %p, align 8
  br label %if.end69

if.else:                                          ; preds = %land.lhs.true, %while.body
  %10 = load ptr, ptr %p, align 8
  %11 = load i8, ptr %10, align 1
  %conv9 = sext i8 %11 to i32
  %cmp10 = icmp eq i32 %conv9, 37
  br i1 %cmp10, label %land.lhs.true12, label %if.else26

land.lhs.true12:                                  ; preds = %if.else
  %12 = load ptr, ptr %p, align 8
  %add.ptr13 = getelementptr inbounds i8, ptr %12, i64 1
  %13 = load i8, ptr %add.ptr13, align 1
  %conv14 = sext i8 %13 to i32
  %cmp15 = icmp eq i32 %conv14, 42
  br i1 %cmp15, label %land.lhs.true17, label %if.else26

land.lhs.true17:                                  ; preds = %land.lhs.true12
  %14 = load ptr, ptr %p, align 8
  %add.ptr18 = getelementptr inbounds i8, ptr %14, i64 2
  %15 = load i8, ptr %add.ptr18, align 1
  %conv19 = sext i8 %15 to i32
  %cmp20 = icmp eq i32 %conv19, 100
  br i1 %cmp20, label %if.then22, label %if.else26

if.then22:                                        ; preds = %land.lhs.true17
  %16 = load ptr, ptr %p, align 8
  %add.ptr23 = getelementptr inbounds i8, ptr %16, i64 3
  store ptr %add.ptr23, ptr %p, align 8
  %17 = load i8, ptr %fmt_cnt, align 1
  %conv24 = zext i8 %17 to i32
  %add = add nsw i32 %conv24, 2
  %conv25 = trunc i32 %add to i8
  store i8 %conv25, ptr %fmt_cnt, align 1
  br label %if.end68

if.else26:                                        ; preds = %land.lhs.true17, %land.lhs.true12, %if.else
  %18 = load ptr, ptr %p, align 8
  %19 = load i8, ptr %18, align 1
  %conv27 = sext i8 %19 to i32
  %cmp28 = icmp eq i32 %conv27, 37
  br i1 %cmp28, label %if.then30, label %if.else65

if.then30:                                        ; preds = %if.else26
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then30
  %20 = load ptr, ptr %p, align 8
  %incdec.ptr = getelementptr inbounds i8, ptr %20, i32 1
  store ptr %incdec.ptr, ptr %p, align 8
  %21 = load ptr, ptr %p, align 8
  %22 = load i8, ptr %21, align 1
  %conv31 = sext i8 %22 to i32
  %cmp32 = icmp sle i32 48, %conv31
  br i1 %cmp32, label %land.lhs.true34, label %if.end

land.lhs.true34:                                  ; preds = %do.body
  %23 = load ptr, ptr %p, align 8
  %24 = load i8, ptr %23, align 1
  %conv35 = sext i8 %24 to i32
  %cmp36 = icmp sle i32 %conv35, 57
  br i1 %cmp36, label %if.then38, label %if.end

if.then38:                                        ; preds = %land.lhs.true34
  br label %do.cond

if.end:                                           ; preds = %land.lhs.true34, %do.body
  %25 = load ptr, ptr %p, align 8
  %26 = load i8, ptr %25, align 1
  %conv39 = sext i8 %26 to i32
  %cmp40 = icmp eq i32 %conv39, 46
  br i1 %cmp40, label %if.then45, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %27 = load ptr, ptr %p, align 8
  %28 = load i8, ptr %27, align 1
  %conv42 = sext i8 %28 to i32
  %cmp43 = icmp eq i32 %conv42, 42
  br i1 %cmp43, label %if.then45, label %if.end46

if.then45:                                        ; preds = %lor.lhs.false, %if.end
  br label %do.cond

if.end46:                                         ; preds = %lor.lhs.false
  %29 = load ptr, ptr %p, align 8
  %30 = load i8, ptr %29, align 1
  %conv47 = sext i8 %30 to i32
  %cmp48 = icmp eq i32 %conv47, 115
  br i1 %cmp48, label %if.then50, label %if.else51

if.then50:                                        ; preds = %if.end46
  %31 = load i8, ptr %i, align 1
  %inc = add i8 %31, 1
  store i8 %inc, ptr %i, align 1
  %idxprom = zext i8 %31 to i64
  %arrayidx = getelementptr inbounds [2 x i8], ptr %is_string, i64 0, i64 %idxprom
  store i8 1, ptr %arrayidx, align 1
  br label %do.end

if.else51:                                        ; preds = %if.end46
  %32 = load ptr, ptr %p, align 8
  %33 = load i8, ptr %32, align 1
  %conv52 = sext i8 %33 to i32
  %cmp53 = icmp eq i32 %conv52, 91
  br i1 %cmp53, label %if.then55, label %if.else59

if.then55:                                        ; preds = %if.else51
  %34 = load i8, ptr %i, align 1
  %inc56 = add i8 %34, 1
  store i8 %inc56, ptr %i, align 1
  %idxprom57 = zext i8 %34 to i64
  %arrayidx58 = getelementptr inbounds [2 x i8], ptr %is_string, i64 0, i64 %idxprom57
  store i8 1, ptr %arrayidx58, align 1
  br label %do.end

if.else59:                                        ; preds = %if.else51
  %35 = load i8, ptr %i, align 1
  %inc60 = add i8 %35, 1
  store i8 %inc60, ptr %i, align 1
  %idxprom61 = zext i8 %35 to i64
  %arrayidx62 = getelementptr inbounds [2 x i8], ptr %is_string, i64 0, i64 %idxprom61
  store i8 0, ptr %arrayidx62, align 1
  br label %do.end

do.cond:                                          ; preds = %if.then45, %if.then38
  br i1 true, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond, %if.else59, %if.then55, %if.then50
  %36 = load ptr, ptr %p, align 8
  %incdec.ptr63 = getelementptr inbounds i8, ptr %36, i32 1
  store ptr %incdec.ptr63, ptr %p, align 8
  %37 = load i8, ptr %fmt_cnt, align 1
  %inc64 = add i8 %37, 1
  store i8 %inc64, ptr %fmt_cnt, align 1
  br label %if.end67

if.else65:                                        ; preds = %if.else26
  %38 = load ptr, ptr %p, align 8
  %incdec.ptr66 = getelementptr inbounds i8, ptr %38, i32 1
  store ptr %incdec.ptr66, ptr %p, align 8
  br label %if.end67

if.end67:                                         ; preds = %if.else65, %do.end
  br label %if.end68

if.end68:                                         ; preds = %if.end67, %if.then22
  br label %if.end69

if.end69:                                         ; preds = %if.end68, %if.then
  br label %while.cond, !llvm.loop !71

while.end:                                        ; preds = %land.end
  %39 = load i8, ptr %fmt_cnt, align 1
  %conv70 = zext i8 %39 to i32
  %cmp71 = icmp sgt i32 %conv70, 0
  br i1 %cmp71, label %if.then73, label %if.end76

if.then73:                                        ; preds = %while.end
  %40 = load ptr, ptr @stderr, align 8
  %call = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %40, ptr noundef @.str.79)
  %41 = load ptr, ptr @stderr, align 8
  %42 = load i8, ptr %fmt_cnt, align 1
  %conv74 = zext i8 %42 to i32
  %call75 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %41, ptr noundef @.str.84, i32 noundef %conv74)
  br label %if.end76

if.end76:                                         ; preds = %if.then73, %while.end
  %43 = load ptr, ptr %stm_pmd.addr, align 8
  %44 = load ptr, ptr %stream.addr, align 8
  %call77 = call ptr @__RV_check_dpv(ptr noundef %43, ptr noundef %44, i64 noundef 216, ptr noundef @.str.30, ptr noundef @.str.81, i32 noundef 149, i32 noundef 16, ptr noundef @.str.82)
  %45 = load ptr, ptr %fmt_pmd.addr, align 8
  %46 = load ptr, ptr %fmt.addr, align 8
  %47 = load ptr, ptr %p, align 8
  %48 = load ptr, ptr %fmt.addr, align 8
  %sub.ptr.lhs.cast = ptrtoint ptr %47 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %48 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %add78 = add nsw i64 %sub.ptr.sub, 1
  %call79 = call ptr @__RV_check_dpv(ptr noundef %45, ptr noundef %46, i64 noundef %add78, ptr noundef @.str.30, ptr noundef @.str.81, i32 noundef 57, i32 noundef 47, ptr noundef @.str.85)
  %49 = load ptr, ptr %stream.addr, align 8
  %call80 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %49, ptr noundef @.str.78)
  store i32 %call80, ptr %ret, align 4
  %50 = load ptr, ptr %stm_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %50)
  %51 = load ptr, ptr %fmt_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %51)
  %52 = load i32, ptr %ret, align 4
  ret i32 %52
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @_RV_fprintf_105309783236272(ptr noundef %stm_pmd, ptr noundef %fmt_pmd, ptr noundef %stream, ptr noundef %fmt) #0 {
entry:
  %stm_pmd.addr = alloca ptr, align 8
  %fmt_pmd.addr = alloca ptr, align 8
  %stream.addr = alloca ptr, align 8
  %fmt.addr = alloca ptr, align 8
  %ret = alloca i32, align 4
  %p = alloca ptr, align 8
  %is_string = alloca [2 x i8], align 1
  %fmt_cnt = alloca i8, align 1
  %i = alloca i8, align 1
  store ptr %stm_pmd, ptr %stm_pmd.addr, align 8
  store ptr %fmt_pmd, ptr %fmt_pmd.addr, align 8
  store ptr %stream, ptr %stream.addr, align 8
  store ptr %fmt, ptr %fmt.addr, align 8
  %0 = load ptr, ptr %fmt.addr, align 8
  store ptr %0, ptr %p, align 8
  call void @llvm.memset.p0.i64(ptr align 1 %is_string, i8 0, i64 2, i1 false)
  store i8 0, ptr %fmt_cnt, align 1
  store i8 2, ptr %i, align 1
  br label %while.cond

while.cond:                                       ; preds = %if.end69, %entry
  %1 = load ptr, ptr %p, align 8
  %tobool = icmp ne ptr %1, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %2 = load ptr, ptr %p, align 8
  %3 = load i8, ptr %2, align 1
  %conv = sext i8 %3 to i32
  %cmp = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %4 = phi i1 [ false, %while.cond ], [ %cmp, %land.rhs ]
  br i1 %4, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %5 = load ptr, ptr %p, align 8
  %6 = load i8, ptr %5, align 1
  %conv2 = sext i8 %6 to i32
  %cmp3 = icmp eq i32 %conv2, 37
  br i1 %cmp3, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %while.body
  %7 = load ptr, ptr %p, align 8
  %add.ptr = getelementptr inbounds i8, ptr %7, i64 1
  %8 = load i8, ptr %add.ptr, align 1
  %conv5 = sext i8 %8 to i32
  %cmp6 = icmp eq i32 %conv5, 37
  br i1 %cmp6, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %9 = load ptr, ptr %p, align 8
  %add.ptr8 = getelementptr inbounds i8, ptr %9, i64 2
  store ptr %add.ptr8, ptr %p, align 8
  br label %if.end69

if.else:                                          ; preds = %land.lhs.true, %while.body
  %10 = load ptr, ptr %p, align 8
  %11 = load i8, ptr %10, align 1
  %conv9 = sext i8 %11 to i32
  %cmp10 = icmp eq i32 %conv9, 37
  br i1 %cmp10, label %land.lhs.true12, label %if.else26

land.lhs.true12:                                  ; preds = %if.else
  %12 = load ptr, ptr %p, align 8
  %add.ptr13 = getelementptr inbounds i8, ptr %12, i64 1
  %13 = load i8, ptr %add.ptr13, align 1
  %conv14 = sext i8 %13 to i32
  %cmp15 = icmp eq i32 %conv14, 42
  br i1 %cmp15, label %land.lhs.true17, label %if.else26

land.lhs.true17:                                  ; preds = %land.lhs.true12
  %14 = load ptr, ptr %p, align 8
  %add.ptr18 = getelementptr inbounds i8, ptr %14, i64 2
  %15 = load i8, ptr %add.ptr18, align 1
  %conv19 = sext i8 %15 to i32
  %cmp20 = icmp eq i32 %conv19, 100
  br i1 %cmp20, label %if.then22, label %if.else26

if.then22:                                        ; preds = %land.lhs.true17
  %16 = load ptr, ptr %p, align 8
  %add.ptr23 = getelementptr inbounds i8, ptr %16, i64 3
  store ptr %add.ptr23, ptr %p, align 8
  %17 = load i8, ptr %fmt_cnt, align 1
  %conv24 = zext i8 %17 to i32
  %add = add nsw i32 %conv24, 2
  %conv25 = trunc i32 %add to i8
  store i8 %conv25, ptr %fmt_cnt, align 1
  br label %if.end68

if.else26:                                        ; preds = %land.lhs.true17, %land.lhs.true12, %if.else
  %18 = load ptr, ptr %p, align 8
  %19 = load i8, ptr %18, align 1
  %conv27 = sext i8 %19 to i32
  %cmp28 = icmp eq i32 %conv27, 37
  br i1 %cmp28, label %if.then30, label %if.else65

if.then30:                                        ; preds = %if.else26
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then30
  %20 = load ptr, ptr %p, align 8
  %incdec.ptr = getelementptr inbounds i8, ptr %20, i32 1
  store ptr %incdec.ptr, ptr %p, align 8
  %21 = load ptr, ptr %p, align 8
  %22 = load i8, ptr %21, align 1
  %conv31 = sext i8 %22 to i32
  %cmp32 = icmp sle i32 48, %conv31
  br i1 %cmp32, label %land.lhs.true34, label %if.end

land.lhs.true34:                                  ; preds = %do.body
  %23 = load ptr, ptr %p, align 8
  %24 = load i8, ptr %23, align 1
  %conv35 = sext i8 %24 to i32
  %cmp36 = icmp sle i32 %conv35, 57
  br i1 %cmp36, label %if.then38, label %if.end

if.then38:                                        ; preds = %land.lhs.true34
  br label %do.cond

if.end:                                           ; preds = %land.lhs.true34, %do.body
  %25 = load ptr, ptr %p, align 8
  %26 = load i8, ptr %25, align 1
  %conv39 = sext i8 %26 to i32
  %cmp40 = icmp eq i32 %conv39, 46
  br i1 %cmp40, label %if.then45, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %27 = load ptr, ptr %p, align 8
  %28 = load i8, ptr %27, align 1
  %conv42 = sext i8 %28 to i32
  %cmp43 = icmp eq i32 %conv42, 42
  br i1 %cmp43, label %if.then45, label %if.end46

if.then45:                                        ; preds = %lor.lhs.false, %if.end
  br label %do.cond

if.end46:                                         ; preds = %lor.lhs.false
  %29 = load ptr, ptr %p, align 8
  %30 = load i8, ptr %29, align 1
  %conv47 = sext i8 %30 to i32
  %cmp48 = icmp eq i32 %conv47, 115
  br i1 %cmp48, label %if.then50, label %if.else51

if.then50:                                        ; preds = %if.end46
  %31 = load i8, ptr %i, align 1
  %inc = add i8 %31, 1
  store i8 %inc, ptr %i, align 1
  %idxprom = zext i8 %31 to i64
  %arrayidx = getelementptr inbounds [2 x i8], ptr %is_string, i64 0, i64 %idxprom
  store i8 1, ptr %arrayidx, align 1
  br label %do.end

if.else51:                                        ; preds = %if.end46
  %32 = load ptr, ptr %p, align 8
  %33 = load i8, ptr %32, align 1
  %conv52 = sext i8 %33 to i32
  %cmp53 = icmp eq i32 %conv52, 91
  br i1 %cmp53, label %if.then55, label %if.else59

if.then55:                                        ; preds = %if.else51
  %34 = load i8, ptr %i, align 1
  %inc56 = add i8 %34, 1
  store i8 %inc56, ptr %i, align 1
  %idxprom57 = zext i8 %34 to i64
  %arrayidx58 = getelementptr inbounds [2 x i8], ptr %is_string, i64 0, i64 %idxprom57
  store i8 1, ptr %arrayidx58, align 1
  br label %do.end

if.else59:                                        ; preds = %if.else51
  %35 = load i8, ptr %i, align 1
  %inc60 = add i8 %35, 1
  store i8 %inc60, ptr %i, align 1
  %idxprom61 = zext i8 %35 to i64
  %arrayidx62 = getelementptr inbounds [2 x i8], ptr %is_string, i64 0, i64 %idxprom61
  store i8 0, ptr %arrayidx62, align 1
  br label %do.end

do.cond:                                          ; preds = %if.then45, %if.then38
  br i1 true, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond, %if.else59, %if.then55, %if.then50
  %36 = load ptr, ptr %p, align 8
  %incdec.ptr63 = getelementptr inbounds i8, ptr %36, i32 1
  store ptr %incdec.ptr63, ptr %p, align 8
  %37 = load i8, ptr %fmt_cnt, align 1
  %inc64 = add i8 %37, 1
  store i8 %inc64, ptr %fmt_cnt, align 1
  br label %if.end67

if.else65:                                        ; preds = %if.else26
  %38 = load ptr, ptr %p, align 8
  %incdec.ptr66 = getelementptr inbounds i8, ptr %38, i32 1
  store ptr %incdec.ptr66, ptr %p, align 8
  br label %if.end67

if.end67:                                         ; preds = %if.else65, %do.end
  br label %if.end68

if.end68:                                         ; preds = %if.end67, %if.then22
  br label %if.end69

if.end69:                                         ; preds = %if.end68, %if.then
  br label %while.cond, !llvm.loop !72

while.end:                                        ; preds = %land.end
  %39 = load i8, ptr %fmt_cnt, align 1
  %conv70 = zext i8 %39 to i32
  %cmp71 = icmp sgt i32 %conv70, 0
  br i1 %cmp71, label %if.then73, label %if.end76

if.then73:                                        ; preds = %while.end
  %40 = load ptr, ptr @stderr, align 8
  %call = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %40, ptr noundef @.str.79)
  %41 = load ptr, ptr @stderr, align 8
  %42 = load i8, ptr %fmt_cnt, align 1
  %conv74 = zext i8 %42 to i32
  %call75 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %41, ptr noundef @.str.86, i32 noundef %conv74)
  br label %if.end76

if.end76:                                         ; preds = %if.then73, %while.end
  %43 = load ptr, ptr %stm_pmd.addr, align 8
  %44 = load ptr, ptr %stream.addr, align 8
  %call77 = call ptr @__RV_check_dpv(ptr noundef %43, ptr noundef %44, i64 noundef 216, ptr noundef @.str.30, ptr noundef @.str.81, i32 noundef 149, i32 noundef 16, ptr noundef @.str.82)
  %45 = load ptr, ptr %fmt_pmd.addr, align 8
  %46 = load ptr, ptr %fmt.addr, align 8
  %47 = load ptr, ptr %p, align 8
  %48 = load ptr, ptr %fmt.addr, align 8
  %sub.ptr.lhs.cast = ptrtoint ptr %47 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %48 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %add78 = add nsw i64 %sub.ptr.sub, 1
  %call79 = call ptr @__RV_check_dpv(ptr noundef %45, ptr noundef %46, i64 noundef %add78, ptr noundef @.str.30, ptr noundef @.str.81, i32 noundef 59, i32 noundef 20, ptr noundef @.str.85)
  %49 = load ptr, ptr %stream.addr, align 8
  %call80 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %49, ptr noundef @.str.78)
  store i32 %call80, ptr %ret, align 4
  %50 = load ptr, ptr %stm_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %50)
  %51 = load ptr, ptr %fmt_pmd.addr, align 8
  call void @__RV_pmd_free_null_ptr(ptr noundef %51)
  %52 = load i32, ptr %ret, align 4
  ret i32 %52
}

declare void @_Z4joinj(i32)

define internal void @_loop_func_86(ptr %_RV_pmd_E_105309783237384, ptr %_RV_pmd_F_105309783238632, ptr %_RV_pmd_G_105309783239880, ptr %_RV_bc_flag_105309783249184, ptr %k, ptr %E.addr, ptr %i, ptr %F.addr, ptr %j, ptr %G.addr, ptr %_RV_bc_flag_105309783249320, ptr %nj.addr, ptr %_RV_ret_flag, ptr %nl.addr, ptr %ni.addr, ptr %_RV_bc_flag_105309783249288, ptr %_RV_pmd_A_105309783237800, ptr %_RV_pmd_B_105309783238216, ptr %_RV_pmd_C_105309783239048, ptr %_RV_pmd_D_105309783239464) {
entry:
  %0 = bitcast ptr %_RV_pmd_E_105309783237384 to ptr
  %1 = bitcast ptr %_RV_pmd_F_105309783238632 to ptr
  %2 = bitcast ptr %_RV_pmd_G_105309783239880 to ptr
  %3 = bitcast ptr %_RV_bc_flag_105309783249184 to ptr
  %4 = bitcast ptr %k to ptr
  %5 = bitcast ptr %E.addr to ptr
  %6 = bitcast ptr %i to ptr
  %7 = bitcast ptr %F.addr to ptr
  %8 = bitcast ptr %j to ptr
  %9 = bitcast ptr %G.addr to ptr
  %10 = bitcast ptr %_RV_bc_flag_105309783249320 to ptr
  %11 = bitcast ptr %nj.addr to ptr
  %12 = bitcast ptr %_RV_ret_flag to ptr
  %13 = bitcast ptr %nl.addr to ptr
  %14 = bitcast ptr %ni.addr to ptr
  %15 = bitcast ptr %_RV_bc_flag_105309783249288 to ptr
  %16 = bitcast ptr %_RV_pmd_A_105309783237800 to ptr
  %17 = bitcast ptr %_RV_pmd_B_105309783238216 to ptr
  %18 = bitcast ptr %_RV_pmd_C_105309783239048 to ptr
  %19 = bitcast ptr %_RV_pmd_D_105309783239464 to ptr
  br label %for.cond192

if.then246:                                       ; preds = %if.end242
  store i8 0, ptr %3, align 1
  br label %for.end255

if.end242:                                        ; preds = %_RV_lbl_105309783249184
  %20 = load i8, ptr %3, align 1
  %21 = zext i8 %20 to i32
  %22 = icmp eq i32 %21, 1
  br i1 %22, label %if.then246, label %if.end247

for.inc253:                                       ; preds = %if.end252
  %23 = load i32, ptr %4, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %4, align 4
  br label %for.cond209

if.then251:                                       ; preds = %if.end247
  store i8 0, ptr %3, align 1
  br label %if.end252

for.end255:                                       ; preds = %for.cond209, %if.then246
  br label %_RV_lbl_105309783249288

if.end284:                                        ; preds = %if.end279, %if.then283
  br label %for.inc285

for.body212:                                      ; preds = %for.cond209
  %25 = load ptr, ptr %5, align 8
  %26 = load ptr, ptr %5, align 8
  %27 = load i32, ptr %6, align 4
  %28 = sext i32 %27 to i64
  %29 = call i64 @__RV_check_dpv_ss(ptr noundef %0, ptr noundef %26, i64 noundef %28, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 100, i32 noundef 17, ptr noundef @.str.61)
  %30 = getelementptr inbounds [1024 x double], ptr %25, i64 %29
  %31 = load ptr, ptr %5, align 8
  %32 = load i32, ptr %6, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [1024 x double], ptr %31, i64 %33
  %35 = getelementptr inbounds [1024 x double], ptr %34, i64 0, i64 0
  %36 = load i32, ptr %4, align 4
  %37 = sext i32 %36 to i64
  %38 = call i64 @__RV_check_dpv_ss(ptr noundef %0, ptr noundef %35, i64 noundef %37, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 100, i32 noundef 20, ptr noundef @.str.73)
  %39 = getelementptr inbounds [1024 x double], ptr %30, i64 0, i64 %38
  %40 = load double, ptr %39, align 8
  %41 = load ptr, ptr %7, align 8
  %42 = load ptr, ptr %7, align 8
  %43 = load i32, ptr %4, align 4
  %44 = sext i32 %43 to i64
  %45 = call i64 @__RV_check_dpv_ss(ptr noundef %1, ptr noundef %42, i64 noundef %44, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 100, i32 noundef 27, ptr noundef @.str.74)
  %46 = getelementptr inbounds [1024 x double], ptr %41, i64 %45
  %47 = load ptr, ptr %7, align 8
  %48 = load i32, ptr %4, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [1024 x double], ptr %47, i64 %49
  %51 = getelementptr inbounds [1024 x double], ptr %50, i64 0, i64 0
  %52 = load i32, ptr %8, align 4
  %53 = sext i32 %52 to i64
  %54 = call i64 @__RV_check_dpv_ss(ptr noundef %1, ptr noundef %51, i64 noundef %53, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 100, i32 noundef 30, ptr noundef @.str.75)
  %55 = getelementptr inbounds [1024 x double], ptr %46, i64 0, i64 %54
  %56 = load double, ptr %55, align 8
  %57 = load ptr, ptr %9, align 8
  %58 = load ptr, ptr %9, align 8
  %59 = load i32, ptr %6, align 4
  %60 = sext i32 %59 to i64
  %61 = call i64 @__RV_check_dpv_ss(ptr noundef %2, ptr noundef %58, i64 noundef %60, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 100, i32 noundef 6, ptr noundef @.str.71)
  %62 = getelementptr inbounds [1024 x double], ptr %57, i64 %61
  %63 = load ptr, ptr %9, align 8
  %64 = load i32, ptr %6, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [1024 x double], ptr %63, i64 %65
  %67 = getelementptr inbounds [1024 x double], ptr %66, i64 0, i64 0
  %68 = load i32, ptr %8, align 4
  %69 = sext i32 %68 to i64
  %70 = call i64 @__RV_check_dpv_ss(ptr noundef %2, ptr noundef %67, i64 noundef %69, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 100, i32 noundef 9, ptr noundef @.str.72)
  %71 = getelementptr inbounds [1024 x double], ptr %62, i64 0, i64 %70
  %72 = load double, ptr %71, align 8
  %73 = call double @llvm.fmuladd.f64(double %40, double %56, double %72)
  store double %73, ptr %71, align 8
  br label %_RV_lbl_105309783249184

if.then283:                                       ; preds = %if.end279
  store i8 0, ptr %10, align 1
  br label %if.end284

for.cond209:                                      ; preds = %for.body199, %for.inc253
  %74 = load i32, ptr %4, align 4
  %75 = load i32, ptr %11, align 4
  %76 = icmp slt i32 %74, %75
  br i1 %76, label %for.body212, label %for.end255

for.body199:                                      ; preds = %for.cond196
  %77 = load ptr, ptr %9, align 8
  %78 = load ptr, ptr %9, align 8
  %79 = load i32, ptr %6, align 4
  %80 = sext i32 %79 to i64
  %81 = call i64 @__RV_check_dpv_ss(ptr noundef %2, ptr noundef %78, i64 noundef %80, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 98, i32 noundef 4, ptr noundef @.str.71)
  %82 = getelementptr inbounds [1024 x double], ptr %77, i64 %81
  %83 = load ptr, ptr %9, align 8
  %84 = load i32, ptr %6, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [1024 x double], ptr %83, i64 %85
  %87 = getelementptr inbounds [1024 x double], ptr %86, i64 0, i64 0
  %88 = load i32, ptr %8, align 4
  %89 = sext i32 %88 to i64
  %90 = call i64 @__RV_check_dpv_ss(ptr noundef %2, ptr noundef %87, i64 noundef %89, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 98, i32 noundef 7, ptr noundef @.str.72)
  %91 = getelementptr inbounds [1024 x double], ptr %82, i64 0, i64 %90
  store double 0.000000e+00, ptr %91, align 8
  store i32 0, ptr %4, align 4
  br label %for.cond209

_RV_lbl_105309783249184:                          ; preds = %for.body212
  %92 = load i8, ptr %12, align 1
  %93 = icmp ne i8 %92, 0
  br i1 %93, label %if.then241, label %if.end242

for.cond196:                                      ; preds = %for.body195, %for.inc269
  %94 = load i32, ptr %8, align 4
  %95 = load i32, ptr %13, align 4
  %96 = icmp slt i32 %94, %95
  br i1 %96, label %for.body199, label %for.end271

if.then257:                                       ; preds = %_RV_lbl_105309783249288
  br label %_RV_lbl_105309783249320

if.end252:                                        ; preds = %if.end247, %if.then251
  br label %for.inc253

for.inc285:                                       ; preds = %if.end284
  %97 = load i32, ptr %6, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, ptr %6, align 4
  br label %for.cond192

for.cond192:                                      ; preds = %entry, %for.inc285
  %99 = load i32, ptr %6, align 4
  %100 = load i32, ptr %14, align 4
  %101 = icmp slt i32 %99, %100
  br i1 %101, label %for.body195, label %exit

if.then262:                                       ; preds = %if.end258
  store i8 0, ptr %15, align 1
  br label %for.end271

if.then241:                                       ; preds = %_RV_lbl_105309783249184
  br label %_RV_lbl_105309783249288

_RV_lbl_105309783249288:                          ; preds = %if.then241, %for.end255
  %102 = load i8, ptr %12, align 1
  %103 = icmp ne i8 %102, 0
  br i1 %103, label %if.then257, label %if.end258

for.inc269:                                       ; preds = %if.end268
  %104 = load i32, ptr %8, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, ptr %8, align 4
  br label %for.cond196

if.end258:                                        ; preds = %_RV_lbl_105309783249288
  %106 = load i8, ptr %15, align 1
  %107 = zext i8 %106 to i32
  %108 = icmp eq i32 %107, 1
  br i1 %108, label %if.then262, label %if.end263

for.body195:                                      ; preds = %for.cond192
  store i32 0, ptr %8, align 4
  br label %for.cond196

if.end263:                                        ; preds = %if.end258
  %109 = load i8, ptr %15, align 1
  %110 = zext i8 %109 to i32
  %111 = icmp eq i32 %110, 2
  br i1 %111, label %if.then267, label %if.end268

for.end271:                                       ; preds = %if.then262, %for.cond196
  br label %_RV_lbl_105309783249320

if.end247:                                        ; preds = %if.end242
  %112 = load i8, ptr %3, align 1
  %113 = zext i8 %112 to i32
  %114 = icmp eq i32 %113, 2
  br i1 %114, label %if.then251, label %if.end252

if.then267:                                       ; preds = %if.end263
  store i8 0, ptr %15, align 1
  br label %if.end268

if.end268:                                        ; preds = %if.then267, %if.end263
  br label %for.inc269

_RV_lbl_105309783249320:                          ; preds = %for.end271, %if.then257
  %115 = load i8, ptr %12, align 1
  %116 = icmp ne i8 %115, 0
  br i1 %116, label %exit1, label %if.end274

if.end279:                                        ; preds = %if.end274
  %117 = load i8, ptr %10, align 1
  %118 = zext i8 %117 to i32
  %119 = icmp eq i32 %118, 2
  br i1 %119, label %if.then283, label %if.end284

if.end274:                                        ; preds = %_RV_lbl_105309783249320
  %120 = load i8, ptr %10, align 1
  %121 = zext i8 %120 to i32
  %122 = icmp eq i32 %121, 1
  br i1 %122, label %exit2, label %if.end279

exit:                                             ; preds = %for.cond192
  ret void

exit1:                                            ; preds = %_RV_lbl_105309783249320
  ret void

exit2:                                            ; preds = %if.end274
  ret void
}

define internal void @_spawn_loop_func_86(ptr %0) {
entry:
  %_RV_pmd_E_105309783237384_local = alloca %struct.__RV_pmd, align 8
  %cm_env_slot_meta_ptr = getelementptr i8, ptr %0, i64 0
  %cm_env_slot_pptr = bitcast ptr %cm_env_slot_meta_ptr to ptr
  %meta.ptr.load = load ptr, ptr %cm_env_slot_pptr, align 8
  %meta.load = load %struct.__RV_pmd, ptr %meta.ptr.load, align 8
  store %struct.__RV_pmd %meta.load, ptr %_RV_pmd_E_105309783237384_local, align 8
  %_RV_pmd_F_105309783238632_local = alloca %struct.__RV_pmd, align 8
  %cm_env_slot_meta_ptr1 = getelementptr i8, ptr %0, i64 8
  %cm_env_slot_pptr2 = bitcast ptr %cm_env_slot_meta_ptr1 to ptr
  %meta.ptr.load3 = load ptr, ptr %cm_env_slot_pptr2, align 8
  %meta.load4 = load %struct.__RV_pmd, ptr %meta.ptr.load3, align 8
  store %struct.__RV_pmd %meta.load4, ptr %_RV_pmd_F_105309783238632_local, align 8
  %_RV_pmd_G_105309783239880_local = alloca %struct.__RV_pmd, align 8
  %cm_env_slot_meta_ptr5 = getelementptr i8, ptr %0, i64 16
  %cm_env_slot_pptr6 = bitcast ptr %cm_env_slot_meta_ptr5 to ptr
  %meta.ptr.load7 = load ptr, ptr %cm_env_slot_pptr6, align 8
  %meta.load8 = load %struct.__RV_pmd, ptr %meta.ptr.load7, align 8
  store %struct.__RV_pmd %meta.load8, ptr %_RV_pmd_G_105309783239880_local, align 8
  %cm_env_slot_ptr = getelementptr i8, ptr %0, i64 24
  %cm_env_slot = bitcast ptr %cm_env_slot_ptr to ptr
  %1 = load ptr, ptr %cm_env_slot, align 8
  %cm_env_slot_ptr9 = getelementptr i8, ptr %0, i64 32
  %cm_env_slot10 = bitcast ptr %cm_env_slot_ptr9 to ptr
  %2 = load ptr, ptr %cm_env_slot10, align 8
  %cm_env_slot_ptr11 = getelementptr i8, ptr %0, i64 40
  %cm_env_slot12 = bitcast ptr %cm_env_slot_ptr11 to ptr
  %3 = load ptr, ptr %cm_env_slot12, align 8
  %cm_env_slot_ptr13 = getelementptr i8, ptr %0, i64 48
  %cm_env_slot14 = bitcast ptr %cm_env_slot_ptr13 to ptr
  %4 = load ptr, ptr %cm_env_slot14, align 8
  %cm_env_slot_ptr15 = getelementptr i8, ptr %0, i64 56
  %cm_env_slot16 = bitcast ptr %cm_env_slot_ptr15 to ptr
  %5 = load ptr, ptr %cm_env_slot16, align 8
  %cm_env_slot_ptr17 = getelementptr i8, ptr %0, i64 64
  %cm_env_slot18 = bitcast ptr %cm_env_slot_ptr17 to ptr
  %6 = load ptr, ptr %cm_env_slot18, align 8
  %cm_env_slot_ptr19 = getelementptr i8, ptr %0, i64 72
  %cm_env_slot20 = bitcast ptr %cm_env_slot_ptr19 to ptr
  %7 = load ptr, ptr %cm_env_slot20, align 8
  %cm_env_slot_ptr21 = getelementptr i8, ptr %0, i64 80
  %cm_env_slot22 = bitcast ptr %cm_env_slot_ptr21 to ptr
  %8 = load ptr, ptr %cm_env_slot22, align 8
  %cm_env_slot_ptr23 = getelementptr i8, ptr %0, i64 88
  %cm_env_slot24 = bitcast ptr %cm_env_slot_ptr23 to ptr
  %9 = load ptr, ptr %cm_env_slot24, align 8
  %cm_env_slot_ptr25 = getelementptr i8, ptr %0, i64 96
  %cm_env_slot26 = bitcast ptr %cm_env_slot_ptr25 to ptr
  %10 = load ptr, ptr %cm_env_slot26, align 8
  %cm_env_slot_ptr27 = getelementptr i8, ptr %0, i64 104
  %cm_env_slot28 = bitcast ptr %cm_env_slot_ptr27 to ptr
  %11 = load ptr, ptr %cm_env_slot28, align 8
  %cm_env_slot_ptr29 = getelementptr i8, ptr %0, i64 112
  %cm_env_slot30 = bitcast ptr %cm_env_slot_ptr29 to ptr
  %12 = load ptr, ptr %cm_env_slot30, align 8
  %cm_env_slot_ptr31 = getelementptr i8, ptr %0, i64 120
  %cm_env_slot32 = bitcast ptr %cm_env_slot_ptr31 to ptr
  %13 = load ptr, ptr %cm_env_slot32, align 8
  %_RV_pmd_A_105309783237800_local = alloca %struct.__RV_pmd, align 8
  %cm_env_slot_meta_ptr33 = getelementptr i8, ptr %0, i64 128
  %cm_env_slot_pptr34 = bitcast ptr %cm_env_slot_meta_ptr33 to ptr
  %meta.ptr.load35 = load ptr, ptr %cm_env_slot_pptr34, align 8
  %meta.load36 = load %struct.__RV_pmd, ptr %meta.ptr.load35, align 8
  store %struct.__RV_pmd %meta.load36, ptr %_RV_pmd_A_105309783237800_local, align 8
  %_RV_pmd_B_105309783238216_local = alloca %struct.__RV_pmd, align 8
  %cm_env_slot_meta_ptr37 = getelementptr i8, ptr %0, i64 136
  %cm_env_slot_pptr38 = bitcast ptr %cm_env_slot_meta_ptr37 to ptr
  %meta.ptr.load39 = load ptr, ptr %cm_env_slot_pptr38, align 8
  %meta.load40 = load %struct.__RV_pmd, ptr %meta.ptr.load39, align 8
  store %struct.__RV_pmd %meta.load40, ptr %_RV_pmd_B_105309783238216_local, align 8
  %_RV_pmd_C_105309783239048_local = alloca %struct.__RV_pmd, align 8
  %cm_env_slot_meta_ptr41 = getelementptr i8, ptr %0, i64 144
  %cm_env_slot_pptr42 = bitcast ptr %cm_env_slot_meta_ptr41 to ptr
  %meta.ptr.load43 = load ptr, ptr %cm_env_slot_pptr42, align 8
  %meta.load44 = load %struct.__RV_pmd, ptr %meta.ptr.load43, align 8
  store %struct.__RV_pmd %meta.load44, ptr %_RV_pmd_C_105309783239048_local, align 8
  %_RV_pmd_D_105309783239464_local = alloca %struct.__RV_pmd, align 8
  %cm_env_slot_meta_ptr45 = getelementptr i8, ptr %0, i64 152
  %cm_env_slot_pptr46 = bitcast ptr %cm_env_slot_meta_ptr45 to ptr
  %meta.ptr.load47 = load ptr, ptr %cm_env_slot_pptr46, align 8
  %meta.load48 = load %struct.__RV_pmd, ptr %meta.ptr.load47, align 8
  store %struct.__RV_pmd %meta.load48, ptr %_RV_pmd_D_105309783239464_local, align 8
  call void @_loop_func_86(ptr %_RV_pmd_E_105309783237384_local, ptr %_RV_pmd_F_105309783238632_local, ptr %_RV_pmd_G_105309783239880_local, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, ptr %13, ptr %_RV_pmd_A_105309783237800_local, ptr %_RV_pmd_B_105309783238216_local, ptr %_RV_pmd_C_105309783239048_local, ptr %_RV_pmd_D_105309783239464_local)
  ret void
}

declare void @_Z5spawnjPFvPvES_(i32, ptr, ptr)

declare ptr @__catamaran_alloc_env(i64)

declare void @__catamaran_copy_metadata(ptr, ptr, i64)

declare void @__catamaran_reset_slab()

define internal void @_loop_func_92(ptr %_RV_pmd_C_105309783239048, ptr %_RV_pmd_D_105309783239464, ptr %_RV_pmd_F_105309783238632, ptr %i, ptr %_RV_bc_flag_105309783246856, ptr %_RV_ret_flag, ptr %j, ptr %C.addr, ptr %k, ptr %D.addr, ptr %F.addr, ptr %nm.addr, ptr %_RV_bc_flag_105309783246960, ptr %nl.addr, ptr %nj.addr, ptr %_RV_bc_flag_105309783246992, ptr %_RV_pmd_E_105309783237384, ptr %_RV_pmd_A_105309783237800, ptr %_RV_pmd_B_105309783238216, ptr %_RV_pmd_G_105309783239880) {
entry:
  %0 = bitcast ptr %_RV_pmd_C_105309783239048 to ptr
  %1 = bitcast ptr %_RV_pmd_D_105309783239464 to ptr
  %2 = bitcast ptr %_RV_pmd_F_105309783238632 to ptr
  %3 = bitcast ptr %i to ptr
  %4 = bitcast ptr %_RV_bc_flag_105309783246856 to ptr
  %5 = bitcast ptr %_RV_ret_flag to ptr
  %6 = bitcast ptr %j to ptr
  %7 = bitcast ptr %C.addr to ptr
  %8 = bitcast ptr %k to ptr
  %9 = bitcast ptr %D.addr to ptr
  %10 = bitcast ptr %F.addr to ptr
  %11 = bitcast ptr %nm.addr to ptr
  %12 = bitcast ptr %_RV_bc_flag_105309783246960 to ptr
  %13 = bitcast ptr %nl.addr to ptr
  %14 = bitcast ptr %nj.addr to ptr
  %15 = bitcast ptr %_RV_bc_flag_105309783246992 to ptr
  %16 = bitcast ptr %_RV_pmd_E_105309783237384 to ptr
  %17 = bitcast ptr %_RV_pmd_A_105309783237800 to ptr
  %18 = bitcast ptr %_RV_pmd_B_105309783238216 to ptr
  %19 = bitcast ptr %_RV_pmd_G_105309783239880 to ptr
  br label %for.cond96

for.inc189:                                       ; preds = %if.end188
  %20 = load i32, ptr %3, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %3, align 4
  br label %for.cond96

if.then150:                                       ; preds = %if.end146
  store i8 0, ptr %4, align 1
  br label %for.end159

if.end151:                                        ; preds = %if.end146
  %22 = load i8, ptr %4, align 1
  %23 = zext i8 %22 to i32
  %24 = icmp eq i32 %23, 2
  br i1 %24, label %if.then155, label %if.end156

if.end146:                                        ; preds = %_RV_lbl_105309783246856
  %25 = load i8, ptr %4, align 1
  %26 = zext i8 %25 to i32
  %27 = icmp eq i32 %26, 1
  br i1 %27, label %if.then150, label %if.end151

if.then161:                                       ; preds = %_RV_lbl_105309783246960
  br label %_RV_lbl_105309783246992

_RV_lbl_105309783246856:                          ; preds = %for.body116
  %28 = load i8, ptr %5, align 1
  %29 = icmp ne i8 %28, 0
  br i1 %29, label %if.then145, label %if.end146

for.body99:                                       ; preds = %for.cond96
  store i32 0, ptr %6, align 4
  br label %for.cond100

_RV_lbl_105309783246992:                          ; preds = %for.end175, %if.then161
  %30 = load i8, ptr %5, align 1
  %31 = icmp ne i8 %30, 0
  br i1 %31, label %exit, label %if.end178

for.body116:                                      ; preds = %for.cond113
  %32 = load ptr, ptr %7, align 8
  %33 = load ptr, ptr %7, align 8
  %34 = load i32, ptr %3, align 4
  %35 = sext i32 %34 to i64
  %36 = call i64 @__RV_check_dpv_ss(ptr noundef %0, ptr noundef %33, i64 noundef %35, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 92, i32 noundef 17, ptr noundef @.str.56)
  %37 = getelementptr inbounds [1024 x double], ptr %32, i64 %36
  %38 = load ptr, ptr %7, align 8
  %39 = load i32, ptr %3, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [1024 x double], ptr %38, i64 %40
  %42 = getelementptr inbounds [1024 x double], ptr %41, i64 0, i64 0
  %43 = load i32, ptr %8, align 4
  %44 = sext i32 %43 to i64
  %45 = call i64 @__RV_check_dpv_ss(ptr noundef %0, ptr noundef %42, i64 noundef %44, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 92, i32 noundef 20, ptr noundef @.str.68)
  %46 = getelementptr inbounds [1024 x double], ptr %37, i64 0, i64 %45
  %47 = load double, ptr %46, align 8
  %48 = load ptr, ptr %9, align 8
  %49 = load ptr, ptr %9, align 8
  %50 = load i32, ptr %8, align 4
  %51 = sext i32 %50 to i64
  %52 = call i64 @__RV_check_dpv_ss(ptr noundef %1, ptr noundef %49, i64 noundef %51, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 92, i32 noundef 27, ptr noundef @.str.69)
  %53 = getelementptr inbounds [1024 x double], ptr %48, i64 %52
  %54 = load ptr, ptr %9, align 8
  %55 = load i32, ptr %8, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [1024 x double], ptr %54, i64 %56
  %58 = getelementptr inbounds [1024 x double], ptr %57, i64 0, i64 0
  %59 = load i32, ptr %6, align 4
  %60 = sext i32 %59 to i64
  %61 = call i64 @__RV_check_dpv_ss(ptr noundef %1, ptr noundef %58, i64 noundef %60, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 92, i32 noundef 30, ptr noundef @.str.70)
  %62 = getelementptr inbounds [1024 x double], ptr %53, i64 0, i64 %61
  %63 = load double, ptr %62, align 8
  %64 = load ptr, ptr %10, align 8
  %65 = load ptr, ptr %10, align 8
  %66 = load i32, ptr %3, align 4
  %67 = sext i32 %66 to i64
  %68 = call i64 @__RV_check_dpv_ss(ptr noundef %2, ptr noundef %65, i64 noundef %67, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 92, i32 noundef 6, ptr noundef @.str.66)
  %69 = getelementptr inbounds [1024 x double], ptr %64, i64 %68
  %70 = load ptr, ptr %10, align 8
  %71 = load i32, ptr %3, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [1024 x double], ptr %70, i64 %72
  %74 = getelementptr inbounds [1024 x double], ptr %73, i64 0, i64 0
  %75 = load i32, ptr %6, align 4
  %76 = sext i32 %75 to i64
  %77 = call i64 @__RV_check_dpv_ss(ptr noundef %2, ptr noundef %74, i64 noundef %76, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 92, i32 noundef 9, ptr noundef @.str.67)
  %78 = getelementptr inbounds [1024 x double], ptr %69, i64 0, i64 %77
  %79 = load double, ptr %78, align 8
  %80 = call double @llvm.fmuladd.f64(double %47, double %63, double %79)
  store double %80, ptr %78, align 8
  br label %_RV_lbl_105309783246856

for.cond113:                                      ; preds = %for.inc157, %for.body103
  %81 = load i32, ptr %8, align 4
  %82 = load i32, ptr %11, align 4
  %83 = icmp slt i32 %81, %82
  br i1 %83, label %for.body116, label %for.end159

for.body103:                                      ; preds = %for.cond100
  %84 = load ptr, ptr %10, align 8
  %85 = load ptr, ptr %10, align 8
  %86 = load i32, ptr %3, align 4
  %87 = sext i32 %86 to i64
  %88 = call i64 @__RV_check_dpv_ss(ptr noundef %2, ptr noundef %85, i64 noundef %87, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 90, i32 noundef 4, ptr noundef @.str.66)
  %89 = getelementptr inbounds [1024 x double], ptr %84, i64 %88
  %90 = load ptr, ptr %10, align 8
  %91 = load i32, ptr %3, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [1024 x double], ptr %90, i64 %92
  %94 = getelementptr inbounds [1024 x double], ptr %93, i64 0, i64 0
  %95 = load i32, ptr %6, align 4
  %96 = sext i32 %95 to i64
  %97 = call i64 @__RV_check_dpv_ss(ptr noundef %2, ptr noundef %94, i64 noundef %96, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 90, i32 noundef 7, ptr noundef @.str.67)
  %98 = getelementptr inbounds [1024 x double], ptr %89, i64 0, i64 %97
  store double 0.000000e+00, ptr %98, align 8
  store i32 0, ptr %8, align 4
  br label %for.cond113

if.then166:                                       ; preds = %if.end162
  store i8 0, ptr %12, align 1
  br label %for.end175

for.cond100:                                      ; preds = %for.inc173, %for.body99
  %99 = load i32, ptr %6, align 4
  %100 = load i32, ptr %13, align 4
  %101 = icmp slt i32 %99, %100
  br i1 %101, label %for.body103, label %for.end175

if.then155:                                       ; preds = %if.end151
  store i8 0, ptr %4, align 1
  br label %if.end156

for.cond96:                                       ; preds = %entry, %for.inc189
  %102 = load i32, ptr %3, align 4
  %103 = load i32, ptr %14, align 4
  %104 = icmp slt i32 %102, %103
  br i1 %104, label %for.body99, label %exit1

for.end159:                                       ; preds = %for.cond113, %if.then150
  br label %_RV_lbl_105309783246960

if.then145:                                       ; preds = %_RV_lbl_105309783246856
  br label %_RV_lbl_105309783246960

_RV_lbl_105309783246960:                          ; preds = %if.then145, %for.end159
  %105 = load i8, ptr %5, align 1
  %106 = icmp ne i8 %105, 0
  br i1 %106, label %if.then161, label %if.end162

if.end167:                                        ; preds = %if.end162
  %107 = load i8, ptr %12, align 1
  %108 = zext i8 %107 to i32
  %109 = icmp eq i32 %108, 2
  br i1 %109, label %if.then171, label %if.end172

if.then171:                                       ; preds = %if.end167
  store i8 0, ptr %12, align 1
  br label %if.end172

if.end156:                                        ; preds = %if.then155, %if.end151
  br label %for.inc157

if.end178:                                        ; preds = %_RV_lbl_105309783246992
  %110 = load i8, ptr %15, align 1
  %111 = zext i8 %110 to i32
  %112 = icmp eq i32 %111, 1
  br i1 %112, label %exit2, label %if.end183

if.end183:                                        ; preds = %if.end178
  %113 = load i8, ptr %15, align 1
  %114 = zext i8 %113 to i32
  %115 = icmp eq i32 %114, 2
  br i1 %115, label %if.then187, label %if.end188

for.inc157:                                       ; preds = %if.end156
  %116 = load i32, ptr %8, align 4
  %117 = add nsw i32 %116, 1
  store i32 %117, ptr %8, align 4
  br label %for.cond113

if.end172:                                        ; preds = %if.then171, %if.end167
  br label %for.inc173

if.end162:                                        ; preds = %_RV_lbl_105309783246960
  %118 = load i8, ptr %12, align 1
  %119 = zext i8 %118 to i32
  %120 = icmp eq i32 %119, 1
  br i1 %120, label %if.then166, label %if.end167

for.inc173:                                       ; preds = %if.end172
  %121 = load i32, ptr %6, align 4
  %122 = add nsw i32 %121, 1
  store i32 %122, ptr %6, align 4
  br label %for.cond100

for.end175:                                       ; preds = %for.cond100, %if.then166
  br label %_RV_lbl_105309783246992

if.then187:                                       ; preds = %if.end183
  store i8 0, ptr %15, align 1
  br label %if.end188

if.end188:                                        ; preds = %if.then187, %if.end183
  br label %for.inc189

exit:                                             ; preds = %_RV_lbl_105309783246992
  ret void

exit1:                                            ; preds = %for.cond96
  ret void

exit2:                                            ; preds = %if.end178
  ret void
}

define internal void @_spawn_loop_func_92(ptr %0) {
entry:
  %_RV_pmd_C_105309783239048_local = alloca %struct.__RV_pmd, align 8
  %cm_env_slot_meta_ptr = getelementptr i8, ptr %0, i64 0
  %cm_env_slot_pptr = bitcast ptr %cm_env_slot_meta_ptr to ptr
  %meta.ptr.load = load ptr, ptr %cm_env_slot_pptr, align 8
  %meta.load = load %struct.__RV_pmd, ptr %meta.ptr.load, align 8
  store %struct.__RV_pmd %meta.load, ptr %_RV_pmd_C_105309783239048_local, align 8
  %_RV_pmd_D_105309783239464_local = alloca %struct.__RV_pmd, align 8
  %cm_env_slot_meta_ptr1 = getelementptr i8, ptr %0, i64 8
  %cm_env_slot_pptr2 = bitcast ptr %cm_env_slot_meta_ptr1 to ptr
  %meta.ptr.load3 = load ptr, ptr %cm_env_slot_pptr2, align 8
  %meta.load4 = load %struct.__RV_pmd, ptr %meta.ptr.load3, align 8
  store %struct.__RV_pmd %meta.load4, ptr %_RV_pmd_D_105309783239464_local, align 8
  %_RV_pmd_F_105309783238632_local = alloca %struct.__RV_pmd, align 8
  %cm_env_slot_meta_ptr5 = getelementptr i8, ptr %0, i64 16
  %cm_env_slot_pptr6 = bitcast ptr %cm_env_slot_meta_ptr5 to ptr
  %meta.ptr.load7 = load ptr, ptr %cm_env_slot_pptr6, align 8
  %meta.load8 = load %struct.__RV_pmd, ptr %meta.ptr.load7, align 8
  store %struct.__RV_pmd %meta.load8, ptr %_RV_pmd_F_105309783238632_local, align 8
  %cm_env_slot_ptr = getelementptr i8, ptr %0, i64 24
  %cm_env_slot = bitcast ptr %cm_env_slot_ptr to ptr
  %1 = load ptr, ptr %cm_env_slot, align 8
  %cm_env_slot_ptr9 = getelementptr i8, ptr %0, i64 32
  %cm_env_slot10 = bitcast ptr %cm_env_slot_ptr9 to ptr
  %2 = load ptr, ptr %cm_env_slot10, align 8
  %cm_env_slot_ptr11 = getelementptr i8, ptr %0, i64 40
  %cm_env_slot12 = bitcast ptr %cm_env_slot_ptr11 to ptr
  %3 = load ptr, ptr %cm_env_slot12, align 8
  %cm_env_slot_ptr13 = getelementptr i8, ptr %0, i64 48
  %cm_env_slot14 = bitcast ptr %cm_env_slot_ptr13 to ptr
  %4 = load ptr, ptr %cm_env_slot14, align 8
  %cm_env_slot_ptr15 = getelementptr i8, ptr %0, i64 56
  %cm_env_slot16 = bitcast ptr %cm_env_slot_ptr15 to ptr
  %5 = load ptr, ptr %cm_env_slot16, align 8
  %cm_env_slot_ptr17 = getelementptr i8, ptr %0, i64 64
  %cm_env_slot18 = bitcast ptr %cm_env_slot_ptr17 to ptr
  %6 = load ptr, ptr %cm_env_slot18, align 8
  %cm_env_slot_ptr19 = getelementptr i8, ptr %0, i64 72
  %cm_env_slot20 = bitcast ptr %cm_env_slot_ptr19 to ptr
  %7 = load ptr, ptr %cm_env_slot20, align 8
  %cm_env_slot_ptr21 = getelementptr i8, ptr %0, i64 80
  %cm_env_slot22 = bitcast ptr %cm_env_slot_ptr21 to ptr
  %8 = load ptr, ptr %cm_env_slot22, align 8
  %cm_env_slot_ptr23 = getelementptr i8, ptr %0, i64 88
  %cm_env_slot24 = bitcast ptr %cm_env_slot_ptr23 to ptr
  %9 = load ptr, ptr %cm_env_slot24, align 8
  %cm_env_slot_ptr25 = getelementptr i8, ptr %0, i64 96
  %cm_env_slot26 = bitcast ptr %cm_env_slot_ptr25 to ptr
  %10 = load ptr, ptr %cm_env_slot26, align 8
  %cm_env_slot_ptr27 = getelementptr i8, ptr %0, i64 104
  %cm_env_slot28 = bitcast ptr %cm_env_slot_ptr27 to ptr
  %11 = load ptr, ptr %cm_env_slot28, align 8
  %cm_env_slot_ptr29 = getelementptr i8, ptr %0, i64 112
  %cm_env_slot30 = bitcast ptr %cm_env_slot_ptr29 to ptr
  %12 = load ptr, ptr %cm_env_slot30, align 8
  %cm_env_slot_ptr31 = getelementptr i8, ptr %0, i64 120
  %cm_env_slot32 = bitcast ptr %cm_env_slot_ptr31 to ptr
  %13 = load ptr, ptr %cm_env_slot32, align 8
  %_RV_pmd_E_105309783237384_local = alloca %struct.__RV_pmd, align 8
  %cm_env_slot_meta_ptr33 = getelementptr i8, ptr %0, i64 128
  %cm_env_slot_pptr34 = bitcast ptr %cm_env_slot_meta_ptr33 to ptr
  %meta.ptr.load35 = load ptr, ptr %cm_env_slot_pptr34, align 8
  %meta.load36 = load %struct.__RV_pmd, ptr %meta.ptr.load35, align 8
  store %struct.__RV_pmd %meta.load36, ptr %_RV_pmd_E_105309783237384_local, align 8
  %_RV_pmd_A_105309783237800_local = alloca %struct.__RV_pmd, align 8
  %cm_env_slot_meta_ptr37 = getelementptr i8, ptr %0, i64 136
  %cm_env_slot_pptr38 = bitcast ptr %cm_env_slot_meta_ptr37 to ptr
  %meta.ptr.load39 = load ptr, ptr %cm_env_slot_pptr38, align 8
  %meta.load40 = load %struct.__RV_pmd, ptr %meta.ptr.load39, align 8
  store %struct.__RV_pmd %meta.load40, ptr %_RV_pmd_A_105309783237800_local, align 8
  %_RV_pmd_B_105309783238216_local = alloca %struct.__RV_pmd, align 8
  %cm_env_slot_meta_ptr41 = getelementptr i8, ptr %0, i64 144
  %cm_env_slot_pptr42 = bitcast ptr %cm_env_slot_meta_ptr41 to ptr
  %meta.ptr.load43 = load ptr, ptr %cm_env_slot_pptr42, align 8
  %meta.load44 = load %struct.__RV_pmd, ptr %meta.ptr.load43, align 8
  store %struct.__RV_pmd %meta.load44, ptr %_RV_pmd_B_105309783238216_local, align 8
  %_RV_pmd_G_105309783239880_local = alloca %struct.__RV_pmd, align 8
  %cm_env_slot_meta_ptr45 = getelementptr i8, ptr %0, i64 152
  %cm_env_slot_pptr46 = bitcast ptr %cm_env_slot_meta_ptr45 to ptr
  %meta.ptr.load47 = load ptr, ptr %cm_env_slot_pptr46, align 8
  %meta.load48 = load %struct.__RV_pmd, ptr %meta.ptr.load47, align 8
  store %struct.__RV_pmd %meta.load48, ptr %_RV_pmd_G_105309783239880_local, align 8
  call void @_loop_func_92(ptr %_RV_pmd_C_105309783239048_local, ptr %_RV_pmd_D_105309783239464_local, ptr %_RV_pmd_F_105309783238632_local, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, ptr %13, ptr %_RV_pmd_E_105309783237384_local, ptr %_RV_pmd_A_105309783237800_local, ptr %_RV_pmd_B_105309783238216_local, ptr %_RV_pmd_G_105309783239880_local)
  ret void
}

define internal void @_loop_func_98(ptr %_RV_pmd_E_105309783237384, ptr %_RV_pmd_A_105309783237800, ptr %_RV_pmd_B_105309783238216, ptr %_RV_bc_flag_105309783243168, ptr %_RV_ret_flag, ptr %i, ptr %ni.addr, ptr %_RV_bc_flag_105309783243304, ptr %k, ptr %nk.addr, ptr %_RV_bc_flag_105309783243272, ptr %j, ptr %nj.addr, ptr %E.addr, ptr %A.addr, ptr %B.addr, ptr %_RV_pmd_F_105309783238632, ptr %_RV_pmd_C_105309783239048, ptr %_RV_pmd_D_105309783239464, ptr %_RV_pmd_G_105309783239880) {
entry:
  %0 = bitcast ptr %_RV_pmd_E_105309783237384 to ptr
  %1 = bitcast ptr %_RV_pmd_A_105309783237800 to ptr
  %2 = bitcast ptr %_RV_pmd_B_105309783238216 to ptr
  %3 = bitcast ptr %_RV_bc_flag_105309783243168 to ptr
  %4 = bitcast ptr %_RV_ret_flag to ptr
  %5 = bitcast ptr %i to ptr
  %6 = bitcast ptr %ni.addr to ptr
  %7 = bitcast ptr %_RV_bc_flag_105309783243304 to ptr
  %8 = bitcast ptr %k to ptr
  %9 = bitcast ptr %nk.addr to ptr
  %10 = bitcast ptr %_RV_bc_flag_105309783243272 to ptr
  %11 = bitcast ptr %j to ptr
  %12 = bitcast ptr %nj.addr to ptr
  %13 = bitcast ptr %E.addr to ptr
  %14 = bitcast ptr %A.addr to ptr
  %15 = bitcast ptr %B.addr to ptr
  %16 = bitcast ptr %_RV_pmd_F_105309783238632 to ptr
  %17 = bitcast ptr %_RV_pmd_C_105309783239048 to ptr
  %18 = bitcast ptr %_RV_pmd_D_105309783239464 to ptr
  %19 = bitcast ptr %_RV_pmd_G_105309783239880 to ptr
  br label %for.cond

if.end58:                                         ; preds = %if.end
  %20 = load i8, ptr %3, align 1
  %21 = zext i8 %20 to i32
  %22 = icmp eq i32 %21, 2
  br i1 %22, label %if.then62, label %if.end63

if.end:                                           ; preds = %_RV_lbl_105309783243168
  %23 = load i8, ptr %3, align 1
  %24 = zext i8 %23 to i32
  %25 = icmp eq i32 %24, 1
  br i1 %25, label %if.then57, label %if.end58

_RV_lbl_105309783243168:                          ; preds = %for.body26
  %26 = load i8, ptr %4, align 1
  %27 = icmp ne i8 %26, 0
  br i1 %27, label %if.then, label %if.end

for.cond:                                         ; preds = %entry, %for.inc93
  %28 = load i32, ptr %5, align 4
  %29 = load i32, ptr %6, align 4
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %for.body, label %exit

if.then62:                                        ; preds = %if.end58
  store i8 0, ptr %3, align 1
  br label %if.end63

if.then57:                                        ; preds = %if.end
  store i8 0, ptr %3, align 1
  br label %for.end

if.end87:                                         ; preds = %if.end82
  %31 = load i8, ptr %7, align 1
  %32 = zext i8 %31 to i32
  %33 = icmp eq i32 %32, 2
  br i1 %33, label %if.then91, label %if.end92

for.inc:                                          ; preds = %if.end63
  %34 = load i32, ptr %8, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %8, align 4
  br label %for.cond23

if.end92:                                         ; preds = %if.then91, %if.end87
  br label %for.inc93

for.cond23:                                       ; preds = %for.body17, %for.inc
  %36 = load i32, ptr %8, align 4
  %37 = load i32, ptr %9, align 4
  %38 = icmp slt i32 %36, %37
  br i1 %38, label %for.body26, label %for.end

if.end71:                                         ; preds = %if.end66
  %39 = load i8, ptr %10, align 1
  %40 = zext i8 %39 to i32
  %41 = icmp eq i32 %40, 2
  br i1 %41, label %if.then75, label %if.end76

for.cond15:                                       ; preds = %for.inc77, %for.body
  %42 = load i32, ptr %11, align 4
  %43 = load i32, ptr %12, align 4
  %44 = icmp slt i32 %42, %43
  br i1 %44, label %for.body17, label %for.end79

for.body17:                                       ; preds = %for.cond15
  %45 = load ptr, ptr %13, align 8
  %46 = load ptr, ptr %13, align 8
  %47 = load i32, ptr %5, align 4
  %48 = sext i32 %47 to i64
  %49 = call i64 @__RV_check_dpv_ss(ptr noundef %0, ptr noundef %46, i64 noundef %48, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 82, i32 noundef 4, ptr noundef @.str.61)
  %50 = getelementptr inbounds [1024 x double], ptr %45, i64 %49
  %51 = load ptr, ptr %13, align 8
  %52 = load i32, ptr %5, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [1024 x double], ptr %51, i64 %53
  %55 = getelementptr inbounds [1024 x double], ptr %54, i64 0, i64 0
  %56 = load i32, ptr %11, align 4
  %57 = sext i32 %56 to i64
  %58 = call i64 @__RV_check_dpv_ss(ptr noundef %0, ptr noundef %55, i64 noundef %57, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 82, i32 noundef 7, ptr noundef @.str.62)
  %59 = getelementptr inbounds [1024 x double], ptr %50, i64 0, i64 %58
  store double 0.000000e+00, ptr %59, align 8
  store i32 0, ptr %8, align 4
  br label %for.cond23

for.end:                                          ; preds = %for.cond23, %if.then57
  br label %_RV_lbl_105309783243272

_RV_lbl_105309783243304:                          ; preds = %if.then65, %for.end79
  %60 = load i8, ptr %4, align 1
  %61 = icmp ne i8 %60, 0
  br i1 %61, label %exit1, label %if.end82

if.end63:                                         ; preds = %if.then62, %if.end58
  br label %for.inc

for.body:                                         ; preds = %for.cond
  store i32 0, ptr %11, align 4
  br label %for.cond15

if.then:                                          ; preds = %_RV_lbl_105309783243168
  br label %_RV_lbl_105309783243272

_RV_lbl_105309783243272:                          ; preds = %if.then, %for.end
  %62 = load i8, ptr %4, align 1
  %63 = icmp ne i8 %62, 0
  br i1 %63, label %if.then65, label %if.end66

if.then75:                                        ; preds = %if.end71
  store i8 0, ptr %10, align 1
  br label %if.end76

if.end76:                                         ; preds = %if.then75, %if.end71
  br label %for.inc77

for.body26:                                       ; preds = %for.cond23
  %64 = load ptr, ptr %14, align 8
  %65 = load ptr, ptr %14, align 8
  %66 = load i32, ptr %5, align 4
  %67 = sext i32 %66 to i64
  %68 = call i64 @__RV_check_dpv_ss(ptr noundef %1, ptr noundef %65, i64 noundef %67, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 84, i32 noundef 17, ptr noundef @.str.52)
  %69 = getelementptr inbounds [1024 x double], ptr %64, i64 %68
  %70 = load ptr, ptr %14, align 8
  %71 = load i32, ptr %5, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [1024 x double], ptr %70, i64 %72
  %74 = getelementptr inbounds [1024 x double], ptr %73, i64 0, i64 0
  %75 = load i32, ptr %8, align 4
  %76 = sext i32 %75 to i64
  %77 = call i64 @__RV_check_dpv_ss(ptr noundef %1, ptr noundef %74, i64 noundef %76, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 84, i32 noundef 20, ptr noundef @.str.63)
  %78 = getelementptr inbounds [1024 x double], ptr %69, i64 0, i64 %77
  %79 = load double, ptr %78, align 8
  %80 = load ptr, ptr %15, align 8
  %81 = load ptr, ptr %15, align 8
  %82 = load i32, ptr %8, align 4
  %83 = sext i32 %82 to i64
  %84 = call i64 @__RV_check_dpv_ss(ptr noundef %2, ptr noundef %81, i64 noundef %83, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 84, i32 noundef 27, ptr noundef @.str.64)
  %85 = getelementptr inbounds [1024 x double], ptr %80, i64 %84
  %86 = load ptr, ptr %15, align 8
  %87 = load i32, ptr %8, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [1024 x double], ptr %86, i64 %88
  %90 = getelementptr inbounds [1024 x double], ptr %89, i64 0, i64 0
  %91 = load i32, ptr %11, align 4
  %92 = sext i32 %91 to i64
  %93 = call i64 @__RV_check_dpv_ss(ptr noundef %2, ptr noundef %90, i64 noundef %92, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 84, i32 noundef 30, ptr noundef @.str.65)
  %94 = getelementptr inbounds [1024 x double], ptr %85, i64 0, i64 %93
  %95 = load double, ptr %94, align 8
  %96 = load ptr, ptr %13, align 8
  %97 = load ptr, ptr %13, align 8
  %98 = load i32, ptr %5, align 4
  %99 = sext i32 %98 to i64
  %100 = call i64 @__RV_check_dpv_ss(ptr noundef %0, ptr noundef %97, i64 noundef %99, i64 noundef 8192, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 84, i32 noundef 6, ptr noundef @.str.61)
  %101 = getelementptr inbounds [1024 x double], ptr %96, i64 %100
  %102 = load ptr, ptr %13, align 8
  %103 = load i32, ptr %5, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [1024 x double], ptr %102, i64 %104
  %106 = getelementptr inbounds [1024 x double], ptr %105, i64 0, i64 0
  %107 = load i32, ptr %11, align 4
  %108 = sext i32 %107 to i64
  %109 = call i64 @__RV_check_dpv_ss(ptr noundef %0, ptr noundef %106, i64 noundef %108, i64 noundef 8, ptr noundef @.str.30, ptr noundef @.str.60, i32 noundef 84, i32 noundef 9, ptr noundef @.str.62)
  %110 = getelementptr inbounds [1024 x double], ptr %101, i64 0, i64 %109
  %111 = load double, ptr %110, align 8
  %112 = call double @llvm.fmuladd.f64(double %79, double %95, double %111)
  store double %112, ptr %110, align 8
  br label %_RV_lbl_105309783243168

if.end66:                                         ; preds = %_RV_lbl_105309783243272
  %113 = load i8, ptr %10, align 1
  %114 = zext i8 %113 to i32
  %115 = icmp eq i32 %114, 1
  br i1 %115, label %if.then70, label %if.end71

for.inc77:                                        ; preds = %if.end76
  %116 = load i32, ptr %11, align 4
  %117 = add nsw i32 %116, 1
  store i32 %117, ptr %11, align 4
  br label %for.cond15

if.then70:                                        ; preds = %if.end66
  store i8 0, ptr %10, align 1
  br label %for.end79

if.then91:                                        ; preds = %if.end87
  store i8 0, ptr %7, align 1
  br label %if.end92

for.end79:                                        ; preds = %if.then70, %for.cond15
  br label %_RV_lbl_105309783243304

if.then65:                                        ; preds = %_RV_lbl_105309783243272
  br label %_RV_lbl_105309783243304

for.inc93:                                        ; preds = %if.end92
  %118 = load i32, ptr %5, align 4
  %119 = add nsw i32 %118, 1
  store i32 %119, ptr %5, align 4
  br label %for.cond

if.end82:                                         ; preds = %_RV_lbl_105309783243304
  %120 = load i8, ptr %7, align 1
  %121 = zext i8 %120 to i32
  %122 = icmp eq i32 %121, 1
  br i1 %122, label %exit2, label %if.end87

exit:                                             ; preds = %for.cond
  ret void

exit1:                                            ; preds = %_RV_lbl_105309783243304
  ret void

exit2:                                            ; preds = %if.end82
  ret void
}

define internal void @_spawn_loop_func_98(ptr %0) {
entry:
  %_RV_pmd_E_105309783237384_local = alloca %struct.__RV_pmd, align 8
  %cm_env_slot_meta_ptr = getelementptr i8, ptr %0, i64 0
  %cm_env_slot_pptr = bitcast ptr %cm_env_slot_meta_ptr to ptr
  %meta.ptr.load = load ptr, ptr %cm_env_slot_pptr, align 8
  %meta.load = load %struct.__RV_pmd, ptr %meta.ptr.load, align 8
  store %struct.__RV_pmd %meta.load, ptr %_RV_pmd_E_105309783237384_local, align 8
  %_RV_pmd_A_105309783237800_local = alloca %struct.__RV_pmd, align 8
  %cm_env_slot_meta_ptr1 = getelementptr i8, ptr %0, i64 8
  %cm_env_slot_pptr2 = bitcast ptr %cm_env_slot_meta_ptr1 to ptr
  %meta.ptr.load3 = load ptr, ptr %cm_env_slot_pptr2, align 8
  %meta.load4 = load %struct.__RV_pmd, ptr %meta.ptr.load3, align 8
  store %struct.__RV_pmd %meta.load4, ptr %_RV_pmd_A_105309783237800_local, align 8
  %_RV_pmd_B_105309783238216_local = alloca %struct.__RV_pmd, align 8
  %cm_env_slot_meta_ptr5 = getelementptr i8, ptr %0, i64 16
  %cm_env_slot_pptr6 = bitcast ptr %cm_env_slot_meta_ptr5 to ptr
  %meta.ptr.load7 = load ptr, ptr %cm_env_slot_pptr6, align 8
  %meta.load8 = load %struct.__RV_pmd, ptr %meta.ptr.load7, align 8
  store %struct.__RV_pmd %meta.load8, ptr %_RV_pmd_B_105309783238216_local, align 8
  %cm_env_slot_ptr = getelementptr i8, ptr %0, i64 24
  %cm_env_slot = bitcast ptr %cm_env_slot_ptr to ptr
  %1 = load ptr, ptr %cm_env_slot, align 8
  %cm_env_slot_ptr9 = getelementptr i8, ptr %0, i64 32
  %cm_env_slot10 = bitcast ptr %cm_env_slot_ptr9 to ptr
  %2 = load ptr, ptr %cm_env_slot10, align 8
  %cm_env_slot_ptr11 = getelementptr i8, ptr %0, i64 40
  %cm_env_slot12 = bitcast ptr %cm_env_slot_ptr11 to ptr
  %3 = load ptr, ptr %cm_env_slot12, align 8
  %cm_env_slot_ptr13 = getelementptr i8, ptr %0, i64 48
  %cm_env_slot14 = bitcast ptr %cm_env_slot_ptr13 to ptr
  %4 = load ptr, ptr %cm_env_slot14, align 8
  %cm_env_slot_ptr15 = getelementptr i8, ptr %0, i64 56
  %cm_env_slot16 = bitcast ptr %cm_env_slot_ptr15 to ptr
  %5 = load ptr, ptr %cm_env_slot16, align 8
  %cm_env_slot_ptr17 = getelementptr i8, ptr %0, i64 64
  %cm_env_slot18 = bitcast ptr %cm_env_slot_ptr17 to ptr
  %6 = load ptr, ptr %cm_env_slot18, align 8
  %cm_env_slot_ptr19 = getelementptr i8, ptr %0, i64 72
  %cm_env_slot20 = bitcast ptr %cm_env_slot_ptr19 to ptr
  %7 = load ptr, ptr %cm_env_slot20, align 8
  %cm_env_slot_ptr21 = getelementptr i8, ptr %0, i64 80
  %cm_env_slot22 = bitcast ptr %cm_env_slot_ptr21 to ptr
  %8 = load ptr, ptr %cm_env_slot22, align 8
  %cm_env_slot_ptr23 = getelementptr i8, ptr %0, i64 88
  %cm_env_slot24 = bitcast ptr %cm_env_slot_ptr23 to ptr
  %9 = load ptr, ptr %cm_env_slot24, align 8
  %cm_env_slot_ptr25 = getelementptr i8, ptr %0, i64 96
  %cm_env_slot26 = bitcast ptr %cm_env_slot_ptr25 to ptr
  %10 = load ptr, ptr %cm_env_slot26, align 8
  %cm_env_slot_ptr27 = getelementptr i8, ptr %0, i64 104
  %cm_env_slot28 = bitcast ptr %cm_env_slot_ptr27 to ptr
  %11 = load ptr, ptr %cm_env_slot28, align 8
  %cm_env_slot_ptr29 = getelementptr i8, ptr %0, i64 112
  %cm_env_slot30 = bitcast ptr %cm_env_slot_ptr29 to ptr
  %12 = load ptr, ptr %cm_env_slot30, align 8
  %cm_env_slot_ptr31 = getelementptr i8, ptr %0, i64 120
  %cm_env_slot32 = bitcast ptr %cm_env_slot_ptr31 to ptr
  %13 = load ptr, ptr %cm_env_slot32, align 8
  %_RV_pmd_F_105309783238632_local = alloca %struct.__RV_pmd, align 8
  %cm_env_slot_meta_ptr33 = getelementptr i8, ptr %0, i64 128
  %cm_env_slot_pptr34 = bitcast ptr %cm_env_slot_meta_ptr33 to ptr
  %meta.ptr.load35 = load ptr, ptr %cm_env_slot_pptr34, align 8
  %meta.load36 = load %struct.__RV_pmd, ptr %meta.ptr.load35, align 8
  store %struct.__RV_pmd %meta.load36, ptr %_RV_pmd_F_105309783238632_local, align 8
  %_RV_pmd_C_105309783239048_local = alloca %struct.__RV_pmd, align 8
  %cm_env_slot_meta_ptr37 = getelementptr i8, ptr %0, i64 136
  %cm_env_slot_pptr38 = bitcast ptr %cm_env_slot_meta_ptr37 to ptr
  %meta.ptr.load39 = load ptr, ptr %cm_env_slot_pptr38, align 8
  %meta.load40 = load %struct.__RV_pmd, ptr %meta.ptr.load39, align 8
  store %struct.__RV_pmd %meta.load40, ptr %_RV_pmd_C_105309783239048_local, align 8
  %_RV_pmd_D_105309783239464_local = alloca %struct.__RV_pmd, align 8
  %cm_env_slot_meta_ptr41 = getelementptr i8, ptr %0, i64 144
  %cm_env_slot_pptr42 = bitcast ptr %cm_env_slot_meta_ptr41 to ptr
  %meta.ptr.load43 = load ptr, ptr %cm_env_slot_pptr42, align 8
  %meta.load44 = load %struct.__RV_pmd, ptr %meta.ptr.load43, align 8
  store %struct.__RV_pmd %meta.load44, ptr %_RV_pmd_D_105309783239464_local, align 8
  %_RV_pmd_G_105309783239880_local = alloca %struct.__RV_pmd, align 8
  %cm_env_slot_meta_ptr45 = getelementptr i8, ptr %0, i64 152
  %cm_env_slot_pptr46 = bitcast ptr %cm_env_slot_meta_ptr45 to ptr
  %meta.ptr.load47 = load ptr, ptr %cm_env_slot_pptr46, align 8
  %meta.load48 = load %struct.__RV_pmd, ptr %meta.ptr.load47, align 8
  store %struct.__RV_pmd %meta.load48, ptr %_RV_pmd_G_105309783239880_local, align 8
  call void @_loop_func_98(ptr %_RV_pmd_E_105309783237384_local, ptr %_RV_pmd_A_105309783237800_local, ptr %_RV_pmd_B_105309783238216_local, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, ptr %13, ptr %_RV_pmd_F_105309783238632_local, ptr %_RV_pmd_C_105309783239048_local, ptr %_RV_pmd_D_105309783239464_local, ptr %_RV_pmd_G_105309783239880_local)
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
!62 = distinct !{!62, !7}
!63 = distinct !{!63, !7}
!64 = distinct !{!64, !7}
!65 = distinct !{!65, !7}
!66 = distinct !{!66, !7}
!67 = distinct !{!67, !7}
!68 = distinct !{!68, !7}
!69 = distinct !{!69, !7}
!70 = distinct !{!70, !7}
!71 = distinct !{!71, !7}
!72 = distinct !{!72, !7}

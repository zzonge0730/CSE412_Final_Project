; ModuleID = 'examples/CM-MoveC-2mm.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct._RV_pmd = type { i8*, i8*, %struct._RV_stat_node*, i8 }
%struct._RV_stat_node = type { i32, i64 }
%struct._RV_hashtbl = type { i8**, i64, i64, i64 }
%struct._RV_fmd_pmd = type { i8*, i8*, %struct._RV_stat_node* }
%struct._RV_fmd = type { %struct._RV_fmd_pmd*, i8, void (...)*, %struct._RV_fmd* }
%struct.option = type { i8*, i32, i32*, i32 }
%struct.lconv = type { i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8 }
%struct.passwd = type { i8*, i8*, i32, i32, i8*, i8*, i8* }
%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct._G_fpos_t = type { i64, %struct.__mbstate_t }
%struct.__mbstate_t = type { i32, %union.anon }
%union.anon = type { i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }
%struct.tms = type { i64, i64, i64, i64 }
%struct.utimbuf = type { i64, i64 }

@_RV_error_count = global i64 0, align 8
@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [20 x i8] c"1 error generated.\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"%lu errors generated.\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"The pmd does not exist.\0A\00", align 1
@.str3 = private unnamed_addr constant [31 x i8] c"The pmd is [%p, %p), status = \00", align 1
@.str4 = private unnamed_addr constant [8 x i8] c"(null)\0A\00", align 1
@.str5 = private unnamed_addr constant [11 x i8] c"(%d, %lu)\0A\00", align 1
@.str6 = private unnamed_addr constant [43 x i8] c"error: memory leak of the block [%p, %p).\0A\00", align 1
@.str7 = private unnamed_addr constant [85 x i8] c"error: memory leak of the block [%p, %p), the last pointer is a function parameter.\0A\00", align 1
@_RV_TRIE_PRIMARY_ENTRIES = constant i64 8388608, align 8
@_RV_TRIE_SECONDARY_ENTRIES = constant i64 4194304, align 8
@.str8 = private unnamed_addr constant [27 x i8] c"trie_primary != (void *)-1\00", align 1
@.str9 = private unnamed_addr constant [16 x i8] c"./_RV_memsafe.c\00", align 1
@__PRETTY_FUNCTION__._RV_trie_create = private unnamed_addr constant [28 x i8] c"_RV_pmd **_RV_trie_create()\00", align 1
@.str10 = private unnamed_addr constant [28 x i8] c"trie_secondary != (void*)-1\00", align 1
@__PRETTY_FUNCTION__._RV_trie_create_secondary = private unnamed_addr constant [37 x i8] c"_RV_pmd *_RV_trie_create_secondary()\00", align 1
@_RV_trie_get_trie_ref_pmd.tbl = internal global %struct._RV_pmd** null, align 8
@_RV_hashtbl_get_hashtbl_ref_fmd.tbl = internal global %struct._RV_hashtbl* null, align 8
@.str11 = private unnamed_addr constant [43 x i8] c"The pmd of %s (addr = %p) does not exist.\0A\00", align 1
@.str12 = private unnamed_addr constant [49 x i8] c"The pmd of %s (addr = %p) is [%p, %p), status = \00", align 1
@.str13 = private unnamed_addr constant [43 x i8] c"The fpmd of %s (param %d) does not exist.\0A\00", align 1
@.str14 = private unnamed_addr constant [49 x i8] c"The fpmd of %s (param %d) is [%p, %p), status = \00", align 1
@.str15 = private unnamed_addr constant [23 x i8] c"%s: In function '%s':\0A\00", align 1
@.str16 = private unnamed_addr constant [69 x i8] c"%s:%d:%d: error: dereferenced pointer '%s' is NULL. [spatial error]\0A\00", align 1
@.str17 = private unnamed_addr constant [128 x i8] c"%s:%d:%d: error: dereferenced pointer '%s' (val = %p, size = %lu) points to an invalid object (uninitialized). [spatial error]\0A\00", align 1
@.str18 = private unnamed_addr constant [142 x i8] c"%s:%d:%d: error: dereferenced pointer '%s' (val = %p, size = %lu) points to an invalid object (original block is [%p, %p)). [temporal error]\0A\00", align 1
@.str19 = private unnamed_addr constant [126 x i8] c"%s:%d:%d: error: dereferenced pointer '%s' (val = %p, size = %lu) points to a function %p, not a data block. [segment error]\0A\00", align 1
@.str20 = private unnamed_addr constant [113 x i8] c"%s:%d:%d: error: dereferenced pointer '%s' (val = %p, size = %lu) is out of the block [%p, %p). [spatial error]\0A\00", align 1
@.str21 = private unnamed_addr constant [116 x i8] c"%s:%d:%d: error: dereferenced pointer '%s' (val = %p) points to an invalid object (uninitialized). [spatial error]\0A\00", align 1
@.str22 = private unnamed_addr constant [130 x i8] c"%s:%d:%d: error: dereferenced pointer '%s' (val = %p) points to an invalid object (original block is [%p, %p)). [temporal error]\0A\00", align 1
@.str23 = private unnamed_addr constant [128 x i8] c"%s:%d:%d: error: dereferenced pointer '%s' (val = %p) does not point to a function, but a data block [%p, %p). [segment error]\0A\00", align 1
@.str24 = private unnamed_addr constant [110 x i8] c"%s:%d:%d: error: dereferenced pointer '%s' (val = %p) is not the address of the function %p. [spatial error]\0A\00", align 1
@_RV_global_sa = common global %struct._RV_stat_node* null, align 8
@_RV_static_sa = common global %struct._RV_stat_node* null, align 8
@optarg = external global i8*
@_RV_tmpnam.temp_file = internal global [20 x i8] c"tmp_XXXXXX\00\00\00\00\00\00\00\00\00\00", align 16
@stdin = external global %struct._IO_FILE*
@stdout = external global %struct._IO_FILE*
@.str25 = private unnamed_addr constant [109 x i8] c"%s:%d:%d: error: freed pointer '%s' (val = %p) points to an invalid object (uninitialized). [spatial error]\0A\00", align 1
@.str26 = private unnamed_addr constant [137 x i8] c"%s:%d:%d: error: freed pointer '%s' (val = %p) points to an invalid object (original block is [%p, %p)). [temporal error][illegal free]\0A\00", align 1
@.str27 = private unnamed_addr constant [140 x i8] c"%s:%d:%d: error: freed pointer '%s' (val = %p) does not point to a heap object (original block is [%p, %p)). [segment error][illegal free]\0A\00", align 1
@.str28 = private unnamed_addr constant [132 x i8] c"%s:%d:%d: error: freed pointer '%s' (val = %p) is not the base address (original block is [%p, %p)). [spatial error][illegal free]\0A\00", align 1
@_RV_strtok.pmd = internal global { i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] } { i8* null, i8* null, %struct._RV_stat_node* null, i8 0, [7 x i8] undef }, align 8
@.str29 = private unnamed_addr constant [46 x i8] c"error: unhandled call wrapper by pointer %p.\0A\00", align 1
@_RV_function_sa = common global %struct._RV_stat_node* null, align 8
@_RV_library_sa = common global %struct._RV_stat_node* null, align 8
@_RV_main._RV_pmd_argv_42907248 = private unnamed_addr constant { i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] } { i8* null, i8* null, %struct._RV_stat_node* null, i8 0, [7 x i8] undef }, align 8
@_RV_main._RV_pmd_tmp_42910624 = private unnamed_addr constant { i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] } { i8* null, i8* null, %struct._RV_stat_node* null, i8 0, [7 x i8] undef }, align 8
@_RV_main._RV_pmd_A_42912336 = private unnamed_addr constant { i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] } { i8* null, i8* null, %struct._RV_stat_node* null, i8 0, [7 x i8] undef }, align 8
@_RV_main._RV_pmd_B_42914000 = private unnamed_addr constant { i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] } { i8* null, i8* null, %struct._RV_stat_node* null, i8 0, [7 x i8] undef }, align 8
@_RV_main._RV_pmd_C_42916256 = private unnamed_addr constant { i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] } { i8* null, i8* null, %struct._RV_stat_node* null, i8 0, [7 x i8] undef }, align 8
@_RV_main._RV_pmd_D_42917920 = private unnamed_addr constant { i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] } { i8* null, i8* null, %struct._RV_stat_node* null, i8 0, [7 x i8] undef }, align 8
@.str30 = private unnamed_addr constant [6 x i8] c"2mm.c\00", align 1
@.str31 = private unnamed_addr constant [5 x i8] c"main\00", align 1
@.str32 = private unnamed_addr constant [8 x i8] c"argv[1]\00", align 1
@.str33 = private unnamed_addr constant [5 x i8] c"atoi\00", align 1
@.str34 = private unnamed_addr constant [8 x i8] c"argv[2]\00", align 1
@.str35 = private unnamed_addr constant [8 x i8] c"argv[3]\00", align 1
@.str36 = private unnamed_addr constant [8 x i8] c"argv[4]\00", align 1
@.str37 = private unnamed_addr constant [8 x i8] c"argv[5]\00", align 1
@.str38 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str39 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str40 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str41 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str42 = private unnamed_addr constant [4 x i8] c"tmp\00", align 1
@.str43 = private unnamed_addr constant [5 x i8] c"free\00", align 1
@.str44 = private unnamed_addr constant [12 x i8] c"(void *)tmp\00", align 1
@.str45 = private unnamed_addr constant [10 x i8] c"(void *)A\00", align 1
@.str46 = private unnamed_addr constant [10 x i8] c"(void *)B\00", align 1
@.str47 = private unnamed_addr constant [10 x i8] c"(void *)C\00", align 1
@.str48 = private unnamed_addr constant [10 x i8] c"(void *)D\00", align 1
@print_array._RV_pmd_D_42891904 = private unnamed_addr constant { i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] } { i8* null, i8* null, %struct._RV_stat_node* null, i8 0, [7 x i8] undef }, align 8
@.str49 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str50 = private unnamed_addr constant [12 x i8] c"print_array\00", align 1
@.str51 = private unnamed_addr constant [8 x i8] c"D[i][j]\00", align 1
@.str52 = private unnamed_addr constant [5 x i8] c"D[i]\00", align 1
@.str53 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str54 = private unnamed_addr constant [31 x i8] c"2mm.c: In function 'fprintf':\0A\00", align 1
@.str55 = private unnamed_addr constant [126 x i8] c"2mm.c:57:20: error: the format string \22\5Cn\22 takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\0A\00", align 1
@.str56 = private unnamed_addr constant [8 x i8] c"fprintf\00", align 1
@.str57 = private unnamed_addr constant [7 x i8] c"stderr\00", align 1
@.str58 = private unnamed_addr constant [5 x i8] c"\22\5Cn\22\00", align 1
@.str59 = private unnamed_addr constant [126 x i8] c"2mm.c:55:52: error: the format string \22\5Cn\22 takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\0A\00", align 1
@.str60 = private unnamed_addr constant [132 x i8] c"2mm.c:54:24: error: the format string \22%%0.2lf \22 takes %d format specifiers but fprintf has only 1 data arguments. [spatial error]\0A\00", align 1
@.str61 = private unnamed_addr constant [10 x i8] c"\22%0.2lf \22\00", align 1
@kernel_2mm._RV_pmd_tmp_42896608 = private unnamed_addr constant { i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] } { i8* null, i8* null, %struct._RV_stat_node* null, i8 0, [7 x i8] undef }, align 8
@kernel_2mm._RV_pmd_A_42897104 = private unnamed_addr constant { i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] } { i8* null, i8* null, %struct._RV_stat_node* null, i8 0, [7 x i8] undef }, align 8
@kernel_2mm._RV_pmd_B_42898816 = private unnamed_addr constant { i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] } { i8* null, i8* null, %struct._RV_stat_node* null, i8 0, [7 x i8] undef }, align 8
@kernel_2mm._RV_pmd_C_42899312 = private unnamed_addr constant { i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] } { i8* null, i8* null, %struct._RV_stat_node* null, i8 0, [7 x i8] undef }, align 8
@kernel_2mm._RV_pmd_D_42899808 = private unnamed_addr constant { i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] } { i8* null, i8* null, %struct._RV_stat_node* null, i8 0, [7 x i8] undef }, align 8
@.str62 = private unnamed_addr constant [11 x i8] c"kernel_2mm\00", align 1
@.str63 = private unnamed_addr constant [10 x i8] c"tmp[i][j]\00", align 1
@.str64 = private unnamed_addr constant [7 x i8] c"tmp[i]\00", align 1
@.str65 = private unnamed_addr constant [8 x i8] c"A[i][k]\00", align 1
@.str66 = private unnamed_addr constant [5 x i8] c"A[i]\00", align 1
@.str67 = private unnamed_addr constant [8 x i8] c"B[k][j]\00", align 1
@.str68 = private unnamed_addr constant [5 x i8] c"B[k]\00", align 1
@.str69 = private unnamed_addr constant [10 x i8] c"tmp[i][k]\00", align 1
@.str70 = private unnamed_addr constant [8 x i8] c"C[k][j]\00", align 1
@.str71 = private unnamed_addr constant [5 x i8] c"C[k]\00", align 1
@init_array._RV_pmd_alpha_42855160 = private unnamed_addr constant { i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] } { i8* null, i8* null, %struct._RV_stat_node* null, i8 0, [7 x i8] undef }, align 8
@init_array._RV_pmd_beta_42855280 = private unnamed_addr constant { i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] } { i8* null, i8* null, %struct._RV_stat_node* null, i8 0, [7 x i8] undef }, align 8
@init_array._RV_pmd_A_42880832 = private unnamed_addr constant { i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] } { i8* null, i8* null, %struct._RV_stat_node* null, i8 0, [7 x i8] undef }, align 8
@init_array._RV_pmd_B_42881328 = private unnamed_addr constant { i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] } { i8* null, i8* null, %struct._RV_stat_node* null, i8 0, [7 x i8] undef }, align 8
@init_array._RV_pmd_C_42881824 = private unnamed_addr constant { i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] } { i8* null, i8* null, %struct._RV_stat_node* null, i8 0, [7 x i8] undef }, align 8
@init_array._RV_pmd_D_42882320 = private unnamed_addr constant { i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] } { i8* null, i8* null, %struct._RV_stat_node* null, i8 0, [7 x i8] undef }, align 8
@.str72 = private unnamed_addr constant [11 x i8] c"init_array\00", align 1
@.str73 = private unnamed_addr constant [6 x i8] c"alpha\00", align 1
@.str74 = private unnamed_addr constant [5 x i8] c"beta\00", align 1
@.str75 = private unnamed_addr constant [8 x i8] c"A[i][j]\00", align 1
@.str76 = private unnamed_addr constant [8 x i8] c"B[i][j]\00", align 1
@.str77 = private unnamed_addr constant [5 x i8] c"B[i]\00", align 1
@.str78 = private unnamed_addr constant [8 x i8] c"C[i][j]\00", align 1
@.str79 = private unnamed_addr constant [5 x i8] c"C[i]\00", align 1

; Function Attrs: nounwind uwtable
define void @_RV_print_error_count() #0 {
  call void @_RV_global_clear_code()
  %1 = load i64* @_RV_error_count, align 8
  %2 = icmp eq i64 %1, 1
  br i1 %2, label %3, label %6

; <label>:3                                       ; preds = %0
  %4 = load %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([20 x i8]* @.str, i32 0, i32 0))
  br label %6

; <label>:6                                       ; preds = %3, %0
  %7 = load i64* @_RV_error_count, align 8
  %8 = icmp ugt i64 %7, 1
  br i1 %8, label %9, label %13

; <label>:9                                       ; preds = %6
  %10 = load %struct._IO_FILE** @stderr, align 8
  %11 = load i64* @_RV_error_count, align 8
  %12 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0), i64 %11)
  br label %13

; <label>:13                                      ; preds = %9, %6
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_stat_node* @_RV_stat_node_create(i32 %stat, i64 %count) #2 {
  %1 = alloca %struct._RV_stat_node*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i64, align 8
  %snda = alloca %struct._RV_stat_node*, align 8
  store i32 %stat, i32* %2, align 4
  store i64 %count, i64* %3, align 8
  %4 = call noalias i8* @malloc(i64 16) #7
  %5 = bitcast i8* %4 to %struct._RV_stat_node*
  store %struct._RV_stat_node* %5, %struct._RV_stat_node** %snda, align 8
  %6 = load %struct._RV_stat_node** %snda, align 8
  %7 = icmp eq %struct._RV_stat_node* %6, null
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  store %struct._RV_stat_node* null, %struct._RV_stat_node** %1
  br label %17

; <label>:9                                       ; preds = %0
  %10 = load i32* %2, align 4
  %11 = load %struct._RV_stat_node** %snda, align 8
  %12 = getelementptr inbounds %struct._RV_stat_node* %11, i32 0, i32 0
  store i32 %10, i32* %12, align 4
  %13 = load i64* %3, align 8
  %14 = load %struct._RV_stat_node** %snda, align 8
  %15 = getelementptr inbounds %struct._RV_stat_node* %14, i32 0, i32 1
  store i64 %13, i64* %15, align 8
  %16 = load %struct._RV_stat_node** %snda, align 8
  store %struct._RV_stat_node* %16, %struct._RV_stat_node** %1
  br label %17

; <label>:17                                      ; preds = %9, %8
  %18 = load %struct._RV_stat_node** %1
  ret %struct._RV_stat_node* %18
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: inlinehint nounwind uwtable
define i32 @_RV_stat_node_get_stat(%struct._RV_stat_node* %snda) #2 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._RV_stat_node*, align 8
  store %struct._RV_stat_node* %snda, %struct._RV_stat_node** %2, align 8
  %3 = load %struct._RV_stat_node** %2, align 8
  %4 = icmp eq %struct._RV_stat_node* %3, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i32 0, i32* %1
  br label %10

; <label>:6                                       ; preds = %0
  %7 = load %struct._RV_stat_node** %2, align 8
  %8 = getelementptr inbounds %struct._RV_stat_node* %7, i32 0, i32 0
  %9 = load i32* %8, align 4
  store i32 %9, i32* %1
  br label %10

; <label>:10                                      ; preds = %6, %5
  %11 = load i32* %1
  ret i32 %11
}

; Function Attrs: inlinehint nounwind uwtable
define i64 @_RV_stat_node_get_count(%struct._RV_stat_node* %snda) #2 {
  %1 = alloca i64, align 8
  %2 = alloca %struct._RV_stat_node*, align 8
  store %struct._RV_stat_node* %snda, %struct._RV_stat_node** %2, align 8
  %3 = load %struct._RV_stat_node** %2, align 8
  %4 = icmp eq %struct._RV_stat_node* %3, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i64 0, i64* %1
  br label %10

; <label>:6                                       ; preds = %0
  %7 = load %struct._RV_stat_node** %2, align 8
  %8 = getelementptr inbounds %struct._RV_stat_node* %7, i32 0, i32 1
  %9 = load i64* %8, align 8
  store i64 %9, i64* %1
  br label %10

; <label>:10                                      ; preds = %6, %5
  %11 = load i64* %1
  ret i64 %11
}

; Function Attrs: inlinehint nounwind uwtable
define i32 @_RV_stat_node_dec(%struct._RV_stat_node* %snda) #2 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._RV_stat_node*, align 8
  %ret = alloca i32, align 4
  store %struct._RV_stat_node* %snda, %struct._RV_stat_node** %2, align 8
  store i32 0, i32* %ret, align 4
  %3 = load %struct._RV_stat_node** %2, align 8
  %4 = icmp eq %struct._RV_stat_node* %3, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i32 0, i32* %1
  br label %33

; <label>:6                                       ; preds = %0
  %7 = load %struct._RV_stat_node** %2, align 8
  %8 = getelementptr inbounds %struct._RV_stat_node* %7, i32 0, i32 1
  %9 = load i64* %8, align 8
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %6
  store i32 0, i32* %1
  br label %33

; <label>:12                                      ; preds = %6
  %13 = load %struct._RV_stat_node** %2, align 8
  %14 = getelementptr inbounds %struct._RV_stat_node* %13, i32 0, i32 1
  %15 = load i64* %14, align 8
  %16 = icmp eq i64 %15, 1
  br i1 %16, label %17, label %26

; <label>:17                                      ; preds = %12
  %18 = load %struct._RV_stat_node** %2, align 8
  %19 = getelementptr inbounds %struct._RV_stat_node* %18, i32 0, i32 0
  %20 = load i32* %19, align 4
  %21 = icmp eq i32 %20, 4
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %17
  store i32 1, i32* %ret, align 4
  br label %23

; <label>:23                                      ; preds = %22, %17
  %24 = load %struct._RV_stat_node** %2, align 8
  %25 = bitcast %struct._RV_stat_node* %24 to i8*
  call void @free(i8* %25) #7
  br label %31

; <label>:26                                      ; preds = %12
  %27 = load %struct._RV_stat_node** %2, align 8
  %28 = getelementptr inbounds %struct._RV_stat_node* %27, i32 0, i32 1
  %29 = load i64* %28, align 8
  %30 = add i64 %29, -1
  store i64 %30, i64* %28, align 8
  br label %31

; <label>:31                                      ; preds = %26, %23
  %32 = load i32* %ret, align 4
  store i32 %32, i32* %1
  br label %33

; <label>:33                                      ; preds = %31, %11, %5
  %34 = load i32* %1
  ret i32 %34
}

; Function Attrs: nounwind
declare void @free(i8*) #3

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_stat_node_inc(%struct._RV_stat_node* %snda) #2 {
  %1 = alloca %struct._RV_stat_node*, align 8
  store %struct._RV_stat_node* %snda, %struct._RV_stat_node** %1, align 8
  %2 = load %struct._RV_stat_node** %1, align 8
  %3 = icmp eq %struct._RV_stat_node* %2, null
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %10

; <label>:5                                       ; preds = %0
  %6 = load %struct._RV_stat_node** %1, align 8
  %7 = getelementptr inbounds %struct._RV_stat_node* %6, i32 0, i32 1
  %8 = load i64* %7, align 8
  %9 = add i64 %8, 1
  store i64 %9, i64* %7, align 8
  br label %10

; <label>:10                                      ; preds = %5, %4
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_pmd* @_RV_pmd_create(i8** %ptra, %struct._RV_stat_node* %snda, i32 %stat, i8* %base, i8* %bound) #2 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i8**, align 8
  %3 = alloca %struct._RV_stat_node*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %pmd = alloca %struct._RV_pmd*, align 8
  store i8** %ptra, i8*** %2, align 8
  store %struct._RV_stat_node* %snda, %struct._RV_stat_node** %3, align 8
  store i32 %stat, i32* %4, align 4
  store i8* %base, i8** %5, align 8
  store i8* %bound, i8** %6, align 8
  %7 = call noalias i8* @malloc(i64 32) #7
  %8 = bitcast i8* %7 to %struct._RV_pmd*
  store %struct._RV_pmd* %8, %struct._RV_pmd** %pmd, align 8
  %9 = load %struct._RV_pmd** %pmd, align 8
  %10 = icmp eq %struct._RV_pmd* %9, null
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %0
  store %struct._RV_pmd* null, %struct._RV_pmd** %1
  br label %31

; <label>:12                                      ; preds = %0
  %13 = load %struct._RV_pmd** %pmd, align 8
  %14 = getelementptr inbounds %struct._RV_pmd* %13, i32 0, i32 2
  store %struct._RV_stat_node* null, %struct._RV_stat_node** %14, align 8
  %15 = load %struct._RV_pmd** %pmd, align 8
  %16 = load %struct._RV_stat_node** %3, align 8
  %17 = load i32* %4, align 4
  %18 = load i8** %5, align 8
  %19 = load i8** %6, align 8
  %20 = call %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %15, %struct._RV_stat_node* %16, i32 %17, i8* %18, i8* %19)
  %21 = load i8*** %2, align 8
  %22 = icmp eq i8** %21, null
  br i1 %22, label %23, label %26

; <label>:23                                      ; preds = %12
  %24 = load %struct._RV_pmd** %pmd, align 8
  %25 = getelementptr inbounds %struct._RV_pmd* %24, i32 0, i32 3
  store i8 2, i8* %25, align 1
  br label %29

; <label>:26                                      ; preds = %12
  %27 = load %struct._RV_pmd** %pmd, align 8
  %28 = getelementptr inbounds %struct._RV_pmd* %27, i32 0, i32 3
  store i8 1, i8* %28, align 1
  br label %29

; <label>:29                                      ; preds = %26, %23
  %30 = load %struct._RV_pmd** %pmd, align 8
  store %struct._RV_pmd* %30, %struct._RV_pmd** %1
  br label %31

; <label>:31                                      ; preds = %29, %11
  %32 = load %struct._RV_pmd** %1
  ret %struct._RV_pmd* %32
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %pmd, %struct._RV_stat_node* %snda, i32 %stat, i8* %base, i8* %bound) #2 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._RV_stat_node*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %2, align 8
  store %struct._RV_stat_node* %snda, %struct._RV_stat_node** %3, align 8
  store i32 %stat, i32* %4, align 4
  store i8* %base, i8** %5, align 8
  store i8* %bound, i8** %6, align 8
  %7 = load %struct._RV_pmd** %2, align 8
  %8 = icmp eq %struct._RV_pmd* %7, null
  br i1 %8, label %9, label %11

; <label>:9                                       ; preds = %0
  %10 = load %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %10, %struct._RV_pmd** %1
  br label %37

; <label>:11                                      ; preds = %0
  %12 = load %struct._RV_stat_node** %3, align 8
  %13 = icmp ne %struct._RV_stat_node* %12, null
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %11
  %15 = load %struct._RV_pmd** %2, align 8
  %16 = load %struct._RV_stat_node** %3, align 8
  call void @_RV_pmd_c_snda(%struct._RV_pmd* %15, %struct._RV_stat_node* %16)
  br label %27

; <label>:17                                      ; preds = %11
  %18 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_dc_snda(%struct._RV_pmd* %18)
  %19 = load i32* %4, align 4
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %26

; <label>:21                                      ; preds = %17
  %22 = load i32* %4, align 4
  %23 = call %struct._RV_stat_node* @_RV_stat_node_create(i32 %22, i64 1)
  %24 = load %struct._RV_pmd** %2, align 8
  %25 = getelementptr inbounds %struct._RV_pmd* %24, i32 0, i32 2
  store %struct._RV_stat_node* %23, %struct._RV_stat_node** %25, align 8
  br label %26

; <label>:26                                      ; preds = %21, %17
  br label %27

; <label>:27                                      ; preds = %26, %14
  %28 = load i8** %5, align 8
  %29 = load %struct._RV_pmd** %2, align 8
  %30 = getelementptr inbounds %struct._RV_pmd* %29, i32 0, i32 0
  store i8* %28, i8** %30, align 8
  %31 = load i8** %6, align 8
  %32 = load %struct._RV_pmd** %2, align 8
  %33 = getelementptr inbounds %struct._RV_pmd* %32, i32 0, i32 1
  store i8* %31, i8** %33, align 8
  %34 = load %struct._RV_pmd** %2, align 8
  %35 = getelementptr inbounds %struct._RV_pmd* %34, i32 0, i32 3
  store i8 1, i8* %35, align 1
  %36 = load %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %36, %struct._RV_pmd** %1
  br label %37

; <label>:37                                      ; preds = %27, %9
  %38 = load %struct._RV_pmd** %1
  ret %struct._RV_pmd* %38
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_pmd* @_RV_pmd_create_null(i8** %ptra) #2 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i8**, align 8
  %pmd = alloca %struct._RV_pmd*, align 8
  store i8** %ptra, i8*** %2, align 8
  %3 = call noalias i8* @malloc(i64 32) #7
  %4 = bitcast i8* %3 to %struct._RV_pmd*
  store %struct._RV_pmd* %4, %struct._RV_pmd** %pmd, align 8
  %5 = load %struct._RV_pmd** %pmd, align 8
  %6 = icmp eq %struct._RV_pmd* %5, null
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store %struct._RV_pmd* null, %struct._RV_pmd** %1
  br label %25

; <label>:8                                       ; preds = %0
  %9 = load %struct._RV_pmd** %pmd, align 8
  %10 = getelementptr inbounds %struct._RV_pmd* %9, i32 0, i32 2
  store %struct._RV_stat_node* null, %struct._RV_stat_node** %10, align 8
  %11 = load %struct._RV_pmd** %pmd, align 8
  %12 = getelementptr inbounds %struct._RV_pmd* %11, i32 0, i32 0
  store i8* null, i8** %12, align 8
  %13 = load %struct._RV_pmd** %pmd, align 8
  %14 = getelementptr inbounds %struct._RV_pmd* %13, i32 0, i32 1
  store i8* null, i8** %14, align 8
  %15 = load i8*** %2, align 8
  %16 = icmp eq i8** %15, null
  br i1 %16, label %17, label %20

; <label>:17                                      ; preds = %8
  %18 = load %struct._RV_pmd** %pmd, align 8
  %19 = getelementptr inbounds %struct._RV_pmd* %18, i32 0, i32 3
  store i8 2, i8* %19, align 1
  br label %23

; <label>:20                                      ; preds = %8
  %21 = load %struct._RV_pmd** %pmd, align 8
  %22 = getelementptr inbounds %struct._RV_pmd* %21, i32 0, i32 3
  store i8 1, i8* %22, align 1
  br label %23

; <label>:23                                      ; preds = %20, %17
  %24 = load %struct._RV_pmd** %pmd, align 8
  store %struct._RV_pmd* %24, %struct._RV_pmd** %1
  br label %25

; <label>:25                                      ; preds = %23, %7
  %26 = load %struct._RV_pmd** %1
  ret %struct._RV_pmd* %26
}

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_pmd_free(%struct._RV_pmd* %pmd) #2 {
  %1 = alloca %struct._RV_pmd*, align 8
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %1, align 8
  %2 = load %struct._RV_pmd** %1, align 8
  %3 = icmp eq %struct._RV_pmd* %2, null
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %9

; <label>:5                                       ; preds = %0
  %6 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_dc_snda(%struct._RV_pmd* %6)
  %7 = load %struct._RV_pmd** %1, align 8
  %8 = bitcast %struct._RV_pmd* %7 to i8*
  call void @free(i8* %8) #7
  br label %9

; <label>:9                                       ; preds = %5, %4
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_pmd_dc_snda(%struct._RV_pmd* %pmd) #2 {
  %1 = alloca %struct._RV_pmd*, align 8
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %1, align 8
  %2 = load %struct._RV_pmd** %1, align 8
  %3 = icmp eq %struct._RV_pmd* %2, null
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %25

; <label>:5                                       ; preds = %0
  %6 = load %struct._RV_pmd** %1, align 8
  %7 = getelementptr inbounds %struct._RV_pmd* %6, i32 0, i32 2
  %8 = load %struct._RV_stat_node** %7, align 8
  %9 = call i32 @_RV_stat_node_dec(%struct._RV_stat_node* %8)
  %10 = icmp eq i32 %9, 1
  br i1 %10, label %11, label %22

; <label>:11                                      ; preds = %5
  %12 = load %struct._IO_FILE** @stderr, align 8
  %13 = load %struct._RV_pmd** %1, align 8
  %14 = getelementptr inbounds %struct._RV_pmd* %13, i32 0, i32 0
  %15 = load i8** %14, align 8
  %16 = load %struct._RV_pmd** %1, align 8
  %17 = getelementptr inbounds %struct._RV_pmd* %16, i32 0, i32 1
  %18 = load i8** %17, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([43 x i8]* @.str6, i32 0, i32 0), i8* %15, i8* %18)
  %20 = load i64* @_RV_error_count, align 8
  %21 = add i64 %20, 1
  store i64 %21, i64* @_RV_error_count, align 8
  br label %22

; <label>:22                                      ; preds = %11, %5
  %23 = load %struct._RV_pmd** %1, align 8
  %24 = getelementptr inbounds %struct._RV_pmd* %23, i32 0, i32 2
  store %struct._RV_stat_node* null, %struct._RV_stat_node** %24, align 8
  br label %25

; <label>:25                                      ; preds = %22, %4
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %pmd) #2 {
  %1 = alloca %struct._RV_pmd*, align 8
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %1, align 8
  %2 = load %struct._RV_pmd** %1, align 8
  %3 = icmp eq %struct._RV_pmd* %2, null
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %13

; <label>:5                                       ; preds = %0
  %6 = load %struct._RV_pmd** %1, align 8
  %7 = getelementptr inbounds %struct._RV_pmd* %6, i32 0, i32 3
  %8 = load i8* %7, align 1
  %9 = zext i8 %8 to i32
  %10 = icmp eq i32 %9, 2
  br i1 %10, label %11, label %13

; <label>:11                                      ; preds = %5
  %12 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free(%struct._RV_pmd* %12)
  br label %13

; <label>:13                                      ; preds = %11, %5, %4
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define i32 @_RV_pmd_is_null(%struct._RV_pmd* %pmd) #2 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._RV_pmd*, align 8
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %2, align 8
  %3 = load %struct._RV_pmd** %2, align 8
  %4 = icmp eq %struct._RV_pmd* %3, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i32 1, i32* %1
  br label %23

; <label>:6                                       ; preds = %0
  %7 = load %struct._RV_pmd** %2, align 8
  %8 = getelementptr inbounds %struct._RV_pmd* %7, i32 0, i32 2
  %9 = load %struct._RV_stat_node** %8, align 8
  %10 = icmp eq %struct._RV_stat_node* %9, null
  br i1 %10, label %11, label %22

; <label>:11                                      ; preds = %6
  %12 = load %struct._RV_pmd** %2, align 8
  %13 = getelementptr inbounds %struct._RV_pmd* %12, i32 0, i32 0
  %14 = load i8** %13, align 8
  %15 = icmp eq i8* %14, null
  br i1 %15, label %16, label %22

; <label>:16                                      ; preds = %11
  %17 = load %struct._RV_pmd** %2, align 8
  %18 = getelementptr inbounds %struct._RV_pmd* %17, i32 0, i32 1
  %19 = load i8** %18, align 8
  %20 = icmp eq i8* %19, null
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %16
  store i32 1, i32* %1
  br label %23

; <label>:22                                      ; preds = %16, %11, %6
  store i32 0, i32* %1
  br label %23

; <label>:23                                      ; preds = %22, %21, %5
  %24 = load i32* %1
  ret i32 %24
}

; Function Attrs: inlinehint nounwind uwtable
define i8* @_RV_pmd_get_base(%struct._RV_pmd* %pmd) #2 {
  %1 = alloca i8*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %2, align 8
  %3 = load %struct._RV_pmd** %2, align 8
  %4 = icmp eq %struct._RV_pmd* %3, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i8* null, i8** %1
  br label %10

; <label>:6                                       ; preds = %0
  %7 = load %struct._RV_pmd** %2, align 8
  %8 = getelementptr inbounds %struct._RV_pmd* %7, i32 0, i32 0
  %9 = load i8** %8, align 8
  store i8* %9, i8** %1
  br label %10

; <label>:10                                      ; preds = %6, %5
  %11 = load i8** %1
  ret i8* %11
}

; Function Attrs: inlinehint nounwind uwtable
define i8* @_RV_pmd_get_bound(%struct._RV_pmd* %pmd) #2 {
  %1 = alloca i8*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %2, align 8
  %3 = load %struct._RV_pmd** %2, align 8
  %4 = icmp eq %struct._RV_pmd* %3, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i8* null, i8** %1
  br label %10

; <label>:6                                       ; preds = %0
  %7 = load %struct._RV_pmd** %2, align 8
  %8 = getelementptr inbounds %struct._RV_pmd* %7, i32 0, i32 1
  %9 = load i8** %8, align 8
  store i8* %9, i8** %1
  br label %10

; <label>:10                                      ; preds = %6, %5
  %11 = load i8** %1
  ret i8* %11
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_stat_node* @_RV_pmd_get_snda(%struct._RV_pmd* %pmd) #2 {
  %1 = alloca %struct._RV_stat_node*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %2, align 8
  %3 = load %struct._RV_pmd** %2, align 8
  %4 = icmp eq %struct._RV_pmd* %3, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store %struct._RV_stat_node* null, %struct._RV_stat_node** %1
  br label %10

; <label>:6                                       ; preds = %0
  %7 = load %struct._RV_pmd** %2, align 8
  %8 = getelementptr inbounds %struct._RV_pmd* %7, i32 0, i32 2
  %9 = load %struct._RV_stat_node** %8, align 8
  store %struct._RV_stat_node* %9, %struct._RV_stat_node** %1
  br label %10

; <label>:10                                      ; preds = %6, %5
  %11 = load %struct._RV_stat_node** %1
  ret %struct._RV_stat_node* %11
}

; Function Attrs: inlinehint nounwind uwtable
define i32 @_RV_pmd_get_stat(%struct._RV_pmd* %pmd) #2 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._RV_pmd*, align 8
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %2, align 8
  %3 = load %struct._RV_pmd** %2, align 8
  %4 = icmp eq %struct._RV_pmd* %3, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i32 0, i32* %1
  br label %11

; <label>:6                                       ; preds = %0
  %7 = load %struct._RV_pmd** %2, align 8
  %8 = getelementptr inbounds %struct._RV_pmd* %7, i32 0, i32 2
  %9 = load %struct._RV_stat_node** %8, align 8
  %10 = call i32 @_RV_stat_node_get_stat(%struct._RV_stat_node* %9)
  store i32 %10, i32* %1
  br label %11

; <label>:11                                      ; preds = %6, %5
  %12 = load i32* %1
  ret i32 %12
}

; Function Attrs: inlinehint nounwind uwtable
define i64 @_RV_pmd_get_count(%struct._RV_pmd* %pmd) #2 {
  %1 = alloca i64, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %2, align 8
  %3 = load %struct._RV_pmd** %2, align 8
  %4 = icmp eq %struct._RV_pmd* %3, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i64 0, i64* %1
  br label %11

; <label>:6                                       ; preds = %0
  %7 = load %struct._RV_pmd** %2, align 8
  %8 = getelementptr inbounds %struct._RV_pmd* %7, i32 0, i32 2
  %9 = load %struct._RV_stat_node** %8, align 8
  %10 = call i64 @_RV_stat_node_get_count(%struct._RV_stat_node* %9)
  store i64 %10, i64* %1
  br label %11

; <label>:11                                      ; preds = %6, %5
  %12 = load i64* %1
  ret i64 %12
}

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_pmd_print(%struct._RV_pmd* %pmd) #2 {
  %1 = alloca %struct._RV_pmd*, align 8
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %1, align 8
  %2 = load %struct._RV_pmd** %1, align 8
  %3 = icmp ne %struct._RV_pmd* %2, null
  br i1 %3, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0))
  br label %33

; <label>:6                                       ; preds = %0
  %7 = load %struct._RV_pmd** %1, align 8
  %8 = getelementptr inbounds %struct._RV_pmd* %7, i32 0, i32 0
  %9 = load i8** %8, align 8
  %10 = load %struct._RV_pmd** %1, align 8
  %11 = getelementptr inbounds %struct._RV_pmd* %10, i32 0, i32 1
  %12 = load i8** %11, align 8
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str3, i32 0, i32 0), i8* %9, i8* %12)
  %14 = load %struct._RV_pmd** %1, align 8
  %15 = getelementptr inbounds %struct._RV_pmd* %14, i32 0, i32 2
  %16 = load %struct._RV_stat_node** %15, align 8
  %17 = icmp ne %struct._RV_stat_node* %16, null
  br i1 %17, label %20, label %18

; <label>:18                                      ; preds = %6
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str4, i32 0, i32 0))
  br label %32

; <label>:20                                      ; preds = %6
  %21 = load %struct._RV_pmd** %1, align 8
  %22 = getelementptr inbounds %struct._RV_pmd* %21, i32 0, i32 2
  %23 = load %struct._RV_stat_node** %22, align 8
  %24 = getelementptr inbounds %struct._RV_stat_node* %23, i32 0, i32 0
  %25 = load i32* %24, align 4
  %26 = load %struct._RV_pmd** %1, align 8
  %27 = getelementptr inbounds %struct._RV_pmd* %26, i32 0, i32 2
  %28 = load %struct._RV_stat_node** %27, align 8
  %29 = getelementptr inbounds %struct._RV_stat_node* %28, i32 0, i32 1
  %30 = load i64* %29, align 8
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str5, i32 0, i32 0), i32 %25, i64 %30)
  br label %32

; <label>:32                                      ; preds = %20, %18
  br label %33

; <label>:33                                      ; preds = %32, %4
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_pmd_set_base(%struct._RV_pmd* %pmd, i8* %base) #2 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i8*, align 8
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %1, align 8
  store i8* %base, i8** %2, align 8
  %3 = load %struct._RV_pmd** %1, align 8
  %4 = icmp eq %struct._RV_pmd* %3, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %10

; <label>:6                                       ; preds = %0
  %7 = load i8** %2, align 8
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = getelementptr inbounds %struct._RV_pmd* %8, i32 0, i32 0
  store i8* %7, i8** %9, align 8
  br label %10

; <label>:10                                      ; preds = %6, %5
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_pmd_set_bound(%struct._RV_pmd* %pmd, i8* %bound) #2 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i8*, align 8
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %1, align 8
  store i8* %bound, i8** %2, align 8
  %3 = load %struct._RV_pmd** %1, align 8
  %4 = icmp eq %struct._RV_pmd* %3, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %10

; <label>:6                                       ; preds = %0
  %7 = load i8** %2, align 8
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = getelementptr inbounds %struct._RV_pmd* %8, i32 0, i32 1
  store i8* %7, i8** %9, align 8
  br label %10

; <label>:10                                      ; preds = %6, %5
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_pmd_c_snda(%struct._RV_pmd* %pmd, %struct._RV_stat_node* %snda) #2 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_stat_node*, align 8
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_stat_node* %snda, %struct._RV_stat_node** %2, align 8
  %3 = load %struct._RV_pmd** %1, align 8
  %4 = icmp eq %struct._RV_pmd* %3, null
  br i1 %4, label %11, label %5

; <label>:5                                       ; preds = %0
  %6 = load %struct._RV_pmd** %1, align 8
  %7 = getelementptr inbounds %struct._RV_pmd* %6, i32 0, i32 2
  %8 = load %struct._RV_stat_node** %7, align 8
  %9 = load %struct._RV_stat_node** %2, align 8
  %10 = icmp eq %struct._RV_stat_node* %8, %9
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %5, %0
  br label %18

; <label>:12                                      ; preds = %5
  %13 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_dc_snda(%struct._RV_pmd* %13)
  %14 = load %struct._RV_stat_node** %2, align 8
  %15 = load %struct._RV_pmd** %1, align 8
  %16 = getelementptr inbounds %struct._RV_pmd* %15, i32 0, i32 2
  store %struct._RV_stat_node* %14, %struct._RV_stat_node** %16, align 8
  %17 = load %struct._RV_stat_node** %2, align 8
  call void @_RV_stat_node_inc(%struct._RV_stat_node* %17)
  br label %18

; <label>:18                                      ; preds = %12, %11
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_pmd_set_stat(%struct._RV_pmd* %pmd, i32 %stat) #2 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i32, align 4
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %1, align 8
  store i32 %stat, i32* %2, align 4
  %3 = load %struct._RV_pmd** %1, align 8
  %4 = icmp eq %struct._RV_pmd* %3, null
  br i1 %4, label %10, label %5

; <label>:5                                       ; preds = %0
  %6 = load %struct._RV_pmd** %1, align 8
  %7 = getelementptr inbounds %struct._RV_pmd* %6, i32 0, i32 2
  %8 = load %struct._RV_stat_node** %7, align 8
  %9 = icmp eq %struct._RV_stat_node* %8, null
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %5, %0
  br label %17

; <label>:11                                      ; preds = %5
  %12 = load i32* %2, align 4
  %13 = load %struct._RV_pmd** %1, align 8
  %14 = getelementptr inbounds %struct._RV_pmd* %13, i32 0, i32 2
  %15 = load %struct._RV_stat_node** %14, align 8
  %16 = getelementptr inbounds %struct._RV_stat_node* %15, i32 0, i32 0
  store i32 %12, i32* %16, align 4
  br label %17

; <label>:17                                      ; preds = %11, %10
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define i8* @_RV_pmd_set_ret(%struct._RV_pmd* %pmd, %struct._RV_stat_node* %snda, i32 %stat, i8* %base, i8* %bound, i8* %ret) #2 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_stat_node*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_stat_node* %snda, %struct._RV_stat_node** %2, align 8
  store i32 %stat, i32* %3, align 4
  store i8* %base, i8** %4, align 8
  store i8* %bound, i8** %5, align 8
  store i8* %ret, i8** %6, align 8
  %7 = load %struct._RV_pmd** %1, align 8
  %8 = load %struct._RV_stat_node** %2, align 8
  %9 = load i32* %3, align 4
  %10 = load i8** %4, align 8
  %11 = load i8** %5, align 8
  %12 = call %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %7, %struct._RV_stat_node* %8, i32 %9, i8* %10, i8* %11)
  %13 = load i8** %6, align 8
  ret i8* %13
}

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_pmd_set_null(%struct._RV_pmd* %pmd) #2 {
  %1 = alloca %struct._RV_pmd*, align 8
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %1, align 8
  %2 = load %struct._RV_pmd** %1, align 8
  %3 = icmp eq %struct._RV_pmd* %2, null
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %13

; <label>:5                                       ; preds = %0
  %6 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_dc_snda(%struct._RV_pmd* %6)
  %7 = load %struct._RV_pmd** %1, align 8
  %8 = getelementptr inbounds %struct._RV_pmd* %7, i32 0, i32 0
  store i8* null, i8** %8, align 8
  %9 = load %struct._RV_pmd** %1, align 8
  %10 = getelementptr inbounds %struct._RV_pmd* %9, i32 0, i32 1
  store i8* null, i8** %10, align 8
  %11 = load %struct._RV_pmd** %1, align 8
  %12 = getelementptr inbounds %struct._RV_pmd* %11, i32 0, i32 3
  store i8 1, i8* %12, align 1
  br label %13

; <label>:13                                      ; preds = %5, %4
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_pmd* @_RV_pmd_cp_pmd(%struct._RV_pmd* %pmd, %struct._RV_pmd* %pmd2) #2 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._RV_pmd*, align 8
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %pmd2, %struct._RV_pmd** %3, align 8
  %4 = load %struct._RV_pmd** %2, align 8
  %5 = icmp eq %struct._RV_pmd* %4, null
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %0
  %7 = load %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %7, %struct._RV_pmd** %1
  br label %32

; <label>:8                                       ; preds = %0
  %9 = load %struct._RV_pmd** %3, align 8
  %10 = icmp eq %struct._RV_pmd* %9, null
  br i1 %10, label %11, label %13

; <label>:11                                      ; preds = %8
  %12 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %12)
  br label %30

; <label>:13                                      ; preds = %8
  %14 = load %struct._RV_pmd** %2, align 8
  %15 = load %struct._RV_pmd** %3, align 8
  %16 = getelementptr inbounds %struct._RV_pmd* %15, i32 0, i32 2
  %17 = load %struct._RV_stat_node** %16, align 8
  call void @_RV_pmd_c_snda(%struct._RV_pmd* %14, %struct._RV_stat_node* %17)
  %18 = load %struct._RV_pmd** %3, align 8
  %19 = getelementptr inbounds %struct._RV_pmd* %18, i32 0, i32 0
  %20 = load i8** %19, align 8
  %21 = load %struct._RV_pmd** %2, align 8
  %22 = getelementptr inbounds %struct._RV_pmd* %21, i32 0, i32 0
  store i8* %20, i8** %22, align 8
  %23 = load %struct._RV_pmd** %3, align 8
  %24 = getelementptr inbounds %struct._RV_pmd* %23, i32 0, i32 1
  %25 = load i8** %24, align 8
  %26 = load %struct._RV_pmd** %2, align 8
  %27 = getelementptr inbounds %struct._RV_pmd* %26, i32 0, i32 1
  store i8* %25, i8** %27, align 8
  %28 = load %struct._RV_pmd** %2, align 8
  %29 = getelementptr inbounds %struct._RV_pmd* %28, i32 0, i32 3
  store i8 1, i8* %29, align 1
  br label %30

; <label>:30                                      ; preds = %13, %11
  %31 = load %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %31, %struct._RV_pmd** %1
  br label %32

; <label>:32                                      ; preds = %30, %6
  %33 = load %struct._RV_pmd** %1
  ret %struct._RV_pmd* %33
}

; Function Attrs: inlinehint nounwind uwtable
define i8* @_RV_pmd_cp_pmd_ret(%struct._RV_pmd* %pmd, %struct._RV_pmd* %pmd2, i8* %ret) #2 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %pmd2, %struct._RV_pmd** %2, align 8
  store i8* %ret, i8** %3, align 8
  %4 = load %struct._RV_pmd** %1, align 8
  %5 = load %struct._RV_pmd** %2, align 8
  %6 = call %struct._RV_pmd* @_RV_pmd_cp_pmd(%struct._RV_pmd* %4, %struct._RV_pmd* %5)
  %7 = load i8** %3, align 8
  ret i8* %7
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_pmd* @_RV_pmd_cp_fmd_pmd(%struct._RV_pmd* %pmd, %struct._RV_fmd_pmd* %fpmd) #2 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._RV_fmd_pmd*, align 8
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %2, align 8
  store %struct._RV_fmd_pmd* %fpmd, %struct._RV_fmd_pmd** %3, align 8
  %4 = load %struct._RV_pmd** %2, align 8
  %5 = icmp eq %struct._RV_pmd* %4, null
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %0
  %7 = load %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %7, %struct._RV_pmd** %1
  br label %32

; <label>:8                                       ; preds = %0
  %9 = load %struct._RV_fmd_pmd** %3, align 8
  %10 = icmp eq %struct._RV_fmd_pmd* %9, null
  br i1 %10, label %11, label %13

; <label>:11                                      ; preds = %8
  %12 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %12)
  br label %30

; <label>:13                                      ; preds = %8
  %14 = load %struct._RV_pmd** %2, align 8
  %15 = load %struct._RV_fmd_pmd** %3, align 8
  %16 = getelementptr inbounds %struct._RV_fmd_pmd* %15, i32 0, i32 2
  %17 = load %struct._RV_stat_node** %16, align 8
  call void @_RV_pmd_c_snda(%struct._RV_pmd* %14, %struct._RV_stat_node* %17)
  %18 = load %struct._RV_fmd_pmd** %3, align 8
  %19 = getelementptr inbounds %struct._RV_fmd_pmd* %18, i32 0, i32 0
  %20 = load i8** %19, align 8
  %21 = load %struct._RV_pmd** %2, align 8
  %22 = getelementptr inbounds %struct._RV_pmd* %21, i32 0, i32 0
  store i8* %20, i8** %22, align 8
  %23 = load %struct._RV_fmd_pmd** %3, align 8
  %24 = getelementptr inbounds %struct._RV_fmd_pmd* %23, i32 0, i32 1
  %25 = load i8** %24, align 8
  %26 = load %struct._RV_pmd** %2, align 8
  %27 = getelementptr inbounds %struct._RV_pmd* %26, i32 0, i32 1
  store i8* %25, i8** %27, align 8
  %28 = load %struct._RV_pmd** %2, align 8
  %29 = getelementptr inbounds %struct._RV_pmd* %28, i32 0, i32 3
  store i8 1, i8* %29, align 1
  br label %30

; <label>:30                                      ; preds = %13, %11
  %31 = load %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %31, %struct._RV_pmd** %1
  br label %32

; <label>:32                                      ; preds = %30, %6
  %33 = load %struct._RV_pmd** %1
  ret %struct._RV_pmd* %33
}

; Function Attrs: inlinehint nounwind uwtable
define i32 @_RV_fmd_pmd_is_null(%struct._RV_fmd_pmd* %fpmd) #2 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._RV_fmd_pmd*, align 8
  store %struct._RV_fmd_pmd* %fpmd, %struct._RV_fmd_pmd** %2, align 8
  %3 = load %struct._RV_fmd_pmd** %2, align 8
  %4 = icmp eq %struct._RV_fmd_pmd* %3, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i32 1, i32* %1
  br label %23

; <label>:6                                       ; preds = %0
  %7 = load %struct._RV_fmd_pmd** %2, align 8
  %8 = getelementptr inbounds %struct._RV_fmd_pmd* %7, i32 0, i32 2
  %9 = load %struct._RV_stat_node** %8, align 8
  %10 = icmp eq %struct._RV_stat_node* %9, null
  br i1 %10, label %11, label %22

; <label>:11                                      ; preds = %6
  %12 = load %struct._RV_fmd_pmd** %2, align 8
  %13 = getelementptr inbounds %struct._RV_fmd_pmd* %12, i32 0, i32 0
  %14 = load i8** %13, align 8
  %15 = icmp eq i8* %14, null
  br i1 %15, label %16, label %22

; <label>:16                                      ; preds = %11
  %17 = load %struct._RV_fmd_pmd** %2, align 8
  %18 = getelementptr inbounds %struct._RV_fmd_pmd* %17, i32 0, i32 1
  %19 = load i8** %18, align 8
  %20 = icmp eq i8* %19, null
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %16
  store i32 1, i32* %1
  br label %23

; <label>:22                                      ; preds = %16, %11, %6
  store i32 0, i32* %1
  br label %23

; <label>:23                                      ; preds = %22, %21, %5
  %24 = load i32* %1
  ret i32 %24
}

; Function Attrs: inlinehint nounwind uwtable
define i8* @_RV_fmd_pmd_get_base(%struct._RV_fmd_pmd* %fpmd) #2 {
  %1 = alloca i8*, align 8
  %2 = alloca %struct._RV_fmd_pmd*, align 8
  store %struct._RV_fmd_pmd* %fpmd, %struct._RV_fmd_pmd** %2, align 8
  %3 = load %struct._RV_fmd_pmd** %2, align 8
  %4 = icmp eq %struct._RV_fmd_pmd* %3, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i8* null, i8** %1
  br label %10

; <label>:6                                       ; preds = %0
  %7 = load %struct._RV_fmd_pmd** %2, align 8
  %8 = getelementptr inbounds %struct._RV_fmd_pmd* %7, i32 0, i32 0
  %9 = load i8** %8, align 8
  store i8* %9, i8** %1
  br label %10

; <label>:10                                      ; preds = %6, %5
  %11 = load i8** %1
  ret i8* %11
}

; Function Attrs: inlinehint nounwind uwtable
define i8* @_RV_fmd_pmd_get_bound(%struct._RV_fmd_pmd* %fpmd) #2 {
  %1 = alloca i8*, align 8
  %2 = alloca %struct._RV_fmd_pmd*, align 8
  store %struct._RV_fmd_pmd* %fpmd, %struct._RV_fmd_pmd** %2, align 8
  %3 = load %struct._RV_fmd_pmd** %2, align 8
  %4 = icmp eq %struct._RV_fmd_pmd* %3, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i8* null, i8** %1
  br label %10

; <label>:6                                       ; preds = %0
  %7 = load %struct._RV_fmd_pmd** %2, align 8
  %8 = getelementptr inbounds %struct._RV_fmd_pmd* %7, i32 0, i32 1
  %9 = load i8** %8, align 8
  store i8* %9, i8** %1
  br label %10

; <label>:10                                      ; preds = %6, %5
  %11 = load i8** %1
  ret i8* %11
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_stat_node* @_RV_fmd_pmd_get_snda(%struct._RV_fmd_pmd* %fpmd) #2 {
  %1 = alloca %struct._RV_stat_node*, align 8
  %2 = alloca %struct._RV_fmd_pmd*, align 8
  store %struct._RV_fmd_pmd* %fpmd, %struct._RV_fmd_pmd** %2, align 8
  %3 = load %struct._RV_fmd_pmd** %2, align 8
  %4 = icmp eq %struct._RV_fmd_pmd* %3, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store %struct._RV_stat_node* null, %struct._RV_stat_node** %1
  br label %10

; <label>:6                                       ; preds = %0
  %7 = load %struct._RV_fmd_pmd** %2, align 8
  %8 = getelementptr inbounds %struct._RV_fmd_pmd* %7, i32 0, i32 2
  %9 = load %struct._RV_stat_node** %8, align 8
  store %struct._RV_stat_node* %9, %struct._RV_stat_node** %1
  br label %10

; <label>:10                                      ; preds = %6, %5
  %11 = load %struct._RV_stat_node** %1
  ret %struct._RV_stat_node* %11
}

; Function Attrs: inlinehint nounwind uwtable
define i32 @_RV_fmd_pmd_get_stat(%struct._RV_fmd_pmd* %fpmd) #2 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._RV_fmd_pmd*, align 8
  store %struct._RV_fmd_pmd* %fpmd, %struct._RV_fmd_pmd** %2, align 8
  %3 = load %struct._RV_fmd_pmd** %2, align 8
  %4 = icmp eq %struct._RV_fmd_pmd* %3, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i32 0, i32* %1
  br label %11

; <label>:6                                       ; preds = %0
  %7 = load %struct._RV_fmd_pmd** %2, align 8
  %8 = getelementptr inbounds %struct._RV_fmd_pmd* %7, i32 0, i32 2
  %9 = load %struct._RV_stat_node** %8, align 8
  %10 = call i32 @_RV_stat_node_get_stat(%struct._RV_stat_node* %9)
  store i32 %10, i32* %1
  br label %11

; <label>:11                                      ; preds = %6, %5
  %12 = load i32* %1
  ret i32 %12
}

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_fmd_pmd_dc_snda(%struct._RV_fmd_pmd* %fpmd) #2 {
  %1 = alloca %struct._RV_fmd_pmd*, align 8
  store %struct._RV_fmd_pmd* %fpmd, %struct._RV_fmd_pmd** %1, align 8
  %2 = load %struct._RV_fmd_pmd** %1, align 8
  %3 = icmp eq %struct._RV_fmd_pmd* %2, null
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %25

; <label>:5                                       ; preds = %0
  %6 = load %struct._RV_fmd_pmd** %1, align 8
  %7 = getelementptr inbounds %struct._RV_fmd_pmd* %6, i32 0, i32 2
  %8 = load %struct._RV_stat_node** %7, align 8
  %9 = call i32 @_RV_stat_node_dec(%struct._RV_stat_node* %8)
  %10 = icmp eq i32 %9, 1
  br i1 %10, label %11, label %22

; <label>:11                                      ; preds = %5
  %12 = load %struct._IO_FILE** @stderr, align 8
  %13 = load %struct._RV_fmd_pmd** %1, align 8
  %14 = getelementptr inbounds %struct._RV_fmd_pmd* %13, i32 0, i32 0
  %15 = load i8** %14, align 8
  %16 = load %struct._RV_fmd_pmd** %1, align 8
  %17 = getelementptr inbounds %struct._RV_fmd_pmd* %16, i32 0, i32 1
  %18 = load i8** %17, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([85 x i8]* @.str7, i32 0, i32 0), i8* %15, i8* %18)
  %20 = load i64* @_RV_error_count, align 8
  %21 = add i64 %20, 1
  store i64 %21, i64* @_RV_error_count, align 8
  br label %22

; <label>:22                                      ; preds = %11, %5
  %23 = load %struct._RV_fmd_pmd** %1, align 8
  %24 = getelementptr inbounds %struct._RV_fmd_pmd* %23, i32 0, i32 2
  store %struct._RV_stat_node* null, %struct._RV_stat_node** %24, align 8
  br label %25

; <label>:25                                      ; preds = %22, %4
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_fmd_pmd_c_snda(%struct._RV_fmd_pmd* %fpmd, %struct._RV_stat_node* %snda) #2 {
  %1 = alloca %struct._RV_fmd_pmd*, align 8
  %2 = alloca %struct._RV_stat_node*, align 8
  store %struct._RV_fmd_pmd* %fpmd, %struct._RV_fmd_pmd** %1, align 8
  store %struct._RV_stat_node* %snda, %struct._RV_stat_node** %2, align 8
  %3 = load %struct._RV_fmd_pmd** %1, align 8
  %4 = icmp eq %struct._RV_fmd_pmd* %3, null
  br i1 %4, label %11, label %5

; <label>:5                                       ; preds = %0
  %6 = load %struct._RV_fmd_pmd** %1, align 8
  %7 = getelementptr inbounds %struct._RV_fmd_pmd* %6, i32 0, i32 2
  %8 = load %struct._RV_stat_node** %7, align 8
  %9 = load %struct._RV_stat_node** %2, align 8
  %10 = icmp eq %struct._RV_stat_node* %8, %9
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %5, %0
  br label %18

; <label>:12                                      ; preds = %5
  %13 = load %struct._RV_fmd_pmd** %1, align 8
  call void @_RV_fmd_pmd_dc_snda(%struct._RV_fmd_pmd* %13)
  %14 = load %struct._RV_stat_node** %2, align 8
  %15 = load %struct._RV_fmd_pmd** %1, align 8
  %16 = getelementptr inbounds %struct._RV_fmd_pmd* %15, i32 0, i32 2
  store %struct._RV_stat_node* %14, %struct._RV_stat_node** %16, align 8
  %17 = load %struct._RV_stat_node** %2, align 8
  call void @_RV_stat_node_inc(%struct._RV_stat_node* %17)
  br label %18

; <label>:18                                      ; preds = %12, %11
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_fmd_pmd_set(%struct._RV_fmd_pmd* %fpmd, %struct._RV_stat_node* %snda, i32 %stat, i8* %base, i8* %bound) #2 {
  %1 = alloca %struct._RV_fmd_pmd*, align 8
  %2 = alloca %struct._RV_stat_node*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  store %struct._RV_fmd_pmd* %fpmd, %struct._RV_fmd_pmd** %1, align 8
  store %struct._RV_stat_node* %snda, %struct._RV_stat_node** %2, align 8
  store i32 %stat, i32* %3, align 4
  store i8* %base, i8** %4, align 8
  store i8* %bound, i8** %5, align 8
  %6 = load %struct._RV_fmd_pmd** %1, align 8
  %7 = icmp eq %struct._RV_fmd_pmd* %6, null
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  br label %32

; <label>:9                                       ; preds = %0
  %10 = load %struct._RV_stat_node** %2, align 8
  %11 = icmp ne %struct._RV_stat_node* %10, null
  br i1 %11, label %12, label %15

; <label>:12                                      ; preds = %9
  %13 = load %struct._RV_fmd_pmd** %1, align 8
  %14 = load %struct._RV_stat_node** %2, align 8
  call void @_RV_fmd_pmd_c_snda(%struct._RV_fmd_pmd* %13, %struct._RV_stat_node* %14)
  br label %25

; <label>:15                                      ; preds = %9
  %16 = load %struct._RV_fmd_pmd** %1, align 8
  call void @_RV_fmd_pmd_dc_snda(%struct._RV_fmd_pmd* %16)
  %17 = load i32* %3, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %24

; <label>:19                                      ; preds = %15
  %20 = load i32* %3, align 4
  %21 = call %struct._RV_stat_node* @_RV_stat_node_create(i32 %20, i64 1)
  %22 = load %struct._RV_fmd_pmd** %1, align 8
  %23 = getelementptr inbounds %struct._RV_fmd_pmd* %22, i32 0, i32 2
  store %struct._RV_stat_node* %21, %struct._RV_stat_node** %23, align 8
  br label %24

; <label>:24                                      ; preds = %19, %15
  br label %25

; <label>:25                                      ; preds = %24, %12
  %26 = load i8** %4, align 8
  %27 = load %struct._RV_fmd_pmd** %1, align 8
  %28 = getelementptr inbounds %struct._RV_fmd_pmd* %27, i32 0, i32 0
  store i8* %26, i8** %28, align 8
  %29 = load i8** %5, align 8
  %30 = load %struct._RV_fmd_pmd** %1, align 8
  %31 = getelementptr inbounds %struct._RV_fmd_pmd* %30, i32 0, i32 1
  store i8* %29, i8** %31, align 8
  br label %32

; <label>:32                                      ; preds = %25, %8
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_fmd_pmd_set_null(%struct._RV_fmd_pmd* %fpmd) #2 {
  %1 = alloca %struct._RV_fmd_pmd*, align 8
  store %struct._RV_fmd_pmd* %fpmd, %struct._RV_fmd_pmd** %1, align 8
  %2 = load %struct._RV_fmd_pmd** %1, align 8
  %3 = icmp eq %struct._RV_fmd_pmd* %2, null
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %11

; <label>:5                                       ; preds = %0
  %6 = load %struct._RV_fmd_pmd** %1, align 8
  call void @_RV_fmd_pmd_dc_snda(%struct._RV_fmd_pmd* %6)
  %7 = load %struct._RV_fmd_pmd** %1, align 8
  %8 = getelementptr inbounds %struct._RV_fmd_pmd* %7, i32 0, i32 0
  store i8* null, i8** %8, align 8
  %9 = load %struct._RV_fmd_pmd** %1, align 8
  %10 = getelementptr inbounds %struct._RV_fmd_pmd* %9, i32 0, i32 1
  store i8* null, i8** %10, align 8
  br label %11

; <label>:11                                      ; preds = %5, %4
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_fmd_pmd_cp_pmd(%struct._RV_fmd_pmd* %fpmd, %struct._RV_pmd* %pmd) #2 {
  %1 = alloca %struct._RV_fmd_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  store %struct._RV_fmd_pmd* %fpmd, %struct._RV_fmd_pmd** %1, align 8
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %2, align 8
  %3 = load %struct._RV_fmd_pmd** %1, align 8
  %4 = icmp eq %struct._RV_fmd_pmd* %3, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %26

; <label>:6                                       ; preds = %0
  %7 = load %struct._RV_pmd** %2, align 8
  %8 = icmp eq %struct._RV_pmd* %7, null
  br i1 %8, label %9, label %11

; <label>:9                                       ; preds = %6
  %10 = load %struct._RV_fmd_pmd** %1, align 8
  call void @_RV_fmd_pmd_set_null(%struct._RV_fmd_pmd* %10)
  br label %26

; <label>:11                                      ; preds = %6
  %12 = load %struct._RV_fmd_pmd** %1, align 8
  %13 = load %struct._RV_pmd** %2, align 8
  %14 = getelementptr inbounds %struct._RV_pmd* %13, i32 0, i32 2
  %15 = load %struct._RV_stat_node** %14, align 8
  call void @_RV_fmd_pmd_c_snda(%struct._RV_fmd_pmd* %12, %struct._RV_stat_node* %15)
  %16 = load %struct._RV_pmd** %2, align 8
  %17 = getelementptr inbounds %struct._RV_pmd* %16, i32 0, i32 0
  %18 = load i8** %17, align 8
  %19 = load %struct._RV_fmd_pmd** %1, align 8
  %20 = getelementptr inbounds %struct._RV_fmd_pmd* %19, i32 0, i32 0
  store i8* %18, i8** %20, align 8
  %21 = load %struct._RV_pmd** %2, align 8
  %22 = getelementptr inbounds %struct._RV_pmd* %21, i32 0, i32 1
  %23 = load i8** %22, align 8
  %24 = load %struct._RV_fmd_pmd** %1, align 8
  %25 = getelementptr inbounds %struct._RV_fmd_pmd* %24, i32 0, i32 1
  store i8* %23, i8** %25, align 8
  br label %26

; <label>:26                                      ; preds = %11, %9, %5
  ret void
}

; Function Attrs: nounwind uwtable
define %struct._RV_fmd* @_RV_fmd_create(void (...)* %func, i8 zeroext %capacity) #0 {
  %1 = alloca %struct._RV_fmd*, align 8
  %2 = alloca void (...)*, align 8
  %3 = alloca i8, align 1
  %fmd = alloca %struct._RV_fmd*, align 8
  %i = alloca i8, align 1
  store void (...)* %func, void (...)** %2, align 8
  store i8 %capacity, i8* %3, align 1
  %4 = call noalias i8* @malloc(i64 32) #7
  %5 = bitcast i8* %4 to %struct._RV_fmd*
  store %struct._RV_fmd* %5, %struct._RV_fmd** %fmd, align 8
  %6 = load %struct._RV_fmd** %fmd, align 8
  %7 = icmp eq %struct._RV_fmd* %6, null
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  store %struct._RV_fmd* null, %struct._RV_fmd** %1
  br label %66

; <label>:9                                       ; preds = %0
  %10 = load i8* %3, align 1
  %11 = zext i8 %10 to i64
  %12 = mul i64 %11, 24
  %13 = call noalias i8* @malloc(i64 %12) #7
  %14 = bitcast i8* %13 to %struct._RV_fmd_pmd*
  %15 = load %struct._RV_fmd** %fmd, align 8
  %16 = getelementptr inbounds %struct._RV_fmd* %15, i32 0, i32 0
  store %struct._RV_fmd_pmd* %14, %struct._RV_fmd_pmd** %16, align 8
  %17 = load %struct._RV_fmd** %fmd, align 8
  %18 = getelementptr inbounds %struct._RV_fmd* %17, i32 0, i32 0
  %19 = load %struct._RV_fmd_pmd** %18, align 8
  %20 = icmp eq %struct._RV_fmd_pmd* %19, null
  br i1 %20, label %21, label %24

; <label>:21                                      ; preds = %9
  %22 = load %struct._RV_fmd** %fmd, align 8
  %23 = bitcast %struct._RV_fmd* %22 to i8*
  call void @free(i8* %23) #7
  store %struct._RV_fmd* null, %struct._RV_fmd** %1
  br label %66

; <label>:24                                      ; preds = %9
  store i8 0, i8* %i, align 1
  br label %25

; <label>:25                                      ; preds = %53, %24
  %26 = load i8* %i, align 1
  %27 = zext i8 %26 to i32
  %28 = load i8* %3, align 1
  %29 = zext i8 %28 to i32
  %30 = icmp slt i32 %27, %29
  br i1 %30, label %31, label %56

; <label>:31                                      ; preds = %25
  %32 = load i8* %i, align 1
  %33 = zext i8 %32 to i64
  %34 = load %struct._RV_fmd** %fmd, align 8
  %35 = getelementptr inbounds %struct._RV_fmd* %34, i32 0, i32 0
  %36 = load %struct._RV_fmd_pmd** %35, align 8
  %37 = getelementptr inbounds %struct._RV_fmd_pmd* %36, i64 %33
  %38 = getelementptr inbounds %struct._RV_fmd_pmd* %37, i32 0, i32 0
  store i8* null, i8** %38, align 8
  %39 = load i8* %i, align 1
  %40 = zext i8 %39 to i64
  %41 = load %struct._RV_fmd** %fmd, align 8
  %42 = getelementptr inbounds %struct._RV_fmd* %41, i32 0, i32 0
  %43 = load %struct._RV_fmd_pmd** %42, align 8
  %44 = getelementptr inbounds %struct._RV_fmd_pmd* %43, i64 %40
  %45 = getelementptr inbounds %struct._RV_fmd_pmd* %44, i32 0, i32 1
  store i8* null, i8** %45, align 8
  %46 = load i8* %i, align 1
  %47 = zext i8 %46 to i64
  %48 = load %struct._RV_fmd** %fmd, align 8
  %49 = getelementptr inbounds %struct._RV_fmd* %48, i32 0, i32 0
  %50 = load %struct._RV_fmd_pmd** %49, align 8
  %51 = getelementptr inbounds %struct._RV_fmd_pmd* %50, i64 %47
  %52 = getelementptr inbounds %struct._RV_fmd_pmd* %51, i32 0, i32 2
  store %struct._RV_stat_node* null, %struct._RV_stat_node** %52, align 8
  br label %53

; <label>:53                                      ; preds = %31
  %54 = load i8* %i, align 1
  %55 = add i8 %54, 1
  store i8 %55, i8* %i, align 1
  br label %25

; <label>:56                                      ; preds = %25
  %57 = load i8* %3, align 1
  %58 = load %struct._RV_fmd** %fmd, align 8
  %59 = getelementptr inbounds %struct._RV_fmd* %58, i32 0, i32 1
  store i8 %57, i8* %59, align 1
  %60 = load void (...)** %2, align 8
  %61 = load %struct._RV_fmd** %fmd, align 8
  %62 = getelementptr inbounds %struct._RV_fmd* %61, i32 0, i32 2
  store void (...)* %60, void (...)** %62, align 8
  %63 = load %struct._RV_fmd** %fmd, align 8
  %64 = getelementptr inbounds %struct._RV_fmd* %63, i32 0, i32 3
  store %struct._RV_fmd* null, %struct._RV_fmd** %64, align 8
  %65 = load %struct._RV_fmd** %fmd, align 8
  store %struct._RV_fmd* %65, %struct._RV_fmd** %1
  br label %66

; <label>:66                                      ; preds = %56, %21, %8
  %67 = load %struct._RV_fmd** %1
  ret %struct._RV_fmd* %67
}

; Function Attrs: nounwind uwtable
define void @_RV_fmd_free_pmds(%struct._RV_fmd* %fmd) #0 {
  %1 = alloca %struct._RV_fmd*, align 8
  %i = alloca i8, align 1
  store %struct._RV_fmd* %fmd, %struct._RV_fmd** %1, align 8
  %2 = load %struct._RV_fmd** %1, align 8
  %3 = icmp eq %struct._RV_fmd* %2, null
  br i1 %3, label %9, label %4

; <label>:4                                       ; preds = %0
  %5 = load %struct._RV_fmd** %1, align 8
  %6 = getelementptr inbounds %struct._RV_fmd* %5, i32 0, i32 0
  %7 = load %struct._RV_fmd_pmd** %6, align 8
  %8 = icmp eq %struct._RV_fmd_pmd* %7, null
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %4, %0
  br label %39

; <label>:10                                      ; preds = %4
  store i8 0, i8* %i, align 1
  br label %11

; <label>:11                                      ; preds = %27, %10
  %12 = load i8* %i, align 1
  %13 = zext i8 %12 to i32
  %14 = load %struct._RV_fmd** %1, align 8
  %15 = getelementptr inbounds %struct._RV_fmd* %14, i32 0, i32 1
  %16 = load i8* %15, align 1
  %17 = zext i8 %16 to i32
  %18 = icmp slt i32 %13, %17
  br i1 %18, label %19, label %30

; <label>:19                                      ; preds = %11
  %20 = load %struct._RV_fmd** %1, align 8
  %21 = getelementptr inbounds %struct._RV_fmd* %20, i32 0, i32 0
  %22 = load %struct._RV_fmd_pmd** %21, align 8
  %23 = load i8* %i, align 1
  %24 = zext i8 %23 to i32
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds %struct._RV_fmd_pmd* %22, i64 %25
  call void @_RV_fmd_pmd_dc_snda(%struct._RV_fmd_pmd* %26)
  br label %27

; <label>:27                                      ; preds = %19
  %28 = load i8* %i, align 1
  %29 = add i8 %28, 1
  store i8 %29, i8* %i, align 1
  br label %11

; <label>:30                                      ; preds = %11
  %31 = load %struct._RV_fmd** %1, align 8
  %32 = getelementptr inbounds %struct._RV_fmd* %31, i32 0, i32 0
  %33 = load %struct._RV_fmd_pmd** %32, align 8
  %34 = bitcast %struct._RV_fmd_pmd* %33 to i8*
  call void @free(i8* %34) #7
  %35 = load %struct._RV_fmd** %1, align 8
  %36 = getelementptr inbounds %struct._RV_fmd* %35, i32 0, i32 0
  store %struct._RV_fmd_pmd* null, %struct._RV_fmd_pmd** %36, align 8
  %37 = load %struct._RV_fmd** %1, align 8
  %38 = getelementptr inbounds %struct._RV_fmd* %37, i32 0, i32 1
  store i8 0, i8* %38, align 1
  br label %39

; <label>:39                                      ; preds = %30, %9
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_fmd_free(%struct._RV_fmd* %fmd) #2 {
  %1 = alloca %struct._RV_fmd*, align 8
  store %struct._RV_fmd* %fmd, %struct._RV_fmd** %1, align 8
  %2 = load %struct._RV_fmd** %1, align 8
  %3 = icmp eq %struct._RV_fmd* %2, null
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %9

; <label>:5                                       ; preds = %0
  %6 = load %struct._RV_fmd** %1, align 8
  call void @_RV_fmd_free_pmds(%struct._RV_fmd* %6)
  %7 = load %struct._RV_fmd** %1, align 8
  %8 = bitcast %struct._RV_fmd* %7 to i8*
  call void @free(i8* %8) #7
  br label %9

; <label>:9                                       ; preds = %5, %4
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_fmd_pmd* @_RV_fmd_get_fmd_pmd(%struct._RV_fmd* %fmd, i8 zeroext %i) #2 {
  %1 = alloca %struct._RV_fmd_pmd*, align 8
  %2 = alloca %struct._RV_fmd*, align 8
  %3 = alloca i8, align 1
  store %struct._RV_fmd* %fmd, %struct._RV_fmd** %2, align 8
  store i8 %i, i8* %3, align 1
  %4 = load %struct._RV_fmd** %2, align 8
  %5 = icmp eq %struct._RV_fmd* %4, null
  br i1 %5, label %19, label %6

; <label>:6                                       ; preds = %0
  %7 = load %struct._RV_fmd** %2, align 8
  %8 = getelementptr inbounds %struct._RV_fmd* %7, i32 0, i32 0
  %9 = load %struct._RV_fmd_pmd** %8, align 8
  %10 = icmp eq %struct._RV_fmd_pmd* %9, null
  br i1 %10, label %19, label %11

; <label>:11                                      ; preds = %6
  %12 = load i8* %3, align 1
  %13 = zext i8 %12 to i32
  %14 = load %struct._RV_fmd** %2, align 8
  %15 = getelementptr inbounds %struct._RV_fmd* %14, i32 0, i32 1
  %16 = load i8* %15, align 1
  %17 = zext i8 %16 to i32
  %18 = icmp sge i32 %13, %17
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %11, %6, %0
  store %struct._RV_fmd_pmd* null, %struct._RV_fmd_pmd** %1
  br label %28

; <label>:20                                      ; preds = %11
  %21 = load %struct._RV_fmd** %2, align 8
  %22 = getelementptr inbounds %struct._RV_fmd* %21, i32 0, i32 0
  %23 = load %struct._RV_fmd_pmd** %22, align 8
  %24 = load i8* %3, align 1
  %25 = zext i8 %24 to i32
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds %struct._RV_fmd_pmd* %23, i64 %26
  store %struct._RV_fmd_pmd* %27, %struct._RV_fmd_pmd** %1
  br label %28

; <label>:28                                      ; preds = %20, %19
  %29 = load %struct._RV_fmd_pmd** %1
  ret %struct._RV_fmd_pmd* %29
}

; Function Attrs: nounwind uwtable
define void @_RV_fmd_dc_snda(%struct._RV_fmd* %fmd) #0 {
  %1 = alloca %struct._RV_fmd*, align 8
  %i = alloca i8, align 1
  store %struct._RV_fmd* %fmd, %struct._RV_fmd** %1, align 8
  %2 = load %struct._RV_fmd** %1, align 8
  %3 = icmp eq %struct._RV_fmd* %2, null
  br i1 %3, label %9, label %4

; <label>:4                                       ; preds = %0
  %5 = load %struct._RV_fmd** %1, align 8
  %6 = getelementptr inbounds %struct._RV_fmd* %5, i32 0, i32 0
  %7 = load %struct._RV_fmd_pmd** %6, align 8
  %8 = icmp eq %struct._RV_fmd_pmd* %7, null
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %4, %0
  br label %30

; <label>:10                                      ; preds = %4
  store i8 0, i8* %i, align 1
  br label %11

; <label>:11                                      ; preds = %27, %10
  %12 = load i8* %i, align 1
  %13 = zext i8 %12 to i32
  %14 = load %struct._RV_fmd** %1, align 8
  %15 = getelementptr inbounds %struct._RV_fmd* %14, i32 0, i32 1
  %16 = load i8* %15, align 1
  %17 = zext i8 %16 to i32
  %18 = icmp slt i32 %13, %17
  br i1 %18, label %19, label %30

; <label>:19                                      ; preds = %11
  %20 = load %struct._RV_fmd** %1, align 8
  %21 = getelementptr inbounds %struct._RV_fmd* %20, i32 0, i32 0
  %22 = load %struct._RV_fmd_pmd** %21, align 8
  %23 = load i8* %i, align 1
  %24 = zext i8 %23 to i32
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds %struct._RV_fmd_pmd* %22, i64 %25
  call void @_RV_fmd_pmd_dc_snda(%struct._RV_fmd_pmd* %26)
  br label %27

; <label>:27                                      ; preds = %19
  %28 = load i8* %i, align 1
  %29 = add i8 %28, 1
  store i8 %29, i8* %i, align 1
  br label %11

; <label>:30                                      ; preds = %11, %9
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_fmd_set_null(%struct._RV_fmd* %fmd) #2 {
  %1 = alloca %struct._RV_fmd*, align 8
  %i = alloca i8, align 1
  store %struct._RV_fmd* %fmd, %struct._RV_fmd** %1, align 8
  %2 = load %struct._RV_fmd** %1, align 8
  %3 = icmp eq %struct._RV_fmd* %2, null
  br i1 %3, label %9, label %4

; <label>:4                                       ; preds = %0
  %5 = load %struct._RV_fmd** %1, align 8
  %6 = getelementptr inbounds %struct._RV_fmd* %5, i32 0, i32 0
  %7 = load %struct._RV_fmd_pmd** %6, align 8
  %8 = icmp eq %struct._RV_fmd_pmd* %7, null
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %4, %0
  br label %30

; <label>:10                                      ; preds = %4
  store i8 0, i8* %i, align 1
  br label %11

; <label>:11                                      ; preds = %27, %10
  %12 = load i8* %i, align 1
  %13 = zext i8 %12 to i32
  %14 = load %struct._RV_fmd** %1, align 8
  %15 = getelementptr inbounds %struct._RV_fmd* %14, i32 0, i32 1
  %16 = load i8* %15, align 1
  %17 = zext i8 %16 to i32
  %18 = icmp slt i32 %13, %17
  br i1 %18, label %19, label %30

; <label>:19                                      ; preds = %11
  %20 = load %struct._RV_fmd** %1, align 8
  %21 = getelementptr inbounds %struct._RV_fmd* %20, i32 0, i32 0
  %22 = load %struct._RV_fmd_pmd** %21, align 8
  %23 = load i8* %i, align 1
  %24 = zext i8 %23 to i32
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds %struct._RV_fmd_pmd* %22, i64 %25
  call void @_RV_fmd_pmd_set_null(%struct._RV_fmd_pmd* %26)
  br label %27

; <label>:27                                      ; preds = %19
  %28 = load i8* %i, align 1
  %29 = add i8 %28, 1
  store i8 %29, i8* %i, align 1
  br label %11

; <label>:30                                      ; preds = %11, %9
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_fmd_cp_pmd(%struct._RV_fmd* %fmd, i8 zeroext %i, %struct._RV_pmd* %pmd) #2 {
  %1 = alloca %struct._RV_fmd*, align 8
  %2 = alloca i8, align 1
  %3 = alloca %struct._RV_pmd*, align 8
  store %struct._RV_fmd* %fmd, %struct._RV_fmd** %1, align 8
  store i8 %i, i8* %2, align 1
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %3, align 8
  %4 = load %struct._RV_fmd** %1, align 8
  %5 = load i8* %2, align 1
  %6 = call %struct._RV_fmd_pmd* @_RV_fmd_get_fmd_pmd(%struct._RV_fmd* %4, i8 zeroext %5)
  %7 = load %struct._RV_pmd** %3, align 8
  call void @_RV_fmd_pmd_cp_pmd(%struct._RV_fmd_pmd* %6, %struct._RV_pmd* %7)
  ret void
}

; Function Attrs: nounwind uwtable
define void @_RV_fmd_resize_pmds(%struct._RV_fmd* %fmd, i8 zeroext %new_capacity, i8 zeroext %clear) #0 {
  %1 = alloca %struct._RV_fmd*, align 8
  %2 = alloca i8, align 1
  %3 = alloca i8, align 1
  %i = alloca i8, align 1
  %new_pmds = alloca %struct._RV_fmd_pmd*, align 8
  store %struct._RV_fmd* %fmd, %struct._RV_fmd** %1, align 8
  store i8 %new_capacity, i8* %2, align 1
  store i8 %clear, i8* %3, align 1
  %4 = load %struct._RV_fmd** %1, align 8
  %5 = getelementptr inbounds %struct._RV_fmd* %4, i32 0, i32 1
  %6 = load i8* %5, align 1
  %7 = zext i8 %6 to i32
  %8 = load i8* %2, align 1
  %9 = zext i8 %8 to i32
  %10 = icmp sge i32 %7, %9
  br i1 %10, label %11, label %56

; <label>:11                                      ; preds = %0
  %12 = load i8* %3, align 1
  %13 = zext i8 %12 to i32
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %34

; <label>:15                                      ; preds = %11
  store i8 0, i8* %i, align 1
  br label %16

; <label>:16                                      ; preds = %30, %15
  %17 = load i8* %i, align 1
  %18 = zext i8 %17 to i32
  %19 = load i8* %2, align 1
  %20 = zext i8 %19 to i32
  %21 = icmp slt i32 %18, %20
  br i1 %21, label %22, label %33

; <label>:22                                      ; preds = %16
  %23 = load %struct._RV_fmd** %1, align 8
  %24 = getelementptr inbounds %struct._RV_fmd* %23, i32 0, i32 0
  %25 = load %struct._RV_fmd_pmd** %24, align 8
  %26 = load i8* %i, align 1
  %27 = zext i8 %26 to i32
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds %struct._RV_fmd_pmd* %25, i64 %28
  call void @_RV_fmd_pmd_set_null(%struct._RV_fmd_pmd* %29)
  br label %30

; <label>:30                                      ; preds = %22
  %31 = load i8* %i, align 1
  %32 = add i8 %31, 1
  store i8 %32, i8* %i, align 1
  br label %16

; <label>:33                                      ; preds = %16
  br label %34

; <label>:34                                      ; preds = %33, %11
  %35 = load i8* %2, align 1
  store i8 %35, i8* %i, align 1
  br label %36

; <label>:36                                      ; preds = %52, %34
  %37 = load i8* %i, align 1
  %38 = zext i8 %37 to i32
  %39 = load %struct._RV_fmd** %1, align 8
  %40 = getelementptr inbounds %struct._RV_fmd* %39, i32 0, i32 1
  %41 = load i8* %40, align 1
  %42 = zext i8 %41 to i32
  %43 = icmp slt i32 %38, %42
  br i1 %43, label %44, label %55

; <label>:44                                      ; preds = %36
  %45 = load %struct._RV_fmd** %1, align 8
  %46 = getelementptr inbounds %struct._RV_fmd* %45, i32 0, i32 0
  %47 = load %struct._RV_fmd_pmd** %46, align 8
  %48 = load i8* %i, align 1
  %49 = zext i8 %48 to i32
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds %struct._RV_fmd_pmd* %47, i64 %50
  call void @_RV_fmd_pmd_set_null(%struct._RV_fmd_pmd* %51)
  br label %52

; <label>:52                                      ; preds = %44
  %53 = load i8* %i, align 1
  %54 = add i8 %53, 1
  store i8 %54, i8* %i, align 1
  br label %36

; <label>:55                                      ; preds = %36
  br label %182

; <label>:56                                      ; preds = %0
  %57 = load i8* %2, align 1
  %58 = zext i8 %57 to i64
  %59 = mul i64 %58, 24
  %60 = call noalias i8* @malloc(i64 %59) #7
  %61 = bitcast i8* %60 to %struct._RV_fmd_pmd*
  store %struct._RV_fmd_pmd* %61, %struct._RV_fmd_pmd** %new_pmds, align 8
  %62 = load i8* %3, align 1
  %63 = zext i8 %62 to i32
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %65, label %92

; <label>:65                                      ; preds = %56
  store i8 0, i8* %i, align 1
  br label %66

; <label>:66                                      ; preds = %88, %65
  %67 = load i8* %i, align 1
  %68 = zext i8 %67 to i32
  %69 = load i8* %2, align 1
  %70 = zext i8 %69 to i32
  %71 = icmp slt i32 %68, %70
  br i1 %71, label %72, label %91

; <label>:72                                      ; preds = %66
  %73 = load i8* %i, align 1
  %74 = zext i8 %73 to i64
  %75 = load %struct._RV_fmd_pmd** %new_pmds, align 8
  %76 = getelementptr inbounds %struct._RV_fmd_pmd* %75, i64 %74
  %77 = getelementptr inbounds %struct._RV_fmd_pmd* %76, i32 0, i32 0
  store i8* null, i8** %77, align 8
  %78 = load i8* %i, align 1
  %79 = zext i8 %78 to i64
  %80 = load %struct._RV_fmd_pmd** %new_pmds, align 8
  %81 = getelementptr inbounds %struct._RV_fmd_pmd* %80, i64 %79
  %82 = getelementptr inbounds %struct._RV_fmd_pmd* %81, i32 0, i32 1
  store i8* null, i8** %82, align 8
  %83 = load i8* %i, align 1
  %84 = zext i8 %83 to i64
  %85 = load %struct._RV_fmd_pmd** %new_pmds, align 8
  %86 = getelementptr inbounds %struct._RV_fmd_pmd* %85, i64 %84
  %87 = getelementptr inbounds %struct._RV_fmd_pmd* %86, i32 0, i32 2
  store %struct._RV_stat_node* null, %struct._RV_stat_node** %87, align 8
  br label %88

; <label>:88                                      ; preds = %72
  %89 = load i8* %i, align 1
  %90 = add i8 %89, 1
  store i8 %90, i8* %i, align 1
  br label %66

; <label>:91                                      ; preds = %66
  br label %171

; <label>:92                                      ; preds = %56
  store i8 0, i8* %i, align 1
  br label %93

; <label>:93                                      ; preds = %141, %92
  %94 = load i8* %i, align 1
  %95 = zext i8 %94 to i32
  %96 = load %struct._RV_fmd** %1, align 8
  %97 = getelementptr inbounds %struct._RV_fmd* %96, i32 0, i32 1
  %98 = load i8* %97, align 1
  %99 = zext i8 %98 to i32
  %100 = icmp slt i32 %95, %99
  br i1 %100, label %101, label %144

; <label>:101                                     ; preds = %93
  %102 = load i8* %i, align 1
  %103 = zext i8 %102 to i64
  %104 = load %struct._RV_fmd** %1, align 8
  %105 = getelementptr inbounds %struct._RV_fmd* %104, i32 0, i32 0
  %106 = load %struct._RV_fmd_pmd** %105, align 8
  %107 = getelementptr inbounds %struct._RV_fmd_pmd* %106, i64 %103
  %108 = getelementptr inbounds %struct._RV_fmd_pmd* %107, i32 0, i32 0
  %109 = load i8** %108, align 8
  %110 = load i8* %i, align 1
  %111 = zext i8 %110 to i64
  %112 = load %struct._RV_fmd_pmd** %new_pmds, align 8
  %113 = getelementptr inbounds %struct._RV_fmd_pmd* %112, i64 %111
  %114 = getelementptr inbounds %struct._RV_fmd_pmd* %113, i32 0, i32 0
  store i8* %109, i8** %114, align 8
  %115 = load i8* %i, align 1
  %116 = zext i8 %115 to i64
  %117 = load %struct._RV_fmd** %1, align 8
  %118 = getelementptr inbounds %struct._RV_fmd* %117, i32 0, i32 0
  %119 = load %struct._RV_fmd_pmd** %118, align 8
  %120 = getelementptr inbounds %struct._RV_fmd_pmd* %119, i64 %116
  %121 = getelementptr inbounds %struct._RV_fmd_pmd* %120, i32 0, i32 1
  %122 = load i8** %121, align 8
  %123 = load i8* %i, align 1
  %124 = zext i8 %123 to i64
  %125 = load %struct._RV_fmd_pmd** %new_pmds, align 8
  %126 = getelementptr inbounds %struct._RV_fmd_pmd* %125, i64 %124
  %127 = getelementptr inbounds %struct._RV_fmd_pmd* %126, i32 0, i32 1
  store i8* %122, i8** %127, align 8
  %128 = load i8* %i, align 1
  %129 = zext i8 %128 to i64
  %130 = load %struct._RV_fmd** %1, align 8
  %131 = getelementptr inbounds %struct._RV_fmd* %130, i32 0, i32 0
  %132 = load %struct._RV_fmd_pmd** %131, align 8
  %133 = getelementptr inbounds %struct._RV_fmd_pmd* %132, i64 %129
  %134 = getelementptr inbounds %struct._RV_fmd_pmd* %133, i32 0, i32 2
  %135 = load %struct._RV_stat_node** %134, align 8
  %136 = load i8* %i, align 1
  %137 = zext i8 %136 to i64
  %138 = load %struct._RV_fmd_pmd** %new_pmds, align 8
  %139 = getelementptr inbounds %struct._RV_fmd_pmd* %138, i64 %137
  %140 = getelementptr inbounds %struct._RV_fmd_pmd* %139, i32 0, i32 2
  store %struct._RV_stat_node* %135, %struct._RV_stat_node** %140, align 8
  br label %141

; <label>:141                                     ; preds = %101
  %142 = load i8* %i, align 1
  %143 = add i8 %142, 1
  store i8 %143, i8* %i, align 1
  br label %93

; <label>:144                                     ; preds = %93
  br label %145

; <label>:145                                     ; preds = %167, %144
  %146 = load i8* %i, align 1
  %147 = zext i8 %146 to i32
  %148 = load i8* %2, align 1
  %149 = zext i8 %148 to i32
  %150 = icmp slt i32 %147, %149
  br i1 %150, label %151, label %170

; <label>:151                                     ; preds = %145
  %152 = load i8* %i, align 1
  %153 = zext i8 %152 to i64
  %154 = load %struct._RV_fmd_pmd** %new_pmds, align 8
  %155 = getelementptr inbounds %struct._RV_fmd_pmd* %154, i64 %153
  %156 = getelementptr inbounds %struct._RV_fmd_pmd* %155, i32 0, i32 0
  store i8* null, i8** %156, align 8
  %157 = load i8* %i, align 1
  %158 = zext i8 %157 to i64
  %159 = load %struct._RV_fmd_pmd** %new_pmds, align 8
  %160 = getelementptr inbounds %struct._RV_fmd_pmd* %159, i64 %158
  %161 = getelementptr inbounds %struct._RV_fmd_pmd* %160, i32 0, i32 1
  store i8* null, i8** %161, align 8
  %162 = load i8* %i, align 1
  %163 = zext i8 %162 to i64
  %164 = load %struct._RV_fmd_pmd** %new_pmds, align 8
  %165 = getelementptr inbounds %struct._RV_fmd_pmd* %164, i64 %163
  %166 = getelementptr inbounds %struct._RV_fmd_pmd* %165, i32 0, i32 2
  store %struct._RV_stat_node* null, %struct._RV_stat_node** %166, align 8
  br label %167

; <label>:167                                     ; preds = %151
  %168 = load i8* %i, align 1
  %169 = add i8 %168, 1
  store i8 %169, i8* %i, align 1
  br label %145

; <label>:170                                     ; preds = %145
  br label %171

; <label>:171                                     ; preds = %170, %91
  %172 = load %struct._RV_fmd** %1, align 8
  %173 = getelementptr inbounds %struct._RV_fmd* %172, i32 0, i32 0
  %174 = load %struct._RV_fmd_pmd** %173, align 8
  %175 = bitcast %struct._RV_fmd_pmd* %174 to i8*
  call void @free(i8* %175) #7
  %176 = load %struct._RV_fmd_pmd** %new_pmds, align 8
  %177 = load %struct._RV_fmd** %1, align 8
  %178 = getelementptr inbounds %struct._RV_fmd* %177, i32 0, i32 0
  store %struct._RV_fmd_pmd* %176, %struct._RV_fmd_pmd** %178, align 8
  %179 = load i8* %2, align 1
  %180 = load %struct._RV_fmd** %1, align 8
  %181 = getelementptr inbounds %struct._RV_fmd* %180, i32 0, i32 1
  store i8 %179, i8* %181, align 1
  br label %182

; <label>:182                                     ; preds = %171, %55
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_trie_get_index(i8** %ptra, i64* %primary_index, i64* %secondary_index) #2 {
  %1 = alloca i8**, align 8
  %2 = alloca i64*, align 8
  %3 = alloca i64*, align 8
  %key = alloca i64, align 8
  store i8** %ptra, i8*** %1, align 8
  store i64* %primary_index, i64** %2, align 8
  store i64* %secondary_index, i64** %3, align 8
  %4 = load i8*** %1, align 8
  %5 = ptrtoint i8** %4 to i64
  store i64 %5, i64* %key, align 8
  %6 = load i64* %key, align 8
  %7 = lshr i64 %6, 25
  %8 = and i64 %7, 8388607
  %9 = load i64** %2, align 8
  store i64 %8, i64* %9, align 8
  %10 = load i64* %key, align 8
  %11 = lshr i64 %10, 3
  %12 = and i64 %11, 4194303
  %13 = load i64** %3, align 8
  store i64 %12, i64* %13, align 8
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_pmd** @_RV_trie_create() #2 {
  %len = alloca i64, align 8
  %trie_primary = alloca %struct._RV_pmd**, align 8
  store i64 67108864, i64* %len, align 8
  %1 = load i64* %len, align 8
  %2 = call i8* @mmap(i8* null, i64 %1, i32 3, i32 16418, i32 -1, i64 0) #7
  %3 = bitcast i8* %2 to %struct._RV_pmd**
  store %struct._RV_pmd** %3, %struct._RV_pmd*** %trie_primary, align 8
  %4 = load %struct._RV_pmd*** %trie_primary, align 8
  %5 = icmp ne %struct._RV_pmd** %4, inttoptr (i64 -1 to %struct._RV_pmd**)
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  br label %9

; <label>:7                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([27 x i8]* @.str8, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8]* @.str9, i32 0, i32 0), i32 830, i8* getelementptr inbounds ([28 x i8]* @__PRETTY_FUNCTION__._RV_trie_create, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %9

; <label>:9                                       ; preds = %8, %6
  %10 = load %struct._RV_pmd*** %trie_primary, align 8
  ret %struct._RV_pmd** %10
}

; Function Attrs: nounwind
declare i8* @mmap(i8*, i64, i32, i32, i32, i64) #3

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #4

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_pmd* @_RV_trie_create_secondary() #2 {
  %len = alloca i64, align 8
  %trie_secondary = alloca %struct._RV_pmd*, align 8
  store i64 134217728, i64* %len, align 8
  %1 = load i64* %len, align 8
  %2 = call i8* @mmap(i8* null, i64 %1, i32 3, i32 16418, i32 -1, i64 0) #7
  %3 = bitcast i8* %2 to %struct._RV_pmd*
  store %struct._RV_pmd* %3, %struct._RV_pmd** %trie_secondary, align 8
  %4 = load %struct._RV_pmd** %trie_secondary, align 8
  %5 = icmp ne %struct._RV_pmd* %4, inttoptr (i64 -1 to %struct._RV_pmd*)
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  br label %9

; <label>:7                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([28 x i8]* @.str10, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8]* @.str9, i32 0, i32 0), i32 845, i8* getelementptr inbounds ([37 x i8]* @__PRETTY_FUNCTION__._RV_trie_create_secondary, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %9

; <label>:9                                       ; preds = %8, %6
  %10 = load %struct._RV_pmd** %trie_secondary, align 8
  ret %struct._RV_pmd* %10
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_pmd* @_RV_trie_find_pmd(%struct._RV_pmd** %tbl, i8** %ptra) #2 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd**, align 8
  %3 = alloca i8**, align 8
  %primary_index = alloca i64, align 8
  %secondary_index = alloca i64, align 8
  %secondary_table = alloca %struct._RV_pmd*, align 8
  store %struct._RV_pmd** %tbl, %struct._RV_pmd*** %2, align 8
  store i8** %ptra, i8*** %3, align 8
  %4 = load i8*** %3, align 8
  call void @_RV_trie_get_index(i8** %4, i64* %primary_index, i64* %secondary_index)
  %5 = load i64* %primary_index, align 8
  %6 = load %struct._RV_pmd*** %2, align 8
  %7 = getelementptr inbounds %struct._RV_pmd** %6, i64 %5
  %8 = load %struct._RV_pmd** %7, align 8
  store %struct._RV_pmd* %8, %struct._RV_pmd** %secondary_table, align 8
  %9 = load %struct._RV_pmd** %secondary_table, align 8
  %10 = icmp eq %struct._RV_pmd* %9, null
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %0
  store %struct._RV_pmd* null, %struct._RV_pmd** %1
  br label %25

; <label>:12                                      ; preds = %0
  %13 = load i64* %secondary_index, align 8
  %14 = load %struct._RV_pmd** %secondary_table, align 8
  %15 = getelementptr inbounds %struct._RV_pmd* %14, i64 %13
  %16 = getelementptr inbounds %struct._RV_pmd* %15, i32 0, i32 3
  %17 = load i8* %16, align 1
  %18 = zext i8 %17 to i32
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %12
  store %struct._RV_pmd* null, %struct._RV_pmd** %1
  br label %25

; <label>:21                                      ; preds = %12
  %22 = load %struct._RV_pmd** %secondary_table, align 8
  %23 = load i64* %secondary_index, align 8
  %24 = getelementptr inbounds %struct._RV_pmd* %22, i64 %23
  store %struct._RV_pmd* %24, %struct._RV_pmd** %1
  br label %25

; <label>:25                                      ; preds = %21, %20, %11
  %26 = load %struct._RV_pmd** %1
  ret %struct._RV_pmd* %26
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_pmd* @_RV_trie_insert_pmd_ptr(%struct._RV_pmd** %tbl, i8** %ptra) #2 {
  %1 = alloca %struct._RV_pmd**, align 8
  %2 = alloca i8**, align 8
  %primary_index = alloca i64, align 8
  %secondary_index = alloca i64, align 8
  %secondary_table = alloca %struct._RV_pmd*, align 8
  store %struct._RV_pmd** %tbl, %struct._RV_pmd*** %1, align 8
  store i8** %ptra, i8*** %2, align 8
  %3 = load i8*** %2, align 8
  call void @_RV_trie_get_index(i8** %3, i64* %primary_index, i64* %secondary_index)
  %4 = load i64* %primary_index, align 8
  %5 = load %struct._RV_pmd*** %1, align 8
  %6 = getelementptr inbounds %struct._RV_pmd** %5, i64 %4
  %7 = load %struct._RV_pmd** %6, align 8
  store %struct._RV_pmd* %7, %struct._RV_pmd** %secondary_table, align 8
  %8 = load %struct._RV_pmd** %secondary_table, align 8
  %9 = icmp eq %struct._RV_pmd* %8, null
  br i1 %9, label %10, label %16

; <label>:10                                      ; preds = %0
  %11 = call %struct._RV_pmd* @_RV_trie_create_secondary()
  store %struct._RV_pmd* %11, %struct._RV_pmd** %secondary_table, align 8
  %12 = load %struct._RV_pmd** %secondary_table, align 8
  %13 = load i64* %primary_index, align 8
  %14 = load %struct._RV_pmd*** %1, align 8
  %15 = getelementptr inbounds %struct._RV_pmd** %14, i64 %13
  store %struct._RV_pmd* %12, %struct._RV_pmd** %15, align 8
  br label %16

; <label>:16                                      ; preds = %10, %0
  %17 = load i64* %secondary_index, align 8
  %18 = load %struct._RV_pmd** %secondary_table, align 8
  %19 = getelementptr inbounds %struct._RV_pmd* %18, i64 %17
  %20 = getelementptr inbounds %struct._RV_pmd* %19, i32 0, i32 3
  store i8 1, i8* %20, align 1
  %21 = load %struct._RV_pmd** %secondary_table, align 8
  %22 = load i64* %secondary_index, align 8
  %23 = getelementptr inbounds %struct._RV_pmd* %21, i64 %22
  ret %struct._RV_pmd* %23
}

; Function Attrs: inlinehint nounwind uwtable
define i32 @_RV_trie_remove_pmd(%struct._RV_pmd** %tbl, i8** %ptra) #2 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._RV_pmd**, align 8
  %3 = alloca i8**, align 8
  %pmd = alloca %struct._RV_pmd*, align 8
  store %struct._RV_pmd** %tbl, %struct._RV_pmd*** %2, align 8
  store i8** %ptra, i8*** %3, align 8
  %4 = load %struct._RV_pmd*** %2, align 8
  %5 = load i8*** %3, align 8
  %6 = call %struct._RV_pmd* @_RV_trie_find_pmd(%struct._RV_pmd** %4, i8** %5)
  store %struct._RV_pmd* %6, %struct._RV_pmd** %pmd, align 8
  %7 = load %struct._RV_pmd** %pmd, align 8
  %8 = icmp eq %struct._RV_pmd* null, %7
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %0
  store i32 0, i32* %1
  br label %14

; <label>:10                                      ; preds = %0
  %11 = load %struct._RV_pmd** %pmd, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %11)
  %12 = load %struct._RV_pmd** %pmd, align 8
  %13 = getelementptr inbounds %struct._RV_pmd* %12, i32 0, i32 3
  store i8 0, i8* %13, align 1
  store i32 1, i32* %1
  br label %14

; <label>:14                                      ; preds = %10, %9
  %15 = load i32* %1
  ret i32 %15
}

; Function Attrs: nounwind uwtable
define %struct._RV_pmd*** @_RV_trie_get_trie_ref_pmd() #0 {
  %1 = load %struct._RV_pmd*** @_RV_trie_get_trie_ref_pmd.tbl, align 8
  %2 = icmp eq %struct._RV_pmd** null, %1
  br i1 %2, label %3, label %5

; <label>:3                                       ; preds = %0
  %4 = call %struct._RV_pmd** @_RV_trie_create()
  store %struct._RV_pmd** %4, %struct._RV_pmd*** @_RV_trie_get_trie_ref_pmd.tbl, align 8
  br label %5

; <label>:5                                       ; preds = %3, %0
  ret %struct._RV_pmd*** @_RV_trie_get_trie_ref_pmd.tbl
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_pmd** @_RV_trie_get_trie_pmd() #2 {
  %1 = call %struct._RV_pmd*** @_RV_trie_get_trie_ref_pmd()
  %2 = load %struct._RV_pmd*** %1, align 8
  ret %struct._RV_pmd** %2
}

; Function Attrs: nounwind uwtable
define i32 @_RV_list_find_fmd_ref(%struct._RV_fmd** %head_ref, void (...)* %func, %struct._RV_fmd*** %prev_ref) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._RV_fmd**, align 8
  %3 = alloca void (...)*, align 8
  %4 = alloca %struct._RV_fmd***, align 8
  %cur = alloca %struct._RV_fmd*, align 8
  store %struct._RV_fmd** %head_ref, %struct._RV_fmd*** %2, align 8
  store void (...)* %func, void (...)** %3, align 8
  store %struct._RV_fmd*** %prev_ref, %struct._RV_fmd**** %4, align 8
  %5 = load %struct._RV_fmd*** %2, align 8
  %6 = load %struct._RV_fmd**** %4, align 8
  store %struct._RV_fmd** %5, %struct._RV_fmd*** %6, align 8
  %7 = load %struct._RV_fmd**** %4, align 8
  %8 = load %struct._RV_fmd*** %7, align 8
  %9 = load %struct._RV_fmd** %8, align 8
  store %struct._RV_fmd* %9, %struct._RV_fmd** %cur, align 8
  br label %10

; <label>:10                                      ; preds = %27, %0
  %11 = load %struct._RV_fmd** %cur, align 8
  %12 = icmp eq %struct._RV_fmd* %11, null
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %10
  store i32 0, i32* %1
  br label %34

; <label>:14                                      ; preds = %10
  %15 = load %struct._RV_fmd** %cur, align 8
  %16 = getelementptr inbounds %struct._RV_fmd* %15, i32 0, i32 2
  %17 = load void (...)** %16, align 8
  %18 = load void (...)** %3, align 8
  %19 = icmp uge void (...)* %17, %18
  br i1 %19, label %20, label %27

; <label>:20                                      ; preds = %14
  %21 = load %struct._RV_fmd** %cur, align 8
  %22 = getelementptr inbounds %struct._RV_fmd* %21, i32 0, i32 2
  %23 = load void (...)** %22, align 8
  %24 = load void (...)** %3, align 8
  %25 = icmp eq void (...)* %23, %24
  %26 = zext i1 %25 to i32
  store i32 %26, i32* %1
  br label %34

; <label>:27                                      ; preds = %14
  %28 = load %struct._RV_fmd** %cur, align 8
  %29 = getelementptr inbounds %struct._RV_fmd* %28, i32 0, i32 3
  %30 = load %struct._RV_fmd**** %4, align 8
  store %struct._RV_fmd** %29, %struct._RV_fmd*** %30, align 8
  %31 = load %struct._RV_fmd** %cur, align 8
  %32 = getelementptr inbounds %struct._RV_fmd* %31, i32 0, i32 3
  %33 = load %struct._RV_fmd** %32, align 8
  store %struct._RV_fmd* %33, %struct._RV_fmd** %cur, align 8
  br label %10

; <label>:34                                      ; preds = %20, %13
  %35 = load i32* %1
  ret i32 %35
}

; Function Attrs: inlinehint nounwind uwtable
define i32 @_RV_list_insert_fmd(%struct._RV_fmd** %head_ref, %struct._RV_fmd* %fmd, %struct._RV_fmd*** %prev_ref) #2 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._RV_fmd**, align 8
  %3 = alloca %struct._RV_fmd*, align 8
  %4 = alloca %struct._RV_fmd***, align 8
  %cur = alloca %struct._RV_fmd*, align 8
  store %struct._RV_fmd** %head_ref, %struct._RV_fmd*** %2, align 8
  store %struct._RV_fmd* %fmd, %struct._RV_fmd** %3, align 8
  store %struct._RV_fmd*** %prev_ref, %struct._RV_fmd**** %4, align 8
  %5 = load %struct._RV_fmd*** %2, align 8
  %6 = load %struct._RV_fmd** %3, align 8
  %7 = getelementptr inbounds %struct._RV_fmd* %6, i32 0, i32 2
  %8 = load void (...)** %7, align 8
  %9 = load %struct._RV_fmd**** %4, align 8
  %10 = call i32 @_RV_list_find_fmd_ref(%struct._RV_fmd** %5, void (...)* %8, %struct._RV_fmd*** %9)
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %25

; <label>:12                                      ; preds = %0
  %13 = load %struct._RV_fmd**** %4, align 8
  %14 = load %struct._RV_fmd*** %13, align 8
  %15 = load %struct._RV_fmd** %14, align 8
  store %struct._RV_fmd* %15, %struct._RV_fmd** %cur, align 8
  %16 = load %struct._RV_fmd** %cur, align 8
  %17 = getelementptr inbounds %struct._RV_fmd* %16, i32 0, i32 3
  %18 = load %struct._RV_fmd** %17, align 8
  %19 = load %struct._RV_fmd** %3, align 8
  %20 = getelementptr inbounds %struct._RV_fmd* %19, i32 0, i32 3
  store %struct._RV_fmd* %18, %struct._RV_fmd** %20, align 8
  %21 = load %struct._RV_fmd** %3, align 8
  %22 = load %struct._RV_fmd**** %4, align 8
  %23 = load %struct._RV_fmd*** %22, align 8
  store %struct._RV_fmd* %21, %struct._RV_fmd** %23, align 8
  %24 = load %struct._RV_fmd** %cur, align 8
  call void @_RV_fmd_free(%struct._RV_fmd* %24)
  store i32 0, i32* %1
  br label %34

; <label>:25                                      ; preds = %0
  %26 = load %struct._RV_fmd**** %4, align 8
  %27 = load %struct._RV_fmd*** %26, align 8
  %28 = load %struct._RV_fmd** %27, align 8
  %29 = load %struct._RV_fmd** %3, align 8
  %30 = getelementptr inbounds %struct._RV_fmd* %29, i32 0, i32 3
  store %struct._RV_fmd* %28, %struct._RV_fmd** %30, align 8
  %31 = load %struct._RV_fmd** %3, align 8
  %32 = load %struct._RV_fmd**** %4, align 8
  %33 = load %struct._RV_fmd*** %32, align 8
  store %struct._RV_fmd* %31, %struct._RV_fmd** %33, align 8
  store i32 1, i32* %1
  br label %34

; <label>:34                                      ; preds = %25, %12
  %35 = load i32* %1
  ret i32 %35
}

; Function Attrs: inlinehint nounwind uwtable
define i32 @_RV_list_insert_fmd_func(%struct._RV_fmd** %head_ref, void (...)* %func, i8 zeroext %capacity, %struct._RV_fmd*** %prev_ref) #2 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._RV_fmd**, align 8
  %3 = alloca void (...)*, align 8
  %4 = alloca i8, align 1
  %5 = alloca %struct._RV_fmd***, align 8
  %fmd = alloca %struct._RV_fmd*, align 8
  store %struct._RV_fmd** %head_ref, %struct._RV_fmd*** %2, align 8
  store void (...)* %func, void (...)** %3, align 8
  store i8 %capacity, i8* %4, align 1
  store %struct._RV_fmd*** %prev_ref, %struct._RV_fmd**** %5, align 8
  %6 = load %struct._RV_fmd*** %2, align 8
  %7 = load void (...)** %3, align 8
  %8 = load %struct._RV_fmd**** %5, align 8
  %9 = call i32 @_RV_list_find_fmd_ref(%struct._RV_fmd** %6, void (...)* %7, %struct._RV_fmd*** %8)
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %16

; <label>:11                                      ; preds = %0
  %12 = load %struct._RV_fmd**** %5, align 8
  %13 = load %struct._RV_fmd*** %12, align 8
  %14 = load %struct._RV_fmd** %13, align 8
  %15 = load i8* %4, align 1
  call void @_RV_fmd_resize_pmds(%struct._RV_fmd* %14, i8 zeroext %15, i8 zeroext 0)
  store i32 0, i32* %1
  br label %28

; <label>:16                                      ; preds = %0
  %17 = load void (...)** %3, align 8
  %18 = load i8* %4, align 1
  %19 = call %struct._RV_fmd* @_RV_fmd_create(void (...)* %17, i8 zeroext %18)
  store %struct._RV_fmd* %19, %struct._RV_fmd** %fmd, align 8
  %20 = load %struct._RV_fmd**** %5, align 8
  %21 = load %struct._RV_fmd*** %20, align 8
  %22 = load %struct._RV_fmd** %21, align 8
  %23 = load %struct._RV_fmd** %fmd, align 8
  %24 = getelementptr inbounds %struct._RV_fmd* %23, i32 0, i32 3
  store %struct._RV_fmd* %22, %struct._RV_fmd** %24, align 8
  %25 = load %struct._RV_fmd** %fmd, align 8
  %26 = load %struct._RV_fmd**** %5, align 8
  %27 = load %struct._RV_fmd*** %26, align 8
  store %struct._RV_fmd* %25, %struct._RV_fmd** %27, align 8
  store i32 1, i32* %1
  br label %28

; <label>:28                                      ; preds = %16, %11
  %29 = load i32* %1
  ret i32 %29
}

; Function Attrs: inlinehint nounwind uwtable
define i32 @_RV_list_remove_fmd(%struct._RV_fmd** %head_ref, void (...)* %func, %struct._RV_fmd*** %prev_ref) #2 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._RV_fmd**, align 8
  %3 = alloca void (...)*, align 8
  %4 = alloca %struct._RV_fmd***, align 8
  %cur = alloca %struct._RV_fmd*, align 8
  store %struct._RV_fmd** %head_ref, %struct._RV_fmd*** %2, align 8
  store void (...)* %func, void (...)** %3, align 8
  store %struct._RV_fmd*** %prev_ref, %struct._RV_fmd**** %4, align 8
  %5 = load %struct._RV_fmd*** %2, align 8
  %6 = load void (...)** %3, align 8
  %7 = load %struct._RV_fmd**** %4, align 8
  %8 = call i32 @_RV_list_find_fmd_ref(%struct._RV_fmd** %5, void (...)* %6, %struct._RV_fmd*** %7)
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %11, label %10

; <label>:10                                      ; preds = %0
  store i32 0, i32* %1
  br label %21

; <label>:11                                      ; preds = %0
  %12 = load %struct._RV_fmd**** %4, align 8
  %13 = load %struct._RV_fmd*** %12, align 8
  %14 = load %struct._RV_fmd** %13, align 8
  store %struct._RV_fmd* %14, %struct._RV_fmd** %cur, align 8
  %15 = load %struct._RV_fmd** %cur, align 8
  %16 = getelementptr inbounds %struct._RV_fmd* %15, i32 0, i32 3
  %17 = load %struct._RV_fmd** %16, align 8
  %18 = load %struct._RV_fmd**** %4, align 8
  %19 = load %struct._RV_fmd*** %18, align 8
  store %struct._RV_fmd* %17, %struct._RV_fmd** %19, align 8
  %20 = load %struct._RV_fmd** %cur, align 8
  call void @_RV_fmd_free(%struct._RV_fmd* %20)
  store i32 1, i32* %1
  br label %21

; <label>:21                                      ; preds = %11, %10
  %22 = load i32* %1
  ret i32 %22
}

; Function Attrs: inlinehint nounwind uwtable
define i64 @_RV_hashtbl_hash(i64 %key, i64 %capacity) #2 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %key, i64* %1, align 8
  store i64 %capacity, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = load i64* %1, align 8
  %5 = lshr i64 %4, 20
  %6 = xor i64 %3, %5
  %7 = load i64* %1, align 8
  %8 = lshr i64 %7, 12
  %9 = xor i64 %6, %8
  store i64 %9, i64* %1, align 8
  %10 = load i64* %1, align 8
  %11 = load i64* %1, align 8
  %12 = lshr i64 %11, 7
  %13 = xor i64 %10, %12
  %14 = load i64* %1, align 8
  %15 = lshr i64 %14, 4
  %16 = xor i64 %13, %15
  store i64 %16, i64* %1, align 8
  %17 = load i64* %1, align 8
  %18 = load i64* %2, align 8
  %19 = sub i64 %18, 1
  %20 = and i64 %17, %19
  ret i64 %20
}

; Function Attrs: nounwind uwtable
define %struct._RV_hashtbl* @_RV_hashtbl_create(i64 %capacity) #0 {
  %1 = alloca %struct._RV_hashtbl*, align 8
  %2 = alloca i64, align 8
  %i = alloca i64, align 8
  %tbl = alloca %struct._RV_hashtbl*, align 8
  store i64 %capacity, i64* %2, align 8
  %3 = call noalias i8* @malloc(i64 32) #7
  %4 = bitcast i8* %3 to %struct._RV_hashtbl*
  store %struct._RV_hashtbl* %4, %struct._RV_hashtbl** %tbl, align 8
  %5 = load %struct._RV_hashtbl** %tbl, align 8
  %6 = icmp eq %struct._RV_hashtbl* null, %5
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store %struct._RV_hashtbl* null, %struct._RV_hashtbl** %1
  br label %45

; <label>:8                                       ; preds = %0
  %9 = load i64* %2, align 8
  %10 = mul i64 %9, 8
  %11 = call noalias i8* @malloc(i64 %10) #7
  %12 = bitcast i8* %11 to i8**
  %13 = load %struct._RV_hashtbl** %tbl, align 8
  %14 = getelementptr inbounds %struct._RV_hashtbl* %13, i32 0, i32 0
  store i8** %12, i8*** %14, align 8
  %15 = load %struct._RV_hashtbl** %tbl, align 8
  %16 = getelementptr inbounds %struct._RV_hashtbl* %15, i32 0, i32 0
  %17 = load i8*** %16, align 8
  %18 = icmp eq i8** null, %17
  br i1 %18, label %19, label %22

; <label>:19                                      ; preds = %8
  %20 = load %struct._RV_hashtbl** %tbl, align 8
  %21 = bitcast %struct._RV_hashtbl* %20 to i8*
  call void @free(i8* %21) #7
  store %struct._RV_hashtbl* null, %struct._RV_hashtbl** %1
  br label %45

; <label>:22                                      ; preds = %8
  store i64 0, i64* %i, align 8
  br label %23

; <label>:23                                      ; preds = %33, %22
  %24 = load i64* %i, align 8
  %25 = load i64* %2, align 8
  %26 = icmp ult i64 %24, %25
  br i1 %26, label %27, label %36

; <label>:27                                      ; preds = %23
  %28 = load i64* %i, align 8
  %29 = load %struct._RV_hashtbl** %tbl, align 8
  %30 = getelementptr inbounds %struct._RV_hashtbl* %29, i32 0, i32 0
  %31 = load i8*** %30, align 8
  %32 = getelementptr inbounds i8** %31, i64 %28
  store i8* null, i8** %32, align 8
  br label %33

; <label>:33                                      ; preds = %27
  %34 = load i64* %i, align 8
  %35 = add i64 %34, 1
  store i64 %35, i64* %i, align 8
  br label %23

; <label>:36                                      ; preds = %23
  %37 = load i64* %2, align 8
  %38 = load %struct._RV_hashtbl** %tbl, align 8
  %39 = getelementptr inbounds %struct._RV_hashtbl* %38, i32 0, i32 1
  store i64 %37, i64* %39, align 8
  %40 = load %struct._RV_hashtbl** %tbl, align 8
  %41 = getelementptr inbounds %struct._RV_hashtbl* %40, i32 0, i32 2
  store i64 0, i64* %41, align 8
  %42 = load %struct._RV_hashtbl** %tbl, align 8
  %43 = getelementptr inbounds %struct._RV_hashtbl* %42, i32 0, i32 3
  store i64 0, i64* %43, align 8
  %44 = load %struct._RV_hashtbl** %tbl, align 8
  store %struct._RV_hashtbl* %44, %struct._RV_hashtbl** %1
  br label %45

; <label>:45                                      ; preds = %36, %19, %7
  %46 = load %struct._RV_hashtbl** %1
  ret %struct._RV_hashtbl* %46
}

; Function Attrs: nounwind uwtable
define void @_RV_hashtbl_free_slots_fmd(%struct._RV_hashtbl* %tbl) #0 {
  %1 = alloca %struct._RV_hashtbl*, align 8
  %i = alloca i64, align 8
  %fmd = alloca %struct._RV_fmd*, align 8
  %fmd1 = alloca %struct._RV_fmd*, align 8
  store %struct._RV_hashtbl* %tbl, %struct._RV_hashtbl** %1, align 8
  %2 = load %struct._RV_hashtbl** %1, align 8
  %3 = icmp eq %struct._RV_hashtbl* %2, null
  br i1 %3, label %9, label %4

; <label>:4                                       ; preds = %0
  %5 = load %struct._RV_hashtbl** %1, align 8
  %6 = getelementptr inbounds %struct._RV_hashtbl* %5, i32 0, i32 0
  %7 = load i8*** %6, align 8
  %8 = icmp eq i8** %7, null
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %4, %0
  br label %51

; <label>:10                                      ; preds = %4
  store i64 0, i64* %i, align 8
  br label %11

; <label>:11                                      ; preds = %35, %10
  %12 = load i64* %i, align 8
  %13 = load %struct._RV_hashtbl** %1, align 8
  %14 = getelementptr inbounds %struct._RV_hashtbl* %13, i32 0, i32 1
  %15 = load i64* %14, align 8
  %16 = icmp ult i64 %12, %15
  br i1 %16, label %17, label %38

; <label>:17                                      ; preds = %11
  %18 = load i64* %i, align 8
  %19 = load %struct._RV_hashtbl** %1, align 8
  %20 = getelementptr inbounds %struct._RV_hashtbl* %19, i32 0, i32 0
  %21 = load i8*** %20, align 8
  %22 = getelementptr inbounds i8** %21, i64 %18
  %23 = load i8** %22, align 8
  %24 = bitcast i8* %23 to %struct._RV_fmd*
  store %struct._RV_fmd* %24, %struct._RV_fmd** %fmd, align 8
  br label %25

; <label>:25                                      ; preds = %28, %17
  %26 = load %struct._RV_fmd** %fmd, align 8
  %27 = icmp ne %struct._RV_fmd* %26, null
  br i1 %27, label %28, label %34

; <label>:28                                      ; preds = %25
  %29 = load %struct._RV_fmd** %fmd, align 8
  %30 = getelementptr inbounds %struct._RV_fmd* %29, i32 0, i32 3
  %31 = load %struct._RV_fmd** %30, align 8
  store %struct._RV_fmd* %31, %struct._RV_fmd** %fmd1, align 8
  %32 = load %struct._RV_fmd** %fmd, align 8
  call void @_RV_fmd_free(%struct._RV_fmd* %32)
  %33 = load %struct._RV_fmd** %fmd1, align 8
  store %struct._RV_fmd* %33, %struct._RV_fmd** %fmd, align 8
  br label %25

; <label>:34                                      ; preds = %25
  br label %35

; <label>:35                                      ; preds = %34
  %36 = load i64* %i, align 8
  %37 = add i64 %36, 1
  store i64 %37, i64* %i, align 8
  br label %11

; <label>:38                                      ; preds = %11
  %39 = load %struct._RV_hashtbl** %1, align 8
  %40 = getelementptr inbounds %struct._RV_hashtbl* %39, i32 0, i32 0
  %41 = load i8*** %40, align 8
  %42 = bitcast i8** %41 to i8*
  call void @free(i8* %42) #7
  %43 = load %struct._RV_hashtbl** %1, align 8
  %44 = getelementptr inbounds %struct._RV_hashtbl* %43, i32 0, i32 0
  store i8** null, i8*** %44, align 8
  %45 = load %struct._RV_hashtbl** %1, align 8
  %46 = getelementptr inbounds %struct._RV_hashtbl* %45, i32 0, i32 1
  store i64 0, i64* %46, align 8
  %47 = load %struct._RV_hashtbl** %1, align 8
  %48 = getelementptr inbounds %struct._RV_hashtbl* %47, i32 0, i32 2
  store i64 0, i64* %48, align 8
  %49 = load %struct._RV_hashtbl** %1, align 8
  %50 = getelementptr inbounds %struct._RV_hashtbl* %49, i32 0, i32 3
  store i64 0, i64* %50, align 8
  br label %51

; <label>:51                                      ; preds = %38, %9
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_hashtbl_free_fmd(%struct._RV_hashtbl* %tbl) #2 {
  %1 = alloca %struct._RV_hashtbl*, align 8
  store %struct._RV_hashtbl* %tbl, %struct._RV_hashtbl** %1, align 8
  %2 = load %struct._RV_hashtbl** %1, align 8
  %3 = icmp eq %struct._RV_hashtbl* %2, null
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %9

; <label>:5                                       ; preds = %0
  %6 = load %struct._RV_hashtbl** %1, align 8
  call void @_RV_hashtbl_free_slots_fmd(%struct._RV_hashtbl* %6)
  %7 = load %struct._RV_hashtbl** %1, align 8
  %8 = bitcast %struct._RV_hashtbl* %7 to i8*
  call void @free(i8* %8) #7
  br label %9

; <label>:9                                       ; preds = %5, %4
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_fmd* @_RV_hashtbl_find_fmd(%struct._RV_hashtbl* %tbl, void (...)* %func) #2 {
  %1 = alloca %struct._RV_fmd*, align 8
  %2 = alloca %struct._RV_hashtbl*, align 8
  %3 = alloca void (...)*, align 8
  %index = alloca i64, align 8
  %prev = alloca %struct._RV_fmd**, align 8
  store %struct._RV_hashtbl* %tbl, %struct._RV_hashtbl** %2, align 8
  store void (...)* %func, void (...)** %3, align 8
  %4 = load %struct._RV_hashtbl** %2, align 8
  %5 = icmp eq %struct._RV_hashtbl* %4, null
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  store %struct._RV_fmd* null, %struct._RV_fmd** %1
  br label %27

; <label>:7                                       ; preds = %0
  %8 = load void (...)** %3, align 8
  %9 = ptrtoint void (...)* %8 to i64
  %10 = load %struct._RV_hashtbl** %2, align 8
  %11 = getelementptr inbounds %struct._RV_hashtbl* %10, i32 0, i32 1
  %12 = load i64* %11, align 8
  %13 = call i64 @_RV_hashtbl_hash(i64 %9, i64 %12)
  store i64 %13, i64* %index, align 8
  %14 = load %struct._RV_hashtbl** %2, align 8
  %15 = getelementptr inbounds %struct._RV_hashtbl* %14, i32 0, i32 0
  %16 = load i8*** %15, align 8
  %17 = load i64* %index, align 8
  %18 = getelementptr inbounds i8** %16, i64 %17
  %19 = bitcast i8** %18 to %struct._RV_fmd**
  %20 = load void (...)** %3, align 8
  %21 = call i32 @_RV_list_find_fmd_ref(%struct._RV_fmd** %19, void (...)* %20, %struct._RV_fmd*** %prev)
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %26

; <label>:23                                      ; preds = %7
  %24 = load %struct._RV_fmd*** %prev, align 8
  %25 = load %struct._RV_fmd** %24, align 8
  store %struct._RV_fmd* %25, %struct._RV_fmd** %1
  br label %27

; <label>:26                                      ; preds = %7
  store %struct._RV_fmd* null, %struct._RV_fmd** %1
  br label %27

; <label>:27                                      ; preds = %26, %23, %6
  %28 = load %struct._RV_fmd** %1
  ret %struct._RV_fmd* %28
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_fmd* @_RV_hashtbl_insert_fmd(%struct._RV_hashtbl* %tbl, %struct._RV_fmd* %fmd) #2 {
  %1 = alloca %struct._RV_fmd*, align 8
  %2 = alloca %struct._RV_hashtbl*, align 8
  %3 = alloca %struct._RV_fmd*, align 8
  %index = alloca i64, align 8
  %prev = alloca %struct._RV_fmd**, align 8
  store %struct._RV_hashtbl* %tbl, %struct._RV_hashtbl** %2, align 8
  store %struct._RV_fmd* %fmd, %struct._RV_fmd** %3, align 8
  %4 = load %struct._RV_hashtbl** %2, align 8
  %5 = icmp eq %struct._RV_hashtbl* %4, null
  br i1 %5, label %9, label %6

; <label>:6                                       ; preds = %0
  %7 = load %struct._RV_fmd** %3, align 8
  %8 = icmp eq %struct._RV_fmd* %7, null
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %6, %0
  store %struct._RV_fmd* null, %struct._RV_fmd** %1
  br label %56

; <label>:10                                      ; preds = %6
  %11 = load %struct._RV_fmd** %3, align 8
  %12 = getelementptr inbounds %struct._RV_fmd* %11, i32 0, i32 2
  %13 = load void (...)** %12, align 8
  %14 = ptrtoint void (...)* %13 to i64
  %15 = load %struct._RV_hashtbl** %2, align 8
  %16 = getelementptr inbounds %struct._RV_hashtbl* %15, i32 0, i32 1
  %17 = load i64* %16, align 8
  %18 = call i64 @_RV_hashtbl_hash(i64 %14, i64 %17)
  store i64 %18, i64* %index, align 8
  %19 = load %struct._RV_hashtbl** %2, align 8
  %20 = getelementptr inbounds %struct._RV_hashtbl* %19, i32 0, i32 0
  %21 = load i8*** %20, align 8
  %22 = load i64* %index, align 8
  %23 = getelementptr inbounds i8** %21, i64 %22
  %24 = bitcast i8** %23 to %struct._RV_fmd**
  %25 = load %struct._RV_fmd** %3, align 8
  %26 = call i32 @_RV_list_insert_fmd(%struct._RV_fmd** %24, %struct._RV_fmd* %25, %struct._RV_fmd*** %prev)
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %54

; <label>:28                                      ; preds = %10
  %29 = load %struct._RV_fmd*** %prev, align 8
  %30 = load %struct._RV_hashtbl** %2, align 8
  %31 = getelementptr inbounds %struct._RV_hashtbl* %30, i32 0, i32 0
  %32 = load i8*** %31, align 8
  %33 = load i64* %index, align 8
  %34 = getelementptr inbounds i8** %32, i64 %33
  %35 = bitcast i8** %34 to %struct._RV_fmd**
  %36 = icmp eq %struct._RV_fmd** %29, %35
  br i1 %36, label %37, label %48

; <label>:37                                      ; preds = %28
  %38 = load %struct._RV_fmd*** %prev, align 8
  %39 = load %struct._RV_fmd** %38, align 8
  %40 = getelementptr inbounds %struct._RV_fmd* %39, i32 0, i32 3
  %41 = load %struct._RV_fmd** %40, align 8
  %42 = icmp eq %struct._RV_fmd* %41, null
  br i1 %42, label %43, label %48

; <label>:43                                      ; preds = %37
  %44 = load %struct._RV_hashtbl** %2, align 8
  %45 = getelementptr inbounds %struct._RV_hashtbl* %44, i32 0, i32 2
  %46 = load i64* %45, align 8
  %47 = add i64 %46, 1
  store i64 %47, i64* %45, align 8
  br label %48

; <label>:48                                      ; preds = %43, %37, %28
  %49 = load %struct._RV_hashtbl** %2, align 8
  %50 = getelementptr inbounds %struct._RV_hashtbl* %49, i32 0, i32 3
  %51 = load i64* %50, align 8
  %52 = add i64 %51, 1
  store i64 %52, i64* %50, align 8
  %53 = load %struct._RV_hashtbl** %2, align 8
  call void @_RV_hashtbl_resize_fmd(%struct._RV_hashtbl* %53)
  br label %54

; <label>:54                                      ; preds = %48, %10
  %55 = load %struct._RV_fmd** %3, align 8
  store %struct._RV_fmd* %55, %struct._RV_fmd** %1
  br label %56

; <label>:56                                      ; preds = %54, %9
  %57 = load %struct._RV_fmd** %1
  ret %struct._RV_fmd* %57
}

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_hashtbl_resize_fmd(%struct._RV_hashtbl* %tbl) #2 {
  %1 = alloca %struct._RV_hashtbl*, align 8
  %new_tbl = alloca %struct._RV_hashtbl*, align 8
  store %struct._RV_hashtbl* %tbl, %struct._RV_hashtbl** %1, align 8
  %2 = load %struct._RV_hashtbl** %1, align 8
  %3 = icmp eq %struct._RV_hashtbl* %2, null
  br i1 %3, label %13, label %4

; <label>:4                                       ; preds = %0
  %5 = load %struct._RV_hashtbl** %1, align 8
  %6 = getelementptr inbounds %struct._RV_hashtbl* %5, i32 0, i32 3
  %7 = load i64* %6, align 8
  %8 = load %struct._RV_hashtbl** %1, align 8
  %9 = getelementptr inbounds %struct._RV_hashtbl* %8, i32 0, i32 2
  %10 = load i64* %9, align 8
  %11 = mul i64 3, %10
  %12 = icmp ule i64 %7, %11
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %4, %0
  br label %49

; <label>:14                                      ; preds = %4
  %15 = load %struct._RV_hashtbl** %1, align 8
  %16 = getelementptr inbounds %struct._RV_hashtbl* %15, i32 0, i32 1
  %17 = load i64* %16, align 8
  %18 = mul i64 2, %17
  %19 = call %struct._RV_hashtbl* @_RV_hashtbl_create(i64 %18)
  store %struct._RV_hashtbl* %19, %struct._RV_hashtbl** %new_tbl, align 8
  %20 = load %struct._RV_hashtbl** %1, align 8
  %21 = load %struct._RV_hashtbl** %new_tbl, align 8
  %22 = call %struct._RV_hashtbl* @_RV_hashtbl_transfer_fmds(%struct._RV_hashtbl* %20, %struct._RV_hashtbl* %21)
  store %struct._RV_hashtbl* %22, %struct._RV_hashtbl** %new_tbl, align 8
  %23 = load %struct._RV_hashtbl** %1, align 8
  %24 = getelementptr inbounds %struct._RV_hashtbl* %23, i32 0, i32 0
  %25 = load i8*** %24, align 8
  %26 = bitcast i8** %25 to i8*
  call void @free(i8* %26) #7
  %27 = load %struct._RV_hashtbl** %new_tbl, align 8
  %28 = getelementptr inbounds %struct._RV_hashtbl* %27, i32 0, i32 0
  %29 = load i8*** %28, align 8
  %30 = load %struct._RV_hashtbl** %1, align 8
  %31 = getelementptr inbounds %struct._RV_hashtbl* %30, i32 0, i32 0
  store i8** %29, i8*** %31, align 8
  %32 = load %struct._RV_hashtbl** %new_tbl, align 8
  %33 = getelementptr inbounds %struct._RV_hashtbl* %32, i32 0, i32 1
  %34 = load i64* %33, align 8
  %35 = load %struct._RV_hashtbl** %1, align 8
  %36 = getelementptr inbounds %struct._RV_hashtbl* %35, i32 0, i32 1
  store i64 %34, i64* %36, align 8
  %37 = load %struct._RV_hashtbl** %new_tbl, align 8
  %38 = getelementptr inbounds %struct._RV_hashtbl* %37, i32 0, i32 2
  %39 = load i64* %38, align 8
  %40 = load %struct._RV_hashtbl** %1, align 8
  %41 = getelementptr inbounds %struct._RV_hashtbl* %40, i32 0, i32 2
  store i64 %39, i64* %41, align 8
  %42 = load %struct._RV_hashtbl** %new_tbl, align 8
  %43 = getelementptr inbounds %struct._RV_hashtbl* %42, i32 0, i32 3
  %44 = load i64* %43, align 8
  %45 = load %struct._RV_hashtbl** %1, align 8
  %46 = getelementptr inbounds %struct._RV_hashtbl* %45, i32 0, i32 3
  store i64 %44, i64* %46, align 8
  %47 = load %struct._RV_hashtbl** %new_tbl, align 8
  %48 = bitcast %struct._RV_hashtbl* %47 to i8*
  call void @free(i8* %48) #7
  br label %49

; <label>:49                                      ; preds = %14, %13
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_fmd* @_RV_hashtbl_insert_fmd_func(%struct._RV_hashtbl* %tbl, void (...)* %func, i8 zeroext %capacity) #2 {
  %1 = alloca %struct._RV_fmd*, align 8
  %2 = alloca %struct._RV_hashtbl*, align 8
  %3 = alloca void (...)*, align 8
  %4 = alloca i8, align 1
  %index = alloca i64, align 8
  %prev = alloca %struct._RV_fmd**, align 8
  %cur = alloca %struct._RV_fmd*, align 8
  store %struct._RV_hashtbl* %tbl, %struct._RV_hashtbl** %2, align 8
  store void (...)* %func, void (...)** %3, align 8
  store i8 %capacity, i8* %4, align 1
  %5 = load %struct._RV_hashtbl** %2, align 8
  %6 = icmp eq %struct._RV_hashtbl* %5, null
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store %struct._RV_fmd* null, %struct._RV_fmd** %1
  br label %59

; <label>:8                                       ; preds = %0
  %9 = load void (...)** %3, align 8
  %10 = ptrtoint void (...)* %9 to i64
  %11 = load %struct._RV_hashtbl** %2, align 8
  %12 = getelementptr inbounds %struct._RV_hashtbl* %11, i32 0, i32 1
  %13 = load i64* %12, align 8
  %14 = call i64 @_RV_hashtbl_hash(i64 %10, i64 %13)
  store i64 %14, i64* %index, align 8
  %15 = load %struct._RV_hashtbl** %2, align 8
  %16 = getelementptr inbounds %struct._RV_hashtbl* %15, i32 0, i32 0
  %17 = load i8*** %16, align 8
  %18 = load i64* %index, align 8
  %19 = getelementptr inbounds i8** %17, i64 %18
  %20 = bitcast i8** %19 to %struct._RV_fmd**
  %21 = load void (...)** %3, align 8
  %22 = load i8* %4, align 1
  %23 = call i32 @_RV_list_insert_fmd_func(%struct._RV_fmd** %20, void (...)* %21, i8 zeroext %22, %struct._RV_fmd*** %prev)
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %31, label %25

; <label>:25                                      ; preds = %8
  %26 = load %struct._RV_fmd*** %prev, align 8
  %27 = load %struct._RV_fmd** %26, align 8
  %28 = load i8* %4, align 1
  call void @_RV_fmd_resize_pmds(%struct._RV_fmd* %27, i8 zeroext %28, i8 zeroext 0)
  %29 = load %struct._RV_fmd*** %prev, align 8
  %30 = load %struct._RV_fmd** %29, align 8
  store %struct._RV_fmd* %30, %struct._RV_fmd** %1
  br label %59

; <label>:31                                      ; preds = %8
  %32 = load %struct._RV_fmd*** %prev, align 8
  %33 = load %struct._RV_fmd** %32, align 8
  store %struct._RV_fmd* %33, %struct._RV_fmd** %cur, align 8
  %34 = load %struct._RV_fmd*** %prev, align 8
  %35 = load %struct._RV_hashtbl** %2, align 8
  %36 = getelementptr inbounds %struct._RV_hashtbl* %35, i32 0, i32 0
  %37 = load i8*** %36, align 8
  %38 = load i64* %index, align 8
  %39 = getelementptr inbounds i8** %37, i64 %38
  %40 = bitcast i8** %39 to %struct._RV_fmd**
  %41 = icmp eq %struct._RV_fmd** %34, %40
  br i1 %41, label %42, label %52

; <label>:42                                      ; preds = %31
  %43 = load %struct._RV_fmd** %cur, align 8
  %44 = getelementptr inbounds %struct._RV_fmd* %43, i32 0, i32 3
  %45 = load %struct._RV_fmd** %44, align 8
  %46 = icmp eq %struct._RV_fmd* %45, null
  br i1 %46, label %47, label %52

; <label>:47                                      ; preds = %42
  %48 = load %struct._RV_hashtbl** %2, align 8
  %49 = getelementptr inbounds %struct._RV_hashtbl* %48, i32 0, i32 2
  %50 = load i64* %49, align 8
  %51 = add i64 %50, 1
  store i64 %51, i64* %49, align 8
  br label %52

; <label>:52                                      ; preds = %47, %42, %31
  %53 = load %struct._RV_hashtbl** %2, align 8
  %54 = getelementptr inbounds %struct._RV_hashtbl* %53, i32 0, i32 3
  %55 = load i64* %54, align 8
  %56 = add i64 %55, 1
  store i64 %56, i64* %54, align 8
  %57 = load %struct._RV_hashtbl** %2, align 8
  call void @_RV_hashtbl_resize_fmd(%struct._RV_hashtbl* %57)
  %58 = load %struct._RV_fmd** %cur, align 8
  store %struct._RV_fmd* %58, %struct._RV_fmd** %1
  br label %59

; <label>:59                                      ; preds = %52, %25, %7
  %60 = load %struct._RV_fmd** %1
  ret %struct._RV_fmd* %60
}

; Function Attrs: inlinehint nounwind uwtable
define i32 @_RV_hashtbl_remove_fmd(%struct._RV_hashtbl* %tbl, void (...)* %func) #2 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._RV_hashtbl*, align 8
  %3 = alloca void (...)*, align 8
  %index = alloca i64, align 8
  %prev = alloca %struct._RV_fmd**, align 8
  store %struct._RV_hashtbl* %tbl, %struct._RV_hashtbl** %2, align 8
  store void (...)* %func, void (...)** %3, align 8
  %4 = load %struct._RV_hashtbl** %2, align 8
  %5 = icmp eq %struct._RV_hashtbl* %4, null
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  store i32 0, i32* %1
  br label %47

; <label>:7                                       ; preds = %0
  %8 = load void (...)** %3, align 8
  %9 = ptrtoint void (...)* %8 to i64
  %10 = load %struct._RV_hashtbl** %2, align 8
  %11 = getelementptr inbounds %struct._RV_hashtbl* %10, i32 0, i32 1
  %12 = load i64* %11, align 8
  %13 = call i64 @_RV_hashtbl_hash(i64 %9, i64 %12)
  store i64 %13, i64* %index, align 8
  %14 = load %struct._RV_hashtbl** %2, align 8
  %15 = getelementptr inbounds %struct._RV_hashtbl* %14, i32 0, i32 0
  %16 = load i8*** %15, align 8
  %17 = load i64* %index, align 8
  %18 = getelementptr inbounds i8** %16, i64 %17
  %19 = bitcast i8** %18 to %struct._RV_fmd**
  %20 = load void (...)** %3, align 8
  %21 = call i32 @_RV_list_remove_fmd(%struct._RV_fmd** %19, void (...)* %20, %struct._RV_fmd*** %prev)
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %24, label %23

; <label>:23                                      ; preds = %7
  store i32 0, i32* %1
  br label %47

; <label>:24                                      ; preds = %7
  %25 = load %struct._RV_fmd*** %prev, align 8
  %26 = load %struct._RV_hashtbl** %2, align 8
  %27 = getelementptr inbounds %struct._RV_hashtbl* %26, i32 0, i32 0
  %28 = load i8*** %27, align 8
  %29 = load i64* %index, align 8
  %30 = getelementptr inbounds i8** %28, i64 %29
  %31 = bitcast i8** %30 to %struct._RV_fmd**
  %32 = icmp eq %struct._RV_fmd** %25, %31
  br i1 %32, label %33, label %42

; <label>:33                                      ; preds = %24
  %34 = load %struct._RV_fmd*** %prev, align 8
  %35 = load %struct._RV_fmd** %34, align 8
  %36 = icmp eq %struct._RV_fmd* %35, null
  br i1 %36, label %37, label %42

; <label>:37                                      ; preds = %33
  %38 = load %struct._RV_hashtbl** %2, align 8
  %39 = getelementptr inbounds %struct._RV_hashtbl* %38, i32 0, i32 2
  %40 = load i64* %39, align 8
  %41 = add i64 %40, -1
  store i64 %41, i64* %39, align 8
  br label %42

; <label>:42                                      ; preds = %37, %33, %24
  %43 = load %struct._RV_hashtbl** %2, align 8
  %44 = getelementptr inbounds %struct._RV_hashtbl* %43, i32 0, i32 3
  %45 = load i64* %44, align 8
  %46 = add i64 %45, -1
  store i64 %46, i64* %44, align 8
  store i32 1, i32* %1
  br label %47

; <label>:47                                      ; preds = %42, %23, %6
  %48 = load i32* %1
  ret i32 %48
}

; Function Attrs: nounwind uwtable
define %struct._RV_hashtbl* @_RV_hashtbl_transfer_fmds(%struct._RV_hashtbl* %old_tbl, %struct._RV_hashtbl* %new_tbl) #0 {
  %1 = alloca %struct._RV_hashtbl*, align 8
  %2 = alloca %struct._RV_hashtbl*, align 8
  %3 = alloca %struct._RV_hashtbl*, align 8
  %i = alloca i64, align 8
  %fmd = alloca %struct._RV_fmd*, align 8
  %fmd1 = alloca %struct._RV_fmd*, align 8
  store %struct._RV_hashtbl* %old_tbl, %struct._RV_hashtbl** %2, align 8
  store %struct._RV_hashtbl* %new_tbl, %struct._RV_hashtbl** %3, align 8
  %4 = load %struct._RV_hashtbl** %3, align 8
  %5 = icmp eq %struct._RV_hashtbl* null, %4
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %0
  %7 = load %struct._RV_hashtbl** %2, align 8
  store %struct._RV_hashtbl* %7, %struct._RV_hashtbl** %1
  br label %56

; <label>:8                                       ; preds = %0
  %9 = load %struct._RV_hashtbl** %2, align 8
  %10 = icmp eq %struct._RV_hashtbl* null, %9
  br i1 %10, label %11, label %13

; <label>:11                                      ; preds = %8
  %12 = load %struct._RV_hashtbl** %3, align 8
  store %struct._RV_hashtbl* %12, %struct._RV_hashtbl** %1
  br label %56

; <label>:13                                      ; preds = %8
  store i64 0, i64* %i, align 8
  br label %14

; <label>:14                                      ; preds = %47, %13
  %15 = load i64* %i, align 8
  %16 = load %struct._RV_hashtbl** %2, align 8
  %17 = getelementptr inbounds %struct._RV_hashtbl* %16, i32 0, i32 1
  %18 = load i64* %17, align 8
  %19 = icmp ult i64 %15, %18
  br i1 %19, label %20, label %50

; <label>:20                                      ; preds = %14
  %21 = load i64* %i, align 8
  %22 = load %struct._RV_hashtbl** %2, align 8
  %23 = getelementptr inbounds %struct._RV_hashtbl* %22, i32 0, i32 0
  %24 = load i8*** %23, align 8
  %25 = getelementptr inbounds i8** %24, i64 %21
  %26 = load i8** %25, align 8
  %27 = bitcast i8* %26 to %struct._RV_fmd*
  store %struct._RV_fmd* %27, %struct._RV_fmd** %fmd, align 8
  %28 = load i64* %i, align 8
  %29 = load %struct._RV_hashtbl** %2, align 8
  %30 = getelementptr inbounds %struct._RV_hashtbl* %29, i32 0, i32 0
  %31 = load i8*** %30, align 8
  %32 = getelementptr inbounds i8** %31, i64 %28
  store i8* null, i8** %32, align 8
  br label %33

; <label>:33                                      ; preds = %36, %20
  %34 = load %struct._RV_fmd** %fmd, align 8
  %35 = icmp ne %struct._RV_fmd* %34, null
  br i1 %35, label %36, label %46

; <label>:36                                      ; preds = %33
  %37 = load %struct._RV_fmd** %fmd, align 8
  %38 = getelementptr inbounds %struct._RV_fmd* %37, i32 0, i32 3
  %39 = load %struct._RV_fmd** %38, align 8
  store %struct._RV_fmd* %39, %struct._RV_fmd** %fmd1, align 8
  %40 = load %struct._RV_fmd** %fmd, align 8
  %41 = getelementptr inbounds %struct._RV_fmd* %40, i32 0, i32 3
  store %struct._RV_fmd* null, %struct._RV_fmd** %41, align 8
  %42 = load %struct._RV_hashtbl** %3, align 8
  %43 = load %struct._RV_fmd** %fmd, align 8
  %44 = call %struct._RV_fmd* @_RV_hashtbl_insert_fmd(%struct._RV_hashtbl* %42, %struct._RV_fmd* %43)
  %45 = load %struct._RV_fmd** %fmd1, align 8
  store %struct._RV_fmd* %45, %struct._RV_fmd** %fmd, align 8
  br label %33

; <label>:46                                      ; preds = %33
  br label %47

; <label>:47                                      ; preds = %46
  %48 = load i64* %i, align 8
  %49 = add i64 %48, 1
  store i64 %49, i64* %i, align 8
  br label %14

; <label>:50                                      ; preds = %14
  %51 = load %struct._RV_hashtbl** %2, align 8
  %52 = getelementptr inbounds %struct._RV_hashtbl* %51, i32 0, i32 2
  store i64 0, i64* %52, align 8
  %53 = load %struct._RV_hashtbl** %2, align 8
  %54 = getelementptr inbounds %struct._RV_hashtbl* %53, i32 0, i32 3
  store i64 0, i64* %54, align 8
  %55 = load %struct._RV_hashtbl** %3, align 8
  store %struct._RV_hashtbl* %55, %struct._RV_hashtbl** %1
  br label %56

; <label>:56                                      ; preds = %50, %11, %6
  %57 = load %struct._RV_hashtbl** %1
  ret %struct._RV_hashtbl* %57
}

; Function Attrs: nounwind uwtable
define %struct._RV_hashtbl** @_RV_hashtbl_get_hashtbl_ref_fmd() #0 {
  %1 = load %struct._RV_hashtbl** @_RV_hashtbl_get_hashtbl_ref_fmd.tbl, align 8
  %2 = icmp eq %struct._RV_hashtbl* null, %1
  br i1 %2, label %3, label %5

; <label>:3                                       ; preds = %0
  %4 = call %struct._RV_hashtbl* @_RV_hashtbl_create(i64 1024)
  store %struct._RV_hashtbl* %4, %struct._RV_hashtbl** @_RV_hashtbl_get_hashtbl_ref_fmd.tbl, align 8
  br label %5

; <label>:5                                       ; preds = %3, %0
  ret %struct._RV_hashtbl** @_RV_hashtbl_get_hashtbl_ref_fmd.tbl
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_hashtbl* @_RV_hashtbl_get_hashtbl_fmd() #2 {
  %1 = call %struct._RV_hashtbl** @_RV_hashtbl_get_hashtbl_ref_fmd()
  %2 = load %struct._RV_hashtbl** %1, align 8
  ret %struct._RV_hashtbl* %2
}

; Function Attrs: nounwind uwtable
define i32 @_RV_sstrlen(i8* %str) #0 {
  %1 = alloca i8*, align 8
  %length = alloca i32, align 4
  store i8* %str, i8** %1, align 8
  store i32 0, i32* %length, align 4
  br label %2

; <label>:2                                       ; preds = %12, %0
  %3 = load i8** %1, align 8
  %4 = icmp ne i8* %3, null
  br i1 %4, label %5, label %10

; <label>:5                                       ; preds = %2
  %6 = load i8** %1, align 8
  %7 = load i8* %6, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp ne i32 %8, 0
  br label %10

; <label>:10                                      ; preds = %5, %2
  %11 = phi i1 [ false, %2 ], [ %9, %5 ]
  br i1 %11, label %12, label %17

; <label>:12                                      ; preds = %10
  %13 = load i32* %length, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %length, align 4
  %15 = load i8** %1, align 8
  %16 = getelementptr inbounds i8* %15, i32 1
  store i8* %16, i8** %1, align 8
  br label %2

; <label>:17                                      ; preds = %10
  %18 = load i32* %length, align 4
  ret i32 %18
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_pmd* @_RV_pmd_tbl_create(i8** %ptra) #2 {
  %1 = alloca i8**, align 8
  %tbl = alloca %struct._RV_pmd**, align 8
  store i8** %ptra, i8*** %1, align 8
  %2 = call %struct._RV_pmd** @_RV_trie_get_trie_pmd()
  store %struct._RV_pmd** %2, %struct._RV_pmd*** %tbl, align 8
  %3 = load %struct._RV_pmd*** %tbl, align 8
  %4 = load i8*** %1, align 8
  %5 = call %struct._RV_pmd* @_RV_trie_insert_pmd_ptr(%struct._RV_pmd** %3, i8** %4)
  ret %struct._RV_pmd* %5
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_pmd* @_RV_pmd_tbl_lookup(i8** %ptra) #2 {
  %1 = alloca i8**, align 8
  %tbl = alloca %struct._RV_pmd**, align 8
  store i8** %ptra, i8*** %1, align 8
  %2 = call %struct._RV_pmd** @_RV_trie_get_trie_pmd()
  store %struct._RV_pmd** %2, %struct._RV_pmd*** %tbl, align 8
  %3 = load %struct._RV_pmd*** %tbl, align 8
  %4 = load i8*** %1, align 8
  %5 = call %struct._RV_pmd* @_RV_trie_find_pmd(%struct._RV_pmd** %3, i8** %4)
  ret %struct._RV_pmd* %5
}

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_pmd_tbl_print(i8** %ptra, i8* %ptr_name) #2 {
  %1 = alloca i8**, align 8
  %2 = alloca i8*, align 8
  %pmd = alloca %struct._RV_pmd*, align 8
  store i8** %ptra, i8*** %1, align 8
  store i8* %ptr_name, i8** %2, align 8
  %3 = load i8*** %1, align 8
  %4 = call %struct._RV_pmd* @_RV_pmd_tbl_lookup(i8** %3)
  store %struct._RV_pmd* %4, %struct._RV_pmd** %pmd, align 8
  %5 = load %struct._RV_pmd** %pmd, align 8
  %6 = icmp ne %struct._RV_pmd* %5, null
  br i1 %6, label %12, label %7

; <label>:7                                       ; preds = %0
  %8 = load i8** %2, align 8
  %9 = load i8*** %1, align 8
  %10 = bitcast i8** %9 to i8*
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([43 x i8]* @.str11, i32 0, i32 0), i8* %8, i8* %10)
  br label %42

; <label>:12                                      ; preds = %0
  %13 = load i8** %2, align 8
  %14 = load i8*** %1, align 8
  %15 = bitcast i8** %14 to i8*
  %16 = load %struct._RV_pmd** %pmd, align 8
  %17 = getelementptr inbounds %struct._RV_pmd* %16, i32 0, i32 0
  %18 = load i8** %17, align 8
  %19 = load %struct._RV_pmd** %pmd, align 8
  %20 = getelementptr inbounds %struct._RV_pmd* %19, i32 0, i32 1
  %21 = load i8** %20, align 8
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([49 x i8]* @.str12, i32 0, i32 0), i8* %13, i8* %15, i8* %18, i8* %21)
  %23 = load %struct._RV_pmd** %pmd, align 8
  %24 = getelementptr inbounds %struct._RV_pmd* %23, i32 0, i32 2
  %25 = load %struct._RV_stat_node** %24, align 8
  %26 = icmp ne %struct._RV_stat_node* %25, null
  br i1 %26, label %29, label %27

; <label>:27                                      ; preds = %12
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str4, i32 0, i32 0))
  br label %41

; <label>:29                                      ; preds = %12
  %30 = load %struct._RV_pmd** %pmd, align 8
  %31 = getelementptr inbounds %struct._RV_pmd* %30, i32 0, i32 2
  %32 = load %struct._RV_stat_node** %31, align 8
  %33 = getelementptr inbounds %struct._RV_stat_node* %32, i32 0, i32 0
  %34 = load i32* %33, align 4
  %35 = load %struct._RV_pmd** %pmd, align 8
  %36 = getelementptr inbounds %struct._RV_pmd* %35, i32 0, i32 2
  %37 = load %struct._RV_stat_node** %36, align 8
  %38 = getelementptr inbounds %struct._RV_stat_node* %37, i32 0, i32 1
  %39 = load i64* %38, align 8
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str5, i32 0, i32 0), i32 %34, i64 %39)
  br label %41

; <label>:41                                      ; preds = %29, %27
  br label %42

; <label>:42                                      ; preds = %41, %7
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %ptra, %struct._RV_stat_node* %snda, i8* %base, i8* %bound) #2 {
  %1 = alloca i8**, align 8
  %2 = alloca %struct._RV_stat_node*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %tbl = alloca %struct._RV_pmd**, align 8
  %pmd = alloca %struct._RV_pmd*, align 8
  store i8** %ptra, i8*** %1, align 8
  store %struct._RV_stat_node* %snda, %struct._RV_stat_node** %2, align 8
  store i8* %base, i8** %3, align 8
  store i8* %bound, i8** %4, align 8
  %5 = call %struct._RV_pmd** @_RV_trie_get_trie_pmd()
  store %struct._RV_pmd** %5, %struct._RV_pmd*** %tbl, align 8
  %6 = load %struct._RV_pmd*** %tbl, align 8
  %7 = load i8*** %1, align 8
  %8 = call %struct._RV_pmd* @_RV_trie_insert_pmd_ptr(%struct._RV_pmd** %6, i8** %7)
  store %struct._RV_pmd* %8, %struct._RV_pmd** %pmd, align 8
  %9 = load %struct._RV_pmd** %pmd, align 8
  %10 = load %struct._RV_stat_node** %2, align 8
  call void @_RV_pmd_c_snda(%struct._RV_pmd* %9, %struct._RV_stat_node* %10)
  %11 = load i8** %3, align 8
  %12 = load %struct._RV_pmd** %pmd, align 8
  %13 = getelementptr inbounds %struct._RV_pmd* %12, i32 0, i32 0
  store i8* %11, i8** %13, align 8
  %14 = load i8** %4, align 8
  %15 = load %struct._RV_pmd** %pmd, align 8
  %16 = getelementptr inbounds %struct._RV_pmd* %15, i32 0, i32 1
  store i8* %14, i8** %16, align 8
  %17 = load %struct._RV_pmd** %pmd, align 8
  ret %struct._RV_pmd* %17
}

; Function Attrs: inlinehint nounwind uwtable
define i8* @_RV_pmd_tbl_update_sa_ret(i8** %ptra, %struct._RV_stat_node* %snda, i8* %base, i8* %bound, i8* %ret) #2 {
  %1 = alloca i8**, align 8
  %2 = alloca %struct._RV_stat_node*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  store i8** %ptra, i8*** %1, align 8
  store %struct._RV_stat_node* %snda, %struct._RV_stat_node** %2, align 8
  store i8* %base, i8** %3, align 8
  store i8* %bound, i8** %4, align 8
  store i8* %ret, i8** %5, align 8
  %6 = load i8*** %1, align 8
  %7 = load %struct._RV_stat_node** %2, align 8
  %8 = load i8** %3, align 8
  %9 = load i8** %4, align 8
  %10 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %6, %struct._RV_stat_node* %7, i8* %8, i8* %9)
  %11 = load i8** %5, align 8
  ret i8* %11
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_pmd* @_RV_pmd_tbl_update_ns(i8** %ptra, i32 %stat, i8* %base, i8* %bound) #2 {
  %1 = alloca i8**, align 8
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %snda = alloca %struct._RV_stat_node*, align 8
  store i8** %ptra, i8*** %1, align 8
  store i32 %stat, i32* %2, align 4
  store i8* %base, i8** %3, align 8
  store i8* %bound, i8** %4, align 8
  %5 = load i32* %2, align 4
  %6 = call %struct._RV_stat_node* @_RV_stat_node_create(i32 %5, i64 0)
  store %struct._RV_stat_node* %6, %struct._RV_stat_node** %snda, align 8
  %7 = load i8*** %1, align 8
  %8 = load %struct._RV_stat_node** %snda, align 8
  %9 = load i8** %3, align 8
  %10 = load i8** %4, align 8
  %11 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %7, %struct._RV_stat_node* %8, i8* %9, i8* %10)
  ret %struct._RV_pmd* %11
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_pmd* @_RV_pmd_tbl_update_pmd(i8** %ptra, %struct._RV_pmd* %pmd) #2 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i8**, align 8
  %3 = alloca %struct._RV_pmd*, align 8
  store i8** %ptra, i8*** %2, align 8
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %3, align 8
  %4 = load %struct._RV_pmd** %3, align 8
  %5 = icmp eq %struct._RV_pmd* %4, null
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i8*** %2, align 8
  %8 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %7, %struct._RV_stat_node* null, i8* null, i8* null)
  store %struct._RV_pmd* %8, %struct._RV_pmd** %1
  br label %21

; <label>:9                                       ; preds = %0
  %10 = load i8*** %2, align 8
  %11 = load %struct._RV_pmd** %3, align 8
  %12 = getelementptr inbounds %struct._RV_pmd* %11, i32 0, i32 2
  %13 = load %struct._RV_stat_node** %12, align 8
  %14 = load %struct._RV_pmd** %3, align 8
  %15 = getelementptr inbounds %struct._RV_pmd* %14, i32 0, i32 0
  %16 = load i8** %15, align 8
  %17 = load %struct._RV_pmd** %3, align 8
  %18 = getelementptr inbounds %struct._RV_pmd* %17, i32 0, i32 1
  %19 = load i8** %18, align 8
  %20 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %10, %struct._RV_stat_node* %13, i8* %16, i8* %19)
  store %struct._RV_pmd* %20, %struct._RV_pmd** %1
  br label %21

; <label>:21                                      ; preds = %9, %6
  %22 = load %struct._RV_pmd** %1
  ret %struct._RV_pmd* %22
}

; Function Attrs: inlinehint nounwind uwtable
define i8* @_RV_pmd_tbl_update_pmd_ret(i8** %ptra, %struct._RV_pmd* %pmd, i8* %ret) #2 {
  %1 = alloca i8**, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  store i8** %ptra, i8*** %1, align 8
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %2, align 8
  store i8* %ret, i8** %3, align 8
  %4 = load i8*** %1, align 8
  %5 = load %struct._RV_pmd** %2, align 8
  %6 = call %struct._RV_pmd* @_RV_pmd_tbl_update_pmd(i8** %4, %struct._RV_pmd* %5)
  %7 = load i8** %3, align 8
  ret i8* %7
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_pmd* @_RV_pmd_tbl_update_fpmd(i8** %ptra, %struct._RV_fmd_pmd* %fpmd) #2 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i8**, align 8
  %3 = alloca %struct._RV_fmd_pmd*, align 8
  store i8** %ptra, i8*** %2, align 8
  store %struct._RV_fmd_pmd* %fpmd, %struct._RV_fmd_pmd** %3, align 8
  %4 = load %struct._RV_fmd_pmd** %3, align 8
  %5 = icmp eq %struct._RV_fmd_pmd* %4, null
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i8*** %2, align 8
  %8 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %7, %struct._RV_stat_node* null, i8* null, i8* null)
  store %struct._RV_pmd* %8, %struct._RV_pmd** %1
  br label %21

; <label>:9                                       ; preds = %0
  %10 = load i8*** %2, align 8
  %11 = load %struct._RV_fmd_pmd** %3, align 8
  %12 = getelementptr inbounds %struct._RV_fmd_pmd* %11, i32 0, i32 2
  %13 = load %struct._RV_stat_node** %12, align 8
  %14 = load %struct._RV_fmd_pmd** %3, align 8
  %15 = getelementptr inbounds %struct._RV_fmd_pmd* %14, i32 0, i32 0
  %16 = load i8** %15, align 8
  %17 = load %struct._RV_fmd_pmd** %3, align 8
  %18 = getelementptr inbounds %struct._RV_fmd_pmd* %17, i32 0, i32 1
  %19 = load i8** %18, align 8
  %20 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %10, %struct._RV_stat_node* %13, i8* %16, i8* %19)
  store %struct._RV_pmd* %20, %struct._RV_pmd** %1
  br label %21

; <label>:21                                      ; preds = %9, %6
  %22 = load %struct._RV_pmd** %1
  ret %struct._RV_pmd* %22
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_pmd* @_RV_pmd_tbl_update_ptr(i8** %ptra, i8** %ptra1) #2 {
  %1 = alloca i8**, align 8
  %2 = alloca i8**, align 8
  %pmd1 = alloca %struct._RV_pmd*, align 8
  store i8** %ptra, i8*** %1, align 8
  store i8** %ptra1, i8*** %2, align 8
  %3 = load i8*** %2, align 8
  %4 = call %struct._RV_pmd* @_RV_pmd_tbl_lookup(i8** %3)
  store %struct._RV_pmd* %4, %struct._RV_pmd** %pmd1, align 8
  %5 = load i8*** %1, align 8
  %6 = load %struct._RV_pmd** %pmd1, align 8
  %7 = call %struct._RV_pmd* @_RV_pmd_tbl_update_pmd(i8** %5, %struct._RV_pmd* %6)
  ret %struct._RV_pmd* %7
}

; Function Attrs: inlinehint nounwind uwtable
define i8* @_RV_pmd_tbl_update_ptr_ret(i8** %ptra, i8** %ptra1, i8* %ret) #2 {
  %1 = alloca i8**, align 8
  %2 = alloca i8**, align 8
  %3 = alloca i8*, align 8
  store i8** %ptra, i8*** %1, align 8
  store i8** %ptra1, i8*** %2, align 8
  store i8* %ret, i8** %3, align 8
  %4 = load i8*** %1, align 8
  %5 = load i8*** %2, align 8
  %6 = call %struct._RV_pmd* @_RV_pmd_tbl_update_ptr(i8** %4, i8** %5)
  %7 = load i8** %3, align 8
  ret i8* %7
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_pmd* @_RV_pmd_tbl_update_null(i8** %ptra) #2 {
  %1 = alloca i8**, align 8
  %tbl = alloca %struct._RV_pmd**, align 8
  %pmd = alloca %struct._RV_pmd*, align 8
  store i8** %ptra, i8*** %1, align 8
  %2 = call %struct._RV_pmd** @_RV_trie_get_trie_pmd()
  store %struct._RV_pmd** %2, %struct._RV_pmd*** %tbl, align 8
  %3 = load %struct._RV_pmd*** %tbl, align 8
  %4 = load i8*** %1, align 8
  %5 = call %struct._RV_pmd* @_RV_trie_insert_pmd_ptr(%struct._RV_pmd** %3, i8** %4)
  store %struct._RV_pmd* %5, %struct._RV_pmd** %pmd, align 8
  %6 = load %struct._RV_pmd** %pmd, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %6)
  %7 = load %struct._RV_pmd** %pmd, align 8
  ret %struct._RV_pmd* %7
}

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_pmd_tbl_remove(i8** %ptra) #2 {
  %1 = alloca i8**, align 8
  %tbl = alloca %struct._RV_pmd**, align 8
  store i8** %ptra, i8*** %1, align 8
  %2 = call %struct._RV_pmd** @_RV_trie_get_trie_pmd()
  store %struct._RV_pmd** %2, %struct._RV_pmd*** %tbl, align 8
  %3 = load %struct._RV_pmd*** %tbl, align 8
  %4 = load i8*** %1, align 8
  %5 = call i32 @_RV_trie_remove_pmd(%struct._RV_pmd** %3, i8** %4)
  ret void
}

; Function Attrs: nounwind uwtable
define void @_RV_pmd_tbl_remove_pa(i8** %array, i64 %size) #0 {
  %1 = alloca i8**, align 8
  %2 = alloca i64, align 8
  %i = alloca i64, align 8
  %tbl = alloca %struct._RV_pmd**, align 8
  store i8** %array, i8*** %1, align 8
  store i64 %size, i64* %2, align 8
  %3 = call %struct._RV_pmd** @_RV_trie_get_trie_pmd()
  store %struct._RV_pmd** %3, %struct._RV_pmd*** %tbl, align 8
  store i64 0, i64* %i, align 8
  br label %4

; <label>:4                                       ; preds = %14, %0
  %5 = load i64* %i, align 8
  %6 = load i64* %2, align 8
  %7 = icmp ult i64 %5, %6
  br i1 %7, label %8, label %17

; <label>:8                                       ; preds = %4
  %9 = load %struct._RV_pmd*** %tbl, align 8
  %10 = load i8*** %1, align 8
  %11 = load i64* %i, align 8
  %12 = getelementptr inbounds i8** %10, i64 %11
  %13 = call i32 @_RV_trie_remove_pmd(%struct._RV_pmd** %9, i8** %12)
  br label %14

; <label>:14                                      ; preds = %8
  %15 = load i64* %i, align 8
  %16 = add i64 %15, 1
  store i64 %16, i64* %i, align 8
  br label %4

; <label>:17                                      ; preds = %4
  ret void
}

; Function Attrs: nounwind uwtable
define void @_RV_pmd_var_remove_pa(%struct._RV_pmd* %array, i64 %size) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i64, align 8
  %i = alloca i64, align 8
  store %struct._RV_pmd* %array, %struct._RV_pmd** %1, align 8
  store i64 %size, i64* %2, align 8
  store i64 0, i64* %i, align 8
  br label %3

; <label>:3                                       ; preds = %11, %0
  %4 = load i64* %i, align 8
  %5 = load i64* %2, align 8
  %6 = icmp ult i64 %4, %5
  br i1 %6, label %7, label %14

; <label>:7                                       ; preds = %3
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load i64* %i, align 8
  %10 = getelementptr inbounds %struct._RV_pmd* %8, i64 %9
  call void @_RV_pmd_set_null(%struct._RV_pmd* %10)
  br label %11

; <label>:11                                      ; preds = %7
  %12 = load i64* %i, align 8
  %13 = add i64 %12, 1
  store i64 %13, i64* %i, align 8
  br label %3

; <label>:14                                      ; preds = %3
  ret void
}

; Function Attrs: nounwind uwtable
define %struct._RV_pmd* @_RV_pmd_tbl_update_argv(i32 %argc, i8*** %argv_addr, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8***, align 8
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %sa = alloca %struct._RV_stat_node*, align 8
  store i32 %argc, i32* %1, align 4
  store i8*** %argv_addr, i8**** %2, align 8
  store i8** %argv, i8*** %3, align 8
  %4 = call %struct._RV_stat_node* @_RV_stat_node_create(i32 5, i64 0)
  store %struct._RV_stat_node* %4, %struct._RV_stat_node** %sa, align 8
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %35, %0
  %6 = load i32* %i, align 4
  %7 = load i32* %1, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %38

; <label>:9                                       ; preds = %5
  %10 = load i8*** %3, align 8
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i8** %10, i64 %12
  %14 = load %struct._RV_stat_node** %sa, align 8
  %15 = load i32* %i, align 4
  %16 = sext i32 %15 to i64
  %17 = load i8*** %3, align 8
  %18 = getelementptr inbounds i8** %17, i64 %16
  %19 = load i8** %18, align 8
  %20 = load i32* %i, align 4
  %21 = sext i32 %20 to i64
  %22 = load i8*** %3, align 8
  %23 = getelementptr inbounds i8** %22, i64 %21
  %24 = load i8** %23, align 8
  %25 = load i32* %i, align 4
  %26 = sext i32 %25 to i64
  %27 = load i8*** %3, align 8
  %28 = getelementptr inbounds i8** %27, i64 %26
  %29 = load i8** %28, align 8
  %30 = call i32 @_RV_sstrlen(i8* %29)
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i8* %24, i64 %31
  %33 = getelementptr inbounds i8* %32, i64 1
  %34 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %13, %struct._RV_stat_node* %14, i8* %19, i8* %33)
  br label %35

; <label>:35                                      ; preds = %9
  %36 = load i32* %i, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %i, align 4
  br label %5

; <label>:38                                      ; preds = %5
  %39 = load i8**** %2, align 8
  %40 = bitcast i8*** %39 to i8**
  %41 = load %struct._RV_stat_node** %sa, align 8
  %42 = load i8*** %3, align 8
  %43 = bitcast i8** %42 to i8*
  %44 = load i8*** %3, align 8
  %45 = load i32* %1, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8** %44, i64 %46
  %48 = bitcast i8** %47 to i8*
  %49 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %40, %struct._RV_stat_node* %41, i8* %43, i8* %48)
  ret %struct._RV_pmd* %49
}

; Function Attrs: nounwind uwtable
define %struct._RV_pmd* @_RV_pmd_var_update_argv(i32 %argc, %struct._RV_pmd* %argv_pmd, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %sa = alloca %struct._RV_stat_node*, align 8
  store i32 %argc, i32* %1, align 4
  store %struct._RV_pmd* %argv_pmd, %struct._RV_pmd** %2, align 8
  store i8** %argv, i8*** %3, align 8
  %4 = call %struct._RV_stat_node* @_RV_stat_node_create(i32 5, i64 0)
  store %struct._RV_stat_node* %4, %struct._RV_stat_node** %sa, align 8
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %35, %0
  %6 = load i32* %i, align 4
  %7 = load i32* %1, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %38

; <label>:9                                       ; preds = %5
  %10 = load i8*** %3, align 8
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i8** %10, i64 %12
  %14 = load %struct._RV_stat_node** %sa, align 8
  %15 = load i32* %i, align 4
  %16 = sext i32 %15 to i64
  %17 = load i8*** %3, align 8
  %18 = getelementptr inbounds i8** %17, i64 %16
  %19 = load i8** %18, align 8
  %20 = load i32* %i, align 4
  %21 = sext i32 %20 to i64
  %22 = load i8*** %3, align 8
  %23 = getelementptr inbounds i8** %22, i64 %21
  %24 = load i8** %23, align 8
  %25 = load i32* %i, align 4
  %26 = sext i32 %25 to i64
  %27 = load i8*** %3, align 8
  %28 = getelementptr inbounds i8** %27, i64 %26
  %29 = load i8** %28, align 8
  %30 = call i32 @_RV_sstrlen(i8* %29)
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i8* %24, i64 %31
  %33 = getelementptr inbounds i8* %32, i64 1
  %34 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %13, %struct._RV_stat_node* %14, i8* %19, i8* %33)
  br label %35

; <label>:35                                      ; preds = %9
  %36 = load i32* %i, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %i, align 4
  br label %5

; <label>:38                                      ; preds = %5
  %39 = load %struct._RV_pmd** %2, align 8
  %40 = load %struct._RV_stat_node** %sa, align 8
  %41 = load i8*** %3, align 8
  %42 = bitcast i8** %41 to i8*
  %43 = load i8*** %3, align 8
  %44 = load i32* %1, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i8** %43, i64 %45
  %47 = bitcast i8** %46 to i8*
  %48 = call %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %39, %struct._RV_stat_node* %40, i32 0, i8* %42, i8* %47)
  ret %struct._RV_pmd* %48
}

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_pmd_tbl_remove_argv(i32 %argc, i8*** %argv_addr, i8** %argv) #2 {
  %1 = alloca i32, align 4
  %2 = alloca i8***, align 8
  %3 = alloca i8**, align 8
  store i32 %argc, i32* %1, align 4
  store i8*** %argv_addr, i8**** %2, align 8
  store i8** %argv, i8*** %3, align 8
  %4 = load i8*** %3, align 8
  %5 = load i32* %1, align 4
  %6 = sext i32 %5 to i64
  call void @_RV_pmd_tbl_remove_pa(i8** %4, i64 %6)
  %7 = load i8**** %2, align 8
  %8 = bitcast i8*** %7 to i8**
  call void @_RV_pmd_tbl_remove(i8** %8)
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_pmd_var_remove_argv(i32 %argc, %struct._RV_pmd* %argv_pmd, i8** %argv) #2 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8**, align 8
  store i32 %argc, i32* %1, align 4
  store %struct._RV_pmd* %argv_pmd, %struct._RV_pmd** %2, align 8
  store i8** %argv, i8*** %3, align 8
  %4 = load i8*** %3, align 8
  %5 = load i32* %1, align 4
  %6 = sext i32 %5 to i64
  call void @_RV_pmd_tbl_remove_pa(i8** %4, i64 %6)
  %7 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %7)
  ret void
}

; Function Attrs: nounwind uwtable
define %struct._RV_pmd* @_RV_pmd_tbl_update_envp(i8*** %envp_addr, i8** %envp) #0 {
  %1 = alloca i8***, align 8
  %2 = alloca i8**, align 8
  %i = alloca i32, align 4
  %sa = alloca %struct._RV_stat_node*, align 8
  store i8*** %envp_addr, i8**** %1, align 8
  store i8** %envp, i8*** %2, align 8
  store i32 0, i32* %i, align 4
  %3 = call %struct._RV_stat_node* @_RV_stat_node_create(i32 5, i64 0)
  store %struct._RV_stat_node* %3, %struct._RV_stat_node** %sa, align 8
  br label %4

; <label>:4                                       ; preds = %11, %0
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = load i8*** %2, align 8
  %8 = getelementptr inbounds i8** %7, i64 %6
  %9 = load i8** %8, align 8
  %10 = icmp ne i8* %9, null
  br i1 %10, label %11, label %39

; <label>:11                                      ; preds = %4
  %12 = load i8*** %2, align 8
  %13 = load i32* %i, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i8** %12, i64 %14
  %16 = load %struct._RV_stat_node** %sa, align 8
  %17 = load i32* %i, align 4
  %18 = sext i32 %17 to i64
  %19 = load i8*** %2, align 8
  %20 = getelementptr inbounds i8** %19, i64 %18
  %21 = load i8** %20, align 8
  %22 = load i32* %i, align 4
  %23 = sext i32 %22 to i64
  %24 = load i8*** %2, align 8
  %25 = getelementptr inbounds i8** %24, i64 %23
  %26 = load i8** %25, align 8
  %27 = load i32* %i, align 4
  %28 = sext i32 %27 to i64
  %29 = load i8*** %2, align 8
  %30 = getelementptr inbounds i8** %29, i64 %28
  %31 = load i8** %30, align 8
  %32 = call i32 @_RV_sstrlen(i8* %31)
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i8* %26, i64 %33
  %35 = getelementptr inbounds i8* %34, i64 1
  %36 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %15, %struct._RV_stat_node* %16, i8* %21, i8* %35)
  %37 = load i32* %i, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %i, align 4
  br label %4

; <label>:39                                      ; preds = %4
  %40 = load i8**** %1, align 8
  %41 = bitcast i8*** %40 to i8**
  %42 = load %struct._RV_stat_node** %sa, align 8
  %43 = load i8*** %2, align 8
  %44 = bitcast i8** %43 to i8*
  %45 = load i8*** %2, align 8
  %46 = load i32* %i, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i8** %45, i64 %47
  %49 = getelementptr inbounds i8** %48, i64 1
  %50 = bitcast i8** %49 to i8*
  %51 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %41, %struct._RV_stat_node* %42, i8* %44, i8* %50)
  ret %struct._RV_pmd* %51
}

; Function Attrs: nounwind uwtable
define %struct._RV_pmd* @_RV_pmd_var_update_envp(%struct._RV_pmd* %envp_pmd, i8** %envp) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i8**, align 8
  %i = alloca i32, align 4
  %sa = alloca %struct._RV_stat_node*, align 8
  store %struct._RV_pmd* %envp_pmd, %struct._RV_pmd** %1, align 8
  store i8** %envp, i8*** %2, align 8
  store i32 0, i32* %i, align 4
  %3 = call %struct._RV_stat_node* @_RV_stat_node_create(i32 5, i64 0)
  store %struct._RV_stat_node* %3, %struct._RV_stat_node** %sa, align 8
  br label %4

; <label>:4                                       ; preds = %11, %0
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = load i8*** %2, align 8
  %8 = getelementptr inbounds i8** %7, i64 %6
  %9 = load i8** %8, align 8
  %10 = icmp ne i8* %9, null
  br i1 %10, label %11, label %39

; <label>:11                                      ; preds = %4
  %12 = load i8*** %2, align 8
  %13 = load i32* %i, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i8** %12, i64 %14
  %16 = load %struct._RV_stat_node** %sa, align 8
  %17 = load i32* %i, align 4
  %18 = sext i32 %17 to i64
  %19 = load i8*** %2, align 8
  %20 = getelementptr inbounds i8** %19, i64 %18
  %21 = load i8** %20, align 8
  %22 = load i32* %i, align 4
  %23 = sext i32 %22 to i64
  %24 = load i8*** %2, align 8
  %25 = getelementptr inbounds i8** %24, i64 %23
  %26 = load i8** %25, align 8
  %27 = load i32* %i, align 4
  %28 = sext i32 %27 to i64
  %29 = load i8*** %2, align 8
  %30 = getelementptr inbounds i8** %29, i64 %28
  %31 = load i8** %30, align 8
  %32 = call i32 @_RV_sstrlen(i8* %31)
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i8* %26, i64 %33
  %35 = getelementptr inbounds i8* %34, i64 1
  %36 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %15, %struct._RV_stat_node* %16, i8* %21, i8* %35)
  %37 = load i32* %i, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %i, align 4
  br label %4

; <label>:39                                      ; preds = %4
  %40 = load %struct._RV_pmd** %1, align 8
  %41 = load %struct._RV_stat_node** %sa, align 8
  %42 = load i8*** %2, align 8
  %43 = bitcast i8** %42 to i8*
  %44 = load i8*** %2, align 8
  %45 = load i32* %i, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8** %44, i64 %46
  %48 = getelementptr inbounds i8** %47, i64 1
  %49 = bitcast i8** %48 to i8*
  %50 = call %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %40, %struct._RV_stat_node* %41, i32 0, i8* %43, i8* %49)
  ret %struct._RV_pmd* %50
}

; Function Attrs: nounwind uwtable
define void @_RV_pmd_tbl_remove_envp(i8*** %envp_addr, i8** %envp) #0 {
  %1 = alloca i8***, align 8
  %2 = alloca i8**, align 8
  %i = alloca i32, align 4
  store i8*** %envp_addr, i8**** %1, align 8
  store i8** %envp, i8*** %2, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %10, %0
  %4 = load i32* %i, align 4
  %5 = sext i32 %4 to i64
  %6 = load i8*** %2, align 8
  %7 = getelementptr inbounds i8** %6, i64 %5
  %8 = load i8** %7, align 8
  %9 = icmp ne i8* %8, null
  br i1 %9, label %10, label %17

; <label>:10                                      ; preds = %3
  %11 = load i8*** %2, align 8
  %12 = load i32* %i, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i8** %11, i64 %13
  call void @_RV_pmd_tbl_remove(i8** %14)
  %15 = load i32* %i, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %i, align 4
  br label %3

; <label>:17                                      ; preds = %3
  %18 = load i8**** %1, align 8
  %19 = bitcast i8*** %18 to i8**
  call void @_RV_pmd_tbl_remove(i8** %19)
  ret void
}

; Function Attrs: nounwind uwtable
define void @_RV_pmd_var_remove_envp(%struct._RV_pmd* %envp_pmd, i8** %envp) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i8**, align 8
  %i = alloca i32, align 4
  store %struct._RV_pmd* %envp_pmd, %struct._RV_pmd** %1, align 8
  store i8** %envp, i8*** %2, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %10, %0
  %4 = load i32* %i, align 4
  %5 = sext i32 %4 to i64
  %6 = load i8*** %2, align 8
  %7 = getelementptr inbounds i8** %6, i64 %5
  %8 = load i8** %7, align 8
  %9 = icmp ne i8* %8, null
  br i1 %9, label %10, label %17

; <label>:10                                      ; preds = %3
  %11 = load i8*** %2, align 8
  %12 = load i32* %i, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i8** %11, i64 %13
  call void @_RV_pmd_tbl_remove(i8** %14)
  %15 = load i32* %i, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %i, align 4
  br label %3

; <label>:17                                      ; preds = %3
  %18 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %18)
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_fmd* @_RV_fmd_tbl_create(void (...)* %func, i8 zeroext %capacity) #2 {
  %1 = alloca void (...)*, align 8
  %2 = alloca i8, align 1
  %tbl = alloca %struct._RV_hashtbl*, align 8
  %fmd = alloca %struct._RV_fmd*, align 8
  store void (...)* %func, void (...)** %1, align 8
  store i8 %capacity, i8* %2, align 1
  %3 = call %struct._RV_hashtbl* @_RV_hashtbl_get_hashtbl_fmd()
  store %struct._RV_hashtbl* %3, %struct._RV_hashtbl** %tbl, align 8
  %4 = load %struct._RV_hashtbl** %tbl, align 8
  %5 = load void (...)** %1, align 8
  %6 = load i8* %2, align 1
  %7 = call %struct._RV_fmd* @_RV_hashtbl_insert_fmd_func(%struct._RV_hashtbl* %4, void (...)* %5, i8 zeroext %6)
  store %struct._RV_fmd* %7, %struct._RV_fmd** %fmd, align 8
  %8 = load %struct._RV_fmd** %fmd, align 8
  call void @_RV_fmd_set_null(%struct._RV_fmd* %8)
  %9 = load %struct._RV_fmd** %fmd, align 8
  ret %struct._RV_fmd* %9
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_fmd* @_RV_fmd_tbl_lookup(void (...)* %func) #2 {
  %1 = alloca void (...)*, align 8
  %tbl = alloca %struct._RV_hashtbl*, align 8
  store void (...)* %func, void (...)** %1, align 8
  %2 = call %struct._RV_hashtbl* @_RV_hashtbl_get_hashtbl_fmd()
  store %struct._RV_hashtbl* %2, %struct._RV_hashtbl** %tbl, align 8
  %3 = load %struct._RV_hashtbl** %tbl, align 8
  %4 = load void (...)** %1, align 8
  %5 = call %struct._RV_fmd* @_RV_hashtbl_find_fmd(%struct._RV_hashtbl* %3, void (...)* %4)
  ret %struct._RV_fmd* %5
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_fmd_pmd* @_RV_fmd_tbl_lookup_fpmd(void (...)* %func, i8 zeroext %i) #2 {
  %1 = alloca void (...)*, align 8
  %2 = alloca i8, align 1
  %fmd = alloca %struct._RV_fmd*, align 8
  store void (...)* %func, void (...)** %1, align 8
  store i8 %i, i8* %2, align 1
  %3 = load void (...)** %1, align 8
  %4 = call %struct._RV_fmd* @_RV_fmd_tbl_lookup(void (...)* %3)
  store %struct._RV_fmd* %4, %struct._RV_fmd** %fmd, align 8
  %5 = load %struct._RV_fmd** %fmd, align 8
  %6 = load i8* %2, align 1
  %7 = call %struct._RV_fmd_pmd* @_RV_fmd_get_fmd_pmd(%struct._RV_fmd* %5, i8 zeroext %6)
  ret %struct._RV_fmd_pmd* %7
}

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_fmd_tbl_print(void (...)* %func, i8 zeroext %i, i8* %func_name) #2 {
  %1 = alloca void (...)*, align 8
  %2 = alloca i8, align 1
  %3 = alloca i8*, align 8
  %fpmd = alloca %struct._RV_fmd_pmd*, align 8
  store void (...)* %func, void (...)** %1, align 8
  store i8 %i, i8* %2, align 1
  store i8* %func_name, i8** %3, align 8
  %4 = load void (...)** %1, align 8
  %5 = load i8* %2, align 1
  %6 = call %struct._RV_fmd_pmd* @_RV_fmd_tbl_lookup_fpmd(void (...)* %4, i8 zeroext %5)
  store %struct._RV_fmd_pmd* %6, %struct._RV_fmd_pmd** %fpmd, align 8
  %7 = load %struct._RV_fmd_pmd** %fpmd, align 8
  %8 = icmp ne %struct._RV_fmd_pmd* %7, null
  br i1 %8, label %14, label %9

; <label>:9                                       ; preds = %0
  %10 = load i8** %3, align 8
  %11 = load i8* %2, align 1
  %12 = zext i8 %11 to i32
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([43 x i8]* @.str13, i32 0, i32 0), i8* %10, i32 %12)
  br label %44

; <label>:14                                      ; preds = %0
  %15 = load i8** %3, align 8
  %16 = load i8* %2, align 1
  %17 = zext i8 %16 to i32
  %18 = load %struct._RV_fmd_pmd** %fpmd, align 8
  %19 = getelementptr inbounds %struct._RV_fmd_pmd* %18, i32 0, i32 0
  %20 = load i8** %19, align 8
  %21 = load %struct._RV_fmd_pmd** %fpmd, align 8
  %22 = getelementptr inbounds %struct._RV_fmd_pmd* %21, i32 0, i32 1
  %23 = load i8** %22, align 8
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([49 x i8]* @.str14, i32 0, i32 0), i8* %15, i32 %17, i8* %20, i8* %23)
  %25 = load %struct._RV_fmd_pmd** %fpmd, align 8
  %26 = getelementptr inbounds %struct._RV_fmd_pmd* %25, i32 0, i32 2
  %27 = load %struct._RV_stat_node** %26, align 8
  %28 = icmp ne %struct._RV_stat_node* %27, null
  br i1 %28, label %31, label %29

; <label>:29                                      ; preds = %14
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str4, i32 0, i32 0))
  br label %43

; <label>:31                                      ; preds = %14
  %32 = load %struct._RV_fmd_pmd** %fpmd, align 8
  %33 = getelementptr inbounds %struct._RV_fmd_pmd* %32, i32 0, i32 2
  %34 = load %struct._RV_stat_node** %33, align 8
  %35 = getelementptr inbounds %struct._RV_stat_node* %34, i32 0, i32 0
  %36 = load i32* %35, align 4
  %37 = load %struct._RV_fmd_pmd** %fpmd, align 8
  %38 = getelementptr inbounds %struct._RV_fmd_pmd* %37, i32 0, i32 2
  %39 = load %struct._RV_stat_node** %38, align 8
  %40 = getelementptr inbounds %struct._RV_stat_node* %39, i32 0, i32 1
  %41 = load i64* %40, align 8
  %42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str5, i32 0, i32 0), i32 %36, i64 %41)
  br label %43

; <label>:43                                      ; preds = %31, %29
  br label %44

; <label>:44                                      ; preds = %43, %9
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define %struct._RV_fmd* @_RV_fmd_tbl_update_pmd(void (...)* %func, i8 zeroext %i, %struct._RV_pmd* %pmd) #2 {
  %1 = alloca void (...)*, align 8
  %2 = alloca i8, align 1
  %3 = alloca %struct._RV_pmd*, align 8
  %fmd = alloca %struct._RV_fmd*, align 8
  store void (...)* %func, void (...)** %1, align 8
  store i8 %i, i8* %2, align 1
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %3, align 8
  %4 = load void (...)** %1, align 8
  %5 = call %struct._RV_fmd* @_RV_fmd_tbl_lookup(void (...)* %4)
  store %struct._RV_fmd* %5, %struct._RV_fmd** %fmd, align 8
  %6 = load %struct._RV_fmd** %fmd, align 8
  %7 = load i8* %2, align 1
  %8 = load %struct._RV_pmd** %3, align 8
  call void @_RV_fmd_cp_pmd(%struct._RV_fmd* %6, i8 zeroext %7, %struct._RV_pmd* %8)
  %9 = load %struct._RV_fmd** %fmd, align 8
  ret %struct._RV_fmd* %9
}

; Function Attrs: inlinehint nounwind uwtable
define void @_RV_fmd_tbl_remove(void (...)* %func) #2 {
  %1 = alloca void (...)*, align 8
  %fmd = alloca %struct._RV_fmd*, align 8
  store void (...)* %func, void (...)** %1, align 8
  %2 = load void (...)** %1, align 8
  %3 = call %struct._RV_fmd* @_RV_fmd_tbl_lookup(void (...)* %2)
  store %struct._RV_fmd* %3, %struct._RV_fmd** %fmd, align 8
  %4 = load %struct._RV_fmd** %fmd, align 8
  call void @_RV_fmd_set_null(%struct._RV_fmd* %4)
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define i8* @_RV_check_dpv(%struct._RV_pmd* %pmd, i8* %ptr, i64 %size, i8* %file_name, i8* %func_name, i32 %line, i32 %column, i8* %ptr_name) #2 {
  %1 = alloca i8*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %stat = alloca i32, align 4
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %2, align 8
  store i8* %ptr, i8** %3, align 8
  store i64 %size, i64* %4, align 8
  store i8* %file_name, i8** %5, align 8
  store i8* %func_name, i8** %6, align 8
  store i32 %line, i32* %7, align 4
  store i32 %column, i32* %8, align 4
  store i8* %ptr_name, i8** %9, align 8
  %10 = load %struct._RV_pmd** %2, align 8
  %11 = call i32 @_RV_pmd_get_stat(%struct._RV_pmd* %10)
  store i32 %11, i32* %stat, align 4
  %12 = load i8** %3, align 8
  %13 = icmp eq i8* %12, null
  br i1 %13, label %14, label %28

; <label>:14                                      ; preds = %0
  %15 = load %struct._IO_FILE** @stderr, align 8
  %16 = load i8** %5, align 8
  %17 = load i8** %6, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([23 x i8]* @.str15, i32 0, i32 0), i8* %16, i8* %17)
  %19 = load %struct._IO_FILE** @stderr, align 8
  %20 = load i8** %5, align 8
  %21 = load i32* %7, align 4
  %22 = load i32* %8, align 4
  %23 = load i8** %9, align 8
  %24 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([69 x i8]* @.str16, i32 0, i32 0), i8* %20, i32 %21, i32 %22, i8* %23)
  %25 = load i64* @_RV_error_count, align 8
  %26 = add i64 %25, 1
  store i64 %26, i64* @_RV_error_count, align 8
  %27 = load i8** %3, align 8
  store i8* %27, i8** %1
  br label %144

; <label>:28                                      ; preds = %0
  %29 = load %struct._RV_pmd** %2, align 8
  %30 = icmp eq %struct._RV_pmd* %29, null
  br i1 %30, label %37, label %31

; <label>:31                                      ; preds = %28
  %32 = load %struct._RV_pmd** %2, align 8
  %33 = getelementptr inbounds %struct._RV_pmd* %32, i32 0, i32 3
  %34 = load i8* %33, align 1
  %35 = zext i8 %34 to i32
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %53

; <label>:37                                      ; preds = %31, %28
  %38 = load %struct._IO_FILE** @stderr, align 8
  %39 = load i8** %5, align 8
  %40 = load i8** %6, align 8
  %41 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %38, i8* getelementptr inbounds ([23 x i8]* @.str15, i32 0, i32 0), i8* %39, i8* %40)
  %42 = load %struct._IO_FILE** @stderr, align 8
  %43 = load i8** %5, align 8
  %44 = load i32* %7, align 4
  %45 = load i32* %8, align 4
  %46 = load i8** %9, align 8
  %47 = load i8** %3, align 8
  %48 = load i64* %4, align 8
  %49 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([128 x i8]* @.str17, i32 0, i32 0), i8* %43, i32 %44, i32 %45, i8* %46, i8* %47, i64 %48)
  %50 = load i64* @_RV_error_count, align 8
  %51 = add i64 %50, 1
  store i64 %51, i64* @_RV_error_count, align 8
  %52 = load i8** %3, align 8
  store i8* %52, i8** %1
  br label %144

; <label>:53                                      ; preds = %31
  %54 = load i32* %stat, align 4
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %56, label %78

; <label>:56                                      ; preds = %53
  %57 = load %struct._IO_FILE** @stderr, align 8
  %58 = load i8** %5, align 8
  %59 = load i8** %6, align 8
  %60 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %57, i8* getelementptr inbounds ([23 x i8]* @.str15, i32 0, i32 0), i8* %58, i8* %59)
  %61 = load %struct._IO_FILE** @stderr, align 8
  %62 = load i8** %5, align 8
  %63 = load i32* %7, align 4
  %64 = load i32* %8, align 4
  %65 = load i8** %9, align 8
  %66 = load i8** %3, align 8
  %67 = load i64* %4, align 8
  %68 = load %struct._RV_pmd** %2, align 8
  %69 = getelementptr inbounds %struct._RV_pmd* %68, i32 0, i32 0
  %70 = load i8** %69, align 8
  %71 = load %struct._RV_pmd** %2, align 8
  %72 = getelementptr inbounds %struct._RV_pmd* %71, i32 0, i32 1
  %73 = load i8** %72, align 8
  %74 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %61, i8* getelementptr inbounds ([142 x i8]* @.str18, i32 0, i32 0), i8* %62, i32 %63, i32 %64, i8* %65, i8* %66, i64 %67, i8* %70, i8* %73)
  %75 = load i64* @_RV_error_count, align 8
  %76 = add i64 %75, 1
  store i64 %76, i64* @_RV_error_count, align 8
  %77 = load i8** %3, align 8
  store i8* %77, i8** %1
  br label %144

; <label>:78                                      ; preds = %53
  %79 = load i32* %stat, align 4
  %80 = icmp eq i32 %79, 1
  br i1 %80, label %81, label %100

; <label>:81                                      ; preds = %78
  %82 = load %struct._IO_FILE** @stderr, align 8
  %83 = load i8** %5, align 8
  %84 = load i8** %6, align 8
  %85 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %82, i8* getelementptr inbounds ([23 x i8]* @.str15, i32 0, i32 0), i8* %83, i8* %84)
  %86 = load %struct._IO_FILE** @stderr, align 8
  %87 = load i8** %5, align 8
  %88 = load i32* %7, align 4
  %89 = load i32* %8, align 4
  %90 = load i8** %9, align 8
  %91 = load i8** %3, align 8
  %92 = load i64* %4, align 8
  %93 = load %struct._RV_pmd** %2, align 8
  %94 = getelementptr inbounds %struct._RV_pmd* %93, i32 0, i32 0
  %95 = load i8** %94, align 8
  %96 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %86, i8* getelementptr inbounds ([126 x i8]* @.str19, i32 0, i32 0), i8* %87, i32 %88, i32 %89, i8* %90, i8* %91, i64 %92, i8* %95)
  %97 = load i64* @_RV_error_count, align 8
  %98 = add i64 %97, 1
  store i64 %98, i64* @_RV_error_count, align 8
  %99 = load i8** %3, align 8
  store i8* %99, i8** %1
  br label %144

; <label>:100                                     ; preds = %78
  %101 = load i8** %3, align 8
  %102 = load %struct._RV_pmd** %2, align 8
  %103 = getelementptr inbounds %struct._RV_pmd* %102, i32 0, i32 0
  %104 = load i8** %103, align 8
  %105 = icmp ult i8* %101, %104
  br i1 %105, label %120, label %106

; <label>:106                                     ; preds = %100
  %107 = load i8** %3, align 8
  %108 = load i64* %4, align 8
  %109 = getelementptr inbounds i8* %107, i64 %108
  %110 = load %struct._RV_pmd** %2, align 8
  %111 = getelementptr inbounds %struct._RV_pmd* %110, i32 0, i32 1
  %112 = load i8** %111, align 8
  %113 = icmp ugt i8* %109, %112
  br i1 %113, label %120, label %114

; <label>:114                                     ; preds = %106
  %115 = load i8** %3, align 8
  %116 = load i64* %4, align 8
  %117 = getelementptr inbounds i8* %115, i64 %116
  %118 = load i8** %3, align 8
  %119 = icmp ult i8* %117, %118
  br i1 %119, label %120, label %142

; <label>:120                                     ; preds = %114, %106, %100
  %121 = load %struct._IO_FILE** @stderr, align 8
  %122 = load i8** %5, align 8
  %123 = load i8** %6, align 8
  %124 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %121, i8* getelementptr inbounds ([23 x i8]* @.str15, i32 0, i32 0), i8* %122, i8* %123)
  %125 = load %struct._IO_FILE** @stderr, align 8
  %126 = load i8** %5, align 8
  %127 = load i32* %7, align 4
  %128 = load i32* %8, align 4
  %129 = load i8** %9, align 8
  %130 = load i8** %3, align 8
  %131 = load i64* %4, align 8
  %132 = load %struct._RV_pmd** %2, align 8
  %133 = getelementptr inbounds %struct._RV_pmd* %132, i32 0, i32 0
  %134 = load i8** %133, align 8
  %135 = load %struct._RV_pmd** %2, align 8
  %136 = getelementptr inbounds %struct._RV_pmd* %135, i32 0, i32 1
  %137 = load i8** %136, align 8
  %138 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %125, i8* getelementptr inbounds ([113 x i8]* @.str20, i32 0, i32 0), i8* %126, i32 %127, i32 %128, i8* %129, i8* %130, i64 %131, i8* %134, i8* %137)
  %139 = load i64* @_RV_error_count, align 8
  %140 = add i64 %139, 1
  store i64 %140, i64* @_RV_error_count, align 8
  %141 = load i8** %3, align 8
  store i8* %141, i8** %1
  br label %144

; <label>:142                                     ; preds = %114
  %143 = load i8** %3, align 8
  store i8* %143, i8** %1
  br label %144

; <label>:144                                     ; preds = %142, %120, %81, %56, %37, %14
  %145 = load i8** %1
  ret i8* %145
}

; Function Attrs: inlinehint nounwind uwtable
define i64 @_RV_check_dpv_ss(%struct._RV_pmd* %pmd, i8* %ptr, i64 %subscript, i64 %size, i8* %file_name, i8* %func_name, i32 %line, i32 %column, i8* %ptr_name) #2 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %1, align 8
  store i8* %ptr, i8** %2, align 8
  store i64 %subscript, i64* %3, align 8
  store i64 %size, i64* %4, align 8
  store i8* %file_name, i8** %5, align 8
  store i8* %func_name, i8** %6, align 8
  store i32 %line, i32* %7, align 4
  store i32 %column, i32* %8, align 4
  store i8* %ptr_name, i8** %9, align 8
  %10 = load %struct._RV_pmd** %1, align 8
  %11 = load i8** %2, align 8
  %12 = load i64* %3, align 8
  %13 = load i64* %4, align 8
  %14 = mul i64 %12, %13
  %15 = getelementptr inbounds i8* %11, i64 %14
  %16 = load i64* %4, align 8
  %17 = load i8** %5, align 8
  %18 = load i8** %6, align 8
  %19 = load i32* %7, align 4
  %20 = load i32* %8, align 4
  %21 = load i8** %9, align 8
  %zybc_ = bitcast %struct._RV_pmd* %10 to i8*
  %zybc_1 = bitcast i8* %15 to i8*
  %zyarg_ = inttoptr i64 %16 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %17 to i8*
  %zybc_4 = bitcast i8* %18 to i8*
  %zyarg_5 = inttoptr i32 %19 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %20 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %21 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 327190672, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_0_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %22 = load i64* %3, align 8
  call void @_Z4joinj(i32 327190672)
  ret i64 %22
}

; Function Attrs: inlinehint nounwind uwtable
define i8* @_RV_check_dpfv(%struct._RV_pmd* %pmd, i8* %ptr, i8* %file_name, i8* %func_name, i32 %line, i32 %column, i8* %ptr_name) #2 {
  %1 = alloca i8*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %stat = alloca i32, align 4
  store %struct._RV_pmd* %pmd, %struct._RV_pmd** %2, align 8
  store i8* %ptr, i8** %3, align 8
  store i8* %file_name, i8** %4, align 8
  store i8* %func_name, i8** %5, align 8
  store i32 %line, i32* %6, align 4
  store i32 %column, i32* %7, align 4
  store i8* %ptr_name, i8** %8, align 8
  %9 = load %struct._RV_pmd** %2, align 8
  %10 = call i32 @_RV_pmd_get_stat(%struct._RV_pmd* %9)
  store i32 %10, i32* %stat, align 4
  %11 = load i8** %3, align 8
  %12 = icmp eq i8* %11, null
  br i1 %12, label %13, label %27

; <label>:13                                      ; preds = %0
  %14 = load %struct._IO_FILE** @stderr, align 8
  %15 = load i8** %4, align 8
  %16 = load i8** %5, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([23 x i8]* @.str15, i32 0, i32 0), i8* %15, i8* %16)
  %18 = load %struct._IO_FILE** @stderr, align 8
  %19 = load i8** %4, align 8
  %20 = load i32* %6, align 4
  %21 = load i32* %7, align 4
  %22 = load i8** %8, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([69 x i8]* @.str16, i32 0, i32 0), i8* %19, i32 %20, i32 %21, i8* %22)
  %24 = load i64* @_RV_error_count, align 8
  %25 = add i64 %24, 1
  store i64 %25, i64* @_RV_error_count, align 8
  %26 = load i8** %3, align 8
  store i8* %26, i8** %1
  br label %128

; <label>:27                                      ; preds = %0
  %28 = load %struct._RV_pmd** %2, align 8
  %29 = icmp eq %struct._RV_pmd* %28, null
  br i1 %29, label %36, label %30

; <label>:30                                      ; preds = %27
  %31 = load %struct._RV_pmd** %2, align 8
  %32 = getelementptr inbounds %struct._RV_pmd* %31, i32 0, i32 3
  %33 = load i8* %32, align 1
  %34 = zext i8 %33 to i32
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %51

; <label>:36                                      ; preds = %30, %27
  %37 = load %struct._IO_FILE** @stderr, align 8
  %38 = load i8** %4, align 8
  %39 = load i8** %5, align 8
  %40 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([23 x i8]* @.str15, i32 0, i32 0), i8* %38, i8* %39)
  %41 = load %struct._IO_FILE** @stderr, align 8
  %42 = load i8** %4, align 8
  %43 = load i32* %6, align 4
  %44 = load i32* %7, align 4
  %45 = load i8** %8, align 8
  %46 = load i8** %3, align 8
  %47 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([116 x i8]* @.str21, i32 0, i32 0), i8* %42, i32 %43, i32 %44, i8* %45, i8* %46)
  %48 = load i64* @_RV_error_count, align 8
  %49 = add i64 %48, 1
  store i64 %49, i64* @_RV_error_count, align 8
  %50 = load i8** %3, align 8
  store i8* %50, i8** %1
  br label %128

; <label>:51                                      ; preds = %30
  %52 = load i32* %stat, align 4
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %54, label %75

; <label>:54                                      ; preds = %51
  %55 = load %struct._IO_FILE** @stderr, align 8
  %56 = load i8** %4, align 8
  %57 = load i8** %5, align 8
  %58 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %55, i8* getelementptr inbounds ([23 x i8]* @.str15, i32 0, i32 0), i8* %56, i8* %57)
  %59 = load %struct._IO_FILE** @stderr, align 8
  %60 = load i8** %4, align 8
  %61 = load i32* %6, align 4
  %62 = load i32* %7, align 4
  %63 = load i8** %8, align 8
  %64 = load i8** %3, align 8
  %65 = load %struct._RV_pmd** %2, align 8
  %66 = getelementptr inbounds %struct._RV_pmd* %65, i32 0, i32 0
  %67 = load i8** %66, align 8
  %68 = load %struct._RV_pmd** %2, align 8
  %69 = getelementptr inbounds %struct._RV_pmd* %68, i32 0, i32 1
  %70 = load i8** %69, align 8
  %71 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %59, i8* getelementptr inbounds ([130 x i8]* @.str22, i32 0, i32 0), i8* %60, i32 %61, i32 %62, i8* %63, i8* %64, i8* %67, i8* %70)
  %72 = load i64* @_RV_error_count, align 8
  %73 = add i64 %72, 1
  store i64 %73, i64* @_RV_error_count, align 8
  %74 = load i8** %3, align 8
  store i8* %74, i8** %1
  br label %128

; <label>:75                                      ; preds = %51
  %76 = load i32* %stat, align 4
  %77 = icmp ne i32 %76, 1
  br i1 %77, label %78, label %102

; <label>:78                                      ; preds = %75
  %79 = load i32* %stat, align 4
  %80 = icmp ne i32 %79, 6
  br i1 %80, label %81, label %102

; <label>:81                                      ; preds = %78
  %82 = load %struct._IO_FILE** @stderr, align 8
  %83 = load i8** %4, align 8
  %84 = load i8** %5, align 8
  %85 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %82, i8* getelementptr inbounds ([23 x i8]* @.str15, i32 0, i32 0), i8* %83, i8* %84)
  %86 = load %struct._IO_FILE** @stderr, align 8
  %87 = load i8** %4, align 8
  %88 = load i32* %6, align 4
  %89 = load i32* %7, align 4
  %90 = load i8** %8, align 8
  %91 = load i8** %3, align 8
  %92 = load %struct._RV_pmd** %2, align 8
  %93 = getelementptr inbounds %struct._RV_pmd* %92, i32 0, i32 0
  %94 = load i8** %93, align 8
  %95 = load %struct._RV_pmd** %2, align 8
  %96 = getelementptr inbounds %struct._RV_pmd* %95, i32 0, i32 1
  %97 = load i8** %96, align 8
  %98 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %86, i8* getelementptr inbounds ([128 x i8]* @.str23, i32 0, i32 0), i8* %87, i32 %88, i32 %89, i8* %90, i8* %91, i8* %94, i8* %97)
  %99 = load i64* @_RV_error_count, align 8
  %100 = add i64 %99, 1
  store i64 %100, i64* @_RV_error_count, align 8
  %101 = load i8** %3, align 8
  store i8* %101, i8** %1
  br label %128

; <label>:102                                     ; preds = %78, %75
  %103 = load i8** %3, align 8
  %104 = load %struct._RV_pmd** %2, align 8
  %105 = getelementptr inbounds %struct._RV_pmd* %104, i32 0, i32 0
  %106 = load i8** %105, align 8
  %107 = icmp ne i8* %103, %106
  br i1 %107, label %108, label %126

; <label>:108                                     ; preds = %102
  %109 = load %struct._IO_FILE** @stderr, align 8
  %110 = load i8** %4, align 8
  %111 = load i8** %5, align 8
  %112 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %109, i8* getelementptr inbounds ([23 x i8]* @.str15, i32 0, i32 0), i8* %110, i8* %111)
  %113 = load %struct._IO_FILE** @stderr, align 8
  %114 = load i8** %4, align 8
  %115 = load i32* %6, align 4
  %116 = load i32* %7, align 4
  %117 = load i8** %8, align 8
  %118 = load i8** %3, align 8
  %119 = load %struct._RV_pmd** %2, align 8
  %120 = getelementptr inbounds %struct._RV_pmd* %119, i32 0, i32 0
  %121 = load i8** %120, align 8
  %122 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %113, i8* getelementptr inbounds ([110 x i8]* @.str24, i32 0, i32 0), i8* %114, i32 %115, i32 %116, i8* %117, i8* %118, i8* %121)
  %123 = load i64* @_RV_error_count, align 8
  %124 = add i64 %123, 1
  store i64 %124, i64* @_RV_error_count, align 8
  %125 = load i8** %3, align 8
  store i8* %125, i8** %1
  br label %128

; <label>:126                                     ; preds = %102
  %127 = load i8** %3, align 8
  store i8* %127, i8** %1
  br label %128

; <label>:128                                     ; preds = %126, %108, %81, %54, %36, %13
  %129 = load i8** %1
  ret i8* %129
}

; Function Attrs: inlinehint nounwind uwtable
define i8* @_RV_check_dpc(i8* %base, i8* %bound, i8* %ptr, i64 %size, i8* %file_name, i8* %func_name, i32 %line, i32 %column, i8* %ptr_name) #2 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  store i8* %base, i8** %2, align 8
  store i8* %bound, i8** %3, align 8
  store i8* %ptr, i8** %4, align 8
  store i64 %size, i64* %5, align 8
  store i8* %file_name, i8** %6, align 8
  store i8* %func_name, i8** %7, align 8
  store i32 %line, i32* %8, align 4
  store i32 %column, i32* %9, align 4
  store i8* %ptr_name, i8** %10, align 8
  %11 = load i8** %4, align 8
  %12 = icmp eq i8* %11, null
  br i1 %12, label %13, label %27

; <label>:13                                      ; preds = %0
  %14 = load %struct._IO_FILE** @stderr, align 8
  %15 = load i8** %6, align 8
  %16 = load i8** %7, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([23 x i8]* @.str15, i32 0, i32 0), i8* %15, i8* %16)
  %18 = load %struct._IO_FILE** @stderr, align 8
  %19 = load i8** %6, align 8
  %20 = load i32* %8, align 4
  %21 = load i32* %9, align 4
  %22 = load i8** %10, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([69 x i8]* @.str16, i32 0, i32 0), i8* %19, i32 %20, i32 %21, i8* %22)
  %24 = load i64* @_RV_error_count, align 8
  %25 = add i64 %24, 1
  store i64 %25, i64* @_RV_error_count, align 8
  %26 = load i8** %4, align 8
  store i8* %26, i8** %1
  br label %63

; <label>:27                                      ; preds = %0
  %28 = load i8** %4, align 8
  %29 = load i8** %2, align 8
  %30 = icmp ult i8* %28, %29
  br i1 %30, label %43, label %31

; <label>:31                                      ; preds = %27
  %32 = load i8** %4, align 8
  %33 = load i64* %5, align 8
  %34 = getelementptr inbounds i8* %32, i64 %33
  %35 = load i8** %3, align 8
  %36 = icmp ugt i8* %34, %35
  br i1 %36, label %43, label %37

; <label>:37                                      ; preds = %31
  %38 = load i8** %4, align 8
  %39 = load i64* %5, align 8
  %40 = getelementptr inbounds i8* %38, i64 %39
  %41 = load i8** %4, align 8
  %42 = icmp ult i8* %40, %41
  br i1 %42, label %43, label %61

; <label>:43                                      ; preds = %37, %31, %27
  %44 = load %struct._IO_FILE** @stderr, align 8
  %45 = load i8** %6, align 8
  %46 = load i8** %7, align 8
  %47 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([23 x i8]* @.str15, i32 0, i32 0), i8* %45, i8* %46)
  %48 = load %struct._IO_FILE** @stderr, align 8
  %49 = load i8** %6, align 8
  %50 = load i32* %8, align 4
  %51 = load i32* %9, align 4
  %52 = load i8** %10, align 8
  %53 = load i8** %4, align 8
  %54 = load i64* %5, align 8
  %55 = load i8** %2, align 8
  %56 = load i8** %3, align 8
  %57 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([113 x i8]* @.str20, i32 0, i32 0), i8* %49, i32 %50, i32 %51, i8* %52, i8* %53, i64 %54, i8* %55, i8* %56)
  %58 = load i64* @_RV_error_count, align 8
  %59 = add i64 %58, 1
  store i64 %59, i64* @_RV_error_count, align 8
  %60 = load i8** %4, align 8
  store i8* %60, i8** %1
  br label %63

; <label>:61                                      ; preds = %37
  %62 = load i8** %4, align 8
  store i8* %62, i8** %1
  br label %63

; <label>:63                                      ; preds = %61, %43, %13
  %64 = load i8** %1
  ret i8* %64
}

; Function Attrs: inlinehint nounwind uwtable
define i64 @_RV_check_dpc_ss(i8* %base, i8* %bound, i8* %ptr, i64 %subscript, i64 %size, i8* %file_name, i8* %func_name, i32 %line, i32 %column, i8* %ptr_name) #2 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  store i8* %base, i8** %1, align 8
  store i8* %bound, i8** %2, align 8
  store i8* %ptr, i8** %3, align 8
  store i64 %subscript, i64* %4, align 8
  store i64 %size, i64* %5, align 8
  store i8* %file_name, i8** %6, align 8
  store i8* %func_name, i8** %7, align 8
  store i32 %line, i32* %8, align 4
  store i32 %column, i32* %9, align 4
  store i8* %ptr_name, i8** %10, align 8
  %11 = load i8** %1, align 8
  %12 = load i8** %2, align 8
  %13 = load i8** %3, align 8
  %14 = load i64* %4, align 8
  %15 = load i64* %5, align 8
  %16 = mul i64 %14, %15
  %17 = getelementptr inbounds i8* %13, i64 %16
  %18 = load i64* %5, align 8
  %19 = load i8** %6, align 8
  %20 = load i8** %7, align 8
  %21 = load i32* %8, align 4
  %22 = load i32* %9, align 4
  %23 = load i8** %10, align 8
  %zybc_ = bitcast i8* %11 to i8*
  %zybc_1 = bitcast i8* %12 to i8*
  %zybc_2 = bitcast i8* %17 to i8*
  %zyarg_ = inttoptr i64 %18 to i8*
  %zybc_3 = bitcast i8* %zyarg_ to i8*
  %zybc_4 = bitcast i8* %19 to i8*
  %zybc_5 = bitcast i8* %20 to i8*
  %zyarg_6 = inttoptr i32 %21 to i8*
  %zybc_7 = bitcast i8* %zyarg_6 to i8*
  %zyarg_8 = inttoptr i32 %22 to i8*
  %zybc_9 = bitcast i8* %zyarg_8 to i8*
  %zybc_10 = bitcast i8* %23 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_(i32 1649393048, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_1_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_5, i8* %zybc_7, i8* %zybc_9, i8* %zybc_10)
  %24 = load i64* %4, align 8
  call void @_Z4joinj(i32 1649393048)
  ret i64 %24
}

; Function Attrs: inlinehint nounwind uwtable
define i8* @_RV_check_dpfc(i8* %base, i8* %bound, i8* %ptr, i8* %file_name, i8* %func_name, i32 %line, i32 %column, i8* %ptr_name) #2 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  store i8* %base, i8** %2, align 8
  store i8* %bound, i8** %3, align 8
  store i8* %ptr, i8** %4, align 8
  store i8* %file_name, i8** %5, align 8
  store i8* %func_name, i8** %6, align 8
  store i32 %line, i32* %7, align 4
  store i32 %column, i32* %8, align 4
  store i8* %ptr_name, i8** %9, align 8
  %10 = load i8** %4, align 8
  %11 = icmp eq i8* %10, null
  br i1 %11, label %12, label %26

; <label>:12                                      ; preds = %0
  %13 = load %struct._IO_FILE** @stderr, align 8
  %14 = load i8** %5, align 8
  %15 = load i8** %6, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([23 x i8]* @.str15, i32 0, i32 0), i8* %14, i8* %15)
  %17 = load %struct._IO_FILE** @stderr, align 8
  %18 = load i8** %5, align 8
  %19 = load i32* %7, align 4
  %20 = load i32* %8, align 4
  %21 = load i8** %9, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([69 x i8]* @.str16, i32 0, i32 0), i8* %18, i32 %19, i32 %20, i8* %21)
  %23 = load i64* @_RV_error_count, align 8
  %24 = add i64 %23, 1
  store i64 %24, i64* @_RV_error_count, align 8
  %25 = load i8** %4, align 8
  store i8* %25, i8** %1
  br label %48

; <label>:26                                      ; preds = %0
  %27 = load i8** %4, align 8
  %28 = load i8** %2, align 8
  %29 = icmp ne i8* %27, %28
  br i1 %29, label %30, label %46

; <label>:30                                      ; preds = %26
  %31 = load %struct._IO_FILE** @stderr, align 8
  %32 = load i8** %5, align 8
  %33 = load i8** %6, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([23 x i8]* @.str15, i32 0, i32 0), i8* %32, i8* %33)
  %35 = load %struct._IO_FILE** @stderr, align 8
  %36 = load i8** %5, align 8
  %37 = load i32* %7, align 4
  %38 = load i32* %8, align 4
  %39 = load i8** %9, align 8
  %40 = load i8** %4, align 8
  %41 = load i8** %2, align 8
  %42 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([110 x i8]* @.str24, i32 0, i32 0), i8* %36, i32 %37, i32 %38, i8* %39, i8* %40, i8* %41)
  %43 = load i64* @_RV_error_count, align 8
  %44 = add i64 %43, 1
  store i64 %44, i64* @_RV_error_count, align 8
  %45 = load i8** %4, align 8
  store i8* %45, i8** %1
  br label %48

; <label>:46                                      ; preds = %26
  %47 = load i8** %4, align 8
  store i8* %47, i8** %1
  br label %48

; <label>:48                                      ; preds = %46, %30, %12
  %49 = load i8** %1
  ret i8* %49
}

; Function Attrs: nounwind uwtable
define i16** @_RV___ctype_b_loc(%struct._RV_pmd* %ret_pmd) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %ret = alloca i16**, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  %2 = call i16** @__ctype_b_loc() #9
  store i16** %2, i16*** %ret, align 8
  %3 = load i16*** %ret, align 8
  %4 = icmp eq i16** %3, null
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %6)
  br label %28

; <label>:7                                       ; preds = %0
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %10 = load i16*** %ret, align 8
  %11 = bitcast i16** %10 to i8*
  %12 = load i16*** %ret, align 8
  %13 = getelementptr inbounds i16** %12, i64 1
  %14 = bitcast i16** %13 to i8*
  %15 = call %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %8, %struct._RV_stat_node* %9, i32 0, i8* %11, i8* %14)
  %16 = load i16*** %ret, align 8
  %17 = bitcast i16** %16 to i8**
  %18 = load %struct._RV_stat_node** @_RV_static_sa, align 8
  %19 = load i16*** %ret, align 8
  %20 = load i16** %19, align 8
  %21 = bitcast i16* %20 to i8*
  %22 = getelementptr inbounds i8* %21, i64 -128
  %23 = load i16*** %ret, align 8
  %24 = load i16** %23, align 8
  %25 = bitcast i16* %24 to i8*
  %26 = getelementptr inbounds i8* %25, i64 256
  %27 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %17, %struct._RV_stat_node* %18, i8* %22, i8* %26)
  br label %28

; <label>:28                                      ; preds = %7, %5
  %29 = load i16*** %ret, align 8
  ret i16** %29
}

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() #5

; Function Attrs: nounwind uwtable
define i32 @_RV_getopt_long(%struct._RV_pmd* %argv_pmd, %struct._RV_pmd* %optstring_pmd, %struct._RV_pmd* %longopts_pmd, %struct._RV_pmd* %longindex_pmd, i32 %argc, i8** %argv, i8* %optstring, %struct.option* %longopts, i32* %longindex, i8* %file_name, i8* %func_name, i32 %a_line, i32 %a_col, i8* %a_name, i32 %o_line, i32 %o_col, i8* %o_name, i32 %lo_line, i32 %lo_col, i8* %lo_name, i32 %li_line, i32 %li_col, i8* %li_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._RV_pmd*, align 8
  %4 = alloca %struct._RV_pmd*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8**, align 8
  %7 = alloca i8*, align 8
  %8 = alloca %struct.option*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i8*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i8*, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i8*, align 8
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i8*, align 8
  %ret = alloca i32, align 4
  %i = alloca i32, align 4
  %pmd = alloca %struct._RV_pmd*, align 8
  store %struct._RV_pmd* %argv_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %optstring_pmd, %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %longopts_pmd, %struct._RV_pmd** %3, align 8
  store %struct._RV_pmd* %longindex_pmd, %struct._RV_pmd** %4, align 8
  store i32 %argc, i32* %5, align 4
  store i8** %argv, i8*** %6, align 8
  store i8* %optstring, i8** %7, align 8
  store %struct.option* %longopts, %struct.option** %8, align 8
  store i32* %longindex, i32** %9, align 8
  store i8* %file_name, i8** %10, align 8
  store i8* %func_name, i8** %11, align 8
  store i32 %a_line, i32* %12, align 4
  store i32 %a_col, i32* %13, align 4
  store i8* %a_name, i8** %14, align 8
  store i32 %o_line, i32* %15, align 4
  store i32 %o_col, i32* %16, align 4
  store i8* %o_name, i8** %17, align 8
  store i32 %lo_line, i32* %18, align 4
  store i32 %lo_col, i32* %19, align 4
  store i8* %lo_name, i8** %20, align 8
  store i32 %li_line, i32* %21, align 4
  store i32 %li_col, i32* %22, align 4
  store i8* %li_name, i8** %23, align 8
  %24 = load %struct._RV_pmd** %2, align 8
  %25 = load i8** %7, align 8
  %26 = load i8** %7, align 8
  %27 = call i32 @_RV_sstrlen(i8* %26)
  %28 = add nsw i32 %27, 1
  %29 = sext i32 %28 to i64
  %30 = load i8** %10, align 8
  %31 = load i8** %11, align 8
  %32 = load i32* %15, align 4
  %33 = load i32* %16, align 4
  %34 = load i8** %17, align 8
  %zybc_ = bitcast %struct._RV_pmd* %24 to i8*
  %zybc_1 = bitcast i8* %25 to i8*
  %zyarg_ = inttoptr i64 %29 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %30 to i8*
  %zybc_4 = bitcast i8* %31 to i8*
  %zyarg_5 = inttoptr i32 %32 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %33 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %34 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 2144367913, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_2_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %35 = load i32** %9, align 8
  %36 = icmp ne i32* %35, null
  br i1 %36, label %37, label %46

; <label>:37                                      ; preds = %0
  %38 = load %struct._RV_pmd** %4, align 8
  %39 = load i32** %9, align 8
  %40 = bitcast i32* %39 to i8*
  %41 = load i8** %10, align 8
  %42 = load i8** %11, align 8
  %43 = load i32* %21, align 4
  %44 = load i32* %22, align 4
  %45 = load i8** %23, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %38 to i8*
  %zybc_11 = bitcast i8* %40 to i8*
  %zyarg_12 = inttoptr i64 4 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %41 to i8*
  %zybc_15 = bitcast i8* %42 to i8*
  %zyarg_16 = inttoptr i32 %43 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %44 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %45 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 723905953, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_3_0, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  br label %46

; <label>:46                                      ; preds = %37, %0
  %47 = load i32* %5, align 4
  %48 = load i8*** %6, align 8
  %49 = load i8** %7, align 8
  %50 = load %struct.option** %8, align 8
  %51 = load i32** %9, align 8
  %52 = call i32 @getopt_long(i32 %47, i8** %48, i8* %49, %struct.option* %50, i32* %51) #7
  store i32 %52, i32* %ret, align 4
  %53 = load i8** @optarg, align 8
  %54 = icmp eq i8* %53, null
  br i1 %54, label %55, label %56

; <label>:55                                      ; preds = %46
  call void @_RV_pmd_tbl_remove(i8** @optarg)
  br label %87

; <label>:56                                      ; preds = %46
  store i32 0, i32* %i, align 4
  br label %57

; <label>:57                                      ; preds = %83, %56
  %58 = load i32* %i, align 4
  %59 = load i32* %5, align 4
  %60 = icmp slt i32 %58, %59
  br i1 %60, label %61, label %86

; <label>:61                                      ; preds = %57
  %62 = load i32* %i, align 4
  %63 = sext i32 %62 to i64
  %64 = load i8*** %6, align 8
  %65 = getelementptr inbounds i8** %64, i64 %63
  %66 = call %struct._RV_pmd* @_RV_pmd_tbl_lookup(i8** %65)
  store %struct._RV_pmd* %66, %struct._RV_pmd** %pmd, align 8
  %67 = load %struct._RV_pmd** %pmd, align 8
  %68 = call i8* @_RV_pmd_get_base(%struct._RV_pmd* %67)
  %69 = load i8** @optarg, align 8
  %70 = icmp ule i8* %68, %69
  br i1 %70, label %71, label %82

; <label>:71                                      ; preds = %61
  %72 = load i8** @optarg, align 8
  %73 = load %struct._RV_pmd** %pmd, align 8
  %74 = call i8* @_RV_pmd_get_bound(%struct._RV_pmd* %73)
  %75 = icmp ult i8* %72, %74
  br i1 %75, label %76, label %82

; <label>:76                                      ; preds = %71
  %77 = load i32* %i, align 4
  %78 = sext i32 %77 to i64
  %79 = load i8*** %6, align 8
  %80 = getelementptr inbounds i8** %79, i64 %78
  %81 = call %struct._RV_pmd* @_RV_pmd_tbl_update_ptr(i8** @optarg, i8** %80)
  br label %82

; <label>:82                                      ; preds = %76, %71, %61
  br label %83

; <label>:83                                      ; preds = %82
  %84 = load i32* %i, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, i32* %i, align 4
  br label %57

; <label>:86                                      ; preds = %57
  br label %87

; <label>:87                                      ; preds = %86, %55
  call void @_Z4joinj(i32 2144367913)
  call void @_Z4joinj(i32 723905953)
  %88 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %88)
  %89 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %89)
  %90 = load %struct._RV_pmd** %3, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %90)
  %91 = load %struct._RV_pmd** %4, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %91)
  %92 = load i32* %ret, align 4
  ret i32 %92
}

; Function Attrs: nounwind
declare i32 @getopt_long(i32, i8**, i8*, %struct.option*, i32*) #3

; Function Attrs: nounwind uwtable
define i8* @_RV_setlocale(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %locale_pmd, i32 %category, i8* %locale, i8* %file_name, i8* %func_name, i32 %l_line, i32 %l_col, i8* %l_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %ret = alloca i8*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %locale_pmd, %struct._RV_pmd** %2, align 8
  store i32 %category, i32* %3, align 4
  store i8* %locale, i8** %4, align 8
  store i8* %file_name, i8** %5, align 8
  store i8* %func_name, i8** %6, align 8
  store i32 %l_line, i32* %7, align 4
  store i32 %l_col, i32* %8, align 4
  store i8* %l_name, i8** %9, align 8
  %10 = load i8** %4, align 8
  %11 = icmp ne i8* %10, null
  br i1 %11, label %12, label %24

; <label>:12                                      ; preds = %0
  %13 = load %struct._RV_pmd** %2, align 8
  %14 = load i8** %4, align 8
  %15 = load i8** %4, align 8
  %16 = call i32 @_RV_sstrlen(i8* %15)
  %17 = add nsw i32 %16, 1
  %18 = sext i32 %17 to i64
  %19 = load i8** %5, align 8
  %20 = load i8** %6, align 8
  %21 = load i32* %7, align 4
  %22 = load i32* %8, align 4
  %23 = load i8** %9, align 8
  %zybc_ = bitcast %struct._RV_pmd* %13 to i8*
  %zybc_1 = bitcast i8* %14 to i8*
  %zyarg_ = inttoptr i64 %18 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %19 to i8*
  %zybc_4 = bitcast i8* %20 to i8*
  %zyarg_5 = inttoptr i32 %21 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %22 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %23 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -26346883, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_4_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  br label %24

; <label>:24                                      ; preds = %12, %0
  %25 = load i32* %3, align 4
  %26 = load i8** %4, align 8
  %27 = call i8* @setlocale(i32 %25, i8* %26) #7
  store i8* %27, i8** %ret, align 8
  %28 = load i8** %ret, align 8
  %29 = icmp eq i8* %28, null
  br i1 %29, label %30, label %32

; <label>:30                                      ; preds = %24
  %31 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %31)
  br label %43

; <label>:32                                      ; preds = %24
  %33 = load %struct._RV_pmd** %1, align 8
  %34 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %35 = load i8** %ret, align 8
  %36 = load i8** %ret, align 8
  %37 = load i8** %ret, align 8
  %38 = call i32 @_RV_sstrlen(i8* %37)
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i8* %36, i64 %39
  %41 = getelementptr inbounds i8* %40, i64 1
  %42 = call %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %33, %struct._RV_stat_node* %34, i32 0, i8* %35, i8* %41)
  br label %43

; <label>:43                                      ; preds = %32, %30
  call void @_Z4joinj(i32 -26346883)
  %44 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %44)
  %45 = load i8** %ret, align 8
  ret i8* %45
}

; Function Attrs: nounwind
declare i8* @setlocale(i32, i8*) #3

; Function Attrs: nounwind uwtable
define %struct.lconv* @_RV_localeconv(%struct._RV_pmd* %ret_pmd) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %ret = alloca %struct.lconv*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  %2 = call %struct.lconv* @localeconv() #7
  store %struct.lconv* %2, %struct.lconv** %ret, align 8
  %3 = load %struct.lconv** %ret, align 8
  %4 = icmp eq %struct.lconv* %3, null
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %6)
  br label %186

; <label>:7                                       ; preds = %0
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %10 = load %struct.lconv** %ret, align 8
  %11 = bitcast %struct.lconv* %10 to i8*
  %12 = load %struct.lconv** %ret, align 8
  %13 = getelementptr inbounds %struct.lconv* %12, i64 1
  %14 = bitcast %struct.lconv* %13 to i8*
  %15 = call %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %8, %struct._RV_stat_node* %9, i32 0, i8* %11, i8* %14)
  %16 = load %struct.lconv** %ret, align 8
  %17 = getelementptr inbounds %struct.lconv* %16, i32 0, i32 0
  %18 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %19 = load %struct.lconv** %ret, align 8
  %20 = getelementptr inbounds %struct.lconv* %19, i32 0, i32 0
  %21 = load i8** %20, align 8
  %22 = load %struct.lconv** %ret, align 8
  %23 = getelementptr inbounds %struct.lconv* %22, i32 0, i32 0
  %24 = load i8** %23, align 8
  %25 = load %struct.lconv** %ret, align 8
  %26 = getelementptr inbounds %struct.lconv* %25, i32 0, i32 0
  %27 = load i8** %26, align 8
  %28 = call i32 @_RV_sstrlen(i8* %27)
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i8* %24, i64 %29
  %31 = getelementptr inbounds i8* %30, i64 1
  %32 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %17, %struct._RV_stat_node* %18, i8* %21, i8* %31)
  %33 = load %struct.lconv** %ret, align 8
  %34 = getelementptr inbounds %struct.lconv* %33, i32 0, i32 1
  %35 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %36 = load %struct.lconv** %ret, align 8
  %37 = getelementptr inbounds %struct.lconv* %36, i32 0, i32 1
  %38 = load i8** %37, align 8
  %39 = load %struct.lconv** %ret, align 8
  %40 = getelementptr inbounds %struct.lconv* %39, i32 0, i32 1
  %41 = load i8** %40, align 8
  %42 = load %struct.lconv** %ret, align 8
  %43 = getelementptr inbounds %struct.lconv* %42, i32 0, i32 1
  %44 = load i8** %43, align 8
  %45 = call i32 @_RV_sstrlen(i8* %44)
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8* %41, i64 %46
  %48 = getelementptr inbounds i8* %47, i64 1
  %49 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %34, %struct._RV_stat_node* %35, i8* %38, i8* %48)
  %50 = load %struct.lconv** %ret, align 8
  %51 = getelementptr inbounds %struct.lconv* %50, i32 0, i32 2
  %52 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %53 = load %struct.lconv** %ret, align 8
  %54 = getelementptr inbounds %struct.lconv* %53, i32 0, i32 2
  %55 = load i8** %54, align 8
  %56 = load %struct.lconv** %ret, align 8
  %57 = getelementptr inbounds %struct.lconv* %56, i32 0, i32 2
  %58 = load i8** %57, align 8
  %59 = load %struct.lconv** %ret, align 8
  %60 = getelementptr inbounds %struct.lconv* %59, i32 0, i32 2
  %61 = load i8** %60, align 8
  %62 = call i32 @_RV_sstrlen(i8* %61)
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8* %58, i64 %63
  %65 = getelementptr inbounds i8* %64, i64 1
  %66 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %51, %struct._RV_stat_node* %52, i8* %55, i8* %65)
  %67 = load %struct.lconv** %ret, align 8
  %68 = getelementptr inbounds %struct.lconv* %67, i32 0, i32 3
  %69 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %70 = load %struct.lconv** %ret, align 8
  %71 = getelementptr inbounds %struct.lconv* %70, i32 0, i32 3
  %72 = load i8** %71, align 8
  %73 = load %struct.lconv** %ret, align 8
  %74 = getelementptr inbounds %struct.lconv* %73, i32 0, i32 3
  %75 = load i8** %74, align 8
  %76 = load %struct.lconv** %ret, align 8
  %77 = getelementptr inbounds %struct.lconv* %76, i32 0, i32 3
  %78 = load i8** %77, align 8
  %79 = call i32 @_RV_sstrlen(i8* %78)
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i8* %75, i64 %80
  %82 = getelementptr inbounds i8* %81, i64 1
  %83 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %68, %struct._RV_stat_node* %69, i8* %72, i8* %82)
  %84 = load %struct.lconv** %ret, align 8
  %85 = getelementptr inbounds %struct.lconv* %84, i32 0, i32 4
  %86 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %87 = load %struct.lconv** %ret, align 8
  %88 = getelementptr inbounds %struct.lconv* %87, i32 0, i32 4
  %89 = load i8** %88, align 8
  %90 = load %struct.lconv** %ret, align 8
  %91 = getelementptr inbounds %struct.lconv* %90, i32 0, i32 4
  %92 = load i8** %91, align 8
  %93 = load %struct.lconv** %ret, align 8
  %94 = getelementptr inbounds %struct.lconv* %93, i32 0, i32 4
  %95 = load i8** %94, align 8
  %96 = call i32 @_RV_sstrlen(i8* %95)
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i8* %92, i64 %97
  %99 = getelementptr inbounds i8* %98, i64 1
  %100 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %85, %struct._RV_stat_node* %86, i8* %89, i8* %99)
  %101 = load %struct.lconv** %ret, align 8
  %102 = getelementptr inbounds %struct.lconv* %101, i32 0, i32 5
  %103 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %104 = load %struct.lconv** %ret, align 8
  %105 = getelementptr inbounds %struct.lconv* %104, i32 0, i32 5
  %106 = load i8** %105, align 8
  %107 = load %struct.lconv** %ret, align 8
  %108 = getelementptr inbounds %struct.lconv* %107, i32 0, i32 5
  %109 = load i8** %108, align 8
  %110 = load %struct.lconv** %ret, align 8
  %111 = getelementptr inbounds %struct.lconv* %110, i32 0, i32 5
  %112 = load i8** %111, align 8
  %113 = call i32 @_RV_sstrlen(i8* %112)
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i8* %109, i64 %114
  %116 = getelementptr inbounds i8* %115, i64 1
  %117 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %102, %struct._RV_stat_node* %103, i8* %106, i8* %116)
  %118 = load %struct.lconv** %ret, align 8
  %119 = getelementptr inbounds %struct.lconv* %118, i32 0, i32 6
  %120 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %121 = load %struct.lconv** %ret, align 8
  %122 = getelementptr inbounds %struct.lconv* %121, i32 0, i32 6
  %123 = load i8** %122, align 8
  %124 = load %struct.lconv** %ret, align 8
  %125 = getelementptr inbounds %struct.lconv* %124, i32 0, i32 6
  %126 = load i8** %125, align 8
  %127 = load %struct.lconv** %ret, align 8
  %128 = getelementptr inbounds %struct.lconv* %127, i32 0, i32 6
  %129 = load i8** %128, align 8
  %130 = call i32 @_RV_sstrlen(i8* %129)
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds i8* %126, i64 %131
  %133 = getelementptr inbounds i8* %132, i64 1
  %134 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %119, %struct._RV_stat_node* %120, i8* %123, i8* %133)
  %135 = load %struct.lconv** %ret, align 8
  %136 = getelementptr inbounds %struct.lconv* %135, i32 0, i32 7
  %137 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %138 = load %struct.lconv** %ret, align 8
  %139 = getelementptr inbounds %struct.lconv* %138, i32 0, i32 7
  %140 = load i8** %139, align 8
  %141 = load %struct.lconv** %ret, align 8
  %142 = getelementptr inbounds %struct.lconv* %141, i32 0, i32 7
  %143 = load i8** %142, align 8
  %144 = load %struct.lconv** %ret, align 8
  %145 = getelementptr inbounds %struct.lconv* %144, i32 0, i32 7
  %146 = load i8** %145, align 8
  %147 = call i32 @_RV_sstrlen(i8* %146)
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i8* %143, i64 %148
  %150 = getelementptr inbounds i8* %149, i64 1
  %151 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %136, %struct._RV_stat_node* %137, i8* %140, i8* %150)
  %152 = load %struct.lconv** %ret, align 8
  %153 = getelementptr inbounds %struct.lconv* %152, i32 0, i32 8
  %154 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %155 = load %struct.lconv** %ret, align 8
  %156 = getelementptr inbounds %struct.lconv* %155, i32 0, i32 8
  %157 = load i8** %156, align 8
  %158 = load %struct.lconv** %ret, align 8
  %159 = getelementptr inbounds %struct.lconv* %158, i32 0, i32 8
  %160 = load i8** %159, align 8
  %161 = load %struct.lconv** %ret, align 8
  %162 = getelementptr inbounds %struct.lconv* %161, i32 0, i32 8
  %163 = load i8** %162, align 8
  %164 = call i32 @_RV_sstrlen(i8* %163)
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds i8* %160, i64 %165
  %167 = getelementptr inbounds i8* %166, i64 1
  %168 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %153, %struct._RV_stat_node* %154, i8* %157, i8* %167)
  %169 = load %struct.lconv** %ret, align 8
  %170 = getelementptr inbounds %struct.lconv* %169, i32 0, i32 9
  %171 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %172 = load %struct.lconv** %ret, align 8
  %173 = getelementptr inbounds %struct.lconv* %172, i32 0, i32 9
  %174 = load i8** %173, align 8
  %175 = load %struct.lconv** %ret, align 8
  %176 = getelementptr inbounds %struct.lconv* %175, i32 0, i32 9
  %177 = load i8** %176, align 8
  %178 = load %struct.lconv** %ret, align 8
  %179 = getelementptr inbounds %struct.lconv* %178, i32 0, i32 9
  %180 = load i8** %179, align 8
  %181 = call i32 @_RV_sstrlen(i8* %180)
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds i8* %177, i64 %182
  %184 = getelementptr inbounds i8* %183, i64 1
  %185 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %170, %struct._RV_stat_node* %171, i8* %174, i8* %184)
  br label %186

; <label>:186                                     ; preds = %7, %5
  %187 = load %struct.lconv** %ret, align 8
  ret %struct.lconv* %187
}

; Function Attrs: nounwind
declare %struct.lconv* @localeconv() #3

; Function Attrs: nounwind uwtable
define double @_RV_frexp(%struct._RV_pmd* %exponent_pmd, double %x, i32* %exponent, i8* %file_name, i8* %func_name, i32 %e_line, i32 %e_col, i8* %e_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca double, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  store %struct._RV_pmd* %exponent_pmd, %struct._RV_pmd** %1, align 8
  store double %x, double* %2, align 8
  store i32* %exponent, i32** %3, align 8
  store i8* %file_name, i8** %4, align 8
  store i8* %func_name, i8** %5, align 8
  store i32 %e_line, i32* %6, align 4
  store i32 %e_col, i32* %7, align 4
  store i8* %e_name, i8** %8, align 8
  %9 = load %struct._RV_pmd** %1, align 8
  %10 = load i32** %3, align 8
  %11 = bitcast i32* %10 to i8*
  %12 = load i8** %4, align 8
  %13 = load i8** %5, align 8
  %14 = load i32* %6, align 4
  %15 = load i32* %7, align 4
  %16 = load i8** %8, align 8
  %zybc_ = bitcast %struct._RV_pmd* %9 to i8*
  %zybc_1 = bitcast i8* %11 to i8*
  %zyarg_ = inttoptr i64 4 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %12 to i8*
  %zybc_4 = bitcast i8* %13 to i8*
  %zyarg_5 = inttoptr i32 %14 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %15 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %16 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -66224697, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_5_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %17 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %17)
  %18 = load double* %2, align 8
  %19 = load i32** %3, align 8
  %20 = call double @frexp(double %18, i32* %19) #7
  call void @_Z4joinj(i32 -66224697)
  ret double %20
}

; Function Attrs: nounwind
declare double @frexp(double, i32*) #3

; Function Attrs: nounwind uwtable
define double @_RV_modf(%struct._RV_pmd* %integer_pmd, double %x, double* %integer, i8* %file_name, i8* %func_name, i32 %i_line, i32 %i_col, i8* %i_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca double, align 8
  %3 = alloca double*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  store %struct._RV_pmd* %integer_pmd, %struct._RV_pmd** %1, align 8
  store double %x, double* %2, align 8
  store double* %integer, double** %3, align 8
  store i8* %file_name, i8** %4, align 8
  store i8* %func_name, i8** %5, align 8
  store i32 %i_line, i32* %6, align 4
  store i32 %i_col, i32* %7, align 4
  store i8* %i_name, i8** %8, align 8
  %9 = load %struct._RV_pmd** %1, align 8
  %10 = load double** %3, align 8
  %11 = bitcast double* %10 to i8*
  %12 = load i8** %4, align 8
  %13 = load i8** %5, align 8
  %14 = load i32* %6, align 4
  %15 = load i32* %7, align 4
  %16 = load i8** %8, align 8
  %zybc_ = bitcast %struct._RV_pmd* %9 to i8*
  %zybc_1 = bitcast i8* %11 to i8*
  %zyarg_ = inttoptr i64 8 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %12 to i8*
  %zybc_4 = bitcast i8* %13 to i8*
  %zyarg_5 = inttoptr i32 %14 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %15 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %16 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 917253581, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_6_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %17 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %17)
  %18 = load double* %2, align 8
  %19 = load double** %3, align 8
  %20 = call double @modf(double %18, double* %19) #7
  call void @_Z4joinj(i32 917253581)
  ret double %20
}

; Function Attrs: nounwind
declare double @modf(double, double*) #3

; Function Attrs: nounwind uwtable
define %struct.passwd* @_RV_getpwnam(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %name_pmd, i8* %name, i8* %file_name, i8* %func_name, i32 %n_line, i32 %n_col, i8* %n_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %ret = alloca %struct.passwd*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %name_pmd, %struct._RV_pmd** %2, align 8
  store i8* %name, i8** %3, align 8
  store i8* %file_name, i8** %4, align 8
  store i8* %func_name, i8** %5, align 8
  store i32 %n_line, i32* %6, align 4
  store i32 %n_col, i32* %7, align 4
  store i8* %n_name, i8** %8, align 8
  %9 = load i8** %3, align 8
  %10 = icmp ne i8* %9, null
  br i1 %10, label %11, label %23

; <label>:11                                      ; preds = %0
  %12 = load %struct._RV_pmd** %2, align 8
  %13 = load i8** %3, align 8
  %14 = load i8** %3, align 8
  %15 = call i32 @_RV_sstrlen(i8* %14)
  %16 = add nsw i32 %15, 1
  %17 = sext i32 %16 to i64
  %18 = load i8** %4, align 8
  %19 = load i8** %5, align 8
  %20 = load i32* %6, align 4
  %21 = load i32* %7, align 4
  %22 = load i8** %8, align 8
  %zybc_ = bitcast %struct._RV_pmd* %12 to i8*
  %zybc_1 = bitcast i8* %13 to i8*
  %zyarg_ = inttoptr i64 %17 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %18 to i8*
  %zybc_4 = bitcast i8* %19 to i8*
  %zyarg_5 = inttoptr i32 %20 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %21 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %22 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 167752071, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_7_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  br label %23

; <label>:23                                      ; preds = %11, %0
  %24 = load i8** %3, align 8
  %25 = call %struct.passwd* @getpwnam(i8* %24)
  store %struct.passwd* %25, %struct.passwd** %ret, align 8
  %26 = load %struct.passwd** %ret, align 8
  %27 = icmp eq %struct.passwd* %26, null
  br i1 %27, label %28, label %30

; <label>:28                                      ; preds = %23
  %29 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %29)
  br label %124

; <label>:30                                      ; preds = %23
  %31 = load %struct._RV_pmd** %1, align 8
  %32 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %33 = load %struct.passwd** %ret, align 8
  %34 = bitcast %struct.passwd* %33 to i8*
  %35 = load %struct.passwd** %ret, align 8
  %36 = getelementptr inbounds %struct.passwd* %35, i64 1
  %37 = bitcast %struct.passwd* %36 to i8*
  %38 = call %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %31, %struct._RV_stat_node* %32, i32 0, i8* %34, i8* %37)
  %39 = load %struct.passwd** %ret, align 8
  %40 = getelementptr inbounds %struct.passwd* %39, i32 0, i32 0
  %41 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %42 = load %struct.passwd** %ret, align 8
  %43 = getelementptr inbounds %struct.passwd* %42, i32 0, i32 0
  %44 = load i8** %43, align 8
  %45 = load %struct.passwd** %ret, align 8
  %46 = getelementptr inbounds %struct.passwd* %45, i32 0, i32 0
  %47 = load i8** %46, align 8
  %48 = load %struct.passwd** %ret, align 8
  %49 = getelementptr inbounds %struct.passwd* %48, i32 0, i32 0
  %50 = load i8** %49, align 8
  %51 = call i32 @_RV_sstrlen(i8* %50)
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i8* %47, i64 %52
  %54 = getelementptr inbounds i8* %53, i64 1
  %55 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %40, %struct._RV_stat_node* %41, i8* %44, i8* %54)
  %56 = load %struct.passwd** %ret, align 8
  %57 = getelementptr inbounds %struct.passwd* %56, i32 0, i32 1
  %58 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %59 = load %struct.passwd** %ret, align 8
  %60 = getelementptr inbounds %struct.passwd* %59, i32 0, i32 1
  %61 = load i8** %60, align 8
  %62 = load %struct.passwd** %ret, align 8
  %63 = getelementptr inbounds %struct.passwd* %62, i32 0, i32 1
  %64 = load i8** %63, align 8
  %65 = load %struct.passwd** %ret, align 8
  %66 = getelementptr inbounds %struct.passwd* %65, i32 0, i32 1
  %67 = load i8** %66, align 8
  %68 = call i32 @_RV_sstrlen(i8* %67)
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8* %64, i64 %69
  %71 = getelementptr inbounds i8* %70, i64 1
  %72 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %57, %struct._RV_stat_node* %58, i8* %61, i8* %71)
  %73 = load %struct.passwd** %ret, align 8
  %74 = getelementptr inbounds %struct.passwd* %73, i32 0, i32 4
  %75 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %76 = load %struct.passwd** %ret, align 8
  %77 = getelementptr inbounds %struct.passwd* %76, i32 0, i32 4
  %78 = load i8** %77, align 8
  %79 = load %struct.passwd** %ret, align 8
  %80 = getelementptr inbounds %struct.passwd* %79, i32 0, i32 4
  %81 = load i8** %80, align 8
  %82 = load %struct.passwd** %ret, align 8
  %83 = getelementptr inbounds %struct.passwd* %82, i32 0, i32 4
  %84 = load i8** %83, align 8
  %85 = call i32 @_RV_sstrlen(i8* %84)
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i8* %81, i64 %86
  %88 = getelementptr inbounds i8* %87, i64 1
  %89 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %74, %struct._RV_stat_node* %75, i8* %78, i8* %88)
  %90 = load %struct.passwd** %ret, align 8
  %91 = getelementptr inbounds %struct.passwd* %90, i32 0, i32 5
  %92 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %93 = load %struct.passwd** %ret, align 8
  %94 = getelementptr inbounds %struct.passwd* %93, i32 0, i32 5
  %95 = load i8** %94, align 8
  %96 = load %struct.passwd** %ret, align 8
  %97 = getelementptr inbounds %struct.passwd* %96, i32 0, i32 5
  %98 = load i8** %97, align 8
  %99 = load %struct.passwd** %ret, align 8
  %100 = getelementptr inbounds %struct.passwd* %99, i32 0, i32 5
  %101 = load i8** %100, align 8
  %102 = call i32 @_RV_sstrlen(i8* %101)
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i8* %98, i64 %103
  %105 = getelementptr inbounds i8* %104, i64 1
  %106 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %91, %struct._RV_stat_node* %92, i8* %95, i8* %105)
  %107 = load %struct.passwd** %ret, align 8
  %108 = getelementptr inbounds %struct.passwd* %107, i32 0, i32 6
  %109 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %110 = load %struct.passwd** %ret, align 8
  %111 = getelementptr inbounds %struct.passwd* %110, i32 0, i32 6
  %112 = load i8** %111, align 8
  %113 = load %struct.passwd** %ret, align 8
  %114 = getelementptr inbounds %struct.passwd* %113, i32 0, i32 6
  %115 = load i8** %114, align 8
  %116 = load %struct.passwd** %ret, align 8
  %117 = getelementptr inbounds %struct.passwd* %116, i32 0, i32 6
  %118 = load i8** %117, align 8
  %119 = call i32 @_RV_sstrlen(i8* %118)
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i8* %115, i64 %120
  %122 = getelementptr inbounds i8* %121, i64 1
  %123 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %108, %struct._RV_stat_node* %109, i8* %112, i8* %122)
  br label %124

; <label>:124                                     ; preds = %30, %28
  call void @_Z4joinj(i32 167752071)
  %125 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %125)
  %126 = load %struct.passwd** %ret, align 8
  ret %struct.passwd* %126
}

declare %struct.passwd* @getpwnam(i8*) #1

; Function Attrs: nounwind uwtable
define %struct.passwd* @_RV_getpwuid(%struct._RV_pmd* %ret_pmd, i32 %uid) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i32, align 4
  %ret = alloca %struct.passwd*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store i32 %uid, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = call %struct.passwd* @getpwuid(i32 %3)
  store %struct.passwd* %4, %struct.passwd** %ret, align 8
  %5 = load %struct.passwd** %ret, align 8
  %6 = icmp eq %struct.passwd* %5, null
  br i1 %6, label %7, label %9

; <label>:7                                       ; preds = %0
  %8 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %8)
  br label %103

; <label>:9                                       ; preds = %0
  %10 = load %struct._RV_pmd** %1, align 8
  %11 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %12 = load %struct.passwd** %ret, align 8
  %13 = bitcast %struct.passwd* %12 to i8*
  %14 = load %struct.passwd** %ret, align 8
  %15 = getelementptr inbounds %struct.passwd* %14, i64 1
  %16 = bitcast %struct.passwd* %15 to i8*
  %17 = call %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %10, %struct._RV_stat_node* %11, i32 0, i8* %13, i8* %16)
  %18 = load %struct.passwd** %ret, align 8
  %19 = getelementptr inbounds %struct.passwd* %18, i32 0, i32 0
  %20 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %21 = load %struct.passwd** %ret, align 8
  %22 = getelementptr inbounds %struct.passwd* %21, i32 0, i32 0
  %23 = load i8** %22, align 8
  %24 = load %struct.passwd** %ret, align 8
  %25 = getelementptr inbounds %struct.passwd* %24, i32 0, i32 0
  %26 = load i8** %25, align 8
  %27 = load %struct.passwd** %ret, align 8
  %28 = getelementptr inbounds %struct.passwd* %27, i32 0, i32 0
  %29 = load i8** %28, align 8
  %30 = call i32 @_RV_sstrlen(i8* %29)
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i8* %26, i64 %31
  %33 = getelementptr inbounds i8* %32, i64 1
  %34 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %19, %struct._RV_stat_node* %20, i8* %23, i8* %33)
  %35 = load %struct.passwd** %ret, align 8
  %36 = getelementptr inbounds %struct.passwd* %35, i32 0, i32 1
  %37 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %38 = load %struct.passwd** %ret, align 8
  %39 = getelementptr inbounds %struct.passwd* %38, i32 0, i32 1
  %40 = load i8** %39, align 8
  %41 = load %struct.passwd** %ret, align 8
  %42 = getelementptr inbounds %struct.passwd* %41, i32 0, i32 1
  %43 = load i8** %42, align 8
  %44 = load %struct.passwd** %ret, align 8
  %45 = getelementptr inbounds %struct.passwd* %44, i32 0, i32 1
  %46 = load i8** %45, align 8
  %47 = call i32 @_RV_sstrlen(i8* %46)
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i8* %43, i64 %48
  %50 = getelementptr inbounds i8* %49, i64 1
  %51 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %36, %struct._RV_stat_node* %37, i8* %40, i8* %50)
  %52 = load %struct.passwd** %ret, align 8
  %53 = getelementptr inbounds %struct.passwd* %52, i32 0, i32 4
  %54 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %55 = load %struct.passwd** %ret, align 8
  %56 = getelementptr inbounds %struct.passwd* %55, i32 0, i32 4
  %57 = load i8** %56, align 8
  %58 = load %struct.passwd** %ret, align 8
  %59 = getelementptr inbounds %struct.passwd* %58, i32 0, i32 4
  %60 = load i8** %59, align 8
  %61 = load %struct.passwd** %ret, align 8
  %62 = getelementptr inbounds %struct.passwd* %61, i32 0, i32 4
  %63 = load i8** %62, align 8
  %64 = call i32 @_RV_sstrlen(i8* %63)
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i8* %60, i64 %65
  %67 = getelementptr inbounds i8* %66, i64 1
  %68 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %53, %struct._RV_stat_node* %54, i8* %57, i8* %67)
  %69 = load %struct.passwd** %ret, align 8
  %70 = getelementptr inbounds %struct.passwd* %69, i32 0, i32 5
  %71 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %72 = load %struct.passwd** %ret, align 8
  %73 = getelementptr inbounds %struct.passwd* %72, i32 0, i32 5
  %74 = load i8** %73, align 8
  %75 = load %struct.passwd** %ret, align 8
  %76 = getelementptr inbounds %struct.passwd* %75, i32 0, i32 5
  %77 = load i8** %76, align 8
  %78 = load %struct.passwd** %ret, align 8
  %79 = getelementptr inbounds %struct.passwd* %78, i32 0, i32 5
  %80 = load i8** %79, align 8
  %81 = call i32 @_RV_sstrlen(i8* %80)
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i8* %77, i64 %82
  %84 = getelementptr inbounds i8* %83, i64 1
  %85 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %70, %struct._RV_stat_node* %71, i8* %74, i8* %84)
  %86 = load %struct.passwd** %ret, align 8
  %87 = getelementptr inbounds %struct.passwd* %86, i32 0, i32 6
  %88 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %89 = load %struct.passwd** %ret, align 8
  %90 = getelementptr inbounds %struct.passwd* %89, i32 0, i32 6
  %91 = load i8** %90, align 8
  %92 = load %struct.passwd** %ret, align 8
  %93 = getelementptr inbounds %struct.passwd* %92, i32 0, i32 6
  %94 = load i8** %93, align 8
  %95 = load %struct.passwd** %ret, align 8
  %96 = getelementptr inbounds %struct.passwd* %95, i32 0, i32 6
  %97 = load i8** %96, align 8
  %98 = call i32 @_RV_sstrlen(i8* %97)
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i8* %94, i64 %99
  %101 = getelementptr inbounds i8* %100, i64 1
  %102 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %87, %struct._RV_stat_node* %88, i8* %91, i8* %101)
  br label %103

; <label>:103                                     ; preds = %9, %7
  %104 = load %struct.passwd** %ret, align 8
  ret %struct.passwd* %104
}

declare %struct.passwd* @getpwuid(i32) #1

; Function Attrs: nounwind uwtable
define %struct.passwd* @_RV_getpwent(%struct._RV_pmd* %ret_pmd) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %ret = alloca %struct.passwd*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  %2 = call %struct.passwd* @getpwent()
  store %struct.passwd* %2, %struct.passwd** %ret, align 8
  %3 = load %struct.passwd** %ret, align 8
  %4 = icmp eq %struct.passwd* %3, null
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %6)
  br label %101

; <label>:7                                       ; preds = %0
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %10 = load %struct.passwd** %ret, align 8
  %11 = bitcast %struct.passwd* %10 to i8*
  %12 = load %struct.passwd** %ret, align 8
  %13 = getelementptr inbounds %struct.passwd* %12, i64 1
  %14 = bitcast %struct.passwd* %13 to i8*
  %15 = call %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %8, %struct._RV_stat_node* %9, i32 0, i8* %11, i8* %14)
  %16 = load %struct.passwd** %ret, align 8
  %17 = getelementptr inbounds %struct.passwd* %16, i32 0, i32 0
  %18 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %19 = load %struct.passwd** %ret, align 8
  %20 = getelementptr inbounds %struct.passwd* %19, i32 0, i32 0
  %21 = load i8** %20, align 8
  %22 = load %struct.passwd** %ret, align 8
  %23 = getelementptr inbounds %struct.passwd* %22, i32 0, i32 0
  %24 = load i8** %23, align 8
  %25 = load %struct.passwd** %ret, align 8
  %26 = getelementptr inbounds %struct.passwd* %25, i32 0, i32 0
  %27 = load i8** %26, align 8
  %28 = call i32 @_RV_sstrlen(i8* %27)
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i8* %24, i64 %29
  %31 = getelementptr inbounds i8* %30, i64 1
  %32 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %17, %struct._RV_stat_node* %18, i8* %21, i8* %31)
  %33 = load %struct.passwd** %ret, align 8
  %34 = getelementptr inbounds %struct.passwd* %33, i32 0, i32 1
  %35 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %36 = load %struct.passwd** %ret, align 8
  %37 = getelementptr inbounds %struct.passwd* %36, i32 0, i32 1
  %38 = load i8** %37, align 8
  %39 = load %struct.passwd** %ret, align 8
  %40 = getelementptr inbounds %struct.passwd* %39, i32 0, i32 1
  %41 = load i8** %40, align 8
  %42 = load %struct.passwd** %ret, align 8
  %43 = getelementptr inbounds %struct.passwd* %42, i32 0, i32 1
  %44 = load i8** %43, align 8
  %45 = call i32 @_RV_sstrlen(i8* %44)
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8* %41, i64 %46
  %48 = getelementptr inbounds i8* %47, i64 1
  %49 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %34, %struct._RV_stat_node* %35, i8* %38, i8* %48)
  %50 = load %struct.passwd** %ret, align 8
  %51 = getelementptr inbounds %struct.passwd* %50, i32 0, i32 4
  %52 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %53 = load %struct.passwd** %ret, align 8
  %54 = getelementptr inbounds %struct.passwd* %53, i32 0, i32 4
  %55 = load i8** %54, align 8
  %56 = load %struct.passwd** %ret, align 8
  %57 = getelementptr inbounds %struct.passwd* %56, i32 0, i32 4
  %58 = load i8** %57, align 8
  %59 = load %struct.passwd** %ret, align 8
  %60 = getelementptr inbounds %struct.passwd* %59, i32 0, i32 4
  %61 = load i8** %60, align 8
  %62 = call i32 @_RV_sstrlen(i8* %61)
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8* %58, i64 %63
  %65 = getelementptr inbounds i8* %64, i64 1
  %66 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %51, %struct._RV_stat_node* %52, i8* %55, i8* %65)
  %67 = load %struct.passwd** %ret, align 8
  %68 = getelementptr inbounds %struct.passwd* %67, i32 0, i32 5
  %69 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %70 = load %struct.passwd** %ret, align 8
  %71 = getelementptr inbounds %struct.passwd* %70, i32 0, i32 5
  %72 = load i8** %71, align 8
  %73 = load %struct.passwd** %ret, align 8
  %74 = getelementptr inbounds %struct.passwd* %73, i32 0, i32 5
  %75 = load i8** %74, align 8
  %76 = load %struct.passwd** %ret, align 8
  %77 = getelementptr inbounds %struct.passwd* %76, i32 0, i32 5
  %78 = load i8** %77, align 8
  %79 = call i32 @_RV_sstrlen(i8* %78)
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i8* %75, i64 %80
  %82 = getelementptr inbounds i8* %81, i64 1
  %83 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %68, %struct._RV_stat_node* %69, i8* %72, i8* %82)
  %84 = load %struct.passwd** %ret, align 8
  %85 = getelementptr inbounds %struct.passwd* %84, i32 0, i32 6
  %86 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %87 = load %struct.passwd** %ret, align 8
  %88 = getelementptr inbounds %struct.passwd* %87, i32 0, i32 6
  %89 = load i8** %88, align 8
  %90 = load %struct.passwd** %ret, align 8
  %91 = getelementptr inbounds %struct.passwd* %90, i32 0, i32 6
  %92 = load i8** %91, align 8
  %93 = load %struct.passwd** %ret, align 8
  %94 = getelementptr inbounds %struct.passwd* %93, i32 0, i32 6
  %95 = load i8** %94, align 8
  %96 = call i32 @_RV_sstrlen(i8* %95)
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i8* %92, i64 %97
  %99 = getelementptr inbounds i8* %98, i64 1
  %100 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** %85, %struct._RV_stat_node* %86, i8* %89, i8* %99)
  br label %101

; <label>:101                                     ; preds = %7, %5
  %102 = load %struct.passwd** %ret, align 8
  ret %struct.passwd* %102
}

declare %struct.passwd* @getpwent() #1

; Function Attrs: nounwind uwtable
define void @_RV_longjmp(%struct._RV_pmd* %env_pmd, %struct.__jmp_buf_tag* %env, i32 %value, i8* %file_name, i8* %func_name, i32 %e_line, i32 %e_col, i8* %e_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct.__jmp_buf_tag*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  store %struct._RV_pmd* %env_pmd, %struct._RV_pmd** %1, align 8
  store %struct.__jmp_buf_tag* %env, %struct.__jmp_buf_tag** %2, align 8
  store i32 %value, i32* %3, align 4
  store i8* %file_name, i8** %4, align 8
  store i8* %func_name, i8** %5, align 8
  store i32 %e_line, i32* %6, align 4
  store i32 %e_col, i32* %7, align 4
  store i8* %e_name, i8** %8, align 8
  %9 = load %struct._RV_pmd** %1, align 8
  %10 = load %struct.__jmp_buf_tag** %2, align 8
  %11 = bitcast %struct.__jmp_buf_tag* %10 to i8*
  %12 = load i8** %4, align 8
  %13 = load i8** %5, align 8
  %14 = load i32* %6, align 4
  %15 = load i32* %7, align 4
  %16 = load i8** %8, align 8
  %zybc_ = bitcast %struct._RV_pmd* %9 to i8*
  %zybc_1 = bitcast i8* %11 to i8*
  %zyarg_ = inttoptr i64 200 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %12 to i8*
  %zybc_4 = bitcast i8* %13 to i8*
  %zyarg_5 = inttoptr i32 %14 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %15 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %16 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -699731330, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_8_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %17 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %17)
  %18 = load %struct.__jmp_buf_tag** %2, align 8
  %19 = load i32* %3, align 4
  call void @longjmp(%struct.__jmp_buf_tag* %18, i32 %19) #8
  unreachable
                                                  ; No predecessors!
  call void @_Z4joinj(i32 -699731330)
  ret void
}

; Function Attrs: noreturn nounwind
declare void @longjmp(%struct.__jmp_buf_tag*, i32) #4

; Function Attrs: nounwind uwtable
define void (i32)* @_RV_signal(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %handler_pmd, i32 %signum, void (i32)* %handler, i8* %file_name, i8* %func_name, i32 %h_line, i32 %h_col, i8* %h_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i32, align 4
  %4 = alloca void (i32)*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %ret = alloca void (i32)*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %handler_pmd, %struct._RV_pmd** %2, align 8
  store i32 %signum, i32* %3, align 4
  store void (i32)* %handler, void (i32)** %4, align 8
  store i8* %file_name, i8** %5, align 8
  store i8* %func_name, i8** %6, align 8
  store i32 %h_line, i32* %7, align 4
  store i32 %h_col, i32* %8, align 4
  store i8* %h_name, i8** %9, align 8
  %10 = load %struct._RV_pmd** %2, align 8
  %11 = load void (i32)** %4, align 8
  %12 = bitcast void (i32)* %11 to i8*
  %13 = load i8** %5, align 8
  %14 = load i8** %6, align 8
  %15 = load i32* %7, align 4
  %16 = load i32* %8, align 4
  %17 = load i8** %9, align 8
  %18 = call i8* @_RV_check_dpfv(%struct._RV_pmd* %10, i8* %12, i8* %13, i8* %14, i32 %15, i32 %16, i8* %17)
  %19 = load i32* %3, align 4
  %20 = load void (i32)** %4, align 8
  %21 = call void (i32)* (i32, void (i32)*)* @signal(i32 %19, void (i32)* %20) #7
  store void (i32)* %21, void (i32)** %ret, align 8
  %22 = load void (i32)** %ret, align 8
  %23 = icmp eq void (i32)* %22, null
  br i1 %23, label %24, label %26

; <label>:24                                      ; preds = %0
  %25 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %25)
  br label %35

; <label>:26                                      ; preds = %0
  %27 = load %struct._RV_pmd** %1, align 8
  %28 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %29 = load void (i32)** %ret, align 8
  %30 = bitcast void (i32)* %29 to i8*
  %31 = load void (i32)** %ret, align 8
  %32 = bitcast void (i32)* %31 to i8*
  %33 = getelementptr inbounds i8* %32, i64 1
  %34 = call %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %27, %struct._RV_stat_node* %28, i32 0, i8* %30, i8* %33)
  br label %35

; <label>:35                                      ; preds = %26, %24
  %36 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %36)
  %37 = load void (i32)** %ret, align 8
  ret void (i32)* %37
}

; Function Attrs: nounwind
declare void (i32)* @signal(i32, void (i32)*) #3

; Function Attrs: nounwind uwtable
define i32 @_RV_fstat(%struct._RV_pmd* %buf_pmd, i32 %fd, %struct.stat* %buf, i8* %file_name, i8* %func_name, i32 %b_line, i32 %b_col, i8* %b_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i32, align 4
  %3 = alloca %struct.stat*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  store %struct._RV_pmd* %buf_pmd, %struct._RV_pmd** %1, align 8
  store i32 %fd, i32* %2, align 4
  store %struct.stat* %buf, %struct.stat** %3, align 8
  store i8* %file_name, i8** %4, align 8
  store i8* %func_name, i8** %5, align 8
  store i32 %b_line, i32* %6, align 4
  store i32 %b_col, i32* %7, align 4
  store i8* %b_name, i8** %8, align 8
  %9 = load %struct._RV_pmd** %1, align 8
  %10 = load %struct.stat** %3, align 8
  %11 = bitcast %struct.stat* %10 to i8*
  %12 = load i8** %4, align 8
  %13 = load i8** %5, align 8
  %14 = load i32* %6, align 4
  %15 = load i32* %7, align 4
  %16 = load i8** %8, align 8
  %zybc_ = bitcast %struct._RV_pmd* %9 to i8*
  %zybc_1 = bitcast i8* %11 to i8*
  %zyarg_ = inttoptr i64 144 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %12 to i8*
  %zybc_4 = bitcast i8* %13 to i8*
  %zyarg_5 = inttoptr i32 %14 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %15 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %16 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 1109486736, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_9_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %17 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %17)
  %18 = load i32* %2, align 4
  %19 = load %struct.stat** %3, align 8
  %20 = call i32 @fstat(i32 %18, %struct.stat* %19) #7
  call void @_Z4joinj(i32 1109486736)
  ret i32 %20
}

; Function Attrs: nounwind
declare i32 @fstat(i32, %struct.stat*) #3

; Function Attrs: nounwind uwtable
define i32 @_RV_fclose(%struct._RV_pmd* %fp_pmd, %struct._IO_FILE* %fp, i8* %file_name, i8* %func_name, i32 %f_line, i32 %f_col, i8* %f_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store %struct._RV_pmd* %fp_pmd, %struct._RV_pmd** %1, align 8
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %2, align 8
  store i8* %file_name, i8** %3, align 8
  store i8* %func_name, i8** %4, align 8
  store i32 %f_line, i32* %5, align 4
  store i32 %f_col, i32* %6, align 4
  store i8* %f_name, i8** %7, align 8
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load %struct._IO_FILE** %2, align 8
  %10 = bitcast %struct._IO_FILE* %9 to i8*
  %11 = load i8** %3, align 8
  %12 = load i8** %4, align 8
  %13 = load i32* %5, align 4
  %14 = load i32* %6, align 4
  %15 = load i8** %7, align 8
  %zybc_ = bitcast %struct._RV_pmd* %8 to i8*
  %zybc_1 = bitcast i8* %10 to i8*
  %zyarg_ = inttoptr i64 216 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %11 to i8*
  %zybc_4 = bitcast i8* %12 to i8*
  %zyarg_5 = inttoptr i32 %13 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %14 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %15 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -1509183673, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_10_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %16 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_stat(%struct._RV_pmd* %16, i32 0)
  %17 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %17)
  %18 = load %struct._IO_FILE** %2, align 8
  %19 = call i32 @fclose(%struct._IO_FILE* %18)
  call void @_Z4joinj(i32 -1509183673)
  ret i32 %19
}

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define void @_RV_clearerr(%struct._RV_pmd* %fp_pmd, %struct._IO_FILE* %fp, i8* %file_name, i8* %func_name, i32 %f_line, i32 %f_col, i8* %f_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store %struct._RV_pmd* %fp_pmd, %struct._RV_pmd** %1, align 8
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %2, align 8
  store i8* %file_name, i8** %3, align 8
  store i8* %func_name, i8** %4, align 8
  store i32 %f_line, i32* %5, align 4
  store i32 %f_col, i32* %6, align 4
  store i8* %f_name, i8** %7, align 8
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load %struct._IO_FILE** %2, align 8
  %10 = bitcast %struct._IO_FILE* %9 to i8*
  %11 = load i8** %3, align 8
  %12 = load i8** %4, align 8
  %13 = load i32* %5, align 4
  %14 = load i32* %6, align 4
  %15 = load i8** %7, align 8
  %zybc_ = bitcast %struct._RV_pmd* %8 to i8*
  %zybc_1 = bitcast i8* %10 to i8*
  %zyarg_ = inttoptr i64 216 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %11 to i8*
  %zybc_4 = bitcast i8* %12 to i8*
  %zyarg_5 = inttoptr i32 %13 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %14 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %15 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -402574752, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_11_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %16 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %16)
  %17 = load %struct._IO_FILE** %2, align 8
  call void @clearerr(%struct._IO_FILE* %17) #7
  call void @_Z4joinj(i32 -402574752)
  ret void
}

; Function Attrs: nounwind
declare void @clearerr(%struct._IO_FILE*) #3

; Function Attrs: nounwind uwtable
define i32 @_RV_feof(%struct._RV_pmd* %fp_pmd, %struct._IO_FILE* %fp, i8* %file_name, i8* %func_name, i32 %f_line, i32 %f_col, i8* %f_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store %struct._RV_pmd* %fp_pmd, %struct._RV_pmd** %1, align 8
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %2, align 8
  store i8* %file_name, i8** %3, align 8
  store i8* %func_name, i8** %4, align 8
  store i32 %f_line, i32* %5, align 4
  store i32 %f_col, i32* %6, align 4
  store i8* %f_name, i8** %7, align 8
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load %struct._IO_FILE** %2, align 8
  %10 = bitcast %struct._IO_FILE* %9 to i8*
  %11 = load i8** %3, align 8
  %12 = load i8** %4, align 8
  %13 = load i32* %5, align 4
  %14 = load i32* %6, align 4
  %15 = load i8** %7, align 8
  %zybc_ = bitcast %struct._RV_pmd* %8 to i8*
  %zybc_1 = bitcast i8* %10 to i8*
  %zyarg_ = inttoptr i64 216 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %11 to i8*
  %zybc_4 = bitcast i8* %12 to i8*
  %zyarg_5 = inttoptr i32 %13 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %14 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %15 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -507018482, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_12_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %16 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %16)
  %17 = load %struct._IO_FILE** %2, align 8
  %18 = call i32 @feof(%struct._IO_FILE* %17) #7
  call void @_Z4joinj(i32 -507018482)
  ret i32 %18
}

; Function Attrs: nounwind
declare i32 @feof(%struct._IO_FILE*) #3

; Function Attrs: nounwind uwtable
define i32 @_RV_ferror(%struct._RV_pmd* %fp_pmd, %struct._IO_FILE* %fp, i8* %file_name, i8* %func_name, i32 %f_line, i32 %f_col, i8* %f_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store %struct._RV_pmd* %fp_pmd, %struct._RV_pmd** %1, align 8
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %2, align 8
  store i8* %file_name, i8** %3, align 8
  store i8* %func_name, i8** %4, align 8
  store i32 %f_line, i32* %5, align 4
  store i32 %f_col, i32* %6, align 4
  store i8* %f_name, i8** %7, align 8
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load %struct._IO_FILE** %2, align 8
  %10 = bitcast %struct._IO_FILE* %9 to i8*
  %11 = load i8** %3, align 8
  %12 = load i8** %4, align 8
  %13 = load i32* %5, align 4
  %14 = load i32* %6, align 4
  %15 = load i8** %7, align 8
  %zybc_ = bitcast %struct._RV_pmd* %8 to i8*
  %zybc_1 = bitcast i8* %10 to i8*
  %zyarg_ = inttoptr i64 216 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %11 to i8*
  %zybc_4 = bitcast i8* %12 to i8*
  %zyarg_5 = inttoptr i32 %13 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %14 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %15 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -1768305463, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_13_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %16 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %16)
  %17 = load %struct._IO_FILE** %2, align 8
  %18 = call i32 @ferror(%struct._IO_FILE* %17) #7
  call void @_Z4joinj(i32 -1768305463)
  ret i32 %18
}

; Function Attrs: nounwind
declare i32 @ferror(%struct._IO_FILE*) #3

; Function Attrs: nounwind uwtable
define i32 @_RV_fflush(%struct._RV_pmd* %fp_pmd, %struct._IO_FILE* %fp, i8* %file_name, i8* %func_name, i32 %f_line, i32 %f_col, i8* %f_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store %struct._RV_pmd* %fp_pmd, %struct._RV_pmd** %1, align 8
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %2, align 8
  store i8* %file_name, i8** %3, align 8
  store i8* %func_name, i8** %4, align 8
  store i32 %f_line, i32* %5, align 4
  store i32 %f_col, i32* %6, align 4
  store i8* %f_name, i8** %7, align 8
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load %struct._IO_FILE** %2, align 8
  %10 = bitcast %struct._IO_FILE* %9 to i8*
  %11 = load i8** %3, align 8
  %12 = load i8** %4, align 8
  %13 = load i32* %5, align 4
  %14 = load i32* %6, align 4
  %15 = load i8** %7, align 8
  %zybc_ = bitcast %struct._RV_pmd* %8 to i8*
  %zybc_1 = bitcast i8* %10 to i8*
  %zyarg_ = inttoptr i64 216 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %11 to i8*
  %zybc_4 = bitcast i8* %12 to i8*
  %zyarg_5 = inttoptr i32 %13 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %14 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %15 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 1295253099, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_14_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %16 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %16)
  %17 = load %struct._IO_FILE** %2, align 8
  %18 = call i32 @fflush(%struct._IO_FILE* %17)
  call void @_Z4joinj(i32 1295253099)
  ret i32 %18
}

declare i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i32 @_RV_fgetpos(%struct._RV_pmd* %fp_pmd, %struct._RV_pmd* %pos_pmd, %struct._IO_FILE* %fp, %struct._G_fpos_t* %pos, i8* %file_name, i8* %func_name, i32 %f_line, i32 %f_col, i8* %f_name, i32 %p_line, i32 %p_col, i8* %p_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca %struct._G_fpos_t*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  store %struct._RV_pmd* %fp_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %pos_pmd, %struct._RV_pmd** %2, align 8
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %3, align 8
  store %struct._G_fpos_t* %pos, %struct._G_fpos_t** %4, align 8
  store i8* %file_name, i8** %5, align 8
  store i8* %func_name, i8** %6, align 8
  store i32 %f_line, i32* %7, align 4
  store i32 %f_col, i32* %8, align 4
  store i8* %f_name, i8** %9, align 8
  store i32 %p_line, i32* %10, align 4
  store i32 %p_col, i32* %11, align 4
  store i8* %p_name, i8** %12, align 8
  %13 = load %struct._RV_pmd** %1, align 8
  %14 = load %struct._IO_FILE** %3, align 8
  %15 = bitcast %struct._IO_FILE* %14 to i8*
  %16 = load i8** %5, align 8
  %17 = load i8** %6, align 8
  %18 = load i32* %7, align 4
  %19 = load i32* %8, align 4
  %20 = load i8** %9, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %13 to i8*
  %zybc_11 = bitcast i8* %15 to i8*
  %zyarg_12 = inttoptr i64 216 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %16 to i8*
  %zybc_15 = bitcast i8* %17 to i8*
  %zyarg_16 = inttoptr i32 %18 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %19 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %20 to i8*
  %21 = load %struct._RV_pmd** %2, align 8
  %22 = load %struct._G_fpos_t** %4, align 8
  %23 = bitcast %struct._G_fpos_t* %22 to i8*
  %24 = load i8** %5, align 8
  %25 = load i8** %6, align 8
  %26 = load i32* %10, align 4
  %27 = load i32* %11, align 4
  %28 = load i8** %12, align 8
  %zybc_ = bitcast %struct._RV_pmd* %21 to i8*
  %zybc_1 = bitcast i8* %23 to i8*
  %zyarg_ = inttoptr i64 16 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %24 to i8*
  %zybc_4 = bitcast i8* %25 to i8*
  %zyarg_5 = inttoptr i32 %26 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %27 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %28 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 1999051385, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_15_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %29 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %29)
  %30 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %30)
  %31 = load %struct._IO_FILE** %3, align 8
  %32 = load %struct._G_fpos_t** %4, align 8
  %33 = call i32 @fgetpos(%struct._IO_FILE* %31, %struct._G_fpos_t* %32)
  call void @_Z4joinj(i32 1999051385)
  ret i32 %33
}

declare i32 @fgetpos(%struct._IO_FILE*, %struct._G_fpos_t*) #1

; Function Attrs: nounwind uwtable
define %struct._IO_FILE* @_RV_fopen(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %filename_pmd, %struct._RV_pmd* %mode_pmd, i8* %filename, i8* %mode, i8* %file_name, i8* %func_name, i32 %f_line, i32 %f_col, i8* %f_name, i32 %m_line, i32 %m_col, i8* %m_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._RV_pmd*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %ret = alloca %struct._IO_FILE*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %filename_pmd, %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %mode_pmd, %struct._RV_pmd** %3, align 8
  store i8* %filename, i8** %4, align 8
  store i8* %mode, i8** %5, align 8
  store i8* %file_name, i8** %6, align 8
  store i8* %func_name, i8** %7, align 8
  store i32 %f_line, i32* %8, align 4
  store i32 %f_col, i32* %9, align 4
  store i8* %f_name, i8** %10, align 8
  store i32 %m_line, i32* %11, align 4
  store i32 %m_col, i32* %12, align 4
  store i8* %m_name, i8** %13, align 8
  %14 = load %struct._RV_pmd** %2, align 8
  %15 = load i8** %4, align 8
  %16 = load i8** %4, align 8
  %17 = call i32 @_RV_sstrlen(i8* %16)
  %18 = add nsw i32 %17, 1
  %19 = sext i32 %18 to i64
  %20 = load i8** %6, align 8
  %21 = load i8** %7, align 8
  %22 = load i32* %8, align 4
  %23 = load i32* %9, align 4
  %24 = load i8** %10, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %14 to i8*
  %zybc_11 = bitcast i8* %15 to i8*
  %zyarg_12 = inttoptr i64 %19 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %20 to i8*
  %zybc_15 = bitcast i8* %21 to i8*
  %zyarg_16 = inttoptr i32 %22 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %23 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %24 to i8*
  %25 = load %struct._RV_pmd** %3, align 8
  %26 = load i8** %5, align 8
  %27 = load i8** %5, align 8
  %28 = call i32 @_RV_sstrlen(i8* %27)
  %29 = add nsw i32 %28, 1
  %30 = sext i32 %29 to i64
  %31 = load i8** %6, align 8
  %32 = load i8** %7, align 8
  %33 = load i32* %11, align 4
  %34 = load i32* %12, align 4
  %35 = load i8** %13, align 8
  %zybc_ = bitcast %struct._RV_pmd* %25 to i8*
  %zybc_1 = bitcast i8* %26 to i8*
  %zyarg_ = inttoptr i64 %30 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %31 to i8*
  %zybc_4 = bitcast i8* %32 to i8*
  %zyarg_5 = inttoptr i32 %33 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %34 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %35 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 -1286366162, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_16_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %36 = load i8** %4, align 8
  %37 = load i8** %5, align 8
  %38 = call %struct._IO_FILE* @fopen(i8* %36, i8* %37)
  store %struct._IO_FILE* %38, %struct._IO_FILE** %ret, align 8
  %39 = load %struct._IO_FILE** %ret, align 8
  %40 = icmp eq %struct._IO_FILE* %39, null
  br i1 %40, label %41, label %43

; <label>:41                                      ; preds = %0
  %42 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %42)
  br label %51

; <label>:43                                      ; preds = %0
  %44 = load %struct._RV_pmd** %1, align 8
  %45 = load %struct._IO_FILE** %ret, align 8
  %46 = bitcast %struct._IO_FILE* %45 to i8*
  %47 = load %struct._IO_FILE** %ret, align 8
  %48 = getelementptr inbounds %struct._IO_FILE* %47, i64 1
  %49 = bitcast %struct._IO_FILE* %48 to i8*
  %50 = call %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %44, %struct._RV_stat_node* null, i32 4, i8* %46, i8* %49)
  br label %51

; <label>:51                                      ; preds = %43, %41
  call void @_Z4joinj(i32 -1286366162)
  %52 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %52)
  %53 = load %struct._RV_pmd** %3, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %53)
  %54 = load %struct._IO_FILE** %ret, align 8
  ret %struct._IO_FILE* %54
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

; Function Attrs: nounwind uwtable
define %struct._IO_FILE* @_RV_fdopen(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %mode_pmd, i32 %fd, i8* %mode, i8* %file_name, i8* %func_name, i32 %m_line, i32 %m_col, i8* %m_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %ret = alloca %struct._IO_FILE*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %mode_pmd, %struct._RV_pmd** %2, align 8
  store i32 %fd, i32* %3, align 4
  store i8* %mode, i8** %4, align 8
  store i8* %file_name, i8** %5, align 8
  store i8* %func_name, i8** %6, align 8
  store i32 %m_line, i32* %7, align 4
  store i32 %m_col, i32* %8, align 4
  store i8* %m_name, i8** %9, align 8
  %10 = load %struct._RV_pmd** %2, align 8
  %11 = load i8** %4, align 8
  %12 = load i8** %4, align 8
  %13 = call i32 @_RV_sstrlen(i8* %12)
  %14 = add nsw i32 %13, 1
  %15 = sext i32 %14 to i64
  %16 = load i8** %5, align 8
  %17 = load i8** %6, align 8
  %18 = load i32* %7, align 4
  %19 = load i32* %8, align 4
  %20 = load i8** %9, align 8
  %zybc_ = bitcast %struct._RV_pmd* %10 to i8*
  %zybc_1 = bitcast i8* %11 to i8*
  %zyarg_ = inttoptr i64 %15 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %16 to i8*
  %zybc_4 = bitcast i8* %17 to i8*
  %zyarg_5 = inttoptr i32 %18 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %19 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %20 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -661813585, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_17_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %21 = load i32* %3, align 4
  %22 = load i8** %4, align 8
  %23 = call %struct._IO_FILE* @fdopen(i32 %21, i8* %22) #7
  store %struct._IO_FILE* %23, %struct._IO_FILE** %ret, align 8
  %24 = load %struct._IO_FILE** %ret, align 8
  %25 = icmp eq %struct._IO_FILE* %24, null
  br i1 %25, label %26, label %28

; <label>:26                                      ; preds = %0
  %27 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %27)
  br label %36

; <label>:28                                      ; preds = %0
  %29 = load %struct._RV_pmd** %1, align 8
  %30 = load %struct._IO_FILE** %ret, align 8
  %31 = bitcast %struct._IO_FILE* %30 to i8*
  %32 = load %struct._IO_FILE** %ret, align 8
  %33 = getelementptr inbounds %struct._IO_FILE* %32, i64 1
  %34 = bitcast %struct._IO_FILE* %33 to i8*
  %35 = call %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %29, %struct._RV_stat_node* null, i32 4, i8* %31, i8* %34)
  br label %36

; <label>:36                                      ; preds = %28, %26
  call void @_Z4joinj(i32 -661813585)
  %37 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %37)
  %38 = load %struct._IO_FILE** %ret, align 8
  ret %struct._IO_FILE* %38
}

; Function Attrs: nounwind
declare %struct._IO_FILE* @fdopen(i32, i8*) #3

; Function Attrs: nounwind uwtable
define %struct._IO_FILE* @_RV_freopen(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %filename_pmd, %struct._RV_pmd* %mode_pmd, %struct._RV_pmd* %fp_pmd, i8* %filename, i8* %mode, %struct._IO_FILE* %fp, i8* %file_name, i8* %func_name, i32 %f_line, i32 %f_col, i8* %f_name, i32 %m_line, i32 %m_col, i8* %m_name, i32 %p_line, i32 %p_col, i8* %p_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._RV_pmd*, align 8
  %4 = alloca %struct._RV_pmd*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca %struct._IO_FILE*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i8*, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %ret = alloca %struct._IO_FILE*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %filename_pmd, %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %mode_pmd, %struct._RV_pmd** %3, align 8
  store %struct._RV_pmd* %fp_pmd, %struct._RV_pmd** %4, align 8
  store i8* %filename, i8** %5, align 8
  store i8* %mode, i8** %6, align 8
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %7, align 8
  store i8* %file_name, i8** %8, align 8
  store i8* %func_name, i8** %9, align 8
  store i32 %f_line, i32* %10, align 4
  store i32 %f_col, i32* %11, align 4
  store i8* %f_name, i8** %12, align 8
  store i32 %m_line, i32* %13, align 4
  store i32 %m_col, i32* %14, align 4
  store i8* %m_name, i8** %15, align 8
  store i32 %p_line, i32* %16, align 4
  store i32 %p_col, i32* %17, align 4
  store i8* %p_name, i8** %18, align 8
  %19 = load %struct._RV_pmd** %2, align 8
  %20 = load i8** %5, align 8
  %21 = load i8** %5, align 8
  %22 = call i32 @_RV_sstrlen(i8* %21)
  %23 = add nsw i32 %22, 1
  %24 = sext i32 %23 to i64
  %25 = load i8** %8, align 8
  %26 = load i8** %9, align 8
  %27 = load i32* %10, align 4
  %28 = load i32* %11, align 4
  %29 = load i8** %12, align 8
  %zybc_21 = bitcast %struct._RV_pmd* %19 to i8*
  %zybc_22 = bitcast i8* %20 to i8*
  %zyarg_23 = inttoptr i64 %24 to i8*
  %zybc_24 = bitcast i8* %zyarg_23 to i8*
  %zybc_25 = bitcast i8* %25 to i8*
  %zybc_26 = bitcast i8* %26 to i8*
  %zyarg_27 = inttoptr i32 %27 to i8*
  %zybc_28 = bitcast i8* %zyarg_27 to i8*
  %zyarg_29 = inttoptr i32 %28 to i8*
  %zybc_30 = bitcast i8* %zyarg_29 to i8*
  %zybc_31 = bitcast i8* %29 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 117593455, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_19_0, i8* %zybc_21, i8* %zybc_22, i8* %zybc_24, i8* %zybc_25, i8* %zybc_26, i8* %zybc_28, i8* %zybc_30, i8* %zybc_31)
  %30 = load %struct._RV_pmd** %3, align 8
  %31 = load i8** %6, align 8
  %32 = load i8** %6, align 8
  %33 = call i32 @_RV_sstrlen(i8* %32)
  %34 = add nsw i32 %33, 1
  %35 = sext i32 %34 to i64
  %36 = load i8** %8, align 8
  %37 = load i8** %9, align 8
  %38 = load i32* %13, align 4
  %39 = load i32* %14, align 4
  %40 = load i8** %15, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %30 to i8*
  %zybc_11 = bitcast i8* %31 to i8*
  %zyarg_12 = inttoptr i64 %35 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %36 to i8*
  %zybc_15 = bitcast i8* %37 to i8*
  %zyarg_16 = inttoptr i32 %38 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %39 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %40 to i8*
  %41 = load %struct._RV_pmd** %4, align 8
  %42 = load %struct._IO_FILE** %7, align 8
  %43 = bitcast %struct._IO_FILE* %42 to i8*
  %44 = load i8** %8, align 8
  %45 = load i8** %9, align 8
  %46 = load i32* %16, align 4
  %47 = load i32* %17, align 4
  %48 = load i8** %18, align 8
  %zybc_ = bitcast %struct._RV_pmd* %41 to i8*
  %zybc_1 = bitcast i8* %43 to i8*
  %zyarg_ = inttoptr i64 216 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %44 to i8*
  %zybc_4 = bitcast i8* %45 to i8*
  %zyarg_5 = inttoptr i32 %46 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %47 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %48 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 1431561994, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_18_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %49 = load i8** %5, align 8
  %50 = load i8** %6, align 8
  %51 = load %struct._IO_FILE** %7, align 8
  %52 = call %struct._IO_FILE* @freopen(i8* %49, i8* %50, %struct._IO_FILE* %51)
  store %struct._IO_FILE* %52, %struct._IO_FILE** %ret, align 8
  %53 = load %struct._IO_FILE** %ret, align 8
  %54 = icmp eq %struct._IO_FILE* %53, null
  br i1 %54, label %55, label %57

; <label>:55                                      ; preds = %0
  %56 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %56)
  br label %65

; <label>:57                                      ; preds = %0
  %58 = load %struct._RV_pmd** %1, align 8
  %59 = load %struct._IO_FILE** %ret, align 8
  %60 = bitcast %struct._IO_FILE* %59 to i8*
  %61 = load %struct._IO_FILE** %ret, align 8
  %62 = getelementptr inbounds %struct._IO_FILE* %61, i64 1
  %63 = bitcast %struct._IO_FILE* %62 to i8*
  %64 = call %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %58, %struct._RV_stat_node* null, i32 4, i8* %60, i8* %63)
  br label %65

; <label>:65                                      ; preds = %57, %55
  call void @_Z4joinj(i32 1431561994)
  call void @_Z4joinj(i32 117593455)
  %66 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %66)
  %67 = load %struct._RV_pmd** %3, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %67)
  %68 = load %struct._RV_pmd** %4, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %68)
  %69 = load %struct._IO_FILE** %ret, align 8
  ret %struct._IO_FILE* %69
}

declare %struct._IO_FILE* @freopen(i8*, i8*, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i32 @_RV_fileno(%struct._RV_pmd* %fp_pmd, %struct._IO_FILE* %fp, i8* %file_name, i8* %func_name, i32 %f_line, i32 %f_col, i8* %f_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store %struct._RV_pmd* %fp_pmd, %struct._RV_pmd** %1, align 8
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %2, align 8
  store i8* %file_name, i8** %3, align 8
  store i8* %func_name, i8** %4, align 8
  store i32 %f_line, i32* %5, align 4
  store i32 %f_col, i32* %6, align 4
  store i8* %f_name, i8** %7, align 8
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load %struct._IO_FILE** %2, align 8
  %10 = bitcast %struct._IO_FILE* %9 to i8*
  %11 = load i8** %3, align 8
  %12 = load i8** %4, align 8
  %13 = load i32* %5, align 4
  %14 = load i32* %6, align 4
  %15 = load i8** %7, align 8
  %zybc_ = bitcast %struct._RV_pmd* %8 to i8*
  %zybc_1 = bitcast i8* %10 to i8*
  %zyarg_ = inttoptr i64 216 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %11 to i8*
  %zybc_4 = bitcast i8* %12 to i8*
  %zyarg_5 = inttoptr i32 %13 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %14 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %15 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -2074611112, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_20_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %16 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %16)
  %17 = load %struct._IO_FILE** %2, align 8
  %18 = call i32 @fileno(%struct._IO_FILE* %17) #7
  call void @_Z4joinj(i32 -2074611112)
  ret i32 %18
}

; Function Attrs: nounwind
declare i32 @fileno(%struct._IO_FILE*) #3

; Function Attrs: nounwind uwtable
define i64 @_RV_fread(%struct._RV_pmd* %ptr_pmd, %struct._RV_pmd* %fp_pmd, i8* %ptr, i64 %size, i64 %nmemb, %struct._IO_FILE* %fp, i8* %file_name, i8* %func_name, i32 %p_line, i32 %p_col, i8* %p_name, i32 %f_line, i32 %f_col, i8* %f_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i8*, align 8
  store %struct._RV_pmd* %ptr_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %fp_pmd, %struct._RV_pmd** %2, align 8
  store i8* %ptr, i8** %3, align 8
  store i64 %size, i64* %4, align 8
  store i64 %nmemb, i64* %5, align 8
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %6, align 8
  store i8* %file_name, i8** %7, align 8
  store i8* %func_name, i8** %8, align 8
  store i32 %p_line, i32* %9, align 4
  store i32 %p_col, i32* %10, align 4
  store i8* %p_name, i8** %11, align 8
  store i32 %f_line, i32* %12, align 4
  store i32 %f_col, i32* %13, align 4
  store i8* %f_name, i8** %14, align 8
  %15 = load %struct._RV_pmd** %1, align 8
  %16 = load i8** %3, align 8
  %17 = load i64* %4, align 8
  %18 = load i64* %5, align 8
  %19 = mul i64 %17, %18
  %20 = load i8** %7, align 8
  %21 = load i8** %8, align 8
  %22 = load i32* %9, align 4
  %23 = load i32* %10, align 4
  %24 = load i8** %11, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %15 to i8*
  %zybc_11 = bitcast i8* %16 to i8*
  %zyarg_12 = inttoptr i64 %19 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %20 to i8*
  %zybc_15 = bitcast i8* %21 to i8*
  %zyarg_16 = inttoptr i32 %22 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %23 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %24 to i8*
  %25 = load %struct._RV_pmd** %2, align 8
  %26 = load %struct._IO_FILE** %6, align 8
  %27 = bitcast %struct._IO_FILE* %26 to i8*
  %28 = load i8** %7, align 8
  %29 = load i8** %8, align 8
  %30 = load i32* %12, align 4
  %31 = load i32* %13, align 4
  %32 = load i8** %14, align 8
  %zybc_ = bitcast %struct._RV_pmd* %25 to i8*
  %zybc_1 = bitcast i8* %27 to i8*
  %zyarg_ = inttoptr i64 216 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %28 to i8*
  %zybc_4 = bitcast i8* %29 to i8*
  %zyarg_5 = inttoptr i32 %30 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %31 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %32 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 1689584292, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_21_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %33 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %33)
  %34 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %34)
  %35 = load i8** %3, align 8
  %36 = load i64* %4, align 8
  %37 = load i64* %5, align 8
  %38 = load %struct._IO_FILE** %6, align 8
  %39 = call i64 @fread(i8* %35, i64 %36, i64 %37, %struct._IO_FILE* %38)
  call void @_Z4joinj(i32 1689584292)
  ret i64 %39
}

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i32 @_RV_fseek(%struct._RV_pmd* %fp_pmd, %struct._IO_FILE* %fp, i64 %offset, i32 %whence, i8* %file_name, i8* %func_name, i32 %f_line, i32 %f_col, i8* %f_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  store %struct._RV_pmd* %fp_pmd, %struct._RV_pmd** %1, align 8
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %2, align 8
  store i64 %offset, i64* %3, align 8
  store i32 %whence, i32* %4, align 4
  store i8* %file_name, i8** %5, align 8
  store i8* %func_name, i8** %6, align 8
  store i32 %f_line, i32* %7, align 4
  store i32 %f_col, i32* %8, align 4
  store i8* %f_name, i8** %9, align 8
  %10 = load %struct._RV_pmd** %1, align 8
  %11 = load %struct._IO_FILE** %2, align 8
  %12 = bitcast %struct._IO_FILE* %11 to i8*
  %13 = load i8** %5, align 8
  %14 = load i8** %6, align 8
  %15 = load i32* %7, align 4
  %16 = load i32* %8, align 4
  %17 = load i8** %9, align 8
  %zybc_ = bitcast %struct._RV_pmd* %10 to i8*
  %zybc_1 = bitcast i8* %12 to i8*
  %zyarg_ = inttoptr i64 216 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %13 to i8*
  %zybc_4 = bitcast i8* %14 to i8*
  %zyarg_5 = inttoptr i32 %15 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %16 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %17 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -1579963749, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_22_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %18 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %18)
  %19 = load %struct._IO_FILE** %2, align 8
  %20 = load i64* %3, align 8
  %21 = load i32* %4, align 4
  %22 = call i32 @fseek(%struct._IO_FILE* %19, i64 %20, i32 %21)
  call void @_Z4joinj(i32 -1579963749)
  ret i32 %22
}

declare i32 @fseek(%struct._IO_FILE*, i64, i32) #1

; Function Attrs: nounwind uwtable
define i32 @_RV_fsetpos(%struct._RV_pmd* %fp_pmd, %struct._RV_pmd* %pos_pmd, %struct._IO_FILE* %fp, %struct._G_fpos_t* %pos, i8* %file_name, i8* %func_name, i32 %f_line, i32 %f_col, i8* %f_name, i32 %p_line, i32 %p_col, i8* %p_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca %struct._G_fpos_t*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  store %struct._RV_pmd* %fp_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %pos_pmd, %struct._RV_pmd** %2, align 8
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %3, align 8
  store %struct._G_fpos_t* %pos, %struct._G_fpos_t** %4, align 8
  store i8* %file_name, i8** %5, align 8
  store i8* %func_name, i8** %6, align 8
  store i32 %f_line, i32* %7, align 4
  store i32 %f_col, i32* %8, align 4
  store i8* %f_name, i8** %9, align 8
  store i32 %p_line, i32* %10, align 4
  store i32 %p_col, i32* %11, align 4
  store i8* %p_name, i8** %12, align 8
  %13 = load %struct._RV_pmd** %1, align 8
  %14 = load %struct._IO_FILE** %3, align 8
  %15 = bitcast %struct._IO_FILE* %14 to i8*
  %16 = load i8** %5, align 8
  %17 = load i8** %6, align 8
  %18 = load i32* %7, align 4
  %19 = load i32* %8, align 4
  %20 = load i8** %9, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %13 to i8*
  %zybc_11 = bitcast i8* %15 to i8*
  %zyarg_12 = inttoptr i64 216 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %16 to i8*
  %zybc_15 = bitcast i8* %17 to i8*
  %zyarg_16 = inttoptr i32 %18 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %19 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %20 to i8*
  %21 = load %struct._RV_pmd** %2, align 8
  %22 = load %struct._G_fpos_t** %4, align 8
  %23 = bitcast %struct._G_fpos_t* %22 to i8*
  %24 = load i8** %5, align 8
  %25 = load i8** %6, align 8
  %26 = load i32* %10, align 4
  %27 = load i32* %11, align 4
  %28 = load i8** %12, align 8
  %zybc_ = bitcast %struct._RV_pmd* %21 to i8*
  %zybc_1 = bitcast i8* %23 to i8*
  %zyarg_ = inttoptr i64 16 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %24 to i8*
  %zybc_4 = bitcast i8* %25 to i8*
  %zyarg_5 = inttoptr i32 %26 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %27 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %28 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 1186086133, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_23_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %29 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %29)
  %30 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %30)
  %31 = load %struct._IO_FILE** %3, align 8
  %32 = load %struct._G_fpos_t** %4, align 8
  %33 = call i32 @fsetpos(%struct._IO_FILE* %31, %struct._G_fpos_t* %32)
  call void @_Z4joinj(i32 1186086133)
  ret i32 %33
}

declare i32 @fsetpos(%struct._IO_FILE*, %struct._G_fpos_t*) #1

; Function Attrs: nounwind uwtable
define i64 @_RV_ftell(%struct._RV_pmd* %fp_pmd, %struct._IO_FILE* %fp, i8* %file_name, i8* %func_name, i32 %f_line, i32 %f_col, i8* %f_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store %struct._RV_pmd* %fp_pmd, %struct._RV_pmd** %1, align 8
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %2, align 8
  store i8* %file_name, i8** %3, align 8
  store i8* %func_name, i8** %4, align 8
  store i32 %f_line, i32* %5, align 4
  store i32 %f_col, i32* %6, align 4
  store i8* %f_name, i8** %7, align 8
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load %struct._IO_FILE** %2, align 8
  %10 = bitcast %struct._IO_FILE* %9 to i8*
  %11 = load i8** %3, align 8
  %12 = load i8** %4, align 8
  %13 = load i32* %5, align 4
  %14 = load i32* %6, align 4
  %15 = load i8** %7, align 8
  %zybc_ = bitcast %struct._RV_pmd* %8 to i8*
  %zybc_1 = bitcast i8* %10 to i8*
  %zyarg_ = inttoptr i64 216 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %11 to i8*
  %zybc_4 = bitcast i8* %12 to i8*
  %zyarg_5 = inttoptr i32 %13 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %14 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %15 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 659609909, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_24_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %16 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %16)
  %17 = load %struct._IO_FILE** %2, align 8
  %18 = call i64 @ftell(%struct._IO_FILE* %17)
  call void @_Z4joinj(i32 659609909)
  ret i64 %18
}

declare i64 @ftell(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i64 @_RV_fwrite(%struct._RV_pmd* %ptr_pmd, %struct._RV_pmd* %fp_pmd, i8* %ptr, i64 %size, i64 %nmemb, %struct._IO_FILE* %fp, i8* %file_name, i8* %func_name, i32 %p_line, i32 %p_col, i8* %p_name, i32 %f_line, i32 %f_col, i8* %f_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i8*, align 8
  store %struct._RV_pmd* %ptr_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %fp_pmd, %struct._RV_pmd** %2, align 8
  store i8* %ptr, i8** %3, align 8
  store i64 %size, i64* %4, align 8
  store i64 %nmemb, i64* %5, align 8
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %6, align 8
  store i8* %file_name, i8** %7, align 8
  store i8* %func_name, i8** %8, align 8
  store i32 %p_line, i32* %9, align 4
  store i32 %p_col, i32* %10, align 4
  store i8* %p_name, i8** %11, align 8
  store i32 %f_line, i32* %12, align 4
  store i32 %f_col, i32* %13, align 4
  store i8* %f_name, i8** %14, align 8
  %15 = load %struct._RV_pmd** %1, align 8
  %16 = load i8** %3, align 8
  %17 = load i64* %4, align 8
  %18 = load i64* %5, align 8
  %19 = mul i64 %17, %18
  %20 = load i8** %7, align 8
  %21 = load i8** %8, align 8
  %22 = load i32* %9, align 4
  %23 = load i32* %10, align 4
  %24 = load i8** %11, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %15 to i8*
  %zybc_11 = bitcast i8* %16 to i8*
  %zyarg_12 = inttoptr i64 %19 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %20 to i8*
  %zybc_15 = bitcast i8* %21 to i8*
  %zyarg_16 = inttoptr i32 %22 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %23 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %24 to i8*
  %25 = load %struct._RV_pmd** %2, align 8
  %26 = load %struct._IO_FILE** %6, align 8
  %27 = bitcast %struct._IO_FILE* %26 to i8*
  %28 = load i8** %7, align 8
  %29 = load i8** %8, align 8
  %30 = load i32* %12, align 4
  %31 = load i32* %13, align 4
  %32 = load i8** %14, align 8
  %zybc_ = bitcast %struct._RV_pmd* %25 to i8*
  %zybc_1 = bitcast i8* %27 to i8*
  %zyarg_ = inttoptr i64 216 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %28 to i8*
  %zybc_4 = bitcast i8* %29 to i8*
  %zyarg_5 = inttoptr i32 %30 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %31 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %32 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 -135868465, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_25_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %33 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %33)
  %34 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %34)
  %35 = load i8** %3, align 8
  %36 = load i64* %4, align 8
  %37 = load i64* %5, align 8
  %38 = load %struct._IO_FILE** %6, align 8
  %39 = call i64 @fwrite(i8* %35, i64 %36, i64 %37, %struct._IO_FILE* %38)
  call void @_Z4joinj(i32 -135868465)
  ret i64 %39
}

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i32 @_RV_remove(%struct._RV_pmd* %filename_pmd, i8* %filename, i8* %file_name, i8* %func_name, i32 %f_line, i32 %f_col, i8* %f_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store %struct._RV_pmd* %filename_pmd, %struct._RV_pmd** %1, align 8
  store i8* %filename, i8** %2, align 8
  store i8* %file_name, i8** %3, align 8
  store i8* %func_name, i8** %4, align 8
  store i32 %f_line, i32* %5, align 4
  store i32 %f_col, i32* %6, align 4
  store i8* %f_name, i8** %7, align 8
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load i8** %2, align 8
  %10 = load i8** %2, align 8
  %11 = call i32 @_RV_sstrlen(i8* %10)
  %12 = add nsw i32 %11, 1
  %13 = sext i32 %12 to i64
  %14 = load i8** %3, align 8
  %15 = load i8** %4, align 8
  %16 = load i32* %5, align 4
  %17 = load i32* %6, align 4
  %18 = load i8** %7, align 8
  %zybc_ = bitcast %struct._RV_pmd* %8 to i8*
  %zybc_1 = bitcast i8* %9 to i8*
  %zyarg_ = inttoptr i64 %13 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %14 to i8*
  %zybc_4 = bitcast i8* %15 to i8*
  %zyarg_5 = inttoptr i32 %16 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %17 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %18 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -139422630, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_26_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %19 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %19)
  %20 = load i8** %2, align 8
  %21 = call i32 @remove(i8* %20) #7
  call void @_Z4joinj(i32 -139422630)
  ret i32 %21
}

; Function Attrs: nounwind
declare i32 @remove(i8*) #3

; Function Attrs: nounwind uwtable
define i32 @_RV_rename(%struct._RV_pmd* %old_pmd, %struct._RV_pmd* %new_pmd, i8* %old_filename, i8* %new_filename, i8* %file_name, i8* %func_name, i32 %f_line, i32 %f_col, i8* %f_name, i32 %n_line, i32 %n_col, i8* %n_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  store %struct._RV_pmd* %old_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %new_pmd, %struct._RV_pmd** %2, align 8
  store i8* %old_filename, i8** %3, align 8
  store i8* %new_filename, i8** %4, align 8
  store i8* %file_name, i8** %5, align 8
  store i8* %func_name, i8** %6, align 8
  store i32 %f_line, i32* %7, align 4
  store i32 %f_col, i32* %8, align 4
  store i8* %f_name, i8** %9, align 8
  store i32 %n_line, i32* %10, align 4
  store i32 %n_col, i32* %11, align 4
  store i8* %n_name, i8** %12, align 8
  %13 = load %struct._RV_pmd** %1, align 8
  %14 = load i8** %3, align 8
  %15 = load i8** %3, align 8
  %16 = call i32 @_RV_sstrlen(i8* %15)
  %17 = add nsw i32 %16, 1
  %18 = sext i32 %17 to i64
  %19 = load i8** %5, align 8
  %20 = load i8** %6, align 8
  %21 = load i32* %7, align 4
  %22 = load i32* %8, align 4
  %23 = load i8** %9, align 8
  %zybc_ = bitcast %struct._RV_pmd* %13 to i8*
  %zybc_1 = bitcast i8* %14 to i8*
  %zyarg_ = inttoptr i64 %18 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %19 to i8*
  %zybc_4 = bitcast i8* %20 to i8*
  %zyarg_5 = inttoptr i32 %21 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %22 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %23 to i8*
  %24 = load %struct._RV_pmd** %2, align 8
  %25 = load i8** %4, align 8
  %26 = load i8** %4, align 8
  %27 = call i32 @_RV_sstrlen(i8* %26)
  %28 = add nsw i32 %27, 1
  %29 = sext i32 %28 to i64
  %30 = load i8** %5, align 8
  %31 = load i8** %6, align 8
  %32 = load i32* %10, align 4
  %33 = load i32* %11, align 4
  %34 = load i8** %12, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %24 to i8*
  %zybc_11 = bitcast i8* %25 to i8*
  %zyarg_12 = inttoptr i64 %29 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %30 to i8*
  %zybc_15 = bitcast i8* %31 to i8*
  %zyarg_16 = inttoptr i32 %32 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %33 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %34 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 1584975176, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_27_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %35 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %35)
  %36 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %36)
  %37 = load i8** %3, align 8
  %38 = load i8** %4, align 8
  %39 = call i32 @rename(i8* %37, i8* %38) #7
  call void @_Z4joinj(i32 1584975176)
  ret i32 %39
}

; Function Attrs: nounwind
declare i32 @rename(i8*, i8*) #3

; Function Attrs: nounwind uwtable
define void @_RV_rewind(%struct._RV_pmd* %fp_pmd, %struct._IO_FILE* %fp, i8* %file_name, i8* %func_name, i32 %f_line, i32 %f_col, i8* %f_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store %struct._RV_pmd* %fp_pmd, %struct._RV_pmd** %1, align 8
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %2, align 8
  store i8* %file_name, i8** %3, align 8
  store i8* %func_name, i8** %4, align 8
  store i32 %f_line, i32* %5, align 4
  store i32 %f_col, i32* %6, align 4
  store i8* %f_name, i8** %7, align 8
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load %struct._IO_FILE** %2, align 8
  %10 = bitcast %struct._IO_FILE* %9 to i8*
  %11 = load i8** %3, align 8
  %12 = load i8** %4, align 8
  %13 = load i32* %5, align 4
  %14 = load i32* %6, align 4
  %15 = load i8** %7, align 8
  %zybc_ = bitcast %struct._RV_pmd* %8 to i8*
  %zybc_1 = bitcast i8* %10 to i8*
  %zyarg_ = inttoptr i64 216 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %11 to i8*
  %zybc_4 = bitcast i8* %12 to i8*
  %zyarg_5 = inttoptr i32 %13 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %14 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %15 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 1351571453, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_28_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %16 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %16)
  %17 = load %struct._IO_FILE** %2, align 8
  call void @rewind(%struct._IO_FILE* %17)
  call void @_Z4joinj(i32 1351571453)
  ret void
}

declare void @rewind(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define void @_RV_setbuf(%struct._RV_pmd* %fp_pmd, %struct._RV_pmd* %buffer_pmd, %struct._IO_FILE* %fp, i8* %buffer, i8* %file_name, i8* %func_name, i32 %f_line, i32 %f_col, i8* %f_name, i32 %b_line, i32 %b_col, i8* %b_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  store %struct._RV_pmd* %fp_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %buffer_pmd, %struct._RV_pmd** %2, align 8
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %3, align 8
  store i8* %buffer, i8** %4, align 8
  store i8* %file_name, i8** %5, align 8
  store i8* %func_name, i8** %6, align 8
  store i32 %f_line, i32* %7, align 4
  store i32 %f_col, i32* %8, align 4
  store i8* %f_name, i8** %9, align 8
  store i32 %b_line, i32* %10, align 4
  store i32 %b_col, i32* %11, align 4
  store i8* %b_name, i8** %12, align 8
  %13 = load %struct._RV_pmd** %1, align 8
  %14 = load %struct._IO_FILE** %3, align 8
  %15 = bitcast %struct._IO_FILE* %14 to i8*
  %16 = load i8** %5, align 8
  %17 = load i8** %6, align 8
  %18 = load i32* %7, align 4
  %19 = load i32* %8, align 4
  %20 = load i8** %9, align 8
  %zybc_ = bitcast %struct._RV_pmd* %13 to i8*
  %zybc_1 = bitcast i8* %15 to i8*
  %zyarg_ = inttoptr i64 216 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %16 to i8*
  %zybc_4 = bitcast i8* %17 to i8*
  %zyarg_5 = inttoptr i32 %18 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %19 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %20 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -756976418, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_29_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %21 = load i8** %4, align 8
  %22 = icmp ne i8* %21, null
  br i1 %22, label %23, label %31

; <label>:23                                      ; preds = %0
  %24 = load %struct._RV_pmd** %2, align 8
  %25 = load i8** %4, align 8
  %26 = load i8** %5, align 8
  %27 = load i8** %6, align 8
  %28 = load i32* %10, align 4
  %29 = load i32* %11, align 4
  %30 = load i8** %12, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %24 to i8*
  %zybc_11 = bitcast i8* %25 to i8*
  %zyarg_12 = inttoptr i64 1 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %26 to i8*
  %zybc_15 = bitcast i8* %27 to i8*
  %zyarg_16 = inttoptr i32 %28 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %29 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %30 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -706776208, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_30_0, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  br label %31

; <label>:31                                      ; preds = %23, %0
  call void @_Z4joinj(i32 -756976418)
  call void @_Z4joinj(i32 -706776208)
  %32 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %32)
  %33 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %33)
  %34 = load %struct._IO_FILE** %3, align 8
  %35 = load i8** %4, align 8
  call void @setbuf(%struct._IO_FILE* %34, i8* %35) #7
  ret void
}

; Function Attrs: nounwind
declare void @setbuf(%struct._IO_FILE*, i8*) #3

; Function Attrs: nounwind uwtable
define i32 @_RV_setvbuf(%struct._RV_pmd* %fp_pmd, %struct._RV_pmd* %buffer_pmd, %struct._IO_FILE* %fp, i8* %buffer, i32 %mode, i64 %size, i8* %file_name, i8* %func_name, i32 %f_line, i32 %f_col, i8* %f_name, i32 %b_line, i32 %b_col, i8* %b_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i8*, align 8
  store %struct._RV_pmd* %fp_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %buffer_pmd, %struct._RV_pmd** %2, align 8
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %3, align 8
  store i8* %buffer, i8** %4, align 8
  store i32 %mode, i32* %5, align 4
  store i64 %size, i64* %6, align 8
  store i8* %file_name, i8** %7, align 8
  store i8* %func_name, i8** %8, align 8
  store i32 %f_line, i32* %9, align 4
  store i32 %f_col, i32* %10, align 4
  store i8* %f_name, i8** %11, align 8
  store i32 %b_line, i32* %12, align 4
  store i32 %b_col, i32* %13, align 4
  store i8* %b_name, i8** %14, align 8
  %15 = load %struct._RV_pmd** %1, align 8
  %16 = load %struct._IO_FILE** %3, align 8
  %17 = bitcast %struct._IO_FILE* %16 to i8*
  %18 = load i8** %7, align 8
  %19 = load i8** %8, align 8
  %20 = load i32* %9, align 4
  %21 = load i32* %10, align 4
  %22 = load i8** %11, align 8
  %zybc_ = bitcast %struct._RV_pmd* %15 to i8*
  %zybc_1 = bitcast i8* %17 to i8*
  %zyarg_ = inttoptr i64 216 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %18 to i8*
  %zybc_4 = bitcast i8* %19 to i8*
  %zyarg_5 = inttoptr i32 %20 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %21 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %22 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -1786313706, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_31_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %23 = load i8** %4, align 8
  %24 = icmp ne i8* %23, null
  br i1 %24, label %25, label %34

; <label>:25                                      ; preds = %0
  %26 = load %struct._RV_pmd** %2, align 8
  %27 = load i8** %4, align 8
  %28 = load i64* %6, align 8
  %29 = load i8** %7, align 8
  %30 = load i8** %8, align 8
  %31 = load i32* %12, align 4
  %32 = load i32* %13, align 4
  %33 = load i8** %14, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %26 to i8*
  %zybc_11 = bitcast i8* %27 to i8*
  %zyarg_12 = inttoptr i64 %28 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %29 to i8*
  %zybc_15 = bitcast i8* %30 to i8*
  %zyarg_16 = inttoptr i32 %31 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %32 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %33 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 1856192954, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_32_0, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  br label %34

; <label>:34                                      ; preds = %25, %0
  call void @_Z4joinj(i32 -1786313706)
  call void @_Z4joinj(i32 1856192954)
  %35 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %35)
  %36 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %36)
  %37 = load %struct._IO_FILE** %3, align 8
  %38 = load i8** %4, align 8
  %39 = load i32* %5, align 4
  %40 = load i64* %6, align 8
  %41 = call i32 @setvbuf(%struct._IO_FILE* %37, i8* %38, i32 %39, i64 %40) #7
  ret i32 %41
}

; Function Attrs: nounwind
declare i32 @setvbuf(%struct._IO_FILE*, i8*, i32, i64) #3

; Function Attrs: nounwind uwtable
define %struct._IO_FILE* @_RV_tmpfile(%struct._RV_pmd* %ret_pmd) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %ret = alloca %struct._IO_FILE*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  %2 = call %struct._IO_FILE* @tmpfile()
  store %struct._IO_FILE* %2, %struct._IO_FILE** %ret, align 8
  %3 = load %struct._IO_FILE** %ret, align 8
  %4 = icmp eq %struct._IO_FILE* %3, null
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %6)
  br label %15

; <label>:7                                       ; preds = %0
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load %struct._IO_FILE** %ret, align 8
  %10 = bitcast %struct._IO_FILE* %9 to i8*
  %11 = load %struct._IO_FILE** %ret, align 8
  %12 = getelementptr inbounds %struct._IO_FILE* %11, i64 1
  %13 = bitcast %struct._IO_FILE* %12 to i8*
  %14 = call %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %8, %struct._RV_stat_node* null, i32 4, i8* %10, i8* %13)
  br label %15

; <label>:15                                      ; preds = %7, %5
  %16 = load %struct._IO_FILE** %ret, align 8
  ret %struct._IO_FILE* %16
}

declare %struct._IO_FILE* @tmpfile() #1

; Function Attrs: nounwind uwtable
define i8* @_RV_tmpnam(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %str_pmd, i8* %str, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %ret = alloca i8*, align 8
  %fd = alloca i32, align 4
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %str_pmd, %struct._RV_pmd** %2, align 8
  store i8* %str, i8** %3, align 8
  store i8* %file_name, i8** %4, align 8
  store i8* %func_name, i8** %5, align 8
  store i32 %s_line, i32* %6, align 4
  store i32 %s_col, i32* %7, align 4
  store i8* %s_name, i8** %8, align 8
  %9 = load %struct._RV_pmd** %2, align 8
  %10 = load i8** %3, align 8
  %11 = load i8** %3, align 8
  %12 = call i32 @_RV_sstrlen(i8* %11)
  %13 = add nsw i32 %12, 1
  %14 = sext i32 %13 to i64
  %15 = load i8** %4, align 8
  %16 = load i8** %5, align 8
  %17 = load i32* %6, align 4
  %18 = load i32* %7, align 4
  %19 = load i8** %8, align 8
  %zybc_ = bitcast %struct._RV_pmd* %9 to i8*
  %zybc_1 = bitcast i8* %10 to i8*
  %zyarg_ = inttoptr i64 %14 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %15 to i8*
  %zybc_4 = bitcast i8* %16 to i8*
  %zyarg_5 = inttoptr i32 %17 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %18 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %19 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 853028308, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_33_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %20 = call i32 @mkstemp(i8* getelementptr inbounds ([20 x i8]* @_RV_tmpnam.temp_file, i32 0, i32 0))
  store i32 %20, i32* %fd, align 4
  %21 = call i32 @unlink(i8* getelementptr inbounds ([20 x i8]* @_RV_tmpnam.temp_file, i32 0, i32 0)) #7
  %22 = load i32* %fd, align 4
  %23 = call i32 @close(i32 %22)
  %24 = load i8** %3, align 8
  %25 = icmp eq i8* %24, null
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %0
  store i8* getelementptr inbounds ([20 x i8]* @_RV_tmpnam.temp_file, i32 0, i32 0), i8** %ret, align 8
  br label %31

; <label>:27                                      ; preds = %0
  %28 = load i8** %3, align 8
  %29 = call i8* @strcpy(i8* %28, i8* getelementptr inbounds ([20 x i8]* @_RV_tmpnam.temp_file, i32 0, i32 0)) #7
  %30 = load i8** %3, align 8
  store i8* %30, i8** %ret, align 8
  br label %31

; <label>:31                                      ; preds = %27, %26
  %32 = load i8** %ret, align 8
  %33 = icmp eq i8* %32, null
  br i1 %33, label %34, label %36

; <label>:34                                      ; preds = %31
  %35 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %35)
  br label %47

; <label>:36                                      ; preds = %31
  %37 = load %struct._RV_pmd** %1, align 8
  %38 = load %struct._RV_stat_node** @_RV_static_sa, align 8
  %39 = load i8** %ret, align 8
  %40 = load i8** %ret, align 8
  %41 = load i8** %ret, align 8
  %42 = call i32 @_RV_sstrlen(i8* %41)
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i8* %40, i64 %43
  %45 = getelementptr inbounds i8* %44, i64 1
  %46 = call %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %37, %struct._RV_stat_node* %38, i32 0, i8* %39, i8* %45)
  br label %47

; <label>:47                                      ; preds = %36, %34
  call void @_Z4joinj(i32 853028308)
  %48 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %48)
  %49 = load i8** %ret, align 8
  ret i8* %49
}

declare i32 @mkstemp(i8*) #1

; Function Attrs: nounwind
declare i32 @unlink(i8*) #3

declare i32 @close(i32) #1

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #3

; Function Attrs: nounwind uwtable
define i32 @_RV_vfprintf(%struct._RV_pmd* %fp_pmd, %struct._RV_pmd* %format_pmd, %struct._RV_pmd* %arg_va_list, %struct._RV_pmd* %arg_pmd, %struct._IO_FILE* %fp, i8* %format, %struct.__va_list_tag* %arg, i8* %file_name, i8* %func_name, i32 %f_line, i32 %f_col, i8* %f_name, i32 %r_line, i32 %r_col, i8* %r_name, i32 %a_line, i32 %a_col, i8* %a_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._RV_pmd*, align 8
  %4 = alloca %struct._RV_pmd*, align 8
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca %struct.__va_list_tag*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i8*, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  store %struct._RV_pmd* %fp_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %format_pmd, %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %arg_va_list, %struct._RV_pmd** %3, align 8
  store %struct._RV_pmd* %arg_pmd, %struct._RV_pmd** %4, align 8
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %5, align 8
  store i8* %format, i8** %6, align 8
  store %struct.__va_list_tag* %arg, %struct.__va_list_tag** %7, align 8
  store i8* %file_name, i8** %8, align 8
  store i8* %func_name, i8** %9, align 8
  store i32 %f_line, i32* %10, align 4
  store i32 %f_col, i32* %11, align 4
  store i8* %f_name, i8** %12, align 8
  store i32 %r_line, i32* %13, align 4
  store i32 %r_col, i32* %14, align 4
  store i8* %r_name, i8** %15, align 8
  store i32 %a_line, i32* %16, align 4
  store i32 %a_col, i32* %17, align 4
  store i8* %a_name, i8** %18, align 8
  %19 = load %struct._RV_pmd** %1, align 8
  %20 = load %struct._IO_FILE** %5, align 8
  %21 = bitcast %struct._IO_FILE* %20 to i8*
  %22 = load i8** %8, align 8
  %23 = load i8** %9, align 8
  %24 = load i32* %10, align 4
  %25 = load i32* %11, align 4
  %26 = load i8** %12, align 8
  %zybc_21 = bitcast %struct._RV_pmd* %19 to i8*
  %zybc_22 = bitcast i8* %21 to i8*
  %zyarg_23 = inttoptr i64 216 to i8*
  %zybc_24 = bitcast i8* %zyarg_23 to i8*
  %zybc_25 = bitcast i8* %22 to i8*
  %zybc_26 = bitcast i8* %23 to i8*
  %zyarg_27 = inttoptr i32 %24 to i8*
  %zybc_28 = bitcast i8* %zyarg_27 to i8*
  %zyarg_29 = inttoptr i32 %25 to i8*
  %zybc_30 = bitcast i8* %zyarg_29 to i8*
  %zybc_31 = bitcast i8* %26 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -327518032, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_35_0, i8* %zybc_21, i8* %zybc_22, i8* %zybc_24, i8* %zybc_25, i8* %zybc_26, i8* %zybc_28, i8* %zybc_30, i8* %zybc_31)
  %27 = load %struct._RV_pmd** %2, align 8
  %28 = load i8** %6, align 8
  %29 = load i8** %6, align 8
  %30 = call i32 @_RV_sstrlen(i8* %29)
  %31 = add nsw i32 %30, 1
  %32 = sext i32 %31 to i64
  %33 = load i8** %8, align 8
  %34 = load i8** %9, align 8
  %35 = load i32* %13, align 4
  %36 = load i32* %14, align 4
  %37 = load i8** %15, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %27 to i8*
  %zybc_11 = bitcast i8* %28 to i8*
  %zyarg_12 = inttoptr i64 %32 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %33 to i8*
  %zybc_15 = bitcast i8* %34 to i8*
  %zyarg_16 = inttoptr i32 %35 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %36 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %37 to i8*
  %38 = load %struct._RV_pmd** %4, align 8
  %39 = load %struct.__va_list_tag** %7, align 8
  %40 = bitcast %struct.__va_list_tag* %39 to i8*
  %41 = load i8** %8, align 8
  %42 = load i8** %9, align 8
  %43 = load i32* %16, align 4
  %44 = load i32* %17, align 4
  %45 = load i8** %18, align 8
  %zybc_ = bitcast %struct._RV_pmd* %38 to i8*
  %zybc_1 = bitcast i8* %40 to i8*
  %zyarg_ = inttoptr i64 24 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %41 to i8*
  %zybc_4 = bitcast i8* %42 to i8*
  %zyarg_5 = inttoptr i32 %43 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %44 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %45 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 1172638896, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_34_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %46 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %46)
  %47 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %47)
  %48 = load %struct._RV_pmd** %3, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %48)
  %49 = load %struct._RV_pmd** %4, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %49)
  %50 = load %struct._IO_FILE** %5, align 8
  %51 = load i8** %6, align 8
  %52 = load %struct.__va_list_tag** %7, align 8
  %53 = call i32 @vfprintf(%struct._IO_FILE* %50, i8* %51, %struct.__va_list_tag* %52)
  call void @_Z4joinj(i32 1172638896)
  call void @_Z4joinj(i32 -327518032)
  ret i32 %53
}

declare i32 @vfprintf(%struct._IO_FILE*, i8*, %struct.__va_list_tag*) #1

; Function Attrs: nounwind uwtable
define i32 @_RV_vprintf(%struct._RV_pmd* %format_pmd, %struct._RV_pmd* %arg_va_list, %struct._RV_pmd* %arg_pmd, i8* %format, %struct.__va_list_tag* %arg, i8* %file_name, i8* %func_name, i32 %f_line, i32 %f_col, i8* %f_name, i32 %a_line, i32 %a_col, i8* %a_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._RV_pmd*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca %struct.__va_list_tag*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  store %struct._RV_pmd* %format_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %arg_va_list, %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %arg_pmd, %struct._RV_pmd** %3, align 8
  store i8* %format, i8** %4, align 8
  store %struct.__va_list_tag* %arg, %struct.__va_list_tag** %5, align 8
  store i8* %file_name, i8** %6, align 8
  store i8* %func_name, i8** %7, align 8
  store i32 %f_line, i32* %8, align 4
  store i32 %f_col, i32* %9, align 4
  store i8* %f_name, i8** %10, align 8
  store i32 %a_line, i32* %11, align 4
  store i32 %a_col, i32* %12, align 4
  store i8* %a_name, i8** %13, align 8
  %14 = load %struct._RV_pmd** %1, align 8
  %15 = load i8** %4, align 8
  %16 = load i8** %4, align 8
  %17 = call i32 @_RV_sstrlen(i8* %16)
  %18 = add nsw i32 %17, 1
  %19 = sext i32 %18 to i64
  %20 = load i8** %6, align 8
  %21 = load i8** %7, align 8
  %22 = load i32* %8, align 4
  %23 = load i32* %9, align 4
  %24 = load i8** %10, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %14 to i8*
  %zybc_11 = bitcast i8* %15 to i8*
  %zyarg_12 = inttoptr i64 %19 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %20 to i8*
  %zybc_15 = bitcast i8* %21 to i8*
  %zyarg_16 = inttoptr i32 %22 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %23 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %24 to i8*
  %25 = load %struct._RV_pmd** %3, align 8
  %26 = load %struct.__va_list_tag** %5, align 8
  %27 = bitcast %struct.__va_list_tag* %26 to i8*
  %28 = load i8** %6, align 8
  %29 = load i8** %7, align 8
  %30 = load i32* %11, align 4
  %31 = load i32* %12, align 4
  %32 = load i8** %13, align 8
  %zybc_ = bitcast %struct._RV_pmd* %25 to i8*
  %zybc_1 = bitcast i8* %27 to i8*
  %zyarg_ = inttoptr i64 24 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %28 to i8*
  %zybc_4 = bitcast i8* %29 to i8*
  %zyarg_5 = inttoptr i32 %30 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %31 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %32 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 1108430936, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_36_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %33 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %33)
  %34 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %34)
  %35 = load %struct._RV_pmd** %3, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %35)
  %36 = load i8** %4, align 8
  %37 = load %struct.__va_list_tag** %5, align 8
  %38 = call i32 @vprintf(i8* %36, %struct.__va_list_tag* %37)
  call void @_Z4joinj(i32 1108430936)
  ret i32 %38
}

declare i32 @vprintf(i8*, %struct.__va_list_tag*) #1

; Function Attrs: nounwind uwtable
define i32 @_RV_vsprintf(%struct._RV_pmd* %str_pmd, %struct._RV_pmd* %format_pmd, %struct._RV_pmd* %arg_va_list, %struct._RV_pmd* %arg_pmd, i8* %str, i8* %format, %struct.__va_list_tag* %arg, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name, i32 %f_line, i32 %f_col, i8* %f_name, i32 %a_line, i32 %a_col, i8* %a_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._RV_pmd*, align 8
  %4 = alloca %struct._RV_pmd*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca %struct.__va_list_tag*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i8*, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %buffer = alloca [8192 x i8], align 16
  %ret = alloca i32, align 4
  store %struct._RV_pmd* %str_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %format_pmd, %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %arg_va_list, %struct._RV_pmd** %3, align 8
  store %struct._RV_pmd* %arg_pmd, %struct._RV_pmd** %4, align 8
  store i8* %str, i8** %5, align 8
  store i8* %format, i8** %6, align 8
  store %struct.__va_list_tag* %arg, %struct.__va_list_tag** %7, align 8
  store i8* %file_name, i8** %8, align 8
  store i8* %func_name, i8** %9, align 8
  store i32 %s_line, i32* %10, align 4
  store i32 %s_col, i32* %11, align 4
  store i8* %s_name, i8** %12, align 8
  store i32 %f_line, i32* %13, align 4
  store i32 %f_col, i32* %14, align 4
  store i8* %f_name, i8** %15, align 8
  store i32 %a_line, i32* %16, align 4
  store i32 %a_col, i32* %17, align 4
  store i8* %a_name, i8** %18, align 8
  %19 = load %struct._RV_pmd** %2, align 8
  %20 = load i8** %6, align 8
  %21 = load i8** %6, align 8
  %22 = call i32 @_RV_sstrlen(i8* %21)
  %23 = add nsw i32 %22, 1
  %24 = sext i32 %23 to i64
  %25 = load i8** %8, align 8
  %26 = load i8** %9, align 8
  %27 = load i32* %13, align 4
  %28 = load i32* %14, align 4
  %29 = load i8** %15, align 8
  %zybc_21 = bitcast %struct._RV_pmd* %19 to i8*
  %zybc_22 = bitcast i8* %20 to i8*
  %zyarg_23 = inttoptr i64 %24 to i8*
  %zybc_24 = bitcast i8* %zyarg_23 to i8*
  %zybc_25 = bitcast i8* %25 to i8*
  %zybc_26 = bitcast i8* %26 to i8*
  %zyarg_27 = inttoptr i32 %27 to i8*
  %zybc_28 = bitcast i8* %zyarg_27 to i8*
  %zyarg_29 = inttoptr i32 %28 to i8*
  %zybc_30 = bitcast i8* %zyarg_29 to i8*
  %zybc_31 = bitcast i8* %29 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 832313954, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_38_0, i8* %zybc_21, i8* %zybc_22, i8* %zybc_24, i8* %zybc_25, i8* %zybc_26, i8* %zybc_28, i8* %zybc_30, i8* %zybc_31)
  %30 = load %struct._RV_pmd** %4, align 8
  %31 = load %struct.__va_list_tag** %7, align 8
  %32 = bitcast %struct.__va_list_tag* %31 to i8*
  %33 = load i8** %8, align 8
  %34 = load i8** %9, align 8
  %35 = load i32* %16, align 4
  %36 = load i32* %17, align 4
  %37 = load i8** %18, align 8
  %zybc_ = bitcast %struct._RV_pmd* %30 to i8*
  %zybc_1 = bitcast i8* %32 to i8*
  %zyarg_ = inttoptr i64 24 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %33 to i8*
  %zybc_4 = bitcast i8* %34 to i8*
  %zyarg_5 = inttoptr i32 %35 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %36 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %37 to i8*
  %38 = getelementptr inbounds [8192 x i8]* %buffer, i32 0, i32 0
  %39 = load i8** %6, align 8
  %40 = load %struct.__va_list_tag** %7, align 8
  %41 = call i32 @vsprintf(i8* %38, i8* %39, %struct.__va_list_tag* %40) #7
  store i32 %41, i32* %ret, align 4
  %42 = load %struct._RV_pmd** %1, align 8
  %43 = load i8** %5, align 8
  %44 = getelementptr inbounds [8192 x i8]* %buffer, i32 0, i32 0
  %45 = call i32 @_RV_sstrlen(i8* %44)
  %46 = add nsw i32 %45, 1
  %47 = sext i32 %46 to i64
  %48 = load i8** %8, align 8
  %49 = load i8** %9, align 8
  %50 = load i32* %10, align 4
  %51 = load i32* %11, align 4
  %52 = load i8** %12, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %42 to i8*
  %zybc_11 = bitcast i8* %43 to i8*
  %zyarg_12 = inttoptr i64 %47 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %48 to i8*
  %zybc_15 = bitcast i8* %49 to i8*
  %zyarg_16 = inttoptr i32 %50 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %51 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %52 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 353353737, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_37_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %53 = load i8** %5, align 8
  %54 = getelementptr inbounds [8192 x i8]* %buffer, i32 0, i32 0
  %55 = call i8* @strcpy(i8* %53, i8* %54) #7
  %56 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %56)
  %57 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %57)
  %58 = load %struct._RV_pmd** %3, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %58)
  %59 = load %struct._RV_pmd** %4, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %59)
  %60 = load i32* %ret, align 4
  call void @_Z4joinj(i32 353353737)
  call void @_Z4joinj(i32 832313954)
  ret i32 %60
}

; Function Attrs: nounwind
declare i32 @vsprintf(i8*, i8*, %struct.__va_list_tag*) #3

; Function Attrs: nounwind uwtable
define i32 @_RV_fgetc(%struct._RV_pmd* %fp_pmd, %struct._IO_FILE* %fp, i8* %file_name, i8* %func_name, i32 %f_line, i32 %f_col, i8* %f_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store %struct._RV_pmd* %fp_pmd, %struct._RV_pmd** %1, align 8
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %2, align 8
  store i8* %file_name, i8** %3, align 8
  store i8* %func_name, i8** %4, align 8
  store i32 %f_line, i32* %5, align 4
  store i32 %f_col, i32* %6, align 4
  store i8* %f_name, i8** %7, align 8
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load %struct._IO_FILE** %2, align 8
  %10 = bitcast %struct._IO_FILE* %9 to i8*
  %11 = load i8** %3, align 8
  %12 = load i8** %4, align 8
  %13 = load i32* %5, align 4
  %14 = load i32* %6, align 4
  %15 = load i8** %7, align 8
  %zybc_ = bitcast %struct._RV_pmd* %8 to i8*
  %zybc_1 = bitcast i8* %10 to i8*
  %zyarg_ = inttoptr i64 216 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %11 to i8*
  %zybc_4 = bitcast i8* %12 to i8*
  %zyarg_5 = inttoptr i32 %13 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %14 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %15 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -158051488, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_39_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %16 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %16)
  %17 = load %struct._IO_FILE** %2, align 8
  %18 = call i32 @fgetc(%struct._IO_FILE* %17)
  call void @_Z4joinj(i32 -158051488)
  ret i32 %18
}

declare i32 @fgetc(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i8* @_RV_fgets(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %str_pmd, %struct._RV_pmd* %fp_pmd, i8* %str, i32 %n, %struct._IO_FILE* %fp, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name, i32 %f_line, i32 %f_col, i8* %f_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._RV_pmd*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i8*, align 8
  %ret = alloca i8*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %str_pmd, %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %fp_pmd, %struct._RV_pmd** %3, align 8
  store i8* %str, i8** %4, align 8
  store i32 %n, i32* %5, align 4
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %6, align 8
  store i8* %file_name, i8** %7, align 8
  store i8* %func_name, i8** %8, align 8
  store i32 %s_line, i32* %9, align 4
  store i32 %s_col, i32* %10, align 4
  store i8* %s_name, i8** %11, align 8
  store i32 %f_line, i32* %12, align 4
  store i32 %f_col, i32* %13, align 4
  store i8* %f_name, i8** %14, align 8
  %15 = load %struct._RV_pmd** %3, align 8
  %16 = load %struct._IO_FILE** %6, align 8
  %17 = bitcast %struct._IO_FILE* %16 to i8*
  %18 = load i8** %7, align 8
  %19 = load i8** %8, align 8
  %20 = load i32* %12, align 4
  %21 = load i32* %13, align 4
  %22 = load i8** %14, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %15 to i8*
  %zybc_11 = bitcast i8* %17 to i8*
  %zyarg_12 = inttoptr i64 216 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %18 to i8*
  %zybc_15 = bitcast i8* %19 to i8*
  %zyarg_16 = inttoptr i32 %20 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %21 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %22 to i8*
  %23 = load i8** %4, align 8
  %24 = load i32* %5, align 4
  %25 = load %struct._IO_FILE** %6, align 8
  %26 = call i8* @fgets(i8* %23, i32 %24, %struct._IO_FILE* %25)
  store i8* %26, i8** %ret, align 8
  %27 = load %struct._RV_pmd** %2, align 8
  %28 = load i8** %4, align 8
  %29 = load i8** %4, align 8
  %30 = call i32 @_RV_sstrlen(i8* %29)
  %31 = add nsw i32 %30, 1
  %32 = sext i32 %31 to i64
  %33 = load i8** %7, align 8
  %34 = load i8** %8, align 8
  %35 = load i32* %9, align 4
  %36 = load i32* %10, align 4
  %37 = load i8** %11, align 8
  %zybc_ = bitcast %struct._RV_pmd* %27 to i8*
  %zybc_1 = bitcast i8* %28 to i8*
  %zyarg_ = inttoptr i64 %32 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %33 to i8*
  %zybc_4 = bitcast i8* %34 to i8*
  %zyarg_5 = inttoptr i32 %35 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %36 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %37 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 -1383890240, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_40_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %38 = load i8** %ret, align 8
  %39 = icmp eq i8* %38, null
  br i1 %39, label %40, label %42

; <label>:40                                      ; preds = %0
  %41 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %41)
  br label %46

; <label>:42                                      ; preds = %0
  %43 = load %struct._RV_pmd** %1, align 8
  %44 = load %struct._RV_pmd** %2, align 8
  %45 = call %struct._RV_pmd* @_RV_pmd_cp_pmd(%struct._RV_pmd* %43, %struct._RV_pmd* %44)
  br label %46

; <label>:46                                      ; preds = %42, %40
  call void @_Z4joinj(i32 -1383890240)
  %47 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %47)
  %48 = load %struct._RV_pmd** %3, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %48)
  %49 = load i8** %ret, align 8
  ret i8* %49
}

declare i8* @fgets(i8*, i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i32 @_RV_fputc(%struct._RV_pmd* %fp_pmd, i32 %ch, %struct._IO_FILE* %fp, i8* %file_name, i8* %func_name, i32 %f_line, i32 %f_col, i8* %f_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i32, align 4
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  store %struct._RV_pmd* %fp_pmd, %struct._RV_pmd** %1, align 8
  store i32 %ch, i32* %2, align 4
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %3, align 8
  store i8* %file_name, i8** %4, align 8
  store i8* %func_name, i8** %5, align 8
  store i32 %f_line, i32* %6, align 4
  store i32 %f_col, i32* %7, align 4
  store i8* %f_name, i8** %8, align 8
  %9 = load %struct._RV_pmd** %1, align 8
  %10 = load %struct._IO_FILE** %3, align 8
  %11 = bitcast %struct._IO_FILE* %10 to i8*
  %12 = load i8** %4, align 8
  %13 = load i8** %5, align 8
  %14 = load i32* %6, align 4
  %15 = load i32* %7, align 4
  %16 = load i8** %8, align 8
  %zybc_ = bitcast %struct._RV_pmd* %9 to i8*
  %zybc_1 = bitcast i8* %11 to i8*
  %zyarg_ = inttoptr i64 216 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %12 to i8*
  %zybc_4 = bitcast i8* %13 to i8*
  %zyarg_5 = inttoptr i32 %14 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %15 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %16 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 420095510, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_41_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %17 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %17)
  %18 = load i32* %2, align 4
  %19 = load %struct._IO_FILE** %3, align 8
  %20 = call i32 @fputc(i32 %18, %struct._IO_FILE* %19)
  call void @_Z4joinj(i32 420095510)
  ret i32 %20
}

declare i32 @fputc(i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i32 @_RV_fputs(%struct._RV_pmd* %str_pmd, %struct._RV_pmd* %fp_pmd, i8* %str, %struct._IO_FILE* %fp, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name, i32 %f_line, i32 %f_col, i8* %f_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  store %struct._RV_pmd* %str_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %fp_pmd, %struct._RV_pmd** %2, align 8
  store i8* %str, i8** %3, align 8
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %4, align 8
  store i8* %file_name, i8** %5, align 8
  store i8* %func_name, i8** %6, align 8
  store i32 %s_line, i32* %7, align 4
  store i32 %s_col, i32* %8, align 4
  store i8* %s_name, i8** %9, align 8
  store i32 %f_line, i32* %10, align 4
  store i32 %f_col, i32* %11, align 4
  store i8* %f_name, i8** %12, align 8
  %13 = load %struct._RV_pmd** %1, align 8
  %14 = load i8** %3, align 8
  %15 = load i8** %3, align 8
  %16 = call i32 @_RV_sstrlen(i8* %15)
  %17 = add nsw i32 %16, 1
  %18 = sext i32 %17 to i64
  %19 = load i8** %5, align 8
  %20 = load i8** %6, align 8
  %21 = load i32* %7, align 4
  %22 = load i32* %8, align 4
  %23 = load i8** %9, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %13 to i8*
  %zybc_11 = bitcast i8* %14 to i8*
  %zyarg_12 = inttoptr i64 %18 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %19 to i8*
  %zybc_15 = bitcast i8* %20 to i8*
  %zyarg_16 = inttoptr i32 %21 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %22 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %23 to i8*
  %24 = load %struct._RV_pmd** %2, align 8
  %25 = load %struct._IO_FILE** %4, align 8
  %26 = bitcast %struct._IO_FILE* %25 to i8*
  %27 = load i8** %5, align 8
  %28 = load i8** %6, align 8
  %29 = load i32* %10, align 4
  %30 = load i32* %11, align 4
  %31 = load i8** %12, align 8
  %zybc_ = bitcast %struct._RV_pmd* %24 to i8*
  %zybc_1 = bitcast i8* %26 to i8*
  %zyarg_ = inttoptr i64 216 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %27 to i8*
  %zybc_4 = bitcast i8* %28 to i8*
  %zyarg_5 = inttoptr i32 %29 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %30 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %31 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 1193640949, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_42_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %32 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %32)
  %33 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %33)
  %34 = load i8** %3, align 8
  %35 = load %struct._IO_FILE** %4, align 8
  %36 = call i32 @fputs(i8* %34, %struct._IO_FILE* %35)
  call void @_Z4joinj(i32 1193640949)
  ret i32 %36
}

declare i32 @fputs(i8*, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i32 @_RV__IO_getc(%struct._RV_pmd* %fp_pmd, %struct._IO_FILE* %fp, i8* %file_name, i8* %func_name, i32 %f_line, i32 %f_col, i8* %f_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store %struct._RV_pmd* %fp_pmd, %struct._RV_pmd** %1, align 8
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %2, align 8
  store i8* %file_name, i8** %3, align 8
  store i8* %func_name, i8** %4, align 8
  store i32 %f_line, i32* %5, align 4
  store i32 %f_col, i32* %6, align 4
  store i8* %f_name, i8** %7, align 8
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load %struct._IO_FILE** %2, align 8
  %10 = bitcast %struct._IO_FILE* %9 to i8*
  %11 = load i8** %3, align 8
  %12 = load i8** %4, align 8
  %13 = load i32* %5, align 4
  %14 = load i32* %6, align 4
  %15 = load i8** %7, align 8
  %zybc_ = bitcast %struct._RV_pmd* %8 to i8*
  %zybc_1 = bitcast i8* %10 to i8*
  %zyarg_ = inttoptr i64 216 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %11 to i8*
  %zybc_4 = bitcast i8* %12 to i8*
  %zyarg_5 = inttoptr i32 %13 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %14 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %15 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -1742350007, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_43_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %16 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %16)
  %17 = load %struct._IO_FILE** %2, align 8
  %18 = call i32 @_IO_getc(%struct._IO_FILE* %17)
  call void @_Z4joinj(i32 -1742350007)
  ret i32 %18
}

declare i32 @_IO_getc(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i8* @_RV_gets(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %str_pmd, i8* %str, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %ret = alloca i8*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %str_pmd, %struct._RV_pmd** %2, align 8
  store i8* %str, i8** %3, align 8
  store i8* %file_name, i8** %4, align 8
  store i8* %func_name, i8** %5, align 8
  store i32 %s_line, i32* %6, align 4
  store i32 %s_col, i32* %7, align 4
  store i8* %s_name, i8** %8, align 8
  %9 = load i8** %3, align 8
  %10 = load %struct._IO_FILE** @stdin, align 8
  %11 = call i8* @fgets(i8* %9, i32 1024, %struct._IO_FILE* %10)
  store i8* %11, i8** %ret, align 8
  %12 = load %struct._RV_pmd** %2, align 8
  %13 = load i8** %3, align 8
  %14 = load i8** %3, align 8
  %15 = call i32 @_RV_sstrlen(i8* %14)
  %16 = add nsw i32 %15, 1
  %17 = sext i32 %16 to i64
  %18 = load i8** %4, align 8
  %19 = load i8** %5, align 8
  %20 = load i32* %6, align 4
  %21 = load i32* %7, align 4
  %22 = load i8** %8, align 8
  %zybc_ = bitcast %struct._RV_pmd* %12 to i8*
  %zybc_1 = bitcast i8* %13 to i8*
  %zyarg_ = inttoptr i64 %17 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %18 to i8*
  %zybc_4 = bitcast i8* %19 to i8*
  %zyarg_5 = inttoptr i32 %20 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %21 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %22 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 1476330142, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_44_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %23 = load i8** %ret, align 8
  %24 = icmp eq i8* %23, null
  br i1 %24, label %25, label %27

; <label>:25                                      ; preds = %0
  %26 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %26)
  br label %31

; <label>:27                                      ; preds = %0
  %28 = load %struct._RV_pmd** %1, align 8
  %29 = load %struct._RV_pmd** %2, align 8
  %30 = call %struct._RV_pmd* @_RV_pmd_cp_pmd(%struct._RV_pmd* %28, %struct._RV_pmd* %29)
  br label %31

; <label>:31                                      ; preds = %27, %25
  call void @_Z4joinj(i32 1476330142)
  %32 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %32)
  %33 = load i8** %3, align 8
  ret i8* %33
}

; Function Attrs: nounwind uwtable
define i32 @_RV__IO_putc(%struct._RV_pmd* %fp_pmd, i32 %ch, %struct._IO_FILE* %fp, i8* %file_name, i8* %func_name, i32 %f_line, i32 %f_col, i8* %f_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i32, align 4
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  store %struct._RV_pmd* %fp_pmd, %struct._RV_pmd** %1, align 8
  store i32 %ch, i32* %2, align 4
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %3, align 8
  store i8* %file_name, i8** %4, align 8
  store i8* %func_name, i8** %5, align 8
  store i32 %f_line, i32* %6, align 4
  store i32 %f_col, i32* %7, align 4
  store i8* %f_name, i8** %8, align 8
  %9 = load %struct._RV_pmd** %1, align 8
  %10 = load %struct._IO_FILE** %3, align 8
  %11 = bitcast %struct._IO_FILE* %10 to i8*
  %12 = load i8** %4, align 8
  %13 = load i8** %5, align 8
  %14 = load i32* %6, align 4
  %15 = load i32* %7, align 4
  %16 = load i8** %8, align 8
  %zybc_ = bitcast %struct._RV_pmd* %9 to i8*
  %zybc_1 = bitcast i8* %11 to i8*
  %zyarg_ = inttoptr i64 216 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %12 to i8*
  %zybc_4 = bitcast i8* %13 to i8*
  %zyarg_5 = inttoptr i32 %14 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %15 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %16 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -278449640, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_45_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %17 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %17)
  %18 = load i32* %2, align 4
  %19 = load %struct._IO_FILE** %3, align 8
  %20 = call i32 @_IO_putc(i32 %18, %struct._IO_FILE* %19)
  call void @_Z4joinj(i32 -278449640)
  ret i32 %20
}

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i32 @_RV_puts(%struct._RV_pmd* %str_pmd, i8* %str, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store %struct._RV_pmd* %str_pmd, %struct._RV_pmd** %1, align 8
  store i8* %str, i8** %2, align 8
  store i8* %file_name, i8** %3, align 8
  store i8* %func_name, i8** %4, align 8
  store i32 %s_line, i32* %5, align 4
  store i32 %s_col, i32* %6, align 4
  store i8* %s_name, i8** %7, align 8
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load i8** %2, align 8
  %10 = load i8** %2, align 8
  %11 = call i32 @_RV_sstrlen(i8* %10)
  %12 = add nsw i32 %11, 1
  %13 = sext i32 %12 to i64
  %14 = load i8** %3, align 8
  %15 = load i8** %4, align 8
  %16 = load i32* %5, align 4
  %17 = load i32* %6, align 4
  %18 = load i8** %7, align 8
  %zybc_ = bitcast %struct._RV_pmd* %8 to i8*
  %zybc_1 = bitcast i8* %9 to i8*
  %zyarg_ = inttoptr i64 %13 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %14 to i8*
  %zybc_4 = bitcast i8* %15 to i8*
  %zyarg_5 = inttoptr i32 %16 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %17 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %18 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -1349660699, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_46_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %19 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %19)
  %20 = load i8** %2, align 8
  %21 = call i32 @puts(i8* %20)
  call void @_Z4joinj(i32 -1349660699)
  ret i32 %21
}

declare i32 @puts(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @_RV_ungetc(%struct._RV_pmd* %fp_pmd, i32 %ch, %struct._IO_FILE* %fp, i8* %file_name, i8* %func_name, i32 %f_line, i32 %f_col, i8* %f_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i32, align 4
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  store %struct._RV_pmd* %fp_pmd, %struct._RV_pmd** %1, align 8
  store i32 %ch, i32* %2, align 4
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %3, align 8
  store i8* %file_name, i8** %4, align 8
  store i8* %func_name, i8** %5, align 8
  store i32 %f_line, i32* %6, align 4
  store i32 %f_col, i32* %7, align 4
  store i8* %f_name, i8** %8, align 8
  %9 = load %struct._RV_pmd** %1, align 8
  %10 = load %struct._IO_FILE** %3, align 8
  %11 = bitcast %struct._IO_FILE* %10 to i8*
  %12 = load i8** %4, align 8
  %13 = load i8** %5, align 8
  %14 = load i32* %6, align 4
  %15 = load i32* %7, align 4
  %16 = load i8** %8, align 8
  %zybc_ = bitcast %struct._RV_pmd* %9 to i8*
  %zybc_1 = bitcast i8* %11 to i8*
  %zyarg_ = inttoptr i64 216 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %12 to i8*
  %zybc_4 = bitcast i8* %13 to i8*
  %zyarg_5 = inttoptr i32 %14 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %15 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %16 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 991387924, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_47_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %17 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %17)
  %18 = load i32* %2, align 4
  %19 = load %struct._IO_FILE** %3, align 8
  %20 = call i32 @ungetc(i32 %18, %struct._IO_FILE* %19)
  call void @_Z4joinj(i32 991387924)
  ret i32 %20
}

declare i32 @ungetc(i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define void @_RV_perror(%struct._RV_pmd* %str_pmd, i8* %str, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store %struct._RV_pmd* %str_pmd, %struct._RV_pmd** %1, align 8
  store i8* %str, i8** %2, align 8
  store i8* %file_name, i8** %3, align 8
  store i8* %func_name, i8** %4, align 8
  store i32 %s_line, i32* %5, align 4
  store i32 %s_col, i32* %6, align 4
  store i8* %s_name, i8** %7, align 8
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load i8** %2, align 8
  %10 = load i8** %2, align 8
  %11 = call i32 @_RV_sstrlen(i8* %10)
  %12 = add nsw i32 %11, 1
  %13 = sext i32 %12 to i64
  %14 = load i8** %3, align 8
  %15 = load i8** %4, align 8
  %16 = load i32* %5, align 4
  %17 = load i32* %6, align 4
  %18 = load i8** %7, align 8
  %zybc_ = bitcast %struct._RV_pmd* %8 to i8*
  %zybc_1 = bitcast i8* %9 to i8*
  %zyarg_ = inttoptr i64 %13 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %14 to i8*
  %zybc_4 = bitcast i8* %15 to i8*
  %zyarg_5 = inttoptr i32 %16 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %17 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %18 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 1732994198, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_48_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %19 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %19)
  %20 = load i8** %2, align 8
  call void @perror(i8* %20)
  call void @_Z4joinj(i32 1732994198)
  ret void
}

declare void @perror(i8*) #1

; Function Attrs: nounwind uwtable
define void @_RV_stdio_init_code() #0 {
  %1 = load %struct._RV_stat_node** @_RV_static_sa, align 8
  %2 = load %struct._IO_FILE** @stdin, align 8
  %3 = bitcast %struct._IO_FILE* %2 to i8*
  %4 = load %struct._IO_FILE** @stdin, align 8
  %5 = getelementptr inbounds %struct._IO_FILE* %4, i64 1
  %6 = bitcast %struct._IO_FILE* %5 to i8*
  %7 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** bitcast (%struct._IO_FILE** @stdin to i8**), %struct._RV_stat_node* %1, i8* %3, i8* %6)
  %8 = load %struct._RV_stat_node** @_RV_static_sa, align 8
  %9 = load %struct._IO_FILE** @stdout, align 8
  %10 = bitcast %struct._IO_FILE* %9 to i8*
  %11 = load %struct._IO_FILE** @stdout, align 8
  %12 = getelementptr inbounds %struct._IO_FILE* %11, i64 1
  %13 = bitcast %struct._IO_FILE* %12 to i8*
  %14 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** bitcast (%struct._IO_FILE** @stdout to i8**), %struct._RV_stat_node* %8, i8* %10, i8* %13)
  %15 = load %struct._RV_stat_node** @_RV_static_sa, align 8
  %16 = load %struct._IO_FILE** @stderr, align 8
  %17 = bitcast %struct._IO_FILE* %16 to i8*
  %18 = load %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds %struct._IO_FILE* %18, i64 1
  %20 = bitcast %struct._IO_FILE* %19 to i8*
  %21 = call %struct._RV_pmd* @_RV_pmd_tbl_update_sa(i8** bitcast (%struct._IO_FILE** @stderr to i8**), %struct._RV_stat_node* %15, i8* %17, i8* %20)
  ret void
}

; Function Attrs: nounwind uwtable
define void @_RV_stdio_clear_code() #0 {
  call void @_RV_pmd_tbl_remove(i8** bitcast (%struct._IO_FILE** @stdin to i8**))
  call void @_RV_pmd_tbl_remove(i8** bitcast (%struct._IO_FILE** @stdout to i8**))
  call void @_RV_pmd_tbl_remove(i8** bitcast (%struct._IO_FILE** @stderr to i8**))
  ret void
}

; Function Attrs: nounwind uwtable
define double @_RV_atof(%struct._RV_pmd* %str_pmd, i8* %str, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store %struct._RV_pmd* %str_pmd, %struct._RV_pmd** %1, align 8
  store i8* %str, i8** %2, align 8
  store i8* %file_name, i8** %3, align 8
  store i8* %func_name, i8** %4, align 8
  store i32 %s_line, i32* %5, align 4
  store i32 %s_col, i32* %6, align 4
  store i8* %s_name, i8** %7, align 8
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load i8** %2, align 8
  %10 = load i8** %2, align 8
  %11 = call i32 @_RV_sstrlen(i8* %10)
  %12 = add nsw i32 %11, 1
  %13 = sext i32 %12 to i64
  %14 = load i8** %3, align 8
  %15 = load i8** %4, align 8
  %16 = load i32* %5, align 4
  %17 = load i32* %6, align 4
  %18 = load i8** %7, align 8
  %zybc_ = bitcast %struct._RV_pmd* %8 to i8*
  %zybc_1 = bitcast i8* %9 to i8*
  %zyarg_ = inttoptr i64 %13 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %14 to i8*
  %zybc_4 = bitcast i8* %15 to i8*
  %zyarg_5 = inttoptr i32 %16 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %17 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %18 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -1449146077, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_49_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %19 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %19)
  %20 = load i8** %2, align 8
  %21 = call double @atof(i8* %20) #10
  call void @_Z4joinj(i32 -1449146077)
  ret double %21
}

; Function Attrs: nounwind readonly
declare double @atof(i8*) #6

; Function Attrs: nounwind uwtable
define i32 @_RV_atoi(%struct._RV_pmd* %str_pmd, i8* %str, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store %struct._RV_pmd* %str_pmd, %struct._RV_pmd** %1, align 8
  store i8* %str, i8** %2, align 8
  store i8* %file_name, i8** %3, align 8
  store i8* %func_name, i8** %4, align 8
  store i32 %s_line, i32* %5, align 4
  store i32 %s_col, i32* %6, align 4
  store i8* %s_name, i8** %7, align 8
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load i8** %2, align 8
  %10 = load i8** %2, align 8
  %11 = call i32 @_RV_sstrlen(i8* %10)
  %12 = add nsw i32 %11, 1
  %13 = sext i32 %12 to i64
  %14 = load i8** %3, align 8
  %15 = load i8** %4, align 8
  %16 = load i32* %5, align 4
  %17 = load i32* %6, align 4
  %18 = load i8** %7, align 8
  %zybc_ = bitcast %struct._RV_pmd* %8 to i8*
  %zybc_1 = bitcast i8* %9 to i8*
  %zyarg_ = inttoptr i64 %13 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %14 to i8*
  %zybc_4 = bitcast i8* %15 to i8*
  %zyarg_5 = inttoptr i32 %16 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %17 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %18 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 718833252, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_50_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %19 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %19)
  %20 = load i8** %2, align 8
  %21 = call i32 @atoi(i8* %20) #10
  call void @_Z4joinj(i32 718833252)
  ret i32 %21
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #6

; Function Attrs: nounwind uwtable
define i64 @_RV_atol(%struct._RV_pmd* %str_pmd, i8* %str, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store %struct._RV_pmd* %str_pmd, %struct._RV_pmd** %1, align 8
  store i8* %str, i8** %2, align 8
  store i8* %file_name, i8** %3, align 8
  store i8* %func_name, i8** %4, align 8
  store i32 %s_line, i32* %5, align 4
  store i32 %s_col, i32* %6, align 4
  store i8* %s_name, i8** %7, align 8
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load i8** %2, align 8
  %10 = load i8** %2, align 8
  %11 = call i32 @_RV_sstrlen(i8* %10)
  %12 = add nsw i32 %11, 1
  %13 = sext i32 %12 to i64
  %14 = load i8** %3, align 8
  %15 = load i8** %4, align 8
  %16 = load i32* %5, align 4
  %17 = load i32* %6, align 4
  %18 = load i8** %7, align 8
  %zybc_ = bitcast %struct._RV_pmd* %8 to i8*
  %zybc_1 = bitcast i8* %9 to i8*
  %zyarg_ = inttoptr i64 %13 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %14 to i8*
  %zybc_4 = bitcast i8* %15 to i8*
  %zyarg_5 = inttoptr i32 %16 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %17 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %18 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -550733025, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_51_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %19 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %19)
  %20 = load i8** %2, align 8
  %21 = call i64 @atol(i8* %20) #10
  call void @_Z4joinj(i32 -550733025)
  ret i64 %21
}

; Function Attrs: nounwind readonly
declare i64 @atol(i8*) #6

; Function Attrs: nounwind uwtable
define double @_RV_strtod(%struct._RV_pmd* %str_pmd, %struct._RV_pmd* %endptr_pmd, i8* %str, i8** %endptr, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name, i32 %e_line, i32 %e_col, i8* %e_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8**, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %tmp = alloca double, align 8
  store %struct._RV_pmd* %str_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %endptr_pmd, %struct._RV_pmd** %2, align 8
  store i8* %str, i8** %3, align 8
  store i8** %endptr, i8*** %4, align 8
  store i8* %file_name, i8** %5, align 8
  store i8* %func_name, i8** %6, align 8
  store i32 %s_line, i32* %7, align 4
  store i32 %s_col, i32* %8, align 4
  store i8* %s_name, i8** %9, align 8
  store i32 %e_line, i32* %10, align 4
  store i32 %e_col, i32* %11, align 4
  store i8* %e_name, i8** %12, align 8
  %13 = load %struct._RV_pmd** %1, align 8
  %14 = load i8** %3, align 8
  %15 = load i8** %3, align 8
  %16 = call i32 @_RV_sstrlen(i8* %15)
  %17 = add nsw i32 %16, 1
  %18 = sext i32 %17 to i64
  %19 = load i8** %5, align 8
  %20 = load i8** %6, align 8
  %21 = load i32* %7, align 4
  %22 = load i32* %8, align 4
  %23 = load i8** %9, align 8
  %zybc_ = bitcast %struct._RV_pmd* %13 to i8*
  %zybc_1 = bitcast i8* %14 to i8*
  %zyarg_ = inttoptr i64 %18 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %19 to i8*
  %zybc_4 = bitcast i8* %20 to i8*
  %zyarg_5 = inttoptr i32 %21 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %22 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %23 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -570202184, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_52_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %24 = load i8*** %4, align 8
  %25 = icmp ne i8** %24, null
  br i1 %25, label %26, label %35

; <label>:26                                      ; preds = %0
  %27 = load %struct._RV_pmd** %2, align 8
  %28 = load i8*** %4, align 8
  %29 = bitcast i8** %28 to i8*
  %30 = load i8** %5, align 8
  %31 = load i8** %6, align 8
  %32 = load i32* %10, align 4
  %33 = load i32* %11, align 4
  %34 = load i8** %12, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %27 to i8*
  %zybc_11 = bitcast i8* %29 to i8*
  %zyarg_12 = inttoptr i64 8 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %30 to i8*
  %zybc_15 = bitcast i8* %31 to i8*
  %zyarg_16 = inttoptr i32 %32 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %33 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %34 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 1113989545, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_53_0, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  br label %35

; <label>:35                                      ; preds = %26, %0
  %36 = load i8** %3, align 8
  %37 = load i8*** %4, align 8
  %38 = call double @strtod(i8* %36, i8** %37) #7
  store double %38, double* %tmp, align 8
  %39 = load i8*** %4, align 8
  %40 = icmp ne i8** %39, null
  br i1 %40, label %41, label %45

; <label>:41                                      ; preds = %35
  %42 = load i8*** %4, align 8
  %43 = load %struct._RV_pmd** %1, align 8
  %44 = call %struct._RV_pmd* @_RV_pmd_tbl_update_pmd(i8** %42, %struct._RV_pmd* %43)
  br label %45

; <label>:45                                      ; preds = %41, %35
  call void @_Z4joinj(i32 -570202184)
  call void @_Z4joinj(i32 1113989545)
  %46 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %46)
  %47 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %47)
  %48 = load double* %tmp, align 8
  ret double %48
}

; Function Attrs: nounwind
declare double @strtod(i8*, i8**) #3

; Function Attrs: nounwind uwtable
define i64 @_RV_strtol(%struct._RV_pmd* %str_pmd, %struct._RV_pmd* %endptr_pmd, i8* %str, i8** %endptr, i32 %base, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name, i32 %e_line, i32 %e_col, i8* %e_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %tmp = alloca i64, align 8
  store %struct._RV_pmd* %str_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %endptr_pmd, %struct._RV_pmd** %2, align 8
  store i8* %str, i8** %3, align 8
  store i8** %endptr, i8*** %4, align 8
  store i32 %base, i32* %5, align 4
  store i8* %file_name, i8** %6, align 8
  store i8* %func_name, i8** %7, align 8
  store i32 %s_line, i32* %8, align 4
  store i32 %s_col, i32* %9, align 4
  store i8* %s_name, i8** %10, align 8
  store i32 %e_line, i32* %11, align 4
  store i32 %e_col, i32* %12, align 4
  store i8* %e_name, i8** %13, align 8
  %14 = load %struct._RV_pmd** %1, align 8
  %15 = load i8** %3, align 8
  %16 = load i8** %3, align 8
  %17 = call i32 @_RV_sstrlen(i8* %16)
  %18 = add nsw i32 %17, 1
  %19 = sext i32 %18 to i64
  %20 = load i8** %6, align 8
  %21 = load i8** %7, align 8
  %22 = load i32* %8, align 4
  %23 = load i32* %9, align 4
  %24 = load i8** %10, align 8
  %zybc_ = bitcast %struct._RV_pmd* %14 to i8*
  %zybc_1 = bitcast i8* %15 to i8*
  %zyarg_ = inttoptr i64 %19 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %20 to i8*
  %zybc_4 = bitcast i8* %21 to i8*
  %zyarg_5 = inttoptr i32 %22 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %23 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %24 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 2082169782, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_54_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %25 = load i8*** %4, align 8
  %26 = icmp ne i8** %25, null
  br i1 %26, label %27, label %36

; <label>:27                                      ; preds = %0
  %28 = load %struct._RV_pmd** %2, align 8
  %29 = load i8*** %4, align 8
  %30 = bitcast i8** %29 to i8*
  %31 = load i8** %6, align 8
  %32 = load i8** %7, align 8
  %33 = load i32* %11, align 4
  %34 = load i32* %12, align 4
  %35 = load i8** %13, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %28 to i8*
  %zybc_11 = bitcast i8* %30 to i8*
  %zyarg_12 = inttoptr i64 8 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %31 to i8*
  %zybc_15 = bitcast i8* %32 to i8*
  %zyarg_16 = inttoptr i32 %33 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %34 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %35 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -2043688385, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_55_0, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  br label %36

; <label>:36                                      ; preds = %27, %0
  %37 = load i8** %3, align 8
  %38 = load i8*** %4, align 8
  %39 = load i32* %5, align 4
  %40 = call i64 @strtol(i8* %37, i8** %38, i32 %39) #7
  store i64 %40, i64* %tmp, align 8
  %41 = load i8*** %4, align 8
  %42 = icmp ne i8** %41, null
  br i1 %42, label %43, label %47

; <label>:43                                      ; preds = %36
  %44 = load i8*** %4, align 8
  %45 = load %struct._RV_pmd** %1, align 8
  %46 = call %struct._RV_pmd* @_RV_pmd_tbl_update_pmd(i8** %44, %struct._RV_pmd* %45)
  br label %47

; <label>:47                                      ; preds = %43, %36
  call void @_Z4joinj(i32 2082169782)
  call void @_Z4joinj(i32 -2043688385)
  %48 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %48)
  %49 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %49)
  %50 = load i64* %tmp, align 8
  ret i64 %50
}

; Function Attrs: nounwind
declare i64 @strtol(i8*, i8**, i32) #3

; Function Attrs: nounwind uwtable
define i64 @_RV_strtoul(%struct._RV_pmd* %str_pmd, %struct._RV_pmd* %endptr_pmd, i8* %str, i8** %endptr, i32 %base, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name, i32 %e_line, i32 %e_col, i8* %e_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %tmp = alloca i64, align 8
  store %struct._RV_pmd* %str_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %endptr_pmd, %struct._RV_pmd** %2, align 8
  store i8* %str, i8** %3, align 8
  store i8** %endptr, i8*** %4, align 8
  store i32 %base, i32* %5, align 4
  store i8* %file_name, i8** %6, align 8
  store i8* %func_name, i8** %7, align 8
  store i32 %s_line, i32* %8, align 4
  store i32 %s_col, i32* %9, align 4
  store i8* %s_name, i8** %10, align 8
  store i32 %e_line, i32* %11, align 4
  store i32 %e_col, i32* %12, align 4
  store i8* %e_name, i8** %13, align 8
  %14 = load %struct._RV_pmd** %1, align 8
  %15 = load i8** %3, align 8
  %16 = load i8** %3, align 8
  %17 = call i32 @_RV_sstrlen(i8* %16)
  %18 = add nsw i32 %17, 1
  %19 = sext i32 %18 to i64
  %20 = load i8** %6, align 8
  %21 = load i8** %7, align 8
  %22 = load i32* %8, align 4
  %23 = load i32* %9, align 4
  %24 = load i8** %10, align 8
  %zybc_ = bitcast %struct._RV_pmd* %14 to i8*
  %zybc_1 = bitcast i8* %15 to i8*
  %zyarg_ = inttoptr i64 %19 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %20 to i8*
  %zybc_4 = bitcast i8* %21 to i8*
  %zyarg_5 = inttoptr i32 %22 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %23 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %24 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -1078902081, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_56_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %25 = load i8*** %4, align 8
  %26 = icmp ne i8** %25, null
  br i1 %26, label %27, label %36

; <label>:27                                      ; preds = %0
  %28 = load %struct._RV_pmd** %2, align 8
  %29 = load i8*** %4, align 8
  %30 = bitcast i8** %29 to i8*
  %31 = load i8** %6, align 8
  %32 = load i8** %7, align 8
  %33 = load i32* %11, align 4
  %34 = load i32* %12, align 4
  %35 = load i8** %13, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %28 to i8*
  %zybc_11 = bitcast i8* %30 to i8*
  %zyarg_12 = inttoptr i64 8 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %31 to i8*
  %zybc_15 = bitcast i8* %32 to i8*
  %zyarg_16 = inttoptr i32 %33 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %34 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %35 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 1406172054, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_57_0, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  br label %36

; <label>:36                                      ; preds = %27, %0
  %37 = load i8** %3, align 8
  %38 = load i8*** %4, align 8
  %39 = load i32* %5, align 4
  %40 = call i64 @strtoul(i8* %37, i8** %38, i32 %39) #7
  store i64 %40, i64* %tmp, align 8
  %41 = load i8*** %4, align 8
  %42 = icmp ne i8** %41, null
  br i1 %42, label %43, label %47

; <label>:43                                      ; preds = %36
  %44 = load i8*** %4, align 8
  %45 = load %struct._RV_pmd** %1, align 8
  %46 = call %struct._RV_pmd* @_RV_pmd_tbl_update_pmd(i8** %44, %struct._RV_pmd* %45)
  br label %47

; <label>:47                                      ; preds = %43, %36
  call void @_Z4joinj(i32 -1078902081)
  call void @_Z4joinj(i32 1406172054)
  %48 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %48)
  %49 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %49)
  %50 = load i64* %tmp, align 8
  ret i64 %50
}

; Function Attrs: nounwind
declare i64 @strtoul(i8*, i8**, i32) #3

; Function Attrs: nounwind uwtable
define i8* @_RV_malloc(%struct._RV_pmd* %ret_pmd, i64 %size) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i64, align 8
  %ret = alloca i8*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store i64 %size, i64* %2, align 8
  %3 = load i64* %2, align 8
  %4 = call noalias i8* @malloc(i64 %3) #7
  store i8* %4, i8** %ret, align 8
  %5 = load i8** %ret, align 8
  %6 = icmp eq i8* %5, null
  br i1 %6, label %7, label %9

; <label>:7                                       ; preds = %0
  %8 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %8)
  br label %16

; <label>:9                                       ; preds = %0
  %10 = load %struct._RV_pmd** %1, align 8
  %11 = load i8** %ret, align 8
  %12 = load i8** %ret, align 8
  %13 = load i64* %2, align 8
  %14 = getelementptr inbounds i8* %12, i64 %13
  %15 = call %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %10, %struct._RV_stat_node* null, i32 4, i8* %11, i8* %14)
  br label %16

; <label>:16                                      ; preds = %9, %7
  %17 = load i8** %ret, align 8
  ret i8* %17
}

; Function Attrs: nounwind uwtable
define i8* @_RV_calloc(%struct._RV_pmd* %ret_pmd, i64 %n, i64 %size) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %ret = alloca i8*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store i64 %n, i64* %2, align 8
  store i64 %size, i64* %3, align 8
  %4 = load i64* %2, align 8
  %5 = load i64* %3, align 8
  %6 = call noalias i8* @calloc(i64 %4, i64 %5) #7
  store i8* %6, i8** %ret, align 8
  %7 = load i8** %ret, align 8
  %8 = icmp eq i8* %7, null
  br i1 %8, label %9, label %11

; <label>:9                                       ; preds = %0
  %10 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %10)
  br label %20

; <label>:11                                      ; preds = %0
  %12 = load %struct._RV_pmd** %1, align 8
  %13 = load i8** %ret, align 8
  %14 = load i8** %ret, align 8
  %15 = load i64* %2, align 8
  %16 = load i64* %3, align 8
  %17 = mul i64 %15, %16
  %18 = getelementptr inbounds i8* %14, i64 %17
  %19 = call %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %12, %struct._RV_stat_node* null, i32 4, i8* %13, i8* %18)
  br label %20

; <label>:20                                      ; preds = %11, %9
  %21 = load i8** %ret, align 8
  ret i8* %21
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #3

; Function Attrs: nounwind uwtable
define i8* @_RV_realloc(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %ptr_pmd, i8* %ptr, i32 %newsize, i8* %file_name, i8* %func_name, i32 %p_line, i32 %p_col, i8* %p_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %ptr_pmd_freed = alloca i8, align 1
  %p = alloca i8*, align 8
  %p_pmd = alloca %struct._RV_pmd*, align 8
  %ret = alloca i8*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %ptr_pmd, %struct._RV_pmd** %2, align 8
  store i8* %ptr, i8** %3, align 8
  store i32 %newsize, i32* %4, align 4
  store i8* %file_name, i8** %5, align 8
  store i8* %func_name, i8** %6, align 8
  store i32 %p_line, i32* %7, align 4
  store i32 %p_col, i32* %8, align 4
  store i8* %p_name, i8** %9, align 8
  store i8 0, i8* %ptr_pmd_freed, align 1
  %10 = load i8** %3, align 8
  %11 = load i32* %4, align 4
  %12 = zext i32 %11 to i64
  %13 = call i8* @realloc(i8* %10, i64 %12) #7
  store i8* %13, i8** %ret, align 8
  %14 = load i8** %ret, align 8
  %15 = load i8** %3, align 8
  %16 = icmp eq i8* %14, %15
  br i1 %16, label %17, label %29

; <label>:17                                      ; preds = %0
  %18 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_set_stat(%struct._RV_pmd* %18, i32 4)
  %19 = load %struct._RV_pmd** %2, align 8
  %20 = load i8** %ret, align 8
  call void @_RV_pmd_set_base(%struct._RV_pmd* %19, i8* %20)
  %21 = load %struct._RV_pmd** %2, align 8
  %22 = load i8** %ret, align 8
  %23 = load i32* %4, align 4
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds i8* %22, i64 %24
  call void @_RV_pmd_set_bound(%struct._RV_pmd* %21, i8* %25)
  %26 = load %struct._RV_pmd** %1, align 8
  %27 = load %struct._RV_pmd** %2, align 8
  %28 = call %struct._RV_pmd* @_RV_pmd_cp_pmd(%struct._RV_pmd* %26, %struct._RV_pmd* %27)
  br label %77

; <label>:29                                      ; preds = %0
  %30 = load %struct._RV_pmd** %2, align 8
  %31 = icmp ne %struct._RV_pmd* %30, null
  br i1 %31, label %32, label %39

; <label>:32                                      ; preds = %29
  %33 = load %struct._RV_pmd** %2, align 8
  %34 = call i32 @_RV_pmd_get_stat(%struct._RV_pmd* %33)
  %35 = icmp eq i32 %34, 4
  br i1 %35, label %36, label %38

; <label>:36                                      ; preds = %32
  %37 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_set_stat(%struct._RV_pmd* %37, i32 0)
  br label %38

; <label>:38                                      ; preds = %36, %32
  br label %39

; <label>:39                                      ; preds = %38, %29
  %40 = load i8** %3, align 8
  store i8* %40, i8** %p, align 8
  br label %41

; <label>:41                                      ; preds = %66, %39
  %42 = load i8** %p, align 8
  %43 = load %struct._RV_pmd** %2, align 8
  %44 = call i8* @_RV_pmd_get_bound(%struct._RV_pmd* %43)
  %45 = icmp ult i8* %42, %44
  br i1 %45, label %46, label %69

; <label>:46                                      ; preds = %41
  %47 = load i8** %p, align 8
  %48 = bitcast i8* %47 to i8**
  %49 = call %struct._RV_pmd* @_RV_pmd_tbl_lookup(i8** %48)
  store %struct._RV_pmd* %49, %struct._RV_pmd** %p_pmd, align 8
  %50 = load %struct._RV_pmd** %p_pmd, align 8
  %51 = icmp ne %struct._RV_pmd* %50, null
  br i1 %51, label %52, label %65

; <label>:52                                      ; preds = %46
  %53 = load i8** %ret, align 8
  %54 = load i8** %p, align 8
  %55 = load i8** %3, align 8
  %56 = ptrtoint i8* %54 to i64
  %57 = ptrtoint i8* %55 to i64
  %58 = sub i64 %56, %57
  %59 = getelementptr i8* %53, i64 %58
  %60 = bitcast i8* %59 to i8**
  %61 = load %struct._RV_pmd** %p_pmd, align 8
  %62 = call %struct._RV_pmd* @_RV_pmd_tbl_update_pmd(i8** %60, %struct._RV_pmd* %61)
  store i8 0, i8* %ptr_pmd_freed, align 1
  %63 = load i8** %p, align 8
  %64 = bitcast i8* %63 to i8**
  call void @_RV_pmd_tbl_remove(i8** %64)
  br label %65

; <label>:65                                      ; preds = %52, %46
  br label %66

; <label>:66                                      ; preds = %65
  %67 = load i8** %p, align 8
  %68 = getelementptr i8* %67, i64 8
  store i8* %68, i8** %p, align 8
  br label %41

; <label>:69                                      ; preds = %41
  %70 = load %struct._RV_pmd** %1, align 8
  %71 = load i8** %ret, align 8
  %72 = load i8** %ret, align 8
  %73 = load i32* %4, align 4
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds i8* %72, i64 %74
  %76 = call %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %70, %struct._RV_stat_node* null, i32 4, i8* %71, i8* %75)
  br label %77

; <label>:77                                      ; preds = %69, %17
  %78 = load i8* %ptr_pmd_freed, align 1
  %79 = icmp ne i8 %78, 0
  br i1 %79, label %82, label %80

; <label>:80                                      ; preds = %77
  %81 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %81)
  br label %82

; <label>:82                                      ; preds = %80, %77
  %83 = load i8** %ret, align 8
  ret i8* %83
}

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #3

; Function Attrs: nounwind uwtable
define void @_RV_free(%struct._RV_pmd* %ptr_pmd, i8* %ptr, i8* %file_name, i8* %func_name, i32 %p_line, i32 %p_col, i8* %p_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %ptr_pmd_freed = alloca i8, align 1
  %p = alloca i8*, align 8
  %stat = alloca i32, align 4
  store %struct._RV_pmd* %ptr_pmd, %struct._RV_pmd** %1, align 8
  store i8* %ptr, i8** %2, align 8
  store i8* %file_name, i8** %3, align 8
  store i8* %func_name, i8** %4, align 8
  store i32 %p_line, i32* %5, align 4
  store i32 %p_col, i32* %6, align 4
  store i8* %p_name, i8** %7, align 8
  store i8 0, i8* %ptr_pmd_freed, align 1
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = call i32 @_RV_pmd_get_stat(%struct._RV_pmd* %8)
  store i32 %9, i32* %stat, align 4
  %10 = load i8** %2, align 8
  %11 = icmp eq i8* %10, null
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %0
  br label %137

; <label>:13                                      ; preds = %0
  %14 = load %struct._RV_pmd** %1, align 8
  %15 = icmp eq %struct._RV_pmd* %14, null
  br i1 %15, label %16, label %30

; <label>:16                                      ; preds = %13
  %17 = load %struct._IO_FILE** @stderr, align 8
  %18 = load i8** %3, align 8
  %19 = load i8** %4, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([23 x i8]* @.str15, i32 0, i32 0), i8* %18, i8* %19)
  %21 = load %struct._IO_FILE** @stderr, align 8
  %22 = load i8** %3, align 8
  %23 = load i32* %5, align 4
  %24 = load i32* %6, align 4
  %25 = load i8** %7, align 8
  %26 = load i8** %2, align 8
  %27 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([109 x i8]* @.str25, i32 0, i32 0), i8* %22, i32 %23, i32 %24, i8* %25, i8* %26)
  %28 = load i64* @_RV_error_count, align 8
  %29 = add i64 %28, 1
  store i64 %29, i64* @_RV_error_count, align 8
  br label %30

; <label>:30                                      ; preds = %16, %13
  %31 = load i32* %stat, align 4
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %53

; <label>:33                                      ; preds = %30
  %34 = load %struct._IO_FILE** @stderr, align 8
  %35 = load i8** %3, align 8
  %36 = load i8** %4, align 8
  %37 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([23 x i8]* @.str15, i32 0, i32 0), i8* %35, i8* %36)
  %38 = load %struct._IO_FILE** @stderr, align 8
  %39 = load i8** %3, align 8
  %40 = load i32* %5, align 4
  %41 = load i32* %6, align 4
  %42 = load i8** %7, align 8
  %43 = load i8** %2, align 8
  %44 = load %struct._RV_pmd** %1, align 8
  %45 = getelementptr inbounds %struct._RV_pmd* %44, i32 0, i32 0
  %46 = load i8** %45, align 8
  %47 = load %struct._RV_pmd** %1, align 8
  %48 = getelementptr inbounds %struct._RV_pmd* %47, i32 0, i32 1
  %49 = load i8** %48, align 8
  %50 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %38, i8* getelementptr inbounds ([137 x i8]* @.str26, i32 0, i32 0), i8* %39, i32 %40, i32 %41, i8* %42, i8* %43, i8* %46, i8* %49)
  %51 = load i64* @_RV_error_count, align 8
  %52 = add i64 %51, 1
  store i64 %52, i64* @_RV_error_count, align 8
  br label %53

; <label>:53                                      ; preds = %33, %30
  %54 = load i32* %stat, align 4
  %55 = icmp ne i32 %54, 4
  br i1 %55, label %56, label %79

; <label>:56                                      ; preds = %53
  %57 = load i32* %stat, align 4
  %58 = icmp ne i32 %57, 6
  br i1 %58, label %59, label %79

; <label>:59                                      ; preds = %56
  %60 = load %struct._IO_FILE** @stderr, align 8
  %61 = load i8** %3, align 8
  %62 = load i8** %4, align 8
  %63 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %60, i8* getelementptr inbounds ([23 x i8]* @.str15, i32 0, i32 0), i8* %61, i8* %62)
  %64 = load %struct._IO_FILE** @stderr, align 8
  %65 = load i8** %3, align 8
  %66 = load i32* %5, align 4
  %67 = load i32* %6, align 4
  %68 = load i8** %7, align 8
  %69 = load i8** %2, align 8
  %70 = load %struct._RV_pmd** %1, align 8
  %71 = getelementptr inbounds %struct._RV_pmd* %70, i32 0, i32 0
  %72 = load i8** %71, align 8
  %73 = load %struct._RV_pmd** %1, align 8
  %74 = getelementptr inbounds %struct._RV_pmd* %73, i32 0, i32 1
  %75 = load i8** %74, align 8
  %76 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %64, i8* getelementptr inbounds ([140 x i8]* @.str27, i32 0, i32 0), i8* %65, i32 %66, i32 %67, i8* %68, i8* %69, i8* %72, i8* %75)
  %77 = load i64* @_RV_error_count, align 8
  %78 = add i64 %77, 1
  store i64 %78, i64* @_RV_error_count, align 8
  br label %79

; <label>:79                                      ; preds = %59, %56, %53
  %80 = load %struct._RV_pmd** %1, align 8
  %81 = icmp ne %struct._RV_pmd* %80, null
  br i1 %81, label %82, label %108

; <label>:82                                      ; preds = %79
  %83 = load i8** %2, align 8
  %84 = load %struct._RV_pmd** %1, align 8
  %85 = getelementptr inbounds %struct._RV_pmd* %84, i32 0, i32 0
  %86 = load i8** %85, align 8
  %87 = icmp ne i8* %83, %86
  br i1 %87, label %88, label %108

; <label>:88                                      ; preds = %82
  %89 = load %struct._IO_FILE** @stderr, align 8
  %90 = load i8** %3, align 8
  %91 = load i8** %4, align 8
  %92 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %89, i8* getelementptr inbounds ([23 x i8]* @.str15, i32 0, i32 0), i8* %90, i8* %91)
  %93 = load %struct._IO_FILE** @stderr, align 8
  %94 = load i8** %3, align 8
  %95 = load i32* %5, align 4
  %96 = load i32* %6, align 4
  %97 = load i8** %7, align 8
  %98 = load i8** %2, align 8
  %99 = load %struct._RV_pmd** %1, align 8
  %100 = getelementptr inbounds %struct._RV_pmd* %99, i32 0, i32 0
  %101 = load i8** %100, align 8
  %102 = load %struct._RV_pmd** %1, align 8
  %103 = getelementptr inbounds %struct._RV_pmd* %102, i32 0, i32 1
  %104 = load i8** %103, align 8
  %105 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %93, i8* getelementptr inbounds ([132 x i8]* @.str28, i32 0, i32 0), i8* %94, i32 %95, i32 %96, i8* %97, i8* %98, i8* %101, i8* %104)
  %106 = load i64* @_RV_error_count, align 8
  %107 = add i64 %106, 1
  store i64 %107, i64* @_RV_error_count, align 8
  br label %108

; <label>:108                                     ; preds = %88, %82, %79
  %109 = load i8** %2, align 8
  call void @free(i8* %109) #7
  %110 = load %struct._RV_pmd** %1, align 8
  %111 = icmp ne %struct._RV_pmd* %110, null
  br i1 %111, label %112, label %119

; <label>:112                                     ; preds = %108
  %113 = load %struct._RV_pmd** %1, align 8
  %114 = call i32 @_RV_pmd_get_stat(%struct._RV_pmd* %113)
  %115 = icmp eq i32 %114, 4
  br i1 %115, label %116, label %118

; <label>:116                                     ; preds = %112
  %117 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_stat(%struct._RV_pmd* %117, i32 0)
  br label %118

; <label>:118                                     ; preds = %116, %112
  br label %119

; <label>:119                                     ; preds = %118, %108
  %120 = load i8** %2, align 8
  store i8* %120, i8** %p, align 8
  br label %121

; <label>:121                                     ; preds = %129, %119
  %122 = load i8** %p, align 8
  %123 = load %struct._RV_pmd** %1, align 8
  %124 = call i8* @_RV_pmd_get_bound(%struct._RV_pmd* %123)
  %125 = icmp ult i8* %122, %124
  br i1 %125, label %126, label %132

; <label>:126                                     ; preds = %121
  store i8 0, i8* %ptr_pmd_freed, align 1
  %127 = load i8** %p, align 8
  %128 = bitcast i8* %127 to i8**
  call void @_RV_pmd_tbl_remove(i8** %128)
  br label %129

; <label>:129                                     ; preds = %126
  %130 = load i8** %p, align 8
  %131 = getelementptr i8* %130, i64 8
  store i8* %131, i8** %p, align 8
  br label %121

; <label>:132                                     ; preds = %121
  %133 = load i8* %ptr_pmd_freed, align 1
  %134 = icmp ne i8 %133, 0
  br i1 %134, label %137, label %135

; <label>:135                                     ; preds = %132
  %136 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %136)
  br label %137

; <label>:137                                     ; preds = %135, %132, %12
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @_RV_atexit(%struct._RV_pmd* %func_pmd, void ()* %func, i8* %file_name, i8* %func_name, i32 %f_line, i32 %f_col, i8* %f_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca void ()*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store %struct._RV_pmd* %func_pmd, %struct._RV_pmd** %1, align 8
  store void ()* %func, void ()** %2, align 8
  store i8* %file_name, i8** %3, align 8
  store i8* %func_name, i8** %4, align 8
  store i32 %f_line, i32* %5, align 4
  store i32 %f_col, i32* %6, align 4
  store i8* %f_name, i8** %7, align 8
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load void ()** %2, align 8
  %10 = bitcast void ()* %9 to i8*
  %11 = load i8** %3, align 8
  %12 = load i8** %4, align 8
  %13 = load i32* %5, align 4
  %14 = load i32* %6, align 4
  %15 = load i8** %7, align 8
  %16 = call i8* @_RV_check_dpfv(%struct._RV_pmd* %8, i8* %10, i8* %11, i8* %12, i32 %13, i32 %14, i8* %15)
  %17 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %17)
  %18 = load void ()** %2, align 8
  %19 = call i32 @atexit(void ()* %18) #7
  ret i32 %19
}

; Function Attrs: nounwind
declare i32 @atexit(void ()*) #3

; Function Attrs: nounwind uwtable
define i8* @_RV_getenv(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %name_pmd, i8* %name, i8* %file_name, i8* %func_name, i32 %n_line, i32 %n_col, i8* %n_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %ret = alloca i8*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %name_pmd, %struct._RV_pmd** %2, align 8
  store i8* %name, i8** %3, align 8
  store i8* %file_name, i8** %4, align 8
  store i8* %func_name, i8** %5, align 8
  store i32 %n_line, i32* %6, align 4
  store i32 %n_col, i32* %7, align 4
  store i8* %n_name, i8** %8, align 8
  %9 = load %struct._RV_pmd** %2, align 8
  %10 = load i8** %3, align 8
  %11 = load i8** %3, align 8
  %12 = call i32 @_RV_sstrlen(i8* %11)
  %13 = add nsw i32 %12, 1
  %14 = sext i32 %13 to i64
  %15 = load i8** %4, align 8
  %16 = load i8** %5, align 8
  %17 = load i32* %6, align 4
  %18 = load i32* %7, align 4
  %19 = load i8** %8, align 8
  %zybc_ = bitcast %struct._RV_pmd* %9 to i8*
  %zybc_1 = bitcast i8* %10 to i8*
  %zyarg_ = inttoptr i64 %14 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %15 to i8*
  %zybc_4 = bitcast i8* %16 to i8*
  %zyarg_5 = inttoptr i32 %17 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %18 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %19 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 1296999742, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_58_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %20 = load i8** %3, align 8
  %21 = call i8* @getenv(i8* %20) #7
  store i8* %21, i8** %ret, align 8
  %22 = load i8** %ret, align 8
  %23 = icmp eq i8* %22, null
  br i1 %23, label %24, label %26

; <label>:24                                      ; preds = %0
  %25 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %25)
  br label %37

; <label>:26                                      ; preds = %0
  %27 = load %struct._RV_pmd** %1, align 8
  %28 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %29 = load i8** %ret, align 8
  %30 = load i8** %ret, align 8
  %31 = load i8** %ret, align 8
  %32 = call i32 @_RV_sstrlen(i8* %31)
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i8* %30, i64 %33
  %35 = getelementptr inbounds i8* %34, i64 1
  %36 = call %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %27, %struct._RV_stat_node* %28, i32 0, i8* %29, i8* %35)
  br label %37

; <label>:37                                      ; preds = %26, %24
  call void @_Z4joinj(i32 1296999742)
  %38 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %38)
  %39 = load i8** %ret, align 8
  ret i8* %39
}

; Function Attrs: nounwind
declare i8* @getenv(i8*) #3

; Function Attrs: nounwind uwtable
define i32 @_RV_system(%struct._RV_pmd* %str_pmd, i8* %str, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store %struct._RV_pmd* %str_pmd, %struct._RV_pmd** %1, align 8
  store i8* %str, i8** %2, align 8
  store i8* %file_name, i8** %3, align 8
  store i8* %func_name, i8** %4, align 8
  store i32 %s_line, i32* %5, align 4
  store i32 %s_col, i32* %6, align 4
  store i8* %s_name, i8** %7, align 8
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load i8** %2, align 8
  %10 = load i8** %2, align 8
  %11 = call i32 @_RV_sstrlen(i8* %10)
  %12 = add nsw i32 %11, 1
  %13 = sext i32 %12 to i64
  %14 = load i8** %3, align 8
  %15 = load i8** %4, align 8
  %16 = load i32* %5, align 4
  %17 = load i32* %6, align 4
  %18 = load i8** %7, align 8
  %zybc_ = bitcast %struct._RV_pmd* %8 to i8*
  %zybc_1 = bitcast i8* %9 to i8*
  %zyarg_ = inttoptr i64 %13 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %14 to i8*
  %zybc_4 = bitcast i8* %15 to i8*
  %zyarg_5 = inttoptr i32 %16 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %17 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %18 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 107433082, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_59_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %19 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %19)
  %20 = load i8** %2, align 8
  %21 = call i32 @system(i8* %20)
  call void @_Z4joinj(i32 107433082)
  ret i32 %21
}

declare i32 @system(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @_RV_mblen(%struct._RV_pmd* %str_pmd, i8* %str, i64 %n, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  store %struct._RV_pmd* %str_pmd, %struct._RV_pmd** %1, align 8
  store i8* %str, i8** %2, align 8
  store i64 %n, i64* %3, align 8
  store i8* %file_name, i8** %4, align 8
  store i8* %func_name, i8** %5, align 8
  store i32 %s_line, i32* %6, align 4
  store i32 %s_col, i32* %7, align 4
  store i8* %s_name, i8** %8, align 8
  %9 = load %struct._RV_pmd** %1, align 8
  %10 = load i8** %2, align 8
  %11 = load i8** %2, align 8
  %12 = call i32 @_RV_sstrlen(i8* %11)
  %13 = add nsw i32 %12, 1
  %14 = sext i32 %13 to i64
  %15 = load i8** %4, align 8
  %16 = load i8** %5, align 8
  %17 = load i32* %6, align 4
  %18 = load i32* %7, align 4
  %19 = load i8** %8, align 8
  %zybc_ = bitcast %struct._RV_pmd* %9 to i8*
  %zybc_1 = bitcast i8* %10 to i8*
  %zyarg_ = inttoptr i64 %14 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %15 to i8*
  %zybc_4 = bitcast i8* %16 to i8*
  %zyarg_5 = inttoptr i32 %17 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %18 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %19 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 1717638408, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_60_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %20 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %20)
  %21 = load i8** %2, align 8
  %22 = load i64* %3, align 8
  %23 = call i32 @mblen(i8* %21, i64 %22) #7
  call void @_Z4joinj(i32 1717638408)
  ret i32 %23
}

; Function Attrs: nounwind
declare i32 @mblen(i8*, i64) #3

; Function Attrs: nounwind uwtable
define i64 @_RV_mbstowcs(%struct._RV_pmd* %pwcs_pmd, %struct._RV_pmd* %str_pmd, i32* %pwcs, i8* %str, i64 %n, i8* %file_name, i8* %func_name, i32 %p_line, i32 %p_col, i8* %p_name, i32 %s_line, i32 %s_col, i8* %s_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  store %struct._RV_pmd* %pwcs_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %str_pmd, %struct._RV_pmd** %2, align 8
  store i32* %pwcs, i32** %3, align 8
  store i8* %str, i8** %4, align 8
  store i64 %n, i64* %5, align 8
  store i8* %file_name, i8** %6, align 8
  store i8* %func_name, i8** %7, align 8
  store i32 %p_line, i32* %8, align 4
  store i32 %p_col, i32* %9, align 4
  store i8* %p_name, i8** %10, align 8
  store i32 %s_line, i32* %11, align 4
  store i32 %s_col, i32* %12, align 4
  store i8* %s_name, i8** %13, align 8
  %14 = load %struct._RV_pmd** %1, align 8
  %15 = load i32** %3, align 8
  %16 = bitcast i32* %15 to i8*
  %17 = load i8** %6, align 8
  %18 = load i8** %7, align 8
  %19 = load i32* %8, align 4
  %20 = load i32* %9, align 4
  %21 = load i8** %10, align 8
  %zybc_ = bitcast %struct._RV_pmd* %14 to i8*
  %zybc_1 = bitcast i8* %16 to i8*
  %zyarg_ = inttoptr i64 4 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %17 to i8*
  %zybc_4 = bitcast i8* %18 to i8*
  %zyarg_5 = inttoptr i32 %19 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %20 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %21 to i8*
  %22 = load %struct._RV_pmd** %2, align 8
  %23 = load i8** %4, align 8
  %24 = load i8** %4, align 8
  %25 = call i32 @_RV_sstrlen(i8* %24)
  %26 = add nsw i32 %25, 1
  %27 = sext i32 %26 to i64
  %28 = load i8** %6, align 8
  %29 = load i8** %7, align 8
  %30 = load i32* %11, align 4
  %31 = load i32* %12, align 4
  %32 = load i8** %13, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %22 to i8*
  %zybc_11 = bitcast i8* %23 to i8*
  %zyarg_12 = inttoptr i64 %27 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %28 to i8*
  %zybc_15 = bitcast i8* %29 to i8*
  %zyarg_16 = inttoptr i32 %30 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %31 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %32 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 276772529, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_61_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %33 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %33)
  %34 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %34)
  %35 = load i32** %3, align 8
  %36 = load i8** %4, align 8
  %37 = load i64* %5, align 8
  %38 = call i64 @mbstowcs(i32* %35, i8* %36, i64 %37) #7
  call void @_Z4joinj(i32 276772529)
  ret i64 %38
}

; Function Attrs: nounwind
declare i64 @mbstowcs(i32*, i8*, i64) #3

; Function Attrs: nounwind uwtable
define i32 @_RV_mbtowc(%struct._RV_pmd* %pwc_pmd, %struct._RV_pmd* %str_pmd, i32* %pwc, i8* %str, i64 %n, i8* %file_name, i8* %func_name, i32 %p_line, i32 %p_col, i8* %p_name, i32 %s_line, i32 %s_col, i8* %s_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  store %struct._RV_pmd* %pwc_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %str_pmd, %struct._RV_pmd** %2, align 8
  store i32* %pwc, i32** %3, align 8
  store i8* %str, i8** %4, align 8
  store i64 %n, i64* %5, align 8
  store i8* %file_name, i8** %6, align 8
  store i8* %func_name, i8** %7, align 8
  store i32 %p_line, i32* %8, align 4
  store i32 %p_col, i32* %9, align 4
  store i8* %p_name, i8** %10, align 8
  store i32 %s_line, i32* %11, align 4
  store i32 %s_col, i32* %12, align 4
  store i8* %s_name, i8** %13, align 8
  %14 = load %struct._RV_pmd** %1, align 8
  %15 = load i32** %3, align 8
  %16 = bitcast i32* %15 to i8*
  %17 = load i8** %6, align 8
  %18 = load i8** %7, align 8
  %19 = load i32* %8, align 4
  %20 = load i32* %9, align 4
  %21 = load i8** %10, align 8
  %zybc_ = bitcast %struct._RV_pmd* %14 to i8*
  %zybc_1 = bitcast i8* %16 to i8*
  %zyarg_ = inttoptr i64 4 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %17 to i8*
  %zybc_4 = bitcast i8* %18 to i8*
  %zyarg_5 = inttoptr i32 %19 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %20 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %21 to i8*
  %22 = load %struct._RV_pmd** %2, align 8
  %23 = load i8** %4, align 8
  %24 = load i8** %4, align 8
  %25 = call i32 @_RV_sstrlen(i8* %24)
  %26 = add nsw i32 %25, 1
  %27 = sext i32 %26 to i64
  %28 = load i8** %6, align 8
  %29 = load i8** %7, align 8
  %30 = load i32* %11, align 4
  %31 = load i32* %12, align 4
  %32 = load i8** %13, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %22 to i8*
  %zybc_11 = bitcast i8* %23 to i8*
  %zyarg_12 = inttoptr i64 %27 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %28 to i8*
  %zybc_15 = bitcast i8* %29 to i8*
  %zyarg_16 = inttoptr i32 %30 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %31 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %32 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 147430792, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_62_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %33 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %33)
  %34 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %34)
  %35 = load i32** %3, align 8
  %36 = load i8** %4, align 8
  %37 = load i64* %5, align 8
  %38 = call i32 @mbtowc(i32* %35, i8* %36, i64 %37) #7
  call void @_Z4joinj(i32 147430792)
  ret i32 %38
}

; Function Attrs: nounwind
declare i32 @mbtowc(i32*, i8*, i64) #3

; Function Attrs: nounwind uwtable
define i64 @_RV_wcstombs(%struct._RV_pmd* %str_pmd, %struct._RV_pmd* %pwcs_pmd, i8* %str, i32* %pwcs, i64 %n, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name, i32 %p_line, i32 %p_col, i8* %p_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  store %struct._RV_pmd* %str_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %pwcs_pmd, %struct._RV_pmd** %2, align 8
  store i8* %str, i8** %3, align 8
  store i32* %pwcs, i32** %4, align 8
  store i64 %n, i64* %5, align 8
  store i8* %file_name, i8** %6, align 8
  store i8* %func_name, i8** %7, align 8
  store i32 %s_line, i32* %8, align 4
  store i32 %s_col, i32* %9, align 4
  store i8* %s_name, i8** %10, align 8
  store i32 %p_line, i32* %11, align 4
  store i32 %p_col, i32* %12, align 4
  store i8* %p_name, i8** %13, align 8
  %14 = load %struct._RV_pmd** %1, align 8
  %15 = load i8** %3, align 8
  %16 = load i8** %3, align 8
  %17 = call i32 @_RV_sstrlen(i8* %16)
  %18 = add nsw i32 %17, 1
  %19 = sext i32 %18 to i64
  %20 = load i8** %6, align 8
  %21 = load i8** %7, align 8
  %22 = load i32* %8, align 4
  %23 = load i32* %9, align 4
  %24 = load i8** %10, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %14 to i8*
  %zybc_11 = bitcast i8* %15 to i8*
  %zyarg_12 = inttoptr i64 %19 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %20 to i8*
  %zybc_15 = bitcast i8* %21 to i8*
  %zyarg_16 = inttoptr i32 %22 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %23 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %24 to i8*
  %25 = load %struct._RV_pmd** %2, align 8
  %26 = load i32** %4, align 8
  %27 = bitcast i32* %26 to i8*
  %28 = load i8** %6, align 8
  %29 = load i8** %7, align 8
  %30 = load i32* %11, align 4
  %31 = load i32* %12, align 4
  %32 = load i8** %13, align 8
  %zybc_ = bitcast %struct._RV_pmd* %25 to i8*
  %zybc_1 = bitcast i8* %27 to i8*
  %zyarg_ = inttoptr i64 4 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %28 to i8*
  %zybc_4 = bitcast i8* %29 to i8*
  %zyarg_5 = inttoptr i32 %30 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %31 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %32 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 -1821758947, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_63_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %33 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %33)
  %34 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %34)
  %35 = load i8** %3, align 8
  %36 = load i32** %4, align 8
  %37 = load i64* %5, align 8
  %38 = call i64 @wcstombs(i8* %35, i32* %36, i64 %37) #7
  call void @_Z4joinj(i32 -1821758947)
  ret i64 %38
}

; Function Attrs: nounwind
declare i64 @wcstombs(i8*, i32*, i64) #3

; Function Attrs: nounwind uwtable
define i32 @_RV_wctomb(%struct._RV_pmd* %str_pmd, i8* %str, i32 %wchar, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  store %struct._RV_pmd* %str_pmd, %struct._RV_pmd** %1, align 8
  store i8* %str, i8** %2, align 8
  store i32 %wchar, i32* %3, align 4
  store i8* %file_name, i8** %4, align 8
  store i8* %func_name, i8** %5, align 8
  store i32 %s_line, i32* %6, align 4
  store i32 %s_col, i32* %7, align 4
  store i8* %s_name, i8** %8, align 8
  %9 = load %struct._RV_pmd** %1, align 8
  %10 = load i8** %2, align 8
  %11 = load i8** %2, align 8
  %12 = call i32 @_RV_sstrlen(i8* %11)
  %13 = add nsw i32 %12, 1
  %14 = sext i32 %13 to i64
  %15 = load i8** %4, align 8
  %16 = load i8** %5, align 8
  %17 = load i32* %6, align 4
  %18 = load i32* %7, align 4
  %19 = load i8** %8, align 8
  %zybc_ = bitcast %struct._RV_pmd* %9 to i8*
  %zybc_1 = bitcast i8* %10 to i8*
  %zyarg_ = inttoptr i64 %14 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %15 to i8*
  %zybc_4 = bitcast i8* %16 to i8*
  %zyarg_5 = inttoptr i32 %17 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %18 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %19 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -586675846, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_64_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %20 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %20)
  %21 = load i8** %2, align 8
  %22 = load i32* %3, align 4
  %23 = call i32 @wctomb(i8* %21, i32 %22) #7
  call void @_Z4joinj(i32 -586675846)
  ret i32 %23
}

; Function Attrs: nounwind
declare i32 @wctomb(i8*, i32) #3

; Function Attrs: nounwind uwtable
define i8* @_RV_bsearch(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %key_pmd, %struct._RV_pmd* %base_pmd, %struct._RV_pmd* %compar_pmd, i8* %key, i8* %base, i64 %num, i64 %size, i32 (i8*, i8*)* %compar, i8* %file_name, i8* %func_name, i32 %k_line, i32 %k_col, i8* %k_name, i32 %b_line, i32 %b_col, i8* %b_name, i32 %c_line, i32 %c_col, i8* %c_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._RV_pmd*, align 8
  %4 = alloca %struct._RV_pmd*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32 (i8*, i8*)*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i8*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i8*, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i8*, align 8
  %ret = alloca i8*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %key_pmd, %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %base_pmd, %struct._RV_pmd** %3, align 8
  store %struct._RV_pmd* %compar_pmd, %struct._RV_pmd** %4, align 8
  store i8* %key, i8** %5, align 8
  store i8* %base, i8** %6, align 8
  store i64 %num, i64* %7, align 8
  store i64 %size, i64* %8, align 8
  store i32 (i8*, i8*)* %compar, i32 (i8*, i8*)** %9, align 8
  store i8* %file_name, i8** %10, align 8
  store i8* %func_name, i8** %11, align 8
  store i32 %k_line, i32* %12, align 4
  store i32 %k_col, i32* %13, align 4
  store i8* %k_name, i8** %14, align 8
  store i32 %b_line, i32* %15, align 4
  store i32 %b_col, i32* %16, align 4
  store i8* %b_name, i8** %17, align 8
  store i32 %c_line, i32* %18, align 4
  store i32 %c_col, i32* %19, align 4
  store i8* %c_name, i8** %20, align 8
  %21 = load %struct._RV_pmd** %2, align 8
  %22 = load i8** %5, align 8
  %23 = load i64* %8, align 8
  %24 = load i8** %10, align 8
  %25 = load i8** %11, align 8
  %26 = load i32* %12, align 4
  %27 = load i32* %13, align 4
  %28 = load i8** %14, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %21 to i8*
  %zybc_11 = bitcast i8* %22 to i8*
  %zyarg_12 = inttoptr i64 %23 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %24 to i8*
  %zybc_15 = bitcast i8* %25 to i8*
  %zyarg_16 = inttoptr i32 %26 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %27 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %28 to i8*
  %29 = load %struct._RV_pmd** %3, align 8
  %30 = load i8** %6, align 8
  %31 = load i64* %7, align 8
  %32 = load i64* %8, align 8
  %33 = mul i64 %31, %32
  %34 = load i8** %10, align 8
  %35 = load i8** %11, align 8
  %36 = load i32* %15, align 4
  %37 = load i32* %16, align 4
  %38 = load i8** %17, align 8
  %zybc_ = bitcast %struct._RV_pmd* %29 to i8*
  %zybc_1 = bitcast i8* %30 to i8*
  %zyarg_ = inttoptr i64 %33 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %34 to i8*
  %zybc_4 = bitcast i8* %35 to i8*
  %zyarg_5 = inttoptr i32 %36 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %37 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %38 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 1496276758, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_65_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %39 = load %struct._RV_pmd** %4, align 8
  %40 = load i32 (i8*, i8*)** %9, align 8
  %41 = bitcast i32 (i8*, i8*)* %40 to i8*
  %42 = load i8** %10, align 8
  %43 = load i8** %11, align 8
  %44 = load i32* %18, align 4
  %45 = load i32* %19, align 4
  %46 = load i8** %20, align 8
  %47 = call i8* @_RV_check_dpfv(%struct._RV_pmd* %39, i8* %41, i8* %42, i8* %43, i32 %44, i32 %45, i8* %46)
  %48 = load i32 (i8*, i8*)** %9, align 8
  %49 = bitcast i32 (i8*, i8*)* %48 to void (...)*
  %50 = call %struct._RV_fmd* @_RV_fmd_tbl_create(void (...)* %49, i8 zeroext 2)
  %51 = load i32 (i8*, i8*)** %9, align 8
  %52 = bitcast i32 (i8*, i8*)* %51 to void (...)*
  %53 = load %struct._RV_pmd** %2, align 8
  %54 = call %struct._RV_fmd* @_RV_fmd_tbl_update_pmd(void (...)* %52, i8 zeroext 0, %struct._RV_pmd* %53)
  %55 = load i32 (i8*, i8*)** %9, align 8
  %56 = bitcast i32 (i8*, i8*)* %55 to void (...)*
  %57 = load %struct._RV_pmd** %3, align 8
  %58 = call %struct._RV_fmd* @_RV_fmd_tbl_update_pmd(void (...)* %56, i8 zeroext 1, %struct._RV_pmd* %57)
  %59 = load i8** %5, align 8
  %60 = load i8** %6, align 8
  %61 = load i64* %7, align 8
  %62 = load i64* %8, align 8
  %63 = load i32 (i8*, i8*)** %9, align 8
  %64 = call i8* @bsearch(i8* %59, i8* %60, i64 %61, i64 %62, i32 (i8*, i8*)* %63)
  store i8* %64, i8** %ret, align 8
  %65 = load i32 (i8*, i8*)** %9, align 8
  %66 = bitcast i32 (i8*, i8*)* %65 to void (...)*
  call void @_RV_fmd_tbl_remove(void (...)* %66)
  %67 = load i8** %ret, align 8
  %68 = icmp eq i8* %67, null
  br i1 %68, label %69, label %71

; <label>:69                                      ; preds = %0
  %70 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %70)
  br label %75

; <label>:71                                      ; preds = %0
  %72 = load %struct._RV_pmd** %1, align 8
  %73 = load %struct._RV_pmd** %3, align 8
  %74 = call %struct._RV_pmd* @_RV_pmd_cp_pmd(%struct._RV_pmd* %72, %struct._RV_pmd* %73)
  br label %75

; <label>:75                                      ; preds = %71, %69
  call void @_Z4joinj(i32 1496276758)
  %76 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %76)
  %77 = load %struct._RV_pmd** %3, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %77)
  %78 = load %struct._RV_pmd** %4, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %78)
  %79 = load i8** %ret, align 8
  ret i8* %79
}

declare i8* @bsearch(i8*, i8*, i64, i64, i32 (i8*, i8*)*) #1

; Function Attrs: nounwind uwtable
define void @_RV_qsort(%struct._RV_pmd* %base_pmd, %struct._RV_pmd* %compar_pmd, i8* %base, i64 %num, i64 %size, i32 (i8*, i8*)* %compar, i8* %file_name, i8* %func_name, i32 %b_line, i32 %b_col, i8* %b_name, i32 %c_line, i32 %c_col, i8* %c_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32 (i8*, i8*)*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i8*, align 8
  store %struct._RV_pmd* %base_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %compar_pmd, %struct._RV_pmd** %2, align 8
  store i8* %base, i8** %3, align 8
  store i64 %num, i64* %4, align 8
  store i64 %size, i64* %5, align 8
  store i32 (i8*, i8*)* %compar, i32 (i8*, i8*)** %6, align 8
  store i8* %file_name, i8** %7, align 8
  store i8* %func_name, i8** %8, align 8
  store i32 %b_line, i32* %9, align 4
  store i32 %b_col, i32* %10, align 4
  store i8* %b_name, i8** %11, align 8
  store i32 %c_line, i32* %12, align 4
  store i32 %c_col, i32* %13, align 4
  store i8* %c_name, i8** %14, align 8
  %15 = load %struct._RV_pmd** %1, align 8
  %16 = load i8** %3, align 8
  %17 = load i64* %4, align 8
  %18 = load i64* %5, align 8
  %19 = mul i64 %17, %18
  %20 = load i8** %7, align 8
  %21 = load i8** %8, align 8
  %22 = load i32* %9, align 4
  %23 = load i32* %10, align 4
  %24 = load i8** %11, align 8
  %zybc_ = bitcast %struct._RV_pmd* %15 to i8*
  %zybc_1 = bitcast i8* %16 to i8*
  %zyarg_ = inttoptr i64 %19 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %20 to i8*
  %zybc_4 = bitcast i8* %21 to i8*
  %zyarg_5 = inttoptr i32 %22 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %23 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %24 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -361690416, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_66_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %25 = load %struct._RV_pmd** %2, align 8
  %26 = load i32 (i8*, i8*)** %6, align 8
  %27 = bitcast i32 (i8*, i8*)* %26 to i8*
  %28 = load i8** %7, align 8
  %29 = load i8** %8, align 8
  %30 = load i32* %12, align 4
  %31 = load i32* %13, align 4
  %32 = load i8** %14, align 8
  %33 = call i8* @_RV_check_dpfv(%struct._RV_pmd* %25, i8* %27, i8* %28, i8* %29, i32 %30, i32 %31, i8* %32)
  %34 = load i32 (i8*, i8*)** %6, align 8
  %35 = bitcast i32 (i8*, i8*)* %34 to void (...)*
  %36 = call %struct._RV_fmd* @_RV_fmd_tbl_create(void (...)* %35, i8 zeroext 2)
  %37 = load i32 (i8*, i8*)** %6, align 8
  %38 = bitcast i32 (i8*, i8*)* %37 to void (...)*
  %39 = load %struct._RV_pmd** %1, align 8
  %40 = call %struct._RV_fmd* @_RV_fmd_tbl_update_pmd(void (...)* %38, i8 zeroext 0, %struct._RV_pmd* %39)
  %41 = load i32 (i8*, i8*)** %6, align 8
  %42 = bitcast i32 (i8*, i8*)* %41 to void (...)*
  %43 = load %struct._RV_pmd** %1, align 8
  %44 = call %struct._RV_fmd* @_RV_fmd_tbl_update_pmd(void (...)* %42, i8 zeroext 1, %struct._RV_pmd* %43)
  %45 = load i8** %3, align 8
  %46 = load i64* %4, align 8
  %47 = load i64* %5, align 8
  %48 = load i32 (i8*, i8*)** %6, align 8
  call void @qsort(i8* %45, i64 %46, i64 %47, i32 (i8*, i8*)* %48)
  %49 = load i32 (i8*, i8*)** %6, align 8
  %50 = bitcast i32 (i8*, i8*)* %49 to void (...)*
  call void @_RV_fmd_tbl_remove(void (...)* %50)
  %51 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %51)
  %52 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %52)
  call void @_Z4joinj(i32 -361690416)
  ret void
}

declare void @qsort(i8*, i64, i64, i32 (i8*, i8*)*) #1

; Function Attrs: nounwind uwtable
define i8* @_RV_memchr(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %src_pmd, i8* %src, i32 %c, i64 %n, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %ret = alloca i8*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %src_pmd, %struct._RV_pmd** %2, align 8
  store i8* %src, i8** %3, align 8
  store i32 %c, i32* %4, align 4
  store i64 %n, i64* %5, align 8
  store i8* %file_name, i8** %6, align 8
  store i8* %func_name, i8** %7, align 8
  store i32 %s_line, i32* %8, align 4
  store i32 %s_col, i32* %9, align 4
  store i8* %s_name, i8** %10, align 8
  %11 = load %struct._RV_pmd** %2, align 8
  %12 = load i8** %3, align 8
  %13 = load i64* %5, align 8
  %14 = load i8** %6, align 8
  %15 = load i8** %7, align 8
  %16 = load i32* %8, align 4
  %17 = load i32* %9, align 4
  %18 = load i8** %10, align 8
  %zybc_ = bitcast %struct._RV_pmd* %11 to i8*
  %zybc_1 = bitcast i8* %12 to i8*
  %zyarg_ = inttoptr i64 %13 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %14 to i8*
  %zybc_4 = bitcast i8* %15 to i8*
  %zyarg_5 = inttoptr i32 %16 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %17 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %18 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -284672171, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_67_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %19 = load i8** %3, align 8
  %20 = load i32* %4, align 4
  %21 = load i64* %5, align 8
  %22 = call i8* @memchr(i8* %19, i32 %20, i64 %21) #10
  store i8* %22, i8** %ret, align 8
  %23 = load i8** %ret, align 8
  %24 = icmp eq i8* %23, null
  br i1 %24, label %25, label %27

; <label>:25                                      ; preds = %0
  %26 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %26)
  br label %31

; <label>:27                                      ; preds = %0
  %28 = load %struct._RV_pmd** %1, align 8
  %29 = load %struct._RV_pmd** %2, align 8
  %30 = call %struct._RV_pmd* @_RV_pmd_cp_pmd(%struct._RV_pmd* %28, %struct._RV_pmd* %29)
  br label %31

; <label>:31                                      ; preds = %27, %25
  call void @_Z4joinj(i32 -284672171)
  %32 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %32)
  %33 = load i8** %ret, align 8
  ret i8* %33
}

; Function Attrs: nounwind readonly
declare i8* @memchr(i8*, i32, i64) #6

; Function Attrs: nounwind uwtable
define i32 @_RV_memcmp(%struct._RV_pmd* %str1_pmd, %struct._RV_pmd* %str2_pmd, i8* %str1, i8* %str2, i64 %n, i8* %file_name, i8* %func_name, i32 %s1_line, i32 %s1_col, i8* %s1_name, i32 %s2_line, i32 %s2_col, i8* %s2_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  store %struct._RV_pmd* %str1_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %str2_pmd, %struct._RV_pmd** %2, align 8
  store i8* %str1, i8** %3, align 8
  store i8* %str2, i8** %4, align 8
  store i64 %n, i64* %5, align 8
  store i8* %file_name, i8** %6, align 8
  store i8* %func_name, i8** %7, align 8
  store i32 %s1_line, i32* %8, align 4
  store i32 %s1_col, i32* %9, align 4
  store i8* %s1_name, i8** %10, align 8
  store i32 %s2_line, i32* %11, align 4
  store i32 %s2_col, i32* %12, align 4
  store i8* %s2_name, i8** %13, align 8
  %14 = load %struct._RV_pmd** %1, align 8
  %15 = load i8** %3, align 8
  %16 = load i64* %5, align 8
  %17 = load i8** %6, align 8
  %18 = load i8** %7, align 8
  %19 = load i32* %8, align 4
  %20 = load i32* %9, align 4
  %21 = load i8** %10, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %14 to i8*
  %zybc_11 = bitcast i8* %15 to i8*
  %zyarg_12 = inttoptr i64 %16 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %17 to i8*
  %zybc_15 = bitcast i8* %18 to i8*
  %zyarg_16 = inttoptr i32 %19 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %20 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %21 to i8*
  %22 = load %struct._RV_pmd** %2, align 8
  %23 = load i8** %4, align 8
  %24 = load i64* %5, align 8
  %25 = load i8** %6, align 8
  %26 = load i8** %7, align 8
  %27 = load i32* %11, align 4
  %28 = load i32* %12, align 4
  %29 = load i8** %13, align 8
  %zybc_ = bitcast %struct._RV_pmd* %22 to i8*
  %zybc_1 = bitcast i8* %23 to i8*
  %zyarg_ = inttoptr i64 %24 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %25 to i8*
  %zybc_4 = bitcast i8* %26 to i8*
  %zyarg_5 = inttoptr i32 %27 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %28 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %29 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 -1356386606, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_68_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %30 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %30)
  %31 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %31)
  %32 = load i8** %3, align 8
  %33 = load i8** %4, align 8
  %34 = load i64* %5, align 8
  %35 = call i32 @memcmp(i8* %32, i8* %33, i64 %34) #10
  call void @_Z4joinj(i32 -1356386606)
  ret i32 %35
}

; Function Attrs: nounwind readonly
declare i32 @memcmp(i8*, i8*, i64) #6

; Function Attrs: nounwind uwtable
define i8* @_RV_memcpy(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %dest_pmd, %struct._RV_pmd* %src_pmd, i8* %dest, i8* %src, i64 %n, i8* %file_name, i8* %func_name, i32 %d_line, i32 %d_col, i8* %d_name, i32 %s_line, i32 %s_col, i8* %s_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._RV_pmd*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i8*, align 8
  %ret = alloca i8*, align 8
  %p = alloca i8*, align 8
  %p_pmd = alloca %struct._RV_pmd*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %dest_pmd, %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %src_pmd, %struct._RV_pmd** %3, align 8
  store i8* %dest, i8** %4, align 8
  store i8* %src, i8** %5, align 8
  store i64 %n, i64* %6, align 8
  store i8* %file_name, i8** %7, align 8
  store i8* %func_name, i8** %8, align 8
  store i32 %d_line, i32* %9, align 4
  store i32 %d_col, i32* %10, align 4
  store i8* %d_name, i8** %11, align 8
  store i32 %s_line, i32* %12, align 4
  store i32 %s_col, i32* %13, align 4
  store i8* %s_name, i8** %14, align 8
  %15 = load %struct._RV_pmd** %3, align 8
  %16 = load i8** %5, align 8
  %17 = load i64* %6, align 8
  %18 = load i8** %7, align 8
  %19 = load i8** %8, align 8
  %20 = load i32* %12, align 4
  %21 = load i32* %13, align 4
  %22 = load i8** %14, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %15 to i8*
  %zybc_11 = bitcast i8* %16 to i8*
  %zyarg_12 = inttoptr i64 %17 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %18 to i8*
  %zybc_15 = bitcast i8* %19 to i8*
  %zyarg_16 = inttoptr i32 %20 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %21 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %22 to i8*
  %23 = load %struct._RV_pmd** %2, align 8
  %24 = load i8** %4, align 8
  %25 = load i64* %6, align 8
  %26 = load i8** %7, align 8
  %27 = load i8** %8, align 8
  %28 = load i32* %9, align 4
  %29 = load i32* %10, align 4
  %30 = load i8** %11, align 8
  %zybc_ = bitcast %struct._RV_pmd* %23 to i8*
  %zybc_1 = bitcast i8* %24 to i8*
  %zyarg_ = inttoptr i64 %25 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %26 to i8*
  %zybc_4 = bitcast i8* %27 to i8*
  %zyarg_5 = inttoptr i32 %28 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %29 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %30 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 -1877108228, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_69_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %31 = load i8** %4, align 8
  %32 = load i8** %5, align 8
  %33 = load i64* %6, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %31, i8* %32, i64 %33, i32 1, i1 false)
  store i8* %31, i8** %ret, align 8
  %34 = load i8** %4, align 8
  %35 = load i8** %5, align 8
  %36 = icmp ult i8* %34, %35
  br i1 %36, label %37, label %75

; <label>:37                                      ; preds = %0
  %38 = load i8** %5, align 8
  %39 = ptrtoint i8* %38 to i64
  %40 = and i64 %39, -8
  %41 = inttoptr i64 %40 to i8*
  store i8* %41, i8** %p, align 8
  br label %42

; <label>:42                                      ; preds = %71, %37
  %43 = load i8** %p, align 8
  %44 = load i8** %5, align 8
  %45 = load i64* %6, align 8
  %46 = getelementptr i8* %44, i64 %45
  %47 = icmp ult i8* %43, %46
  br i1 %47, label %48, label %74

; <label>:48                                      ; preds = %42
  %49 = load i8** %p, align 8
  %50 = load i8** %5, align 8
  %51 = icmp ult i8* %49, %50
  br i1 %51, label %52, label %53

; <label>:52                                      ; preds = %48
  br label %71

; <label>:53                                      ; preds = %48
  %54 = load i8** %p, align 8
  %55 = bitcast i8* %54 to i8**
  %56 = call %struct._RV_pmd* @_RV_pmd_tbl_lookup(i8** %55)
  store %struct._RV_pmd* %56, %struct._RV_pmd** %p_pmd, align 8
  %57 = load %struct._RV_pmd** %p_pmd, align 8
  %58 = icmp ne %struct._RV_pmd* %57, null
  br i1 %58, label %59, label %70

; <label>:59                                      ; preds = %53
  %60 = load i8** %4, align 8
  %61 = load i8** %p, align 8
  %62 = load i8** %5, align 8
  %63 = ptrtoint i8* %61 to i64
  %64 = ptrtoint i8* %62 to i64
  %65 = sub i64 %63, %64
  %66 = getelementptr i8* %60, i64 %65
  %67 = bitcast i8* %66 to i8**
  %68 = load %struct._RV_pmd** %p_pmd, align 8
  %69 = call %struct._RV_pmd* @_RV_pmd_tbl_update_pmd(i8** %67, %struct._RV_pmd* %68)
  br label %70

; <label>:70                                      ; preds = %59, %53
  br label %71

; <label>:71                                      ; preds = %70, %52
  %72 = load i8** %p, align 8
  %73 = getelementptr i8* %72, i64 8
  store i8* %73, i8** %p, align 8
  br label %42

; <label>:74                                      ; preds = %42
  br label %114

; <label>:75                                      ; preds = %0
  %76 = load i8** %4, align 8
  %77 = load i8** %5, align 8
  %78 = icmp ugt i8* %76, %77
  br i1 %78, label %79, label %113

; <label>:79                                      ; preds = %75
  %80 = load i8** %5, align 8
  %81 = load i64* %6, align 8
  %82 = getelementptr i8* %80, i64 %81
  %83 = getelementptr i8* %82, i64 -1
  %84 = ptrtoint i8* %83 to i64
  %85 = and i64 %84, -8
  %86 = inttoptr i64 %85 to i8*
  store i8* %86, i8** %p, align 8
  br label %87

; <label>:87                                      ; preds = %109, %79
  %88 = load i8** %p, align 8
  %89 = load i8** %5, align 8
  %90 = icmp uge i8* %88, %89
  br i1 %90, label %91, label %112

; <label>:91                                      ; preds = %87
  %92 = load i8** %p, align 8
  %93 = bitcast i8* %92 to i8**
  %94 = call %struct._RV_pmd* @_RV_pmd_tbl_lookup(i8** %93)
  store %struct._RV_pmd* %94, %struct._RV_pmd** %p_pmd, align 8
  %95 = load %struct._RV_pmd** %p_pmd, align 8
  %96 = icmp ne %struct._RV_pmd* %95, null
  br i1 %96, label %97, label %108

; <label>:97                                      ; preds = %91
  %98 = load i8** %4, align 8
  %99 = load i8** %p, align 8
  %100 = load i8** %5, align 8
  %101 = ptrtoint i8* %99 to i64
  %102 = ptrtoint i8* %100 to i64
  %103 = sub i64 %101, %102
  %104 = getelementptr i8* %98, i64 %103
  %105 = bitcast i8* %104 to i8**
  %106 = load %struct._RV_pmd** %p_pmd, align 8
  %107 = call %struct._RV_pmd* @_RV_pmd_tbl_update_pmd(i8** %105, %struct._RV_pmd* %106)
  br label %108

; <label>:108                                     ; preds = %97, %91
  br label %109

; <label>:109                                     ; preds = %108
  %110 = load i8** %p, align 8
  %111 = getelementptr i8* %110, i64 -8
  store i8* %111, i8** %p, align 8
  br label %87

; <label>:112                                     ; preds = %87
  br label %113

; <label>:113                                     ; preds = %112, %75
  br label %114

; <label>:114                                     ; preds = %113, %74
  %115 = load i8** %ret, align 8
  %116 = icmp eq i8* %115, null
  br i1 %116, label %117, label %119

; <label>:117                                     ; preds = %114
  %118 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %118)
  br label %123

; <label>:119                                     ; preds = %114
  %120 = load %struct._RV_pmd** %1, align 8
  %121 = load %struct._RV_pmd** %2, align 8
  %122 = call %struct._RV_pmd* @_RV_pmd_cp_pmd(%struct._RV_pmd* %120, %struct._RV_pmd* %121)
  br label %123

; <label>:123                                     ; preds = %119, %117
  call void @_Z4joinj(i32 -1877108228)
  %124 = load %struct._RV_pmd** %3, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %124)
  %125 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %125)
  %126 = load i8** %ret, align 8
  ret i8* %126
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #7

; Function Attrs: nounwind uwtable
define i8* @_RV_memccpy(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %dest_pmd, %struct._RV_pmd* %src_pmd, i8* %dest, i8* %src, i32 %c, i64 %n, i8* %file_name, i8* %func_name, i32 %d_line, i32 %d_col, i8* %d_name, i32 %s_line, i32 %s_col, i8* %s_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._RV_pmd*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i8*, align 8
  %ret = alloca i8*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %dest_pmd, %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %src_pmd, %struct._RV_pmd** %3, align 8
  store i8* %dest, i8** %4, align 8
  store i8* %src, i8** %5, align 8
  store i32 %c, i32* %6, align 4
  store i64 %n, i64* %7, align 8
  store i8* %file_name, i8** %8, align 8
  store i8* %func_name, i8** %9, align 8
  store i32 %d_line, i32* %10, align 4
  store i32 %d_col, i32* %11, align 4
  store i8* %d_name, i8** %12, align 8
  store i32 %s_line, i32* %13, align 4
  store i32 %s_col, i32* %14, align 4
  store i8* %s_name, i8** %15, align 8
  %16 = load %struct._RV_pmd** %3, align 8
  %17 = load i8** %5, align 8
  %18 = load i64* %7, align 8
  %19 = load i8** %8, align 8
  %20 = load i8** %9, align 8
  %21 = load i32* %13, align 4
  %22 = load i32* %14, align 4
  %23 = load i8** %15, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %16 to i8*
  %zybc_11 = bitcast i8* %17 to i8*
  %zyarg_12 = inttoptr i64 %18 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %19 to i8*
  %zybc_15 = bitcast i8* %20 to i8*
  %zyarg_16 = inttoptr i32 %21 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %22 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %23 to i8*
  %24 = load %struct._RV_pmd** %2, align 8
  %25 = load i8** %4, align 8
  %26 = load i64* %7, align 8
  %27 = load i8** %8, align 8
  %28 = load i8** %9, align 8
  %29 = load i32* %10, align 4
  %30 = load i32* %11, align 4
  %31 = load i8** %12, align 8
  %zybc_ = bitcast %struct._RV_pmd* %24 to i8*
  %zybc_1 = bitcast i8* %25 to i8*
  %zyarg_ = inttoptr i64 %26 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %27 to i8*
  %zybc_4 = bitcast i8* %28 to i8*
  %zyarg_5 = inttoptr i32 %29 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %30 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %31 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 -637244468, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_70_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %32 = load i8** %4, align 8
  %33 = load i8** %5, align 8
  %34 = load i32* %6, align 4
  %35 = load i64* %7, align 8
  %36 = call i8* @memccpy(i8* %32, i8* %33, i32 %34, i64 %35) #7
  store i8* %36, i8** %ret, align 8
  %37 = load i8** %ret, align 8
  %38 = icmp eq i8* %37, null
  br i1 %38, label %39, label %41

; <label>:39                                      ; preds = %0
  %40 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %40)
  br label %45

; <label>:41                                      ; preds = %0
  %42 = load %struct._RV_pmd** %1, align 8
  %43 = load %struct._RV_pmd** %2, align 8
  %44 = call %struct._RV_pmd* @_RV_pmd_cp_pmd(%struct._RV_pmd* %42, %struct._RV_pmd* %43)
  br label %45

; <label>:45                                      ; preds = %41, %39
  call void @_Z4joinj(i32 -637244468)
  %46 = load %struct._RV_pmd** %3, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %46)
  %47 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %47)
  %48 = load i8** %ret, align 8
  ret i8* %48
}

; Function Attrs: nounwind
declare i8* @memccpy(i8*, i8*, i32, i64) #3

; Function Attrs: nounwind uwtable
define i8* @_RV_memmove(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %dest_pmd, %struct._RV_pmd* %src_pmd, i8* %dest, i8* %src, i64 %n, i8* %file_name, i8* %func_name, i32 %d_line, i32 %d_col, i8* %d_name, i32 %s_line, i32 %s_col, i8* %s_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._RV_pmd*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i8*, align 8
  %ret = alloca i8*, align 8
  %p = alloca i8*, align 8
  %p_pmd = alloca %struct._RV_pmd*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %dest_pmd, %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %src_pmd, %struct._RV_pmd** %3, align 8
  store i8* %dest, i8** %4, align 8
  store i8* %src, i8** %5, align 8
  store i64 %n, i64* %6, align 8
  store i8* %file_name, i8** %7, align 8
  store i8* %func_name, i8** %8, align 8
  store i32 %d_line, i32* %9, align 4
  store i32 %d_col, i32* %10, align 4
  store i8* %d_name, i8** %11, align 8
  store i32 %s_line, i32* %12, align 4
  store i32 %s_col, i32* %13, align 4
  store i8* %s_name, i8** %14, align 8
  %15 = load %struct._RV_pmd** %3, align 8
  %16 = load i8** %5, align 8
  %17 = load i64* %6, align 8
  %18 = load i8** %7, align 8
  %19 = load i8** %8, align 8
  %20 = load i32* %12, align 4
  %21 = load i32* %13, align 4
  %22 = load i8** %14, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %15 to i8*
  %zybc_11 = bitcast i8* %16 to i8*
  %zyarg_12 = inttoptr i64 %17 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %18 to i8*
  %zybc_15 = bitcast i8* %19 to i8*
  %zyarg_16 = inttoptr i32 %20 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %21 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %22 to i8*
  %23 = load %struct._RV_pmd** %2, align 8
  %24 = load i8** %4, align 8
  %25 = load i64* %6, align 8
  %26 = load i8** %7, align 8
  %27 = load i8** %8, align 8
  %28 = load i32* %9, align 4
  %29 = load i32* %10, align 4
  %30 = load i8** %11, align 8
  %zybc_ = bitcast %struct._RV_pmd* %23 to i8*
  %zybc_1 = bitcast i8* %24 to i8*
  %zyarg_ = inttoptr i64 %25 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %26 to i8*
  %zybc_4 = bitcast i8* %27 to i8*
  %zyarg_5 = inttoptr i32 %28 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %29 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %30 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 398824715, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_71_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %31 = load i8** %4, align 8
  %32 = load i8** %5, align 8
  %33 = load i64* %6, align 8
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %31, i8* %32, i64 %33, i32 1, i1 false)
  store i8* %31, i8** %ret, align 8
  %34 = load i8** %4, align 8
  %35 = load i8** %5, align 8
  %36 = icmp ult i8* %34, %35
  br i1 %36, label %37, label %75

; <label>:37                                      ; preds = %0
  %38 = load i8** %5, align 8
  %39 = ptrtoint i8* %38 to i64
  %40 = and i64 %39, -8
  %41 = inttoptr i64 %40 to i8*
  store i8* %41, i8** %p, align 8
  br label %42

; <label>:42                                      ; preds = %71, %37
  %43 = load i8** %p, align 8
  %44 = load i8** %5, align 8
  %45 = load i64* %6, align 8
  %46 = getelementptr i8* %44, i64 %45
  %47 = icmp ult i8* %43, %46
  br i1 %47, label %48, label %74

; <label>:48                                      ; preds = %42
  %49 = load i8** %p, align 8
  %50 = load i8** %5, align 8
  %51 = icmp ult i8* %49, %50
  br i1 %51, label %52, label %53

; <label>:52                                      ; preds = %48
  br label %71

; <label>:53                                      ; preds = %48
  %54 = load i8** %p, align 8
  %55 = bitcast i8* %54 to i8**
  %56 = call %struct._RV_pmd* @_RV_pmd_tbl_lookup(i8** %55)
  store %struct._RV_pmd* %56, %struct._RV_pmd** %p_pmd, align 8
  %57 = load %struct._RV_pmd** %p_pmd, align 8
  %58 = icmp ne %struct._RV_pmd* %57, null
  br i1 %58, label %59, label %70

; <label>:59                                      ; preds = %53
  %60 = load i8** %4, align 8
  %61 = load i8** %p, align 8
  %62 = load i8** %5, align 8
  %63 = ptrtoint i8* %61 to i64
  %64 = ptrtoint i8* %62 to i64
  %65 = sub i64 %63, %64
  %66 = getelementptr i8* %60, i64 %65
  %67 = bitcast i8* %66 to i8**
  %68 = load %struct._RV_pmd** %p_pmd, align 8
  %69 = call %struct._RV_pmd* @_RV_pmd_tbl_update_pmd(i8** %67, %struct._RV_pmd* %68)
  br label %70

; <label>:70                                      ; preds = %59, %53
  br label %71

; <label>:71                                      ; preds = %70, %52
  %72 = load i8** %p, align 8
  %73 = getelementptr i8* %72, i64 8
  store i8* %73, i8** %p, align 8
  br label %42

; <label>:74                                      ; preds = %42
  br label %114

; <label>:75                                      ; preds = %0
  %76 = load i8** %4, align 8
  %77 = load i8** %5, align 8
  %78 = icmp ugt i8* %76, %77
  br i1 %78, label %79, label %113

; <label>:79                                      ; preds = %75
  %80 = load i8** %5, align 8
  %81 = load i64* %6, align 8
  %82 = getelementptr i8* %80, i64 %81
  %83 = getelementptr i8* %82, i64 -1
  %84 = ptrtoint i8* %83 to i64
  %85 = and i64 %84, -8
  %86 = inttoptr i64 %85 to i8*
  store i8* %86, i8** %p, align 8
  br label %87

; <label>:87                                      ; preds = %109, %79
  %88 = load i8** %p, align 8
  %89 = load i8** %5, align 8
  %90 = icmp uge i8* %88, %89
  br i1 %90, label %91, label %112

; <label>:91                                      ; preds = %87
  %92 = load i8** %p, align 8
  %93 = bitcast i8* %92 to i8**
  %94 = call %struct._RV_pmd* @_RV_pmd_tbl_lookup(i8** %93)
  store %struct._RV_pmd* %94, %struct._RV_pmd** %p_pmd, align 8
  %95 = load %struct._RV_pmd** %p_pmd, align 8
  %96 = icmp ne %struct._RV_pmd* %95, null
  br i1 %96, label %97, label %108

; <label>:97                                      ; preds = %91
  %98 = load i8** %4, align 8
  %99 = load i8** %p, align 8
  %100 = load i8** %5, align 8
  %101 = ptrtoint i8* %99 to i64
  %102 = ptrtoint i8* %100 to i64
  %103 = sub i64 %101, %102
  %104 = getelementptr i8* %98, i64 %103
  %105 = bitcast i8* %104 to i8**
  %106 = load %struct._RV_pmd** %p_pmd, align 8
  %107 = call %struct._RV_pmd* @_RV_pmd_tbl_update_pmd(i8** %105, %struct._RV_pmd* %106)
  br label %108

; <label>:108                                     ; preds = %97, %91
  br label %109

; <label>:109                                     ; preds = %108
  %110 = load i8** %p, align 8
  %111 = getelementptr i8* %110, i64 -8
  store i8* %111, i8** %p, align 8
  br label %87

; <label>:112                                     ; preds = %87
  br label %113

; <label>:113                                     ; preds = %112, %75
  br label %114

; <label>:114                                     ; preds = %113, %74
  %115 = load i8** %ret, align 8
  %116 = icmp eq i8* %115, null
  br i1 %116, label %117, label %119

; <label>:117                                     ; preds = %114
  %118 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %118)
  br label %123

; <label>:119                                     ; preds = %114
  %120 = load %struct._RV_pmd** %1, align 8
  %121 = load %struct._RV_pmd** %2, align 8
  %122 = call %struct._RV_pmd* @_RV_pmd_cp_pmd(%struct._RV_pmd* %120, %struct._RV_pmd* %121)
  br label %123

; <label>:123                                     ; preds = %119, %117
  call void @_Z4joinj(i32 398824715)
  %124 = load %struct._RV_pmd** %3, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %124)
  %125 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %125)
  %126 = load i8** %ret, align 8
  ret i8* %126
}

; Function Attrs: nounwind
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #7

; Function Attrs: nounwind uwtable
define i8* @_RV_memset(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %str_pmd, i8* %str, i32 %c, i64 %n, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %ret = alloca i8*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %str_pmd, %struct._RV_pmd** %2, align 8
  store i8* %str, i8** %3, align 8
  store i32 %c, i32* %4, align 4
  store i64 %n, i64* %5, align 8
  store i8* %file_name, i8** %6, align 8
  store i8* %func_name, i8** %7, align 8
  store i32 %s_line, i32* %8, align 4
  store i32 %s_col, i32* %9, align 4
  store i8* %s_name, i8** %10, align 8
  %11 = load %struct._RV_pmd** %2, align 8
  %12 = load i8** %3, align 8
  %13 = load i64* %5, align 8
  %14 = load i8** %6, align 8
  %15 = load i8** %7, align 8
  %16 = load i32* %8, align 4
  %17 = load i32* %9, align 4
  %18 = load i8** %10, align 8
  %zybc_ = bitcast %struct._RV_pmd* %11 to i8*
  %zybc_1 = bitcast i8* %12 to i8*
  %zyarg_ = inttoptr i64 %13 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %14 to i8*
  %zybc_4 = bitcast i8* %15 to i8*
  %zyarg_5 = inttoptr i32 %16 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %17 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %18 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -462639519, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_72_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %19 = load i8** %3, align 8
  %20 = load i32* %4, align 4
  %21 = trunc i32 %20 to i8
  %22 = load i64* %5, align 8
  call void @llvm.memset.p0i8.i64(i8* %19, i8 %21, i64 %22, i32 1, i1 false)
  store i8* %19, i8** %ret, align 8
  %23 = load i8** %ret, align 8
  %24 = icmp eq i8* %23, null
  br i1 %24, label %25, label %27

; <label>:25                                      ; preds = %0
  %26 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %26)
  br label %31

; <label>:27                                      ; preds = %0
  %28 = load %struct._RV_pmd** %1, align 8
  %29 = load %struct._RV_pmd** %2, align 8
  %30 = call %struct._RV_pmd* @_RV_pmd_cp_pmd(%struct._RV_pmd* %28, %struct._RV_pmd* %29)
  br label %31

; <label>:31                                      ; preds = %27, %25
  call void @_Z4joinj(i32 -462639519)
  %32 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %32)
  %33 = load i8** %ret, align 8
  ret i8* %33
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #7

; Function Attrs: nounwind uwtable
define i8* @_RV_strcat(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %dest_pmd, %struct._RV_pmd* %src_pmd, i8* %dest, i8* %src, i8* %file_name, i8* %func_name, i32 %d_line, i32 %d_col, i8* %d_name, i32 %s_line, i32 %s_col, i8* %s_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._RV_pmd*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %ret = alloca i8*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %dest_pmd, %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %src_pmd, %struct._RV_pmd** %3, align 8
  store i8* %dest, i8** %4, align 8
  store i8* %src, i8** %5, align 8
  store i8* %file_name, i8** %6, align 8
  store i8* %func_name, i8** %7, align 8
  store i32 %d_line, i32* %8, align 4
  store i32 %d_col, i32* %9, align 4
  store i8* %d_name, i8** %10, align 8
  store i32 %s_line, i32* %11, align 4
  store i32 %s_col, i32* %12, align 4
  store i8* %s_name, i8** %13, align 8
  %14 = load %struct._RV_pmd** %2, align 8
  %15 = load i8** %4, align 8
  %16 = load i8** %4, align 8
  %17 = call i32 @_RV_sstrlen(i8* %16)
  %18 = load i8** %5, align 8
  %19 = call i32 @_RV_sstrlen(i8* %18)
  %20 = add nsw i32 %17, %19
  %21 = add nsw i32 %20, 1
  %22 = sext i32 %21 to i64
  %23 = load i8** %6, align 8
  %24 = load i8** %7, align 8
  %25 = load i32* %8, align 4
  %26 = load i32* %9, align 4
  %27 = load i8** %10, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %14 to i8*
  %zybc_11 = bitcast i8* %15 to i8*
  %zyarg_12 = inttoptr i64 %22 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %23 to i8*
  %zybc_15 = bitcast i8* %24 to i8*
  %zyarg_16 = inttoptr i32 %25 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %26 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %27 to i8*
  %28 = load %struct._RV_pmd** %3, align 8
  %29 = load i8** %5, align 8
  %30 = load i8** %5, align 8
  %31 = call i32 @_RV_sstrlen(i8* %30)
  %32 = add nsw i32 %31, 1
  %33 = sext i32 %32 to i64
  %34 = load i8** %6, align 8
  %35 = load i8** %7, align 8
  %36 = load i32* %11, align 4
  %37 = load i32* %12, align 4
  %38 = load i8** %13, align 8
  %zybc_ = bitcast %struct._RV_pmd* %28 to i8*
  %zybc_1 = bitcast i8* %29 to i8*
  %zyarg_ = inttoptr i64 %33 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %34 to i8*
  %zybc_4 = bitcast i8* %35 to i8*
  %zyarg_5 = inttoptr i32 %36 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %37 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %38 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 475093709, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_73_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %39 = load i8** %4, align 8
  %40 = load i8** %5, align 8
  %41 = call i8* @strcat(i8* %39, i8* %40) #7
  store i8* %41, i8** %ret, align 8
  %42 = load i8** %ret, align 8
  %43 = icmp eq i8* %42, null
  br i1 %43, label %44, label %46

; <label>:44                                      ; preds = %0
  %45 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %45)
  br label %50

; <label>:46                                      ; preds = %0
  %47 = load %struct._RV_pmd** %1, align 8
  %48 = load %struct._RV_pmd** %2, align 8
  %49 = call %struct._RV_pmd* @_RV_pmd_cp_pmd(%struct._RV_pmd* %47, %struct._RV_pmd* %48)
  br label %50

; <label>:50                                      ; preds = %46, %44
  call void @_Z4joinj(i32 475093709)
  %51 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %51)
  %52 = load %struct._RV_pmd** %3, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %52)
  %53 = load i8** %ret, align 8
  ret i8* %53
}

; Function Attrs: nounwind
declare i8* @strcat(i8*, i8*) #3

; Function Attrs: nounwind uwtable
define i8* @_RV_strncat(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %dest_pmd, %struct._RV_pmd* %src_pmd, i8* %dest, i8* %src, i32 %n, i8* %file_name, i8* %func_name, i32 %d_line, i32 %d_col, i8* %d_name, i32 %s_line, i32 %s_col, i8* %s_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._RV_pmd*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i8*, align 8
  %ret = alloca i8*, align 8
  %i = alloca i32, align 4
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %dest_pmd, %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %src_pmd, %struct._RV_pmd** %3, align 8
  store i8* %dest, i8** %4, align 8
  store i8* %src, i8** %5, align 8
  store i32 %n, i32* %6, align 4
  store i8* %file_name, i8** %7, align 8
  store i8* %func_name, i8** %8, align 8
  store i32 %d_line, i32* %9, align 4
  store i32 %d_col, i32* %10, align 4
  store i8* %d_name, i8** %11, align 8
  store i32 %s_line, i32* %12, align 4
  store i32 %s_col, i32* %13, align 4
  store i8* %s_name, i8** %14, align 8
  store i32 0, i32* %i, align 4
  br label %15

; <label>:15                                      ; preds = %29, %0
  %16 = load i32* %i, align 4
  %17 = load i32* %6, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %32

; <label>:19                                      ; preds = %15
  %20 = load i32* %i, align 4
  %21 = sext i32 %20 to i64
  %22 = load i8** %5, align 8
  %23 = getelementptr inbounds i8* %22, i64 %21
  %24 = load i8* %23, align 1
  %25 = sext i8 %24 to i32
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %19
  br label %32

; <label>:28                                      ; preds = %19
  br label %29

; <label>:29                                      ; preds = %28
  %30 = load i32* %i, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %i, align 4
  br label %15

; <label>:32                                      ; preds = %27, %15
  %33 = load %struct._RV_pmd** %2, align 8
  %34 = load i8** %4, align 8
  %35 = load i8** %4, align 8
  %36 = call i32 @_RV_sstrlen(i8* %35)
  %37 = load i32* %i, align 4
  %38 = add nsw i32 %36, %37
  %39 = add nsw i32 %38, 1
  %40 = sext i32 %39 to i64
  %41 = load i8** %7, align 8
  %42 = load i8** %8, align 8
  %43 = load i32* %9, align 4
  %44 = load i32* %10, align 4
  %45 = load i8** %11, align 8
  %zybc_ = bitcast %struct._RV_pmd* %33 to i8*
  %zybc_1 = bitcast i8* %34 to i8*
  %zyarg_ = inttoptr i64 %40 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %41 to i8*
  %zybc_4 = bitcast i8* %42 to i8*
  %zyarg_5 = inttoptr i32 %43 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %44 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %45 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -1572957609, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_74_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %46 = load %struct._RV_pmd** %3, align 8
  %47 = load i8** %5, align 8
  %48 = load i32* %i, align 4
  %49 = load i32* %6, align 4
  %50 = icmp eq i32 %48, %49
  br i1 %50, label %51, label %53

; <label>:51                                      ; preds = %32
  %52 = load i32* %6, align 4
  br label %56

; <label>:53                                      ; preds = %32
  %54 = load i32* %i, align 4
  %55 = add nsw i32 %54, 1
  br label %56

; <label>:56                                      ; preds = %53, %51
  %57 = phi i32 [ %52, %51 ], [ %55, %53 ]
  %58 = sext i32 %57 to i64
  %59 = load i8** %7, align 8
  %60 = load i8** %8, align 8
  %61 = load i32* %12, align 4
  %62 = load i32* %13, align 4
  %63 = load i8** %14, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %46 to i8*
  %zybc_11 = bitcast i8* %47 to i8*
  %zyarg_12 = inttoptr i64 %58 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %59 to i8*
  %zybc_15 = bitcast i8* %60 to i8*
  %zyarg_16 = inttoptr i32 %61 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %62 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %63 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -45745662, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_75_0, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %64 = load i8** %4, align 8
  %65 = load i8** %5, align 8
  %66 = load i32* %6, align 4
  %67 = sext i32 %66 to i64
  %68 = call i8* @strncat(i8* %64, i8* %65, i64 %67) #7
  store i8* %68, i8** %ret, align 8
  %69 = load i8** %ret, align 8
  %70 = icmp eq i8* %69, null
  br i1 %70, label %71, label %73

; <label>:71                                      ; preds = %56
  %72 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %72)
  br label %77

; <label>:73                                      ; preds = %56
  %74 = load %struct._RV_pmd** %1, align 8
  %75 = load %struct._RV_pmd** %2, align 8
  %76 = call %struct._RV_pmd* @_RV_pmd_cp_pmd(%struct._RV_pmd* %74, %struct._RV_pmd* %75)
  br label %77

; <label>:77                                      ; preds = %73, %71
  call void @_Z4joinj(i32 -1572957609)
  call void @_Z4joinj(i32 -45745662)
  %78 = load %struct._RV_pmd** %3, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %78)
  %79 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %79)
  %80 = load i8** %ret, align 8
  ret i8* %80
}

; Function Attrs: nounwind
declare i8* @strncat(i8*, i8*, i64) #3

; Function Attrs: nounwind uwtable
define i8* @_RV_strchr(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %src_pmd, i8* %src, i32 %c, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %ret = alloca i8*, align 8
  %i = alloca i32, align 4
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %src_pmd, %struct._RV_pmd** %2, align 8
  store i8* %src, i8** %3, align 8
  store i32 %c, i32* %4, align 4
  store i8* %file_name, i8** %5, align 8
  store i8* %func_name, i8** %6, align 8
  store i32 %s_line, i32* %7, align 4
  store i32 %s_col, i32* %8, align 4
  store i8* %s_name, i8** %9, align 8
  store i32 0, i32* %i, align 4
  br label %10

; <label>:10                                      ; preds = %29, %0
  %11 = load i32* %i, align 4
  %12 = zext i32 %11 to i64
  %13 = load i8** %3, align 8
  %14 = getelementptr inbounds i8* %13, i64 %12
  %15 = load i8* %14, align 1
  %16 = sext i8 %15 to i32
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %32

; <label>:18                                      ; preds = %10
  %19 = load i32* %i, align 4
  %20 = zext i32 %19 to i64
  %21 = load i8** %3, align 8
  %22 = getelementptr inbounds i8* %21, i64 %20
  %23 = load i8* %22, align 1
  %24 = sext i8 %23 to i32
  %25 = load i32* %4, align 4
  %26 = icmp eq i32 %24, %25
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %18
  br label %32

; <label>:28                                      ; preds = %18
  br label %29

; <label>:29                                      ; preds = %28
  %30 = load i32* %i, align 4
  %31 = add i32 %30, 1
  store i32 %31, i32* %i, align 4
  br label %10

; <label>:32                                      ; preds = %27, %10
  %33 = load %struct._RV_pmd** %2, align 8
  %34 = load i8** %3, align 8
  %35 = load i32* %i, align 4
  %36 = add i32 %35, 1
  %37 = zext i32 %36 to i64
  %38 = load i8** %5, align 8
  %39 = load i8** %6, align 8
  %40 = load i32* %7, align 4
  %41 = load i32* %8, align 4
  %42 = load i8** %9, align 8
  %zybc_ = bitcast %struct._RV_pmd* %33 to i8*
  %zybc_1 = bitcast i8* %34 to i8*
  %zyarg_ = inttoptr i64 %37 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %38 to i8*
  %zybc_4 = bitcast i8* %39 to i8*
  %zyarg_5 = inttoptr i32 %40 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %41 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %42 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -39549877, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_76_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %43 = load i8** %3, align 8
  %44 = load i32* %4, align 4
  %45 = call i8* @strchr(i8* %43, i32 %44) #10
  store i8* %45, i8** %ret, align 8
  %46 = load i8** %ret, align 8
  %47 = icmp eq i8* %46, null
  br i1 %47, label %48, label %50

; <label>:48                                      ; preds = %32
  %49 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %49)
  br label %54

; <label>:50                                      ; preds = %32
  %51 = load %struct._RV_pmd** %1, align 8
  %52 = load %struct._RV_pmd** %2, align 8
  %53 = call %struct._RV_pmd* @_RV_pmd_cp_pmd(%struct._RV_pmd* %51, %struct._RV_pmd* %52)
  br label %54

; <label>:54                                      ; preds = %50, %48
  call void @_Z4joinj(i32 -39549877)
  %55 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %55)
  %56 = load i8** %ret, align 8
  ret i8* %56
}

; Function Attrs: nounwind readonly
declare i8* @strchr(i8*, i32) #6

; Function Attrs: nounwind uwtable
define i32 @_RV_strcmp(%struct._RV_pmd* %str1_pmd, %struct._RV_pmd* %str2_pmd, i8* %str1, i8* %str2, i8* %file_name, i8* %func_name, i32 %s1_line, i32 %s1_col, i8* %s1_name, i32 %s2_line, i32 %s2_col, i8* %s2_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %i = alloca i32, align 4
  store %struct._RV_pmd* %str1_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %str2_pmd, %struct._RV_pmd** %2, align 8
  store i8* %str1, i8** %3, align 8
  store i8* %str2, i8** %4, align 8
  store i8* %file_name, i8** %5, align 8
  store i8* %func_name, i8** %6, align 8
  store i32 %s1_line, i32* %7, align 4
  store i32 %s1_col, i32* %8, align 4
  store i8* %s1_name, i8** %9, align 8
  store i32 %s2_line, i32* %10, align 4
  store i32 %s2_col, i32* %11, align 4
  store i8* %s2_name, i8** %12, align 8
  store i32 0, i32* %i, align 4
  br label %13

; <label>:13                                      ; preds = %45, %0
  %14 = load i32* %i, align 4
  %15 = zext i32 %14 to i64
  %16 = load i8** %3, align 8
  %17 = getelementptr inbounds i8* %16, i64 %15
  %18 = load i8* %17, align 1
  %19 = sext i8 %18 to i32
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %48

; <label>:21                                      ; preds = %13
  %22 = load i32* %i, align 4
  %23 = zext i32 %22 to i64
  %24 = load i8** %4, align 8
  %25 = getelementptr inbounds i8* %24, i64 %23
  %26 = load i8* %25, align 1
  %27 = sext i8 %26 to i32
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %48

; <label>:29                                      ; preds = %21
  %30 = load i32* %i, align 4
  %31 = zext i32 %30 to i64
  %32 = load i8** %3, align 8
  %33 = getelementptr inbounds i8* %32, i64 %31
  %34 = load i8* %33, align 1
  %35 = sext i8 %34 to i32
  %36 = load i32* %i, align 4
  %37 = zext i32 %36 to i64
  %38 = load i8** %4, align 8
  %39 = getelementptr inbounds i8* %38, i64 %37
  %40 = load i8* %39, align 1
  %41 = sext i8 %40 to i32
  %42 = icmp ne i32 %35, %41
  br i1 %42, label %43, label %44

; <label>:43                                      ; preds = %29
  br label %48

; <label>:44                                      ; preds = %29
  br label %45

; <label>:45                                      ; preds = %44
  %46 = load i32* %i, align 4
  %47 = add i32 %46, 1
  store i32 %47, i32* %i, align 4
  br label %13

; <label>:48                                      ; preds = %43, %21, %13
  %49 = load %struct._RV_pmd** %1, align 8
  %50 = load i8** %3, align 8
  %51 = load i32* %i, align 4
  %52 = add i32 %51, 1
  %53 = zext i32 %52 to i64
  %54 = load i8** %5, align 8
  %55 = load i8** %6, align 8
  %56 = load i32* %7, align 4
  %57 = load i32* %8, align 4
  %58 = load i8** %9, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %49 to i8*
  %zybc_11 = bitcast i8* %50 to i8*
  %zyarg_12 = inttoptr i64 %53 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %54 to i8*
  %zybc_15 = bitcast i8* %55 to i8*
  %zyarg_16 = inttoptr i32 %56 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %57 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %58 to i8*
  %59 = load %struct._RV_pmd** %2, align 8
  %60 = load i8** %4, align 8
  %61 = load i32* %i, align 4
  %62 = add i32 %61, 1
  %63 = zext i32 %62 to i64
  %64 = load i8** %5, align 8
  %65 = load i8** %6, align 8
  %66 = load i32* %10, align 4
  %67 = load i32* %11, align 4
  %68 = load i8** %12, align 8
  %zybc_ = bitcast %struct._RV_pmd* %59 to i8*
  %zybc_1 = bitcast i8* %60 to i8*
  %zyarg_ = inttoptr i64 %63 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %64 to i8*
  %zybc_4 = bitcast i8* %65 to i8*
  %zyarg_5 = inttoptr i32 %66 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %67 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %68 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 -2094982287, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_77_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %69 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %69)
  %70 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %70)
  %71 = load i8** %3, align 8
  %72 = load i8** %4, align 8
  %73 = call i32 @strcmp(i8* %71, i8* %72) #10
  call void @_Z4joinj(i32 -2094982287)
  ret i32 %73
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #6

; Function Attrs: nounwind uwtable
define i32 @_RV_strncmp(%struct._RV_pmd* %str1_pmd, %struct._RV_pmd* %str2_pmd, i8* %str1, i8* %str2, i64 %n, i8* %file_name, i8* %func_name, i32 %s1_line, i32 %s1_col, i8* %s1_name, i32 %s2_line, i32 %s2_col, i8* %s2_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %i = alloca i32, align 4
  store %struct._RV_pmd* %str1_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %str2_pmd, %struct._RV_pmd** %2, align 8
  store i8* %str1, i8** %3, align 8
  store i8* %str2, i8** %4, align 8
  store i64 %n, i64* %5, align 8
  store i8* %file_name, i8** %6, align 8
  store i8* %func_name, i8** %7, align 8
  store i32 %s1_line, i32* %8, align 4
  store i32 %s1_col, i32* %9, align 4
  store i8* %s1_name, i8** %10, align 8
  store i32 %s2_line, i32* %11, align 4
  store i32 %s2_col, i32* %12, align 4
  store i8* %s2_name, i8** %13, align 8
  store i32 0, i32* %i, align 4
  br label %14

; <label>:14                                      ; preds = %38, %0
  %15 = load i32* %i, align 4
  %16 = zext i32 %15 to i64
  %17 = load i64* %5, align 8
  %18 = sub i64 %17, 1
  %19 = icmp ult i64 %16, %18
  br i1 %19, label %20, label %41

; <label>:20                                      ; preds = %14
  %21 = load i32* %i, align 4
  %22 = zext i32 %21 to i64
  %23 = load i8** %3, align 8
  %24 = getelementptr inbounds i8* %23, i64 %22
  %25 = load i8* %24, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %36, label %28

; <label>:28                                      ; preds = %20
  %29 = load i32* %i, align 4
  %30 = zext i32 %29 to i64
  %31 = load i8** %4, align 8
  %32 = getelementptr inbounds i8* %31, i64 %30
  %33 = load i8* %32, align 1
  %34 = sext i8 %33 to i32
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %28, %20
  br label %41

; <label>:37                                      ; preds = %28
  br label %38

; <label>:38                                      ; preds = %37
  %39 = load i32* %i, align 4
  %40 = add i32 %39, 1
  store i32 %40, i32* %i, align 4
  br label %14

; <label>:41                                      ; preds = %36, %14
  %42 = load %struct._RV_pmd** %1, align 8
  %43 = load i8** %3, align 8
  %44 = load i32* %i, align 4
  %45 = add i32 %44, 1
  %46 = zext i32 %45 to i64
  %47 = load i8** %6, align 8
  %48 = load i8** %7, align 8
  %49 = load i32* %8, align 4
  %50 = load i32* %9, align 4
  %51 = load i8** %10, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %42 to i8*
  %zybc_11 = bitcast i8* %43 to i8*
  %zyarg_12 = inttoptr i64 %46 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %47 to i8*
  %zybc_15 = bitcast i8* %48 to i8*
  %zyarg_16 = inttoptr i32 %49 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %50 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %51 to i8*
  %52 = load %struct._RV_pmd** %2, align 8
  %53 = load i8** %4, align 8
  %54 = load i32* %i, align 4
  %55 = add i32 %54, 1
  %56 = zext i32 %55 to i64
  %57 = load i8** %6, align 8
  %58 = load i8** %7, align 8
  %59 = load i32* %11, align 4
  %60 = load i32* %12, align 4
  %61 = load i8** %13, align 8
  %zybc_ = bitcast %struct._RV_pmd* %52 to i8*
  %zybc_1 = bitcast i8* %53 to i8*
  %zyarg_ = inttoptr i64 %56 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %57 to i8*
  %zybc_4 = bitcast i8* %58 to i8*
  %zyarg_5 = inttoptr i32 %59 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %60 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %61 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 -1010582588, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_78_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %62 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %62)
  %63 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %63)
  %64 = load i8** %3, align 8
  %65 = load i8** %4, align 8
  %66 = load i64* %5, align 8
  %67 = call i32 @strncmp(i8* %64, i8* %65, i64 %66) #10
  call void @_Z4joinj(i32 -1010582588)
  ret i32 %67
}

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8*, i8*, i64) #6

; Function Attrs: nounwind uwtable
define i32 @_RV_strcoll(%struct._RV_pmd* %str1_pmd, %struct._RV_pmd* %str2_pmd, i8* %str1, i8* %str2, i8* %file_name, i8* %func_name, i32 %s1_line, i32 %s1_col, i8* %s1_name, i32 %s2_line, i32 %s2_col, i8* %s2_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  store %struct._RV_pmd* %str1_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %str2_pmd, %struct._RV_pmd** %2, align 8
  store i8* %str1, i8** %3, align 8
  store i8* %str2, i8** %4, align 8
  store i8* %file_name, i8** %5, align 8
  store i8* %func_name, i8** %6, align 8
  store i32 %s1_line, i32* %7, align 4
  store i32 %s1_col, i32* %8, align 4
  store i8* %s1_name, i8** %9, align 8
  store i32 %s2_line, i32* %10, align 4
  store i32 %s2_col, i32* %11, align 4
  store i8* %s2_name, i8** %12, align 8
  %13 = load %struct._RV_pmd** %1, align 8
  %14 = load i8** %3, align 8
  %15 = load i8** %3, align 8
  %16 = call i32 @_RV_sstrlen(i8* %15)
  %17 = add nsw i32 %16, 1
  %18 = sext i32 %17 to i64
  %19 = load i8** %5, align 8
  %20 = load i8** %6, align 8
  %21 = load i32* %7, align 4
  %22 = load i32* %8, align 4
  %23 = load i8** %9, align 8
  %zybc_ = bitcast %struct._RV_pmd* %13 to i8*
  %zybc_1 = bitcast i8* %14 to i8*
  %zyarg_ = inttoptr i64 %18 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %19 to i8*
  %zybc_4 = bitcast i8* %20 to i8*
  %zyarg_5 = inttoptr i32 %21 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %22 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %23 to i8*
  %24 = load %struct._RV_pmd** %2, align 8
  %25 = load i8** %4, align 8
  %26 = load i8** %4, align 8
  %27 = call i32 @_RV_sstrlen(i8* %26)
  %28 = add nsw i32 %27, 1
  %29 = sext i32 %28 to i64
  %30 = load i8** %5, align 8
  %31 = load i8** %6, align 8
  %32 = load i32* %10, align 4
  %33 = load i32* %11, align 4
  %34 = load i8** %12, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %24 to i8*
  %zybc_11 = bitcast i8* %25 to i8*
  %zyarg_12 = inttoptr i64 %29 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %30 to i8*
  %zybc_15 = bitcast i8* %31 to i8*
  %zyarg_16 = inttoptr i32 %32 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %33 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %34 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 -2099131215, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_79_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %35 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %35)
  %36 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %36)
  %37 = load i8** %3, align 8
  %38 = load i8** %4, align 8
  %39 = call i32 @strcoll(i8* %37, i8* %38) #10
  call void @_Z4joinj(i32 -2099131215)
  ret i32 %39
}

; Function Attrs: nounwind readonly
declare i32 @strcoll(i8*, i8*) #6

; Function Attrs: nounwind uwtable
define i8* @_RV_strcpy(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %dest_pmd, %struct._RV_pmd* %src_pmd, i8* %dest, i8* %src, i8* %file_name, i8* %func_name, i32 %d_line, i32 %d_col, i8* %d_name, i32 %s_line, i32 %s_col, i8* %s_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._RV_pmd*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %ret = alloca i8*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %dest_pmd, %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %src_pmd, %struct._RV_pmd** %3, align 8
  store i8* %dest, i8** %4, align 8
  store i8* %src, i8** %5, align 8
  store i8* %file_name, i8** %6, align 8
  store i8* %func_name, i8** %7, align 8
  store i32 %d_line, i32* %8, align 4
  store i32 %d_col, i32* %9, align 4
  store i8* %d_name, i8** %10, align 8
  store i32 %s_line, i32* %11, align 4
  store i32 %s_col, i32* %12, align 4
  store i8* %s_name, i8** %13, align 8
  %14 = load %struct._RV_pmd** %3, align 8
  %15 = load i8** %5, align 8
  %16 = load i8** %5, align 8
  %17 = call i32 @_RV_sstrlen(i8* %16)
  %18 = add nsw i32 %17, 1
  %19 = sext i32 %18 to i64
  %20 = load i8** %6, align 8
  %21 = load i8** %7, align 8
  %22 = load i32* %11, align 4
  %23 = load i32* %12, align 4
  %24 = load i8** %13, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %14 to i8*
  %zybc_11 = bitcast i8* %15 to i8*
  %zyarg_12 = inttoptr i64 %19 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %20 to i8*
  %zybc_15 = bitcast i8* %21 to i8*
  %zyarg_16 = inttoptr i32 %22 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %23 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %24 to i8*
  %25 = load %struct._RV_pmd** %2, align 8
  %26 = load i8** %4, align 8
  %27 = load i8** %5, align 8
  %28 = call i32 @_RV_sstrlen(i8* %27)
  %29 = add nsw i32 %28, 1
  %30 = sext i32 %29 to i64
  %31 = load i8** %6, align 8
  %32 = load i8** %7, align 8
  %33 = load i32* %8, align 4
  %34 = load i32* %9, align 4
  %35 = load i8** %10, align 8
  %zybc_ = bitcast %struct._RV_pmd* %25 to i8*
  %zybc_1 = bitcast i8* %26 to i8*
  %zyarg_ = inttoptr i64 %30 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %31 to i8*
  %zybc_4 = bitcast i8* %32 to i8*
  %zyarg_5 = inttoptr i32 %33 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %34 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %35 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 1665514942, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_80_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %36 = load i8** %4, align 8
  %37 = load i8** %5, align 8
  %38 = call i8* @strcpy(i8* %36, i8* %37) #7
  store i8* %38, i8** %ret, align 8
  %39 = load i8** %ret, align 8
  %40 = icmp eq i8* %39, null
  br i1 %40, label %41, label %43

; <label>:41                                      ; preds = %0
  %42 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %42)
  br label %47

; <label>:43                                      ; preds = %0
  %44 = load %struct._RV_pmd** %1, align 8
  %45 = load %struct._RV_pmd** %2, align 8
  %46 = call %struct._RV_pmd* @_RV_pmd_cp_pmd(%struct._RV_pmd* %44, %struct._RV_pmd* %45)
  br label %47

; <label>:47                                      ; preds = %43, %41
  call void @_Z4joinj(i32 1665514942)
  %48 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %48)
  %49 = load %struct._RV_pmd** %3, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %49)
  %50 = load i8** %ret, align 8
  ret i8* %50
}

; Function Attrs: nounwind uwtable
define i8* @_RV_strncpy(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %dest_pmd, %struct._RV_pmd* %src_pmd, i8* %dest, i8* %src, i32 %n, i8* %file_name, i8* %func_name, i32 %d_line, i32 %d_col, i8* %d_name, i32 %s_line, i32 %s_col, i8* %s_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._RV_pmd*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i8*, align 8
  %ret = alloca i8*, align 8
  %i = alloca i32, align 4
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %dest_pmd, %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %src_pmd, %struct._RV_pmd** %3, align 8
  store i8* %dest, i8** %4, align 8
  store i8* %src, i8** %5, align 8
  store i32 %n, i32* %6, align 4
  store i8* %file_name, i8** %7, align 8
  store i8* %func_name, i8** %8, align 8
  store i32 %d_line, i32* %9, align 4
  store i32 %d_col, i32* %10, align 4
  store i8* %d_name, i8** %11, align 8
  store i32 %s_line, i32* %12, align 4
  store i32 %s_col, i32* %13, align 4
  store i8* %s_name, i8** %14, align 8
  store i32 0, i32* %i, align 4
  br label %15

; <label>:15                                      ; preds = %30, %0
  %16 = load i32* %i, align 4
  %17 = load i32* %6, align 4
  %18 = sub nsw i32 %17, 1
  %19 = icmp slt i32 %16, %18
  br i1 %19, label %20, label %33

; <label>:20                                      ; preds = %15
  %21 = load i32* %i, align 4
  %22 = sext i32 %21 to i64
  %23 = load i8** %5, align 8
  %24 = getelementptr inbounds i8* %23, i64 %22
  %25 = load i8* %24, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %20
  br label %33

; <label>:29                                      ; preds = %20
  br label %30

; <label>:30                                      ; preds = %29
  %31 = load i32* %i, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %i, align 4
  br label %15

; <label>:33                                      ; preds = %28, %15
  %34 = load %struct._RV_pmd** %3, align 8
  %35 = load i8** %5, align 8
  %36 = load i32* %i, align 4
  %37 = add nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = load i8** %7, align 8
  %40 = load i8** %8, align 8
  %41 = load i32* %12, align 4
  %42 = load i32* %13, align 4
  %43 = load i8** %14, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %34 to i8*
  %zybc_11 = bitcast i8* %35 to i8*
  %zyarg_12 = inttoptr i64 %38 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %39 to i8*
  %zybc_15 = bitcast i8* %40 to i8*
  %zyarg_16 = inttoptr i32 %41 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %42 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %43 to i8*
  %44 = load %struct._RV_pmd** %2, align 8
  %45 = load i8** %4, align 8
  %46 = load i32* %6, align 4
  %47 = sext i32 %46 to i64
  %48 = load i8** %7, align 8
  %49 = load i8** %8, align 8
  %50 = load i32* %9, align 4
  %51 = load i32* %10, align 4
  %52 = load i8** %11, align 8
  %zybc_ = bitcast %struct._RV_pmd* %44 to i8*
  %zybc_1 = bitcast i8* %45 to i8*
  %zyarg_ = inttoptr i64 %47 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %48 to i8*
  %zybc_4 = bitcast i8* %49 to i8*
  %zyarg_5 = inttoptr i32 %50 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %51 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %52 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 671952248, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_81_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %53 = load i8** %4, align 8
  %54 = load i8** %5, align 8
  %55 = load i32* %6, align 4
  %56 = sext i32 %55 to i64
  %57 = call i8* @strncpy(i8* %53, i8* %54, i64 %56) #7
  store i8* %57, i8** %ret, align 8
  %58 = load i8** %ret, align 8
  %59 = icmp eq i8* %58, null
  br i1 %59, label %60, label %62

; <label>:60                                      ; preds = %33
  %61 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %61)
  br label %66

; <label>:62                                      ; preds = %33
  %63 = load %struct._RV_pmd** %1, align 8
  %64 = load %struct._RV_pmd** %2, align 8
  %65 = call %struct._RV_pmd* @_RV_pmd_cp_pmd(%struct._RV_pmd* %63, %struct._RV_pmd* %64)
  br label %66

; <label>:66                                      ; preds = %62, %60
  call void @_Z4joinj(i32 671952248)
  %67 = load %struct._RV_pmd** %3, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %67)
  %68 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %68)
  %69 = load i8** %ret, align 8
  ret i8* %69
}

; Function Attrs: nounwind
declare i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind uwtable
define i64 @_RV_strcspn(%struct._RV_pmd* %str1_pmd, %struct._RV_pmd* %str2_pmd, i8* %str1, i8* %str2, i8* %file_name, i8* %func_name, i32 %s1_line, i32 %s1_col, i8* %s1_name, i32 %s2_line, i32 %s2_col, i8* %s2_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  store %struct._RV_pmd* %str1_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %str2_pmd, %struct._RV_pmd** %2, align 8
  store i8* %str1, i8** %3, align 8
  store i8* %str2, i8** %4, align 8
  store i8* %file_name, i8** %5, align 8
  store i8* %func_name, i8** %6, align 8
  store i32 %s1_line, i32* %7, align 4
  store i32 %s1_col, i32* %8, align 4
  store i8* %s1_name, i8** %9, align 8
  store i32 %s2_line, i32* %10, align 4
  store i32 %s2_col, i32* %11, align 4
  store i8* %s2_name, i8** %12, align 8
  %13 = load %struct._RV_pmd** %1, align 8
  %14 = load i8** %3, align 8
  %15 = load i8** %3, align 8
  %16 = call i32 @_RV_sstrlen(i8* %15)
  %17 = add nsw i32 %16, 1
  %18 = sext i32 %17 to i64
  %19 = load i8** %5, align 8
  %20 = load i8** %6, align 8
  %21 = load i32* %7, align 4
  %22 = load i32* %8, align 4
  %23 = load i8** %9, align 8
  %zybc_ = bitcast %struct._RV_pmd* %13 to i8*
  %zybc_1 = bitcast i8* %14 to i8*
  %zyarg_ = inttoptr i64 %18 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %19 to i8*
  %zybc_4 = bitcast i8* %20 to i8*
  %zyarg_5 = inttoptr i32 %21 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %22 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %23 to i8*
  %24 = load %struct._RV_pmd** %2, align 8
  %25 = load i8** %4, align 8
  %26 = load i8** %4, align 8
  %27 = call i32 @_RV_sstrlen(i8* %26)
  %28 = add nsw i32 %27, 1
  %29 = sext i32 %28 to i64
  %30 = load i8** %5, align 8
  %31 = load i8** %6, align 8
  %32 = load i32* %10, align 4
  %33 = load i32* %11, align 4
  %34 = load i8** %12, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %24 to i8*
  %zybc_11 = bitcast i8* %25 to i8*
  %zyarg_12 = inttoptr i64 %29 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %30 to i8*
  %zybc_15 = bitcast i8* %31 to i8*
  %zyarg_16 = inttoptr i32 %32 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %33 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %34 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 -238506858, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_82_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %35 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %35)
  %36 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %36)
  %37 = load i8** %3, align 8
  %38 = load i8** %4, align 8
  %39 = call i64 @strcspn(i8* %37, i8* %38) #10
  call void @_Z4joinj(i32 -238506858)
  ret i64 %39
}

; Function Attrs: nounwind readonly
declare i64 @strcspn(i8*, i8*) #6

; Function Attrs: nounwind uwtable
define i8* @_RV_strerror(%struct._RV_pmd* %ret_pmd, i32 %errnum) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i32, align 4
  %ret = alloca i8*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store i32 %errnum, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = call i8* @strerror(i32 %3) #7
  store i8* %4, i8** %ret, align 8
  %5 = load i8** %ret, align 8
  %6 = icmp eq i8* %5, null
  br i1 %6, label %7, label %9

; <label>:7                                       ; preds = %0
  %8 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %8)
  br label %20

; <label>:9                                       ; preds = %0
  %10 = load %struct._RV_pmd** %1, align 8
  %11 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %12 = load i8** %ret, align 8
  %13 = load i8** %ret, align 8
  %14 = load i8** %ret, align 8
  %15 = call i32 @_RV_sstrlen(i8* %14)
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i8* %13, i64 %16
  %18 = getelementptr inbounds i8* %17, i64 1
  %19 = call %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %10, %struct._RV_stat_node* %11, i32 0, i8* %12, i8* %18)
  br label %20

; <label>:20                                      ; preds = %9, %7
  %21 = load i8** %ret, align 8
  ret i8* %21
}

; Function Attrs: nounwind
declare i8* @strerror(i32) #3

; Function Attrs: nounwind uwtable
define i64 @_RV_strlen(%struct._RV_pmd* %str_pmd, i8* %str, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store %struct._RV_pmd* %str_pmd, %struct._RV_pmd** %1, align 8
  store i8* %str, i8** %2, align 8
  store i8* %file_name, i8** %3, align 8
  store i8* %func_name, i8** %4, align 8
  store i32 %s_line, i32* %5, align 4
  store i32 %s_col, i32* %6, align 4
  store i8* %s_name, i8** %7, align 8
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load i8** %2, align 8
  %10 = load i8** %2, align 8
  %11 = call i32 @_RV_sstrlen(i8* %10)
  %12 = add nsw i32 %11, 1
  %13 = sext i32 %12 to i64
  %14 = load i8** %3, align 8
  %15 = load i8** %4, align 8
  %16 = load i32* %5, align 4
  %17 = load i32* %6, align 4
  %18 = load i8** %7, align 8
  %zybc_ = bitcast %struct._RV_pmd* %8 to i8*
  %zybc_1 = bitcast i8* %9 to i8*
  %zyarg_ = inttoptr i64 %13 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %14 to i8*
  %zybc_4 = bitcast i8* %15 to i8*
  %zyarg_5 = inttoptr i32 %16 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %17 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %18 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 253182526, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_83_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %19 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %19)
  %20 = load i8** %2, align 8
  %21 = call i64 @strlen(i8* %20) #10
  call void @_Z4joinj(i32 253182526)
  ret i64 %21
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #6

; Function Attrs: nounwind uwtable
define i8* @_RV_strpbrk(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %str1_pmd, %struct._RV_pmd* %str2_pmd, i8* %str1, i8* %str2, i8* %file_name, i8* %func_name, i32 %s1_line, i32 %s1_col, i8* %s1_name, i32 %s2_line, i32 %s2_col, i8* %s2_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._RV_pmd*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %ret = alloca i8*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %str1_pmd, %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %str2_pmd, %struct._RV_pmd** %3, align 8
  store i8* %str1, i8** %4, align 8
  store i8* %str2, i8** %5, align 8
  store i8* %file_name, i8** %6, align 8
  store i8* %func_name, i8** %7, align 8
  store i32 %s1_line, i32* %8, align 4
  store i32 %s1_col, i32* %9, align 4
  store i8* %s1_name, i8** %10, align 8
  store i32 %s2_line, i32* %11, align 4
  store i32 %s2_col, i32* %12, align 4
  store i8* %s2_name, i8** %13, align 8
  %14 = load %struct._RV_pmd** %2, align 8
  %15 = load i8** %4, align 8
  %16 = load i8** %4, align 8
  %17 = call i32 @_RV_sstrlen(i8* %16)
  %18 = add nsw i32 %17, 1
  %19 = sext i32 %18 to i64
  %20 = load i8** %6, align 8
  %21 = load i8** %7, align 8
  %22 = load i32* %8, align 4
  %23 = load i32* %9, align 4
  %24 = load i8** %10, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %14 to i8*
  %zybc_11 = bitcast i8* %15 to i8*
  %zyarg_12 = inttoptr i64 %19 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %20 to i8*
  %zybc_15 = bitcast i8* %21 to i8*
  %zyarg_16 = inttoptr i32 %22 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %23 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %24 to i8*
  %25 = load %struct._RV_pmd** %3, align 8
  %26 = load i8** %5, align 8
  %27 = load i8** %5, align 8
  %28 = call i32 @_RV_sstrlen(i8* %27)
  %29 = add nsw i32 %28, 1
  %30 = sext i32 %29 to i64
  %31 = load i8** %6, align 8
  %32 = load i8** %7, align 8
  %33 = load i32* %11, align 4
  %34 = load i32* %12, align 4
  %35 = load i8** %13, align 8
  %zybc_ = bitcast %struct._RV_pmd* %25 to i8*
  %zybc_1 = bitcast i8* %26 to i8*
  %zyarg_ = inttoptr i64 %30 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %31 to i8*
  %zybc_4 = bitcast i8* %32 to i8*
  %zyarg_5 = inttoptr i32 %33 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %34 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %35 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 -408070554, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_84_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %36 = load i8** %4, align 8
  %37 = load i8** %5, align 8
  %38 = call i8* @strpbrk(i8* %36, i8* %37) #10
  store i8* %38, i8** %ret, align 8
  %39 = load i8** %ret, align 8
  %40 = icmp eq i8* %39, null
  br i1 %40, label %41, label %43

; <label>:41                                      ; preds = %0
  %42 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %42)
  br label %47

; <label>:43                                      ; preds = %0
  %44 = load %struct._RV_pmd** %1, align 8
  %45 = load %struct._RV_pmd** %2, align 8
  %46 = call %struct._RV_pmd* @_RV_pmd_cp_pmd(%struct._RV_pmd* %44, %struct._RV_pmd* %45)
  br label %47

; <label>:47                                      ; preds = %43, %41
  call void @_Z4joinj(i32 -408070554)
  %48 = load %struct._RV_pmd** %3, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %48)
  %49 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %49)
  %50 = load i8** %ret, align 8
  ret i8* %50
}

; Function Attrs: nounwind readonly
declare i8* @strpbrk(i8*, i8*) #6

; Function Attrs: nounwind uwtable
define i8* @_RV_strrchr(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %str_pmd, i8* %str, i32 %c, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %ret = alloca i8*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %str_pmd, %struct._RV_pmd** %2, align 8
  store i8* %str, i8** %3, align 8
  store i32 %c, i32* %4, align 4
  store i8* %file_name, i8** %5, align 8
  store i8* %func_name, i8** %6, align 8
  store i32 %s_line, i32* %7, align 4
  store i32 %s_col, i32* %8, align 4
  store i8* %s_name, i8** %9, align 8
  %10 = load %struct._RV_pmd** %2, align 8
  %11 = load i8** %3, align 8
  %12 = load i8** %3, align 8
  %13 = call i32 @_RV_sstrlen(i8* %12)
  %14 = add nsw i32 %13, 1
  %15 = sext i32 %14 to i64
  %16 = load i8** %5, align 8
  %17 = load i8** %6, align 8
  %18 = load i32* %7, align 4
  %19 = load i32* %8, align 4
  %20 = load i8** %9, align 8
  %zybc_ = bitcast %struct._RV_pmd* %10 to i8*
  %zybc_1 = bitcast i8* %11 to i8*
  %zyarg_ = inttoptr i64 %15 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %16 to i8*
  %zybc_4 = bitcast i8* %17 to i8*
  %zyarg_5 = inttoptr i32 %18 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %19 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %20 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -1569966603, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_85_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %21 = load i8** %3, align 8
  %22 = load i32* %4, align 4
  %23 = call i8* @strrchr(i8* %21, i32 %22) #10
  store i8* %23, i8** %ret, align 8
  %24 = load i8** %ret, align 8
  %25 = icmp eq i8* %24, null
  br i1 %25, label %26, label %28

; <label>:26                                      ; preds = %0
  %27 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %27)
  br label %32

; <label>:28                                      ; preds = %0
  %29 = load %struct._RV_pmd** %1, align 8
  %30 = load %struct._RV_pmd** %2, align 8
  %31 = call %struct._RV_pmd* @_RV_pmd_cp_pmd(%struct._RV_pmd* %29, %struct._RV_pmd* %30)
  br label %32

; <label>:32                                      ; preds = %28, %26
  call void @_Z4joinj(i32 -1569966603)
  %33 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %33)
  %34 = load i8** %ret, align 8
  ret i8* %34
}

; Function Attrs: nounwind readonly
declare i8* @strrchr(i8*, i32) #6

; Function Attrs: nounwind uwtable
define i64 @_RV_strspn(%struct._RV_pmd* %str1_pmd, %struct._RV_pmd* %str2_pmd, i8* %str1, i8* %str2, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name, i32 %t_line, i32 %t_col, i8* %t_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  store %struct._RV_pmd* %str1_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %str2_pmd, %struct._RV_pmd** %2, align 8
  store i8* %str1, i8** %3, align 8
  store i8* %str2, i8** %4, align 8
  store i8* %file_name, i8** %5, align 8
  store i8* %func_name, i8** %6, align 8
  store i32 %s_line, i32* %7, align 4
  store i32 %s_col, i32* %8, align 4
  store i8* %s_name, i8** %9, align 8
  store i32 %t_line, i32* %10, align 4
  store i32 %t_col, i32* %11, align 4
  store i8* %t_name, i8** %12, align 8
  %13 = load %struct._RV_pmd** %1, align 8
  %14 = load i8** %3, align 8
  %15 = load i8** %3, align 8
  %16 = call i32 @_RV_sstrlen(i8* %15)
  %17 = add nsw i32 %16, 1
  %18 = sext i32 %17 to i64
  %19 = load i8** %5, align 8
  %20 = load i8** %6, align 8
  %21 = load i32* %7, align 4
  %22 = load i32* %8, align 4
  %23 = load i8** %9, align 8
  %zybc_ = bitcast %struct._RV_pmd* %13 to i8*
  %zybc_1 = bitcast i8* %14 to i8*
  %zyarg_ = inttoptr i64 %18 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %19 to i8*
  %zybc_4 = bitcast i8* %20 to i8*
  %zyarg_5 = inttoptr i32 %21 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %22 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %23 to i8*
  %24 = load %struct._RV_pmd** %2, align 8
  %25 = load i8** %4, align 8
  %26 = load i8** %4, align 8
  %27 = call i32 @_RV_sstrlen(i8* %26)
  %28 = add nsw i32 %27, 1
  %29 = sext i32 %28 to i64
  %30 = load i8** %5, align 8
  %31 = load i8** %6, align 8
  %32 = load i32* %10, align 4
  %33 = load i32* %11, align 4
  %34 = load i8** %12, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %24 to i8*
  %zybc_11 = bitcast i8* %25 to i8*
  %zyarg_12 = inttoptr i64 %29 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %30 to i8*
  %zybc_15 = bitcast i8* %31 to i8*
  %zyarg_16 = inttoptr i32 %32 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %33 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %34 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 1454152849, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_86_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %35 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %35)
  %36 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %36)
  %37 = load i8** %3, align 8
  %38 = load i8** %4, align 8
  %39 = call i64 @strspn(i8* %37, i8* %38) #10
  call void @_Z4joinj(i32 1454152849)
  ret i64 %39
}

; Function Attrs: nounwind readonly
declare i64 @strspn(i8*, i8*) #6

; Function Attrs: nounwind uwtable
define i8* @_RV_strstr(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %haystack_pmd, %struct._RV_pmd* %needle_pmd, i8* %haystack, i8* %needle, i8* %file_name, i8* %func_name, i32 %h_line, i32 %h_col, i8* %h_name, i32 %n_line, i32 %n_col, i8* %n_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._RV_pmd*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %ret = alloca i8*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %haystack_pmd, %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %needle_pmd, %struct._RV_pmd** %3, align 8
  store i8* %haystack, i8** %4, align 8
  store i8* %needle, i8** %5, align 8
  store i8* %file_name, i8** %6, align 8
  store i8* %func_name, i8** %7, align 8
  store i32 %h_line, i32* %8, align 4
  store i32 %h_col, i32* %9, align 4
  store i8* %h_name, i8** %10, align 8
  store i32 %n_line, i32* %11, align 4
  store i32 %n_col, i32* %12, align 4
  store i8* %n_name, i8** %13, align 8
  %14 = load %struct._RV_pmd** %2, align 8
  %15 = load i8** %4, align 8
  %16 = load i8** %4, align 8
  %17 = call i32 @_RV_sstrlen(i8* %16)
  %18 = add nsw i32 %17, 1
  %19 = sext i32 %18 to i64
  %20 = load i8** %6, align 8
  %21 = load i8** %7, align 8
  %22 = load i32* %8, align 4
  %23 = load i32* %9, align 4
  %24 = load i8** %10, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %14 to i8*
  %zybc_11 = bitcast i8* %15 to i8*
  %zyarg_12 = inttoptr i64 %19 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %20 to i8*
  %zybc_15 = bitcast i8* %21 to i8*
  %zyarg_16 = inttoptr i32 %22 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %23 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %24 to i8*
  %25 = load %struct._RV_pmd** %3, align 8
  %26 = load i8** %5, align 8
  %27 = load i8** %5, align 8
  %28 = call i32 @_RV_sstrlen(i8* %27)
  %29 = add nsw i32 %28, 1
  %30 = sext i32 %29 to i64
  %31 = load i8** %6, align 8
  %32 = load i8** %7, align 8
  %33 = load i32* %11, align 4
  %34 = load i32* %12, align 4
  %35 = load i8** %13, align 8
  %zybc_ = bitcast %struct._RV_pmd* %25 to i8*
  %zybc_1 = bitcast i8* %26 to i8*
  %zyarg_ = inttoptr i64 %30 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %31 to i8*
  %zybc_4 = bitcast i8* %32 to i8*
  %zyarg_5 = inttoptr i32 %33 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %34 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %35 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 -1511828932, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_87_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %36 = load i8** %4, align 8
  %37 = load i8** %5, align 8
  %38 = call i8* @strstr(i8* %36, i8* %37) #10
  store i8* %38, i8** %ret, align 8
  %39 = load i8** %ret, align 8
  %40 = icmp eq i8* %39, null
  br i1 %40, label %41, label %43

; <label>:41                                      ; preds = %0
  %42 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %42)
  br label %47

; <label>:43                                      ; preds = %0
  %44 = load %struct._RV_pmd** %1, align 8
  %45 = load %struct._RV_pmd** %2, align 8
  %46 = call %struct._RV_pmd* @_RV_pmd_cp_pmd(%struct._RV_pmd* %44, %struct._RV_pmd* %45)
  br label %47

; <label>:47                                      ; preds = %43, %41
  call void @_Z4joinj(i32 -1511828932)
  %48 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %48)
  %49 = load %struct._RV_pmd** %3, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %49)
  %50 = load i8** %ret, align 8
  ret i8* %50
}

; Function Attrs: nounwind readonly
declare i8* @strstr(i8*, i8*) #6

; Function Attrs: nounwind uwtable
define i8* @_RV_strtok(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %str_pmd, %struct._RV_pmd* %delim_pmd, i8* %str, i8* %delim, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name, i32 %d_line, i32 %d_col, i8* %d_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._RV_pmd*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %ret = alloca i8*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %str_pmd, %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %delim_pmd, %struct._RV_pmd** %3, align 8
  store i8* %str, i8** %4, align 8
  store i8* %delim, i8** %5, align 8
  store i8* %file_name, i8** %6, align 8
  store i8* %func_name, i8** %7, align 8
  store i32 %s_line, i32* %8, align 4
  store i32 %s_col, i32* %9, align 4
  store i8* %s_name, i8** %10, align 8
  store i32 %d_line, i32* %11, align 4
  store i32 %d_col, i32* %12, align 4
  store i8* %d_name, i8** %13, align 8
  %14 = load i8** %4, align 8
  %15 = icmp ne i8* %14, null
  br i1 %15, label %16, label %30

; <label>:16                                      ; preds = %0
  %17 = load %struct._RV_pmd** %2, align 8
  %18 = call %struct._RV_pmd* @_RV_pmd_cp_pmd(%struct._RV_pmd* bitcast ({ i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] }* @_RV_strtok.pmd to %struct._RV_pmd*), %struct._RV_pmd* %17)
  %19 = load %struct._RV_pmd** %2, align 8
  %20 = load i8** %4, align 8
  %21 = load i8** %4, align 8
  %22 = call i32 @_RV_sstrlen(i8* %21)
  %23 = add nsw i32 %22, 1
  %24 = sext i32 %23 to i64
  %25 = load i8** %6, align 8
  %26 = load i8** %7, align 8
  %27 = load i32* %8, align 4
  %28 = load i32* %9, align 4
  %29 = load i8** %10, align 8
  %zybc_ = bitcast %struct._RV_pmd* %19 to i8*
  %zybc_1 = bitcast i8* %20 to i8*
  %zyarg_ = inttoptr i64 %24 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %25 to i8*
  %zybc_4 = bitcast i8* %26 to i8*
  %zyarg_5 = inttoptr i32 %27 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %28 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %29 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 319345060, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_88_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  br label %30

; <label>:30                                      ; preds = %16, %0
  %31 = load %struct._RV_pmd** %3, align 8
  %32 = load i8** %5, align 8
  %33 = load i8** %5, align 8
  %34 = call i32 @_RV_sstrlen(i8* %33)
  %35 = add nsw i32 %34, 1
  %36 = sext i32 %35 to i64
  %37 = load i8** %6, align 8
  %38 = load i8** %7, align 8
  %39 = load i32* %11, align 4
  %40 = load i32* %12, align 4
  %41 = load i8** %13, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %31 to i8*
  %zybc_11 = bitcast i8* %32 to i8*
  %zyarg_12 = inttoptr i64 %36 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %37 to i8*
  %zybc_15 = bitcast i8* %38 to i8*
  %zyarg_16 = inttoptr i32 %39 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %40 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %41 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -1115857254, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_89_0, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %42 = load i8** %4, align 8
  %43 = load i8** %5, align 8
  %44 = call i8* @strtok(i8* %42, i8* %43) #7
  store i8* %44, i8** %ret, align 8
  %45 = load i8** %ret, align 8
  %46 = icmp eq i8* %45, null
  br i1 %46, label %47, label %49

; <label>:47                                      ; preds = %30
  %48 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %48)
  br label %52

; <label>:49                                      ; preds = %30
  %50 = load %struct._RV_pmd** %1, align 8
  %51 = call %struct._RV_pmd* @_RV_pmd_cp_pmd(%struct._RV_pmd* %50, %struct._RV_pmd* bitcast ({ i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] }* @_RV_strtok.pmd to %struct._RV_pmd*))
  br label %52

; <label>:52                                      ; preds = %49, %47
  call void @_Z4joinj(i32 319345060)
  call void @_Z4joinj(i32 -1115857254)
  %53 = load %struct._RV_pmd** %3, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %53)
  %54 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %54)
  %55 = load i8** %ret, align 8
  ret i8* %55
}

; Function Attrs: nounwind
declare i8* @strtok(i8*, i8*) #3

; Function Attrs: nounwind uwtable
define i64 @_RV_strxfrm(%struct._RV_pmd* %dest_pmd, %struct._RV_pmd* %src_pmd, i8* %dest, i8* %src, i64 %n, i8* %file_name, i8* %func_name, i32 %d_line, i32 %d_col, i8* %d_name, i32 %s_line, i32 %s_col, i8* %s_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  store %struct._RV_pmd* %dest_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %src_pmd, %struct._RV_pmd** %2, align 8
  store i8* %dest, i8** %3, align 8
  store i8* %src, i8** %4, align 8
  store i64 %n, i64* %5, align 8
  store i8* %file_name, i8** %6, align 8
  store i8* %func_name, i8** %7, align 8
  store i32 %d_line, i32* %8, align 4
  store i32 %d_col, i32* %9, align 4
  store i8* %d_name, i8** %10, align 8
  store i32 %s_line, i32* %11, align 4
  store i32 %s_col, i32* %12, align 4
  store i8* %s_name, i8** %13, align 8
  %14 = load %struct._RV_pmd** %2, align 8
  %15 = load i8** %4, align 8
  %16 = load i64* %5, align 8
  %17 = load i8** %6, align 8
  %18 = load i8** %7, align 8
  %19 = load i32* %11, align 4
  %20 = load i32* %12, align 4
  %21 = load i8** %13, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %14 to i8*
  %zybc_11 = bitcast i8* %15 to i8*
  %zyarg_12 = inttoptr i64 %16 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %17 to i8*
  %zybc_15 = bitcast i8* %18 to i8*
  %zyarg_16 = inttoptr i32 %19 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %20 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %21 to i8*
  %22 = load %struct._RV_pmd** %1, align 8
  %23 = load i8** %3, align 8
  %24 = load i64* %5, align 8
  %25 = load i8** %6, align 8
  %26 = load i8** %7, align 8
  %27 = load i32* %8, align 4
  %28 = load i32* %9, align 4
  %29 = load i8** %10, align 8
  %zybc_ = bitcast %struct._RV_pmd* %22 to i8*
  %zybc_1 = bitcast i8* %23 to i8*
  %zyarg_ = inttoptr i64 %24 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %25 to i8*
  %zybc_4 = bitcast i8* %26 to i8*
  %zyarg_5 = inttoptr i32 %27 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %28 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %29 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 1311071085, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_90_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %30 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %30)
  %31 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %31)
  %32 = load i8** %3, align 8
  %33 = load i8** %4, align 8
  %34 = load i64* %5, align 8
  %35 = call i64 @strxfrm(i8* %32, i8* %33, i64 %34) #7
  call void @_Z4joinj(i32 1311071085)
  ret i64 %35
}

; Function Attrs: nounwind
declare i64 @strxfrm(i8*, i8*, i64) #3

; Function Attrs: nounwind uwtable
define void @_RV_bzero(%struct._RV_pmd* %s_pmd, i8* %s, i32 %n, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  store %struct._RV_pmd* %s_pmd, %struct._RV_pmd** %1, align 8
  store i8* %s, i8** %2, align 8
  store i32 %n, i32* %3, align 4
  store i8* %file_name, i8** %4, align 8
  store i8* %func_name, i8** %5, align 8
  store i32 %s_line, i32* %6, align 4
  store i32 %s_col, i32* %7, align 4
  store i8* %s_name, i8** %8, align 8
  %9 = load %struct._RV_pmd** %1, align 8
  %10 = load i8** %2, align 8
  %11 = load i32* %3, align 4
  %12 = sext i32 %11 to i64
  %13 = load i8** %4, align 8
  %14 = load i8** %5, align 8
  %15 = load i32* %6, align 4
  %16 = load i32* %7, align 4
  %17 = load i8** %8, align 8
  %zybc_ = bitcast %struct._RV_pmd* %9 to i8*
  %zybc_1 = bitcast i8* %10 to i8*
  %zyarg_ = inttoptr i64 %12 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %13 to i8*
  %zybc_4 = bitcast i8* %14 to i8*
  %zyarg_5 = inttoptr i32 %15 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %16 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %17 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -1198166194, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_91_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %18 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %18)
  %19 = load i8** %2, align 8
  %20 = load i32* %3, align 4
  %21 = sext i32 %20 to i64
  call void @llvm.memset.p0i8.i64(i8* %19, i8 0, i64 %21, i32 1, i1 false)
  call void @_Z4joinj(i32 -1198166194)
  ret void
}

; Function Attrs: nounwind uwtable
define void @_RV_bcopy(%struct._RV_pmd* %src_pmd, %struct._RV_pmd* %dest_pmd, i8* %src, i8* %dest, i32 %n, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name, i32 %d_line, i32 %d_col, i8* %d_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %p = alloca i8*, align 8
  %p_pmd = alloca %struct._RV_pmd*, align 8
  store %struct._RV_pmd* %src_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %dest_pmd, %struct._RV_pmd** %2, align 8
  store i8* %src, i8** %3, align 8
  store i8* %dest, i8** %4, align 8
  store i32 %n, i32* %5, align 4
  store i8* %file_name, i8** %6, align 8
  store i8* %func_name, i8** %7, align 8
  store i32 %s_line, i32* %8, align 4
  store i32 %s_col, i32* %9, align 4
  store i8* %s_name, i8** %10, align 8
  store i32 %d_line, i32* %11, align 4
  store i32 %d_col, i32* %12, align 4
  store i8* %d_name, i8** %13, align 8
  %14 = load %struct._RV_pmd** %1, align 8
  %15 = load i8** %3, align 8
  %16 = load i32* %5, align 4
  %17 = sext i32 %16 to i64
  %18 = load i8** %6, align 8
  %19 = load i8** %7, align 8
  %20 = load i32* %8, align 4
  %21 = load i32* %9, align 4
  %22 = load i8** %10, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %14 to i8*
  %zybc_11 = bitcast i8* %15 to i8*
  %zyarg_12 = inttoptr i64 %17 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %18 to i8*
  %zybc_15 = bitcast i8* %19 to i8*
  %zyarg_16 = inttoptr i32 %20 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %21 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %22 to i8*
  %23 = load %struct._RV_pmd** %2, align 8
  %24 = load i8** %4, align 8
  %25 = load i32* %5, align 4
  %26 = sext i32 %25 to i64
  %27 = load i8** %6, align 8
  %28 = load i8** %7, align 8
  %29 = load i32* %11, align 4
  %30 = load i32* %12, align 4
  %31 = load i8** %13, align 8
  %zybc_ = bitcast %struct._RV_pmd* %23 to i8*
  %zybc_1 = bitcast i8* %24 to i8*
  %zyarg_ = inttoptr i64 %26 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %27 to i8*
  %zybc_4 = bitcast i8* %28 to i8*
  %zyarg_5 = inttoptr i32 %29 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %30 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %31 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 922739315, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_92_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %32 = load i8** %4, align 8
  %33 = load i8** %3, align 8
  %34 = icmp ult i8* %32, %33
  br i1 %34, label %35, label %74

; <label>:35                                      ; preds = %0
  %36 = load i8** %3, align 8
  %37 = ptrtoint i8* %36 to i64
  %38 = and i64 %37, -8
  %39 = inttoptr i64 %38 to i8*
  store i8* %39, i8** %p, align 8
  br label %40

; <label>:40                                      ; preds = %70, %35
  %41 = load i8** %p, align 8
  %42 = load i8** %3, align 8
  %43 = load i32* %5, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr i8* %42, i64 %44
  %46 = icmp ult i8* %41, %45
  br i1 %46, label %47, label %73

; <label>:47                                      ; preds = %40
  %48 = load i8** %p, align 8
  %49 = load i8** %3, align 8
  %50 = icmp ult i8* %48, %49
  br i1 %50, label %51, label %52

; <label>:51                                      ; preds = %47
  br label %70

; <label>:52                                      ; preds = %47
  %53 = load i8** %p, align 8
  %54 = bitcast i8* %53 to i8**
  %55 = call %struct._RV_pmd* @_RV_pmd_tbl_lookup(i8** %54)
  store %struct._RV_pmd* %55, %struct._RV_pmd** %p_pmd, align 8
  %56 = load %struct._RV_pmd** %p_pmd, align 8
  %57 = icmp ne %struct._RV_pmd* %56, null
  br i1 %57, label %58, label %69

; <label>:58                                      ; preds = %52
  %59 = load i8** %4, align 8
  %60 = load i8** %p, align 8
  %61 = load i8** %3, align 8
  %62 = ptrtoint i8* %60 to i64
  %63 = ptrtoint i8* %61 to i64
  %64 = sub i64 %62, %63
  %65 = getelementptr i8* %59, i64 %64
  %66 = bitcast i8* %65 to i8**
  %67 = load %struct._RV_pmd** %p_pmd, align 8
  %68 = call %struct._RV_pmd* @_RV_pmd_tbl_update_pmd(i8** %66, %struct._RV_pmd* %67)
  br label %69

; <label>:69                                      ; preds = %58, %52
  br label %70

; <label>:70                                      ; preds = %69, %51
  %71 = load i8** %p, align 8
  %72 = getelementptr i8* %71, i64 8
  store i8* %72, i8** %p, align 8
  br label %40

; <label>:73                                      ; preds = %40
  br label %114

; <label>:74                                      ; preds = %0
  %75 = load i8** %4, align 8
  %76 = load i8** %3, align 8
  %77 = icmp ugt i8* %75, %76
  br i1 %77, label %78, label %113

; <label>:78                                      ; preds = %74
  %79 = load i8** %3, align 8
  %80 = load i32* %5, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr i8* %79, i64 %81
  %83 = getelementptr i8* %82, i64 -1
  %84 = ptrtoint i8* %83 to i64
  %85 = and i64 %84, -8
  %86 = inttoptr i64 %85 to i8*
  store i8* %86, i8** %p, align 8
  br label %87

; <label>:87                                      ; preds = %109, %78
  %88 = load i8** %p, align 8
  %89 = load i8** %3, align 8
  %90 = icmp uge i8* %88, %89
  br i1 %90, label %91, label %112

; <label>:91                                      ; preds = %87
  %92 = load i8** %p, align 8
  %93 = bitcast i8* %92 to i8**
  %94 = call %struct._RV_pmd* @_RV_pmd_tbl_lookup(i8** %93)
  store %struct._RV_pmd* %94, %struct._RV_pmd** %p_pmd, align 8
  %95 = load %struct._RV_pmd** %p_pmd, align 8
  %96 = icmp ne %struct._RV_pmd* %95, null
  br i1 %96, label %97, label %108

; <label>:97                                      ; preds = %91
  %98 = load i8** %4, align 8
  %99 = load i8** %p, align 8
  %100 = load i8** %3, align 8
  %101 = ptrtoint i8* %99 to i64
  %102 = ptrtoint i8* %100 to i64
  %103 = sub i64 %101, %102
  %104 = getelementptr i8* %98, i64 %103
  %105 = bitcast i8* %104 to i8**
  %106 = load %struct._RV_pmd** %p_pmd, align 8
  %107 = call %struct._RV_pmd* @_RV_pmd_tbl_update_pmd(i8** %105, %struct._RV_pmd* %106)
  br label %108

; <label>:108                                     ; preds = %97, %91
  br label %109

; <label>:109                                     ; preds = %108
  %110 = load i8** %p, align 8
  %111 = getelementptr i8* %110, i64 -8
  store i8* %111, i8** %p, align 8
  br label %87

; <label>:112                                     ; preds = %87
  br label %113

; <label>:113                                     ; preds = %112, %74
  br label %114

; <label>:114                                     ; preds = %113, %73
  call void @_Z4joinj(i32 922739315)
  %115 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %115)
  %116 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %116)
  %117 = load i8** %3, align 8
  %118 = load i8** %4, align 8
  %119 = load i32* %5, align 4
  %120 = sext i32 %119 to i64
  call void @bcopy(i8* %117, i8* %118, i64 %120) #7
  ret void
}

; Function Attrs: nounwind
declare void @bcopy(i8*, i8*, i64) #3

; Function Attrs: nounwind uwtable
define i8* @_RV_asctime(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %timeptr_pmd, %struct.tm* %timeptr, i8* %file_name, i8* %func_name, i32 %t_line, i32 %t_col, i8* %t_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct.tm*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %ret = alloca i8*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %timeptr_pmd, %struct._RV_pmd** %2, align 8
  store %struct.tm* %timeptr, %struct.tm** %3, align 8
  store i8* %file_name, i8** %4, align 8
  store i8* %func_name, i8** %5, align 8
  store i32 %t_line, i32* %6, align 4
  store i32 %t_col, i32* %7, align 4
  store i8* %t_name, i8** %8, align 8
  %9 = load %struct._RV_pmd** %2, align 8
  %10 = load %struct.tm** %3, align 8
  %11 = bitcast %struct.tm* %10 to i8*
  %12 = load i8** %4, align 8
  %13 = load i8** %5, align 8
  %14 = load i32* %6, align 4
  %15 = load i32* %7, align 4
  %16 = load i8** %8, align 8
  %zybc_ = bitcast %struct._RV_pmd* %9 to i8*
  %zybc_1 = bitcast i8* %11 to i8*
  %zyarg_ = inttoptr i64 56 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %12 to i8*
  %zybc_4 = bitcast i8* %13 to i8*
  %zyarg_5 = inttoptr i32 %14 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %15 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %16 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -325853030, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_93_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %17 = load %struct.tm** %3, align 8
  %18 = call i8* @asctime(%struct.tm* %17) #7
  store i8* %18, i8** %ret, align 8
  %19 = load i8** %ret, align 8
  %20 = icmp eq i8* %19, null
  br i1 %20, label %21, label %23

; <label>:21                                      ; preds = %0
  %22 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %22)
  br label %34

; <label>:23                                      ; preds = %0
  %24 = load %struct._RV_pmd** %1, align 8
  %25 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %26 = load i8** %ret, align 8
  %27 = load i8** %ret, align 8
  %28 = load i8** %ret, align 8
  %29 = call i32 @_RV_sstrlen(i8* %28)
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i8* %27, i64 %30
  %32 = getelementptr inbounds i8* %31, i64 1
  %33 = call %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %24, %struct._RV_stat_node* %25, i32 0, i8* %26, i8* %32)
  br label %34

; <label>:34                                      ; preds = %23, %21
  call void @_Z4joinj(i32 -325853030)
  %35 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %35)
  %36 = load i8** %ret, align 8
  ret i8* %36
}

; Function Attrs: nounwind
declare i8* @asctime(%struct.tm*) #3

; Function Attrs: nounwind uwtable
define i8* @_RV_ctime(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %timeptr_pmd, i64* %timeptr, i8* %file_name, i8* %func_name, i32 %t_line, i32 %t_col, i8* %t_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i64*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %ret = alloca i8*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %timeptr_pmd, %struct._RV_pmd** %2, align 8
  store i64* %timeptr, i64** %3, align 8
  store i8* %file_name, i8** %4, align 8
  store i8* %func_name, i8** %5, align 8
  store i32 %t_line, i32* %6, align 4
  store i32 %t_col, i32* %7, align 4
  store i8* %t_name, i8** %8, align 8
  %9 = load %struct._RV_pmd** %2, align 8
  %10 = load i64** %3, align 8
  %11 = bitcast i64* %10 to i8*
  %12 = load i8** %4, align 8
  %13 = load i8** %5, align 8
  %14 = load i32* %6, align 4
  %15 = load i32* %7, align 4
  %16 = load i8** %8, align 8
  %zybc_ = bitcast %struct._RV_pmd* %9 to i8*
  %zybc_1 = bitcast i8* %11 to i8*
  %zyarg_ = inttoptr i64 8 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %12 to i8*
  %zybc_4 = bitcast i8* %13 to i8*
  %zyarg_5 = inttoptr i32 %14 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %15 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %16 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 559720086, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_94_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %17 = load i64** %3, align 8
  %18 = call i8* @ctime(i64* %17) #7
  store i8* %18, i8** %ret, align 8
  %19 = load i8** %ret, align 8
  %20 = icmp eq i8* %19, null
  br i1 %20, label %21, label %23

; <label>:21                                      ; preds = %0
  %22 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %22)
  br label %34

; <label>:23                                      ; preds = %0
  %24 = load %struct._RV_pmd** %1, align 8
  %25 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %26 = load i8** %ret, align 8
  %27 = load i8** %ret, align 8
  %28 = load i8** %ret, align 8
  %29 = call i32 @_RV_sstrlen(i8* %28)
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i8* %27, i64 %30
  %32 = getelementptr inbounds i8* %31, i64 1
  %33 = call %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %24, %struct._RV_stat_node* %25, i32 0, i8* %26, i8* %32)
  br label %34

; <label>:34                                      ; preds = %23, %21
  call void @_Z4joinj(i32 559720086)
  %35 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %35)
  %36 = load i8** %ret, align 8
  ret i8* %36
}

; Function Attrs: nounwind
declare i8* @ctime(i64*) #3

; Function Attrs: nounwind uwtable
define %struct.tm* @_RV_gmtime(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %timeptr_pmd, i64* %timeptr, i8* %file_name, i8* %func_name, i32 %t_line, i32 %t_col, i8* %t_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i64*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %ret = alloca %struct.tm*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %timeptr_pmd, %struct._RV_pmd** %2, align 8
  store i64* %timeptr, i64** %3, align 8
  store i8* %file_name, i8** %4, align 8
  store i8* %func_name, i8** %5, align 8
  store i32 %t_line, i32* %6, align 4
  store i32 %t_col, i32* %7, align 4
  store i8* %t_name, i8** %8, align 8
  %9 = load %struct._RV_pmd** %2, align 8
  %10 = load i64** %3, align 8
  %11 = bitcast i64* %10 to i8*
  %12 = load i8** %4, align 8
  %13 = load i8** %5, align 8
  %14 = load i32* %6, align 4
  %15 = load i32* %7, align 4
  %16 = load i8** %8, align 8
  %zybc_ = bitcast %struct._RV_pmd* %9 to i8*
  %zybc_1 = bitcast i8* %11 to i8*
  %zyarg_ = inttoptr i64 8 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %12 to i8*
  %zybc_4 = bitcast i8* %13 to i8*
  %zyarg_5 = inttoptr i32 %14 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %15 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %16 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 1927165182, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_95_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %17 = load i64** %3, align 8
  %18 = call %struct.tm* @gmtime(i64* %17) #7
  store %struct.tm* %18, %struct.tm** %ret, align 8
  %19 = load %struct.tm** %ret, align 8
  %20 = icmp eq %struct.tm* %19, null
  br i1 %20, label %21, label %23

; <label>:21                                      ; preds = %0
  %22 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %22)
  br label %32

; <label>:23                                      ; preds = %0
  %24 = load %struct._RV_pmd** %1, align 8
  %25 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %26 = load %struct.tm** %ret, align 8
  %27 = bitcast %struct.tm* %26 to i8*
  %28 = load %struct.tm** %ret, align 8
  %29 = getelementptr inbounds %struct.tm* %28, i64 1
  %30 = bitcast %struct.tm* %29 to i8*
  %31 = call %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %24, %struct._RV_stat_node* %25, i32 0, i8* %27, i8* %30)
  br label %32

; <label>:32                                      ; preds = %23, %21
  call void @_Z4joinj(i32 1927165182)
  %33 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %33)
  %34 = load %struct.tm** %ret, align 8
  ret %struct.tm* %34
}

; Function Attrs: nounwind
declare %struct.tm* @gmtime(i64*) #3

; Function Attrs: nounwind uwtable
define %struct.tm* @_RV_localtime(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %timeptr_pmd, i64* %timeptr, i8* %file_name, i8* %func_name, i32 %t_line, i32 %t_col, i8* %t_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i64*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %ret = alloca %struct.tm*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %timeptr_pmd, %struct._RV_pmd** %2, align 8
  store i64* %timeptr, i64** %3, align 8
  store i8* %file_name, i8** %4, align 8
  store i8* %func_name, i8** %5, align 8
  store i32 %t_line, i32* %6, align 4
  store i32 %t_col, i32* %7, align 4
  store i8* %t_name, i8** %8, align 8
  %9 = load %struct._RV_pmd** %2, align 8
  %10 = load i64** %3, align 8
  %11 = bitcast i64* %10 to i8*
  %12 = load i8** %4, align 8
  %13 = load i8** %5, align 8
  %14 = load i32* %6, align 4
  %15 = load i32* %7, align 4
  %16 = load i8** %8, align 8
  %zybc_ = bitcast %struct._RV_pmd* %9 to i8*
  %zybc_1 = bitcast i8* %11 to i8*
  %zyarg_ = inttoptr i64 8 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %12 to i8*
  %zybc_4 = bitcast i8* %13 to i8*
  %zyarg_5 = inttoptr i32 %14 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %15 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %16 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 2053388584, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_96_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %17 = load i64** %3, align 8
  %18 = call %struct.tm* @localtime(i64* %17) #7
  store %struct.tm* %18, %struct.tm** %ret, align 8
  %19 = load %struct.tm** %ret, align 8
  %20 = icmp eq %struct.tm* %19, null
  br i1 %20, label %21, label %23

; <label>:21                                      ; preds = %0
  %22 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %22)
  br label %32

; <label>:23                                      ; preds = %0
  %24 = load %struct._RV_pmd** %1, align 8
  %25 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %26 = load %struct.tm** %ret, align 8
  %27 = bitcast %struct.tm* %26 to i8*
  %28 = load %struct.tm** %ret, align 8
  %29 = getelementptr inbounds %struct.tm* %28, i64 1
  %30 = bitcast %struct.tm* %29 to i8*
  %31 = call %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %24, %struct._RV_stat_node* %25, i32 0, i8* %27, i8* %30)
  br label %32

; <label>:32                                      ; preds = %23, %21
  call void @_Z4joinj(i32 2053388584)
  %33 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %33)
  %34 = load %struct.tm** %ret, align 8
  ret %struct.tm* %34
}

; Function Attrs: nounwind
declare %struct.tm* @localtime(i64*) #3

; Function Attrs: nounwind uwtable
define i64 @_RV_mktime(%struct._RV_pmd* %timeptr_pmd, %struct.tm* %timeptr, i8* %file_name, i8* %func_name, i32 %t_line, i32 %t_col, i8* %t_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct.tm*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store %struct._RV_pmd* %timeptr_pmd, %struct._RV_pmd** %1, align 8
  store %struct.tm* %timeptr, %struct.tm** %2, align 8
  store i8* %file_name, i8** %3, align 8
  store i8* %func_name, i8** %4, align 8
  store i32 %t_line, i32* %5, align 4
  store i32 %t_col, i32* %6, align 4
  store i8* %t_name, i8** %7, align 8
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load %struct.tm** %2, align 8
  %10 = bitcast %struct.tm* %9 to i8*
  %11 = load i8** %3, align 8
  %12 = load i8** %4, align 8
  %13 = load i32* %5, align 4
  %14 = load i32* %6, align 4
  %15 = load i8** %7, align 8
  %zybc_ = bitcast %struct._RV_pmd* %8 to i8*
  %zybc_1 = bitcast i8* %10 to i8*
  %zyarg_ = inttoptr i64 56 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %11 to i8*
  %zybc_4 = bitcast i8* %12 to i8*
  %zyarg_5 = inttoptr i32 %13 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %14 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %15 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 1686280708, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_97_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %16 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %16)
  %17 = load %struct.tm** %2, align 8
  %18 = call i64 @mktime(%struct.tm* %17) #7
  call void @_Z4joinj(i32 1686280708)
  ret i64 %18
}

; Function Attrs: nounwind
declare i64 @mktime(%struct.tm*) #3

; Function Attrs: nounwind uwtable
define i64 @_RV_strftime(%struct._RV_pmd* %str_pmd, %struct._RV_pmd* %format_pmd, %struct._RV_pmd* %timeptr_pmd, i8* %str, i64 %maxsize, i8* %format, %struct.tm* %timeptr, i8* %file_name, i8* %func_name, i32 %s_line, i32 %s_col, i8* %s_name, i32 %f_line, i32 %f_col, i8* %f_name, i32 %t_line, i32 %t_col, i8* %t_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._RV_pmd*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca %struct.tm*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i8*, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  store %struct._RV_pmd* %str_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %format_pmd, %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %timeptr_pmd, %struct._RV_pmd** %3, align 8
  store i8* %str, i8** %4, align 8
  store i64 %maxsize, i64* %5, align 8
  store i8* %format, i8** %6, align 8
  store %struct.tm* %timeptr, %struct.tm** %7, align 8
  store i8* %file_name, i8** %8, align 8
  store i8* %func_name, i8** %9, align 8
  store i32 %s_line, i32* %10, align 4
  store i32 %s_col, i32* %11, align 4
  store i8* %s_name, i8** %12, align 8
  store i32 %f_line, i32* %13, align 4
  store i32 %f_col, i32* %14, align 4
  store i8* %f_name, i8** %15, align 8
  store i32 %t_line, i32* %16, align 4
  store i32 %t_col, i32* %17, align 4
  store i8* %t_name, i8** %18, align 8
  %19 = load %struct._RV_pmd** %1, align 8
  %20 = load i8** %4, align 8
  %21 = load i64* %5, align 8
  %22 = load i8** %8, align 8
  %23 = load i8** %9, align 8
  %24 = load i32* %10, align 4
  %25 = load i32* %11, align 4
  %26 = load i8** %12, align 8
  %zybc_21 = bitcast %struct._RV_pmd* %19 to i8*
  %zybc_22 = bitcast i8* %20 to i8*
  %zyarg_23 = inttoptr i64 %21 to i8*
  %zybc_24 = bitcast i8* %zyarg_23 to i8*
  %zybc_25 = bitcast i8* %22 to i8*
  %zybc_26 = bitcast i8* %23 to i8*
  %zyarg_27 = inttoptr i32 %24 to i8*
  %zybc_28 = bitcast i8* %zyarg_27 to i8*
  %zyarg_29 = inttoptr i32 %25 to i8*
  %zybc_30 = bitcast i8* %zyarg_29 to i8*
  %zybc_31 = bitcast i8* %26 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 999120211, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_99_0, i8* %zybc_21, i8* %zybc_22, i8* %zybc_24, i8* %zybc_25, i8* %zybc_26, i8* %zybc_28, i8* %zybc_30, i8* %zybc_31)
  %27 = load %struct._RV_pmd** %2, align 8
  %28 = load i8** %6, align 8
  %29 = load i8** %6, align 8
  %30 = call i32 @_RV_sstrlen(i8* %29)
  %31 = add nsw i32 %30, 1
  %32 = sext i32 %31 to i64
  %33 = load i8** %8, align 8
  %34 = load i8** %9, align 8
  %35 = load i32* %13, align 4
  %36 = load i32* %14, align 4
  %37 = load i8** %15, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %27 to i8*
  %zybc_11 = bitcast i8* %28 to i8*
  %zyarg_12 = inttoptr i64 %32 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %33 to i8*
  %zybc_15 = bitcast i8* %34 to i8*
  %zyarg_16 = inttoptr i32 %35 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %36 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %37 to i8*
  %38 = load %struct._RV_pmd** %3, align 8
  %39 = load %struct.tm** %7, align 8
  %40 = bitcast %struct.tm* %39 to i8*
  %41 = load i8** %8, align 8
  %42 = load i8** %9, align 8
  %43 = load i32* %16, align 4
  %44 = load i32* %17, align 4
  %45 = load i8** %18, align 8
  %zybc_ = bitcast %struct._RV_pmd* %38 to i8*
  %zybc_1 = bitcast i8* %40 to i8*
  %zyarg_ = inttoptr i64 56 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %41 to i8*
  %zybc_4 = bitcast i8* %42 to i8*
  %zyarg_5 = inttoptr i32 %43 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %44 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %45 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 450723668, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_98_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %46 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %46)
  %47 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %47)
  %48 = load %struct._RV_pmd** %3, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %48)
  %49 = load i8** %4, align 8
  %50 = load i64* %5, align 8
  %51 = load i8** %6, align 8
  %52 = load %struct.tm** %7, align 8
  %53 = call i64 @strftime(i8* %49, i64 %50, i8* %51, %struct.tm* %52) #7
  call void @_Z4joinj(i32 450723668)
  call void @_Z4joinj(i32 999120211)
  ret i64 %53
}

; Function Attrs: nounwind
declare i64 @strftime(i8*, i64, i8*, %struct.tm*) #3

; Function Attrs: nounwind uwtable
define i64 @_RV_time(%struct._RV_pmd* %timeptr_pmd, i64* %timeptr, i8* %file_name, i8* %func_name, i32 %t_line, i32 %t_col, i8* %t_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i64*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store %struct._RV_pmd* %timeptr_pmd, %struct._RV_pmd** %1, align 8
  store i64* %timeptr, i64** %2, align 8
  store i8* %file_name, i8** %3, align 8
  store i8* %func_name, i8** %4, align 8
  store i32 %t_line, i32* %5, align 4
  store i32 %t_col, i32* %6, align 4
  store i8* %t_name, i8** %7, align 8
  %8 = load i64** %2, align 8
  %9 = icmp ne i64* %8, null
  br i1 %9, label %10, label %19

; <label>:10                                      ; preds = %0
  %11 = load %struct._RV_pmd** %1, align 8
  %12 = load i64** %2, align 8
  %13 = bitcast i64* %12 to i8*
  %14 = load i8** %3, align 8
  %15 = load i8** %4, align 8
  %16 = load i32* %5, align 4
  %17 = load i32* %6, align 4
  %18 = load i8** %7, align 8
  %zybc_ = bitcast %struct._RV_pmd* %11 to i8*
  %zybc_1 = bitcast i8* %13 to i8*
  %zyarg_ = inttoptr i64 8 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %14 to i8*
  %zybc_4 = bitcast i8* %15 to i8*
  %zyarg_5 = inttoptr i32 %16 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %17 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %18 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 1157246033, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_100_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  br label %19

; <label>:19                                      ; preds = %10, %0
  call void @_Z4joinj(i32 1157246033)
  %20 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %20)
  %21 = load i64** %2, align 8
  %22 = call i64 @time(i64* %21) #7
  ret i64 %22
}

; Function Attrs: nounwind
declare i64 @time(i64*) #3

; Function Attrs: nounwind uwtable
define i32* @_RV___errno_location(%struct._RV_pmd* %ret_pmd) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %ret = alloca i32*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  %2 = call i32* (...)* @__errno_location()
  store i32* %2, i32** %ret, align 8
  %3 = load i32** %ret, align 8
  %4 = icmp eq i32* %3, null
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %6)
  br label %16

; <label>:7                                       ; preds = %0
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %10 = load i32** %ret, align 8
  %11 = bitcast i32* %10 to i8*
  %12 = load i32** %ret, align 8
  %13 = getelementptr inbounds i32* %12, i64 1
  %14 = bitcast i32* %13 to i8*
  %15 = call %struct._RV_pmd* @_RV_pmd_set(%struct._RV_pmd* %8, %struct._RV_stat_node* %9, i32 0, i8* %11, i8* %14)
  br label %16

; <label>:16                                      ; preds = %7, %5
  %17 = load i32** %ret, align 8
  ret i32* %17
}

declare i32* @__errno_location(...) #1

; Function Attrs: nounwind uwtable
define i64 @_RV_times(%struct._RV_pmd* %buf_pmd, %struct.tms* %buf, i8* %file_name, i8* %func_name, i32 %b_line, i32 %b_col, i8* %b_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct.tms*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store %struct._RV_pmd* %buf_pmd, %struct._RV_pmd** %1, align 8
  store %struct.tms* %buf, %struct.tms** %2, align 8
  store i8* %file_name, i8** %3, align 8
  store i8* %func_name, i8** %4, align 8
  store i32 %b_line, i32* %5, align 4
  store i32 %b_col, i32* %6, align 4
  store i8* %b_name, i8** %7, align 8
  %8 = load %struct.tms** %2, align 8
  %9 = icmp ne %struct.tms* %8, null
  br i1 %9, label %10, label %19

; <label>:10                                      ; preds = %0
  %11 = load %struct._RV_pmd** %1, align 8
  %12 = load %struct.tms** %2, align 8
  %13 = bitcast %struct.tms* %12 to i8*
  %14 = load i8** %3, align 8
  %15 = load i8** %4, align 8
  %16 = load i32* %5, align 4
  %17 = load i32* %6, align 4
  %18 = load i8** %7, align 8
  %zybc_ = bitcast %struct._RV_pmd* %11 to i8*
  %zybc_1 = bitcast i8* %13 to i8*
  %zyarg_ = inttoptr i64 32 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %14 to i8*
  %zybc_4 = bitcast i8* %15 to i8*
  %zyarg_5 = inttoptr i32 %16 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %17 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %18 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 1051758050, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_101_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  br label %19

; <label>:19                                      ; preds = %10, %0
  call void @_Z4joinj(i32 1051758050)
  %20 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %20)
  %21 = load %struct.tms** %2, align 8
  %22 = call i64 @times(%struct.tms* %21) #7
  ret i64 %22
}

; Function Attrs: nounwind
declare i64 @times(%struct.tms*) #3

; Function Attrs: nounwind uwtable
define i64 @_RV_read(%struct._RV_pmd* %buf_pmd, i32 %fd, i8* %buf, i64 %nbytes, i8* %file_name, i8* %func_name, i32 %b_line, i32 %b_col, i8* %b_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  store %struct._RV_pmd* %buf_pmd, %struct._RV_pmd** %1, align 8
  store i32 %fd, i32* %2, align 4
  store i8* %buf, i8** %3, align 8
  store i64 %nbytes, i64* %4, align 8
  store i8* %file_name, i8** %5, align 8
  store i8* %func_name, i8** %6, align 8
  store i32 %b_line, i32* %7, align 4
  store i32 %b_col, i32* %8, align 4
  store i8* %b_name, i8** %9, align 8
  %10 = load %struct._RV_pmd** %1, align 8
  %11 = load i8** %3, align 8
  %12 = load i64* %4, align 8
  %13 = load i8** %5, align 8
  %14 = load i8** %6, align 8
  %15 = load i32* %7, align 4
  %16 = load i32* %8, align 4
  %17 = load i8** %9, align 8
  %zybc_ = bitcast %struct._RV_pmd* %10 to i8*
  %zybc_1 = bitcast i8* %11 to i8*
  %zyarg_ = inttoptr i64 %12 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %13 to i8*
  %zybc_4 = bitcast i8* %14 to i8*
  %zyarg_5 = inttoptr i32 %15 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %16 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %17 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -785327428, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_102_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %18 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %18)
  %19 = load i32* %2, align 4
  %20 = load i8** %3, align 8
  %21 = load i64* %4, align 8
  %22 = call i64 @read(i32 %19, i8* %20, i64 %21)
  call void @_Z4joinj(i32 -785327428)
  ret i64 %22
}

declare i64 @read(i32, i8*, i64) #1

; Function Attrs: nounwind uwtable
define i64 @_RV_write(%struct._RV_pmd* %buf_pmd, i32 %fd, i8* %buf, i64 %nbytes, i8* %file_name, i8* %func_name, i32 %b_line, i32 %b_col, i8* %b_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  store %struct._RV_pmd* %buf_pmd, %struct._RV_pmd** %1, align 8
  store i32 %fd, i32* %2, align 4
  store i8* %buf, i8** %3, align 8
  store i64 %nbytes, i64* %4, align 8
  store i8* %file_name, i8** %5, align 8
  store i8* %func_name, i8** %6, align 8
  store i32 %b_line, i32* %7, align 4
  store i32 %b_col, i32* %8, align 4
  store i8* %b_name, i8** %9, align 8
  %10 = load %struct._RV_pmd** %1, align 8
  %11 = load i8** %3, align 8
  %12 = load i64* %4, align 8
  %13 = load i8** %5, align 8
  %14 = load i8** %6, align 8
  %15 = load i32* %7, align 4
  %16 = load i32* %8, align 4
  %17 = load i8** %9, align 8
  %zybc_ = bitcast %struct._RV_pmd* %10 to i8*
  %zybc_1 = bitcast i8* %11 to i8*
  %zyarg_ = inttoptr i64 %12 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %13 to i8*
  %zybc_4 = bitcast i8* %14 to i8*
  %zyarg_5 = inttoptr i32 %15 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %16 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %17 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -1519173094, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_103_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %18 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %18)
  %19 = load i32* %2, align 4
  %20 = load i8** %3, align 8
  %21 = load i64* %4, align 8
  %22 = call i64 @write(i32 %19, i8* %20, i64 %21)
  call void @_Z4joinj(i32 -1519173094)
  ret i64 %22
}

declare i64 @write(i32, i8*, i64) #1

; Function Attrs: nounwind uwtable
define i32 @_RV_unlink(%struct._RV_pmd* %path_pmd, i8* %path, i8* %file_name, i8* %func_name, i32 %p_line, i32 %p_col, i8* %p_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store %struct._RV_pmd* %path_pmd, %struct._RV_pmd** %1, align 8
  store i8* %path, i8** %2, align 8
  store i8* %file_name, i8** %3, align 8
  store i8* %func_name, i8** %4, align 8
  store i32 %p_line, i32* %5, align 4
  store i32 %p_col, i32* %6, align 4
  store i8* %p_name, i8** %7, align 8
  %8 = load %struct._RV_pmd** %1, align 8
  %9 = load i8** %2, align 8
  %10 = load i8** %2, align 8
  %11 = call i32 @_RV_sstrlen(i8* %10)
  %12 = add nsw i32 %11, 1
  %13 = sext i32 %12 to i64
  %14 = load i8** %3, align 8
  %15 = load i8** %4, align 8
  %16 = load i32* %5, align 4
  %17 = load i32* %6, align 4
  %18 = load i8** %7, align 8
  %zybc_ = bitcast %struct._RV_pmd* %8 to i8*
  %zybc_1 = bitcast i8* %9 to i8*
  %zyarg_ = inttoptr i64 %13 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %14 to i8*
  %zybc_4 = bitcast i8* %15 to i8*
  %zyarg_5 = inttoptr i32 %16 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %17 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %18 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -1784589931, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_104_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %19 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %19)
  %20 = load i8** %2, align 8
  %21 = call i32 @unlink(i8* %20) #7
  call void @_Z4joinj(i32 -1784589931)
  ret i32 %21
}

; Function Attrs: nounwind uwtable
define i8* @_RV_getcwd(%struct._RV_pmd* %ret_pmd, %struct._RV_pmd* %buf_pmd, i8* %buf, i64 %size, i8* %file_name, i8* %func_name, i32 %b_line, i32 %b_col, i8* %b_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %ret = alloca i8*, align 8
  store %struct._RV_pmd* %ret_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %buf_pmd, %struct._RV_pmd** %2, align 8
  store i8* %buf, i8** %3, align 8
  store i64 %size, i64* %4, align 8
  store i8* %file_name, i8** %5, align 8
  store i8* %func_name, i8** %6, align 8
  store i32 %b_line, i32* %7, align 4
  store i32 %b_col, i32* %8, align 4
  store i8* %b_name, i8** %9, align 8
  %10 = load %struct._RV_pmd** %2, align 8
  %11 = load i8** %3, align 8
  %12 = load i64* %4, align 8
  %13 = load i8** %5, align 8
  %14 = load i8** %6, align 8
  %15 = load i32* %7, align 4
  %16 = load i32* %8, align 4
  %17 = load i8** %9, align 8
  %zybc_ = bitcast %struct._RV_pmd* %10 to i8*
  %zybc_1 = bitcast i8* %11 to i8*
  %zyarg_ = inttoptr i64 %12 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %13 to i8*
  %zybc_4 = bitcast i8* %14 to i8*
  %zyarg_5 = inttoptr i32 %15 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %16 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %17 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -620598423, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_105_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %18 = load i8** %3, align 8
  %19 = load i64* %4, align 8
  %20 = call i8* @getcwd(i8* %18, i64 %19) #7
  store i8* %20, i8** %ret, align 8
  %21 = load i8** %ret, align 8
  %22 = icmp eq i8* %21, null
  br i1 %22, label %23, label %25

; <label>:23                                      ; preds = %0
  %24 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_set_null(%struct._RV_pmd* %24)
  br label %29

; <label>:25                                      ; preds = %0
  %26 = load %struct._RV_pmd** %1, align 8
  %27 = load %struct._RV_pmd** %2, align 8
  %28 = call %struct._RV_pmd* @_RV_pmd_cp_pmd(%struct._RV_pmd* %26, %struct._RV_pmd* %27)
  br label %29

; <label>:29                                      ; preds = %25, %23
  call void @_Z4joinj(i32 -620598423)
  %30 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %30)
  %31 = load i8** %ret, align 8
  ret i8* %31
}

; Function Attrs: nounwind
declare i8* @getcwd(i8*, i64) #3

; Function Attrs: nounwind uwtable
define i32 @_RV_getopt(%struct._RV_pmd* %argv_pmd, %struct._RV_pmd* %options_pmd, i32 %argc, i8** %argv, i8* %options, i8* %file_name, i8* %func_name, i32 %a_line, i32 %a_col, i8* %a_name, i32 %o_line, i32 %o_col, i8* %o_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %ret = alloca i32, align 4
  %i = alloca i32, align 4
  %pmd = alloca %struct._RV_pmd*, align 8
  store %struct._RV_pmd* %argv_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %options_pmd, %struct._RV_pmd** %2, align 8
  store i32 %argc, i32* %3, align 4
  store i8** %argv, i8*** %4, align 8
  store i8* %options, i8** %5, align 8
  store i8* %file_name, i8** %6, align 8
  store i8* %func_name, i8** %7, align 8
  store i32 %a_line, i32* %8, align 4
  store i32 %a_col, i32* %9, align 4
  store i8* %a_name, i8** %10, align 8
  store i32 %o_line, i32* %11, align 4
  store i32 %o_col, i32* %12, align 4
  store i8* %o_name, i8** %13, align 8
  %14 = load %struct._RV_pmd** %2, align 8
  %15 = load i8** %5, align 8
  %16 = load i8** %5, align 8
  %17 = call i32 @_RV_sstrlen(i8* %16)
  %18 = add nsw i32 %17, 1
  %19 = sext i32 %18 to i64
  %20 = load i8** %6, align 8
  %21 = load i8** %7, align 8
  %22 = load i32* %11, align 4
  %23 = load i32* %12, align 4
  %24 = load i8** %13, align 8
  %zybc_ = bitcast %struct._RV_pmd* %14 to i8*
  %zybc_1 = bitcast i8* %15 to i8*
  %zyarg_ = inttoptr i64 %19 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %20 to i8*
  %zybc_4 = bitcast i8* %21 to i8*
  %zyarg_5 = inttoptr i32 %22 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %23 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %24 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 378985994, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_106_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %25 = load i32* %3, align 4
  %26 = load i8*** %4, align 8
  %27 = load i8** %5, align 8
  %28 = call i32 @getopt(i32 %25, i8** %26, i8* %27) #7
  store i32 %28, i32* %ret, align 4
  %29 = load i8** @optarg, align 8
  %30 = icmp eq i8* %29, null
  br i1 %30, label %31, label %32

; <label>:31                                      ; preds = %0
  call void @_RV_pmd_tbl_remove(i8** @optarg)
  br label %63

; <label>:32                                      ; preds = %0
  store i32 0, i32* %i, align 4
  br label %33

; <label>:33                                      ; preds = %59, %32
  %34 = load i32* %i, align 4
  %35 = load i32* %3, align 4
  %36 = icmp slt i32 %34, %35
  br i1 %36, label %37, label %62

; <label>:37                                      ; preds = %33
  %38 = load i32* %i, align 4
  %39 = sext i32 %38 to i64
  %40 = load i8*** %4, align 8
  %41 = getelementptr inbounds i8** %40, i64 %39
  %42 = call %struct._RV_pmd* @_RV_pmd_tbl_lookup(i8** %41)
  store %struct._RV_pmd* %42, %struct._RV_pmd** %pmd, align 8
  %43 = load %struct._RV_pmd** %pmd, align 8
  %44 = call i8* @_RV_pmd_get_base(%struct._RV_pmd* %43)
  %45 = load i8** @optarg, align 8
  %46 = icmp ule i8* %44, %45
  br i1 %46, label %47, label %58

; <label>:47                                      ; preds = %37
  %48 = load i8** @optarg, align 8
  %49 = load %struct._RV_pmd** %pmd, align 8
  %50 = call i8* @_RV_pmd_get_bound(%struct._RV_pmd* %49)
  %51 = icmp ult i8* %48, %50
  br i1 %51, label %52, label %58

; <label>:52                                      ; preds = %47
  %53 = load i32* %i, align 4
  %54 = sext i32 %53 to i64
  %55 = load i8*** %4, align 8
  %56 = getelementptr inbounds i8** %55, i64 %54
  %57 = call %struct._RV_pmd* @_RV_pmd_tbl_update_ptr(i8** @optarg, i8** %56)
  br label %58

; <label>:58                                      ; preds = %52, %47, %37
  br label %59

; <label>:59                                      ; preds = %58
  %60 = load i32* %i, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, i32* %i, align 4
  br label %33

; <label>:62                                      ; preds = %33
  br label %63

; <label>:63                                      ; preds = %62, %31
  call void @_Z4joinj(i32 378985994)
  %64 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %64)
  %65 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %65)
  %66 = load i32* %ret, align 4
  ret i32 %66
}

; Function Attrs: nounwind
declare i32 @getopt(i32, i8**, i8*) #3

; Function Attrs: nounwind uwtable
define i32 @_RV_utime(%struct._RV_pmd* %path_pmd, %struct._RV_pmd* %times_pmd, i8* %path, %struct.utimbuf* %times, i8* %file_name, i8* %func_name, i32 %p_line, i32 %p_col, i8* %p_name, i32 %t_line, i32 %t_col, i8* %t_name) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca %struct.utimbuf*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  store %struct._RV_pmd* %path_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %times_pmd, %struct._RV_pmd** %2, align 8
  store i8* %path, i8** %3, align 8
  store %struct.utimbuf* %times, %struct.utimbuf** %4, align 8
  store i8* %file_name, i8** %5, align 8
  store i8* %func_name, i8** %6, align 8
  store i32 %p_line, i32* %7, align 4
  store i32 %p_col, i32* %8, align 4
  store i8* %p_name, i8** %9, align 8
  store i32 %t_line, i32* %10, align 4
  store i32 %t_col, i32* %11, align 4
  store i8* %t_name, i8** %12, align 8
  %13 = load %struct._RV_pmd** %1, align 8
  %14 = load i8** %3, align 8
  %15 = load i8** %3, align 8
  %16 = call i32 @_RV_sstrlen(i8* %15)
  %17 = add nsw i32 %16, 1
  %18 = sext i32 %17 to i64
  %19 = load i8** %5, align 8
  %20 = load i8** %6, align 8
  %21 = load i32* %7, align 4
  %22 = load i32* %8, align 4
  %23 = load i8** %9, align 8
  %zybc_ = bitcast %struct._RV_pmd* %13 to i8*
  %zybc_1 = bitcast i8* %14 to i8*
  %zyarg_ = inttoptr i64 %18 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* %19 to i8*
  %zybc_4 = bitcast i8* %20 to i8*
  %zyarg_5 = inttoptr i32 %21 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 %22 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* %23 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 1678886676, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_107_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9)
  %24 = load %struct.utimbuf** %4, align 8
  %25 = icmp ne %struct.utimbuf* %24, null
  br i1 %25, label %26, label %35

; <label>:26                                      ; preds = %0
  %27 = load %struct._RV_pmd** %2, align 8
  %28 = load %struct.utimbuf** %4, align 8
  %29 = bitcast %struct.utimbuf* %28 to i8*
  %30 = load i8** %5, align 8
  %31 = load i8** %6, align 8
  %32 = load i32* %10, align 4
  %33 = load i32* %11, align 4
  %34 = load i8** %12, align 8
  %zybc_10 = bitcast %struct._RV_pmd* %27 to i8*
  %zybc_11 = bitcast i8* %29 to i8*
  %zyarg_12 = inttoptr i64 16 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* %30 to i8*
  %zybc_15 = bitcast i8* %31 to i8*
  %zyarg_16 = inttoptr i32 %32 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 %33 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* %34 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -25896933, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_108_0, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  br label %35

; <label>:35                                      ; preds = %26, %0
  call void @_Z4joinj(i32 1678886676)
  call void @_Z4joinj(i32 -25896933)
  %36 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %36)
  %37 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %37)
  %38 = load i8** %3, align 8
  %39 = load %struct.utimbuf** %4, align 8
  %40 = call i32 @utime(i8* %38, %struct.utimbuf* %39) #7
  ret i32 %40
}

; Function Attrs: nounwind
declare i32 @utime(i8*, %struct.utimbuf*) #3

; Function Attrs: nounwind uwtable
define void @_RV_call_wrapper_by_ptr(void (...)* %fp, ...) #0 {
  %1 = alloca void (...)*, align 8
  %vl = alloca [1 x %struct.__va_list_tag], align 16
  %ret_addr = alloca i8**, align 8
  %ret_pmd = alloca %struct._RV_pmd*, align 8
  %size = alloca i64, align 8
  %ret_addr1 = alloca i8**, align 8
  %ret_pmd2 = alloca %struct._RV_pmd*, align 8
  %ptr_pmd = alloca %struct._RV_pmd*, align 8
  %ptr = alloca i8*, align 8
  %newsize = alloca i32, align 4
  %file_name = alloca i8*, align 8
  %func_name = alloca i8*, align 8
  %p_line = alloca i32, align 4
  %p_col = alloca i32, align 4
  %p_name = alloca i8*, align 8
  %ptr_pmd3 = alloca %struct._RV_pmd*, align 8
  %ptr4 = alloca i8*, align 8
  %file_name5 = alloca i8*, align 8
  %func_name6 = alloca i8*, align 8
  %p_line7 = alloca i32, align 4
  %p_col8 = alloca i32, align 4
  %p_name9 = alloca i8*, align 8
  %ret_addr10 = alloca i8**, align 8
  %ret_pmd11 = alloca %struct._RV_pmd*, align 8
  %dest_pmd = alloca %struct._RV_pmd*, align 8
  %src_pmd = alloca %struct._RV_pmd*, align 8
  %dest = alloca i8*, align 8
  %src = alloca i8*, align 8
  %n = alloca i64, align 8
  %file_name12 = alloca i8*, align 8
  %func_name13 = alloca i8*, align 8
  %d_line = alloca i32, align 4
  %d_col = alloca i32, align 4
  %d_name = alloca i8*, align 8
  %s_line = alloca i32, align 4
  %s_col = alloca i32, align 4
  %s_name = alloca i8*, align 8
  store void (...)* %fp, void (...)** %1, align 8
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  %4 = load void (...)** %1, align 8
  %5 = icmp eq void (...)* %4, bitcast (i8* (i64)* @malloc to void (...)*)
  br i1 %5, label %6, label %67

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %8 = getelementptr inbounds %struct.__va_list_tag* %7, i32 0, i32 0
  %9 = load i32* %8
  %10 = icmp ule i32 %9, 40
  br i1 %10, label %11, label %17

; <label>:11                                      ; preds = %6
  %12 = getelementptr inbounds %struct.__va_list_tag* %7, i32 0, i32 3
  %13 = load i8** %12
  %14 = getelementptr i8* %13, i32 %9
  %15 = bitcast i8* %14 to i8***
  %16 = add i32 %9, 8
  store i32 %16, i32* %8
  br label %22

; <label>:17                                      ; preds = %6
  %18 = getelementptr inbounds %struct.__va_list_tag* %7, i32 0, i32 2
  %19 = load i8** %18
  %20 = bitcast i8* %19 to i8***
  %21 = getelementptr i8* %19, i32 8
  store i8* %21, i8** %18
  br label %22

; <label>:22                                      ; preds = %17, %11
  %23 = phi i8*** [ %15, %11 ], [ %20, %17 ]
  %24 = load i8*** %23
  store i8** %24, i8*** %ret_addr, align 8
  %25 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %26 = getelementptr inbounds %struct.__va_list_tag* %25, i32 0, i32 0
  %27 = load i32* %26
  %28 = icmp ule i32 %27, 40
  br i1 %28, label %29, label %35

; <label>:29                                      ; preds = %22
  %30 = getelementptr inbounds %struct.__va_list_tag* %25, i32 0, i32 3
  %31 = load i8** %30
  %32 = getelementptr i8* %31, i32 %27
  %33 = bitcast i8* %32 to %struct._RV_pmd**
  %34 = add i32 %27, 8
  store i32 %34, i32* %26
  br label %40

; <label>:35                                      ; preds = %22
  %36 = getelementptr inbounds %struct.__va_list_tag* %25, i32 0, i32 2
  %37 = load i8** %36
  %38 = bitcast i8* %37 to %struct._RV_pmd**
  %39 = getelementptr i8* %37, i32 8
  store i8* %39, i8** %36
  br label %40

; <label>:40                                      ; preds = %35, %29
  %41 = phi %struct._RV_pmd** [ %33, %29 ], [ %38, %35 ]
  %42 = load %struct._RV_pmd** %41
  store %struct._RV_pmd* %42, %struct._RV_pmd** %ret_pmd, align 8
  %43 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %44 = getelementptr inbounds %struct.__va_list_tag* %43, i32 0, i32 0
  %45 = load i32* %44
  %46 = icmp ule i32 %45, 40
  br i1 %46, label %47, label %53

; <label>:47                                      ; preds = %40
  %48 = getelementptr inbounds %struct.__va_list_tag* %43, i32 0, i32 3
  %49 = load i8** %48
  %50 = getelementptr i8* %49, i32 %45
  %51 = bitcast i8* %50 to i64*
  %52 = add i32 %45, 8
  store i32 %52, i32* %44
  br label %58

; <label>:53                                      ; preds = %40
  %54 = getelementptr inbounds %struct.__va_list_tag* %43, i32 0, i32 2
  %55 = load i8** %54
  %56 = bitcast i8* %55 to i64*
  %57 = getelementptr i8* %55, i32 8
  store i8* %57, i8** %54
  br label %58

; <label>:58                                      ; preds = %53, %47
  %59 = phi i64* [ %51, %47 ], [ %56, %53 ]
  %60 = load i64* %59
  store i64 %60, i64* %size, align 8
  %61 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %62 = bitcast %struct.__va_list_tag* %61 to i8*
  call void @llvm.va_end(i8* %62)
  %63 = load %struct._RV_pmd** %ret_pmd, align 8
  %64 = load i64* %size, align 8
  %65 = call i8* @_RV_malloc(%struct._RV_pmd* %63, i64 %64)
  %66 = load i8*** %ret_addr, align 8
  store i8* %65, i8** %66, align 8
  br label %699

; <label>:67                                      ; preds = %0
  %68 = load void (...)** %1, align 8
  %69 = icmp eq void (...)* %68, bitcast (i8* (i8*, i64)* @realloc to void (...)*)
  br i1 %69, label %70, label %264

; <label>:70                                      ; preds = %67
  %71 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %72 = getelementptr inbounds %struct.__va_list_tag* %71, i32 0, i32 0
  %73 = load i32* %72
  %74 = icmp ule i32 %73, 40
  br i1 %74, label %75, label %81

; <label>:75                                      ; preds = %70
  %76 = getelementptr inbounds %struct.__va_list_tag* %71, i32 0, i32 3
  %77 = load i8** %76
  %78 = getelementptr i8* %77, i32 %73
  %79 = bitcast i8* %78 to i8***
  %80 = add i32 %73, 8
  store i32 %80, i32* %72
  br label %86

; <label>:81                                      ; preds = %70
  %82 = getelementptr inbounds %struct.__va_list_tag* %71, i32 0, i32 2
  %83 = load i8** %82
  %84 = bitcast i8* %83 to i8***
  %85 = getelementptr i8* %83, i32 8
  store i8* %85, i8** %82
  br label %86

; <label>:86                                      ; preds = %81, %75
  %87 = phi i8*** [ %79, %75 ], [ %84, %81 ]
  %88 = load i8*** %87
  store i8** %88, i8*** %ret_addr1, align 8
  %89 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %90 = getelementptr inbounds %struct.__va_list_tag* %89, i32 0, i32 0
  %91 = load i32* %90
  %92 = icmp ule i32 %91, 40
  br i1 %92, label %93, label %99

; <label>:93                                      ; preds = %86
  %94 = getelementptr inbounds %struct.__va_list_tag* %89, i32 0, i32 3
  %95 = load i8** %94
  %96 = getelementptr i8* %95, i32 %91
  %97 = bitcast i8* %96 to %struct._RV_pmd**
  %98 = add i32 %91, 8
  store i32 %98, i32* %90
  br label %104

; <label>:99                                      ; preds = %86
  %100 = getelementptr inbounds %struct.__va_list_tag* %89, i32 0, i32 2
  %101 = load i8** %100
  %102 = bitcast i8* %101 to %struct._RV_pmd**
  %103 = getelementptr i8* %101, i32 8
  store i8* %103, i8** %100
  br label %104

; <label>:104                                     ; preds = %99, %93
  %105 = phi %struct._RV_pmd** [ %97, %93 ], [ %102, %99 ]
  %106 = load %struct._RV_pmd** %105
  store %struct._RV_pmd* %106, %struct._RV_pmd** %ret_pmd2, align 8
  %107 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %108 = getelementptr inbounds %struct.__va_list_tag* %107, i32 0, i32 0
  %109 = load i32* %108
  %110 = icmp ule i32 %109, 40
  br i1 %110, label %111, label %117

; <label>:111                                     ; preds = %104
  %112 = getelementptr inbounds %struct.__va_list_tag* %107, i32 0, i32 3
  %113 = load i8** %112
  %114 = getelementptr i8* %113, i32 %109
  %115 = bitcast i8* %114 to %struct._RV_pmd**
  %116 = add i32 %109, 8
  store i32 %116, i32* %108
  br label %122

; <label>:117                                     ; preds = %104
  %118 = getelementptr inbounds %struct.__va_list_tag* %107, i32 0, i32 2
  %119 = load i8** %118
  %120 = bitcast i8* %119 to %struct._RV_pmd**
  %121 = getelementptr i8* %119, i32 8
  store i8* %121, i8** %118
  br label %122

; <label>:122                                     ; preds = %117, %111
  %123 = phi %struct._RV_pmd** [ %115, %111 ], [ %120, %117 ]
  %124 = load %struct._RV_pmd** %123
  store %struct._RV_pmd* %124, %struct._RV_pmd** %ptr_pmd, align 8
  %125 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %126 = getelementptr inbounds %struct.__va_list_tag* %125, i32 0, i32 0
  %127 = load i32* %126
  %128 = icmp ule i32 %127, 40
  br i1 %128, label %129, label %135

; <label>:129                                     ; preds = %122
  %130 = getelementptr inbounds %struct.__va_list_tag* %125, i32 0, i32 3
  %131 = load i8** %130
  %132 = getelementptr i8* %131, i32 %127
  %133 = bitcast i8* %132 to i8**
  %134 = add i32 %127, 8
  store i32 %134, i32* %126
  br label %140

; <label>:135                                     ; preds = %122
  %136 = getelementptr inbounds %struct.__va_list_tag* %125, i32 0, i32 2
  %137 = load i8** %136
  %138 = bitcast i8* %137 to i8**
  %139 = getelementptr i8* %137, i32 8
  store i8* %139, i8** %136
  br label %140

; <label>:140                                     ; preds = %135, %129
  %141 = phi i8** [ %133, %129 ], [ %138, %135 ]
  %142 = load i8** %141
  store i8* %142, i8** %ptr, align 8
  %143 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %144 = getelementptr inbounds %struct.__va_list_tag* %143, i32 0, i32 0
  %145 = load i32* %144
  %146 = icmp ule i32 %145, 40
  br i1 %146, label %147, label %153

; <label>:147                                     ; preds = %140
  %148 = getelementptr inbounds %struct.__va_list_tag* %143, i32 0, i32 3
  %149 = load i8** %148
  %150 = getelementptr i8* %149, i32 %145
  %151 = bitcast i8* %150 to i32*
  %152 = add i32 %145, 8
  store i32 %152, i32* %144
  br label %158

; <label>:153                                     ; preds = %140
  %154 = getelementptr inbounds %struct.__va_list_tag* %143, i32 0, i32 2
  %155 = load i8** %154
  %156 = bitcast i8* %155 to i32*
  %157 = getelementptr i8* %155, i32 8
  store i8* %157, i8** %154
  br label %158

; <label>:158                                     ; preds = %153, %147
  %159 = phi i32* [ %151, %147 ], [ %156, %153 ]
  %160 = load i32* %159
  store i32 %160, i32* %newsize, align 4
  %161 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %162 = getelementptr inbounds %struct.__va_list_tag* %161, i32 0, i32 0
  %163 = load i32* %162
  %164 = icmp ule i32 %163, 40
  br i1 %164, label %165, label %171

; <label>:165                                     ; preds = %158
  %166 = getelementptr inbounds %struct.__va_list_tag* %161, i32 0, i32 3
  %167 = load i8** %166
  %168 = getelementptr i8* %167, i32 %163
  %169 = bitcast i8* %168 to i8**
  %170 = add i32 %163, 8
  store i32 %170, i32* %162
  br label %176

; <label>:171                                     ; preds = %158
  %172 = getelementptr inbounds %struct.__va_list_tag* %161, i32 0, i32 2
  %173 = load i8** %172
  %174 = bitcast i8* %173 to i8**
  %175 = getelementptr i8* %173, i32 8
  store i8* %175, i8** %172
  br label %176

; <label>:176                                     ; preds = %171, %165
  %177 = phi i8** [ %169, %165 ], [ %174, %171 ]
  %178 = load i8** %177
  store i8* %178, i8** %file_name, align 8
  %179 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %180 = getelementptr inbounds %struct.__va_list_tag* %179, i32 0, i32 0
  %181 = load i32* %180
  %182 = icmp ule i32 %181, 40
  br i1 %182, label %183, label %189

; <label>:183                                     ; preds = %176
  %184 = getelementptr inbounds %struct.__va_list_tag* %179, i32 0, i32 3
  %185 = load i8** %184
  %186 = getelementptr i8* %185, i32 %181
  %187 = bitcast i8* %186 to i8**
  %188 = add i32 %181, 8
  store i32 %188, i32* %180
  br label %194

; <label>:189                                     ; preds = %176
  %190 = getelementptr inbounds %struct.__va_list_tag* %179, i32 0, i32 2
  %191 = load i8** %190
  %192 = bitcast i8* %191 to i8**
  %193 = getelementptr i8* %191, i32 8
  store i8* %193, i8** %190
  br label %194

; <label>:194                                     ; preds = %189, %183
  %195 = phi i8** [ %187, %183 ], [ %192, %189 ]
  %196 = load i8** %195
  store i8* %196, i8** %func_name, align 8
  %197 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %198 = getelementptr inbounds %struct.__va_list_tag* %197, i32 0, i32 0
  %199 = load i32* %198
  %200 = icmp ule i32 %199, 40
  br i1 %200, label %201, label %207

; <label>:201                                     ; preds = %194
  %202 = getelementptr inbounds %struct.__va_list_tag* %197, i32 0, i32 3
  %203 = load i8** %202
  %204 = getelementptr i8* %203, i32 %199
  %205 = bitcast i8* %204 to i32*
  %206 = add i32 %199, 8
  store i32 %206, i32* %198
  br label %212

; <label>:207                                     ; preds = %194
  %208 = getelementptr inbounds %struct.__va_list_tag* %197, i32 0, i32 2
  %209 = load i8** %208
  %210 = bitcast i8* %209 to i32*
  %211 = getelementptr i8* %209, i32 8
  store i8* %211, i8** %208
  br label %212

; <label>:212                                     ; preds = %207, %201
  %213 = phi i32* [ %205, %201 ], [ %210, %207 ]
  %214 = load i32* %213
  store i32 %214, i32* %p_line, align 4
  %215 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %216 = getelementptr inbounds %struct.__va_list_tag* %215, i32 0, i32 0
  %217 = load i32* %216
  %218 = icmp ule i32 %217, 40
  br i1 %218, label %219, label %225

; <label>:219                                     ; preds = %212
  %220 = getelementptr inbounds %struct.__va_list_tag* %215, i32 0, i32 3
  %221 = load i8** %220
  %222 = getelementptr i8* %221, i32 %217
  %223 = bitcast i8* %222 to i32*
  %224 = add i32 %217, 8
  store i32 %224, i32* %216
  br label %230

; <label>:225                                     ; preds = %212
  %226 = getelementptr inbounds %struct.__va_list_tag* %215, i32 0, i32 2
  %227 = load i8** %226
  %228 = bitcast i8* %227 to i32*
  %229 = getelementptr i8* %227, i32 8
  store i8* %229, i8** %226
  br label %230

; <label>:230                                     ; preds = %225, %219
  %231 = phi i32* [ %223, %219 ], [ %228, %225 ]
  %232 = load i32* %231
  store i32 %232, i32* %p_col, align 4
  %233 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %234 = getelementptr inbounds %struct.__va_list_tag* %233, i32 0, i32 0
  %235 = load i32* %234
  %236 = icmp ule i32 %235, 40
  br i1 %236, label %237, label %243

; <label>:237                                     ; preds = %230
  %238 = getelementptr inbounds %struct.__va_list_tag* %233, i32 0, i32 3
  %239 = load i8** %238
  %240 = getelementptr i8* %239, i32 %235
  %241 = bitcast i8* %240 to i8**
  %242 = add i32 %235, 8
  store i32 %242, i32* %234
  br label %248

; <label>:243                                     ; preds = %230
  %244 = getelementptr inbounds %struct.__va_list_tag* %233, i32 0, i32 2
  %245 = load i8** %244
  %246 = bitcast i8* %245 to i8**
  %247 = getelementptr i8* %245, i32 8
  store i8* %247, i8** %244
  br label %248

; <label>:248                                     ; preds = %243, %237
  %249 = phi i8** [ %241, %237 ], [ %246, %243 ]
  %250 = load i8** %249
  store i8* %250, i8** %p_name, align 8
  %251 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %252 = bitcast %struct.__va_list_tag* %251 to i8*
  call void @llvm.va_end(i8* %252)
  %253 = load %struct._RV_pmd** %ret_pmd2, align 8
  %254 = load %struct._RV_pmd** %ptr_pmd, align 8
  %255 = load i8** %ptr, align 8
  %256 = load i32* %newsize, align 4
  %257 = load i8** %file_name, align 8
  %258 = load i8** %func_name, align 8
  %259 = load i32* %p_line, align 4
  %260 = load i32* %p_col, align 4
  %261 = load i8** %p_name, align 8
  %262 = call i8* @_RV_realloc(%struct._RV_pmd* %253, %struct._RV_pmd* %254, i8* %255, i32 %256, i8* %257, i8* %258, i32 %259, i32 %260, i8* %261)
  %263 = load i8*** %ret_addr1, align 8
  store i8* %262, i8** %263, align 8
  br label %699

; <label>:264                                     ; preds = %67
  %265 = load void (...)** %1, align 8
  %266 = icmp eq void (...)* %265, bitcast (void (i8*)* @free to void (...)*)
  br i1 %266, label %267, label %403

; <label>:267                                     ; preds = %264
  %268 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %269 = getelementptr inbounds %struct.__va_list_tag* %268, i32 0, i32 0
  %270 = load i32* %269
  %271 = icmp ule i32 %270, 40
  br i1 %271, label %272, label %278

; <label>:272                                     ; preds = %267
  %273 = getelementptr inbounds %struct.__va_list_tag* %268, i32 0, i32 3
  %274 = load i8** %273
  %275 = getelementptr i8* %274, i32 %270
  %276 = bitcast i8* %275 to %struct._RV_pmd**
  %277 = add i32 %270, 8
  store i32 %277, i32* %269
  br label %283

; <label>:278                                     ; preds = %267
  %279 = getelementptr inbounds %struct.__va_list_tag* %268, i32 0, i32 2
  %280 = load i8** %279
  %281 = bitcast i8* %280 to %struct._RV_pmd**
  %282 = getelementptr i8* %280, i32 8
  store i8* %282, i8** %279
  br label %283

; <label>:283                                     ; preds = %278, %272
  %284 = phi %struct._RV_pmd** [ %276, %272 ], [ %281, %278 ]
  %285 = load %struct._RV_pmd** %284
  store %struct._RV_pmd* %285, %struct._RV_pmd** %ptr_pmd3, align 8
  %286 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %287 = getelementptr inbounds %struct.__va_list_tag* %286, i32 0, i32 0
  %288 = load i32* %287
  %289 = icmp ule i32 %288, 40
  br i1 %289, label %290, label %296

; <label>:290                                     ; preds = %283
  %291 = getelementptr inbounds %struct.__va_list_tag* %286, i32 0, i32 3
  %292 = load i8** %291
  %293 = getelementptr i8* %292, i32 %288
  %294 = bitcast i8* %293 to i8**
  %295 = add i32 %288, 8
  store i32 %295, i32* %287
  br label %301

; <label>:296                                     ; preds = %283
  %297 = getelementptr inbounds %struct.__va_list_tag* %286, i32 0, i32 2
  %298 = load i8** %297
  %299 = bitcast i8* %298 to i8**
  %300 = getelementptr i8* %298, i32 8
  store i8* %300, i8** %297
  br label %301

; <label>:301                                     ; preds = %296, %290
  %302 = phi i8** [ %294, %290 ], [ %299, %296 ]
  %303 = load i8** %302
  store i8* %303, i8** %ptr4, align 8
  %304 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %305 = getelementptr inbounds %struct.__va_list_tag* %304, i32 0, i32 0
  %306 = load i32* %305
  %307 = icmp ule i32 %306, 40
  br i1 %307, label %308, label %314

; <label>:308                                     ; preds = %301
  %309 = getelementptr inbounds %struct.__va_list_tag* %304, i32 0, i32 3
  %310 = load i8** %309
  %311 = getelementptr i8* %310, i32 %306
  %312 = bitcast i8* %311 to i8**
  %313 = add i32 %306, 8
  store i32 %313, i32* %305
  br label %319

; <label>:314                                     ; preds = %301
  %315 = getelementptr inbounds %struct.__va_list_tag* %304, i32 0, i32 2
  %316 = load i8** %315
  %317 = bitcast i8* %316 to i8**
  %318 = getelementptr i8* %316, i32 8
  store i8* %318, i8** %315
  br label %319

; <label>:319                                     ; preds = %314, %308
  %320 = phi i8** [ %312, %308 ], [ %317, %314 ]
  %321 = load i8** %320
  store i8* %321, i8** %file_name5, align 8
  %322 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %323 = getelementptr inbounds %struct.__va_list_tag* %322, i32 0, i32 0
  %324 = load i32* %323
  %325 = icmp ule i32 %324, 40
  br i1 %325, label %326, label %332

; <label>:326                                     ; preds = %319
  %327 = getelementptr inbounds %struct.__va_list_tag* %322, i32 0, i32 3
  %328 = load i8** %327
  %329 = getelementptr i8* %328, i32 %324
  %330 = bitcast i8* %329 to i8**
  %331 = add i32 %324, 8
  store i32 %331, i32* %323
  br label %337

; <label>:332                                     ; preds = %319
  %333 = getelementptr inbounds %struct.__va_list_tag* %322, i32 0, i32 2
  %334 = load i8** %333
  %335 = bitcast i8* %334 to i8**
  %336 = getelementptr i8* %334, i32 8
  store i8* %336, i8** %333
  br label %337

; <label>:337                                     ; preds = %332, %326
  %338 = phi i8** [ %330, %326 ], [ %335, %332 ]
  %339 = load i8** %338
  store i8* %339, i8** %func_name6, align 8
  %340 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %341 = getelementptr inbounds %struct.__va_list_tag* %340, i32 0, i32 0
  %342 = load i32* %341
  %343 = icmp ule i32 %342, 40
  br i1 %343, label %344, label %350

; <label>:344                                     ; preds = %337
  %345 = getelementptr inbounds %struct.__va_list_tag* %340, i32 0, i32 3
  %346 = load i8** %345
  %347 = getelementptr i8* %346, i32 %342
  %348 = bitcast i8* %347 to i32*
  %349 = add i32 %342, 8
  store i32 %349, i32* %341
  br label %355

; <label>:350                                     ; preds = %337
  %351 = getelementptr inbounds %struct.__va_list_tag* %340, i32 0, i32 2
  %352 = load i8** %351
  %353 = bitcast i8* %352 to i32*
  %354 = getelementptr i8* %352, i32 8
  store i8* %354, i8** %351
  br label %355

; <label>:355                                     ; preds = %350, %344
  %356 = phi i32* [ %348, %344 ], [ %353, %350 ]
  %357 = load i32* %356
  store i32 %357, i32* %p_line7, align 4
  %358 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %359 = getelementptr inbounds %struct.__va_list_tag* %358, i32 0, i32 0
  %360 = load i32* %359
  %361 = icmp ule i32 %360, 40
  br i1 %361, label %362, label %368

; <label>:362                                     ; preds = %355
  %363 = getelementptr inbounds %struct.__va_list_tag* %358, i32 0, i32 3
  %364 = load i8** %363
  %365 = getelementptr i8* %364, i32 %360
  %366 = bitcast i8* %365 to i32*
  %367 = add i32 %360, 8
  store i32 %367, i32* %359
  br label %373

; <label>:368                                     ; preds = %355
  %369 = getelementptr inbounds %struct.__va_list_tag* %358, i32 0, i32 2
  %370 = load i8** %369
  %371 = bitcast i8* %370 to i32*
  %372 = getelementptr i8* %370, i32 8
  store i8* %372, i8** %369
  br label %373

; <label>:373                                     ; preds = %368, %362
  %374 = phi i32* [ %366, %362 ], [ %371, %368 ]
  %375 = load i32* %374
  store i32 %375, i32* %p_col8, align 4
  %376 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %377 = getelementptr inbounds %struct.__va_list_tag* %376, i32 0, i32 0
  %378 = load i32* %377
  %379 = icmp ule i32 %378, 40
  br i1 %379, label %380, label %386

; <label>:380                                     ; preds = %373
  %381 = getelementptr inbounds %struct.__va_list_tag* %376, i32 0, i32 3
  %382 = load i8** %381
  %383 = getelementptr i8* %382, i32 %378
  %384 = bitcast i8* %383 to i8**
  %385 = add i32 %378, 8
  store i32 %385, i32* %377
  br label %391

; <label>:386                                     ; preds = %373
  %387 = getelementptr inbounds %struct.__va_list_tag* %376, i32 0, i32 2
  %388 = load i8** %387
  %389 = bitcast i8* %388 to i8**
  %390 = getelementptr i8* %388, i32 8
  store i8* %390, i8** %387
  br label %391

; <label>:391                                     ; preds = %386, %380
  %392 = phi i8** [ %384, %380 ], [ %389, %386 ]
  %393 = load i8** %392
  store i8* %393, i8** %p_name9, align 8
  %394 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %395 = bitcast %struct.__va_list_tag* %394 to i8*
  call void @llvm.va_end(i8* %395)
  %396 = load %struct._RV_pmd** %ptr_pmd3, align 8
  %397 = load i8** %ptr4, align 8
  %398 = load i8** %file_name5, align 8
  %399 = load i8** %func_name6, align 8
  %400 = load i32* %p_line7, align 4
  %401 = load i32* %p_col8, align 4
  %402 = load i8** %p_name9, align 8
  call void @_RV_free(%struct._RV_pmd* %396, i8* %397, i8* %398, i8* %399, i32 %400, i32 %401, i8* %402)
  br label %699

; <label>:403                                     ; preds = %264
  %404 = load void (...)** %1, align 8
  %405 = icmp eq void (...)* %404, bitcast (i8* (i8*, i8*, i64)* @memcpy to void (...)*)
  br i1 %405, label %406, label %695

; <label>:406                                     ; preds = %403
  %407 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %408 = getelementptr inbounds %struct.__va_list_tag* %407, i32 0, i32 0
  %409 = load i32* %408
  %410 = icmp ule i32 %409, 40
  br i1 %410, label %411, label %417

; <label>:411                                     ; preds = %406
  %412 = getelementptr inbounds %struct.__va_list_tag* %407, i32 0, i32 3
  %413 = load i8** %412
  %414 = getelementptr i8* %413, i32 %409
  %415 = bitcast i8* %414 to i8***
  %416 = add i32 %409, 8
  store i32 %416, i32* %408
  br label %422

; <label>:417                                     ; preds = %406
  %418 = getelementptr inbounds %struct.__va_list_tag* %407, i32 0, i32 2
  %419 = load i8** %418
  %420 = bitcast i8* %419 to i8***
  %421 = getelementptr i8* %419, i32 8
  store i8* %421, i8** %418
  br label %422

; <label>:422                                     ; preds = %417, %411
  %423 = phi i8*** [ %415, %411 ], [ %420, %417 ]
  %424 = load i8*** %423
  store i8** %424, i8*** %ret_addr10, align 8
  %425 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %426 = getelementptr inbounds %struct.__va_list_tag* %425, i32 0, i32 0
  %427 = load i32* %426
  %428 = icmp ule i32 %427, 40
  br i1 %428, label %429, label %435

; <label>:429                                     ; preds = %422
  %430 = getelementptr inbounds %struct.__va_list_tag* %425, i32 0, i32 3
  %431 = load i8** %430
  %432 = getelementptr i8* %431, i32 %427
  %433 = bitcast i8* %432 to %struct._RV_pmd**
  %434 = add i32 %427, 8
  store i32 %434, i32* %426
  br label %440

; <label>:435                                     ; preds = %422
  %436 = getelementptr inbounds %struct.__va_list_tag* %425, i32 0, i32 2
  %437 = load i8** %436
  %438 = bitcast i8* %437 to %struct._RV_pmd**
  %439 = getelementptr i8* %437, i32 8
  store i8* %439, i8** %436
  br label %440

; <label>:440                                     ; preds = %435, %429
  %441 = phi %struct._RV_pmd** [ %433, %429 ], [ %438, %435 ]
  %442 = load %struct._RV_pmd** %441
  store %struct._RV_pmd* %442, %struct._RV_pmd** %ret_pmd11, align 8
  %443 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %444 = getelementptr inbounds %struct.__va_list_tag* %443, i32 0, i32 0
  %445 = load i32* %444
  %446 = icmp ule i32 %445, 40
  br i1 %446, label %447, label %453

; <label>:447                                     ; preds = %440
  %448 = getelementptr inbounds %struct.__va_list_tag* %443, i32 0, i32 3
  %449 = load i8** %448
  %450 = getelementptr i8* %449, i32 %445
  %451 = bitcast i8* %450 to %struct._RV_pmd**
  %452 = add i32 %445, 8
  store i32 %452, i32* %444
  br label %458

; <label>:453                                     ; preds = %440
  %454 = getelementptr inbounds %struct.__va_list_tag* %443, i32 0, i32 2
  %455 = load i8** %454
  %456 = bitcast i8* %455 to %struct._RV_pmd**
  %457 = getelementptr i8* %455, i32 8
  store i8* %457, i8** %454
  br label %458

; <label>:458                                     ; preds = %453, %447
  %459 = phi %struct._RV_pmd** [ %451, %447 ], [ %456, %453 ]
  %460 = load %struct._RV_pmd** %459
  store %struct._RV_pmd* %460, %struct._RV_pmd** %dest_pmd, align 8
  %461 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %462 = getelementptr inbounds %struct.__va_list_tag* %461, i32 0, i32 0
  %463 = load i32* %462
  %464 = icmp ule i32 %463, 40
  br i1 %464, label %465, label %471

; <label>:465                                     ; preds = %458
  %466 = getelementptr inbounds %struct.__va_list_tag* %461, i32 0, i32 3
  %467 = load i8** %466
  %468 = getelementptr i8* %467, i32 %463
  %469 = bitcast i8* %468 to %struct._RV_pmd**
  %470 = add i32 %463, 8
  store i32 %470, i32* %462
  br label %476

; <label>:471                                     ; preds = %458
  %472 = getelementptr inbounds %struct.__va_list_tag* %461, i32 0, i32 2
  %473 = load i8** %472
  %474 = bitcast i8* %473 to %struct._RV_pmd**
  %475 = getelementptr i8* %473, i32 8
  store i8* %475, i8** %472
  br label %476

; <label>:476                                     ; preds = %471, %465
  %477 = phi %struct._RV_pmd** [ %469, %465 ], [ %474, %471 ]
  %478 = load %struct._RV_pmd** %477
  store %struct._RV_pmd* %478, %struct._RV_pmd** %src_pmd, align 8
  %479 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %480 = getelementptr inbounds %struct.__va_list_tag* %479, i32 0, i32 0
  %481 = load i32* %480
  %482 = icmp ule i32 %481, 40
  br i1 %482, label %483, label %489

; <label>:483                                     ; preds = %476
  %484 = getelementptr inbounds %struct.__va_list_tag* %479, i32 0, i32 3
  %485 = load i8** %484
  %486 = getelementptr i8* %485, i32 %481
  %487 = bitcast i8* %486 to i8**
  %488 = add i32 %481, 8
  store i32 %488, i32* %480
  br label %494

; <label>:489                                     ; preds = %476
  %490 = getelementptr inbounds %struct.__va_list_tag* %479, i32 0, i32 2
  %491 = load i8** %490
  %492 = bitcast i8* %491 to i8**
  %493 = getelementptr i8* %491, i32 8
  store i8* %493, i8** %490
  br label %494

; <label>:494                                     ; preds = %489, %483
  %495 = phi i8** [ %487, %483 ], [ %492, %489 ]
  %496 = load i8** %495
  store i8* %496, i8** %dest, align 8
  %497 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %498 = getelementptr inbounds %struct.__va_list_tag* %497, i32 0, i32 0
  %499 = load i32* %498
  %500 = icmp ule i32 %499, 40
  br i1 %500, label %501, label %507

; <label>:501                                     ; preds = %494
  %502 = getelementptr inbounds %struct.__va_list_tag* %497, i32 0, i32 3
  %503 = load i8** %502
  %504 = getelementptr i8* %503, i32 %499
  %505 = bitcast i8* %504 to i8**
  %506 = add i32 %499, 8
  store i32 %506, i32* %498
  br label %512

; <label>:507                                     ; preds = %494
  %508 = getelementptr inbounds %struct.__va_list_tag* %497, i32 0, i32 2
  %509 = load i8** %508
  %510 = bitcast i8* %509 to i8**
  %511 = getelementptr i8* %509, i32 8
  store i8* %511, i8** %508
  br label %512

; <label>:512                                     ; preds = %507, %501
  %513 = phi i8** [ %505, %501 ], [ %510, %507 ]
  %514 = load i8** %513
  store i8* %514, i8** %src, align 8
  %515 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %516 = getelementptr inbounds %struct.__va_list_tag* %515, i32 0, i32 0
  %517 = load i32* %516
  %518 = icmp ule i32 %517, 40
  br i1 %518, label %519, label %525

; <label>:519                                     ; preds = %512
  %520 = getelementptr inbounds %struct.__va_list_tag* %515, i32 0, i32 3
  %521 = load i8** %520
  %522 = getelementptr i8* %521, i32 %517
  %523 = bitcast i8* %522 to i64*
  %524 = add i32 %517, 8
  store i32 %524, i32* %516
  br label %530

; <label>:525                                     ; preds = %512
  %526 = getelementptr inbounds %struct.__va_list_tag* %515, i32 0, i32 2
  %527 = load i8** %526
  %528 = bitcast i8* %527 to i64*
  %529 = getelementptr i8* %527, i32 8
  store i8* %529, i8** %526
  br label %530

; <label>:530                                     ; preds = %525, %519
  %531 = phi i64* [ %523, %519 ], [ %528, %525 ]
  %532 = load i64* %531
  store i64 %532, i64* %n, align 8
  %533 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %534 = getelementptr inbounds %struct.__va_list_tag* %533, i32 0, i32 0
  %535 = load i32* %534
  %536 = icmp ule i32 %535, 40
  br i1 %536, label %537, label %543

; <label>:537                                     ; preds = %530
  %538 = getelementptr inbounds %struct.__va_list_tag* %533, i32 0, i32 3
  %539 = load i8** %538
  %540 = getelementptr i8* %539, i32 %535
  %541 = bitcast i8* %540 to i8**
  %542 = add i32 %535, 8
  store i32 %542, i32* %534
  br label %548

; <label>:543                                     ; preds = %530
  %544 = getelementptr inbounds %struct.__va_list_tag* %533, i32 0, i32 2
  %545 = load i8** %544
  %546 = bitcast i8* %545 to i8**
  %547 = getelementptr i8* %545, i32 8
  store i8* %547, i8** %544
  br label %548

; <label>:548                                     ; preds = %543, %537
  %549 = phi i8** [ %541, %537 ], [ %546, %543 ]
  %550 = load i8** %549
  store i8* %550, i8** %file_name12, align 8
  %551 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %552 = getelementptr inbounds %struct.__va_list_tag* %551, i32 0, i32 0
  %553 = load i32* %552
  %554 = icmp ule i32 %553, 40
  br i1 %554, label %555, label %561

; <label>:555                                     ; preds = %548
  %556 = getelementptr inbounds %struct.__va_list_tag* %551, i32 0, i32 3
  %557 = load i8** %556
  %558 = getelementptr i8* %557, i32 %553
  %559 = bitcast i8* %558 to i8**
  %560 = add i32 %553, 8
  store i32 %560, i32* %552
  br label %566

; <label>:561                                     ; preds = %548
  %562 = getelementptr inbounds %struct.__va_list_tag* %551, i32 0, i32 2
  %563 = load i8** %562
  %564 = bitcast i8* %563 to i8**
  %565 = getelementptr i8* %563, i32 8
  store i8* %565, i8** %562
  br label %566

; <label>:566                                     ; preds = %561, %555
  %567 = phi i8** [ %559, %555 ], [ %564, %561 ]
  %568 = load i8** %567
  store i8* %568, i8** %func_name13, align 8
  %569 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %570 = getelementptr inbounds %struct.__va_list_tag* %569, i32 0, i32 0
  %571 = load i32* %570
  %572 = icmp ule i32 %571, 40
  br i1 %572, label %573, label %579

; <label>:573                                     ; preds = %566
  %574 = getelementptr inbounds %struct.__va_list_tag* %569, i32 0, i32 3
  %575 = load i8** %574
  %576 = getelementptr i8* %575, i32 %571
  %577 = bitcast i8* %576 to i32*
  %578 = add i32 %571, 8
  store i32 %578, i32* %570
  br label %584

; <label>:579                                     ; preds = %566
  %580 = getelementptr inbounds %struct.__va_list_tag* %569, i32 0, i32 2
  %581 = load i8** %580
  %582 = bitcast i8* %581 to i32*
  %583 = getelementptr i8* %581, i32 8
  store i8* %583, i8** %580
  br label %584

; <label>:584                                     ; preds = %579, %573
  %585 = phi i32* [ %577, %573 ], [ %582, %579 ]
  %586 = load i32* %585
  store i32 %586, i32* %d_line, align 4
  %587 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %588 = getelementptr inbounds %struct.__va_list_tag* %587, i32 0, i32 0
  %589 = load i32* %588
  %590 = icmp ule i32 %589, 40
  br i1 %590, label %591, label %597

; <label>:591                                     ; preds = %584
  %592 = getelementptr inbounds %struct.__va_list_tag* %587, i32 0, i32 3
  %593 = load i8** %592
  %594 = getelementptr i8* %593, i32 %589
  %595 = bitcast i8* %594 to i32*
  %596 = add i32 %589, 8
  store i32 %596, i32* %588
  br label %602

; <label>:597                                     ; preds = %584
  %598 = getelementptr inbounds %struct.__va_list_tag* %587, i32 0, i32 2
  %599 = load i8** %598
  %600 = bitcast i8* %599 to i32*
  %601 = getelementptr i8* %599, i32 8
  store i8* %601, i8** %598
  br label %602

; <label>:602                                     ; preds = %597, %591
  %603 = phi i32* [ %595, %591 ], [ %600, %597 ]
  %604 = load i32* %603
  store i32 %604, i32* %d_col, align 4
  %605 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %606 = getelementptr inbounds %struct.__va_list_tag* %605, i32 0, i32 0
  %607 = load i32* %606
  %608 = icmp ule i32 %607, 40
  br i1 %608, label %609, label %615

; <label>:609                                     ; preds = %602
  %610 = getelementptr inbounds %struct.__va_list_tag* %605, i32 0, i32 3
  %611 = load i8** %610
  %612 = getelementptr i8* %611, i32 %607
  %613 = bitcast i8* %612 to i8**
  %614 = add i32 %607, 8
  store i32 %614, i32* %606
  br label %620

; <label>:615                                     ; preds = %602
  %616 = getelementptr inbounds %struct.__va_list_tag* %605, i32 0, i32 2
  %617 = load i8** %616
  %618 = bitcast i8* %617 to i8**
  %619 = getelementptr i8* %617, i32 8
  store i8* %619, i8** %616
  br label %620

; <label>:620                                     ; preds = %615, %609
  %621 = phi i8** [ %613, %609 ], [ %618, %615 ]
  %622 = load i8** %621
  store i8* %622, i8** %d_name, align 8
  %623 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %624 = getelementptr inbounds %struct.__va_list_tag* %623, i32 0, i32 0
  %625 = load i32* %624
  %626 = icmp ule i32 %625, 40
  br i1 %626, label %627, label %633

; <label>:627                                     ; preds = %620
  %628 = getelementptr inbounds %struct.__va_list_tag* %623, i32 0, i32 3
  %629 = load i8** %628
  %630 = getelementptr i8* %629, i32 %625
  %631 = bitcast i8* %630 to i32*
  %632 = add i32 %625, 8
  store i32 %632, i32* %624
  br label %638

; <label>:633                                     ; preds = %620
  %634 = getelementptr inbounds %struct.__va_list_tag* %623, i32 0, i32 2
  %635 = load i8** %634
  %636 = bitcast i8* %635 to i32*
  %637 = getelementptr i8* %635, i32 8
  store i8* %637, i8** %634
  br label %638

; <label>:638                                     ; preds = %633, %627
  %639 = phi i32* [ %631, %627 ], [ %636, %633 ]
  %640 = load i32* %639
  store i32 %640, i32* %s_line, align 4
  %641 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %642 = getelementptr inbounds %struct.__va_list_tag* %641, i32 0, i32 0
  %643 = load i32* %642
  %644 = icmp ule i32 %643, 40
  br i1 %644, label %645, label %651

; <label>:645                                     ; preds = %638
  %646 = getelementptr inbounds %struct.__va_list_tag* %641, i32 0, i32 3
  %647 = load i8** %646
  %648 = getelementptr i8* %647, i32 %643
  %649 = bitcast i8* %648 to i32*
  %650 = add i32 %643, 8
  store i32 %650, i32* %642
  br label %656

; <label>:651                                     ; preds = %638
  %652 = getelementptr inbounds %struct.__va_list_tag* %641, i32 0, i32 2
  %653 = load i8** %652
  %654 = bitcast i8* %653 to i32*
  %655 = getelementptr i8* %653, i32 8
  store i8* %655, i8** %652
  br label %656

; <label>:656                                     ; preds = %651, %645
  %657 = phi i32* [ %649, %645 ], [ %654, %651 ]
  %658 = load i32* %657
  store i32 %658, i32* %s_col, align 4
  %659 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %660 = getelementptr inbounds %struct.__va_list_tag* %659, i32 0, i32 0
  %661 = load i32* %660
  %662 = icmp ule i32 %661, 40
  br i1 %662, label %663, label %669

; <label>:663                                     ; preds = %656
  %664 = getelementptr inbounds %struct.__va_list_tag* %659, i32 0, i32 3
  %665 = load i8** %664
  %666 = getelementptr i8* %665, i32 %661
  %667 = bitcast i8* %666 to i8**
  %668 = add i32 %661, 8
  store i32 %668, i32* %660
  br label %674

; <label>:669                                     ; preds = %656
  %670 = getelementptr inbounds %struct.__va_list_tag* %659, i32 0, i32 2
  %671 = load i8** %670
  %672 = bitcast i8* %671 to i8**
  %673 = getelementptr i8* %671, i32 8
  store i8* %673, i8** %670
  br label %674

; <label>:674                                     ; preds = %669, %663
  %675 = phi i8** [ %667, %663 ], [ %672, %669 ]
  %676 = load i8** %675
  store i8* %676, i8** %s_name, align 8
  %677 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %678 = bitcast %struct.__va_list_tag* %677 to i8*
  call void @llvm.va_end(i8* %678)
  %679 = load %struct._RV_pmd** %ret_pmd11, align 8
  %680 = load %struct._RV_pmd** %dest_pmd, align 8
  %681 = load %struct._RV_pmd** %src_pmd, align 8
  %682 = load i8** %dest, align 8
  %683 = load i8** %src, align 8
  %684 = load i64* %n, align 8
  %685 = load i8** %file_name12, align 8
  %686 = load i8** %func_name13, align 8
  %687 = load i32* %d_line, align 4
  %688 = load i32* %d_col, align 4
  %689 = load i8** %d_name, align 8
  %690 = load i32* %s_line, align 4
  %691 = load i32* %s_col, align 4
  %692 = load i8** %s_name, align 8
  %693 = call i8* @_RV_memcpy(%struct._RV_pmd* %679, %struct._RV_pmd* %680, %struct._RV_pmd* %681, i8* %682, i8* %683, i64 %684, i8* %685, i8* %686, i32 %687, i32 %688, i8* %689, i32 %690, i32 %691, i8* %692)
  %694 = load i8*** %ret_addr10, align 8
  store i8* %693, i8** %694, align 8
  br label %699

; <label>:695                                     ; preds = %403
  %696 = load %struct._IO_FILE** @stderr, align 8
  %697 = load void (...)** %1, align 8
  %698 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %696, i8* getelementptr inbounds ([46 x i8]* @.str29, i32 0, i32 0), void (...)* %697)
  call void @abort() #8
  unreachable

; <label>:699                                     ; preds = %674, %391, %248, %58
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #7

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #7

; Function Attrs: nounwind
declare i8* @memcpy(i8*, i8*, i64) #3

; Function Attrs: noreturn nounwind
declare void @abort() #4

; Function Attrs: nounwind uwtable
define i32 @_RV_has_wrapper(void (...)* %fp) #0 {
  %1 = alloca i32, align 4
  %2 = alloca void (...)*, align 8
  store void (...)* %fp, void (...)** %2, align 8
  %3 = load void (...)** %2, align 8
  %4 = icmp eq void (...)* %3, bitcast (i32 (%struct._IO_FILE*)* @_IO_getc to void (...)*)
  br i1 %4, label %317, label %5

; <label>:5                                       ; preds = %0
  %6 = load void (...)** %2, align 8
  %7 = icmp eq void (...)* %6, bitcast (i32 (i32, %struct._IO_FILE*)* @_IO_putc to void (...)*)
  br i1 %7, label %317, label %8

; <label>:8                                       ; preds = %5
  %9 = load void (...)** %2, align 8
  %10 = icmp eq void (...)* %9, bitcast (i16** ()* @__ctype_b_loc to void (...)*)
  br i1 %10, label %317, label %11

; <label>:11                                      ; preds = %8
  %12 = load void (...)** %2, align 8
  %13 = icmp eq void (...)* %12, bitcast (i32* (...)* @__errno_location to void (...)*)
  br i1 %13, label %317, label %14

; <label>:14                                      ; preds = %11
  %15 = load void (...)** %2, align 8
  %16 = icmp eq void (...)* %15, bitcast (i8* (%struct.tm*)* @asctime to void (...)*)
  br i1 %16, label %317, label %17

; <label>:17                                      ; preds = %14
  %18 = load void (...)** %2, align 8
  %19 = icmp eq void (...)* %18, bitcast (i32 (void ()*)* @atexit to void (...)*)
  br i1 %19, label %317, label %20

; <label>:20                                      ; preds = %17
  %21 = load void (...)** %2, align 8
  %22 = icmp eq void (...)* %21, bitcast (double (i8*)* @atof to void (...)*)
  br i1 %22, label %317, label %23

; <label>:23                                      ; preds = %20
  %24 = load void (...)** %2, align 8
  %25 = icmp eq void (...)* %24, bitcast (i32 (i8*)* @atoi to void (...)*)
  br i1 %25, label %317, label %26

; <label>:26                                      ; preds = %23
  %27 = load void (...)** %2, align 8
  %28 = icmp eq void (...)* %27, bitcast (i64 (i8*)* @atol to void (...)*)
  br i1 %28, label %317, label %29

; <label>:29                                      ; preds = %26
  %30 = load void (...)** %2, align 8
  %31 = icmp eq void (...)* %30, bitcast (i8* (i8*, i8*, i64, i64, i32 (i8*, i8*)*)* @bsearch to void (...)*)
  br i1 %31, label %317, label %32

; <label>:32                                      ; preds = %29
  %33 = load void (...)** %2, align 8
  %34 = icmp eq void (...)* %33, bitcast (i8* (i64, i64)* @calloc to void (...)*)
  br i1 %34, label %317, label %35

; <label>:35                                      ; preds = %32
  %36 = load void (...)** %2, align 8
  %37 = icmp eq void (...)* %36, bitcast (void (%struct._IO_FILE*)* @clearerr to void (...)*)
  br i1 %37, label %317, label %38

; <label>:38                                      ; preds = %35
  %39 = load void (...)** %2, align 8
  %40 = icmp eq void (...)* %39, bitcast (i8* (i64*)* @ctime to void (...)*)
  br i1 %40, label %317, label %41

; <label>:41                                      ; preds = %38
  %42 = load void (...)** %2, align 8
  %43 = icmp eq void (...)* %42, bitcast (i32 (%struct._IO_FILE*)* @fclose to void (...)*)
  br i1 %43, label %317, label %44

; <label>:44                                      ; preds = %41
  %45 = load void (...)** %2, align 8
  %46 = icmp eq void (...)* %45, bitcast (i32 (%struct._IO_FILE*)* @feof to void (...)*)
  br i1 %46, label %317, label %47

; <label>:47                                      ; preds = %44
  %48 = load void (...)** %2, align 8
  %49 = icmp eq void (...)* %48, bitcast (i32 (%struct._IO_FILE*)* @ferror to void (...)*)
  br i1 %49, label %317, label %50

; <label>:50                                      ; preds = %47
  %51 = load void (...)** %2, align 8
  %52 = icmp eq void (...)* %51, bitcast (i32 (%struct._IO_FILE*)* @fflush to void (...)*)
  br i1 %52, label %317, label %53

; <label>:53                                      ; preds = %50
  %54 = load void (...)** %2, align 8
  %55 = icmp eq void (...)* %54, bitcast (i32 (%struct._IO_FILE*)* @fgetc to void (...)*)
  br i1 %55, label %317, label %56

; <label>:56                                      ; preds = %53
  %57 = load void (...)** %2, align 8
  %58 = icmp eq void (...)* %57, bitcast (i32 (%struct._IO_FILE*, %struct._G_fpos_t*)* @fgetpos to void (...)*)
  br i1 %58, label %317, label %59

; <label>:59                                      ; preds = %56
  %60 = load void (...)** %2, align 8
  %61 = icmp eq void (...)* %60, bitcast (i8* (i8*, i32, %struct._IO_FILE*)* @fgets to void (...)*)
  br i1 %61, label %317, label %62

; <label>:62                                      ; preds = %59
  %63 = load void (...)** %2, align 8
  %64 = icmp eq void (...)* %63, bitcast (%struct._IO_FILE* (i8*, i8*)* @fopen to void (...)*)
  br i1 %64, label %317, label %65

; <label>:65                                      ; preds = %62
  %66 = load void (...)** %2, align 8
  %67 = icmp eq void (...)* %66, bitcast (i32 (%struct._IO_FILE*, i8*, ...)* @fprintf to void (...)*)
  br i1 %67, label %317, label %68

; <label>:68                                      ; preds = %65
  %69 = load void (...)** %2, align 8
  %70 = icmp eq void (...)* %69, bitcast (i32 (i32, %struct._IO_FILE*)* @fputc to void (...)*)
  br i1 %70, label %317, label %71

; <label>:71                                      ; preds = %68
  %72 = load void (...)** %2, align 8
  %73 = icmp eq void (...)* %72, bitcast (i32 (i8*, %struct._IO_FILE*)* @fputs to void (...)*)
  br i1 %73, label %317, label %74

; <label>:74                                      ; preds = %71
  %75 = load void (...)** %2, align 8
  %76 = icmp eq void (...)* %75, bitcast (i64 (i8*, i64, i64, %struct._IO_FILE*)* @fread to void (...)*)
  br i1 %76, label %317, label %77

; <label>:77                                      ; preds = %74
  %78 = load void (...)** %2, align 8
  %79 = icmp eq void (...)* %78, bitcast (void (i8*)* @free to void (...)*)
  br i1 %79, label %317, label %80

; <label>:80                                      ; preds = %77
  %81 = load void (...)** %2, align 8
  %82 = icmp eq void (...)* %81, bitcast (%struct._IO_FILE* (i8*, i8*, %struct._IO_FILE*)* @freopen to void (...)*)
  br i1 %82, label %317, label %83

; <label>:83                                      ; preds = %80
  %84 = load void (...)** %2, align 8
  %85 = icmp eq void (...)* %84, bitcast (double (double, i32*)* @frexp to void (...)*)
  br i1 %85, label %317, label %86

; <label>:86                                      ; preds = %83
  %87 = load void (...)** %2, align 8
  %88 = icmp eq void (...)* %87, bitcast (i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf to void (...)*)
  br i1 %88, label %317, label %89

; <label>:89                                      ; preds = %86
  %90 = load void (...)** %2, align 8
  %91 = icmp eq void (...)* %90, bitcast (i32 (%struct._IO_FILE*, i64, i32)* @fseek to void (...)*)
  br i1 %91, label %317, label %92

; <label>:92                                      ; preds = %89
  %93 = load void (...)** %2, align 8
  %94 = icmp eq void (...)* %93, bitcast (i32 (%struct._IO_FILE*, %struct._G_fpos_t*)* @fsetpos to void (...)*)
  br i1 %94, label %317, label %95

; <label>:95                                      ; preds = %92
  %96 = load void (...)** %2, align 8
  %97 = icmp eq void (...)* %96, bitcast (i32 (i32, %struct.stat*)* @fstat to void (...)*)
  br i1 %97, label %317, label %98

; <label>:98                                      ; preds = %95
  %99 = load void (...)** %2, align 8
  %100 = icmp eq void (...)* %99, bitcast (i64 (%struct._IO_FILE*)* @ftell to void (...)*)
  br i1 %100, label %317, label %101

; <label>:101                                     ; preds = %98
  %102 = load void (...)** %2, align 8
  %103 = icmp eq void (...)* %102, bitcast (i64 (i8*, i64, i64, %struct._IO_FILE*)* @fwrite to void (...)*)
  br i1 %103, label %317, label %104

; <label>:104                                     ; preds = %101
  %105 = load void (...)** %2, align 8
  %106 = icmp eq void (...)* %105, bitcast (i32 (%struct._IO_FILE*)* @getc to void (...)*)
  br i1 %106, label %317, label %107

; <label>:107                                     ; preds = %104
  %108 = load void (...)** %2, align 8
  %109 = icmp eq void (...)* %108, bitcast (i8* (i8*, i64)* @getcwd to void (...)*)
  br i1 %109, label %317, label %110

; <label>:110                                     ; preds = %107
  %111 = load void (...)** %2, align 8
  %112 = icmp eq void (...)* %111, bitcast (i8* (i8*)* @getenv to void (...)*)
  br i1 %112, label %317, label %113

; <label>:113                                     ; preds = %110
  %114 = load void (...)** %2, align 8
  %115 = icmp eq void (...)* %114, bitcast (%struct.passwd* (i8*)* @getpwnam to void (...)*)
  br i1 %115, label %317, label %116

; <label>:116                                     ; preds = %113
  %117 = load void (...)** %2, align 8
  %118 = icmp eq void (...)* %117, bitcast (%struct.passwd* (i32)* @getpwuid to void (...)*)
  br i1 %118, label %317, label %119

; <label>:119                                     ; preds = %116
  %120 = load void (...)** %2, align 8
  %121 = icmp eq void (...)* %120, bitcast (%struct.tm* (i64*)* @gmtime to void (...)*)
  br i1 %121, label %317, label %122

; <label>:122                                     ; preds = %119
  %123 = load void (...)** %2, align 8
  %124 = icmp eq void (...)* %123, bitcast (%struct.lconv* ()* @localeconv to void (...)*)
  br i1 %124, label %317, label %125

; <label>:125                                     ; preds = %122
  %126 = load void (...)** %2, align 8
  %127 = icmp eq void (...)* %126, bitcast (%struct.tm* (i64*)* @localtime to void (...)*)
  br i1 %127, label %317, label %128

; <label>:128                                     ; preds = %125
  %129 = load void (...)** %2, align 8
  %130 = icmp eq void (...)* %129, bitcast (void (%struct.__jmp_buf_tag*, i32)* @longjmp to void (...)*)
  br i1 %130, label %317, label %131

; <label>:131                                     ; preds = %128
  %132 = load void (...)** %2, align 8
  %133 = icmp eq void (...)* %132, bitcast (i8* (i64)* @malloc to void (...)*)
  br i1 %133, label %317, label %134

; <label>:134                                     ; preds = %131
  %135 = load void (...)** %2, align 8
  %136 = icmp eq void (...)* %135, bitcast (i32 (i8*, i64)* @mblen to void (...)*)
  br i1 %136, label %317, label %137

; <label>:137                                     ; preds = %134
  %138 = load void (...)** %2, align 8
  %139 = icmp eq void (...)* %138, bitcast (i64 (i32*, i8*, i64)* @mbstowcs to void (...)*)
  br i1 %139, label %317, label %140

; <label>:140                                     ; preds = %137
  %141 = load void (...)** %2, align 8
  %142 = icmp eq void (...)* %141, bitcast (i32 (i32*, i8*, i64)* @mbtowc to void (...)*)
  br i1 %142, label %317, label %143

; <label>:143                                     ; preds = %140
  %144 = load void (...)** %2, align 8
  %145 = icmp eq void (...)* %144, bitcast (i8* (i8*, i32, i64)* @memchr to void (...)*)
  br i1 %145, label %317, label %146

; <label>:146                                     ; preds = %143
  %147 = load void (...)** %2, align 8
  %148 = icmp eq void (...)* %147, bitcast (i32 (i8*, i8*, i64)* @memcmp to void (...)*)
  br i1 %148, label %317, label %149

; <label>:149                                     ; preds = %146
  %150 = load void (...)** %2, align 8
  %151 = icmp eq void (...)* %150, bitcast (i8* (i8*, i8*, i64)* @memcpy to void (...)*)
  br i1 %151, label %317, label %152

; <label>:152                                     ; preds = %149
  %153 = load void (...)** %2, align 8
  %154 = icmp eq void (...)* %153, bitcast (i8* (i8*, i8*, i64)* @memmove to void (...)*)
  br i1 %154, label %317, label %155

; <label>:155                                     ; preds = %152
  %156 = load void (...)** %2, align 8
  %157 = icmp eq void (...)* %156, bitcast (i8* (i8*, i32, i64)* @memset to void (...)*)
  br i1 %157, label %317, label %158

; <label>:158                                     ; preds = %155
  %159 = load void (...)** %2, align 8
  %160 = icmp eq void (...)* %159, bitcast (i64 (%struct.tm*)* @mktime to void (...)*)
  br i1 %160, label %317, label %161

; <label>:161                                     ; preds = %158
  %162 = load void (...)** %2, align 8
  %163 = icmp eq void (...)* %162, bitcast (double (double, double*)* @modf to void (...)*)
  br i1 %163, label %317, label %164

; <label>:164                                     ; preds = %161
  %165 = load void (...)** %2, align 8
  %166 = icmp eq void (...)* %165, bitcast (void (i8*)* @perror to void (...)*)
  br i1 %166, label %317, label %167

; <label>:167                                     ; preds = %164
  %168 = load void (...)** %2, align 8
  %169 = icmp eq void (...)* %168, bitcast (i32 (i8*, ...)* @printf to void (...)*)
  br i1 %169, label %317, label %170

; <label>:170                                     ; preds = %167
  %171 = load void (...)** %2, align 8
  %172 = icmp eq void (...)* %171, bitcast (i32 (i32, %struct._IO_FILE*)* @putc to void (...)*)
  br i1 %172, label %317, label %173

; <label>:173                                     ; preds = %170
  %174 = load void (...)** %2, align 8
  %175 = icmp eq void (...)* %174, bitcast (i32 (i8*)* @puts to void (...)*)
  br i1 %175, label %317, label %176

; <label>:176                                     ; preds = %173
  %177 = load void (...)** %2, align 8
  %178 = icmp eq void (...)* %177, bitcast (void (i8*, i64, i64, i32 (i8*, i8*)*)* @qsort to void (...)*)
  br i1 %178, label %317, label %179

; <label>:179                                     ; preds = %176
  %180 = load void (...)** %2, align 8
  %181 = icmp eq void (...)* %180, bitcast (i64 (i32, i8*, i64)* @read to void (...)*)
  br i1 %181, label %317, label %182

; <label>:182                                     ; preds = %179
  %183 = load void (...)** %2, align 8
  %184 = icmp eq void (...)* %183, bitcast (i8* (i8*, i64)* @realloc to void (...)*)
  br i1 %184, label %317, label %185

; <label>:185                                     ; preds = %182
  %186 = load void (...)** %2, align 8
  %187 = icmp eq void (...)* %186, bitcast (i32 (i8*)* @remove to void (...)*)
  br i1 %187, label %317, label %188

; <label>:188                                     ; preds = %185
  %189 = load void (...)** %2, align 8
  %190 = icmp eq void (...)* %189, bitcast (i32 (i8*, i8*)* @rename to void (...)*)
  br i1 %190, label %317, label %191

; <label>:191                                     ; preds = %188
  %192 = load void (...)** %2, align 8
  %193 = icmp eq void (...)* %192, bitcast (void (%struct._IO_FILE*)* @rewind to void (...)*)
  br i1 %193, label %317, label %194

; <label>:194                                     ; preds = %191
  %195 = load void (...)** %2, align 8
  %196 = icmp eq void (...)* %195, bitcast (i32 (i8*, ...)* @__isoc99_scanf to void (...)*)
  br i1 %196, label %317, label %197

; <label>:197                                     ; preds = %194
  %198 = load void (...)** %2, align 8
  %199 = icmp eq void (...)* %198, bitcast (void (%struct._IO_FILE*, i8*)* @setbuf to void (...)*)
  br i1 %199, label %317, label %200

; <label>:200                                     ; preds = %197
  %201 = load void (...)** %2, align 8
  %202 = icmp eq void (...)* %201, bitcast (i8* (i32, i8*)* @setlocale to void (...)*)
  br i1 %202, label %317, label %203

; <label>:203                                     ; preds = %200
  %204 = load void (...)** %2, align 8
  %205 = icmp eq void (...)* %204, bitcast (i32 (%struct._IO_FILE*, i8*, i32, i64)* @setvbuf to void (...)*)
  br i1 %205, label %317, label %206

; <label>:206                                     ; preds = %203
  %207 = load void (...)** %2, align 8
  %208 = icmp eq void (...)* %207, bitcast (void (i32)* (i32, void (i32)*)* @signal to void (...)*)
  br i1 %208, label %317, label %209

; <label>:209                                     ; preds = %206
  %210 = load void (...)** %2, align 8
  %211 = icmp eq void (...)* %210, bitcast (i32 (i8*, i8*, ...)* @sprintf to void (...)*)
  br i1 %211, label %317, label %212

; <label>:212                                     ; preds = %209
  %213 = load void (...)** %2, align 8
  %214 = icmp eq void (...)* %213, bitcast (i32 (i8*, i8*, ...)* @__isoc99_sscanf to void (...)*)
  br i1 %214, label %317, label %215

; <label>:215                                     ; preds = %212
  %216 = load void (...)** %2, align 8
  %217 = icmp eq void (...)* %216, bitcast (i8* (i8*, i8*)* @strcat to void (...)*)
  br i1 %217, label %317, label %218

; <label>:218                                     ; preds = %215
  %219 = load void (...)** %2, align 8
  %220 = icmp eq void (...)* %219, bitcast (i8* (i8*, i32)* @strchr to void (...)*)
  br i1 %220, label %317, label %221

; <label>:221                                     ; preds = %218
  %222 = load void (...)** %2, align 8
  %223 = icmp eq void (...)* %222, bitcast (i32 (i8*, i8*)* @strcmp to void (...)*)
  br i1 %223, label %317, label %224

; <label>:224                                     ; preds = %221
  %225 = load void (...)** %2, align 8
  %226 = icmp eq void (...)* %225, bitcast (i32 (i8*, i8*)* @strcoll to void (...)*)
  br i1 %226, label %317, label %227

; <label>:227                                     ; preds = %224
  %228 = load void (...)** %2, align 8
  %229 = icmp eq void (...)* %228, bitcast (i8* (i8*, i8*)* @strcpy to void (...)*)
  br i1 %229, label %317, label %230

; <label>:230                                     ; preds = %227
  %231 = load void (...)** %2, align 8
  %232 = icmp eq void (...)* %231, bitcast (i64 (i8*, i8*)* @strcspn to void (...)*)
  br i1 %232, label %317, label %233

; <label>:233                                     ; preds = %230
  %234 = load void (...)** %2, align 8
  %235 = icmp eq void (...)* %234, bitcast (i8* (i32)* @strerror to void (...)*)
  br i1 %235, label %317, label %236

; <label>:236                                     ; preds = %233
  %237 = load void (...)** %2, align 8
  %238 = icmp eq void (...)* %237, bitcast (i64 (i8*, i64, i8*, %struct.tm*)* @strftime to void (...)*)
  br i1 %238, label %317, label %239

; <label>:239                                     ; preds = %236
  %240 = load void (...)** %2, align 8
  %241 = icmp eq void (...)* %240, bitcast (i64 (i8*)* @strlen to void (...)*)
  br i1 %241, label %317, label %242

; <label>:242                                     ; preds = %239
  %243 = load void (...)** %2, align 8
  %244 = icmp eq void (...)* %243, bitcast (i8* (i8*, i8*, i64)* @strncat to void (...)*)
  br i1 %244, label %317, label %245

; <label>:245                                     ; preds = %242
  %246 = load void (...)** %2, align 8
  %247 = icmp eq void (...)* %246, bitcast (i32 (i8*, i8*, i64)* @strncmp to void (...)*)
  br i1 %247, label %317, label %248

; <label>:248                                     ; preds = %245
  %249 = load void (...)** %2, align 8
  %250 = icmp eq void (...)* %249, bitcast (i8* (i8*, i8*, i64)* @strncpy to void (...)*)
  br i1 %250, label %317, label %251

; <label>:251                                     ; preds = %248
  %252 = load void (...)** %2, align 8
  %253 = icmp eq void (...)* %252, bitcast (i8* (i8*, i8*)* @strpbrk to void (...)*)
  br i1 %253, label %317, label %254

; <label>:254                                     ; preds = %251
  %255 = load void (...)** %2, align 8
  %256 = icmp eq void (...)* %255, bitcast (i8* (i8*, i32)* @strrchr to void (...)*)
  br i1 %256, label %317, label %257

; <label>:257                                     ; preds = %254
  %258 = load void (...)** %2, align 8
  %259 = icmp eq void (...)* %258, bitcast (i64 (i8*, i8*)* @strspn to void (...)*)
  br i1 %259, label %317, label %260

; <label>:260                                     ; preds = %257
  %261 = load void (...)** %2, align 8
  %262 = icmp eq void (...)* %261, bitcast (i8* (i8*, i8*)* @strstr to void (...)*)
  br i1 %262, label %317, label %263

; <label>:263                                     ; preds = %260
  %264 = load void (...)** %2, align 8
  %265 = icmp eq void (...)* %264, bitcast (double (i8*, i8**)* @strtod to void (...)*)
  br i1 %265, label %317, label %266

; <label>:266                                     ; preds = %263
  %267 = load void (...)** %2, align 8
  %268 = icmp eq void (...)* %267, bitcast (i8* (i8*, i8*)* @strtok to void (...)*)
  br i1 %268, label %317, label %269

; <label>:269                                     ; preds = %266
  %270 = load void (...)** %2, align 8
  %271 = icmp eq void (...)* %270, bitcast (i64 (i8*, i8**, i32)* @strtol to void (...)*)
  br i1 %271, label %317, label %272

; <label>:272                                     ; preds = %269
  %273 = load void (...)** %2, align 8
  %274 = icmp eq void (...)* %273, bitcast (i64 (i8*, i8**, i32)* @strtoul to void (...)*)
  br i1 %274, label %317, label %275

; <label>:275                                     ; preds = %272
  %276 = load void (...)** %2, align 8
  %277 = icmp eq void (...)* %276, bitcast (i64 (i8*, i8*, i64)* @strxfrm to void (...)*)
  br i1 %277, label %317, label %278

; <label>:278                                     ; preds = %275
  %279 = load void (...)** %2, align 8
  %280 = icmp eq void (...)* %279, bitcast (i32 (i8*)* @system to void (...)*)
  br i1 %280, label %317, label %281

; <label>:281                                     ; preds = %278
  %282 = load void (...)** %2, align 8
  %283 = icmp eq void (...)* %282, bitcast (i64 (i64*)* @time to void (...)*)
  br i1 %283, label %317, label %284

; <label>:284                                     ; preds = %281
  %285 = load void (...)** %2, align 8
  %286 = icmp eq void (...)* %285, bitcast (i64 (%struct.tms*)* @times to void (...)*)
  br i1 %286, label %317, label %287

; <label>:287                                     ; preds = %284
  %288 = load void (...)** %2, align 8
  %289 = icmp eq void (...)* %288, bitcast (%struct._IO_FILE* ()* @tmpfile to void (...)*)
  br i1 %289, label %317, label %290

; <label>:290                                     ; preds = %287
  %291 = load void (...)** %2, align 8
  %292 = icmp eq void (...)* %291, bitcast (i32 (i32, %struct._IO_FILE*)* @ungetc to void (...)*)
  br i1 %292, label %317, label %293

; <label>:293                                     ; preds = %290
  %294 = load void (...)** %2, align 8
  %295 = icmp eq void (...)* %294, bitcast (i32 (i8*)* @unlink to void (...)*)
  br i1 %295, label %317, label %296

; <label>:296                                     ; preds = %293
  %297 = load void (...)** %2, align 8
  %298 = icmp eq void (...)* %297, bitcast (i32 (i8*, %struct.utimbuf*)* @utime to void (...)*)
  br i1 %298, label %317, label %299

; <label>:299                                     ; preds = %296
  %300 = load void (...)** %2, align 8
  %301 = icmp eq void (...)* %300, bitcast (i32 (%struct._IO_FILE*, i8*, %struct.__va_list_tag*)* @vfprintf to void (...)*)
  br i1 %301, label %317, label %302

; <label>:302                                     ; preds = %299
  %303 = load void (...)** %2, align 8
  %304 = icmp eq void (...)* %303, bitcast (i32 (i8*, %struct.__va_list_tag*)* @vprintf to void (...)*)
  br i1 %304, label %317, label %305

; <label>:305                                     ; preds = %302
  %306 = load void (...)** %2, align 8
  %307 = icmp eq void (...)* %306, bitcast (i32 (i8*, i8*, %struct.__va_list_tag*)* @vsprintf to void (...)*)
  br i1 %307, label %317, label %308

; <label>:308                                     ; preds = %305
  %309 = load void (...)** %2, align 8
  %310 = icmp eq void (...)* %309, bitcast (i64 (i8*, i32*, i64)* @wcstombs to void (...)*)
  br i1 %310, label %317, label %311

; <label>:311                                     ; preds = %308
  %312 = load void (...)** %2, align 8
  %313 = icmp eq void (...)* %312, bitcast (i32 (i8*, i32)* @wctomb to void (...)*)
  br i1 %313, label %317, label %314

; <label>:314                                     ; preds = %311
  %315 = load void (...)** %2, align 8
  %316 = icmp eq void (...)* %315, bitcast (i64 (i32, i8*, i64)* @write to void (...)*)
  br i1 %316, label %317, label %318

; <label>:317                                     ; preds = %314, %311, %308, %305, %302, %299, %296, %293, %290, %287, %284, %281, %278, %275, %272, %269, %266, %263, %260, %257, %254, %251, %248, %245, %242, %239, %236, %233, %230, %227, %224, %221, %218, %215, %212, %209, %206, %203, %200, %197, %194, %191, %188, %185, %182, %179, %176, %173, %170, %167, %164, %161, %158, %155, %152, %149, %146, %143, %140, %137, %134, %131, %128, %125, %122, %119, %116, %113, %110, %107, %104, %101, %98, %95, %92, %89, %86, %83, %80, %77, %74, %71, %68, %65, %62, %59, %56, %53, %50, %47, %44, %41, %38, %35, %32, %29, %26, %23, %20, %17, %14, %11, %8, %5, %0
  store i32 1, i32* %1
  br label %319

; <label>:318                                     ; preds = %314
  store i32 0, i32* %1
  br label %319

; <label>:319                                     ; preds = %318, %317
  %320 = load i32* %1
  ret i32 %320
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @getc(%struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i8* @memmove(i8*, i8*, i64) #3

; Function Attrs: nounwind
declare i8* @memset(i8*, i32, i64) #3

declare i32 @putc(i32, %struct._IO_FILE*) #1

declare i32 @__isoc99_scanf(i8*, ...) #1

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #3

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8*, i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @_RV_global_init_code() #0 {
  %1 = call %struct._RV_stat_node* @_RV_stat_node_create(i32 1, i64 1)
  store %struct._RV_stat_node* %1, %struct._RV_stat_node** @_RV_function_sa, align 8
  %2 = call %struct._RV_stat_node* @_RV_stat_node_create(i32 2, i64 1)
  store %struct._RV_stat_node* %2, %struct._RV_stat_node** @_RV_global_sa, align 8
  %3 = call %struct._RV_stat_node* @_RV_stat_node_create(i32 3, i64 1)
  store %struct._RV_stat_node* %3, %struct._RV_stat_node** @_RV_static_sa, align 8
  %4 = call %struct._RV_stat_node* @_RV_stat_node_create(i32 6, i64 1)
  store %struct._RV_stat_node* %4, %struct._RV_stat_node** @_RV_library_sa, align 8
  call void @_RV_stdio_init_code()
  ret void
}

; Function Attrs: nounwind uwtable
define void @_RV_global_clear_code() #0 {
  call void @_RV_stdio_clear_code()
  %1 = load %struct._RV_stat_node** @_RV_function_sa, align 8
  %2 = call i32 @_RV_stat_node_dec(%struct._RV_stat_node* %1)
  %3 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %4 = call i32 @_RV_stat_node_dec(%struct._RV_stat_node* %3)
  %5 = load %struct._RV_stat_node** @_RV_static_sa, align 8
  %6 = call i32 @_RV_stat_node_dec(%struct._RV_stat_node* %5)
  %7 = load %struct._RV_stat_node** @_RV_library_sa, align 8
  %8 = call i32 @_RV_stat_node_dec(%struct._RV_stat_node* %7)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @_RV_main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8**, align 8
  %_RV_stack_sa = alloca %struct._RV_stat_node*, align 8
  %_RV_ret_flag = alloca i8, align 1
  %_RV_ret_val = alloca i32, align 4
  %_RV_pmd_argv_42907248 = alloca %struct._RV_pmd, align 8
  %_RV_pmd_tmp_42910624 = alloca %struct._RV_pmd, align 8
  %_RV_pmd_A_42912336 = alloca %struct._RV_pmd, align 8
  %_RV_pmd_B_42914000 = alloca %struct._RV_pmd, align 8
  %_RV_pmd_C_42916256 = alloca %struct._RV_pmd, align 8
  %_RV_pmd_D_42917920 = alloca %struct._RV_pmd, align 8
  %_RV_param_pmds = alloca %struct._RV_pmd*, align 8
  %dump_code = alloca i32, align 4
  %ni = alloca i32, align 4
  %nj = alloca i32, align 4
  %nk = alloca i32, align 4
  %nl = alloca i32, align 4
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %tmp = alloca double*, align 8
  %A = alloca double*, align 8
  %B = alloca double*, align 8
  %C = alloca double*, align 8
  %D = alloca double*, align 8
  store i32 %argc, i32* %1, align 4
  store i8** %argv, i8*** %2, align 8
  %3 = call %struct._RV_stat_node* @_RV_stat_node_create(i32 5, i64 1)
  store %struct._RV_stat_node* %3, %struct._RV_stat_node** %_RV_stack_sa, align 8
  store i8 0, i8* %_RV_ret_flag, align 1
  %4 = bitcast %struct._RV_pmd* %_RV_pmd_argv_42907248 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* bitcast ({ i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] }* @_RV_main._RV_pmd_argv_42907248 to i8*), i64 32, i32 8, i1 false)
  %5 = bitcast %struct._RV_pmd* %_RV_pmd_tmp_42910624 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* bitcast ({ i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] }* @_RV_main._RV_pmd_tmp_42910624 to i8*), i64 32, i32 8, i1 false)
  %6 = bitcast %struct._RV_pmd* %_RV_pmd_A_42912336 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* bitcast ({ i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] }* @_RV_main._RV_pmd_A_42912336 to i8*), i64 32, i32 8, i1 false)
  %7 = bitcast %struct._RV_pmd* %_RV_pmd_B_42914000 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* bitcast ({ i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] }* @_RV_main._RV_pmd_B_42914000 to i8*), i64 32, i32 8, i1 false)
  %8 = bitcast %struct._RV_pmd* %_RV_pmd_C_42916256 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* bitcast ({ i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] }* @_RV_main._RV_pmd_C_42916256 to i8*), i64 32, i32 8, i1 false)
  %9 = bitcast %struct._RV_pmd* %_RV_pmd_D_42917920 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* bitcast ({ i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] }* @_RV_main._RV_pmd_D_42917920 to i8*), i64 32, i32 8, i1 false)
  %10 = load i32* %1, align 4
  %11 = load i8*** %2, align 8
  %12 = call %struct._RV_pmd* @_RV_pmd_var_update_argv(i32 %10, %struct._RV_pmd* %_RV_pmd_argv_42907248, i8** %11)
  store %struct._RV_pmd* %12, %struct._RV_pmd** %_RV_param_pmds, align 8
  %13 = load i8*** %2, align 8
  %14 = getelementptr inbounds i8** %13, i64 1
  %15 = call %struct._RV_pmd* @_RV_pmd_tbl_lookup(i8** %14)
  %16 = load i8*** %2, align 8
  %17 = bitcast i8** %16 to i8*
  %zybc_ = bitcast %struct._RV_pmd* %_RV_pmd_argv_42907248 to i8*
  %zybc_1 = bitcast i8* %17 to i8*
  %zyarg_ = inttoptr i64 1 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zyarg_3 = inttoptr i64 8 to i8*
  %zybc_4 = bitcast i8* %zyarg_3 to i8*
  %zybc_5 = bitcast i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0) to i8*
  %zybc_6 = bitcast i8* getelementptr inbounds ([5 x i8]* @.str31, i32 0, i32 0) to i8*
  %zyarg_7 = inttoptr i32 98 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zyarg_9 = inttoptr i32 29 to i8*
  %zybc_10 = bitcast i8* %zyarg_9 to i8*
  %zybc_11 = bitcast i8* getelementptr inbounds ([8 x i8]* @.str32, i32 0, i32 0) to i8*
  %18 = load i8*** %2, align 8
  %19 = getelementptr inbounds i8** %18, i64 1
  %20 = load i8** %19, align 8
  %21 = call i32 @_RV_atoi(%struct._RV_pmd* %15, i8* %20, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str33, i32 0, i32 0), i32 98, i32 24, i8* getelementptr inbounds ([8 x i8]* @.str32, i32 0, i32 0))
  store i32 %21, i32* %dump_code, align 4
  %22 = load i8*** %2, align 8
  %23 = getelementptr inbounds i8** %22, i64 2
  %24 = call %struct._RV_pmd* @_RV_pmd_tbl_lookup(i8** %23)
  %25 = load i8*** %2, align 8
  %26 = bitcast i8** %25 to i8*
  %zybc_12 = bitcast %struct._RV_pmd* %_RV_pmd_argv_42907248 to i8*
  %zybc_13 = bitcast i8* %26 to i8*
  %zyarg_14 = inttoptr i64 2 to i8*
  %zybc_15 = bitcast i8* %zyarg_14 to i8*
  %zyarg_16 = inttoptr i64 8 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zybc_18 = bitcast i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0) to i8*
  %zybc_19 = bitcast i8* getelementptr inbounds ([5 x i8]* @.str31, i32 0, i32 0) to i8*
  %zyarg_20 = inttoptr i32 99 to i8*
  %zybc_21 = bitcast i8* %zyarg_20 to i8*
  %zyarg_22 = inttoptr i32 22 to i8*
  %zybc_23 = bitcast i8* %zyarg_22 to i8*
  %zybc_24 = bitcast i8* getelementptr inbounds ([8 x i8]* @.str34, i32 0, i32 0) to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 1062889430, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_109_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_4, i8* %zybc_5, i8* %zybc_6, i8* %zybc_8, i8* %zybc_10, i8* %zybc_11, i8* %zybc_12, i8* %zybc_13, i8* %zybc_15, i8* %zybc_17, i8* %zybc_18, i8* %zybc_19, i8* %zybc_21, i8* %zybc_23, i8* %zybc_24)
  %27 = load i8*** %2, align 8
  call void @_Z4joinj(i32 1062889430)
  %28 = getelementptr inbounds i8** %27, i64 2
  %29 = load i8** %28, align 8
  %30 = call i32 @_RV_atoi(%struct._RV_pmd* %24, i8* %29, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str33, i32 0, i32 0), i32 99, i32 17, i8* getelementptr inbounds ([8 x i8]* @.str34, i32 0, i32 0))
  store i32 %30, i32* %ni, align 4
  %31 = load i8*** %2, align 8
  %32 = getelementptr inbounds i8** %31, i64 3
  %33 = call %struct._RV_pmd* @_RV_pmd_tbl_lookup(i8** %32)
  %34 = load i8*** %2, align 8
  %35 = bitcast i8** %34 to i8*
  %zybc_25 = bitcast %struct._RV_pmd* %_RV_pmd_argv_42907248 to i8*
  %zybc_26 = bitcast i8* %35 to i8*
  %zyarg_27 = inttoptr i64 3 to i8*
  %zybc_28 = bitcast i8* %zyarg_27 to i8*
  %zyarg_29 = inttoptr i64 8 to i8*
  %zybc_30 = bitcast i8* %zyarg_29 to i8*
  %zybc_31 = bitcast i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0) to i8*
  %zybc_32 = bitcast i8* getelementptr inbounds ([5 x i8]* @.str31, i32 0, i32 0) to i8*
  %zyarg_33 = inttoptr i32 100 to i8*
  %zybc_34 = bitcast i8* %zyarg_33 to i8*
  %zyarg_35 = inttoptr i32 22 to i8*
  %zybc_36 = bitcast i8* %zyarg_35 to i8*
  %zybc_37 = bitcast i8* getelementptr inbounds ([8 x i8]* @.str35, i32 0, i32 0) to i8*
  %36 = load i8*** %2, align 8
  %37 = getelementptr inbounds i8** %36, i64 3
  %38 = load i8** %37, align 8
  %39 = call i32 @_RV_atoi(%struct._RV_pmd* %33, i8* %38, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str33, i32 0, i32 0), i32 100, i32 17, i8* getelementptr inbounds ([8 x i8]* @.str35, i32 0, i32 0))
  store i32 %39, i32* %nj, align 4
  %40 = load i8*** %2, align 8
  %41 = getelementptr inbounds i8** %40, i64 4
  %42 = call %struct._RV_pmd* @_RV_pmd_tbl_lookup(i8** %41)
  %43 = load i8*** %2, align 8
  %44 = bitcast i8** %43 to i8*
  %zybc_38 = bitcast %struct._RV_pmd* %_RV_pmd_argv_42907248 to i8*
  %zybc_39 = bitcast i8* %44 to i8*
  %zyarg_40 = inttoptr i64 4 to i8*
  %zybc_41 = bitcast i8* %zyarg_40 to i8*
  %zyarg_42 = inttoptr i64 8 to i8*
  %zybc_43 = bitcast i8* %zyarg_42 to i8*
  %zybc_44 = bitcast i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0) to i8*
  %zybc_45 = bitcast i8* getelementptr inbounds ([5 x i8]* @.str31, i32 0, i32 0) to i8*
  %zyarg_46 = inttoptr i32 101 to i8*
  %zybc_47 = bitcast i8* %zyarg_46 to i8*
  %zyarg_48 = inttoptr i32 22 to i8*
  %zybc_49 = bitcast i8* %zyarg_48 to i8*
  %zybc_50 = bitcast i8* getelementptr inbounds ([8 x i8]* @.str36, i32 0, i32 0) to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 1618344318, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_110_0, i8* %zybc_25, i8* %zybc_26, i8* %zybc_28, i8* %zybc_30, i8* %zybc_31, i8* %zybc_32, i8* %zybc_34, i8* %zybc_36, i8* %zybc_37, i8* %zybc_38, i8* %zybc_39, i8* %zybc_41, i8* %zybc_43, i8* %zybc_44, i8* %zybc_45, i8* %zybc_47, i8* %zybc_49, i8* %zybc_50)
  %45 = load i8*** %2, align 8
  call void @_Z4joinj(i32 1618344318)
  %46 = getelementptr inbounds i8** %45, i64 4
  %47 = load i8** %46, align 8
  %48 = call i32 @_RV_atoi(%struct._RV_pmd* %42, i8* %47, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str33, i32 0, i32 0), i32 101, i32 17, i8* getelementptr inbounds ([8 x i8]* @.str36, i32 0, i32 0))
  store i32 %48, i32* %nk, align 4
  %49 = load i8*** %2, align 8
  %50 = getelementptr inbounds i8** %49, i64 5
  %51 = call %struct._RV_pmd* @_RV_pmd_tbl_lookup(i8** %50)
  %52 = load i8*** %2, align 8
  %53 = bitcast i8** %52 to i8*
  %zybc_51 = bitcast %struct._RV_pmd* %_RV_pmd_argv_42907248 to i8*
  %zybc_52 = bitcast i8* %53 to i8*
  %zyarg_53 = inttoptr i64 5 to i8*
  %zybc_54 = bitcast i8* %zyarg_53 to i8*
  %zyarg_55 = inttoptr i64 8 to i8*
  %zybc_56 = bitcast i8* %zyarg_55 to i8*
  %zybc_57 = bitcast i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0) to i8*
  %zybc_58 = bitcast i8* getelementptr inbounds ([5 x i8]* @.str31, i32 0, i32 0) to i8*
  %zyarg_59 = inttoptr i32 102 to i8*
  %zybc_60 = bitcast i8* %zyarg_59 to i8*
  %zyarg_61 = inttoptr i32 22 to i8*
  %zybc_62 = bitcast i8* %zyarg_61 to i8*
  %zybc_63 = bitcast i8* getelementptr inbounds ([8 x i8]* @.str37, i32 0, i32 0) to i8*
  %54 = load i8*** %2, align 8
  %55 = getelementptr inbounds i8** %54, i64 5
  %56 = load i8** %55, align 8
  %57 = call i32 @_RV_atoi(%struct._RV_pmd* %51, i8* %56, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str33, i32 0, i32 0), i32 102, i32 17, i8* getelementptr inbounds ([8 x i8]* @.str37, i32 0, i32 0))
  store i32 %57, i32* %nl, align 4
  %58 = load i32* %ni, align 4
  %59 = zext i32 %58 to i64
  %60 = load i32* %nj, align 4
  %61 = zext i32 %60 to i64
  %62 = load i32* %ni, align 4
  %63 = zext i32 %62 to i64
  %64 = load i32* %nj, align 4
  %65 = zext i32 %64 to i64
  %66 = load i32* %ni, align 4
  %67 = load i32* %nj, align 4
  %68 = mul nsw i32 %66, %67
  %69 = sext i32 %68 to i64
  %70 = mul i64 %69, 8
  %71 = call i8* @_RV_malloc(%struct._RV_pmd* %_RV_pmd_tmp_42910624, i64 %70)
  %72 = bitcast i8* %71 to double*
  store double* %72, double** %tmp, align 8
  %73 = load i32* %ni, align 4
  %74 = zext i32 %73 to i64
  %75 = load i32* %nk, align 4
  %76 = zext i32 %75 to i64
  %77 = load i32* %ni, align 4
  %78 = zext i32 %77 to i64
  %79 = load i32* %nk, align 4
  %80 = zext i32 %79 to i64
  %81 = load i32* %ni, align 4
  %82 = load i32* %nk, align 4
  %83 = mul nsw i32 %81, %82
  %84 = sext i32 %83 to i64
  %85 = mul i64 %84, 8
  %86 = call i8* @_RV_malloc(%struct._RV_pmd* %_RV_pmd_A_42912336, i64 %85)
  %87 = bitcast i8* %86 to double*
  store double* %87, double** %A, align 8
  %88 = load i32* %nk, align 4
  %89 = zext i32 %88 to i64
  %90 = load i32* %nj, align 4
  %91 = zext i32 %90 to i64
  %92 = load i32* %nk, align 4
  %93 = zext i32 %92 to i64
  %94 = load i32* %nj, align 4
  %95 = zext i32 %94 to i64
  %96 = load i32* %nk, align 4
  %97 = load i32* %nj, align 4
  %98 = mul nsw i32 %96, %97
  %99 = sext i32 %98 to i64
  %100 = mul i64 %99, 8
  %101 = call i8* @_RV_malloc(%struct._RV_pmd* %_RV_pmd_B_42914000, i64 %100)
  %102 = bitcast i8* %101 to double*
  store double* %102, double** %B, align 8
  %103 = load i32* %nl, align 4
  %104 = zext i32 %103 to i64
  %105 = load i32* %nj, align 4
  %106 = zext i32 %105 to i64
  %107 = load i32* %nl, align 4
  %108 = zext i32 %107 to i64
  %109 = load i32* %nj, align 4
  %110 = zext i32 %109 to i64
  %111 = load i32* %nl, align 4
  %112 = load i32* %nj, align 4
  %113 = mul nsw i32 %111, %112
  %114 = sext i32 %113 to i64
  %115 = mul i64 %114, 8
  %116 = call i8* @_RV_malloc(%struct._RV_pmd* %_RV_pmd_C_42916256, i64 %115)
  %117 = bitcast i8* %116 to double*
  store double* %117, double** %C, align 8
  %118 = load i32* %ni, align 4
  %119 = zext i32 %118 to i64
  %120 = load i32* %nl, align 4
  %121 = zext i32 %120 to i64
  %122 = load i32* %ni, align 4
  %123 = zext i32 %122 to i64
  %124 = load i32* %nl, align 4
  %125 = zext i32 %124 to i64
  %126 = load i32* %ni, align 4
  %127 = load i32* %nl, align 4
  %128 = mul nsw i32 %126, %127
  %129 = sext i32 %128 to i64
  %130 = mul i64 %129, 8
  %131 = call i8* @_RV_malloc(%struct._RV_pmd* %_RV_pmd_D_42917920, i64 %130)
  %132 = bitcast i8* %131 to double*
  store double* %132, double** %D, align 8
  %133 = load %struct._RV_stat_node** %_RV_stack_sa, align 8
  %134 = bitcast double* %alpha to i8*
  %135 = getelementptr inbounds double* %alpha, i64 1
  %136 = bitcast double* %135 to i8*
  %137 = call %struct._RV_pmd* @_RV_pmd_create(i8** null, %struct._RV_stat_node* %133, i32 5, i8* %134, i8* %136)
  %138 = load %struct._RV_stat_node** %_RV_stack_sa, align 8
  %139 = bitcast double* %beta to i8*
  %140 = getelementptr inbounds double* %beta, i64 1
  %141 = bitcast double* %140 to i8*
  %142 = call %struct._RV_pmd* @_RV_pmd_create(i8** null, %struct._RV_stat_node* %138, i32 5, i8* %139, i8* %141)
  %143 = load i32* %ni, align 4
  %144 = load i32* %nj, align 4
  %145 = load i32* %nk, align 4
  %146 = load i32* %nl, align 4
  %147 = load i32* %ni, align 4
  %148 = zext i32 %147 to i64
  %149 = load i32* %nk, align 4
  %150 = zext i32 %149 to i64
  %151 = load double** %A, align 8
  %152 = bitcast double* %151 to i8*
  %153 = load i32* %ni, align 4
  %154 = zext i32 %153 to i64
  %155 = load i32* %nk, align 4
  %156 = zext i32 %155 to i64
  %157 = mul nuw i64 %154, %156
  %158 = mul nuw i64 8, %157
  %zybc_64 = bitcast %struct._RV_pmd* %_RV_pmd_A_42912336 to i8*
  %zybc_65 = bitcast i8* %152 to i8*
  %zyarg_66 = inttoptr i64 %158 to i8*
  %zybc_67 = bitcast i8* %zyarg_66 to i8*
  %zybc_68 = bitcast i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0) to i8*
  %zybc_69 = bitcast i8* getelementptr inbounds ([5 x i8]* @.str31, i32 0, i32 0) to i8*
  %zyarg_70 = inttoptr i32 115 to i8*
  %zybc_71 = bitcast i8* %zyarg_70 to i8*
  %zyarg_72 = inttoptr i32 8 to i8*
  %zybc_73 = bitcast i8* %zyarg_72 to i8*
  %zybc_74 = bitcast i8* getelementptr inbounds ([2 x i8]* @.str38, i32 0, i32 0) to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 -897359131, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_111_0, i8* %zybc_51, i8* %zybc_52, i8* %zybc_54, i8* %zybc_56, i8* %zybc_57, i8* %zybc_58, i8* %zybc_60, i8* %zybc_62, i8* %zybc_63, i8* %zybc_64, i8* %zybc_65, i8* %zybc_67, i8* %zybc_68, i8* %zybc_69, i8* %zybc_71, i8* %zybc_73, i8* %zybc_74)
  call void @_Z4joinj(i32 -897359131)
  %159 = bitcast i8* %152 to double*
  %160 = load i32* %nk, align 4
  %161 = zext i32 %160 to i64
  %162 = load i32* %nj, align 4
  %163 = zext i32 %162 to i64
  %164 = load double** %B, align 8
  %165 = bitcast double* %164 to i8*
  %166 = load i32* %nk, align 4
  %167 = zext i32 %166 to i64
  %168 = load i32* %nj, align 4
  %169 = zext i32 %168 to i64
  %170 = mul nuw i64 %167, %169
  %171 = mul nuw i64 8, %170
  %zybc_75 = bitcast %struct._RV_pmd* %_RV_pmd_B_42914000 to i8*
  %zybc_76 = bitcast i8* %165 to i8*
  %zyarg_77 = inttoptr i64 %171 to i8*
  %zybc_78 = bitcast i8* %zyarg_77 to i8*
  %zybc_79 = bitcast i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0) to i8*
  %zybc_80 = bitcast i8* getelementptr inbounds ([5 x i8]* @.str31, i32 0, i32 0) to i8*
  %zyarg_81 = inttoptr i32 116 to i8*
  %zybc_82 = bitcast i8* %zyarg_81 to i8*
  %zyarg_83 = inttoptr i32 8 to i8*
  %zybc_84 = bitcast i8* %zyarg_83 to i8*
  %zybc_85 = bitcast i8* getelementptr inbounds ([2 x i8]* @.str39, i32 0, i32 0) to i8*
  %172 = bitcast i8* %165 to double*
  %173 = load i32* %nl, align 4
  %174 = zext i32 %173 to i64
  %175 = load i32* %nj, align 4
  %176 = zext i32 %175 to i64
  %177 = load double** %C, align 8
  %178 = bitcast double* %177 to i8*
  %179 = load i32* %nl, align 4
  %180 = zext i32 %179 to i64
  %181 = load i32* %nj, align 4
  %182 = zext i32 %181 to i64
  %183 = mul nuw i64 %180, %182
  %184 = mul nuw i64 8, %183
  %zybc_86 = bitcast %struct._RV_pmd* %_RV_pmd_C_42916256 to i8*
  %zybc_87 = bitcast i8* %178 to i8*
  %zyarg_88 = inttoptr i64 %184 to i8*
  %zybc_89 = bitcast i8* %zyarg_88 to i8*
  %zybc_90 = bitcast i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0) to i8*
  %zybc_91 = bitcast i8* getelementptr inbounds ([5 x i8]* @.str31, i32 0, i32 0) to i8*
  %zyarg_92 = inttoptr i32 117 to i8*
  %zybc_93 = bitcast i8* %zyarg_92 to i8*
  %zyarg_94 = inttoptr i32 8 to i8*
  %zybc_95 = bitcast i8* %zyarg_94 to i8*
  %zybc_96 = bitcast i8* getelementptr inbounds ([2 x i8]* @.str40, i32 0, i32 0) to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 1874224732, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_112_0, i8* %zybc_75, i8* %zybc_76, i8* %zybc_78, i8* %zybc_79, i8* %zybc_80, i8* %zybc_82, i8* %zybc_84, i8* %zybc_85, i8* %zybc_86, i8* %zybc_87, i8* %zybc_89, i8* %zybc_90, i8* %zybc_91, i8* %zybc_93, i8* %zybc_95, i8* %zybc_96)
  call void @_Z4joinj(i32 1874224732)
  %185 = bitcast i8* %178 to double*
  %186 = load i32* %ni, align 4
  %187 = zext i32 %186 to i64
  %188 = load i32* %nl, align 4
  %189 = zext i32 %188 to i64
  %190 = load double** %D, align 8
  %191 = bitcast double* %190 to i8*
  %192 = load i32* %ni, align 4
  %193 = zext i32 %192 to i64
  %194 = load i32* %nl, align 4
  %195 = zext i32 %194 to i64
  %196 = mul nuw i64 %193, %195
  %197 = mul nuw i64 8, %196
  %zybc_97 = bitcast %struct._RV_pmd* %_RV_pmd_D_42917920 to i8*
  %zybc_98 = bitcast i8* %191 to i8*
  %zyarg_99 = inttoptr i64 %197 to i8*
  %zybc_100 = bitcast i8* %zyarg_99 to i8*
  %zybc_101 = bitcast i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0) to i8*
  %zybc_102 = bitcast i8* getelementptr inbounds ([5 x i8]* @.str31, i32 0, i32 0) to i8*
  %zyarg_103 = inttoptr i32 118 to i8*
  %zybc_104 = bitcast i8* %zyarg_103 to i8*
  %zyarg_105 = inttoptr i32 8 to i8*
  %zybc_106 = bitcast i8* %zyarg_105 to i8*
  %zybc_107 = bitcast i8* getelementptr inbounds ([2 x i8]* @.str41, i32 0, i32 0) to i8*
  %198 = bitcast i8* %191 to double*
  call void @_RV_init_array(%struct._RV_pmd* %137, %struct._RV_pmd* %142, %struct._RV_pmd* %_RV_pmd_A_42912336, %struct._RV_pmd* %_RV_pmd_B_42914000, %struct._RV_pmd* %_RV_pmd_C_42916256, %struct._RV_pmd* %_RV_pmd_D_42917920, i32 %143, i32 %144, i32 %145, i32 %146, double* %alpha, double* %beta, double* %159, double* %172, double* %185, double* %198)
  %199 = load i32* %ni, align 4
  %200 = load i32* %nj, align 4
  %201 = load i32* %nk, align 4
  %202 = load i32* %nl, align 4
  %203 = load double* %alpha, align 8
  %204 = load double* %beta, align 8
  %205 = load i32* %ni, align 4
  %206 = zext i32 %205 to i64
  %207 = load i32* %nj, align 4
  %208 = zext i32 %207 to i64
  %209 = load double** %tmp, align 8
  %210 = bitcast double* %209 to i8*
  %211 = load i32* %ni, align 4
  %212 = zext i32 %211 to i64
  %213 = load i32* %nj, align 4
  %214 = zext i32 %213 to i64
  %215 = mul nuw i64 %212, %214
  %216 = mul nuw i64 8, %215
  %zybc_108 = bitcast %struct._RV_pmd* %_RV_pmd_tmp_42910624 to i8*
  %zybc_109 = bitcast i8* %210 to i8*
  %zyarg_110 = inttoptr i64 %216 to i8*
  %zybc_111 = bitcast i8* %zyarg_110 to i8*
  %zybc_112 = bitcast i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0) to i8*
  %zybc_113 = bitcast i8* getelementptr inbounds ([5 x i8]* @.str31, i32 0, i32 0) to i8*
  %zyarg_114 = inttoptr i32 125 to i8*
  %zybc_115 = bitcast i8* %zyarg_114 to i8*
  %zyarg_116 = inttoptr i32 8 to i8*
  %zybc_117 = bitcast i8* %zyarg_116 to i8*
  %zybc_118 = bitcast i8* getelementptr inbounds ([4 x i8]* @.str42, i32 0, i32 0) to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 506350364, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_113_0, i8* %zybc_97, i8* %zybc_98, i8* %zybc_100, i8* %zybc_101, i8* %zybc_102, i8* %zybc_104, i8* %zybc_106, i8* %zybc_107, i8* %zybc_108, i8* %zybc_109, i8* %zybc_111, i8* %zybc_112, i8* %zybc_113, i8* %zybc_115, i8* %zybc_117, i8* %zybc_118)
  call void @_Z4joinj(i32 506350364)
  %217 = bitcast i8* %210 to double*
  %218 = load i32* %ni, align 4
  %219 = zext i32 %218 to i64
  %220 = load i32* %nk, align 4
  %221 = zext i32 %220 to i64
  %222 = load double** %A, align 8
  %223 = bitcast double* %222 to i8*
  %224 = load i32* %ni, align 4
  %225 = zext i32 %224 to i64
  %226 = load i32* %nk, align 4
  %227 = zext i32 %226 to i64
  %228 = mul nuw i64 %225, %227
  %229 = mul nuw i64 8, %228
  %zybc_119 = bitcast %struct._RV_pmd* %_RV_pmd_A_42912336 to i8*
  %zybc_120 = bitcast i8* %223 to i8*
  %zyarg_121 = inttoptr i64 %229 to i8*
  %zybc_122 = bitcast i8* %zyarg_121 to i8*
  %zybc_123 = bitcast i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0) to i8*
  %zybc_124 = bitcast i8* getelementptr inbounds ([5 x i8]* @.str31, i32 0, i32 0) to i8*
  %zyarg_125 = inttoptr i32 126 to i8*
  %zybc_126 = bitcast i8* %zyarg_125 to i8*
  %zyarg_127 = inttoptr i32 8 to i8*
  %zybc_128 = bitcast i8* %zyarg_127 to i8*
  %zybc_129 = bitcast i8* getelementptr inbounds ([2 x i8]* @.str38, i32 0, i32 0) to i8*
  %230 = bitcast i8* %223 to double*
  %231 = load i32* %nk, align 4
  %232 = zext i32 %231 to i64
  %233 = load i32* %nj, align 4
  %234 = zext i32 %233 to i64
  %235 = load double** %B, align 8
  %236 = bitcast double* %235 to i8*
  %237 = load i32* %nk, align 4
  %238 = zext i32 %237 to i64
  %239 = load i32* %nj, align 4
  %240 = zext i32 %239 to i64
  %241 = mul nuw i64 %238, %240
  %242 = mul nuw i64 8, %241
  %zybc_130 = bitcast %struct._RV_pmd* %_RV_pmd_B_42914000 to i8*
  %zybc_131 = bitcast i8* %236 to i8*
  %zyarg_132 = inttoptr i64 %242 to i8*
  %zybc_133 = bitcast i8* %zyarg_132 to i8*
  %zybc_134 = bitcast i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0) to i8*
  %zybc_135 = bitcast i8* getelementptr inbounds ([5 x i8]* @.str31, i32 0, i32 0) to i8*
  %zyarg_136 = inttoptr i32 127 to i8*
  %zybc_137 = bitcast i8* %zyarg_136 to i8*
  %zyarg_138 = inttoptr i32 8 to i8*
  %zybc_139 = bitcast i8* %zyarg_138 to i8*
  %zybc_140 = bitcast i8* getelementptr inbounds ([2 x i8]* @.str39, i32 0, i32 0) to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 -1296497316, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_114_0, i8* %zybc_119, i8* %zybc_120, i8* %zybc_122, i8* %zybc_123, i8* %zybc_124, i8* %zybc_126, i8* %zybc_128, i8* %zybc_129, i8* %zybc_130, i8* %zybc_131, i8* %zybc_133, i8* %zybc_134, i8* %zybc_135, i8* %zybc_137, i8* %zybc_139, i8* %zybc_140)
  call void @_Z4joinj(i32 -1296497316)
  %243 = bitcast i8* %236 to double*
  %244 = load i32* %nl, align 4
  %245 = zext i32 %244 to i64
  %246 = load i32* %nj, align 4
  %247 = zext i32 %246 to i64
  %248 = load double** %C, align 8
  %249 = bitcast double* %248 to i8*
  %250 = load i32* %nl, align 4
  %251 = zext i32 %250 to i64
  %252 = load i32* %nj, align 4
  %253 = zext i32 %252 to i64
  %254 = mul nuw i64 %251, %253
  %255 = mul nuw i64 8, %254
  %zybc_141 = bitcast %struct._RV_pmd* %_RV_pmd_C_42916256 to i8*
  %zybc_142 = bitcast i8* %249 to i8*
  %zyarg_143 = inttoptr i64 %255 to i8*
  %zybc_144 = bitcast i8* %zyarg_143 to i8*
  %zybc_145 = bitcast i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0) to i8*
  %zybc_146 = bitcast i8* getelementptr inbounds ([5 x i8]* @.str31, i32 0, i32 0) to i8*
  %zyarg_147 = inttoptr i32 128 to i8*
  %zybc_148 = bitcast i8* %zyarg_147 to i8*
  %zyarg_149 = inttoptr i32 8 to i8*
  %zybc_150 = bitcast i8* %zyarg_149 to i8*
  %zybc_151 = bitcast i8* getelementptr inbounds ([2 x i8]* @.str40, i32 0, i32 0) to i8*
  %256 = bitcast i8* %249 to double*
  %257 = load i32* %ni, align 4
  %258 = zext i32 %257 to i64
  %259 = load i32* %nl, align 4
  %260 = zext i32 %259 to i64
  %261 = load double** %D, align 8
  %262 = bitcast double* %261 to i8*
  %263 = load i32* %ni, align 4
  %264 = zext i32 %263 to i64
  %265 = load i32* %nl, align 4
  %266 = zext i32 %265 to i64
  %267 = mul nuw i64 %264, %266
  %268 = mul nuw i64 8, %267
  %zybc_152 = bitcast %struct._RV_pmd* %_RV_pmd_D_42917920 to i8*
  %zybc_153 = bitcast i8* %262 to i8*
  %zyarg_154 = inttoptr i64 %268 to i8*
  %zybc_155 = bitcast i8* %zyarg_154 to i8*
  %zybc_156 = bitcast i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0) to i8*
  %zybc_157 = bitcast i8* getelementptr inbounds ([5 x i8]* @.str31, i32 0, i32 0) to i8*
  %zyarg_158 = inttoptr i32 129 to i8*
  %zybc_159 = bitcast i8* %zyarg_158 to i8*
  %zyarg_160 = inttoptr i32 8 to i8*
  %zybc_161 = bitcast i8* %zyarg_160 to i8*
  %zybc_162 = bitcast i8* getelementptr inbounds ([2 x i8]* @.str41, i32 0, i32 0) to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 -366832982, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_115_0, i8* %zybc_141, i8* %zybc_142, i8* %zybc_144, i8* %zybc_145, i8* %zybc_146, i8* %zybc_148, i8* %zybc_150, i8* %zybc_151, i8* %zybc_152, i8* %zybc_153, i8* %zybc_155, i8* %zybc_156, i8* %zybc_157, i8* %zybc_159, i8* %zybc_161, i8* %zybc_162)
  call void @_Z4joinj(i32 -366832982)
  %269 = bitcast i8* %262 to double*
  call void @_RV_kernel_2mm(%struct._RV_pmd* %_RV_pmd_tmp_42910624, %struct._RV_pmd* %_RV_pmd_A_42912336, %struct._RV_pmd* %_RV_pmd_B_42914000, %struct._RV_pmd* %_RV_pmd_C_42916256, %struct._RV_pmd* %_RV_pmd_D_42917920, i32 %199, i32 %200, i32 %201, i32 %202, double %203, double %204, double* %217, double* %230, double* %243, double* %256, double* %269)
  %270 = load i32* %dump_code, align 4
  %271 = icmp eq i32 %270, 1
  br i1 %271, label %272, label %293

; <label>:272                                     ; preds = %0
  %273 = load i32* %ni, align 4
  %274 = load i32* %nl, align 4
  %275 = load i32* %ni, align 4
  %276 = zext i32 %275 to i64
  %277 = load i32* %nl, align 4
  %278 = zext i32 %277 to i64
  %279 = load double** %D, align 8
  %280 = bitcast double* %279 to i8*
  %281 = load i32* %ni, align 4
  %282 = zext i32 %281 to i64
  %283 = load i32* %nl, align 4
  %284 = zext i32 %283 to i64
  %285 = mul nuw i64 %282, %284
  %286 = mul nuw i64 8, %285
  %zybc_163 = bitcast %struct._RV_pmd* %_RV_pmd_D_42917920 to i8*
  %zybc_164 = bitcast i8* %280 to i8*
  %zyarg_165 = inttoptr i64 %286 to i8*
  %zybc_166 = bitcast i8* %zyarg_165 to i8*
  %zybc_167 = bitcast i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0) to i8*
  %zybc_168 = bitcast i8* getelementptr inbounds ([5 x i8]* @.str31, i32 0, i32 0) to i8*
  %zyarg_169 = inttoptr i32 135 to i8*
  %zybc_170 = bitcast i8* %zyarg_169 to i8*
  %zyarg_171 = inttoptr i32 44 to i8*
  %zybc_172 = bitcast i8* %zyarg_171 to i8*
  %zybc_173 = bitcast i8* getelementptr inbounds ([2 x i8]* @.str41, i32 0, i32 0) to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 227519921, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_116_0, i8* %zybc_163, i8* %zybc_164, i8* %zybc_166, i8* %zybc_167, i8* %zybc_168, i8* %zybc_170, i8* %zybc_172, i8* %zybc_173)
  call void @_Z4joinj(i32 227519921)
  %287 = bitcast i8* %280 to double*
  call void @_RV_print_array(%struct._RV_pmd* %_RV_pmd_D_42917920, i32 %273, i32 %274, double* %287)
  br label %288

; <label>:288                                     ; preds = %272
  %289 = load i8* %_RV_ret_flag, align 1
  %290 = icmp ne i8 %289, 0
  br i1 %290, label %291, label %292

; <label>:291                                     ; preds = %288
  br label %304

; <label>:292                                     ; preds = %288
  br label %293

; <label>:293                                     ; preds = %292, %0
  %294 = load double** %tmp, align 8
  %295 = bitcast double* %294 to i8*
  call void @_RV_free(%struct._RV_pmd* %_RV_pmd_tmp_42910624, i8* %295, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str43, i32 0, i32 0), i32 138, i32 8, i8* getelementptr inbounds ([12 x i8]* @.str44, i32 0, i32 0))
  %296 = load double** %A, align 8
  %297 = bitcast double* %296 to i8*
  call void @_RV_free(%struct._RV_pmd* %_RV_pmd_A_42912336, i8* %297, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str43, i32 0, i32 0), i32 139, i32 8, i8* getelementptr inbounds ([10 x i8]* @.str45, i32 0, i32 0))
  %298 = load double** %B, align 8
  %299 = bitcast double* %298 to i8*
  call void @_RV_free(%struct._RV_pmd* %_RV_pmd_B_42914000, i8* %299, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str43, i32 0, i32 0), i32 140, i32 8, i8* getelementptr inbounds ([10 x i8]* @.str46, i32 0, i32 0))
  %300 = load double** %C, align 8
  %301 = bitcast double* %300 to i8*
  call void @_RV_free(%struct._RV_pmd* %_RV_pmd_C_42916256, i8* %301, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str43, i32 0, i32 0), i32 141, i32 8, i8* getelementptr inbounds ([10 x i8]* @.str47, i32 0, i32 0))
  %302 = load double** %D, align 8
  %303 = bitcast double* %302 to i8*
  call void @_RV_free(%struct._RV_pmd* %_RV_pmd_D_42917920, i8* %303, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str43, i32 0, i32 0), i32 142, i32 8, i8* getelementptr inbounds ([10 x i8]* @.str48, i32 0, i32 0))
  store i8 1, i8* %_RV_ret_flag, align 1
  store i32 0, i32* %_RV_ret_val, align 4
  br label %304

; <label>:304                                     ; preds = %293, %291
  %305 = load i32* %1, align 4
  %306 = load i8*** %2, align 8
  call void @_RV_pmd_var_remove_argv(i32 %305, %struct._RV_pmd* %_RV_pmd_argv_42907248, i8** %306)
  call void @_RV_pmd_set_null(%struct._RV_pmd* %_RV_pmd_tmp_42910624)
  call void @_RV_pmd_set_null(%struct._RV_pmd* %_RV_pmd_A_42912336)
  call void @_RV_pmd_set_null(%struct._RV_pmd* %_RV_pmd_B_42914000)
  call void @_RV_pmd_set_null(%struct._RV_pmd* %_RV_pmd_C_42916256)
  call void @_RV_pmd_set_null(%struct._RV_pmd* %_RV_pmd_D_42917920)
  %307 = load %struct._RV_stat_node** %_RV_stack_sa, align 8
  %308 = getelementptr inbounds %struct._RV_stat_node* %307, i32 0, i32 0
  store i32 0, i32* %308, align 4
  %309 = load %struct._RV_stat_node** %_RV_stack_sa, align 8
  %310 = call i32 @_RV_stat_node_dec(%struct._RV_stat_node* %309)
  %311 = load i32* %_RV_ret_val, align 4
  ret i32 %311
}

; Function Attrs: nounwind uwtable
define internal void @_RV_init_array(%struct._RV_pmd* %p5_pmd, %struct._RV_pmd* %p6_pmd, %struct._RV_pmd* %p7_pmd, %struct._RV_pmd* %p8_pmd, %struct._RV_pmd* %p9_pmd, %struct._RV_pmd* %p10_pmd, i32 %ni, i32 %nj, i32 %nk, i32 %nl, double* %p5, double* %p6, double* %p7, double* %p8, double* %p9, double* %p10) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._RV_pmd*, align 8
  %4 = alloca %struct._RV_pmd*, align 8
  %5 = alloca %struct._RV_pmd*, align 8
  %6 = alloca %struct._RV_pmd*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca double*, align 8
  %12 = alloca double*, align 8
  %13 = alloca double*, align 8
  %14 = alloca double*, align 8
  %15 = alloca double*, align 8
  %16 = alloca double*, align 8
  store %struct._RV_pmd* %p5_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %p6_pmd, %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %p7_pmd, %struct._RV_pmd** %3, align 8
  store %struct._RV_pmd* %p8_pmd, %struct._RV_pmd** %4, align 8
  store %struct._RV_pmd* %p9_pmd, %struct._RV_pmd** %5, align 8
  store %struct._RV_pmd* %p10_pmd, %struct._RV_pmd** %6, align 8
  store i32 %ni, i32* %7, align 4
  store i32 %nj, i32* %8, align 4
  store i32 %nk, i32* %9, align 4
  store i32 %nl, i32* %10, align 4
  store double* %p5, double** %11, align 8
  store double* %p6, double** %12, align 8
  store double* %p7, double** %13, align 8
  store double* %p8, double** %14, align 8
  store double* %p9, double** %15, align 8
  store double* %p10, double** %16, align 8
  %17 = load i32* %7, align 4
  %18 = zext i32 %17 to i64
  %19 = load i32* %10, align 4
  %20 = zext i32 %19 to i64
  %21 = load i32* %9, align 4
  %22 = zext i32 %21 to i64
  %23 = load i32* %8, align 4
  %24 = zext i32 %23 to i64
  %25 = load i32* %10, align 4
  %26 = zext i32 %25 to i64
  %27 = load i32* %8, align 4
  %28 = zext i32 %27 to i64
  %29 = load i32* %7, align 4
  %30 = zext i32 %29 to i64
  %31 = load i32* %10, align 4
  %32 = zext i32 %31 to i64
  %33 = call %struct._RV_fmd* @_RV_fmd_tbl_create(void (...)* bitcast (void (i32, i32, i32, i32, double*, double*, double*, double*, double*, double*)* @init_array to void (...)*), i8 zeroext 6)
  %34 = load %struct._RV_pmd** %1, align 8
  %35 = call %struct._RV_fmd* @_RV_fmd_tbl_update_pmd(void (...)* bitcast (void (i32, i32, i32, i32, double*, double*, double*, double*, double*, double*)* @init_array to void (...)*), i8 zeroext 0, %struct._RV_pmd* %34)
  %36 = load %struct._RV_pmd** %2, align 8
  %37 = call %struct._RV_fmd* @_RV_fmd_tbl_update_pmd(void (...)* bitcast (void (i32, i32, i32, i32, double*, double*, double*, double*, double*, double*)* @init_array to void (...)*), i8 zeroext 1, %struct._RV_pmd* %36)
  %38 = load %struct._RV_pmd** %3, align 8
  %39 = call %struct._RV_fmd* @_RV_fmd_tbl_update_pmd(void (...)* bitcast (void (i32, i32, i32, i32, double*, double*, double*, double*, double*, double*)* @init_array to void (...)*), i8 zeroext 2, %struct._RV_pmd* %38)
  %40 = load %struct._RV_pmd** %4, align 8
  %41 = call %struct._RV_fmd* @_RV_fmd_tbl_update_pmd(void (...)* bitcast (void (i32, i32, i32, i32, double*, double*, double*, double*, double*, double*)* @init_array to void (...)*), i8 zeroext 3, %struct._RV_pmd* %40)
  %42 = load %struct._RV_pmd** %5, align 8
  %43 = call %struct._RV_fmd* @_RV_fmd_tbl_update_pmd(void (...)* bitcast (void (i32, i32, i32, i32, double*, double*, double*, double*, double*, double*)* @init_array to void (...)*), i8 zeroext 4, %struct._RV_pmd* %42)
  %44 = load %struct._RV_pmd** %6, align 8
  %45 = call %struct._RV_fmd* @_RV_fmd_tbl_update_pmd(void (...)* bitcast (void (i32, i32, i32, i32, double*, double*, double*, double*, double*, double*)* @init_array to void (...)*), i8 zeroext 5, %struct._RV_pmd* %44)
  %46 = load i32* %7, align 4
  %47 = load i32* %8, align 4
  %48 = load i32* %9, align 4
  %49 = load i32* %10, align 4
  %50 = load double** %11, align 8
  %51 = load double** %12, align 8
  %52 = load double** %13, align 8
  %53 = load double** %14, align 8
  %54 = load double** %15, align 8
  %55 = load double** %16, align 8
  call void @init_array(i32 %46, i32 %47, i32 %48, i32 %49, double* %50, double* %51, double* %52, double* %53, double* %54, double* %55)
  call void @_RV_fmd_tbl_remove(void (...)* bitcast (void (i32, i32, i32, i32, double*, double*, double*, double*, double*, double*)* @init_array to void (...)*))
  %56 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %56)
  %57 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %57)
  %58 = load %struct._RV_pmd** %3, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %58)
  %59 = load %struct._RV_pmd** %4, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %59)
  %60 = load %struct._RV_pmd** %5, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %60)
  %61 = load %struct._RV_pmd** %6, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %61)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @_RV_kernel_2mm(%struct._RV_pmd* %p7_pmd, %struct._RV_pmd* %p8_pmd, %struct._RV_pmd* %p9_pmd, %struct._RV_pmd* %p10_pmd, %struct._RV_pmd* %p11_pmd, i32 %ni, i32 %nj, i32 %nk, i32 %nl, double %p5, double %p6, double* %p7, double* %p8, double* %p9, double* %p10, double* %p11) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._RV_pmd*, align 8
  %4 = alloca %struct._RV_pmd*, align 8
  %5 = alloca %struct._RV_pmd*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double*, align 8
  %13 = alloca double*, align 8
  %14 = alloca double*, align 8
  %15 = alloca double*, align 8
  %16 = alloca double*, align 8
  store %struct._RV_pmd* %p7_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %p8_pmd, %struct._RV_pmd** %2, align 8
  store %struct._RV_pmd* %p9_pmd, %struct._RV_pmd** %3, align 8
  store %struct._RV_pmd* %p10_pmd, %struct._RV_pmd** %4, align 8
  store %struct._RV_pmd* %p11_pmd, %struct._RV_pmd** %5, align 8
  store i32 %ni, i32* %6, align 4
  store i32 %nj, i32* %7, align 4
  store i32 %nk, i32* %8, align 4
  store i32 %nl, i32* %9, align 4
  store double %p5, double* %10, align 8
  store double %p6, double* %11, align 8
  store double* %p7, double** %12, align 8
  store double* %p8, double** %13, align 8
  store double* %p9, double** %14, align 8
  store double* %p10, double** %15, align 8
  store double* %p11, double** %16, align 8
  %17 = load i32* %6, align 4
  %18 = zext i32 %17 to i64
  %19 = load i32* %7, align 4
  %20 = zext i32 %19 to i64
  %21 = load i32* %6, align 4
  %22 = zext i32 %21 to i64
  %23 = load i32* %8, align 4
  %24 = zext i32 %23 to i64
  %25 = load i32* %8, align 4
  %26 = zext i32 %25 to i64
  %27 = load i32* %7, align 4
  %28 = zext i32 %27 to i64
  %29 = load i32* %9, align 4
  %30 = zext i32 %29 to i64
  %31 = load i32* %7, align 4
  %32 = zext i32 %31 to i64
  %33 = load i32* %6, align 4
  %34 = zext i32 %33 to i64
  %35 = load i32* %9, align 4
  %36 = zext i32 %35 to i64
  %37 = call %struct._RV_fmd* @_RV_fmd_tbl_create(void (...)* bitcast (void (i32, i32, i32, i32, double, double, double*, double*, double*, double*, double*)* @kernel_2mm to void (...)*), i8 zeroext 5)
  %38 = load %struct._RV_pmd** %1, align 8
  %39 = call %struct._RV_fmd* @_RV_fmd_tbl_update_pmd(void (...)* bitcast (void (i32, i32, i32, i32, double, double, double*, double*, double*, double*, double*)* @kernel_2mm to void (...)*), i8 zeroext 0, %struct._RV_pmd* %38)
  %40 = load %struct._RV_pmd** %2, align 8
  %41 = call %struct._RV_fmd* @_RV_fmd_tbl_update_pmd(void (...)* bitcast (void (i32, i32, i32, i32, double, double, double*, double*, double*, double*, double*)* @kernel_2mm to void (...)*), i8 zeroext 1, %struct._RV_pmd* %40)
  %42 = load %struct._RV_pmd** %3, align 8
  %43 = call %struct._RV_fmd* @_RV_fmd_tbl_update_pmd(void (...)* bitcast (void (i32, i32, i32, i32, double, double, double*, double*, double*, double*, double*)* @kernel_2mm to void (...)*), i8 zeroext 2, %struct._RV_pmd* %42)
  %44 = load %struct._RV_pmd** %4, align 8
  %45 = call %struct._RV_fmd* @_RV_fmd_tbl_update_pmd(void (...)* bitcast (void (i32, i32, i32, i32, double, double, double*, double*, double*, double*, double*)* @kernel_2mm to void (...)*), i8 zeroext 3, %struct._RV_pmd* %44)
  %46 = load %struct._RV_pmd** %5, align 8
  %47 = call %struct._RV_fmd* @_RV_fmd_tbl_update_pmd(void (...)* bitcast (void (i32, i32, i32, i32, double, double, double*, double*, double*, double*, double*)* @kernel_2mm to void (...)*), i8 zeroext 4, %struct._RV_pmd* %46)
  %48 = load i32* %6, align 4
  %49 = load i32* %7, align 4
  %50 = load i32* %8, align 4
  %51 = load i32* %9, align 4
  %52 = load double* %10, align 8
  %53 = load double* %11, align 8
  %54 = load double** %12, align 8
  %55 = load double** %13, align 8
  %56 = load double** %14, align 8
  %57 = load double** %15, align 8
  %58 = load double** %16, align 8
  call void @kernel_2mm(i32 %48, i32 %49, i32 %50, i32 %51, double %52, double %53, double* %54, double* %55, double* %56, double* %57, double* %58)
  call void @_RV_fmd_tbl_remove(void (...)* bitcast (void (i32, i32, i32, i32, double, double, double*, double*, double*, double*, double*)* @kernel_2mm to void (...)*))
  %59 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %59)
  %60 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %60)
  %61 = load %struct._RV_pmd** %3, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %61)
  %62 = load %struct._RV_pmd** %4, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %62)
  %63 = load %struct._RV_pmd** %5, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %63)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @_RV_print_array(%struct._RV_pmd* %p3_pmd, i32 %ni, i32 %nl, double* %p3) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca double*, align 8
  store %struct._RV_pmd* %p3_pmd, %struct._RV_pmd** %1, align 8
  store i32 %ni, i32* %2, align 4
  store i32 %nl, i32* %3, align 4
  store double* %p3, double** %4, align 8
  %5 = load i32* %2, align 4
  %6 = zext i32 %5 to i64
  %7 = load i32* %3, align 4
  %8 = zext i32 %7 to i64
  %9 = call %struct._RV_fmd* @_RV_fmd_tbl_create(void (...)* bitcast (void (i32, i32, double*)* @print_array to void (...)*), i8 zeroext 1)
  %10 = load %struct._RV_pmd** %1, align 8
  %11 = call %struct._RV_fmd* @_RV_fmd_tbl_update_pmd(void (...)* bitcast (void (i32, i32, double*)* @print_array to void (...)*), i8 zeroext 0, %struct._RV_pmd* %10)
  %12 = load i32* %2, align 4
  %13 = load i32* %3, align 4
  %14 = load double** %4, align 8
  call void @print_array(i32 %12, i32 %13, double* %14)
  call void @_RV_fmd_tbl_remove(void (...)* bitcast (void (i32, i32, double*)* @print_array to void (...)*))
  %15 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %15)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %ret_val = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  call void @_RV_global_init_code()
  %4 = load i32* %2, align 4
  %5 = load i8*** %3, align 8
  %6 = call i32 @_RV_main(i32 %4, i8** %5)
  store i32 %6, i32* %ret_val, align 4
  call void @_RV_print_error_count()
  %7 = load i32* %ret_val, align 4
  ret i32 %7
}

; Function Attrs: nounwind uwtable
define internal void @print_array(i32 %ni, i32 %nl, double* %D) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca double*, align 8
  %_RV_stack_sa = alloca %struct._RV_stat_node*, align 8
  %_RV_ret_flag = alloca i8, align 1
  %_RV_bc_flag_42895064 = alloca i8, align 1
  %_RV_bc_flag_42895032 = alloca i8, align 1
  %_RV_pmd_D_42891904 = alloca %struct._RV_pmd, align 8
  %_RV_param_pmds = alloca %struct._RV_pmd*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %1, align 4
  store i32 %nl, i32* %2, align 4
  store double* %D, double** %3, align 8
  %4 = load i32* %1, align 4
  %5 = zext i32 %4 to i64
  %6 = load i32* %2, align 4
  %7 = zext i32 %6 to i64
  %8 = call %struct._RV_stat_node* @_RV_stat_node_create(i32 5, i64 1)
  store %struct._RV_stat_node* %8, %struct._RV_stat_node** %_RV_stack_sa, align 8
  store i8 0, i8* %_RV_ret_flag, align 1
  store i8 0, i8* %_RV_bc_flag_42895064, align 1
  store i8 0, i8* %_RV_bc_flag_42895032, align 1
  %9 = bitcast %struct._RV_pmd* %_RV_pmd_D_42891904 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* bitcast ({ i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] }* @print_array._RV_pmd_D_42891904 to i8*), i64 32, i32 8, i1 false)
  %10 = call %struct._RV_fmd_pmd* @_RV_fmd_tbl_lookup_fpmd(void (...)* bitcast (void (i32, i32, double*)* @print_array to void (...)*), i8 zeroext 0)
  %11 = call %struct._RV_pmd* @_RV_pmd_cp_fmd_pmd(%struct._RV_pmd* %_RV_pmd_D_42891904, %struct._RV_fmd_pmd* %10)
  store %struct._RV_pmd* %11, %struct._RV_pmd** %_RV_param_pmds, align 8
  store i32 0, i32* %i, align 4
  br label %12

; <label>:12                                      ; preds = %111, %0
  %13 = load i32* %i, align 4
  %14 = load i32* %1, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %114

; <label>:16                                      ; preds = %12
  store i32 0, i32* %j, align 4
  br label %17

; <label>:17                                      ; preds = %92, %16
  %18 = load i32* %j, align 4
  %19 = load i32* %2, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %95

; <label>:21                                      ; preds = %17
  %22 = call %struct._RV_pmd* @_RV_pmd_tbl_lookup(i8** bitcast (%struct._IO_FILE** @stderr to i8**))
  %23 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %24 = call %struct._RV_pmd* @_RV_pmd_create(i8** null, %struct._RV_stat_node* %23, i32 2, i8* getelementptr inbounds ([8 x i8]* @.str49, i32 0, i32 0), i8* getelementptr inbounds (i8* getelementptr inbounds ([8 x i8]* @.str49, i32 0, i32 0), i64 8))
  %25 = load %struct._IO_FILE** @stderr, align 8
  %26 = load i32* %i, align 4
  %27 = sext i32 %26 to i64
  %28 = load double** %3, align 8
  %29 = mul nsw i64 %27, %7
  %30 = getelementptr inbounds double* %28, i64 %29
  %31 = bitcast double* %30 to i8*
  %32 = load i32* %j, align 4
  %33 = sext i32 %32 to i64
  %34 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %_RV_pmd_D_42891904, i8* %31, i64 %33, i64 8, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str50, i32 0, i32 0), i32 54, i32 40, i8* getelementptr inbounds ([8 x i8]* @.str51, i32 0, i32 0))
  %35 = load double** %3, align 8
  %36 = bitcast double* %35 to i8*
  %37 = load i32* %i, align 4
  %38 = sext i32 %37 to i64
  %39 = load i32* %2, align 4
  %40 = zext i32 %39 to i64
  %41 = mul nuw i64 8, %40
  %42 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %_RV_pmd_D_42891904, i8* %36, i64 %38, i64 %41, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str50, i32 0, i32 0), i32 54, i32 37, i8* getelementptr inbounds ([5 x i8]* @.str52, i32 0, i32 0))
  %43 = load double** %3, align 8
  %44 = mul nsw i64 %42, %7
  %45 = getelementptr inbounds double* %43, i64 %44
  %46 = getelementptr inbounds double* %45, i64 %34
  %47 = load double* %46, align 8
  %48 = call i32 @_RV_fprintf_42894032(%struct._RV_pmd* %22, %struct._RV_pmd* %24, %struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8]* @.str49, i32 0, i32 0), double %47)
  %49 = load i32* %i, align 4
  %50 = load i32* %1, align 4
  %51 = mul nsw i32 %49, %50
  %52 = load i32* %j, align 4
  %53 = add nsw i32 %51, %52
  %54 = srem i32 %53, 20
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %56, label %76

; <label>:56                                      ; preds = %21
  %57 = call %struct._RV_pmd* @_RV_pmd_tbl_lookup(i8** bitcast (%struct._IO_FILE** @stderr to i8**))
  %58 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %59 = call %struct._RV_pmd* @_RV_pmd_create(i8** null, %struct._RV_stat_node* %58, i32 2, i8* getelementptr inbounds ([2 x i8]* @.str53, i32 0, i32 0), i8* getelementptr inbounds (i8* getelementptr inbounds ([2 x i8]* @.str53, i32 0, i32 0), i64 2))
  %60 = load %struct._IO_FILE** @stderr, align 8
  %61 = call i32 @_RV_fprintf_42894848(%struct._RV_pmd* %57, %struct._RV_pmd* %59, %struct._IO_FILE* %60, i8* getelementptr inbounds ([2 x i8]* @.str53, i32 0, i32 0))
  br label %62

; <label>:62                                      ; preds = %56
  %63 = load i8* %_RV_ret_flag, align 1
  %64 = icmp ne i8 %63, 0
  br i1 %64, label %65, label %66

; <label>:65                                      ; preds = %62
  br label %77

; <label>:66                                      ; preds = %62
  %67 = load i8* %_RV_bc_flag_42895032, align 1
  %68 = zext i8 %67 to i32
  %69 = icmp eq i32 %68, 1
  br i1 %69, label %74, label %70

; <label>:70                                      ; preds = %66
  %71 = load i8* %_RV_bc_flag_42895032, align 1
  %72 = zext i8 %71 to i32
  %73 = icmp eq i32 %72, 2
  br i1 %73, label %74, label %75

; <label>:74                                      ; preds = %70, %66
  br label %77

; <label>:75                                      ; preds = %70
  br label %76

; <label>:76                                      ; preds = %75, %21
  br label %77

; <label>:77                                      ; preds = %76, %74, %65
  %78 = load i8* %_RV_ret_flag, align 1
  %79 = icmp ne i8 %78, 0
  br i1 %79, label %80, label %81

; <label>:80                                      ; preds = %77
  br label %96

; <label>:81                                      ; preds = %77
  %82 = load i8* %_RV_bc_flag_42895032, align 1
  %83 = zext i8 %82 to i32
  %84 = icmp eq i32 %83, 1
  br i1 %84, label %85, label %86

; <label>:85                                      ; preds = %81
  store i8 0, i8* %_RV_bc_flag_42895032, align 1
  br label %95

; <label>:86                                      ; preds = %81
  %87 = load i8* %_RV_bc_flag_42895032, align 1
  %88 = zext i8 %87 to i32
  %89 = icmp eq i32 %88, 2
  br i1 %89, label %90, label %91

; <label>:90                                      ; preds = %86
  store i8 0, i8* %_RV_bc_flag_42895032, align 1
  br label %91

; <label>:91                                      ; preds = %90, %86
  br label %92

; <label>:92                                      ; preds = %91
  %93 = load i32* %j, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, i32* %j, align 4
  br label %17

; <label>:95                                      ; preds = %85, %17
  br label %96

; <label>:96                                      ; preds = %95, %80
  %97 = load i8* %_RV_ret_flag, align 1
  %98 = icmp ne i8 %97, 0
  br i1 %98, label %99, label %100

; <label>:99                                      ; preds = %96
  br label %120

; <label>:100                                     ; preds = %96
  %101 = load i8* %_RV_bc_flag_42895064, align 1
  %102 = zext i8 %101 to i32
  %103 = icmp eq i32 %102, 1
  br i1 %103, label %104, label %105

; <label>:104                                     ; preds = %100
  store i8 0, i8* %_RV_bc_flag_42895064, align 1
  br label %114

; <label>:105                                     ; preds = %100
  %106 = load i8* %_RV_bc_flag_42895064, align 1
  %107 = zext i8 %106 to i32
  %108 = icmp eq i32 %107, 2
  br i1 %108, label %109, label %110

; <label>:109                                     ; preds = %105
  store i8 0, i8* %_RV_bc_flag_42895064, align 1
  br label %110

; <label>:110                                     ; preds = %109, %105
  br label %111

; <label>:111                                     ; preds = %110
  %112 = load i32* %i, align 4
  %113 = add nsw i32 %112, 1
  store i32 %113, i32* %i, align 4
  br label %12

; <label>:114                                     ; preds = %104, %12
  %115 = call %struct._RV_pmd* @_RV_pmd_tbl_lookup(i8** bitcast (%struct._IO_FILE** @stderr to i8**))
  %116 = load %struct._RV_stat_node** @_RV_global_sa, align 8
  %117 = call %struct._RV_pmd* @_RV_pmd_create(i8** null, %struct._RV_stat_node* %116, i32 2, i8* getelementptr inbounds ([2 x i8]* @.str53, i32 0, i32 0), i8* getelementptr inbounds (i8* getelementptr inbounds ([2 x i8]* @.str53, i32 0, i32 0), i64 2))
  %118 = load %struct._IO_FILE** @stderr, align 8
  %119 = call i32 @_RV_fprintf_42895328(%struct._RV_pmd* %115, %struct._RV_pmd* %117, %struct._IO_FILE* %118, i8* getelementptr inbounds ([2 x i8]* @.str53, i32 0, i32 0))
  br label %120

; <label>:120                                     ; preds = %114, %99
  call void @_RV_pmd_set_null(%struct._RV_pmd* %_RV_pmd_D_42891904)
  %121 = load %struct._RV_stat_node** %_RV_stack_sa, align 8
  %122 = getelementptr inbounds %struct._RV_stat_node* %121, i32 0, i32 0
  store i32 0, i32* %122, align 4
  %123 = load %struct._RV_stat_node** %_RV_stack_sa, align 8
  %124 = call i32 @_RV_stat_node_dec(%struct._RV_stat_node* %123)
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @_RV_fprintf_42894032(%struct._RV_pmd* %stm_pmd, %struct._RV_pmd* %fmt_pmd, %struct._IO_FILE* %stream, i8* %fmt, double %vp2) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca double, align 8
  %ret = alloca i32, align 4
  %p = alloca i8*, align 8
  %is_string = alloca [3 x i8], align 1
  %fmt_cnt = alloca i8, align 1
  %i = alloca i8, align 1
  store %struct._RV_pmd* %stm_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %fmt_pmd, %struct._RV_pmd** %2, align 8
  store %struct._IO_FILE* %stream, %struct._IO_FILE** %3, align 8
  store i8* %fmt, i8** %4, align 8
  store double %vp2, double* %5, align 8
  %6 = load i8** %4, align 8
  store i8* %6, i8** %p, align 8
  %7 = bitcast [3 x i8]* %is_string to i8*
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 3, i32 1, i1 false)
  store i8 0, i8* %fmt_cnt, align 1
  store i8 2, i8* %i, align 1
  br label %8

; <label>:8                                       ; preds = %112, %0
  %9 = load i8** %p, align 8
  %10 = icmp ne i8* %9, null
  br i1 %10, label %11, label %16

; <label>:11                                      ; preds = %8
  %12 = load i8** %p, align 8
  %13 = load i8* %12, align 1
  %14 = sext i8 %13 to i32
  %15 = icmp ne i32 %14, 0
  br label %16

; <label>:16                                      ; preds = %11, %8
  %17 = phi i1 [ false, %8 ], [ %15, %11 ]
  br i1 %17, label %18, label %113

; <label>:18                                      ; preds = %16
  %19 = load i8** %p, align 8
  %20 = load i8* %19, align 1
  %21 = sext i8 %20 to i32
  %22 = icmp eq i32 %21, 37
  br i1 %22, label %23, label %32

; <label>:23                                      ; preds = %18
  %24 = load i8** %p, align 8
  %25 = getelementptr inbounds i8* %24, i64 1
  %26 = load i8* %25, align 1
  %27 = sext i8 %26 to i32
  %28 = icmp eq i32 %27, 37
  br i1 %28, label %29, label %32

; <label>:29                                      ; preds = %23
  %30 = load i8** %p, align 8
  %31 = getelementptr inbounds i8* %30, i64 2
  store i8* %31, i8** %p, align 8
  br label %112

; <label>:32                                      ; preds = %23, %18
  %33 = load i8** %p, align 8
  %34 = load i8* %33, align 1
  %35 = sext i8 %34 to i32
  %36 = icmp eq i32 %35, 37
  br i1 %36, label %37, label %56

; <label>:37                                      ; preds = %32
  %38 = load i8** %p, align 8
  %39 = getelementptr inbounds i8* %38, i64 1
  %40 = load i8* %39, align 1
  %41 = sext i8 %40 to i32
  %42 = icmp eq i32 %41, 42
  br i1 %42, label %43, label %56

; <label>:43                                      ; preds = %37
  %44 = load i8** %p, align 8
  %45 = getelementptr inbounds i8* %44, i64 2
  %46 = load i8* %45, align 1
  %47 = sext i8 %46 to i32
  %48 = icmp eq i32 %47, 100
  br i1 %48, label %49, label %56

; <label>:49                                      ; preds = %43
  %50 = load i8** %p, align 8
  %51 = getelementptr inbounds i8* %50, i64 3
  store i8* %51, i8** %p, align 8
  %52 = load i8* %fmt_cnt, align 1
  %53 = zext i8 %52 to i32
  %54 = add nsw i32 %53, 2
  %55 = trunc i32 %54 to i8
  store i8 %55, i8* %fmt_cnt, align 1
  br label %111

; <label>:56                                      ; preds = %43, %37, %32
  %57 = load i8** %p, align 8
  %58 = load i8* %57, align 1
  %59 = sext i8 %58 to i32
  %60 = icmp eq i32 %59, 37
  br i1 %60, label %61, label %107

; <label>:61                                      ; preds = %56
  br label %62

; <label>:62                                      ; preds = %101, %61
  %63 = load i8** %p, align 8
  %64 = getelementptr inbounds i8* %63, i32 1
  store i8* %64, i8** %p, align 8
  %65 = load i8** %p, align 8
  %66 = load i8* %65, align 1
  %67 = sext i8 %66 to i32
  %68 = icmp sle i32 48, %67
  br i1 %68, label %69, label %75

; <label>:69                                      ; preds = %62
  %70 = load i8** %p, align 8
  %71 = load i8* %70, align 1
  %72 = sext i8 %71 to i32
  %73 = icmp sle i32 %72, 57
  br i1 %73, label %74, label %75

; <label>:74                                      ; preds = %69
  br label %101

; <label>:75                                      ; preds = %69, %62
  %76 = load i8** %p, align 8
  %77 = load i8* %76, align 1
  %78 = sext i8 %77 to i32
  %79 = icmp eq i32 %78, 46
  br i1 %79, label %85, label %80

; <label>:80                                      ; preds = %75
  %81 = load i8** %p, align 8
  %82 = load i8* %81, align 1
  %83 = sext i8 %82 to i32
  %84 = icmp eq i32 %83, 42
  br i1 %84, label %85, label %86

; <label>:85                                      ; preds = %80, %75
  br label %101

; <label>:86                                      ; preds = %80
  %87 = load i8** %p, align 8
  %88 = load i8* %87, align 1
  %89 = sext i8 %88 to i32
  %90 = icmp eq i32 %89, 115
  br i1 %90, label %91, label %96

; <label>:91                                      ; preds = %86
  %92 = load i8* %i, align 1
  %93 = add i8 %92, 1
  store i8 %93, i8* %i, align 1
  %94 = zext i8 %92 to i64
  %95 = getelementptr inbounds [3 x i8]* %is_string, i32 0, i64 %94
  store i8 1, i8* %95, align 1
  br label %102

; <label>:96                                      ; preds = %86
  %97 = load i8* %i, align 1
  %98 = add i8 %97, 1
  store i8 %98, i8* %i, align 1
  %99 = zext i8 %97 to i64
  %100 = getelementptr inbounds [3 x i8]* %is_string, i32 0, i64 %99
  store i8 0, i8* %100, align 1
  br label %102

; <label>:101                                     ; preds = %85, %74
  br i1 true, label %62, label %102

; <label>:102                                     ; preds = %101, %96, %91
  %103 = load i8** %p, align 8
  %104 = getelementptr inbounds i8* %103, i32 1
  store i8* %104, i8** %p, align 8
  %105 = load i8* %fmt_cnt, align 1
  %106 = add i8 %105, 1
  store i8 %106, i8* %fmt_cnt, align 1
  br label %110

; <label>:107                                     ; preds = %56
  %108 = load i8** %p, align 8
  %109 = getelementptr inbounds i8* %108, i32 1
  store i8* %109, i8** %p, align 8
  br label %110

; <label>:110                                     ; preds = %107, %102
  br label %111

; <label>:111                                     ; preds = %110, %49
  br label %112

; <label>:112                                     ; preds = %111, %29
  br label %8

; <label>:113                                     ; preds = %16
  %114 = load i8* %fmt_cnt, align 1
  %115 = zext i8 %114 to i32
  %116 = icmp sgt i32 %115, 1
  br i1 %116, label %117, label %124

; <label>:117                                     ; preds = %113
  %118 = load %struct._IO_FILE** @stderr, align 8
  %119 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %118, i8* getelementptr inbounds ([31 x i8]* @.str54, i32 0, i32 0))
  %120 = load %struct._IO_FILE** @stderr, align 8
  %121 = load i8* %fmt_cnt, align 1
  %122 = zext i8 %121 to i32
  %123 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %120, i8* getelementptr inbounds ([132 x i8]* @.str60, i32 0, i32 0), i32 %122)
  br label %124

; <label>:124                                     ; preds = %117, %113
  %125 = load %struct._RV_pmd** %1, align 8
  %126 = load %struct._IO_FILE** %3, align 8
  %127 = bitcast %struct._IO_FILE* %126 to i8*
  %zybc_10 = bitcast %struct._RV_pmd* %125 to i8*
  %zybc_11 = bitcast i8* %127 to i8*
  %zyarg_12 = inttoptr i64 216 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0) to i8*
  %zybc_15 = bitcast i8* getelementptr inbounds ([8 x i8]* @.str56, i32 0, i32 0) to i8*
  %zyarg_16 = inttoptr i32 174 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 16 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* getelementptr inbounds ([7 x i8]* @.str57, i32 0, i32 0) to i8*
  %128 = load %struct._RV_pmd** %2, align 8
  %129 = load i8** %4, align 8
  %130 = load i8** %p, align 8
  %131 = load i8** %4, align 8
  %132 = ptrtoint i8* %130 to i64
  %133 = ptrtoint i8* %131 to i64
  %134 = sub i64 %132, %133
  %135 = add nsw i64 %134, 1
  %zybc_ = bitcast %struct._RV_pmd* %128 to i8*
  %zybc_1 = bitcast i8* %129 to i8*
  %zyarg_ = inttoptr i64 %135 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0) to i8*
  %zybc_4 = bitcast i8* getelementptr inbounds ([8 x i8]* @.str56, i32 0, i32 0) to i8*
  %zyarg_5 = inttoptr i32 54 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 24 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* getelementptr inbounds ([10 x i8]* @.str61, i32 0, i32 0) to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 1083609846, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_117_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %136 = load %struct._IO_FILE** %3, align 8
  %137 = load double* %5, align 8
  %138 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %136, i8* getelementptr inbounds ([8 x i8]* @.str49, i32 0, i32 0), double %137)
  store i32 %138, i32* %ret, align 4
  %139 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %139)
  %140 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %140)
  %141 = load i32* %ret, align 4
  call void @_Z4joinj(i32 1083609846)
  ret i32 %141
}

; Function Attrs: nounwind uwtable
define internal i32 @_RV_fprintf_42894848(%struct._RV_pmd* %stm_pmd, %struct._RV_pmd* %fmt_pmd, %struct._IO_FILE* %stream, i8* %fmt) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i8*, align 8
  %ret = alloca i32, align 4
  %p = alloca i8*, align 8
  %is_string = alloca [2 x i8], align 1
  %fmt_cnt = alloca i8, align 1
  %i = alloca i8, align 1
  store %struct._RV_pmd* %stm_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %fmt_pmd, %struct._RV_pmd** %2, align 8
  store %struct._IO_FILE* %stream, %struct._IO_FILE** %3, align 8
  store i8* %fmt, i8** %4, align 8
  %5 = load i8** %4, align 8
  store i8* %5, i8** %p, align 8
  %6 = bitcast [2 x i8]* %is_string to i8*
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 2, i32 1, i1 false)
  store i8 0, i8* %fmt_cnt, align 1
  store i8 2, i8* %i, align 1
  br label %7

; <label>:7                                       ; preds = %111, %0
  %8 = load i8** %p, align 8
  %9 = icmp ne i8* %8, null
  br i1 %9, label %10, label %15

; <label>:10                                      ; preds = %7
  %11 = load i8** %p, align 8
  %12 = load i8* %11, align 1
  %13 = sext i8 %12 to i32
  %14 = icmp ne i32 %13, 0
  br label %15

; <label>:15                                      ; preds = %10, %7
  %16 = phi i1 [ false, %7 ], [ %14, %10 ]
  br i1 %16, label %17, label %112

; <label>:17                                      ; preds = %15
  %18 = load i8** %p, align 8
  %19 = load i8* %18, align 1
  %20 = sext i8 %19 to i32
  %21 = icmp eq i32 %20, 37
  br i1 %21, label %22, label %31

; <label>:22                                      ; preds = %17
  %23 = load i8** %p, align 8
  %24 = getelementptr inbounds i8* %23, i64 1
  %25 = load i8* %24, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp eq i32 %26, 37
  br i1 %27, label %28, label %31

; <label>:28                                      ; preds = %22
  %29 = load i8** %p, align 8
  %30 = getelementptr inbounds i8* %29, i64 2
  store i8* %30, i8** %p, align 8
  br label %111

; <label>:31                                      ; preds = %22, %17
  %32 = load i8** %p, align 8
  %33 = load i8* %32, align 1
  %34 = sext i8 %33 to i32
  %35 = icmp eq i32 %34, 37
  br i1 %35, label %36, label %55

; <label>:36                                      ; preds = %31
  %37 = load i8** %p, align 8
  %38 = getelementptr inbounds i8* %37, i64 1
  %39 = load i8* %38, align 1
  %40 = sext i8 %39 to i32
  %41 = icmp eq i32 %40, 42
  br i1 %41, label %42, label %55

; <label>:42                                      ; preds = %36
  %43 = load i8** %p, align 8
  %44 = getelementptr inbounds i8* %43, i64 2
  %45 = load i8* %44, align 1
  %46 = sext i8 %45 to i32
  %47 = icmp eq i32 %46, 100
  br i1 %47, label %48, label %55

; <label>:48                                      ; preds = %42
  %49 = load i8** %p, align 8
  %50 = getelementptr inbounds i8* %49, i64 3
  store i8* %50, i8** %p, align 8
  %51 = load i8* %fmt_cnt, align 1
  %52 = zext i8 %51 to i32
  %53 = add nsw i32 %52, 2
  %54 = trunc i32 %53 to i8
  store i8 %54, i8* %fmt_cnt, align 1
  br label %110

; <label>:55                                      ; preds = %42, %36, %31
  %56 = load i8** %p, align 8
  %57 = load i8* %56, align 1
  %58 = sext i8 %57 to i32
  %59 = icmp eq i32 %58, 37
  br i1 %59, label %60, label %106

; <label>:60                                      ; preds = %55
  br label %61

; <label>:61                                      ; preds = %100, %60
  %62 = load i8** %p, align 8
  %63 = getelementptr inbounds i8* %62, i32 1
  store i8* %63, i8** %p, align 8
  %64 = load i8** %p, align 8
  %65 = load i8* %64, align 1
  %66 = sext i8 %65 to i32
  %67 = icmp sle i32 48, %66
  br i1 %67, label %68, label %74

; <label>:68                                      ; preds = %61
  %69 = load i8** %p, align 8
  %70 = load i8* %69, align 1
  %71 = sext i8 %70 to i32
  %72 = icmp sle i32 %71, 57
  br i1 %72, label %73, label %74

; <label>:73                                      ; preds = %68
  br label %100

; <label>:74                                      ; preds = %68, %61
  %75 = load i8** %p, align 8
  %76 = load i8* %75, align 1
  %77 = sext i8 %76 to i32
  %78 = icmp eq i32 %77, 46
  br i1 %78, label %84, label %79

; <label>:79                                      ; preds = %74
  %80 = load i8** %p, align 8
  %81 = load i8* %80, align 1
  %82 = sext i8 %81 to i32
  %83 = icmp eq i32 %82, 42
  br i1 %83, label %84, label %85

; <label>:84                                      ; preds = %79, %74
  br label %100

; <label>:85                                      ; preds = %79
  %86 = load i8** %p, align 8
  %87 = load i8* %86, align 1
  %88 = sext i8 %87 to i32
  %89 = icmp eq i32 %88, 115
  br i1 %89, label %90, label %95

; <label>:90                                      ; preds = %85
  %91 = load i8* %i, align 1
  %92 = add i8 %91, 1
  store i8 %92, i8* %i, align 1
  %93 = zext i8 %91 to i64
  %94 = getelementptr inbounds [2 x i8]* %is_string, i32 0, i64 %93
  store i8 1, i8* %94, align 1
  br label %101

; <label>:95                                      ; preds = %85
  %96 = load i8* %i, align 1
  %97 = add i8 %96, 1
  store i8 %97, i8* %i, align 1
  %98 = zext i8 %96 to i64
  %99 = getelementptr inbounds [2 x i8]* %is_string, i32 0, i64 %98
  store i8 0, i8* %99, align 1
  br label %101

; <label>:100                                     ; preds = %84, %73
  br i1 true, label %61, label %101

; <label>:101                                     ; preds = %100, %95, %90
  %102 = load i8** %p, align 8
  %103 = getelementptr inbounds i8* %102, i32 1
  store i8* %103, i8** %p, align 8
  %104 = load i8* %fmt_cnt, align 1
  %105 = add i8 %104, 1
  store i8 %105, i8* %fmt_cnt, align 1
  br label %109

; <label>:106                                     ; preds = %55
  %107 = load i8** %p, align 8
  %108 = getelementptr inbounds i8* %107, i32 1
  store i8* %108, i8** %p, align 8
  br label %109

; <label>:109                                     ; preds = %106, %101
  br label %110

; <label>:110                                     ; preds = %109, %48
  br label %111

; <label>:111                                     ; preds = %110, %28
  br label %7

; <label>:112                                     ; preds = %15
  %113 = load i8* %fmt_cnt, align 1
  %114 = zext i8 %113 to i32
  %115 = icmp sgt i32 %114, 0
  br i1 %115, label %116, label %123

; <label>:116                                     ; preds = %112
  %117 = load %struct._IO_FILE** @stderr, align 8
  %118 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %117, i8* getelementptr inbounds ([31 x i8]* @.str54, i32 0, i32 0))
  %119 = load %struct._IO_FILE** @stderr, align 8
  %120 = load i8* %fmt_cnt, align 1
  %121 = zext i8 %120 to i32
  %122 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %119, i8* getelementptr inbounds ([126 x i8]* @.str59, i32 0, i32 0), i32 %121)
  br label %123

; <label>:123                                     ; preds = %116, %112
  %124 = load %struct._RV_pmd** %1, align 8
  %125 = load %struct._IO_FILE** %3, align 8
  %126 = bitcast %struct._IO_FILE* %125 to i8*
  %zybc_10 = bitcast %struct._RV_pmd* %124 to i8*
  %zybc_11 = bitcast i8* %126 to i8*
  %zyarg_12 = inttoptr i64 216 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0) to i8*
  %zybc_15 = bitcast i8* getelementptr inbounds ([8 x i8]* @.str56, i32 0, i32 0) to i8*
  %zyarg_16 = inttoptr i32 174 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 16 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* getelementptr inbounds ([7 x i8]* @.str57, i32 0, i32 0) to i8*
  %127 = load %struct._RV_pmd** %2, align 8
  %128 = load i8** %4, align 8
  %129 = load i8** %p, align 8
  %130 = load i8** %4, align 8
  %131 = ptrtoint i8* %129 to i64
  %132 = ptrtoint i8* %130 to i64
  %133 = sub i64 %131, %132
  %134 = add nsw i64 %133, 1
  %zybc_ = bitcast %struct._RV_pmd* %127 to i8*
  %zybc_1 = bitcast i8* %128 to i8*
  %zyarg_ = inttoptr i64 %134 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0) to i8*
  %zybc_4 = bitcast i8* getelementptr inbounds ([8 x i8]* @.str56, i32 0, i32 0) to i8*
  %zyarg_5 = inttoptr i32 55 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 52 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* getelementptr inbounds ([5 x i8]* @.str58, i32 0, i32 0) to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 -1316971826, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_118_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %135 = load %struct._IO_FILE** %3, align 8
  %136 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %135, i8* getelementptr inbounds ([2 x i8]* @.str53, i32 0, i32 0))
  store i32 %136, i32* %ret, align 4
  %137 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %137)
  %138 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %138)
  %139 = load i32* %ret, align 4
  call void @_Z4joinj(i32 -1316971826)
  ret i32 %139
}

; Function Attrs: nounwind uwtable
define internal i32 @_RV_fprintf_42895328(%struct._RV_pmd* %stm_pmd, %struct._RV_pmd* %fmt_pmd, %struct._IO_FILE* %stream, i8* %fmt) #0 {
  %1 = alloca %struct._RV_pmd*, align 8
  %2 = alloca %struct._RV_pmd*, align 8
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i8*, align 8
  %ret = alloca i32, align 4
  %p = alloca i8*, align 8
  %is_string = alloca [2 x i8], align 1
  %fmt_cnt = alloca i8, align 1
  %i = alloca i8, align 1
  store %struct._RV_pmd* %stm_pmd, %struct._RV_pmd** %1, align 8
  store %struct._RV_pmd* %fmt_pmd, %struct._RV_pmd** %2, align 8
  store %struct._IO_FILE* %stream, %struct._IO_FILE** %3, align 8
  store i8* %fmt, i8** %4, align 8
  %5 = load i8** %4, align 8
  store i8* %5, i8** %p, align 8
  %6 = bitcast [2 x i8]* %is_string to i8*
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 2, i32 1, i1 false)
  store i8 0, i8* %fmt_cnt, align 1
  store i8 2, i8* %i, align 1
  br label %7

; <label>:7                                       ; preds = %111, %0
  %8 = load i8** %p, align 8
  %9 = icmp ne i8* %8, null
  br i1 %9, label %10, label %15

; <label>:10                                      ; preds = %7
  %11 = load i8** %p, align 8
  %12 = load i8* %11, align 1
  %13 = sext i8 %12 to i32
  %14 = icmp ne i32 %13, 0
  br label %15

; <label>:15                                      ; preds = %10, %7
  %16 = phi i1 [ false, %7 ], [ %14, %10 ]
  br i1 %16, label %17, label %112

; <label>:17                                      ; preds = %15
  %18 = load i8** %p, align 8
  %19 = load i8* %18, align 1
  %20 = sext i8 %19 to i32
  %21 = icmp eq i32 %20, 37
  br i1 %21, label %22, label %31

; <label>:22                                      ; preds = %17
  %23 = load i8** %p, align 8
  %24 = getelementptr inbounds i8* %23, i64 1
  %25 = load i8* %24, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp eq i32 %26, 37
  br i1 %27, label %28, label %31

; <label>:28                                      ; preds = %22
  %29 = load i8** %p, align 8
  %30 = getelementptr inbounds i8* %29, i64 2
  store i8* %30, i8** %p, align 8
  br label %111

; <label>:31                                      ; preds = %22, %17
  %32 = load i8** %p, align 8
  %33 = load i8* %32, align 1
  %34 = sext i8 %33 to i32
  %35 = icmp eq i32 %34, 37
  br i1 %35, label %36, label %55

; <label>:36                                      ; preds = %31
  %37 = load i8** %p, align 8
  %38 = getelementptr inbounds i8* %37, i64 1
  %39 = load i8* %38, align 1
  %40 = sext i8 %39 to i32
  %41 = icmp eq i32 %40, 42
  br i1 %41, label %42, label %55

; <label>:42                                      ; preds = %36
  %43 = load i8** %p, align 8
  %44 = getelementptr inbounds i8* %43, i64 2
  %45 = load i8* %44, align 1
  %46 = sext i8 %45 to i32
  %47 = icmp eq i32 %46, 100
  br i1 %47, label %48, label %55

; <label>:48                                      ; preds = %42
  %49 = load i8** %p, align 8
  %50 = getelementptr inbounds i8* %49, i64 3
  store i8* %50, i8** %p, align 8
  %51 = load i8* %fmt_cnt, align 1
  %52 = zext i8 %51 to i32
  %53 = add nsw i32 %52, 2
  %54 = trunc i32 %53 to i8
  store i8 %54, i8* %fmt_cnt, align 1
  br label %110

; <label>:55                                      ; preds = %42, %36, %31
  %56 = load i8** %p, align 8
  %57 = load i8* %56, align 1
  %58 = sext i8 %57 to i32
  %59 = icmp eq i32 %58, 37
  br i1 %59, label %60, label %106

; <label>:60                                      ; preds = %55
  br label %61

; <label>:61                                      ; preds = %100, %60
  %62 = load i8** %p, align 8
  %63 = getelementptr inbounds i8* %62, i32 1
  store i8* %63, i8** %p, align 8
  %64 = load i8** %p, align 8
  %65 = load i8* %64, align 1
  %66 = sext i8 %65 to i32
  %67 = icmp sle i32 48, %66
  br i1 %67, label %68, label %74

; <label>:68                                      ; preds = %61
  %69 = load i8** %p, align 8
  %70 = load i8* %69, align 1
  %71 = sext i8 %70 to i32
  %72 = icmp sle i32 %71, 57
  br i1 %72, label %73, label %74

; <label>:73                                      ; preds = %68
  br label %100

; <label>:74                                      ; preds = %68, %61
  %75 = load i8** %p, align 8
  %76 = load i8* %75, align 1
  %77 = sext i8 %76 to i32
  %78 = icmp eq i32 %77, 46
  br i1 %78, label %84, label %79

; <label>:79                                      ; preds = %74
  %80 = load i8** %p, align 8
  %81 = load i8* %80, align 1
  %82 = sext i8 %81 to i32
  %83 = icmp eq i32 %82, 42
  br i1 %83, label %84, label %85

; <label>:84                                      ; preds = %79, %74
  br label %100

; <label>:85                                      ; preds = %79
  %86 = load i8** %p, align 8
  %87 = load i8* %86, align 1
  %88 = sext i8 %87 to i32
  %89 = icmp eq i32 %88, 115
  br i1 %89, label %90, label %95

; <label>:90                                      ; preds = %85
  %91 = load i8* %i, align 1
  %92 = add i8 %91, 1
  store i8 %92, i8* %i, align 1
  %93 = zext i8 %91 to i64
  %94 = getelementptr inbounds [2 x i8]* %is_string, i32 0, i64 %93
  store i8 1, i8* %94, align 1
  br label %101

; <label>:95                                      ; preds = %85
  %96 = load i8* %i, align 1
  %97 = add i8 %96, 1
  store i8 %97, i8* %i, align 1
  %98 = zext i8 %96 to i64
  %99 = getelementptr inbounds [2 x i8]* %is_string, i32 0, i64 %98
  store i8 0, i8* %99, align 1
  br label %101

; <label>:100                                     ; preds = %84, %73
  br i1 true, label %61, label %101

; <label>:101                                     ; preds = %100, %95, %90
  %102 = load i8** %p, align 8
  %103 = getelementptr inbounds i8* %102, i32 1
  store i8* %103, i8** %p, align 8
  %104 = load i8* %fmt_cnt, align 1
  %105 = add i8 %104, 1
  store i8 %105, i8* %fmt_cnt, align 1
  br label %109

; <label>:106                                     ; preds = %55
  %107 = load i8** %p, align 8
  %108 = getelementptr inbounds i8* %107, i32 1
  store i8* %108, i8** %p, align 8
  br label %109

; <label>:109                                     ; preds = %106, %101
  br label %110

; <label>:110                                     ; preds = %109, %48
  br label %111

; <label>:111                                     ; preds = %110, %28
  br label %7

; <label>:112                                     ; preds = %15
  %113 = load i8* %fmt_cnt, align 1
  %114 = zext i8 %113 to i32
  %115 = icmp sgt i32 %114, 0
  br i1 %115, label %116, label %123

; <label>:116                                     ; preds = %112
  %117 = load %struct._IO_FILE** @stderr, align 8
  %118 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %117, i8* getelementptr inbounds ([31 x i8]* @.str54, i32 0, i32 0))
  %119 = load %struct._IO_FILE** @stderr, align 8
  %120 = load i8* %fmt_cnt, align 1
  %121 = zext i8 %120 to i32
  %122 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %119, i8* getelementptr inbounds ([126 x i8]* @.str55, i32 0, i32 0), i32 %121)
  br label %123

; <label>:123                                     ; preds = %116, %112
  %124 = load %struct._RV_pmd** %1, align 8
  %125 = load %struct._IO_FILE** %3, align 8
  %126 = bitcast %struct._IO_FILE* %125 to i8*
  %zybc_10 = bitcast %struct._RV_pmd* %124 to i8*
  %zybc_11 = bitcast i8* %126 to i8*
  %zyarg_12 = inttoptr i64 216 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0) to i8*
  %zybc_15 = bitcast i8* getelementptr inbounds ([8 x i8]* @.str56, i32 0, i32 0) to i8*
  %zyarg_16 = inttoptr i32 174 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 16 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* getelementptr inbounds ([7 x i8]* @.str57, i32 0, i32 0) to i8*
  %127 = load %struct._RV_pmd** %2, align 8
  %128 = load i8** %4, align 8
  %129 = load i8** %p, align 8
  %130 = load i8** %4, align 8
  %131 = ptrtoint i8* %129 to i64
  %132 = ptrtoint i8* %130 to i64
  %133 = sub i64 %131, %132
  %134 = add nsw i64 %133, 1
  %zybc_ = bitcast %struct._RV_pmd* %127 to i8*
  %zybc_1 = bitcast i8* %128 to i8*
  %zyarg_ = inttoptr i64 %134 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0) to i8*
  %zybc_4 = bitcast i8* getelementptr inbounds ([8 x i8]* @.str56, i32 0, i32 0) to i8*
  %zyarg_5 = inttoptr i32 57 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 20 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* getelementptr inbounds ([5 x i8]* @.str58, i32 0, i32 0) to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 595883461, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_119_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %135 = load %struct._IO_FILE** %3, align 8
  %136 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %135, i8* getelementptr inbounds ([2 x i8]* @.str53, i32 0, i32 0))
  store i32 %136, i32* %ret, align 4
  %137 = load %struct._RV_pmd** %1, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %137)
  %138 = load %struct._RV_pmd** %2, align 8
  call void @_RV_pmd_free_null_ptr(%struct._RV_pmd* %138)
  %139 = load i32* %ret, align 4
  call void @_Z4joinj(i32 595883461)
  ret i32 %139
}

; Function Attrs: nounwind uwtable
define internal void @kernel_2mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, double %alpha, double %beta, double* %tmp, double* %A, double* %B, double* %C, double* %D) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca double*, align 8
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %11 = alloca double*, align 8
  %_RV_stack_sa = alloca %struct._RV_stat_node*, align 8
  %_RV_ret_flag = alloca i8, align 1
  %_RV_bc_flag_42904200 = alloca i8, align 1
  %_RV_bc_flag_42904168 = alloca i8, align 1
  %_RV_bc_flag_42904056 = alloca i8, align 1
  %_RV_bc_flag_42906952 = alloca i8, align 1
  %_RV_bc_flag_42906920 = alloca i8, align 1
  %_RV_bc_flag_42906760 = alloca i8, align 1
  %_RV_pmd_tmp_42896608 = alloca %struct._RV_pmd, align 8
  %_RV_pmd_A_42897104 = alloca %struct._RV_pmd, align 8
  %_RV_pmd_B_42898816 = alloca %struct._RV_pmd, align 8
  %_RV_pmd_C_42899312 = alloca %struct._RV_pmd, align 8
  %_RV_pmd_D_42899808 = alloca %struct._RV_pmd, align 8
  %_RV_param_pmds = alloca %struct._RV_pmd*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %ni, i32* %1, align 4
  store i32 %nj, i32* %2, align 4
  store i32 %nk, i32* %3, align 4
  store i32 %nl, i32* %4, align 4
  store double %alpha, double* %5, align 8
  store double %beta, double* %6, align 8
  store double* %tmp, double** %7, align 8
  store double* %A, double** %8, align 8
  store double* %B, double** %9, align 8
  store double* %C, double** %10, align 8
  store double* %D, double** %11, align 8
  %12 = load i32* %1, align 4
  %13 = zext i32 %12 to i64
  %14 = load i32* %2, align 4
  %15 = zext i32 %14 to i64
  %16 = load i32* %1, align 4
  %17 = zext i32 %16 to i64
  %18 = load i32* %3, align 4
  %19 = zext i32 %18 to i64
  %20 = load i32* %3, align 4
  %21 = zext i32 %20 to i64
  %22 = load i32* %2, align 4
  %23 = zext i32 %22 to i64
  %24 = load i32* %4, align 4
  %25 = zext i32 %24 to i64
  %26 = load i32* %2, align 4
  %27 = zext i32 %26 to i64
  %28 = load i32* %1, align 4
  %29 = zext i32 %28 to i64
  %30 = load i32* %4, align 4
  %31 = zext i32 %30 to i64
  %32 = call %struct._RV_stat_node* @_RV_stat_node_create(i32 5, i64 1)
  store %struct._RV_stat_node* %32, %struct._RV_stat_node** %_RV_stack_sa, align 8
  store i8 0, i8* %_RV_ret_flag, align 1
  store i8 0, i8* %_RV_bc_flag_42904200, align 1
  store i8 0, i8* %_RV_bc_flag_42904168, align 1
  store i8 0, i8* %_RV_bc_flag_42904056, align 1
  store i8 0, i8* %_RV_bc_flag_42906952, align 1
  store i8 0, i8* %_RV_bc_flag_42906920, align 1
  store i8 0, i8* %_RV_bc_flag_42906760, align 1
  %33 = bitcast %struct._RV_pmd* %_RV_pmd_tmp_42896608 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %33, i8* bitcast ({ i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] }* @kernel_2mm._RV_pmd_tmp_42896608 to i8*), i64 32, i32 8, i1 false)
  %34 = bitcast %struct._RV_pmd* %_RV_pmd_A_42897104 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %34, i8* bitcast ({ i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] }* @kernel_2mm._RV_pmd_A_42897104 to i8*), i64 32, i32 8, i1 false)
  %35 = bitcast %struct._RV_pmd* %_RV_pmd_B_42898816 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %35, i8* bitcast ({ i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] }* @kernel_2mm._RV_pmd_B_42898816 to i8*), i64 32, i32 8, i1 false)
  %36 = bitcast %struct._RV_pmd* %_RV_pmd_C_42899312 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %36, i8* bitcast ({ i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] }* @kernel_2mm._RV_pmd_C_42899312 to i8*), i64 32, i32 8, i1 false)
  %37 = bitcast %struct._RV_pmd* %_RV_pmd_D_42899808 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %37, i8* bitcast ({ i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] }* @kernel_2mm._RV_pmd_D_42899808 to i8*), i64 32, i32 8, i1 false)
  %38 = call %struct._RV_fmd_pmd* @_RV_fmd_tbl_lookup_fpmd(void (...)* bitcast (void (i32, i32, i32, i32, double, double, double*, double*, double*, double*, double*)* @kernel_2mm to void (...)*), i8 zeroext 0)
  %39 = call %struct._RV_pmd* @_RV_pmd_cp_fmd_pmd(%struct._RV_pmd* %_RV_pmd_tmp_42896608, %struct._RV_fmd_pmd* %38)
  %40 = call %struct._RV_fmd_pmd* @_RV_fmd_tbl_lookup_fpmd(void (...)* bitcast (void (i32, i32, i32, i32, double, double, double*, double*, double*, double*, double*)* @kernel_2mm to void (...)*), i8 zeroext 1)
  %41 = call %struct._RV_pmd* @_RV_pmd_cp_fmd_pmd(%struct._RV_pmd* %_RV_pmd_A_42897104, %struct._RV_fmd_pmd* %40)
  %42 = call %struct._RV_fmd_pmd* @_RV_fmd_tbl_lookup_fpmd(void (...)* bitcast (void (i32, i32, i32, i32, double, double, double*, double*, double*, double*, double*)* @kernel_2mm to void (...)*), i8 zeroext 2)
  %43 = call %struct._RV_pmd* @_RV_pmd_cp_fmd_pmd(%struct._RV_pmd* %_RV_pmd_B_42898816, %struct._RV_fmd_pmd* %42)
  %44 = call %struct._RV_fmd_pmd* @_RV_fmd_tbl_lookup_fpmd(void (...)* bitcast (void (i32, i32, i32, i32, double, double, double*, double*, double*, double*, double*)* @kernel_2mm to void (...)*), i8 zeroext 3)
  %45 = call %struct._RV_pmd* @_RV_pmd_cp_fmd_pmd(%struct._RV_pmd* %_RV_pmd_C_42899312, %struct._RV_fmd_pmd* %44)
  %46 = call %struct._RV_fmd_pmd* @_RV_fmd_tbl_lookup_fpmd(void (...)* bitcast (void (i32, i32, i32, i32, double, double, double*, double*, double*, double*, double*)* @kernel_2mm to void (...)*), i8 zeroext 4)
  %47 = call %struct._RV_pmd* @_RV_pmd_cp_fmd_pmd(%struct._RV_pmd* %_RV_pmd_D_42899808, %struct._RV_fmd_pmd* %46)
  store %struct._RV_pmd* %47, %struct._RV_pmd** %_RV_param_pmds, align 8
  store i32 0, i32* %i, align 4
  br label %48

; <label>:48                                      ; preds = %207, %0
  %49 = load i32* %i, align 4
  %50 = load i32* %1, align 4
  %51 = icmp slt i32 %49, %50
  br i1 %51, label %52, label %210

; <label>:52                                      ; preds = %48
  store i32 0, i32* %j, align 4
  br label %53

; <label>:53                                      ; preds = %188, %52
  %54 = load i32* %j, align 4
  %55 = load i32* %2, align 4
  %56 = icmp slt i32 %54, %55
  br i1 %56, label %57, label %191

; <label>:57                                      ; preds = %53
  %58 = load i32* %i, align 4
  %59 = sext i32 %58 to i64
  %60 = load double** %7, align 8
  %61 = mul nsw i64 %59, %15
  %62 = getelementptr inbounds double* %60, i64 %61
  %63 = bitcast double* %62 to i8*
  %64 = load i32* %j, align 4
  %65 = sext i32 %64 to i64
  %66 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %_RV_pmd_tmp_42896608, i8* %63, i64 %65, i64 8, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str62, i32 0, i32 0), i32 80, i32 14, i8* getelementptr inbounds ([10 x i8]* @.str63, i32 0, i32 0))
  %67 = load double** %7, align 8
  %68 = bitcast double* %67 to i8*
  %69 = load i32* %i, align 4
  %70 = sext i32 %69 to i64
  %71 = load i32* %2, align 4
  %72 = zext i32 %71 to i64
  %73 = mul nuw i64 8, %72
  %74 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %_RV_pmd_tmp_42896608, i8* %68, i64 %70, i64 %73, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str62, i32 0, i32 0), i32 80, i32 11, i8* getelementptr inbounds ([7 x i8]* @.str64, i32 0, i32 0))
  %75 = load double** %7, align 8
  %76 = mul nsw i64 %74, %15
  %77 = getelementptr inbounds double* %75, i64 %76
  %78 = getelementptr inbounds double* %77, i64 %66
  store double 0.000000e+00, double* %78, align 8
  store i32 0, i32* %k, align 4
  br label %79

; <label>:79                                      ; preds = %169, %57
  %80 = load i32* %k, align 4
  %81 = load i32* %3, align 4
  %82 = icmp slt i32 %80, %81
  br i1 %82, label %83, label %172

; <label>:83                                      ; preds = %79
  %84 = load double* %5, align 8
  %85 = load i32* %i, align 4
  %86 = sext i32 %85 to i64
  %87 = load double** %8, align 8
  %88 = mul nsw i64 %86, %19
  %89 = getelementptr inbounds double* %87, i64 %88
  %90 = bitcast double* %89 to i8*
  %91 = load i32* %k, align 4
  %92 = sext i32 %91 to i64
  %93 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %_RV_pmd_A_42897104, i8* %90, i64 %92, i64 8, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str62, i32 0, i32 0), i32 82, i32 35, i8* getelementptr inbounds ([8 x i8]* @.str65, i32 0, i32 0))
  %94 = load double** %8, align 8
  %95 = bitcast double* %94 to i8*
  %96 = load i32* %i, align 4
  %97 = sext i32 %96 to i64
  %98 = load i32* %3, align 4
  %99 = zext i32 %98 to i64
  %100 = mul nuw i64 8, %99
  %101 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %_RV_pmd_A_42897104, i8* %95, i64 %97, i64 %100, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str62, i32 0, i32 0), i32 82, i32 32, i8* getelementptr inbounds ([5 x i8]* @.str66, i32 0, i32 0))
  %102 = load double** %8, align 8
  %103 = mul nsw i64 %101, %19
  %104 = getelementptr inbounds double* %102, i64 %103
  %105 = getelementptr inbounds double* %104, i64 %93
  %106 = load double* %105, align 8
  %107 = fmul double %84, %106
  %108 = load i32* %k, align 4
  %109 = sext i32 %108 to i64
  %110 = load double** %9, align 8
  %111 = mul nsw i64 %109, %23
  %112 = getelementptr inbounds double* %110, i64 %111
  %113 = bitcast double* %112 to i8*
  %114 = load i32* %j, align 4
  %115 = sext i32 %114 to i64
  %116 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %_RV_pmd_B_42898816, i8* %113, i64 %115, i64 8, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str62, i32 0, i32 0), i32 82, i32 45, i8* getelementptr inbounds ([8 x i8]* @.str67, i32 0, i32 0))
  %117 = load double** %9, align 8
  %118 = bitcast double* %117 to i8*
  %119 = load i32* %k, align 4
  %120 = sext i32 %119 to i64
  %121 = load i32* %2, align 4
  %122 = zext i32 %121 to i64
  %123 = mul nuw i64 8, %122
  %124 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %_RV_pmd_B_42898816, i8* %118, i64 %120, i64 %123, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str62, i32 0, i32 0), i32 82, i32 42, i8* getelementptr inbounds ([5 x i8]* @.str68, i32 0, i32 0))
  %125 = load double** %9, align 8
  %126 = mul nsw i64 %124, %23
  %127 = getelementptr inbounds double* %125, i64 %126
  %128 = getelementptr inbounds double* %127, i64 %116
  %129 = load double* %128, align 8
  %130 = fmul double %107, %129
  %131 = load i32* %i, align 4
  %132 = sext i32 %131 to i64
  %133 = load double** %7, align 8
  %134 = mul nsw i64 %132, %15
  %135 = getelementptr inbounds double* %133, i64 %134
  %136 = bitcast double* %135 to i8*
  %137 = load i32* %j, align 4
  %138 = sext i32 %137 to i64
  %139 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %_RV_pmd_tmp_42896608, i8* %136, i64 %138, i64 8, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str62, i32 0, i32 0), i32 82, i32 16, i8* getelementptr inbounds ([10 x i8]* @.str63, i32 0, i32 0))
  %140 = load double** %7, align 8
  %141 = bitcast double* %140 to i8*
  %142 = load i32* %i, align 4
  %143 = sext i32 %142 to i64
  %144 = load i32* %2, align 4
  %145 = zext i32 %144 to i64
  %146 = mul nuw i64 8, %145
  %147 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %_RV_pmd_tmp_42896608, i8* %141, i64 %143, i64 %146, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str62, i32 0, i32 0), i32 82, i32 13, i8* getelementptr inbounds ([7 x i8]* @.str64, i32 0, i32 0))
  %148 = load double** %7, align 8
  %149 = mul nsw i64 %147, %15
  %150 = getelementptr inbounds double* %148, i64 %149
  %151 = getelementptr inbounds double* %150, i64 %139
  %152 = load double* %151, align 8
  %153 = fadd double %152, %130
  store double %153, double* %151, align 8
  br label %154

; <label>:154                                     ; preds = %83
  %155 = load i8* %_RV_ret_flag, align 1
  %156 = icmp ne i8 %155, 0
  br i1 %156, label %157, label %158

; <label>:157                                     ; preds = %154
  br label %173

; <label>:158                                     ; preds = %154
  %159 = load i8* %_RV_bc_flag_42904056, align 1
  %160 = zext i8 %159 to i32
  %161 = icmp eq i32 %160, 1
  br i1 %161, label %162, label %163

; <label>:162                                     ; preds = %158
  store i8 0, i8* %_RV_bc_flag_42904056, align 1
  br label %172

; <label>:163                                     ; preds = %158
  %164 = load i8* %_RV_bc_flag_42904056, align 1
  %165 = zext i8 %164 to i32
  %166 = icmp eq i32 %165, 2
  br i1 %166, label %167, label %168

; <label>:167                                     ; preds = %163
  store i8 0, i8* %_RV_bc_flag_42904056, align 1
  br label %168

; <label>:168                                     ; preds = %167, %163
  br label %169

; <label>:169                                     ; preds = %168
  %170 = load i32* %k, align 4
  %171 = add nsw i32 %170, 1
  store i32 %171, i32* %k, align 4
  br label %79

; <label>:172                                     ; preds = %162, %79
  br label %173

; <label>:173                                     ; preds = %172, %157
  %174 = load i8* %_RV_ret_flag, align 1
  %175 = icmp ne i8 %174, 0
  br i1 %175, label %176, label %177

; <label>:176                                     ; preds = %173
  br label %192

; <label>:177                                     ; preds = %173
  %178 = load i8* %_RV_bc_flag_42904168, align 1
  %179 = zext i8 %178 to i32
  %180 = icmp eq i32 %179, 1
  br i1 %180, label %181, label %182

; <label>:181                                     ; preds = %177
  store i8 0, i8* %_RV_bc_flag_42904168, align 1
  br label %191

; <label>:182                                     ; preds = %177
  %183 = load i8* %_RV_bc_flag_42904168, align 1
  %184 = zext i8 %183 to i32
  %185 = icmp eq i32 %184, 2
  br i1 %185, label %186, label %187

; <label>:186                                     ; preds = %182
  store i8 0, i8* %_RV_bc_flag_42904168, align 1
  br label %187

; <label>:187                                     ; preds = %186, %182
  br label %188

; <label>:188                                     ; preds = %187
  %189 = load i32* %j, align 4
  %190 = add nsw i32 %189, 1
  store i32 %190, i32* %j, align 4
  br label %53

; <label>:191                                     ; preds = %181, %53
  br label %192

; <label>:192                                     ; preds = %191, %176
  %193 = load i8* %_RV_ret_flag, align 1
  %194 = icmp ne i8 %193, 0
  br i1 %194, label %195, label %196

; <label>:195                                     ; preds = %192
  br label %375

; <label>:196                                     ; preds = %192
  %197 = load i8* %_RV_bc_flag_42904200, align 1
  %198 = zext i8 %197 to i32
  %199 = icmp eq i32 %198, 1
  br i1 %199, label %200, label %201

; <label>:200                                     ; preds = %196
  store i8 0, i8* %_RV_bc_flag_42904200, align 1
  br label %210

; <label>:201                                     ; preds = %196
  %202 = load i8* %_RV_bc_flag_42904200, align 1
  %203 = zext i8 %202 to i32
  %204 = icmp eq i32 %203, 2
  br i1 %204, label %205, label %206

; <label>:205                                     ; preds = %201
  store i8 0, i8* %_RV_bc_flag_42904200, align 1
  br label %206

; <label>:206                                     ; preds = %205, %201
  br label %207

; <label>:207                                     ; preds = %206
  %208 = load i32* %i, align 4
  %209 = add nsw i32 %208, 1
  store i32 %209, i32* %i, align 4
  br label %48

; <label>:210                                     ; preds = %200, %48
  store i32 0, i32* %i, align 4
  br label %211

; <label>:211                                     ; preds = %371, %210
  %212 = load i32* %i, align 4
  %213 = load i32* %1, align 4
  %214 = icmp slt i32 %212, %213
  br i1 %214, label %215, label %374

; <label>:215                                     ; preds = %211
  store i32 0, i32* %j, align 4
  br label %216

; <label>:216                                     ; preds = %352, %215
  %217 = load i32* %j, align 4
  %218 = load i32* %4, align 4
  %219 = icmp slt i32 %217, %218
  br i1 %219, label %220, label %355

; <label>:220                                     ; preds = %216
  %221 = load double* %6, align 8
  %222 = load i32* %i, align 4
  %223 = sext i32 %222 to i64
  %224 = load double** %11, align 8
  %225 = mul nsw i64 %223, %31
  %226 = getelementptr inbounds double* %224, i64 %225
  %227 = bitcast double* %226 to i8*
  %228 = load i32* %j, align 4
  %229 = sext i32 %228 to i64
  %230 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %_RV_pmd_D_42899808, i8* %227, i64 %229, i64 8, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str62, i32 0, i32 0), i32 87, i32 12, i8* getelementptr inbounds ([8 x i8]* @.str51, i32 0, i32 0))
  %231 = load double** %11, align 8
  %232 = bitcast double* %231 to i8*
  %233 = load i32* %i, align 4
  %234 = sext i32 %233 to i64
  %235 = load i32* %4, align 4
  %236 = zext i32 %235 to i64
  %237 = mul nuw i64 8, %236
  %238 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %_RV_pmd_D_42899808, i8* %232, i64 %234, i64 %237, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str62, i32 0, i32 0), i32 87, i32 9, i8* getelementptr inbounds ([5 x i8]* @.str52, i32 0, i32 0))
  %239 = load double** %11, align 8
  %240 = mul nsw i64 %238, %31
  %241 = getelementptr inbounds double* %239, i64 %240
  %242 = getelementptr inbounds double* %241, i64 %230
  %243 = load double* %242, align 8
  %244 = fmul double %243, %221
  store double %244, double* %242, align 8
  store i32 0, i32* %k, align 4
  br label %245

; <label>:245                                     ; preds = %333, %220
  %246 = load i32* %k, align 4
  %247 = load i32* %2, align 4
  %248 = icmp slt i32 %246, %247
  br i1 %248, label %249, label %336

; <label>:249                                     ; preds = %245
  %250 = load i32* %i, align 4
  %251 = sext i32 %250 to i64
  %252 = load double** %7, align 8
  %253 = mul nsw i64 %251, %15
  %254 = getelementptr inbounds double* %252, i64 %253
  %255 = bitcast double* %254 to i8*
  %256 = load i32* %k, align 4
  %257 = sext i32 %256 to i64
  %258 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %_RV_pmd_tmp_42896608, i8* %255, i64 %257, i64 8, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str62, i32 0, i32 0), i32 89, i32 27, i8* getelementptr inbounds ([10 x i8]* @.str69, i32 0, i32 0))
  %259 = load double** %7, align 8
  %260 = bitcast double* %259 to i8*
  %261 = load i32* %i, align 4
  %262 = sext i32 %261 to i64
  %263 = load i32* %2, align 4
  %264 = zext i32 %263 to i64
  %265 = mul nuw i64 8, %264
  %266 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %_RV_pmd_tmp_42896608, i8* %260, i64 %262, i64 %265, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str62, i32 0, i32 0), i32 89, i32 24, i8* getelementptr inbounds ([7 x i8]* @.str64, i32 0, i32 0))
  %267 = load double** %7, align 8
  %268 = mul nsw i64 %266, %15
  %269 = getelementptr inbounds double* %267, i64 %268
  %270 = getelementptr inbounds double* %269, i64 %258
  %271 = load double* %270, align 8
  %272 = load i32* %k, align 4
  %273 = sext i32 %272 to i64
  %274 = load double** %10, align 8
  %275 = mul nsw i64 %273, %27
  %276 = getelementptr inbounds double* %274, i64 %275
  %277 = bitcast double* %276 to i8*
  %278 = load i32* %j, align 4
  %279 = sext i32 %278 to i64
  %280 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %_RV_pmd_C_42899312, i8* %277, i64 %279, i64 8, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str62, i32 0, i32 0), i32 89, i32 37, i8* getelementptr inbounds ([8 x i8]* @.str70, i32 0, i32 0))
  %281 = load double** %10, align 8
  %282 = bitcast double* %281 to i8*
  %283 = load i32* %k, align 4
  %284 = sext i32 %283 to i64
  %285 = load i32* %2, align 4
  %286 = zext i32 %285 to i64
  %287 = mul nuw i64 8, %286
  %288 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %_RV_pmd_C_42899312, i8* %282, i64 %284, i64 %287, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str62, i32 0, i32 0), i32 89, i32 34, i8* getelementptr inbounds ([5 x i8]* @.str71, i32 0, i32 0))
  %289 = load double** %10, align 8
  %290 = mul nsw i64 %288, %27
  %291 = getelementptr inbounds double* %289, i64 %290
  %292 = getelementptr inbounds double* %291, i64 %280
  %293 = load double* %292, align 8
  %294 = fmul double %271, %293
  %295 = load i32* %i, align 4
  %296 = sext i32 %295 to i64
  %297 = load double** %11, align 8
  %298 = mul nsw i64 %296, %31
  %299 = getelementptr inbounds double* %297, i64 %298
  %300 = bitcast double* %299 to i8*
  %301 = load i32* %j, align 4
  %302 = sext i32 %301 to i64
  %303 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %_RV_pmd_D_42899808, i8* %300, i64 %302, i64 8, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str62, i32 0, i32 0), i32 89, i32 14, i8* getelementptr inbounds ([8 x i8]* @.str51, i32 0, i32 0))
  %304 = load double** %11, align 8
  %305 = bitcast double* %304 to i8*
  %306 = load i32* %i, align 4
  %307 = sext i32 %306 to i64
  %308 = load i32* %4, align 4
  %309 = zext i32 %308 to i64
  %310 = mul nuw i64 8, %309
  %311 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %_RV_pmd_D_42899808, i8* %305, i64 %307, i64 %310, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str62, i32 0, i32 0), i32 89, i32 11, i8* getelementptr inbounds ([5 x i8]* @.str52, i32 0, i32 0))
  %312 = load double** %11, align 8
  %313 = mul nsw i64 %311, %31
  %314 = getelementptr inbounds double* %312, i64 %313
  %315 = getelementptr inbounds double* %314, i64 %303
  %316 = load double* %315, align 8
  %317 = fadd double %316, %294
  store double %317, double* %315, align 8
  br label %318

; <label>:318                                     ; preds = %249
  %319 = load i8* %_RV_ret_flag, align 1
  %320 = icmp ne i8 %319, 0
  br i1 %320, label %321, label %322

; <label>:321                                     ; preds = %318
  br label %337

; <label>:322                                     ; preds = %318
  %323 = load i8* %_RV_bc_flag_42906760, align 1
  %324 = zext i8 %323 to i32
  %325 = icmp eq i32 %324, 1
  br i1 %325, label %326, label %327

; <label>:326                                     ; preds = %322
  store i8 0, i8* %_RV_bc_flag_42906760, align 1
  br label %336

; <label>:327                                     ; preds = %322
  %328 = load i8* %_RV_bc_flag_42906760, align 1
  %329 = zext i8 %328 to i32
  %330 = icmp eq i32 %329, 2
  br i1 %330, label %331, label %332

; <label>:331                                     ; preds = %327
  store i8 0, i8* %_RV_bc_flag_42906760, align 1
  br label %332

; <label>:332                                     ; preds = %331, %327
  br label %333

; <label>:333                                     ; preds = %332
  %334 = load i32* %k, align 4
  %335 = add nsw i32 %334, 1
  store i32 %335, i32* %k, align 4
  br label %245

; <label>:336                                     ; preds = %326, %245
  br label %337

; <label>:337                                     ; preds = %336, %321
  %338 = load i8* %_RV_ret_flag, align 1
  %339 = icmp ne i8 %338, 0
  br i1 %339, label %340, label %341

; <label>:340                                     ; preds = %337
  br label %356

; <label>:341                                     ; preds = %337
  %342 = load i8* %_RV_bc_flag_42906920, align 1
  %343 = zext i8 %342 to i32
  %344 = icmp eq i32 %343, 1
  br i1 %344, label %345, label %346

; <label>:345                                     ; preds = %341
  store i8 0, i8* %_RV_bc_flag_42906920, align 1
  br label %355

; <label>:346                                     ; preds = %341
  %347 = load i8* %_RV_bc_flag_42906920, align 1
  %348 = zext i8 %347 to i32
  %349 = icmp eq i32 %348, 2
  br i1 %349, label %350, label %351

; <label>:350                                     ; preds = %346
  store i8 0, i8* %_RV_bc_flag_42906920, align 1
  br label %351

; <label>:351                                     ; preds = %350, %346
  br label %352

; <label>:352                                     ; preds = %351
  %353 = load i32* %j, align 4
  %354 = add nsw i32 %353, 1
  store i32 %354, i32* %j, align 4
  br label %216

; <label>:355                                     ; preds = %345, %216
  br label %356

; <label>:356                                     ; preds = %355, %340
  %357 = load i8* %_RV_ret_flag, align 1
  %358 = icmp ne i8 %357, 0
  br i1 %358, label %359, label %360

; <label>:359                                     ; preds = %356
  br label %375

; <label>:360                                     ; preds = %356
  %361 = load i8* %_RV_bc_flag_42906952, align 1
  %362 = zext i8 %361 to i32
  %363 = icmp eq i32 %362, 1
  br i1 %363, label %364, label %365

; <label>:364                                     ; preds = %360
  store i8 0, i8* %_RV_bc_flag_42906952, align 1
  br label %374

; <label>:365                                     ; preds = %360
  %366 = load i8* %_RV_bc_flag_42906952, align 1
  %367 = zext i8 %366 to i32
  %368 = icmp eq i32 %367, 2
  br i1 %368, label %369, label %370

; <label>:369                                     ; preds = %365
  store i8 0, i8* %_RV_bc_flag_42906952, align 1
  br label %370

; <label>:370                                     ; preds = %369, %365
  br label %371

; <label>:371                                     ; preds = %370
  %372 = load i32* %i, align 4
  %373 = add nsw i32 %372, 1
  store i32 %373, i32* %i, align 4
  br label %211

; <label>:374                                     ; preds = %364, %211
  br label %375

; <label>:375                                     ; preds = %374, %359, %195
  call void @_RV_pmd_set_null(%struct._RV_pmd* %_RV_pmd_tmp_42896608)
  call void @_RV_pmd_set_null(%struct._RV_pmd* %_RV_pmd_A_42897104)
  call void @_RV_pmd_set_null(%struct._RV_pmd* %_RV_pmd_B_42898816)
  call void @_RV_pmd_set_null(%struct._RV_pmd* %_RV_pmd_C_42899312)
  call void @_RV_pmd_set_null(%struct._RV_pmd* %_RV_pmd_D_42899808)
  %376 = load %struct._RV_stat_node** %_RV_stack_sa, align 8
  %377 = getelementptr inbounds %struct._RV_stat_node* %376, i32 0, i32 0
  store i32 0, i32* %377, align 4
  %378 = load %struct._RV_stat_node** %_RV_stack_sa, align 8
  %379 = call i32 @_RV_stat_node_dec(%struct._RV_stat_node* %378)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @init_array(i32 %ni, i32 %nj, i32 %nk, i32 %nl, double* %alpha, double* %beta, double* %A, double* %B, double* %C, double* %D) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca double*, align 8
  %6 = alloca double*, align 8
  %7 = alloca double*, align 8
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %_RV_stack_sa = alloca %struct._RV_stat_node*, align 8
  %_RV_ret_flag = alloca i8, align 1
  %_RV_bc_flag_42885600 = alloca i8, align 1
  %_RV_bc_flag_42885560 = alloca i8, align 1
  %_RV_bc_flag_42887272 = alloca i8, align 1
  %_RV_bc_flag_42887232 = alloca i8, align 1
  %_RV_bc_flag_42889408 = alloca i8, align 1
  %_RV_bc_flag_42889368 = alloca i8, align 1
  %_RV_bc_flag_42891080 = alloca i8, align 1
  %_RV_bc_flag_42891040 = alloca i8, align 1
  %_RV_pmd_alpha_42855160 = alloca %struct._RV_pmd, align 8
  %_RV_pmd_beta_42855280 = alloca %struct._RV_pmd, align 8
  %_RV_pmd_A_42880832 = alloca %struct._RV_pmd, align 8
  %_RV_pmd_B_42881328 = alloca %struct._RV_pmd, align 8
  %_RV_pmd_C_42881824 = alloca %struct._RV_pmd, align 8
  %_RV_pmd_D_42882320 = alloca %struct._RV_pmd, align 8
  %_RV_param_pmds = alloca %struct._RV_pmd*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %1, align 4
  store i32 %nj, i32* %2, align 4
  store i32 %nk, i32* %3, align 4
  store i32 %nl, i32* %4, align 4
  store double* %alpha, double** %5, align 8
  store double* %beta, double** %6, align 8
  store double* %A, double** %7, align 8
  store double* %B, double** %8, align 8
  store double* %C, double** %9, align 8
  store double* %D, double** %10, align 8
  %11 = load i32* %1, align 4
  %12 = zext i32 %11 to i64
  %13 = load i32* %4, align 4
  %14 = zext i32 %13 to i64
  %15 = load i32* %3, align 4
  %16 = zext i32 %15 to i64
  %17 = load i32* %2, align 4
  %18 = zext i32 %17 to i64
  %19 = load i32* %4, align 4
  %20 = zext i32 %19 to i64
  %21 = load i32* %2, align 4
  %22 = zext i32 %21 to i64
  %23 = load i32* %1, align 4
  %24 = zext i32 %23 to i64
  %25 = load i32* %4, align 4
  %26 = zext i32 %25 to i64
  %27 = call %struct._RV_stat_node* @_RV_stat_node_create(i32 5, i64 1)
  store %struct._RV_stat_node* %27, %struct._RV_stat_node** %_RV_stack_sa, align 8
  store i8 0, i8* %_RV_ret_flag, align 1
  store i8 0, i8* %_RV_bc_flag_42885600, align 1
  store i8 0, i8* %_RV_bc_flag_42885560, align 1
  store i8 0, i8* %_RV_bc_flag_42887272, align 1
  store i8 0, i8* %_RV_bc_flag_42887232, align 1
  store i8 0, i8* %_RV_bc_flag_42889408, align 1
  store i8 0, i8* %_RV_bc_flag_42889368, align 1
  store i8 0, i8* %_RV_bc_flag_42891080, align 1
  store i8 0, i8* %_RV_bc_flag_42891040, align 1
  %28 = bitcast %struct._RV_pmd* %_RV_pmd_alpha_42855160 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %28, i8* bitcast ({ i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] }* @init_array._RV_pmd_alpha_42855160 to i8*), i64 32, i32 8, i1 false)
  %29 = bitcast %struct._RV_pmd* %_RV_pmd_beta_42855280 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %29, i8* bitcast ({ i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] }* @init_array._RV_pmd_beta_42855280 to i8*), i64 32, i32 8, i1 false)
  %30 = bitcast %struct._RV_pmd* %_RV_pmd_A_42880832 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %30, i8* bitcast ({ i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] }* @init_array._RV_pmd_A_42880832 to i8*), i64 32, i32 8, i1 false)
  %31 = bitcast %struct._RV_pmd* %_RV_pmd_B_42881328 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %31, i8* bitcast ({ i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] }* @init_array._RV_pmd_B_42881328 to i8*), i64 32, i32 8, i1 false)
  %32 = bitcast %struct._RV_pmd* %_RV_pmd_C_42881824 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %32, i8* bitcast ({ i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] }* @init_array._RV_pmd_C_42881824 to i8*), i64 32, i32 8, i1 false)
  %33 = bitcast %struct._RV_pmd* %_RV_pmd_D_42882320 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %33, i8* bitcast ({ i8*, i8*, %struct._RV_stat_node*, i8, [7 x i8] }* @init_array._RV_pmd_D_42882320 to i8*), i64 32, i32 8, i1 false)
  %34 = call %struct._RV_fmd_pmd* @_RV_fmd_tbl_lookup_fpmd(void (...)* bitcast (void (i32, i32, i32, i32, double*, double*, double*, double*, double*, double*)* @init_array to void (...)*), i8 zeroext 0)
  %35 = call %struct._RV_pmd* @_RV_pmd_cp_fmd_pmd(%struct._RV_pmd* %_RV_pmd_alpha_42855160, %struct._RV_fmd_pmd* %34)
  %36 = call %struct._RV_fmd_pmd* @_RV_fmd_tbl_lookup_fpmd(void (...)* bitcast (void (i32, i32, i32, i32, double*, double*, double*, double*, double*, double*)* @init_array to void (...)*), i8 zeroext 1)
  %37 = call %struct._RV_pmd* @_RV_pmd_cp_fmd_pmd(%struct._RV_pmd* %_RV_pmd_beta_42855280, %struct._RV_fmd_pmd* %36)
  %38 = call %struct._RV_fmd_pmd* @_RV_fmd_tbl_lookup_fpmd(void (...)* bitcast (void (i32, i32, i32, i32, double*, double*, double*, double*, double*, double*)* @init_array to void (...)*), i8 zeroext 2)
  %39 = call %struct._RV_pmd* @_RV_pmd_cp_fmd_pmd(%struct._RV_pmd* %_RV_pmd_A_42880832, %struct._RV_fmd_pmd* %38)
  %40 = call %struct._RV_fmd_pmd* @_RV_fmd_tbl_lookup_fpmd(void (...)* bitcast (void (i32, i32, i32, i32, double*, double*, double*, double*, double*, double*)* @init_array to void (...)*), i8 zeroext 3)
  %41 = call %struct._RV_pmd* @_RV_pmd_cp_fmd_pmd(%struct._RV_pmd* %_RV_pmd_B_42881328, %struct._RV_fmd_pmd* %40)
  %42 = call %struct._RV_fmd_pmd* @_RV_fmd_tbl_lookup_fpmd(void (...)* bitcast (void (i32, i32, i32, i32, double*, double*, double*, double*, double*, double*)* @init_array to void (...)*), i8 zeroext 4)
  %43 = call %struct._RV_pmd* @_RV_pmd_cp_fmd_pmd(%struct._RV_pmd* %_RV_pmd_C_42881824, %struct._RV_fmd_pmd* %42)
  %44 = call %struct._RV_fmd_pmd* @_RV_fmd_tbl_lookup_fpmd(void (...)* bitcast (void (i32, i32, i32, i32, double*, double*, double*, double*, double*, double*)* @init_array to void (...)*), i8 zeroext 5)
  %45 = call %struct._RV_pmd* @_RV_pmd_cp_fmd_pmd(%struct._RV_pmd* %_RV_pmd_D_42882320, %struct._RV_fmd_pmd* %44)
  store %struct._RV_pmd* %45, %struct._RV_pmd** %_RV_param_pmds, align 8
  %46 = load double** %5, align 8
  %47 = bitcast double* %46 to i8*
  %zybc_10 = bitcast %struct._RV_pmd* %_RV_pmd_alpha_42855160 to i8*
  %zybc_11 = bitcast i8* %47 to i8*
  %zyarg_12 = inttoptr i64 8 to i8*
  %zybc_13 = bitcast i8* %zyarg_12 to i8*
  %zybc_14 = bitcast i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0) to i8*
  %zybc_15 = bitcast i8* getelementptr inbounds ([11 x i8]* @.str72, i32 0, i32 0) to i8*
  %zyarg_16 = inttoptr i32 27 to i8*
  %zybc_17 = bitcast i8* %zyarg_16 to i8*
  %zyarg_18 = inttoptr i32 4 to i8*
  %zybc_19 = bitcast i8* %zyarg_18 to i8*
  %zybc_20 = bitcast i8* getelementptr inbounds ([6 x i8]* @.str73, i32 0, i32 0) to i8*
  %48 = bitcast i8* %47 to double*
  store double 3.241200e+04, double* %48, align 8
  %49 = load double** %6, align 8
  %50 = bitcast double* %49 to i8*
  %zybc_ = bitcast %struct._RV_pmd* %_RV_pmd_beta_42855280 to i8*
  %zybc_1 = bitcast i8* %50 to i8*
  %zyarg_ = inttoptr i64 8 to i8*
  %zybc_2 = bitcast i8* %zyarg_ to i8*
  %zybc_3 = bitcast i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0) to i8*
  %zybc_4 = bitcast i8* getelementptr inbounds ([11 x i8]* @.str72, i32 0, i32 0) to i8*
  %zyarg_5 = inttoptr i32 28 to i8*
  %zybc_6 = bitcast i8* %zyarg_5 to i8*
  %zyarg_7 = inttoptr i32 4 to i8*
  %zybc_8 = bitcast i8* %zyarg_7 to i8*
  %zybc_9 = bitcast i8* getelementptr inbounds ([5 x i8]* @.str74, i32 0, i32 0) to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 1592384566, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_free_func_120_0, i8* %zybc_, i8* %zybc_1, i8* %zybc_2, i8* %zybc_3, i8* %zybc_4, i8* %zybc_6, i8* %zybc_8, i8* %zybc_9, i8* %zybc_10, i8* %zybc_11, i8* %zybc_13, i8* %zybc_14, i8* %zybc_15, i8* %zybc_17, i8* %zybc_19, i8* %zybc_20)
  %51 = bitcast i8* %50 to double*
  store double 2.123000e+03, double* %51, align 8
  store i32 0, i32* %i, align 4
  call void @_Z4joinj(i32 1592384566)
  br label %52

; <label>:52                                      ; preds = %125, %0
  %53 = load i32* %i, align 4
  %54 = load i32* %1, align 4
  %55 = icmp slt i32 %53, %54
  br i1 %55, label %56, label %128

; <label>:56                                      ; preds = %52
  store i32 0, i32* %j, align 4
  br label %57

; <label>:57                                      ; preds = %106, %56
  %58 = load i32* %j, align 4
  %59 = load i32* %3, align 4
  %60 = icmp slt i32 %58, %59
  br i1 %60, label %61, label %109

; <label>:61                                      ; preds = %57
  %62 = load i32* %i, align 4
  %63 = sitofp i32 %62 to double
  %64 = load i32* %j, align 4
  %65 = sitofp i32 %64 to double
  %66 = fmul double %63, %65
  %67 = load i32* %1, align 4
  %68 = sitofp i32 %67 to double
  %69 = fdiv double %66, %68
  %70 = load i32* %i, align 4
  %71 = sext i32 %70 to i64
  %72 = load double** %7, align 8
  %73 = mul nsw i64 %71, %14
  %74 = getelementptr inbounds double* %72, i64 %73
  %75 = bitcast double* %74 to i8*
  %76 = load i32* %j, align 4
  %77 = sext i32 %76 to i64
  %78 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %_RV_pmd_A_42880832, i8* %75, i64 %77, i64 8, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str72, i32 0, i32 0), i32 31, i32 12, i8* getelementptr inbounds ([8 x i8]* @.str75, i32 0, i32 0))
  %79 = load double** %7, align 8
  %80 = bitcast double* %79 to i8*
  %81 = load i32* %i, align 4
  %82 = sext i32 %81 to i64
  %83 = load i32* %4, align 4
  %84 = zext i32 %83 to i64
  %85 = mul nuw i64 8, %84
  %86 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %_RV_pmd_A_42880832, i8* %80, i64 %82, i64 %85, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str72, i32 0, i32 0), i32 31, i32 9, i8* getelementptr inbounds ([5 x i8]* @.str66, i32 0, i32 0))
  %87 = load double** %7, align 8
  %88 = mul nsw i64 %86, %14
  %89 = getelementptr inbounds double* %87, i64 %88
  %90 = getelementptr inbounds double* %89, i64 %78
  store double %69, double* %90, align 8
  br label %91

; <label>:91                                      ; preds = %61
  %92 = load i8* %_RV_ret_flag, align 1
  %93 = icmp ne i8 %92, 0
  br i1 %93, label %94, label %95

; <label>:94                                      ; preds = %91
  br label %110

; <label>:95                                      ; preds = %91
  %96 = load i8* %_RV_bc_flag_42885560, align 1
  %97 = zext i8 %96 to i32
  %98 = icmp eq i32 %97, 1
  br i1 %98, label %99, label %100

; <label>:99                                      ; preds = %95
  store i8 0, i8* %_RV_bc_flag_42885560, align 1
  br label %109

; <label>:100                                     ; preds = %95
  %101 = load i8* %_RV_bc_flag_42885560, align 1
  %102 = zext i8 %101 to i32
  %103 = icmp eq i32 %102, 2
  br i1 %103, label %104, label %105

; <label>:104                                     ; preds = %100
  store i8 0, i8* %_RV_bc_flag_42885560, align 1
  br label %105

; <label>:105                                     ; preds = %104, %100
  br label %106

; <label>:106                                     ; preds = %105
  %107 = load i32* %j, align 4
  %108 = add nsw i32 %107, 1
  store i32 %108, i32* %j, align 4
  br label %57

; <label>:109                                     ; preds = %99, %57
  br label %110

; <label>:110                                     ; preds = %109, %94
  %111 = load i8* %_RV_ret_flag, align 1
  %112 = icmp ne i8 %111, 0
  br i1 %112, label %113, label %114

; <label>:113                                     ; preds = %110
  br label %363

; <label>:114                                     ; preds = %110
  %115 = load i8* %_RV_bc_flag_42885600, align 1
  %116 = zext i8 %115 to i32
  %117 = icmp eq i32 %116, 1
  br i1 %117, label %118, label %119

; <label>:118                                     ; preds = %114
  store i8 0, i8* %_RV_bc_flag_42885600, align 1
  br label %128

; <label>:119                                     ; preds = %114
  %120 = load i8* %_RV_bc_flag_42885600, align 1
  %121 = zext i8 %120 to i32
  %122 = icmp eq i32 %121, 2
  br i1 %122, label %123, label %124

; <label>:123                                     ; preds = %119
  store i8 0, i8* %_RV_bc_flag_42885600, align 1
  br label %124

; <label>:124                                     ; preds = %123, %119
  br label %125

; <label>:125                                     ; preds = %124
  %126 = load i32* %i, align 4
  %127 = add nsw i32 %126, 1
  store i32 %127, i32* %i, align 4
  br label %52

; <label>:128                                     ; preds = %118, %52
  store i32 0, i32* %i, align 4
  br label %129

; <label>:129                                     ; preds = %203, %128
  %130 = load i32* %i, align 4
  %131 = load i32* %3, align 4
  %132 = icmp slt i32 %130, %131
  br i1 %132, label %133, label %206

; <label>:133                                     ; preds = %129
  store i32 0, i32* %j, align 4
  br label %134

; <label>:134                                     ; preds = %184, %133
  %135 = load i32* %j, align 4
  %136 = load i32* %2, align 4
  %137 = icmp slt i32 %135, %136
  br i1 %137, label %138, label %187

; <label>:138                                     ; preds = %134
  %139 = load i32* %i, align 4
  %140 = sitofp i32 %139 to double
  %141 = load i32* %j, align 4
  %142 = add nsw i32 %141, 1
  %143 = sitofp i32 %142 to double
  %144 = fmul double %140, %143
  %145 = load i32* %2, align 4
  %146 = sitofp i32 %145 to double
  %147 = fdiv double %144, %146
  %148 = load i32* %i, align 4
  %149 = sext i32 %148 to i64
  %150 = load double** %8, align 8
  %151 = mul nsw i64 %149, %18
  %152 = getelementptr inbounds double* %150, i64 %151
  %153 = bitcast double* %152 to i8*
  %154 = load i32* %j, align 4
  %155 = sext i32 %154 to i64
  %156 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %_RV_pmd_B_42881328, i8* %153, i64 %155, i64 8, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str72, i32 0, i32 0), i32 34, i32 12, i8* getelementptr inbounds ([8 x i8]* @.str76, i32 0, i32 0))
  %157 = load double** %8, align 8
  %158 = bitcast double* %157 to i8*
  %159 = load i32* %i, align 4
  %160 = sext i32 %159 to i64
  %161 = load i32* %2, align 4
  %162 = zext i32 %161 to i64
  %163 = mul nuw i64 8, %162
  %164 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %_RV_pmd_B_42881328, i8* %158, i64 %160, i64 %163, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str72, i32 0, i32 0), i32 34, i32 9, i8* getelementptr inbounds ([5 x i8]* @.str77, i32 0, i32 0))
  %165 = load double** %8, align 8
  %166 = mul nsw i64 %164, %18
  %167 = getelementptr inbounds double* %165, i64 %166
  %168 = getelementptr inbounds double* %167, i64 %156
  store double %147, double* %168, align 8
  br label %169

; <label>:169                                     ; preds = %138
  %170 = load i8* %_RV_ret_flag, align 1
  %171 = icmp ne i8 %170, 0
  br i1 %171, label %172, label %173

; <label>:172                                     ; preds = %169
  br label %188

; <label>:173                                     ; preds = %169
  %174 = load i8* %_RV_bc_flag_42887232, align 1
  %175 = zext i8 %174 to i32
  %176 = icmp eq i32 %175, 1
  br i1 %176, label %177, label %178

; <label>:177                                     ; preds = %173
  store i8 0, i8* %_RV_bc_flag_42887232, align 1
  br label %187

; <label>:178                                     ; preds = %173
  %179 = load i8* %_RV_bc_flag_42887232, align 1
  %180 = zext i8 %179 to i32
  %181 = icmp eq i32 %180, 2
  br i1 %181, label %182, label %183

; <label>:182                                     ; preds = %178
  store i8 0, i8* %_RV_bc_flag_42887232, align 1
  br label %183

; <label>:183                                     ; preds = %182, %178
  br label %184

; <label>:184                                     ; preds = %183
  %185 = load i32* %j, align 4
  %186 = add nsw i32 %185, 1
  store i32 %186, i32* %j, align 4
  br label %134

; <label>:187                                     ; preds = %177, %134
  br label %188

; <label>:188                                     ; preds = %187, %172
  %189 = load i8* %_RV_ret_flag, align 1
  %190 = icmp ne i8 %189, 0
  br i1 %190, label %191, label %192

; <label>:191                                     ; preds = %188
  br label %363

; <label>:192                                     ; preds = %188
  %193 = load i8* %_RV_bc_flag_42887272, align 1
  %194 = zext i8 %193 to i32
  %195 = icmp eq i32 %194, 1
  br i1 %195, label %196, label %197

; <label>:196                                     ; preds = %192
  store i8 0, i8* %_RV_bc_flag_42887272, align 1
  br label %206

; <label>:197                                     ; preds = %192
  %198 = load i8* %_RV_bc_flag_42887272, align 1
  %199 = zext i8 %198 to i32
  %200 = icmp eq i32 %199, 2
  br i1 %200, label %201, label %202

; <label>:201                                     ; preds = %197
  store i8 0, i8* %_RV_bc_flag_42887272, align 1
  br label %202

; <label>:202                                     ; preds = %201, %197
  br label %203

; <label>:203                                     ; preds = %202
  %204 = load i32* %i, align 4
  %205 = add nsw i32 %204, 1
  store i32 %205, i32* %i, align 4
  br label %129

; <label>:206                                     ; preds = %196, %129
  store i32 0, i32* %i, align 4
  br label %207

; <label>:207                                     ; preds = %281, %206
  %208 = load i32* %i, align 4
  %209 = load i32* %4, align 4
  %210 = icmp slt i32 %208, %209
  br i1 %210, label %211, label %284

; <label>:211                                     ; preds = %207
  store i32 0, i32* %j, align 4
  br label %212

; <label>:212                                     ; preds = %262, %211
  %213 = load i32* %j, align 4
  %214 = load i32* %2, align 4
  %215 = icmp slt i32 %213, %214
  br i1 %215, label %216, label %265

; <label>:216                                     ; preds = %212
  %217 = load i32* %i, align 4
  %218 = sitofp i32 %217 to double
  %219 = load i32* %j, align 4
  %220 = add nsw i32 %219, 3
  %221 = sitofp i32 %220 to double
  %222 = fmul double %218, %221
  %223 = load i32* %4, align 4
  %224 = sitofp i32 %223 to double
  %225 = fdiv double %222, %224
  %226 = load i32* %i, align 4
  %227 = sext i32 %226 to i64
  %228 = load double** %9, align 8
  %229 = mul nsw i64 %227, %22
  %230 = getelementptr inbounds double* %228, i64 %229
  %231 = bitcast double* %230 to i8*
  %232 = load i32* %j, align 4
  %233 = sext i32 %232 to i64
  %234 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %_RV_pmd_C_42881824, i8* %231, i64 %233, i64 8, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str72, i32 0, i32 0), i32 37, i32 12, i8* getelementptr inbounds ([8 x i8]* @.str78, i32 0, i32 0))
  %235 = load double** %9, align 8
  %236 = bitcast double* %235 to i8*
  %237 = load i32* %i, align 4
  %238 = sext i32 %237 to i64
  %239 = load i32* %2, align 4
  %240 = zext i32 %239 to i64
  %241 = mul nuw i64 8, %240
  %242 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %_RV_pmd_C_42881824, i8* %236, i64 %238, i64 %241, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str72, i32 0, i32 0), i32 37, i32 9, i8* getelementptr inbounds ([5 x i8]* @.str79, i32 0, i32 0))
  %243 = load double** %9, align 8
  %244 = mul nsw i64 %242, %22
  %245 = getelementptr inbounds double* %243, i64 %244
  %246 = getelementptr inbounds double* %245, i64 %234
  store double %225, double* %246, align 8
  br label %247

; <label>:247                                     ; preds = %216
  %248 = load i8* %_RV_ret_flag, align 1
  %249 = icmp ne i8 %248, 0
  br i1 %249, label %250, label %251

; <label>:250                                     ; preds = %247
  br label %266

; <label>:251                                     ; preds = %247
  %252 = load i8* %_RV_bc_flag_42889368, align 1
  %253 = zext i8 %252 to i32
  %254 = icmp eq i32 %253, 1
  br i1 %254, label %255, label %256

; <label>:255                                     ; preds = %251
  store i8 0, i8* %_RV_bc_flag_42889368, align 1
  br label %265

; <label>:256                                     ; preds = %251
  %257 = load i8* %_RV_bc_flag_42889368, align 1
  %258 = zext i8 %257 to i32
  %259 = icmp eq i32 %258, 2
  br i1 %259, label %260, label %261

; <label>:260                                     ; preds = %256
  store i8 0, i8* %_RV_bc_flag_42889368, align 1
  br label %261

; <label>:261                                     ; preds = %260, %256
  br label %262

; <label>:262                                     ; preds = %261
  %263 = load i32* %j, align 4
  %264 = add nsw i32 %263, 1
  store i32 %264, i32* %j, align 4
  br label %212

; <label>:265                                     ; preds = %255, %212
  br label %266

; <label>:266                                     ; preds = %265, %250
  %267 = load i8* %_RV_ret_flag, align 1
  %268 = icmp ne i8 %267, 0
  br i1 %268, label %269, label %270

; <label>:269                                     ; preds = %266
  br label %363

; <label>:270                                     ; preds = %266
  %271 = load i8* %_RV_bc_flag_42889408, align 1
  %272 = zext i8 %271 to i32
  %273 = icmp eq i32 %272, 1
  br i1 %273, label %274, label %275

; <label>:274                                     ; preds = %270
  store i8 0, i8* %_RV_bc_flag_42889408, align 1
  br label %284

; <label>:275                                     ; preds = %270
  %276 = load i8* %_RV_bc_flag_42889408, align 1
  %277 = zext i8 %276 to i32
  %278 = icmp eq i32 %277, 2
  br i1 %278, label %279, label %280

; <label>:279                                     ; preds = %275
  store i8 0, i8* %_RV_bc_flag_42889408, align 1
  br label %280

; <label>:280                                     ; preds = %279, %275
  br label %281

; <label>:281                                     ; preds = %280
  %282 = load i32* %i, align 4
  %283 = add nsw i32 %282, 1
  store i32 %283, i32* %i, align 4
  br label %207

; <label>:284                                     ; preds = %274, %207
  store i32 0, i32* %i, align 4
  br label %285

; <label>:285                                     ; preds = %359, %284
  %286 = load i32* %i, align 4
  %287 = load i32* %1, align 4
  %288 = icmp slt i32 %286, %287
  br i1 %288, label %289, label %362

; <label>:289                                     ; preds = %285
  store i32 0, i32* %j, align 4
  br label %290

; <label>:290                                     ; preds = %340, %289
  %291 = load i32* %j, align 4
  %292 = load i32* %4, align 4
  %293 = icmp slt i32 %291, %292
  br i1 %293, label %294, label %343

; <label>:294                                     ; preds = %290
  %295 = load i32* %i, align 4
  %296 = sitofp i32 %295 to double
  %297 = load i32* %j, align 4
  %298 = add nsw i32 %297, 2
  %299 = sitofp i32 %298 to double
  %300 = fmul double %296, %299
  %301 = load i32* %3, align 4
  %302 = sitofp i32 %301 to double
  %303 = fdiv double %300, %302
  %304 = load i32* %i, align 4
  %305 = sext i32 %304 to i64
  %306 = load double** %10, align 8
  %307 = mul nsw i64 %305, %26
  %308 = getelementptr inbounds double* %306, i64 %307
  %309 = bitcast double* %308 to i8*
  %310 = load i32* %j, align 4
  %311 = sext i32 %310 to i64
  %312 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %_RV_pmd_D_42882320, i8* %309, i64 %311, i64 8, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str72, i32 0, i32 0), i32 40, i32 12, i8* getelementptr inbounds ([8 x i8]* @.str51, i32 0, i32 0))
  %313 = load double** %10, align 8
  %314 = bitcast double* %313 to i8*
  %315 = load i32* %i, align 4
  %316 = sext i32 %315 to i64
  %317 = load i32* %4, align 4
  %318 = zext i32 %317 to i64
  %319 = mul nuw i64 8, %318
  %320 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %_RV_pmd_D_42882320, i8* %314, i64 %316, i64 %319, i8* getelementptr inbounds ([6 x i8]* @.str30, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str72, i32 0, i32 0), i32 40, i32 9, i8* getelementptr inbounds ([5 x i8]* @.str52, i32 0, i32 0))
  %321 = load double** %10, align 8
  %322 = mul nsw i64 %320, %26
  %323 = getelementptr inbounds double* %321, i64 %322
  %324 = getelementptr inbounds double* %323, i64 %312
  store double %303, double* %324, align 8
  br label %325

; <label>:325                                     ; preds = %294
  %326 = load i8* %_RV_ret_flag, align 1
  %327 = icmp ne i8 %326, 0
  br i1 %327, label %328, label %329

; <label>:328                                     ; preds = %325
  br label %344

; <label>:329                                     ; preds = %325
  %330 = load i8* %_RV_bc_flag_42891040, align 1
  %331 = zext i8 %330 to i32
  %332 = icmp eq i32 %331, 1
  br i1 %332, label %333, label %334

; <label>:333                                     ; preds = %329
  store i8 0, i8* %_RV_bc_flag_42891040, align 1
  br label %343

; <label>:334                                     ; preds = %329
  %335 = load i8* %_RV_bc_flag_42891040, align 1
  %336 = zext i8 %335 to i32
  %337 = icmp eq i32 %336, 2
  br i1 %337, label %338, label %339

; <label>:338                                     ; preds = %334
  store i8 0, i8* %_RV_bc_flag_42891040, align 1
  br label %339

; <label>:339                                     ; preds = %338, %334
  br label %340

; <label>:340                                     ; preds = %339
  %341 = load i32* %j, align 4
  %342 = add nsw i32 %341, 1
  store i32 %342, i32* %j, align 4
  br label %290

; <label>:343                                     ; preds = %333, %290
  br label %344

; <label>:344                                     ; preds = %343, %328
  %345 = load i8* %_RV_ret_flag, align 1
  %346 = icmp ne i8 %345, 0
  br i1 %346, label %347, label %348

; <label>:347                                     ; preds = %344
  br label %363

; <label>:348                                     ; preds = %344
  %349 = load i8* %_RV_bc_flag_42891080, align 1
  %350 = zext i8 %349 to i32
  %351 = icmp eq i32 %350, 1
  br i1 %351, label %352, label %353

; <label>:352                                     ; preds = %348
  store i8 0, i8* %_RV_bc_flag_42891080, align 1
  br label %362

; <label>:353                                     ; preds = %348
  %354 = load i8* %_RV_bc_flag_42891080, align 1
  %355 = zext i8 %354 to i32
  %356 = icmp eq i32 %355, 2
  br i1 %356, label %357, label %358

; <label>:357                                     ; preds = %353
  store i8 0, i8* %_RV_bc_flag_42891080, align 1
  br label %358

; <label>:358                                     ; preds = %357, %353
  br label %359

; <label>:359                                     ; preds = %358
  %360 = load i32* %i, align 4
  %361 = add nsw i32 %360, 1
  store i32 %361, i32* %i, align 4
  br label %285

; <label>:362                                     ; preds = %352, %285
  br label %363

; <label>:363                                     ; preds = %362, %347, %269, %191, %113
  call void @_RV_pmd_set_null(%struct._RV_pmd* %_RV_pmd_alpha_42855160)
  call void @_RV_pmd_set_null(%struct._RV_pmd* %_RV_pmd_beta_42855280)
  call void @_RV_pmd_set_null(%struct._RV_pmd* %_RV_pmd_A_42880832)
  call void @_RV_pmd_set_null(%struct._RV_pmd* %_RV_pmd_B_42881328)
  call void @_RV_pmd_set_null(%struct._RV_pmd* %_RV_pmd_C_42881824)
  call void @_RV_pmd_set_null(%struct._RV_pmd* %_RV_pmd_D_42882320)
  %364 = load %struct._RV_stat_node** %_RV_stack_sa, align 8
  %365 = getelementptr inbounds %struct._RV_stat_node* %364, i32 0, i32 0
  store i32 0, i32* %365, align 4
  %366 = load %struct._RV_stat_node** %_RV_stack_sa, align 8
  %367 = call i32 @_RV_stat_node_dec(%struct._RV_stat_node* %366)
  ret void
}

declare void @_Z4joinj(i32)

define internal void @_spawn_loop_free_func_0_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

declare void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)

define internal void @_spawn_loop_free_func_1_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %9 = bitcast i8* %0 to i8*
  %10 = bitcast i8* %1 to i8*
  %11 = bitcast i8* %2 to i8*
  %12 = bitcast i8* %3 to i64*
  %zt_ = ptrtoint i64* %12 to i64
  %13 = bitcast i8* %4 to i8*
  %14 = bitcast i8* %5 to i8*
  %15 = bitcast i8* %6 to i32*
  %zt_1 = ptrtoint i32* %15 to i32
  %16 = bitcast i8* %7 to i32*
  %zt_2 = ptrtoint i32* %16 to i32
  %17 = bitcast i8* %8 to i8*
  %18 = call i8* @_RV_check_dpc(i8* %9, i8* %10, i8* %11, i64 %zt_, i8* %13, i8* %14, i32 %zt_1, i32 %zt_2, i8* %17)
  ret void
}

declare void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_(i32, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)

define internal void @_spawn_loop_free_func_2_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_3_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_4_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_5_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_6_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_7_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_8_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_9_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_10_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_11_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_12_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_13_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_14_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_15_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

declare void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)

define internal void @_spawn_loop_free_func_16_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_17_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_18_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_19_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_20_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_21_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_22_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_23_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_24_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_25_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_26_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_27_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_28_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_29_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_30_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_31_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_32_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_33_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_34_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_35_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_36_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_37_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_38_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_39_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_40_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_41_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_42_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_43_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_44_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_45_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_46_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_47_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_48_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_49_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_50_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_51_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_52_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_53_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_54_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_55_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_56_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_57_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_58_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_59_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_60_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_61_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_62_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_63_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_64_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_65_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_66_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_67_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_68_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_69_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_70_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_71_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_72_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_73_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_74_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_75_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_76_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_77_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_78_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_79_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_80_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_81_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_82_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_83_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_84_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_85_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_86_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_87_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_88_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_89_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_90_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_91_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_92_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_93_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_94_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_95_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_96_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_97_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_98_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_99_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_100_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_101_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_102_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_103_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_104_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_105_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_106_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_107_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_108_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_109_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %18 = bitcast i8* %0 to %struct._RV_pmd*
  %19 = bitcast i8* %1 to i8*
  %20 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %20 to i64
  %21 = bitcast i8* %3 to i64*
  %zt_1 = ptrtoint i64* %21 to i64
  %22 = bitcast i8* %4 to i8*
  %23 = bitcast i8* %5 to i8*
  %24 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %24 to i32
  %25 = bitcast i8* %7 to i32*
  %zt_3 = ptrtoint i32* %25 to i32
  %26 = bitcast i8* %8 to i8*
  %27 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %18, i8* %19, i64 %zt_, i64 %zt_1, i8* %22, i8* %23, i32 %zt_2, i32 %zt_3, i8* %26)
  %28 = bitcast i8* %9 to %struct._RV_pmd*
  %29 = bitcast i8* %10 to i8*
  %30 = bitcast i8* %11 to i64*
  %zt_4 = ptrtoint i64* %30 to i64
  %31 = bitcast i8* %12 to i64*
  %zt_5 = ptrtoint i64* %31 to i64
  %32 = bitcast i8* %13 to i8*
  %33 = bitcast i8* %14 to i8*
  %34 = bitcast i8* %15 to i32*
  %zt_6 = ptrtoint i32* %34 to i32
  %35 = bitcast i8* %16 to i32*
  %zt_7 = ptrtoint i32* %35 to i32
  %36 = bitcast i8* %17 to i8*
  %37 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %28, i8* %29, i64 %zt_4, i64 %zt_5, i8* %32, i8* %33, i32 %zt_6, i32 %zt_7, i8* %36)
  ret void
}

declare void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)

define internal void @_spawn_loop_free_func_110_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %18 = bitcast i8* %0 to %struct._RV_pmd*
  %19 = bitcast i8* %1 to i8*
  %20 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %20 to i64
  %21 = bitcast i8* %3 to i64*
  %zt_1 = ptrtoint i64* %21 to i64
  %22 = bitcast i8* %4 to i8*
  %23 = bitcast i8* %5 to i8*
  %24 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %24 to i32
  %25 = bitcast i8* %7 to i32*
  %zt_3 = ptrtoint i32* %25 to i32
  %26 = bitcast i8* %8 to i8*
  %27 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %18, i8* %19, i64 %zt_, i64 %zt_1, i8* %22, i8* %23, i32 %zt_2, i32 %zt_3, i8* %26)
  %28 = bitcast i8* %9 to %struct._RV_pmd*
  %29 = bitcast i8* %10 to i8*
  %30 = bitcast i8* %11 to i64*
  %zt_4 = ptrtoint i64* %30 to i64
  %31 = bitcast i8* %12 to i64*
  %zt_5 = ptrtoint i64* %31 to i64
  %32 = bitcast i8* %13 to i8*
  %33 = bitcast i8* %14 to i8*
  %34 = bitcast i8* %15 to i32*
  %zt_6 = ptrtoint i32* %34 to i32
  %35 = bitcast i8* %16 to i32*
  %zt_7 = ptrtoint i32* %35 to i32
  %36 = bitcast i8* %17 to i8*
  %37 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %28, i8* %29, i64 %zt_4, i64 %zt_5, i8* %32, i8* %33, i32 %zt_6, i32 %zt_7, i8* %36)
  ret void
}

define internal void @_spawn_loop_free_func_111_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %17 = bitcast i8* %0 to %struct._RV_pmd*
  %18 = bitcast i8* %1 to i8*
  %19 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %19 to i64
  %20 = bitcast i8* %3 to i64*
  %zt_1 = ptrtoint i64* %20 to i64
  %21 = bitcast i8* %4 to i8*
  %22 = bitcast i8* %5 to i8*
  %23 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %23 to i32
  %24 = bitcast i8* %7 to i32*
  %zt_3 = ptrtoint i32* %24 to i32
  %25 = bitcast i8* %8 to i8*
  %26 = call i64 @_RV_check_dpv_ss(%struct._RV_pmd* %17, i8* %18, i64 %zt_, i64 %zt_1, i8* %21, i8* %22, i32 %zt_2, i32 %zt_3, i8* %25)
  %27 = bitcast i8* %9 to %struct._RV_pmd*
  %28 = bitcast i8* %10 to i8*
  %29 = bitcast i8* %11 to i64*
  %zt_4 = ptrtoint i64* %29 to i64
  %30 = bitcast i8* %12 to i8*
  %31 = bitcast i8* %13 to i8*
  %32 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %32 to i32
  %33 = bitcast i8* %15 to i32*
  %zt_6 = ptrtoint i32* %33 to i32
  %34 = bitcast i8* %16 to i8*
  %35 = call i8* @_RV_check_dpv(%struct._RV_pmd* %27, i8* %28, i64 %zt_4, i8* %30, i8* %31, i32 %zt_5, i32 %zt_6, i8* %34)
  ret void
}

declare void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)

define internal void @_spawn_loop_free_func_112_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_113_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_114_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_115_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_116_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to %struct._RV_pmd*
  %9 = bitcast i8* %1 to i8*
  %10 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %10 to i64
  %11 = bitcast i8* %3 to i8*
  %12 = bitcast i8* %4 to i8*
  %13 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %13 to i32
  %14 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %14 to i32
  %15 = bitcast i8* %7 to i8*
  %16 = call i8* @_RV_check_dpv(%struct._RV_pmd* %8, i8* %9, i64 %zt_, i8* %11, i8* %12, i32 %zt_1, i32 %zt_2, i8* %15)
  ret void
}

define internal void @_spawn_loop_free_func_117_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_118_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_119_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

define internal void @_spawn_loop_free_func_120_0(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to %struct._RV_pmd*
  %17 = bitcast i8* %1 to i8*
  %18 = bitcast i8* %2 to i64*
  %zt_ = ptrtoint i64* %18 to i64
  %19 = bitcast i8* %3 to i8*
  %20 = bitcast i8* %4 to i8*
  %21 = bitcast i8* %5 to i32*
  %zt_1 = ptrtoint i32* %21 to i32
  %22 = bitcast i8* %6 to i32*
  %zt_2 = ptrtoint i32* %22 to i32
  %23 = bitcast i8* %7 to i8*
  %24 = call i8* @_RV_check_dpv(%struct._RV_pmd* %16, i8* %17, i64 %zt_, i8* %19, i8* %20, i32 %zt_1, i32 %zt_2, i8* %23)
  %25 = bitcast i8* %8 to %struct._RV_pmd*
  %26 = bitcast i8* %9 to i8*
  %27 = bitcast i8* %10 to i64*
  %zt_3 = ptrtoint i64* %27 to i64
  %28 = bitcast i8* %11 to i8*
  %29 = bitcast i8* %12 to i8*
  %30 = bitcast i8* %13 to i32*
  %zt_4 = ptrtoint i32* %30 to i32
  %31 = bitcast i8* %14 to i32*
  %zt_5 = ptrtoint i32* %31 to i32
  %32 = bitcast i8* %15 to i8*
  %33 = call i8* @_RV_check_dpv(%struct._RV_pmd* %25, i8* %26, i64 %zt_3, i8* %28, i8* %29, i32 %zt_4, i32 %zt_5, i8* %32)
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readnone }
attributes #10 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 "}

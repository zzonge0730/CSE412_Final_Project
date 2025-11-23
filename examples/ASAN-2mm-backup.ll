; ModuleID = '2mm.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str = internal unnamed_addr constant { [8 x i8], [56 x i8] } { [8 x i8] c"%0.2lf \00", [56 x i8] zeroinitializer }, align 32
@.str1 = private unnamed_addr constant [6 x i8] c"2mm.c\00", align 1
@.asan_loc_descr = private unnamed_addr constant { [6 x i8]*, i32, i32 } { [6 x i8]* @.str1, i32 54, i32 24 }
@.str2 = private unnamed_addr constant [17 x i8] c"<string literal>\00", align 1
@.str3 = internal unnamed_addr constant { [2 x i8], [62 x i8] } { [2 x i8] c"\0A\00", [62 x i8] zeroinitializer }, align 32
@.asan_loc_descr4 = private unnamed_addr constant { [6 x i8]*, i32, i32 } { [6 x i8]* @.str1, i32 55, i32 52 }
@llvm.compiler.used = appending global [4 x i8*] [i8* bitcast ({ [6 x i8]*, i32, i32 }* @.asan_loc_descr to i8*), i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0), i8* bitcast ({ [6 x i8]*, i32, i32 }* @.asan_loc_descr4 to i8*), i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)], section "llvm.metadata"
@llvm.global_ctors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 1, void ()* @asan.module_ctor }]
@__asan_option_detect_stack_use_after_return = external global i32
@__asan_gen_ = private unnamed_addr constant [167 x i8] c"15 32 4 0  48 4 0  64 8 0  96 4 9 dump_code 112 4 2 ni 128 4 2 nj 144 4 2 nk 160 4 2 nl 176 8 5 alpha 208 8 4 beta 240 8 3 tmp 272 8 1 A 304 8 1 B 336 8 1 C 368 8 1 D\00", align 1
@__asan_gen_5 = private unnamed_addr constant [108 x i8] c"12 32 4 0  48 4 0  64 4 0  80 4 0  96 8 0  128 8 0  160 8 0  192 8 0  224 8 0  256 8 0  288 4 1 i 304 4 1 j\00", align 1
@__asan_gen_6 = private unnamed_addr constant [127 x i8] c"14 32 4 0  48 4 0  64 4 0  80 4 0  96 8 0  128 8 0  160 8 0  192 8 0  224 8 0  256 8 0  288 8 0  320 4 1 i 336 4 1 j 352 4 1 k\00", align 1
@__asan_gen_7 = private unnamed_addr constant [45 x i8] c"5 32 4 0  48 4 0  64 8 0  96 4 1 i 112 4 1 j\00", align 1
@__asan_gen_8 = private constant [6 x i8] c"2mm.c\00", align 1
@0 = internal global [2 x { i64, i64, i64, i64, i64, i64, i64 }] [{ i64, i64, i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [8 x i8], [56 x i8] }* @.str to i64), i64 8, i64 64, i64 ptrtoint ([17 x i8]* @.str2 to i64), i64 ptrtoint ([6 x i8]* @__asan_gen_8 to i64), i64 0, i64 ptrtoint ({ [6 x i8]*, i32, i32 }* @.asan_loc_descr to i64) }, { i64, i64, i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [2 x i8], [62 x i8] }* @.str3 to i64), i64 2, i64 64, i64 ptrtoint ([17 x i8]* @.str2 to i64), i64 ptrtoint ([6 x i8]* @__asan_gen_8 to i64), i64 0, i64 ptrtoint ({ [6 x i8]*, i32, i32 }* @.asan_loc_descr4 to i64) }]
@llvm.global_dtors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 1, void ()* @asan.module_dtor }]

; Function Attrs: nounwind sanitize_address uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %MyAlloca = alloca [416 x i8], align 32
  %1 = ptrtoint [416 x i8]* %MyAlloca to i64
  %2 = load i32* @__asan_option_detect_stack_use_after_return
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %6

; <label>:4                                       ; preds = %0
  %5 = call i64 @__asan_stack_malloc_3(i64 416, i64 %1)
  br label %6

; <label>:6                                       ; preds = %0, %4
  %7 = phi i64 [ %1, %0 ], [ %5, %4 ]
  %8 = add i64 %7, 32
  %9 = inttoptr i64 %8 to i32*
  %10 = add i64 %7, 48
  %11 = inttoptr i64 %10 to i32*
  %12 = add i64 %7, 64
  %13 = inttoptr i64 %12 to i8***
  %14 = add i64 %7, 96
  %15 = inttoptr i64 %14 to i32*
  %16 = add i64 %7, 112
  %17 = inttoptr i64 %16 to i32*
  %18 = add i64 %7, 128
  %19 = inttoptr i64 %18 to i32*
  %20 = add i64 %7, 144
  %21 = inttoptr i64 %20 to i32*
  %22 = add i64 %7, 160
  %23 = inttoptr i64 %22 to i32*
  %24 = add i64 %7, 176
  %25 = inttoptr i64 %24 to double*
  %26 = add i64 %7, 208
  %27 = inttoptr i64 %26 to double*
  %28 = add i64 %7, 240
  %29 = inttoptr i64 %28 to double**
  %30 = add i64 %7, 272
  %31 = inttoptr i64 %30 to double**
  %32 = add i64 %7, 304
  %33 = inttoptr i64 %32 to double**
  %34 = add i64 %7, 336
  %35 = inttoptr i64 %34 to double**
  %36 = add i64 %7, 368
  %37 = inttoptr i64 %36 to double**
  %38 = inttoptr i64 %7 to i64*
  store i64 1102416563, i64* %38
  %39 = add i64 %7, 8
  %40 = inttoptr i64 %39 to i64*
  store i64 ptrtoint ([167 x i8]* @__asan_gen_ to i64), i64* %40
  %41 = add i64 %7, 16
  %42 = inttoptr i64 %41 to i64*
  store i64 ptrtoint (i32 (i32, i8**)* @main to i64), i64* %42
  %43 = lshr i64 %7, 3
  %44 = add i64 %43, 2147450880
  %45 = add i64 %44, 0
  %46 = inttoptr i64 %45 to i64*
  store i64 -1007414313571192335, i64* %46
  %47 = add i64 %44, 8
  %48 = inttoptr i64 %47 to i64*
  store i64 -1007414313554349568, i64* %48
  %49 = add i64 %44, 16
  %50 = inttoptr i64 %49 to i64*
  store i64 -1008540213476789756, i64* %50
  %51 = add i64 %44, 24
  %52 = inttoptr i64 %51 to i64*
  store i64 -1008539191274835214, i64* %52
  %53 = add i64 %44, 32
  %54 = inttoptr i64 %53 to i64*
  store i64 -1008539191274835214, i64* %54
  %55 = add i64 %44, 40
  %56 = inttoptr i64 %55 to i64*
  store i64 -936481597236907278, i64* %56
  %57 = add i64 %44, 48
  %58 = inttoptr i64 %57 to i32*
  store i32 -202116109, i32* %58
  %59 = ptrtoint i32* %9 to i64
  call void @__asan_store4(i64 %59)
  store i32 0, i32* %9
  %60 = ptrtoint i32* %11 to i64
  call void @__asan_store4(i64 %60)
  store i32 %argc, i32* %11, align 4
  %61 = ptrtoint i8*** %13 to i64
  call void @__asan_store8(i64 %61)
  store i8** %argv, i8*** %13, align 8
  %62 = load i8*** %13, align 8
  %63 = getelementptr inbounds i8** %62, i64 1
  %64 = ptrtoint i8** %63 to i64
  call void @__asan_load8(i64 %64)
  %65 = load i8** %63, align 8
  %66 = call i32 @atoi(i8* %65) #4
  %67 = ptrtoint i32* %15 to i64
  call void @__asan_store4(i64 %67)
  store i32 %66, i32* %15, align 4
  %68 = ptrtoint i8*** %13 to i64
  call void @__asan_load8(i64 %68)
  %69 = load i8*** %13, align 8
  %70 = getelementptr inbounds i8** %69, i64 2
  %71 = ptrtoint i8** %70 to i64
  call void @__asan_load8(i64 %71)
  %72 = load i8** %70, align 8
  %73 = call i32 @atoi(i8* %72) #4
  %74 = ptrtoint i32* %17 to i64
  call void @__asan_store4(i64 %74)
  store i32 %73, i32* %17, align 4
  %75 = ptrtoint i8*** %13 to i64
  call void @__asan_load8(i64 %75)
  %76 = load i8*** %13, align 8
  %77 = getelementptr inbounds i8** %76, i64 3
  %78 = ptrtoint i8** %77 to i64
  call void @__asan_load8(i64 %78)
  %79 = load i8** %77, align 8
  %80 = call i32 @atoi(i8* %79) #4
  %81 = ptrtoint i32* %19 to i64
  call void @__asan_store4(i64 %81)
  store i32 %80, i32* %19, align 4
  %82 = ptrtoint i8*** %13 to i64
  call void @__asan_load8(i64 %82)
  %83 = load i8*** %13, align 8
  %84 = getelementptr inbounds i8** %83, i64 4
  %85 = ptrtoint i8** %84 to i64
  call void @__asan_load8(i64 %85)
  %86 = load i8** %84, align 8
  %87 = call i32 @atoi(i8* %86) #4
  %88 = ptrtoint i32* %21 to i64
  call void @__asan_store4(i64 %88)
  store i32 %87, i32* %21, align 4
  %89 = ptrtoint i8*** %13 to i64
  call void @__asan_load8(i64 %89)
  %90 = load i8*** %13, align 8
  %91 = getelementptr inbounds i8** %90, i64 5
  %92 = ptrtoint i8** %91 to i64
  call void @__asan_load8(i64 %92)
  %93 = load i8** %91, align 8
  %94 = call i32 @atoi(i8* %93) #4
  %95 = ptrtoint i32* %23 to i64
  call void @__asan_store4(i64 %95)
  store i32 %94, i32* %23, align 4
  %96 = ptrtoint i32* %17 to i64
  call void @__asan_load4(i64 %96)
  %97 = load i32* %17, align 4
  %98 = zext i32 %97 to i64
  %99 = ptrtoint i32* %19 to i64
  call void @__asan_load4(i64 %99)
  %100 = load i32* %19, align 4
  %101 = zext i32 %100 to i64
  %102 = load i32* %17, align 4
  %103 = zext i32 %102 to i64
  %104 = load i32* %19, align 4
  %105 = zext i32 %104 to i64
  %106 = load i32* %17, align 4
  %107 = load i32* %19, align 4
  %108 = mul nsw i32 %106, %107
  %109 = sext i32 %108 to i64
  %110 = mul i64 %109, 8
  %111 = call noalias i8* @malloc(i64 %110) #5
  %112 = bitcast i8* %111 to double*
  %113 = ptrtoint double** %29 to i64
  call void @__asan_store8(i64 %113)
  store double* %112, double** %29, align 8
  %114 = ptrtoint i32* %17 to i64
  call void @__asan_load4(i64 %114)
  %115 = load i32* %17, align 4
  %116 = zext i32 %115 to i64
  %117 = ptrtoint i32* %21 to i64
  call void @__asan_load4(i64 %117)
  %118 = load i32* %21, align 4
  %119 = zext i32 %118 to i64
  %120 = load i32* %17, align 4
  %121 = zext i32 %120 to i64
  %122 = load i32* %21, align 4
  %123 = zext i32 %122 to i64
  %124 = load i32* %17, align 4
  %125 = load i32* %21, align 4
  %126 = mul nsw i32 %124, %125
  %127 = sext i32 %126 to i64
  %128 = mul i64 %127, 8
  %129 = call noalias i8* @malloc(i64 %128) #5
  %130 = bitcast i8* %129 to double*
  %131 = ptrtoint double** %31 to i64
  call void @__asan_store8(i64 %131)
  store double* %130, double** %31, align 8
  %132 = ptrtoint i32* %21 to i64
  call void @__asan_load4(i64 %132)
  %133 = load i32* %21, align 4
  %134 = zext i32 %133 to i64
  %135 = ptrtoint i32* %19 to i64
  call void @__asan_load4(i64 %135)
  %136 = load i32* %19, align 4
  %137 = zext i32 %136 to i64
  %138 = load i32* %21, align 4
  %139 = zext i32 %138 to i64
  %140 = load i32* %19, align 4
  %141 = zext i32 %140 to i64
  %142 = load i32* %21, align 4
  %143 = load i32* %19, align 4
  %144 = mul nsw i32 %142, %143
  %145 = sext i32 %144 to i64
  %146 = mul i64 %145, 8
  %147 = call noalias i8* @malloc(i64 %146) #5
  %148 = bitcast i8* %147 to double*
  %149 = ptrtoint double** %33 to i64
  call void @__asan_store8(i64 %149)
  store double* %148, double** %33, align 8
  %150 = ptrtoint i32* %23 to i64
  call void @__asan_load4(i64 %150)
  %151 = load i32* %23, align 4
  %152 = zext i32 %151 to i64
  %153 = ptrtoint i32* %19 to i64
  call void @__asan_load4(i64 %153)
  %154 = load i32* %19, align 4
  %155 = zext i32 %154 to i64
  %156 = load i32* %23, align 4
  %157 = zext i32 %156 to i64
  %158 = load i32* %19, align 4
  %159 = zext i32 %158 to i64
  %160 = load i32* %23, align 4
  %161 = load i32* %19, align 4
  %162 = mul nsw i32 %160, %161
  %163 = sext i32 %162 to i64
  %164 = mul i64 %163, 8
  %165 = call noalias i8* @malloc(i64 %164) #5
  %166 = bitcast i8* %165 to double*
  %167 = ptrtoint double** %35 to i64
  call void @__asan_store8(i64 %167)
  store double* %166, double** %35, align 8
  %168 = ptrtoint i32* %17 to i64
  call void @__asan_load4(i64 %168)
  %169 = load i32* %17, align 4
  %170 = zext i32 %169 to i64
  %171 = ptrtoint i32* %23 to i64
  call void @__asan_load4(i64 %171)
  %172 = load i32* %23, align 4
  %173 = zext i32 %172 to i64
  %174 = load i32* %17, align 4
  %175 = zext i32 %174 to i64
  %176 = load i32* %23, align 4
  %177 = zext i32 %176 to i64
  %178 = load i32* %17, align 4
  %179 = load i32* %23, align 4
  %180 = mul nsw i32 %178, %179
  %181 = sext i32 %180 to i64
  %182 = mul i64 %181, 8
  %183 = call noalias i8* @malloc(i64 %182) #5
  %184 = bitcast i8* %183 to double*
  %185 = ptrtoint double** %37 to i64
  call void @__asan_store8(i64 %185)
  store double* %184, double** %37, align 8
  %186 = ptrtoint i32* %17 to i64
  call void @__asan_load4(i64 %186)
  %187 = load i32* %17, align 4
  %188 = ptrtoint i32* %19 to i64
  call void @__asan_load4(i64 %188)
  %189 = load i32* %19, align 4
  %190 = ptrtoint i32* %21 to i64
  call void @__asan_load4(i64 %190)
  %191 = load i32* %21, align 4
  %192 = ptrtoint i32* %23 to i64
  call void @__asan_load4(i64 %192)
  %193 = load i32* %23, align 4
  %194 = ptrtoint double** %31 to i64
  call void @__asan_load8(i64 %194)
  %195 = load double** %31, align 8
  %196 = ptrtoint double** %33 to i64
  call void @__asan_load8(i64 %196)
  %197 = load double** %33, align 8
  %198 = ptrtoint double** %35 to i64
  call void @__asan_load8(i64 %198)
  %199 = load double** %35, align 8
  %200 = load double** %37, align 8
  call void @init_array(i32 %187, i32 %189, i32 %191, i32 %193, double* %25, double* %27, double* %195, double* %197, double* %199, double* %200)
  %201 = ptrtoint i32* %17 to i64
  call void @__asan_load4(i64 %201)
  %202 = load i32* %17, align 4
  %203 = ptrtoint i32* %19 to i64
  call void @__asan_load4(i64 %203)
  %204 = load i32* %19, align 4
  %205 = ptrtoint i32* %21 to i64
  call void @__asan_load4(i64 %205)
  %206 = load i32* %21, align 4
  %207 = ptrtoint i32* %23 to i64
  call void @__asan_load4(i64 %207)
  %208 = load i32* %23, align 4
  %209 = ptrtoint double* %25 to i64
  call void @__asan_load8(i64 %209)
  %210 = load double* %25, align 8
  %211 = ptrtoint double* %27 to i64
  call void @__asan_load8(i64 %211)
  %212 = load double* %27, align 8
  %213 = ptrtoint double** %29 to i64
  call void @__asan_load8(i64 %213)
  %214 = load double** %29, align 8
  %215 = ptrtoint double** %31 to i64
  call void @__asan_load8(i64 %215)
  %216 = load double** %31, align 8
  %217 = ptrtoint double** %33 to i64
  call void @__asan_load8(i64 %217)
  %218 = load double** %33, align 8
  %219 = ptrtoint double** %35 to i64
  call void @__asan_load8(i64 %219)
  %220 = load double** %35, align 8
  %221 = ptrtoint double** %37 to i64
  call void @__asan_load8(i64 %221)
  %222 = load double** %37, align 8
  call void @kernel_2mm(i32 %202, i32 %204, i32 %206, i32 %208, double %210, double %212, double* %214, double* %216, double* %218, double* %220, double* %222)
  %223 = ptrtoint i32* %15 to i64
  call void @__asan_load4(i64 %223)
  %224 = load i32* %15, align 4
  %225 = icmp eq i32 %224, 1
  br i1 %225, label %226, label %233

; <label>:226                                     ; preds = %6
  %227 = ptrtoint i32* %17 to i64
  call void @__asan_load4(i64 %227)
  %228 = load i32* %17, align 4
  %229 = ptrtoint i32* %23 to i64
  call void @__asan_load4(i64 %229)
  %230 = load i32* %23, align 4
  %231 = ptrtoint double** %37 to i64
  call void @__asan_load8(i64 %231)
  %232 = load double** %37, align 8
  call void @print_array(i32 %228, i32 %230, double* %232)
  br label %233

; <label>:233                                     ; preds = %226, %6
  %234 = ptrtoint double** %29 to i64
  call void @__asan_load8(i64 %234)
  %235 = load double** %29, align 8
  %236 = bitcast double* %235 to i8*
  call void @free(i8* %236) #5
  %237 = ptrtoint double** %31 to i64
  call void @__asan_load8(i64 %237)
  %238 = load double** %31, align 8
  %239 = bitcast double* %238 to i8*
  call void @free(i8* %239) #5
  %240 = ptrtoint double** %33 to i64
  call void @__asan_load8(i64 %240)
  %241 = load double** %33, align 8
  %242 = bitcast double* %241 to i8*
  call void @free(i8* %242) #5
  %243 = ptrtoint double** %35 to i64
  call void @__asan_load8(i64 %243)
  %244 = load double** %35, align 8
  %245 = bitcast double* %244 to i8*
  call void @free(i8* %245) #5
  %246 = ptrtoint double** %37 to i64
  call void @__asan_load8(i64 %246)
  %247 = load double** %37, align 8
  %248 = bitcast double* %247 to i8*
  call void @free(i8* %248) #5
  store i64 1172321806, i64* %38
  %249 = icmp ne i64 %7, %1
  br i1 %249, label %250, label %271

; <label>:250                                     ; preds = %233
  %251 = add i64 %44, 0
  %252 = inttoptr i64 %251 to i64*
  store i64 -723401728380766731, i64* %252
  %253 = add i64 %44, 8
  %254 = inttoptr i64 %253 to i64*
  store i64 -723401728380766731, i64* %254
  %255 = add i64 %44, 16
  %256 = inttoptr i64 %255 to i64*
  store i64 -723401728380766731, i64* %256
  %257 = add i64 %44, 24
  %258 = inttoptr i64 %257 to i64*
  store i64 -723401728380766731, i64* %258
  %259 = add i64 %44, 32
  %260 = inttoptr i64 %259 to i64*
  store i64 -723401728380766731, i64* %260
  %261 = add i64 %44, 40
  %262 = inttoptr i64 %261 to i64*
  store i64 -723401728380766731, i64* %262
  %263 = add i64 %44, 48
  %264 = inttoptr i64 %263 to i64*
  store i64 -723401728380766731, i64* %264
  %265 = add i64 %44, 56
  %266 = inttoptr i64 %265 to i64*
  store i64 -723401728380766731, i64* %266
  %267 = add i64 %7, 504
  %268 = inttoptr i64 %267 to i64*
  %269 = load i64* %268
  %270 = inttoptr i64 %269 to i8*
  store i8 0, i8* %270
  br label %286

; <label>:271                                     ; preds = %233
  %272 = add i64 %44, 0
  %273 = inttoptr i64 %272 to i64*
  store i64 0, i64* %273
  %274 = add i64 %44, 8
  %275 = inttoptr i64 %274 to i64*
  store i64 0, i64* %275
  %276 = add i64 %44, 16
  %277 = inttoptr i64 %276 to i64*
  store i64 0, i64* %277
  %278 = add i64 %44, 24
  %279 = inttoptr i64 %278 to i64*
  store i64 0, i64* %279
  %280 = add i64 %44, 32
  %281 = inttoptr i64 %280 to i64*
  store i64 0, i64* %281
  %282 = add i64 %44, 40
  %283 = inttoptr i64 %282 to i64*
  store i64 0, i64* %283
  %284 = add i64 %44, 48
  %285 = inttoptr i64 %284 to i32*
  store i32 0, i32* %285
  br label %286

; <label>:286                                     ; preds = %271, %250
  ret i32 0
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind sanitize_address uwtable
define internal void @init_array(i32 %ni, i32 %nj, i32 %nk, i32 %nl, double* %alpha, double* %beta, double* %A, double* %B, double* %C, double* %D) #0 {
  %MyAlloca = alloca [320 x i8], align 32
  %1 = ptrtoint [320 x i8]* %MyAlloca to i64
  %2 = load i32* @__asan_option_detect_stack_use_after_return
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %6

; <label>:4                                       ; preds = %0
  %5 = call i64 @__asan_stack_malloc_3(i64 320, i64 %1)
  br label %6

; <label>:6                                       ; preds = %0, %4
  %7 = phi i64 [ %1, %0 ], [ %5, %4 ]
  %8 = add i64 %7, 32
  %9 = inttoptr i64 %8 to i32*
  %10 = add i64 %7, 48
  %11 = inttoptr i64 %10 to i32*
  %12 = add i64 %7, 64
  %13 = inttoptr i64 %12 to i32*
  %14 = add i64 %7, 80
  %15 = inttoptr i64 %14 to i32*
  %16 = add i64 %7, 96
  %17 = inttoptr i64 %16 to double**
  %18 = add i64 %7, 128
  %19 = inttoptr i64 %18 to double**
  %20 = add i64 %7, 160
  %21 = inttoptr i64 %20 to double**
  %22 = add i64 %7, 192
  %23 = inttoptr i64 %22 to double**
  %24 = add i64 %7, 224
  %25 = inttoptr i64 %24 to double**
  %26 = add i64 %7, 256
  %27 = inttoptr i64 %26 to double**
  %28 = add i64 %7, 288
  %29 = inttoptr i64 %28 to i32*
  %30 = add i64 %7, 304
  %31 = inttoptr i64 %30 to i32*
  %32 = inttoptr i64 %7 to i64*
  store i64 1102416563, i64* %32
  %33 = add i64 %7, 8
  %34 = inttoptr i64 %33 to i64*
  store i64 ptrtoint ([108 x i8]* @__asan_gen_5 to i64), i64* %34
  %35 = add i64 %7, 16
  %36 = inttoptr i64 %35 to i64*
  store i64 ptrtoint (void (i32, i32, i32, i32, double*, double*, double*, double*, double*, double*)* @init_array to i64), i64* %36
  %37 = lshr i64 %7, 3
  %38 = add i64 %37, 2147450880
  %39 = add i64 %38, 0
  %40 = inttoptr i64 %39 to i64*
  store i64 -1007414313571192335, i64* %40
  %41 = add i64 %38, 8
  %42 = inttoptr i64 %41 to i64*
  store i64 -940423286292680188, i64* %42
  %43 = add i64 %38, 16
  %44 = inttoptr i64 %43 to i64*
  store i64 -940423286277082624, i64* %44
  %45 = add i64 %38, 24
  %46 = inttoptr i64 %45 to i64*
  store i64 -940423286277082624, i64* %46
  %47 = add i64 %38, 32
  %48 = inttoptr i64 %47 to i64*
  store i64 -935356719516421632, i64* %48
  %49 = ptrtoint i32* %9 to i64
  call void @__asan_store4(i64 %49)
  store i32 %ni, i32* %9, align 4
  %50 = ptrtoint i32* %11 to i64
  call void @__asan_store4(i64 %50)
  store i32 %nj, i32* %11, align 4
  %51 = ptrtoint i32* %13 to i64
  call void @__asan_store4(i64 %51)
  store i32 %nk, i32* %13, align 4
  %52 = ptrtoint i32* %15 to i64
  call void @__asan_store4(i64 %52)
  store i32 %nl, i32* %15, align 4
  %53 = ptrtoint double** %17 to i64
  call void @__asan_store8(i64 %53)
  store double* %alpha, double** %17, align 8
  %54 = ptrtoint double** %19 to i64
  call void @__asan_store8(i64 %54)
  store double* %beta, double** %19, align 8
  %55 = ptrtoint double** %21 to i64
  call void @__asan_store8(i64 %55)
  store double* %A, double** %21, align 8
  %56 = ptrtoint double** %23 to i64
  call void @__asan_store8(i64 %56)
  store double* %B, double** %23, align 8
  %57 = ptrtoint double** %25 to i64
  call void @__asan_store8(i64 %57)
  store double* %C, double** %25, align 8
  %58 = ptrtoint double** %27 to i64
  call void @__asan_store8(i64 %58)
  store double* %D, double** %27, align 8
  %59 = load i32* %9, align 4
  %60 = zext i32 %59 to i64
  %61 = load i32* %15, align 4
  %62 = zext i32 %61 to i64
  %63 = load i32* %13, align 4
  %64 = zext i32 %63 to i64
  %65 = load i32* %11, align 4
  %66 = zext i32 %65 to i64
  %67 = load i32* %15, align 4
  %68 = zext i32 %67 to i64
  %69 = load i32* %11, align 4
  %70 = zext i32 %69 to i64
  %71 = load i32* %9, align 4
  %72 = zext i32 %71 to i64
  %73 = load i32* %15, align 4
  %74 = zext i32 %73 to i64
  %75 = load double** %17, align 8
  %76 = ptrtoint double* %75 to i64
  call void @__asan_store8(i64 %76)
  store double 3.241200e+04, double* %75, align 8
  %77 = load double** %19, align 8
  %78 = ptrtoint double* %77 to i64
  call void @__asan_store8(i64 %78)
  store double 2.123000e+03, double* %77, align 8
  %79 = ptrtoint i32* %29 to i64
  call void @__asan_store4(i64 %79)
  store i32 0, i32* %29, align 4
  br label %80

; <label>:80                                      ; preds = %121, %6
  %81 = ptrtoint i32* %29 to i64
  call void @__asan_load4(i64 %81)
  %82 = load i32* %29, align 4
  %83 = ptrtoint i32* %9 to i64
  call void @__asan_load4(i64 %83)
  %84 = load i32* %9, align 4
  %85 = icmp slt i32 %82, %84
  br i1 %85, label %86, label %125

; <label>:86                                      ; preds = %80
  %87 = ptrtoint i32* %31 to i64
  call void @__asan_store4(i64 %87)
  store i32 0, i32* %31, align 4
  br label %88

; <label>:88                                      ; preds = %116, %86
  %89 = ptrtoint i32* %31 to i64
  call void @__asan_load4(i64 %89)
  %90 = load i32* %31, align 4
  %91 = ptrtoint i32* %13 to i64
  call void @__asan_load4(i64 %91)
  %92 = load i32* %13, align 4
  %93 = icmp slt i32 %90, %92
  br i1 %93, label %94, label %120

; <label>:94                                      ; preds = %88
  %95 = ptrtoint i32* %29 to i64
  call void @__asan_load4(i64 %95)
  %96 = load i32* %29, align 4
  %97 = sitofp i32 %96 to double
  %98 = ptrtoint i32* %31 to i64
  call void @__asan_load4(i64 %98)
  %99 = load i32* %31, align 4
  %100 = sitofp i32 %99 to double
  %101 = fmul double %97, %100
  %102 = ptrtoint i32* %9 to i64
  call void @__asan_load4(i64 %102)
  %103 = load i32* %9, align 4
  %104 = sitofp i32 %103 to double
  %105 = fdiv double %101, %104
  %106 = load i32* %31, align 4
  %107 = sext i32 %106 to i64
  %108 = load i32* %29, align 4
  %109 = sext i32 %108 to i64
  %110 = ptrtoint double** %21 to i64
  call void @__asan_load8(i64 %110)
  %111 = load double** %21, align 8
  %112 = mul nsw i64 %109, %62
  %113 = getelementptr inbounds double* %111, i64 %112
  %114 = getelementptr inbounds double* %113, i64 %107
  %115 = ptrtoint double* %114 to i64
  call void @__asan_store8(i64 %115)
  store double %105, double* %114, align 8
  br label %116

; <label>:116                                     ; preds = %94
  %117 = ptrtoint i32* %31 to i64
  call void @__asan_load4(i64 %117)
  %118 = load i32* %31, align 4
  %119 = add nsw i32 %118, 1
  store i32 %119, i32* %31, align 4
  br label %88

; <label>:120                                     ; preds = %88
  br label %121

; <label>:121                                     ; preds = %120
  %122 = ptrtoint i32* %29 to i64
  call void @__asan_load4(i64 %122)
  %123 = load i32* %29, align 4
  %124 = add nsw i32 %123, 1
  store i32 %124, i32* %29, align 4
  br label %80

; <label>:125                                     ; preds = %80
  %126 = ptrtoint i32* %29 to i64
  call void @__asan_store4(i64 %126)
  store i32 0, i32* %29, align 4
  br label %127

; <label>:127                                     ; preds = %169, %125
  %128 = ptrtoint i32* %29 to i64
  call void @__asan_load4(i64 %128)
  %129 = load i32* %29, align 4
  %130 = ptrtoint i32* %13 to i64
  call void @__asan_load4(i64 %130)
  %131 = load i32* %13, align 4
  %132 = icmp slt i32 %129, %131
  br i1 %132, label %133, label %173

; <label>:133                                     ; preds = %127
  %134 = ptrtoint i32* %31 to i64
  call void @__asan_store4(i64 %134)
  store i32 0, i32* %31, align 4
  br label %135

; <label>:135                                     ; preds = %164, %133
  %136 = ptrtoint i32* %31 to i64
  call void @__asan_load4(i64 %136)
  %137 = load i32* %31, align 4
  %138 = ptrtoint i32* %11 to i64
  call void @__asan_load4(i64 %138)
  %139 = load i32* %11, align 4
  %140 = icmp slt i32 %137, %139
  br i1 %140, label %141, label %168

; <label>:141                                     ; preds = %135
  %142 = ptrtoint i32* %29 to i64
  call void @__asan_load4(i64 %142)
  %143 = load i32* %29, align 4
  %144 = sitofp i32 %143 to double
  %145 = ptrtoint i32* %31 to i64
  call void @__asan_load4(i64 %145)
  %146 = load i32* %31, align 4
  %147 = add nsw i32 %146, 1
  %148 = sitofp i32 %147 to double
  %149 = fmul double %144, %148
  %150 = ptrtoint i32* %11 to i64
  call void @__asan_load4(i64 %150)
  %151 = load i32* %11, align 4
  %152 = sitofp i32 %151 to double
  %153 = fdiv double %149, %152
  %154 = load i32* %31, align 4
  %155 = sext i32 %154 to i64
  %156 = load i32* %29, align 4
  %157 = sext i32 %156 to i64
  %158 = ptrtoint double** %23 to i64
  call void @__asan_load8(i64 %158)
  %159 = load double** %23, align 8
  %160 = mul nsw i64 %157, %66
  %161 = getelementptr inbounds double* %159, i64 %160
  %162 = getelementptr inbounds double* %161, i64 %155
  %163 = ptrtoint double* %162 to i64
  call void @__asan_store8(i64 %163)
  store double %153, double* %162, align 8
  br label %164

; <label>:164                                     ; preds = %141
  %165 = ptrtoint i32* %31 to i64
  call void @__asan_load4(i64 %165)
  %166 = load i32* %31, align 4
  %167 = add nsw i32 %166, 1
  store i32 %167, i32* %31, align 4
  br label %135

; <label>:168                                     ; preds = %135
  br label %169

; <label>:169                                     ; preds = %168
  %170 = ptrtoint i32* %29 to i64
  call void @__asan_load4(i64 %170)
  %171 = load i32* %29, align 4
  %172 = add nsw i32 %171, 1
  store i32 %172, i32* %29, align 4
  br label %127

; <label>:173                                     ; preds = %127
  %174 = ptrtoint i32* %29 to i64
  call void @__asan_store4(i64 %174)
  store i32 0, i32* %29, align 4
  br label %175

; <label>:175                                     ; preds = %217, %173
  %176 = ptrtoint i32* %29 to i64
  call void @__asan_load4(i64 %176)
  %177 = load i32* %29, align 4
  %178 = ptrtoint i32* %15 to i64
  call void @__asan_load4(i64 %178)
  %179 = load i32* %15, align 4
  %180 = icmp slt i32 %177, %179
  br i1 %180, label %181, label %221

; <label>:181                                     ; preds = %175
  %182 = ptrtoint i32* %31 to i64
  call void @__asan_store4(i64 %182)
  store i32 0, i32* %31, align 4
  br label %183

; <label>:183                                     ; preds = %212, %181
  %184 = ptrtoint i32* %31 to i64
  call void @__asan_load4(i64 %184)
  %185 = load i32* %31, align 4
  %186 = ptrtoint i32* %11 to i64
  call void @__asan_load4(i64 %186)
  %187 = load i32* %11, align 4
  %188 = icmp slt i32 %185, %187
  br i1 %188, label %189, label %216

; <label>:189                                     ; preds = %183
  %190 = ptrtoint i32* %29 to i64
  call void @__asan_load4(i64 %190)
  %191 = load i32* %29, align 4
  %192 = sitofp i32 %191 to double
  %193 = ptrtoint i32* %31 to i64
  call void @__asan_load4(i64 %193)
  %194 = load i32* %31, align 4
  %195 = add nsw i32 %194, 3
  %196 = sitofp i32 %195 to double
  %197 = fmul double %192, %196
  %198 = ptrtoint i32* %15 to i64
  call void @__asan_load4(i64 %198)
  %199 = load i32* %15, align 4
  %200 = sitofp i32 %199 to double
  %201 = fdiv double %197, %200
  %202 = load i32* %31, align 4
  %203 = sext i32 %202 to i64
  %204 = load i32* %29, align 4
  %205 = sext i32 %204 to i64
  %206 = ptrtoint double** %25 to i64
  call void @__asan_load8(i64 %206)
  %207 = load double** %25, align 8
  %208 = mul nsw i64 %205, %70
  %209 = getelementptr inbounds double* %207, i64 %208
  %210 = getelementptr inbounds double* %209, i64 %203
  %211 = ptrtoint double* %210 to i64
  call void @__asan_store8(i64 %211)
  store double %201, double* %210, align 8
  br label %212

; <label>:212                                     ; preds = %189
  %213 = ptrtoint i32* %31 to i64
  call void @__asan_load4(i64 %213)
  %214 = load i32* %31, align 4
  %215 = add nsw i32 %214, 1
  store i32 %215, i32* %31, align 4
  br label %183

; <label>:216                                     ; preds = %183
  br label %217

; <label>:217                                     ; preds = %216
  %218 = ptrtoint i32* %29 to i64
  call void @__asan_load4(i64 %218)
  %219 = load i32* %29, align 4
  %220 = add nsw i32 %219, 1
  store i32 %220, i32* %29, align 4
  br label %175

; <label>:221                                     ; preds = %175
  %222 = ptrtoint i32* %29 to i64
  call void @__asan_store4(i64 %222)
  store i32 0, i32* %29, align 4
  br label %223

; <label>:223                                     ; preds = %265, %221
  %224 = ptrtoint i32* %29 to i64
  call void @__asan_load4(i64 %224)
  %225 = load i32* %29, align 4
  %226 = ptrtoint i32* %9 to i64
  call void @__asan_load4(i64 %226)
  %227 = load i32* %9, align 4
  %228 = icmp slt i32 %225, %227
  br i1 %228, label %229, label %269

; <label>:229                                     ; preds = %223
  %230 = ptrtoint i32* %31 to i64
  call void @__asan_store4(i64 %230)
  store i32 0, i32* %31, align 4
  br label %231

; <label>:231                                     ; preds = %260, %229
  %232 = ptrtoint i32* %31 to i64
  call void @__asan_load4(i64 %232)
  %233 = load i32* %31, align 4
  %234 = ptrtoint i32* %15 to i64
  call void @__asan_load4(i64 %234)
  %235 = load i32* %15, align 4
  %236 = icmp slt i32 %233, %235
  br i1 %236, label %237, label %264

; <label>:237                                     ; preds = %231
  %238 = ptrtoint i32* %29 to i64
  call void @__asan_load4(i64 %238)
  %239 = load i32* %29, align 4
  %240 = sitofp i32 %239 to double
  %241 = ptrtoint i32* %31 to i64
  call void @__asan_load4(i64 %241)
  %242 = load i32* %31, align 4
  %243 = add nsw i32 %242, 2
  %244 = sitofp i32 %243 to double
  %245 = fmul double %240, %244
  %246 = ptrtoint i32* %13 to i64
  call void @__asan_load4(i64 %246)
  %247 = load i32* %13, align 4
  %248 = sitofp i32 %247 to double
  %249 = fdiv double %245, %248
  %250 = load i32* %31, align 4
  %251 = sext i32 %250 to i64
  %252 = load i32* %29, align 4
  %253 = sext i32 %252 to i64
  %254 = ptrtoint double** %27 to i64
  call void @__asan_load8(i64 %254)
  %255 = load double** %27, align 8
  %256 = mul nsw i64 %253, %74
  %257 = getelementptr inbounds double* %255, i64 %256
  %258 = getelementptr inbounds double* %257, i64 %251
  %259 = ptrtoint double* %258 to i64
  call void @__asan_store8(i64 %259)
  store double %249, double* %258, align 8
  br label %260

; <label>:260                                     ; preds = %237
  %261 = ptrtoint i32* %31 to i64
  call void @__asan_load4(i64 %261)
  %262 = load i32* %31, align 4
  %263 = add nsw i32 %262, 1
  store i32 %263, i32* %31, align 4
  br label %231

; <label>:264                                     ; preds = %231
  br label %265

; <label>:265                                     ; preds = %264
  %266 = ptrtoint i32* %29 to i64
  call void @__asan_load4(i64 %266)
  %267 = load i32* %29, align 4
  %268 = add nsw i32 %267, 1
  store i32 %268, i32* %29, align 4
  br label %223

; <label>:269                                     ; preds = %223
  store i64 1172321806, i64* %32
  %270 = icmp ne i64 %7, %1
  br i1 %270, label %271, label %292

; <label>:271                                     ; preds = %269
  %272 = add i64 %38, 0
  %273 = inttoptr i64 %272 to i64*
  store i64 -723401728380766731, i64* %273
  %274 = add i64 %38, 8
  %275 = inttoptr i64 %274 to i64*
  store i64 -723401728380766731, i64* %275
  %276 = add i64 %38, 16
  %277 = inttoptr i64 %276 to i64*
  store i64 -723401728380766731, i64* %277
  %278 = add i64 %38, 24
  %279 = inttoptr i64 %278 to i64*
  store i64 -723401728380766731, i64* %279
  %280 = add i64 %38, 32
  %281 = inttoptr i64 %280 to i64*
  store i64 -723401728380766731, i64* %281
  %282 = add i64 %38, 40
  %283 = inttoptr i64 %282 to i64*
  store i64 -723401728380766731, i64* %283
  %284 = add i64 %38, 48
  %285 = inttoptr i64 %284 to i64*
  store i64 -723401728380766731, i64* %285
  %286 = add i64 %38, 56
  %287 = inttoptr i64 %286 to i64*
  store i64 -723401728380766731, i64* %287
  %288 = add i64 %7, 504
  %289 = inttoptr i64 %288 to i64*
  %290 = load i64* %289
  %291 = inttoptr i64 %290 to i8*
  store i8 0, i8* %291
  br label %303

; <label>:292                                     ; preds = %269
  %293 = add i64 %38, 0
  %294 = inttoptr i64 %293 to i64*
  store i64 0, i64* %294
  %295 = add i64 %38, 8
  %296 = inttoptr i64 %295 to i64*
  store i64 0, i64* %296
  %297 = add i64 %38, 16
  %298 = inttoptr i64 %297 to i64*
  store i64 0, i64* %298
  %299 = add i64 %38, 24
  %300 = inttoptr i64 %299 to i64*
  store i64 0, i64* %300
  %301 = add i64 %38, 32
  %302 = inttoptr i64 %301 to i64*
  store i64 0, i64* %302
  br label %303

; <label>:303                                     ; preds = %292, %271
  ret void
}

; Function Attrs: nounwind sanitize_address uwtable
define internal void @kernel_2mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, double %alpha, double %beta, double* %tmp, double* %A, double* %B, double* %C, double* %D) #0 {
  %MyAlloca = alloca [384 x i8], align 32
  %1 = ptrtoint [384 x i8]* %MyAlloca to i64
  %2 = load i32* @__asan_option_detect_stack_use_after_return
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %6

; <label>:4                                       ; preds = %0
  %5 = call i64 @__asan_stack_malloc_3(i64 384, i64 %1)
  br label %6

; <label>:6                                       ; preds = %0, %4
  %7 = phi i64 [ %1, %0 ], [ %5, %4 ]
  %8 = add i64 %7, 32
  %9 = inttoptr i64 %8 to i32*
  %10 = add i64 %7, 48
  %11 = inttoptr i64 %10 to i32*
  %12 = add i64 %7, 64
  %13 = inttoptr i64 %12 to i32*
  %14 = add i64 %7, 80
  %15 = inttoptr i64 %14 to i32*
  %16 = add i64 %7, 96
  %17 = inttoptr i64 %16 to double*
  %18 = add i64 %7, 128
  %19 = inttoptr i64 %18 to double*
  %20 = add i64 %7, 160
  %21 = inttoptr i64 %20 to double**
  %22 = add i64 %7, 192
  %23 = inttoptr i64 %22 to double**
  %24 = add i64 %7, 224
  %25 = inttoptr i64 %24 to double**
  %26 = add i64 %7, 256
  %27 = inttoptr i64 %26 to double**
  %28 = add i64 %7, 288
  %29 = inttoptr i64 %28 to double**
  %30 = add i64 %7, 320
  %31 = inttoptr i64 %30 to i32*
  %32 = add i64 %7, 336
  %33 = inttoptr i64 %32 to i32*
  %34 = add i64 %7, 352
  %35 = inttoptr i64 %34 to i32*
  %36 = inttoptr i64 %7 to i64*
  store i64 1102416563, i64* %36
  %37 = add i64 %7, 8
  %38 = inttoptr i64 %37 to i64*
  store i64 ptrtoint ([127 x i8]* @__asan_gen_6 to i64), i64* %38
  %39 = add i64 %7, 16
  %40 = inttoptr i64 %39 to i64*
  store i64 ptrtoint (void (i32, i32, i32, i32, double, double, double*, double*, double*, double*, double*)* @kernel_2mm to i64), i64* %40
  %41 = lshr i64 %7, 3
  %42 = add i64 %41, 2147450880
  %43 = add i64 %42, 0
  %44 = inttoptr i64 %43 to i64*
  store i64 -1007414313571192335, i64* %44
  %45 = add i64 %42, 8
  %46 = inttoptr i64 %45 to i64*
  store i64 -940423286292680188, i64* %46
  %47 = add i64 %42, 16
  %48 = inttoptr i64 %47 to i64*
  store i64 -940423286277082624, i64* %48
  %49 = add i64 %42, 24
  %50 = inttoptr i64 %49 to i64*
  store i64 -940423286277082624, i64* %50
  %51 = add i64 %42, 32
  %52 = inttoptr i64 %51 to i64*
  store i64 -940423286277082624, i64* %52
  %53 = add i64 %42, 40
  %54 = inttoptr i64 %53 to i64*
  store i64 -868083100586544636, i64* %54
  %55 = ptrtoint i32* %9 to i64
  call void @__asan_store4(i64 %55)
  store i32 %ni, i32* %9, align 4
  %56 = ptrtoint i32* %11 to i64
  call void @__asan_store4(i64 %56)
  store i32 %nj, i32* %11, align 4
  %57 = ptrtoint i32* %13 to i64
  call void @__asan_store4(i64 %57)
  store i32 %nk, i32* %13, align 4
  %58 = ptrtoint i32* %15 to i64
  call void @__asan_store4(i64 %58)
  store i32 %nl, i32* %15, align 4
  %59 = ptrtoint double* %17 to i64
  call void @__asan_store8(i64 %59)
  store double %alpha, double* %17, align 8
  %60 = ptrtoint double* %19 to i64
  call void @__asan_store8(i64 %60)
  store double %beta, double* %19, align 8
  %61 = ptrtoint double** %21 to i64
  call void @__asan_store8(i64 %61)
  store double* %tmp, double** %21, align 8
  %62 = ptrtoint double** %23 to i64
  call void @__asan_store8(i64 %62)
  store double* %A, double** %23, align 8
  %63 = ptrtoint double** %25 to i64
  call void @__asan_store8(i64 %63)
  store double* %B, double** %25, align 8
  %64 = ptrtoint double** %27 to i64
  call void @__asan_store8(i64 %64)
  store double* %C, double** %27, align 8
  %65 = ptrtoint double** %29 to i64
  call void @__asan_store8(i64 %65)
  store double* %D, double** %29, align 8
  %66 = load i32* %9, align 4
  %67 = zext i32 %66 to i64
  %68 = load i32* %11, align 4
  %69 = zext i32 %68 to i64
  %70 = load i32* %9, align 4
  %71 = zext i32 %70 to i64
  %72 = load i32* %13, align 4
  %73 = zext i32 %72 to i64
  %74 = load i32* %13, align 4
  %75 = zext i32 %74 to i64
  %76 = load i32* %11, align 4
  %77 = zext i32 %76 to i64
  %78 = load i32* %15, align 4
  %79 = zext i32 %78 to i64
  %80 = load i32* %11, align 4
  %81 = zext i32 %80 to i64
  %82 = load i32* %9, align 4
  %83 = zext i32 %82 to i64
  %84 = load i32* %15, align 4
  %85 = zext i32 %84 to i64
  %86 = ptrtoint i32* %31 to i64
  call void @__asan_store4(i64 %86)
  store i32 0, i32* %31, align 4
  br label %87

; <label>:87                                      ; preds = %173, %6
  %88 = ptrtoint i32* %31 to i64
  call void @__asan_load4(i64 %88)
  %89 = load i32* %31, align 4
  %90 = ptrtoint i32* %9 to i64
  call void @__asan_load4(i64 %90)
  %91 = load i32* %9, align 4
  %92 = icmp slt i32 %89, %91
  br i1 %92, label %93, label %177

; <label>:93                                      ; preds = %87
  %94 = ptrtoint i32* %33 to i64
  call void @__asan_store4(i64 %94)
  store i32 0, i32* %33, align 4
  br label %95

; <label>:95                                      ; preds = %168, %93
  %96 = ptrtoint i32* %33 to i64
  call void @__asan_load4(i64 %96)
  %97 = load i32* %33, align 4
  %98 = ptrtoint i32* %11 to i64
  call void @__asan_load4(i64 %98)
  %99 = load i32* %11, align 4
  %100 = icmp slt i32 %97, %99
  br i1 %100, label %101, label %172

; <label>:101                                     ; preds = %95
  %102 = ptrtoint i32* %33 to i64
  call void @__asan_load4(i64 %102)
  %103 = load i32* %33, align 4
  %104 = sext i32 %103 to i64
  %105 = ptrtoint i32* %31 to i64
  call void @__asan_load4(i64 %105)
  %106 = load i32* %31, align 4
  %107 = sext i32 %106 to i64
  %108 = ptrtoint double** %21 to i64
  call void @__asan_load8(i64 %108)
  %109 = load double** %21, align 8
  %110 = mul nsw i64 %107, %69
  %111 = getelementptr inbounds double* %109, i64 %110
  %112 = getelementptr inbounds double* %111, i64 %104
  %113 = ptrtoint double* %112 to i64
  call void @__asan_store8(i64 %113)
  store double 0.000000e+00, double* %112, align 8
  %114 = ptrtoint i32* %35 to i64
  call void @__asan_store4(i64 %114)
  store i32 0, i32* %35, align 4
  br label %115

; <label>:115                                     ; preds = %163, %101
  %116 = ptrtoint i32* %35 to i64
  call void @__asan_load4(i64 %116)
  %117 = load i32* %35, align 4
  %118 = ptrtoint i32* %13 to i64
  call void @__asan_load4(i64 %118)
  %119 = load i32* %13, align 4
  %120 = icmp slt i32 %117, %119
  br i1 %120, label %121, label %167

; <label>:121                                     ; preds = %115
  %122 = ptrtoint double* %17 to i64
  call void @__asan_load8(i64 %122)
  %123 = load double* %17, align 8
  %124 = ptrtoint i32* %35 to i64
  call void @__asan_load4(i64 %124)
  %125 = load i32* %35, align 4
  %126 = sext i32 %125 to i64
  %127 = ptrtoint i32* %31 to i64
  call void @__asan_load4(i64 %127)
  %128 = load i32* %31, align 4
  %129 = sext i32 %128 to i64
  %130 = ptrtoint double** %23 to i64
  call void @__asan_load8(i64 %130)
  %131 = load double** %23, align 8
  %132 = mul nsw i64 %129, %73
  %133 = getelementptr inbounds double* %131, i64 %132
  %134 = getelementptr inbounds double* %133, i64 %126
  %135 = ptrtoint double* %134 to i64
  call void @__asan_load8(i64 %135)
  %136 = load double* %134, align 8
  %137 = fmul double %123, %136
  %138 = ptrtoint i32* %33 to i64
  call void @__asan_load4(i64 %138)
  %139 = load i32* %33, align 4
  %140 = sext i32 %139 to i64
  %141 = load i32* %35, align 4
  %142 = sext i32 %141 to i64
  %143 = ptrtoint double** %25 to i64
  call void @__asan_load8(i64 %143)
  %144 = load double** %25, align 8
  %145 = mul nsw i64 %142, %77
  %146 = getelementptr inbounds double* %144, i64 %145
  %147 = getelementptr inbounds double* %146, i64 %140
  %148 = ptrtoint double* %147 to i64
  call void @__asan_load8(i64 %148)
  %149 = load double* %147, align 8
  %150 = fmul double %137, %149
  %151 = load i32* %33, align 4
  %152 = sext i32 %151 to i64
  %153 = load i32* %31, align 4
  %154 = sext i32 %153 to i64
  %155 = ptrtoint double** %21 to i64
  call void @__asan_load8(i64 %155)
  %156 = load double** %21, align 8
  %157 = mul nsw i64 %154, %69
  %158 = getelementptr inbounds double* %156, i64 %157
  %159 = getelementptr inbounds double* %158, i64 %152
  %160 = ptrtoint double* %159 to i64
  call void @__asan_load8(i64 %160)
  %161 = load double* %159, align 8
  %162 = fadd double %161, %150
  store double %162, double* %159, align 8
  br label %163

; <label>:163                                     ; preds = %121
  %164 = ptrtoint i32* %35 to i64
  call void @__asan_load4(i64 %164)
  %165 = load i32* %35, align 4
  %166 = add nsw i32 %165, 1
  store i32 %166, i32* %35, align 4
  br label %115

; <label>:167                                     ; preds = %115
  br label %168

; <label>:168                                     ; preds = %167
  %169 = ptrtoint i32* %33 to i64
  call void @__asan_load4(i64 %169)
  %170 = load i32* %33, align 4
  %171 = add nsw i32 %170, 1
  store i32 %171, i32* %33, align 4
  br label %95

; <label>:172                                     ; preds = %95
  br label %173

; <label>:173                                     ; preds = %172
  %174 = ptrtoint i32* %31 to i64
  call void @__asan_load4(i64 %174)
  %175 = load i32* %31, align 4
  %176 = add nsw i32 %175, 1
  store i32 %176, i32* %31, align 4
  br label %87

; <label>:177                                     ; preds = %87
  %178 = ptrtoint i32* %31 to i64
  call void @__asan_store4(i64 %178)
  store i32 0, i32* %31, align 4
  br label %179

; <label>:179                                     ; preds = %266, %177
  %180 = ptrtoint i32* %31 to i64
  call void @__asan_load4(i64 %180)
  %181 = load i32* %31, align 4
  %182 = ptrtoint i32* %9 to i64
  call void @__asan_load4(i64 %182)
  %183 = load i32* %9, align 4
  %184 = icmp slt i32 %181, %183
  br i1 %184, label %185, label %270

; <label>:185                                     ; preds = %179
  %186 = ptrtoint i32* %33 to i64
  call void @__asan_store4(i64 %186)
  store i32 0, i32* %33, align 4
  br label %187

; <label>:187                                     ; preds = %261, %185
  %188 = ptrtoint i32* %33 to i64
  call void @__asan_load4(i64 %188)
  %189 = load i32* %33, align 4
  %190 = ptrtoint i32* %15 to i64
  call void @__asan_load4(i64 %190)
  %191 = load i32* %15, align 4
  %192 = icmp slt i32 %189, %191
  br i1 %192, label %193, label %265

; <label>:193                                     ; preds = %187
  %194 = ptrtoint double* %19 to i64
  call void @__asan_load8(i64 %194)
  %195 = load double* %19, align 8
  %196 = ptrtoint i32* %33 to i64
  call void @__asan_load4(i64 %196)
  %197 = load i32* %33, align 4
  %198 = sext i32 %197 to i64
  %199 = ptrtoint i32* %31 to i64
  call void @__asan_load4(i64 %199)
  %200 = load i32* %31, align 4
  %201 = sext i32 %200 to i64
  %202 = ptrtoint double** %29 to i64
  call void @__asan_load8(i64 %202)
  %203 = load double** %29, align 8
  %204 = mul nsw i64 %201, %85
  %205 = getelementptr inbounds double* %203, i64 %204
  %206 = getelementptr inbounds double* %205, i64 %198
  %207 = ptrtoint double* %206 to i64
  call void @__asan_load8(i64 %207)
  %208 = load double* %206, align 8
  %209 = fmul double %208, %195
  store double %209, double* %206, align 8
  %210 = ptrtoint i32* %35 to i64
  call void @__asan_store4(i64 %210)
  store i32 0, i32* %35, align 4
  br label %211

; <label>:211                                     ; preds = %256, %193
  %212 = ptrtoint i32* %35 to i64
  call void @__asan_load4(i64 %212)
  %213 = load i32* %35, align 4
  %214 = ptrtoint i32* %11 to i64
  call void @__asan_load4(i64 %214)
  %215 = load i32* %11, align 4
  %216 = icmp slt i32 %213, %215
  br i1 %216, label %217, label %260

; <label>:217                                     ; preds = %211
  %218 = ptrtoint i32* %35 to i64
  call void @__asan_load4(i64 %218)
  %219 = load i32* %35, align 4
  %220 = sext i32 %219 to i64
  %221 = ptrtoint i32* %31 to i64
  call void @__asan_load4(i64 %221)
  %222 = load i32* %31, align 4
  %223 = sext i32 %222 to i64
  %224 = ptrtoint double** %21 to i64
  call void @__asan_load8(i64 %224)
  %225 = load double** %21, align 8
  %226 = mul nsw i64 %223, %69
  %227 = getelementptr inbounds double* %225, i64 %226
  %228 = getelementptr inbounds double* %227, i64 %220
  %229 = ptrtoint double* %228 to i64
  call void @__asan_load8(i64 %229)
  %230 = load double* %228, align 8
  %231 = ptrtoint i32* %33 to i64
  call void @__asan_load4(i64 %231)
  %232 = load i32* %33, align 4
  %233 = sext i32 %232 to i64
  %234 = load i32* %35, align 4
  %235 = sext i32 %234 to i64
  %236 = ptrtoint double** %27 to i64
  call void @__asan_load8(i64 %236)
  %237 = load double** %27, align 8
  %238 = mul nsw i64 %235, %81
  %239 = getelementptr inbounds double* %237, i64 %238
  %240 = getelementptr inbounds double* %239, i64 %233
  %241 = ptrtoint double* %240 to i64
  call void @__asan_load8(i64 %241)
  %242 = load double* %240, align 8
  %243 = fmul double %230, %242
  %244 = load i32* %33, align 4
  %245 = sext i32 %244 to i64
  %246 = load i32* %31, align 4
  %247 = sext i32 %246 to i64
  %248 = ptrtoint double** %29 to i64
  call void @__asan_load8(i64 %248)
  %249 = load double** %29, align 8
  %250 = mul nsw i64 %247, %85
  %251 = getelementptr inbounds double* %249, i64 %250
  %252 = getelementptr inbounds double* %251, i64 %245
  %253 = ptrtoint double* %252 to i64
  call void @__asan_load8(i64 %253)
  %254 = load double* %252, align 8
  %255 = fadd double %254, %243
  store double %255, double* %252, align 8
  br label %256

; <label>:256                                     ; preds = %217
  %257 = ptrtoint i32* %35 to i64
  call void @__asan_load4(i64 %257)
  %258 = load i32* %35, align 4
  %259 = add nsw i32 %258, 1
  store i32 %259, i32* %35, align 4
  br label %211

; <label>:260                                     ; preds = %211
  br label %261

; <label>:261                                     ; preds = %260
  %262 = ptrtoint i32* %33 to i64
  call void @__asan_load4(i64 %262)
  %263 = load i32* %33, align 4
  %264 = add nsw i32 %263, 1
  store i32 %264, i32* %33, align 4
  br label %187

; <label>:265                                     ; preds = %187
  br label %266

; <label>:266                                     ; preds = %265
  %267 = ptrtoint i32* %31 to i64
  call void @__asan_load4(i64 %267)
  %268 = load i32* %31, align 4
  %269 = add nsw i32 %268, 1
  store i32 %269, i32* %31, align 4
  br label %179

; <label>:270                                     ; preds = %179
  store i64 1172321806, i64* %36
  %271 = icmp ne i64 %7, %1
  br i1 %271, label %272, label %293

; <label>:272                                     ; preds = %270
  %273 = add i64 %42, 0
  %274 = inttoptr i64 %273 to i64*
  store i64 -723401728380766731, i64* %274
  %275 = add i64 %42, 8
  %276 = inttoptr i64 %275 to i64*
  store i64 -723401728380766731, i64* %276
  %277 = add i64 %42, 16
  %278 = inttoptr i64 %277 to i64*
  store i64 -723401728380766731, i64* %278
  %279 = add i64 %42, 24
  %280 = inttoptr i64 %279 to i64*
  store i64 -723401728380766731, i64* %280
  %281 = add i64 %42, 32
  %282 = inttoptr i64 %281 to i64*
  store i64 -723401728380766731, i64* %282
  %283 = add i64 %42, 40
  %284 = inttoptr i64 %283 to i64*
  store i64 -723401728380766731, i64* %284
  %285 = add i64 %42, 48
  %286 = inttoptr i64 %285 to i64*
  store i64 -723401728380766731, i64* %286
  %287 = add i64 %42, 56
  %288 = inttoptr i64 %287 to i64*
  store i64 -723401728380766731, i64* %288
  %289 = add i64 %7, 504
  %290 = inttoptr i64 %289 to i64*
  %291 = load i64* %290
  %292 = inttoptr i64 %291 to i8*
  store i8 0, i8* %292
  br label %306

; <label>:293                                     ; preds = %270
  %294 = add i64 %42, 0
  %295 = inttoptr i64 %294 to i64*
  store i64 0, i64* %295
  %296 = add i64 %42, 8
  %297 = inttoptr i64 %296 to i64*
  store i64 0, i64* %297
  %298 = add i64 %42, 16
  %299 = inttoptr i64 %298 to i64*
  store i64 0, i64* %299
  %300 = add i64 %42, 24
  %301 = inttoptr i64 %300 to i64*
  store i64 0, i64* %301
  %302 = add i64 %42, 32
  %303 = inttoptr i64 %302 to i64*
  store i64 0, i64* %303
  %304 = add i64 %42, 40
  %305 = inttoptr i64 %304 to i64*
  store i64 0, i64* %305
  br label %306

; <label>:306                                     ; preds = %293, %272
  ret void
}

; Function Attrs: nounwind sanitize_address uwtable
define internal void @print_array(i32 %ni, i32 %nl, double* %D) #0 {
  %MyAlloca = alloca [128 x i8], align 32
  %1 = ptrtoint [128 x i8]* %MyAlloca to i64
  %2 = load i32* @__asan_option_detect_stack_use_after_return
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %6

; <label>:4                                       ; preds = %0
  %5 = call i64 @__asan_stack_malloc_1(i64 128, i64 %1)
  br label %6

; <label>:6                                       ; preds = %0, %4
  %7 = phi i64 [ %1, %0 ], [ %5, %4 ]
  %8 = add i64 %7, 32
  %9 = inttoptr i64 %8 to i32*
  %10 = add i64 %7, 48
  %11 = inttoptr i64 %10 to i32*
  %12 = add i64 %7, 64
  %13 = inttoptr i64 %12 to double**
  %14 = add i64 %7, 96
  %15 = inttoptr i64 %14 to i32*
  %16 = add i64 %7, 112
  %17 = inttoptr i64 %16 to i32*
  %18 = inttoptr i64 %7 to i64*
  store i64 1102416563, i64* %18
  %19 = add i64 %7, 8
  %20 = inttoptr i64 %19 to i64*
  store i64 ptrtoint ([45 x i8]* @__asan_gen_7 to i64), i64* %20
  %21 = add i64 %7, 16
  %22 = inttoptr i64 %21 to i64*
  store i64 ptrtoint (void (i32, i32, double*)* @print_array to i64), i64* %22
  %23 = lshr i64 %7, 3
  %24 = add i64 %23, 2147450880
  %25 = add i64 %24, 0
  %26 = inttoptr i64 %25 to i64*
  store i64 -1007414313571192335, i64* %26
  %27 = add i64 %24, 8
  %28 = inttoptr i64 %27 to i64*
  store i64 -935356719516421632, i64* %28
  %29 = ptrtoint i32* %9 to i64
  call void @__asan_store4(i64 %29)
  store i32 %ni, i32* %9, align 4
  %30 = ptrtoint i32* %11 to i64
  call void @__asan_store4(i64 %30)
  store i32 %nl, i32* %11, align 4
  %31 = ptrtoint double** %13 to i64
  call void @__asan_store8(i64 %31)
  store double* %D, double** %13, align 8
  %32 = load i32* %9, align 4
  %33 = zext i32 %32 to i64
  %34 = load i32* %11, align 4
  %35 = zext i32 %34 to i64
  %36 = ptrtoint i32* %15 to i64
  call void @__asan_store4(i64 %36)
  store i32 0, i32* %15, align 4
  br label %37

; <label>:37                                      ; preds = %86, %6
  %38 = ptrtoint i32* %15 to i64
  call void @__asan_load4(i64 %38)
  %39 = load i32* %15, align 4
  %40 = ptrtoint i32* %9 to i64
  call void @__asan_load4(i64 %40)
  %41 = load i32* %9, align 4
  %42 = icmp slt i32 %39, %41
  br i1 %42, label %43, label %90

; <label>:43                                      ; preds = %37
  %44 = ptrtoint i32* %17 to i64
  call void @__asan_store4(i64 %44)
  store i32 0, i32* %17, align 4
  br label %45

; <label>:45                                      ; preds = %81, %43
  %46 = ptrtoint i32* %17 to i64
  call void @__asan_load4(i64 %46)
  %47 = load i32* %17, align 4
  %48 = ptrtoint i32* %11 to i64
  call void @__asan_load4(i64 %48)
  %49 = load i32* %11, align 4
  %50 = icmp slt i32 %47, %49
  br i1 %50, label %51, label %85

; <label>:51                                      ; preds = %45
  call void @__asan_load8(i64 ptrtoint (%struct._IO_FILE** @stderr to i64))
  %52 = load %struct._IO_FILE** @stderr, align 8
  %53 = ptrtoint i32* %17 to i64
  call void @__asan_load4(i64 %53)
  %54 = load i32* %17, align 4
  %55 = sext i32 %54 to i64
  %56 = ptrtoint i32* %15 to i64
  call void @__asan_load4(i64 %56)
  %57 = load i32* %15, align 4
  %58 = sext i32 %57 to i64
  %59 = ptrtoint double** %13 to i64
  call void @__asan_load8(i64 %59)
  %60 = load double** %13, align 8
  %61 = mul nsw i64 %58, %35
  %62 = getelementptr inbounds double* %60, i64 %61
  %63 = getelementptr inbounds double* %62, i64 %55
  %64 = ptrtoint double* %63 to i64
  call void @__asan_load8(i64 %64)
  %65 = load double* %63, align 8
  %66 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %52, i8* getelementptr inbounds ({ [8 x i8], [56 x i8] }* @.str, i32 0, i32 0, i32 0), double %65)
  %67 = ptrtoint i32* %15 to i64
  call void @__asan_load4(i64 %67)
  %68 = load i32* %15, align 4
  %69 = ptrtoint i32* %9 to i64
  call void @__asan_load4(i64 %69)
  %70 = load i32* %9, align 4
  %71 = mul nsw i32 %68, %70
  %72 = ptrtoint i32* %17 to i64
  call void @__asan_load4(i64 %72)
  %73 = load i32* %17, align 4
  %74 = add nsw i32 %71, %73
  %75 = srem i32 %74, 20
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %77, label %80

; <label>:77                                      ; preds = %51
  call void @__asan_load8(i64 ptrtoint (%struct._IO_FILE** @stderr to i64))
  %78 = load %struct._IO_FILE** @stderr, align 8
  %79 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %78, i8* getelementptr inbounds ({ [2 x i8], [62 x i8] }* @.str3, i32 0, i32 0, i32 0))
  br label %80

; <label>:80                                      ; preds = %77, %51
  br label %81

; <label>:81                                      ; preds = %80
  %82 = ptrtoint i32* %17 to i64
  call void @__asan_load4(i64 %82)
  %83 = load i32* %17, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, i32* %17, align 4
  br label %45

; <label>:85                                      ; preds = %45
  br label %86

; <label>:86                                      ; preds = %85
  %87 = ptrtoint i32* %15 to i64
  call void @__asan_load4(i64 %87)
  %88 = load i32* %15, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, i32* %15, align 4
  br label %37

; <label>:90                                      ; preds = %37
  call void @__asan_load8(i64 ptrtoint (%struct._IO_FILE** @stderr to i64))
  %91 = load %struct._IO_FILE** @stderr, align 8
  %92 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %91, i8* getelementptr inbounds ({ [2 x i8], [62 x i8] }* @.str3, i32 0, i32 0, i32 0))
  store i64 1172321806, i64* %18
  %93 = icmp ne i64 %7, %1
  br i1 %93, label %94, label %103

; <label>:94                                      ; preds = %90
  %95 = add i64 %24, 0
  %96 = inttoptr i64 %95 to i64*
  store i64 -723401728380766731, i64* %96
  %97 = add i64 %24, 8
  %98 = inttoptr i64 %97 to i64*
  store i64 -723401728380766731, i64* %98
  %99 = add i64 %7, 120
  %100 = inttoptr i64 %99 to i64*
  %101 = load i64* %100
  %102 = inttoptr i64 %101 to i8*
  store i8 0, i8* %102
  br label %108

; <label>:103                                     ; preds = %90
  %104 = add i64 %24, 0
  %105 = inttoptr i64 %104 to i64*
  store i64 0, i64* %105
  %106 = add i64 %24, 8
  %107 = inttoptr i64 %106 to i64*
  store i64 0, i64* %107
  br label %108

; <label>:108                                     ; preds = %103, %94
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

define internal void @asan.module_ctor() {
  call void @__asan_init_v4()
  call void @__asan_register_globals(i64 ptrtoint ([2 x { i64, i64, i64, i64, i64, i64, i64 }]* @0 to i64), i64 2)
  ret void
}

declare void @__asan_init_v4()

declare void @__asan_report_load1(i64)

declare void @__asan_load1(i64)

declare void @__asan_report_load2(i64)

declare void @__asan_load2(i64)

declare void @__asan_report_load4(i64)

declare void @__asan_load4(i64)

declare void @__asan_report_load8(i64)

declare void @__asan_load8(i64)

declare void @__asan_report_load16(i64)

declare void @__asan_load16(i64)

declare void @__asan_report_store1(i64)

declare void @__asan_store1(i64)

declare void @__asan_report_store2(i64)

declare void @__asan_store2(i64)

declare void @__asan_report_store4(i64)

declare void @__asan_store4(i64)

declare void @__asan_report_store8(i64)

declare void @__asan_store8(i64)

declare void @__asan_report_store16(i64)

declare void @__asan_store16(i64)

declare void @__asan_report_load_n(i64, i64)

declare void @__asan_report_store_n(i64, i64)

declare void @__asan_loadN(i64, i64)

declare void @__asan_storeN(i64, i64)

declare i8* @__asan_memmove(i8*, i8*, i64)

declare i8* @__asan_memcpy(i8*, i8*, i64)

declare i8* @__asan_memset(i8*, i32, i64)

declare void @__asan_handle_no_return()

declare void @__sanitizer_cov()

declare void @__sanitizer_ptr_cmp(i64, i64)

declare void @__sanitizer_ptr_sub(i64, i64)

declare i64 @__asan_stack_malloc_0(i64, i64)

declare void @__asan_stack_free_0(i64, i64, i64)

declare i64 @__asan_stack_malloc_1(i64, i64)

declare void @__asan_stack_free_1(i64, i64, i64)

declare i64 @__asan_stack_malloc_2(i64, i64)

declare void @__asan_stack_free_2(i64, i64, i64)

declare i64 @__asan_stack_malloc_3(i64, i64)

declare void @__asan_stack_free_3(i64, i64, i64)

declare i64 @__asan_stack_malloc_4(i64, i64)

declare void @__asan_stack_free_4(i64, i64, i64)

declare i64 @__asan_stack_malloc_5(i64, i64)

declare void @__asan_stack_free_5(i64, i64, i64)

declare i64 @__asan_stack_malloc_6(i64, i64)

declare void @__asan_stack_free_6(i64, i64, i64)

declare i64 @__asan_stack_malloc_7(i64, i64)

declare void @__asan_stack_free_7(i64, i64, i64)

declare i64 @__asan_stack_malloc_8(i64, i64)

declare void @__asan_stack_free_8(i64, i64, i64)

declare i64 @__asan_stack_malloc_9(i64, i64)

declare void @__asan_stack_free_9(i64, i64, i64)

declare i64 @__asan_stack_malloc_10(i64, i64)

declare void @__asan_stack_free_10(i64, i64, i64)

declare void @__asan_poison_stack_memory(i64, i64)

declare void @__asan_unpoison_stack_memory(i64, i64)

declare void @__asan_before_dynamic_init(i64)

declare void @__asan_after_dynamic_init()

declare void @__asan_register_globals(i64, i64)

declare void @__asan_unregister_globals(i64, i64)

declare void @__sanitizer_cov_module_init(i64)

define internal void @asan.module_dtor() {
  call void @__asan_unregister_globals(i64 ptrtoint ([2 x { i64, i64, i64, i64, i64, i64, i64 }]* @0 to i64), i64 2)
  ret void
}

attributes #0 = { nounwind sanitize_address uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }
attributes #5 = { nounwind }

!llvm.asan.globals = !{!0, !1}
!llvm.ident = !{!2}

!0 = metadata !{[8 x i8]* getelementptr inbounds ({ [8 x i8], [56 x i8] }* @.str, i32 0, i32 0), { [6 x i8]*, i32, i32 }* @.asan_loc_descr, [17 x i8]* @.str2, i1 false, i1 false}
!1 = metadata !{[2 x i8]* getelementptr inbounds ({ [2 x i8], [62 x i8] }* @.str3, i32 0, i32 0), { [6 x i8]*, i32, i32 }* @.asan_loc_descr4, [17 x i8]* @.str2, i1 false, i1 false}
!2 = metadata !{metadata !"clang version 3.5.2 "}

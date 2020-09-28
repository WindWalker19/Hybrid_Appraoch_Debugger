; ModuleID = 'Gsym.c'
source_filename = "Gsym.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.MPI_Status = type { i32, i32, i32, i32, i32 }

@name = global [10 x i8] c"Hello\00\00\00\00\00", align 1
@j = global [10 x i8] c"Hi\00\00\00\00\00\00\00\00", align 1
@.str = private unnamed_addr constant [65 x i8] c"The process number are: %d,and the size of communication is: %d\0A\00", align 1
@number = common global i32 0, align 4
@d = common global double 0.000000e+00, align 8
@f = common global float 0.000000e+00, align 4
@a = common global i16 0, align 2
@b = common global i64 0, align 8
@c = common global i64 0, align 8
@e = common global i16 0, align 2
@k = common global i32 0, align 4
@g = common global i64 0, align 8
@h = common global i64 0, align 8
@i = common global x86_fp80 0xK00000000000000000000, align 16
@.str.1 = private unnamed_addr constant [45 x i8] c"Process 1 received number %d from process 0\0A\00", align 1
@.str.2 = private unnamed_addr constant [45 x i8] c"Process 1 received number %f from process 0\0A\00", align 1
@.str.3 = private unnamed_addr constant [45 x i8] c"Process 1 received number %s from process 0\0A\00", align 1
@.str.4 = private unnamed_addr constant [46 x i8] c"Process 1 received number %ld from process 0\0A\00", align 1
@.str.5 = private unnamed_addr constant [47 x i8] c"Process 1 received number %lld from process 0\0A\00", align 1
@.str.6 = private unnamed_addr constant [46 x i8] c"Process 1 received number %Lf from process 0\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca [128 x i8], align 16
  store i32 0, i32* %1, align 4
  %6 = call i32 @MPI_Init(i32* null, i8*** null)
  %7 = call i32 @MPI_Comm_size(i32 1140850688, i32* %2)
  %8 = call i32 @MPI_Comm_rank(i32 1140850688, i32* %3)
  %9 = load i32, i32* %3, align 4
  %10 = load i32, i32* %2, align 4
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str, i32 0, i32 0), i32 %9, i32 %10)
  %12 = load i32, i32* %3, align 4
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %28

; <label>:14:                                     ; preds = %0
  store i32 1, i32* @number, align 4
  store double 3.000000e+00, double* @d, align 8
  store float 5.000000e+00, float* @f, align 4
  store i16 10, i16* @a, align 2
  store i64 20, i64* @b, align 8
  store i64 10000, i64* @c, align 8
  store i16 101, i16* @e, align 2
  store i32 201, i32* @k, align 4
  store i64 301, i64* @g, align 8
  store i64 222, i64* @h, align 8
  store x86_fp80 0xK4007FA00000000000000, x86_fp80* @i, align 16
  %15 = call i32 @MPI_Send(i8* bitcast (i32* @number to i8*), i32 1, i32 1275069445, i32 1, i32 0, i32 1140850688)
  %16 = call i32 @MPI_Send(i8* bitcast (double* @d to i8*), i32 1, i32 1275070475, i32 1, i32 0, i32 1140850688)
  %17 = call i32 @MPI_Send(i8* bitcast (float* @f to i8*), i32 1, i32 1275069450, i32 1, i32 0, i32 1140850688)
  %18 = call i32 @MPI_Send(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @name, i32 0, i32 0), i32 1, i32 1275068673, i32 1, i32 0, i32 1140850688)
  %19 = call i32 @MPI_Send(i8* bitcast (i16* @a to i8*), i32 1, i32 1275068931, i32 1, i32 0, i32 1140850688)
  %20 = call i32 @MPI_Send(i8* bitcast (i64* @b to i8*), i32 1, i32 1275070471, i32 1, i32 0, i32 1140850688)
  %21 = call i32 @MPI_Send(i8* bitcast (i64* @c to i8*), i32 1, i32 1275070473, i32 1, i32 0, i32 1140850688)
  %22 = call i32 @MPI_Send(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @j, i32 0, i32 0), i32 1, i32 1275068674, i32 1, i32 0, i32 1140850688)
  %23 = call i32 @MPI_Send(i8* bitcast (i16* @e to i8*), i32 1, i32 1275068932, i32 1, i32 0, i32 1140850688)
  %24 = call i32 @MPI_Send(i8* bitcast (i32* @k to i8*), i32 1, i32 1275069446, i32 1, i32 0, i32 1140850688)
  %25 = call i32 @MPI_Send(i8* bitcast (i64* @g to i8*), i32 1, i32 1275070472, i32 1, i32 0, i32 1140850688)
  %26 = call i32 @MPI_Send(i8* bitcast (i64* @h to i8*), i32 1, i32 1275070489, i32 1, i32 0, i32 1140850688)
  %27 = call i32 @MPI_Send(i8* bitcast (x86_fp80* @i to i8*), i32 1, i32 1275072524, i32 1, i32 0, i32 1140850688)
  br label %73

; <label>:28:                                     ; preds = %0
  %29 = load i32, i32* %3, align 4
  %30 = icmp eq i32 %29, 1
  br i1 %30, label %31, label %72

; <label>:31:                                     ; preds = %28
  %32 = call i32 @MPI_Recv(i8* bitcast (i32* @number to i8*), i32 1, i32 1275069445, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %33 = call i32 @MPI_Recv(i8* bitcast (double* @d to i8*), i32 1, i32 1275070475, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %34 = call i32 @MPI_Recv(i8* bitcast (float* @f to i8*), i32 1, i32 1275069450, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %35 = call i32 @MPI_Recv(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @name, i32 0, i32 0), i32 1, i32 1275068673, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %36 = call i32 @MPI_Recv(i8* bitcast (i16* @a to i8*), i32 1, i32 1275068931, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %37 = call i32 @MPI_Recv(i8* bitcast (i64* @b to i8*), i32 1, i32 1275070471, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %38 = call i32 @MPI_Recv(i8* bitcast (i64* @c to i8*), i32 1, i32 1275070473, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %39 = call i32 @MPI_Recv(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @j, i32 0, i32 0), i32 1, i32 1275068674, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %40 = call i32 @MPI_Recv(i8* bitcast (i16* @e to i8*), i32 1, i32 1275068932, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %41 = call i32 @MPI_Recv(i8* bitcast (i32* @k to i8*), i32 1, i32 1275069446, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %42 = call i32 @MPI_Recv(i8* bitcast (i64* @g to i8*), i32 1, i32 1275070472, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %43 = call i32 @MPI_Recv(i8* bitcast (i64* @h to i8*), i32 1, i32 1275070489, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %44 = call i32 @MPI_Recv(i8* bitcast (x86_fp80* @i to i8*), i32 1, i32 1275072524, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %45 = load i32, i32* @number, align 4
  %46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.1, i32 0, i32 0), i32 %45)
  %47 = load double, double* @d, align 8
  %48 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.2, i32 0, i32 0), double %47)
  %49 = load float, float* @f, align 4
  %50 = fpext float %49 to double
  %51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.2, i32 0, i32 0), double %50)
  %52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @name, i32 0, i32 0))
  %53 = load i16, i16* @a, align 2
  %54 = sext i16 %53 to i32
  %55 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.1, i32 0, i32 0), i32 %54)
  %56 = load i64, i64* @b, align 8
  %57 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.4, i32 0, i32 0), i64 %56)
  %58 = load i64, i64* @c, align 8
  %59 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.5, i32 0, i32 0), i64 %58)
  %60 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @j, i32 0, i32 0))
  %61 = load i16, i16* @e, align 2
  %62 = zext i16 %61 to i32
  %63 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.1, i32 0, i32 0), i32 %62)
  %64 = load i32, i32* @k, align 4
  %65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.1, i32 0, i32 0), i32 %64)
  %66 = load i64, i64* @g, align 8
  %67 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.4, i32 0, i32 0), i64 %66)
  %68 = load i64, i64* @h, align 8
  %69 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.5, i32 0, i32 0), i64 %68)
  %70 = load x86_fp80, x86_fp80* @i, align 16
  %71 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.6, i32 0, i32 0), x86_fp80 %70)
  br label %72

; <label>:72:                                     ; preds = %31, %28
  br label %73

; <label>:73:                                     ; preds = %72, %14
  %74 = call i32 @MPI_Finalize()
  %75 = load i32, i32* %1, align 4
  ret i32 %75
}

declare i32 @MPI_Init(i32*, i8***) #1

declare i32 @MPI_Comm_size(i32, i32*) #1

declare i32 @MPI_Comm_rank(i32, i32*) #1

declare i32 @printf(i8*, ...) #1

declare i32 @MPI_Send(i8*, i32, i32, i32, i32, i32) #1

declare i32 @MPI_Recv(i8*, i32, i32, i32, i32, i32, %struct.MPI_Status*) #1

declare i32 @MPI_Finalize() #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}

; ModuleID = 'um.c'
source_filename = "um.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.MPI_Status = type { i32, i32, i32, i32, i32 }

@.str = private unnamed_addr constant [65 x i8] c"The process number are: %d,and the size of communication is: %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca [128 x i8], align 16
  %6 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %7 = call i32 @MPI_Init(i32* null, i8*** null)
  %8 = call i32 @MPI_Comm_size(i32 1140850688, i32* %2)
  %9 = call i32 @MPI_Comm_rank(i32 1140850688, i32* %3)
  %10 = load i32, i32* %3, align 4
  %11 = load i32, i32* %2, align 4
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str, i32 0, i32 0), i32 %10, i32 %11)
  %13 = load i32, i32* %3, align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %18

; <label>:15:                                     ; preds = %0
  store i32 1, i32* %6, align 4
  %16 = bitcast i32* %6 to i8*
  %17 = call i32 @MPI_Send(i8* %16, i32 1, i32 1275069445, i32 1, i32 0, i32 1140850688)
  br label %53

; <label>:18:                                     ; preds = %0
  %19 = load i32, i32* %3, align 4
  %20 = icmp eq i32 %19, 1
  br i1 %20, label %21, label %24

; <label>:21:                                     ; preds = %18
  %22 = bitcast i32* %6 to i8*
  %23 = call i32 @MPI_Recv(i8* %22, i32 1, i32 1275069445, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  br label %52

; <label>:24:                                     ; preds = %18
  %25 = load i32, i32* %3, align 4
  %26 = icmp eq i32 %25, 2
  br i1 %26, label %27, label %30

; <label>:27:                                     ; preds = %24
  store i32 1, i32* %6, align 4
  %28 = bitcast i32* %6 to i8*
  %29 = call i32 @MPI_Send(i8* %28, i32 1, i32 1275069445, i32 3, i32 0, i32 1140850688)
  br label %51

; <label>:30:                                     ; preds = %24
  %31 = load i32, i32* %3, align 4
  %32 = icmp eq i32 %31, 3
  br i1 %32, label %33, label %36

; <label>:33:                                     ; preds = %30
  %34 = bitcast i32* %6 to i8*
  %35 = call i32 @MPI_Recv(i8* %34, i32 1, i32 1275069445, i32 2, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  br label %50

; <label>:36:                                     ; preds = %30
  %37 = load i32, i32* %3, align 4
  %38 = icmp eq i32 %37, 4
  br i1 %38, label %39, label %42

; <label>:39:                                     ; preds = %36
  store i32 1, i32* %6, align 4
  %40 = bitcast i32* %6 to i8*
  %41 = call i32 @MPI_Send(i8* %40, i32 1, i32 1275069445, i32 5, i32 0, i32 1140850688)
  br label %49

; <label>:42:                                     ; preds = %36
  %43 = load i32, i32* %3, align 4
  %44 = icmp eq i32 %43, 5
  br i1 %44, label %45, label %48

; <label>:45:                                     ; preds = %42
  %46 = bitcast i32* %6 to i8*
  %47 = call i32 @MPI_Recv(i8* %46, i32 1, i32 1275069445, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  br label %48

; <label>:48:                                     ; preds = %45, %42
  br label %49

; <label>:49:                                     ; preds = %48, %39
  br label %50

; <label>:50:                                     ; preds = %49, %33
  br label %51

; <label>:51:                                     ; preds = %50, %27
  br label %52

; <label>:52:                                     ; preds = %51, %21
  br label %53

; <label>:53:                                     ; preds = %52, %15
  %54 = call i32 @MPI_Finalize()
  %55 = load i32, i32* %1, align 4
  ret i32 %55
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

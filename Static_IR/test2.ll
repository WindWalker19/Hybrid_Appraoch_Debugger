; ModuleID = 'equalsend_recv.c'
source_filename = "equalsend_recv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.MPI_Status = type { i32, i32, i32, i32, i32 }

@.str = private unnamed_addr constant [45 x i8] c"Process 1 received number %d from process 0\0A\00", align 1
@.str.1 = private unnamed_addr constant [45 x i8] c"Process 2 received number %d from process 0\0A\00", align 1
@.str.2 = private unnamed_addr constant [45 x i8] c"Process 5 received number %d from process 0\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %5 = call i32 @MPI_Init(i32* null, i8*** null)
  %6 = call i32 @MPI_Comm_size(i32 1140850688, i32* %2)
  %7 = call i32 @MPI_Comm_rank(i32 1140850688, i32* %3)
  %8 = load i32, i32* %3, align 4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %13

10:                                               ; preds = %0
  store i32 -1, i32* %4, align 4
  %11 = bitcast i32* %4 to i8*
  %12 = call i32 @MPI_Send(i8* %11, i32 1, i32 1275069445, i32 1, i32 0, i32 1140850688)
  br label %54

13:                                               ; preds = %0
  %14 = load i32, i32* %3, align 4
  %15 = icmp eq i32 %14, 1
  br i1 %15, label %16, label %21

16:                                               ; preds = %13
  %17 = bitcast i32* %4 to i8*
  %18 = call i32 @MPI_Recv(i8* %17, i32 1, i32 1275069445, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %19 = load i32, i32* %4, align 4
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i64 0, i64 0), i32 %19)
  br label %53

21:                                               ; preds = %13
  %22 = load i32, i32* %3, align 4
  %23 = icmp eq i32 %22, 2
  br i1 %23, label %24, label %29

24:                                               ; preds = %21
  %25 = bitcast i32* %4 to i8*
  %26 = call i32 @MPI_Recv(i8* %25, i32 1, i32 1275069445, i32 3, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %27 = load i32, i32* %4, align 4
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.1, i64 0, i64 0), i32 %27)
  br label %52

29:                                               ; preds = %21
  %30 = load i32, i32* %3, align 4
  %31 = icmp eq i32 %30, 3
  br i1 %31, label %32, label %35

32:                                               ; preds = %29
  store i32 -1, i32* %4, align 4
  %33 = bitcast i32* %4 to i8*
  %34 = call i32 @MPI_Send(i8* %33, i32 1, i32 1275069445, i32 2, i32 0, i32 1140850688)
  br label %51

35:                                               ; preds = %29
  %36 = load i32, i32* %3, align 4
  %37 = icmp eq i32 %36, 5
  br i1 %37, label %38, label %43

38:                                               ; preds = %35
  %39 = bitcast i32* %4 to i8*
  %40 = call i32 @MPI_Recv(i8* %39, i32 1, i32 1275069445, i32 4, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %41 = load i32, i32* %4, align 4
  %42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.2, i64 0, i64 0), i32 %41)
  br label %50

43:                                               ; preds = %35
  %44 = load i32, i32* %3, align 4
  %45 = icmp eq i32 %44, 4
  br i1 %45, label %46, label %49

46:                                               ; preds = %43
  store i32 -1, i32* %4, align 4
  %47 = bitcast i32* %4 to i8*
  %48 = call i32 @MPI_Send(i8* %47, i32 1, i32 1275069445, i32 5, i32 0, i32 1140850688)
  br label %49

49:                                               ; preds = %46, %43
  br label %50

50:                                               ; preds = %49, %38
  br label %51

51:                                               ; preds = %50, %32
  br label %52

52:                                               ; preds = %51, %24
  br label %53

53:                                               ; preds = %52, %16
  br label %54

54:                                               ; preds = %53, %10
  %55 = call i32 @MPI_Finalize()
  %56 = load i32, i32* %1, align 4
  ret i32 %56
}

declare dso_local i32 @MPI_Init(i32*, i8***) #1

declare dso_local i32 @MPI_Comm_size(i32, i32*) #1

declare dso_local i32 @MPI_Comm_rank(i32, i32*) #1

declare dso_local i32 @MPI_Send(i8*, i32, i32, i32, i32, i32) #1

declare dso_local i32 @MPI_Recv(i8*, i32, i32, i32, i32, i32, %struct.MPI_Status*) #1

declare dso_local i32 @printf(i8*, ...) #1

declare dso_local i32 @MPI_Finalize() #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (tags/RELEASE_900/final 375507)"}

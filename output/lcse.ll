; ModuleID = '<stdin>'
source_filename = "test.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @_Z4testiiiiii(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f) #0 {
entry:
  %add = add nsw i32 %b, %c
  %sub = sub nsw i32 %add, %d
  %add1 = add nsw i32 %sub, %c
  %sub2 = sub nsw i32 %add, %d
  %mul = mul nsw i32 %e, 5
  %add3 = add nsw i32 %sub, %mul
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @_Z5test1iiiiiii(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g) #0 {
entry:
  %add = add nsw i32 %a, %b
  %add1 = add nsw i32 %add, 5
  %add2 = add nsw i32 %a, %b
  %add3 = add nsw i32 %add, 5
  %add4 = add nsw i32 %add1, %add1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @_Z5test2iiiii(i32 %a, i32 %b, i32 %c, i32 %x, i32 %y) #0 {
entry:
  %add = add nsw i32 %x, %y
  %add1 = add nsw i32 %x, %y
  %add2 = add nsw i32 %x, %y
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @_Z5test3iiiiii(i32 %a, i32 %c, i32 %d, i32 %x, i32 %y, i32 %z) #0 {
entry:
  %add = add nsw i32 %x, %y
  %add1 = add nsw i32 %x, %y
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @_Z5test4iiii(i32 %a, i32 %b, i32 %c, i32 %d) #0 {
entry:
  %add = add nsw i32 %b, %c
  %sub = sub nsw i32 %add, %d
  %add1 = add nsw i32 %sub, %c
  %sub2 = sub nsw i32 %add, %d
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @_Z5test5iiiii(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e) #0 {
entry:
  %mul = mul nsw i32 %b, %c
  %add = add nsw i32 %mul, %b
  %mul1 = mul nsw i32 %b, %add
  %add2 = add nsw i32 %add, 5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @_Z5test6iiiiiiiiiii(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %i, i32 %j, i32 %t1, i32 %t2, i32 %t3, i32 %t4) #0 {
entry:
  %mul = mul nsw i32 %i, %j
  %add = add nsw i32 %mul, 40
  %mul1 = mul nsw i32 150, %add
  %mul2 = mul nsw i32 %i, %j
  %mul3 = mul nsw i32 %i, 10
  %add4 = add nsw i32 %mul, %mul3
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #1 {
entry:
  call void @_Z4testiiiiii(i32 10, i32 11, i32 25, i32 33, i32 43, i32 26)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 11.0.0 (https://github.com/llvm/llvm-project 739c7a0a04d2728bfa9a92b30652ac3e2ae6047c)"}

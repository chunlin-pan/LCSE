# LCSE

Using value numbering with SSA form of LLVM to eliminate local common subexpression.

In this work, it will promote memory to register (mem2reg) before doing LCSE.

# Usage

```
$ pwd
>> /workspace/llvm-project/llvm/lib/Transforms/frank/LCSE/src

$ cd ../../../../../../build/ && ninja

$ cd ../llvm/lib/Transforms/frank/LCSE/

$ opt -load ../../../../../build/lib/LLVMLCSE.so -mem2reg -LCSE  < input/test.ll -S -o output/lcse.ll
```
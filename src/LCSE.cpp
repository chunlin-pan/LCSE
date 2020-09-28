//===- Hello.cpp - Example code from "Writing an LLVM Pass" ---------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements two versions of the LLVM "Hello World" pass described
// in docs/WritingAnLLVMPass.html
//
//===----------------------------------------------------------------------===//

#include "llvm/ADT/Statistic.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Operator.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Casting.h"
#include "llvm/ADT/StringMap.h"
#include "values.h"
#include "llvm/Transforms/Utils/Mem2Reg.h"
#include "llvm/IR/InstrTypes.h"
#include <string>
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Support/Format.h"



using namespace llvm;

#define DEBUG_TYPE "LCSE"

namespace {
  struct LCSE : public FunctionPass {
    static char ID; // Pass identification, replacement for typeid
    LCSE() : FunctionPass(ID) {}
    StringMap<Value*> table;
    Value *getValueInTable(Value *v){
      if(v->hasName()){
        StringRef key = v->getName();
        if(table.find(key) != table.end()){
          // outs() << "found-------------------\nkey: "<<
          // key<<" ,value: "<<table[key]<<"\n";
          return table[key];
        }
        else{
          // outs()<<"not found----------\nkey: "
          // << key<<" ,value: "<< v<<"\n";
          table[key] = v;
          return v;
        }
      }
      else{
        return v;
      }
    }
    Value *getValueInTable(StringRef key, Value* v){
      if(table.find(key) != table.end()){
          // outs() << "found-------------------\nkey: "<<
          // key<<" ,value: "<<table[key]<<"\n";
          table[v->getName()] = table[key];
          return table[key];
        }
        else{
          // outs()<<"not found----------\nkey: "
          // << key<<" ,value: "<<v<<"\n";
          table[key] = v;
          return v;
        }
    }
    bool runOnFunction(Function &F) override {
      for(Function::iterator BB = F.begin(); BB != F.end(); ++BB){
        for(BasicBlock::iterator I = BB->begin(); I != BB->end(); ++I){
          if(auto* binop = dyn_cast<BinaryOperator>(I)){
            std::vector<Value*> op = {binop->getOperand(0), binop->getOperand(1)};
            std::vector<Value*> newOp;
            for(int i = 0; i < 2; i++){
              newOp.push_back(getValueInTable(op[i]));
            }
            std::string str(std::to_string(binop->getOpcode())+" "+std::to_string((unsigned long)newOp[0])+" "+std::to_string((unsigned long)newOp[1]));
            StringRef newInstStr = StringRef(str);
            I->setOperand(0, newOp[0]);
            I->setOperand(1, newOp[1]);
            getValueInTable(newInstStr, dyn_cast<Value>(I));
          }
        }
      }
      table.clear();
      return false;
    }
  };
}

char LCSE::ID = 0;
static RegisterPass<LCSE> X("LCSE", "LCSE Pass");

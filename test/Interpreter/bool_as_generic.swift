// RUN: %target-run-simple-swift | FileCheck %s
// <rdar://problem/13986638> Missing Bool metadata when Bool is used as a generic
// parameter or existential value

prefix operator !! {}
infix operator &&& {}

prefix func !!<T : BooleanType>(x: T) -> Bool {
  return x.getLogicValue()
}

func &&&(x: BooleanType, y: @autoclosure () -> BooleanType) -> Bool {
  return x.getLogicValue() ? y().getLogicValue() : false
}

println(!!true) // CHECK: true
println(!!false) // CHECK: false
println(true &&& true) // CHECK: true
println(true &&& false) // CHECK: false

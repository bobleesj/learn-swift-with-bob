/*:
 ## Learn Swift with Bob
 ### Intro to Functional Swift
 ### Intro to Closures Part 2
 
 **Problem:** Can you pass/return a function/functions to a function?
*/

var addWithClosures: (Int, Int) -> Int = { (number1: Int, number2: Int) in
  return number1 + number2
}

var returnString: () -> String = { () in
  "hello"
}

//: > Function = Global Closure
func hello() -> String {
  return "hello"
}

hello // () -> String


//: ### Return Closure
//: Return Closure Indirectly
func returnClosure() -> ((Int, Int) -> Int) {
  return addWithClosures
}

let addClosure = returnClosure()
addClosure(4, 10)
returnClosure()(4, 10) // addWithClosure(4, 10)


//: Return Closure Directly
func returnClosureDirectly() -> ((Int, Int) -> Int) {
  return { (number1, number2) in number1 + number2 }
}

returnClosureDirectly()(4, 10) // 14

func returnClosureDirectlyTwo() -> ((Int, Int) -> Int) {
  return { $0 + $1 }
}
returnClosureDirectlyTwo()(4, 10) // 14 



//: ### Pass Closure
func insertClosureBlock(closureBlock: () -> String) -> String {
  return closureBlock()
}

//: Pass Closure Indirectly
insertClosureBlock(closureBlock: hello)

//: Pass Closure Directly
insertClosureBlock(closureBlock: { _ in return "hello" })
insertClosureBlock(closureBlock: { return "hello" })
insertClosureBlock(closureBlock: { "hello" })
















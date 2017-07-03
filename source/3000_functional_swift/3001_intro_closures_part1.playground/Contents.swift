/*:
 ## Learn Swift with Bob
 ### Intro to Functional Swift
 ### Intro to Closures Part 1
 
  **Problem:** Who are you closures, () -> ()?
*/
/*:
 - A closure is a function without name and the `func` keyword (for now)
 - Quick and easy to carry around as a variable/constant or just pass as a parameter
 */
//: 
// Function add two ints
func addTwoNumbers(number1: Int, number2: Int) -> Int {
  return number1 + number2
}

var addFunction = addTwoNumbers
addFunction(10, 30)



//: Closures
var addClosures: (Int, Int) -> Int = {
  (number1: Int, number2: Int) in
  return number1 + number2
}

addClosures(4, 10)

var addClosuresTwo = {
  (number1: Int, number2: Int) in
  return number1 + number2
}

var addClosuresThree = {
  (number1: Int, number2: Int) in
  number1 + number2
}

addClosuresThree(4, 6)

var addClosuresFour: (Int, Int) -> Int = { $0 + $1 }

addClosuresFour(4, 5)
addClosuresFour(10, 15)


//: One example with () -> String
func callString() -> String {
  return "hello, I'm a function"
}


let callStringWtihClosure: () -> String = { () in
  print("hello")
  return "hello, I'm a closure"
}

callStringWtihClosure()

let callStringWtihClosureTwo: () -> String = { () in
  "hello, I'm a closure"
}


// Shorter Version
let callStringWtihClosureThree: () -> String = { "hello, I'm a closure" }
let callStringWtihClosureFour = { "hello, I'm a closure" }
callStringWtihClosureFour // () -> String



































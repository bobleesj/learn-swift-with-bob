
let sayHi = { print("Hello") }

let addInts = { (x: Int, y: Int) -> Int in
  return x + y
}
// The type of addInts is "(Int, Int) -> Int"

let result = addInts(1, 2)  // result is 3

enum MyErrors: Error {
  case DivisionByZero
}

let divideInts = { (x: Int, y: Int) throws -> Int in
  if y == 0 {
    throw MyErrors.DivisionByZero
}
return x / y
}

// Closure can capture values from their scope

func makeProducer(x: Int) -> (() -> Int) {
  let closure = { x }  // x is captured by the closure
  return closure
}

// These two function calls use the exact same code,
// but each closure has captured different values.
let three = makeProducer(x: 3)
let four = makeProducer(x: 4)
three()
four()  // returns 4


func someFunctionThatTakesAClosure(closure: () -> Void) {
  // function body goes here
}

// Here's how you call this function without using a trailing closure:

someFunctionThatTakesAClosure(closure: {
  // closure's body goes here
})

// Here's how you call this function with a trailing closure instead:

someFunctionThatTakesAClosure() {
  // trailing closure's body goes here
  print("hello")
}

// ESCAPING CLOSURE: Passed as a variable, but then it's run after the funtion 
// returns 
// You can write @escape before the parameter's type 


var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
  completionHandlers.append(completionHandler)
}


// If espacing, self is needed, if not, self no needed


//: [Next Topic](@next)









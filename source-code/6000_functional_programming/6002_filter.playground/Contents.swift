/*:
 
 ## Learn Swift with Bob
 ### Functional Programming
 ### Intro to Functional Paradigm
 
 **Problem:** A closure is too long to pass through a function
 
 ---
 */
//: Design Function
func trailingClosure(number: Int, closure: () -> Void) {
  print("You've entered \(number)")
  closure()
}


//: Design Closure block
func helloFunc() -> Void {
  print("Hello, Function!")
}
helloFunc


let helloClosure = {
  print("Hello, Closure!")
}

//: Execute Function

trailingClosure(number: 100, closure: helloFunc)
trailingClosure(number: 100, closure: helloClosure)

trailingClosure(number: 100, closure: { print("Hello!!!") })
trailingClosure(number: 100) { print("Hello!!!!!") }



//: When to use trailng closure
//: - A single closure block at the end

//: Another Example
func trailingClosures(number: Int, closure: (Int) -> Int) {
  let newNumber = closure(number)
  print(newNumber)
}


trailingClosures(number: 1000, closure: { number in number * number })

trailingClosures(number: 500) { number in number * number }
trailingClosures(number: 400) { $0 * $0 }













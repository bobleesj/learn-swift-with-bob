/*:
 ## Learn Swift with Bob
 ### Chapter 1: The Swift Fundamentals
 ### Extension
 
 **Problem:**
 1. I like to keep it short and modularlized. 
 2. Prevent anything massive
 ---
 */


//: Design Class
struct Bob {
  var name = "Bob"
  var skill = "Work"
  
  init() {}
}


Bob().name // "Bob"


//: Extend Class
extension Bob {
  var description: String {
    let myName = self.name
    let mySkill = self.skill // object.name 
    return "I'm \(name), I know \(skill)"
  }
  
  init(enterSkill: String) {
    self.skill = enterSkill
    print("You've entered a new skill")
  }
 
  subscript(mySkill: String) -> String {
    return "This is your secret weapon"
  }
}


//: Check
let bob = Bob()
bob.description // I'm Bob, I know work"

let newBob = Bob(enterSkill: "Drawing")
newBob.description // I'm Bob, I know drawing"


//: Extension to Swift Types
extension Int {
  var squared: Int {
    return self * self
  }
}


//: > Remember, `Int` just a struct


let myNumber = 10
myNumber.squared // 100


//: Rule in the Swift Extension
//: - You may not have a stored property


/*:
 Extensions in Swift
 
 - Add computed instance properties and computed type properties
 - Define instance methods and type methods (Laer)
 - Provide new initializers
 - Define subscripts
 - Define and use new nested types with enum/struct (Later)
 - Make an existing type conform to a protocol (Later)
 */

//: > This is super useful. But, when protocols meet extensions, it becomes 😱




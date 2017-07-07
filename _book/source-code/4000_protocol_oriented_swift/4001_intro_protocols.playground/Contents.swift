/*:
 
 ## Learn Swift with Bob
 ### Protocol Oriented Swift
 ### Intro to Protocols
 
 **Problem:** Protocols, who are you?
 
 ---
 */
//: Drawbacks of OOP
//: 1. When you subclass, you have to inherit properties and methods which you may not need. Your object becomes unnecessarily bloated.
//: 2. When you make a lot of super classes, it becomes extremely hard to navigate between each class and fix bugs/edit.
//: 3. Since objects are referencing to the same place in memory, if you make a copy and create a small change its property, it can mess up the rest. (Mutability due to reference)


//: > Protocol is like a basketball coach. He/she tells players what to do, but he/she doesn't know how to dunk.
protocol Humanable {
  var name: String { get set }
  var race: String { get }
  func sayHi()
}

struct Korean: Humanable {
  var name: String = "Bob Lee"
  var race: String = "Asian"
  func sayHi() {
    print("Hi, I'm \(name)")
  }
}

class American: Humanable {
  var name: String = "Joe Smith"
  var race: String = "White"
  func sayHi() {
    print("Hi, I'm \(name)")
  }
}


//: Protocol Inheritance
protocol SuperHumanable: Humanable {
  var canFly: Bool { get set }
  func punch()
}

struct BobtheDeveloper: SuperHumanable {
  var name: String = "Bob"
  var race: String = "Asian"
  func sayHi() {
    print("I code")
  }
  
  var canFly: Bool = false
  func punch() {
    print("I don't punch")
  }
}





//: { get set } vs { get }
// { get set } only applies to computed property


protocol Breathable {
  var isBreating: Bool { get set }
  var isLiving: Bool { get }
}

struct Human: Breathable {
  var isBreating: Bool {
    get { return true }
    set {}
  }
  
  var isLiving: Bool {
    get { return true }
    set {}
  }
}

// { get }
// Stored Property 😀
// Computed Property --> Gettable, Settable (Optional)

// { get set }
// Stored Property 😀
// Computed Property --> Gettable, Settable (Must)













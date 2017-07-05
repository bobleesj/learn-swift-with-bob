/*:
 ## Learn Swift with Bob
 ### Swift Memory Management
 ### Intro to Memory Management
 
 **Problem:** Deallocate and allocate objects with `ARC`
 
 ---
 */
//: What is Memory?
//: - RAM: Fridge
//: - Disk: Storage


//: Design Passport
class Passport {
  weak var human: Human?
  let citizenship: String
  
  init(citizenship: String) {
    self.citizenship = citizenship
    print("\(citizenship) passport generated")
  }
  deinit {
    print("I, paper, am gone")
  }
}



//: Design Human
class Human {
  var passport: Passport?
  let name: String
  
  init(name: String) {
    self.name = name
    print("\(name) generated")
  }
  
  deinit {
    print("I, \(name), gone")
  }
}


// Passport(citizenship: "Republic of Korea")
// var myPassport = Passport(citizenship: "The Mars")


//: Introducing Automatic Reference Counting


//: Create Instances
var bobby: Human? = Human(name: "Bobby")
var passport: Passport? = Passport(citizenship: "Republic of Korea")

//: Deallocate
//bobby = nil
//passport = nil

//: > The Only Rule: If the reference count is zero/no relationship, the object gets purged out of the memory.
var bob: Human? = Human(name: "Bob")
var myPassport: Passport? = Passport(citizenship: "Republic of Korea")


bob?.passport = myPassport
myPassport?.human = bob


// Option One
//bob = nil
//myPassport = nil

// Option Two 
//myPassport = nil
//bob = nil


//: > There is no such thign as `reference cycle` in structs and enums.










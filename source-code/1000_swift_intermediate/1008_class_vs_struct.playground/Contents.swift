/*:
 ## Learn Swift with Bob
 ### Chapter 1: The Swift Fundamentals
 ### Class vs Struct
 
 **Problem:**
 1. What are the differences besides inheritance?
 2. When to use Structs  over Classes?
 
 ---
 */

//: Design Class
class HumanClass {
  var name: String
  init(name: String) {
    self.name = name
  }
}


//: Create Instance
var humanClassObject = HumanClass(name: "Bob")
humanClassObject.name

let newHumanClassObject = humanClassObject
newHumanClassObject.name // "Bob"
newHumanClassObject.name = "Bobby"
humanClassObject.name // "Bobby"


//: Design Struct
struct HumanStruct {
  var name: String
  init(name: String) {
    self.name = name
  }
}

var structObject = HumanStruct(name: "Bob")
var newStructObject = structObject

newStructObject.name = "Bobby"
structObject.name // "Bob"



//: ### One More Difference in Mutability
//: Mutable Class
class BobClass {
  var name = "Bob"
}

let bobClass = BobClass()
bobClass.name = "Bobby"

let newBobClass = bobClass
newBobClass.name = "Bob the Developer"
bobClass.name // "Bob the Developer"


//: Immutable Struct
struct BobStruct {
  var name = "Bob"
}

let bobStruct = BobStruct()
// bobStruct.name = "Bobby"










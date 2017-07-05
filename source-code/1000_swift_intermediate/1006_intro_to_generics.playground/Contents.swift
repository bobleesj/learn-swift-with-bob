/*:
 
 ## Learn Swift with Bob
 ### Chapter 1: The Swift Fundamenatls
 ### Intro to Generics
 
 **Problem:** I smell something
 
 ---
 */
let highSchoolGPA = [2.8, 3.2, 3.5, 3.8, 3.5]
let favoritePeople = ["Elon Musk", "Steve Jobs", "Kevin O'leary"]
let favoriteNumbers = [3, 20]

//: Worst
highSchoolGPA[0]
highSchoolGPA[1]
highSchoolGPA[2]


//: Typical Solution
func printDoubleElement(array: [Double]) {
  for GPA in array {
    print(GPA)
  }
}

func printStringElement(array: [String]) {
  for person in array {
    print("I love \(person)")
  }
}

func printNumberElement(array: [Int]) {
  for number in array {
    print("I like \(number)")
  }
}


//: Introducing Generics
func genericFunction<anything>(value: anything) {
  print(value)
}

func genericFunctions<T>(value: T) {
  print(value)
}

genericFunction(value: "Bob")
genericFunction(value: true)


func printElement<T>(array: [T]) {
  for element in array {
    print(element)
  }
}

printElement(array: highSchoolGPA)
printElement(array: favoritePeople)

//: > Generic code enables you to write flexible, reusable functions and types that can work with any type, subject to requirements that you define.

//: Struct Met Generics
// Non-generic code
struct Family {
  // var members = [String]()
  var members: [String] = []
  
  mutating func push(member: String) {
    members.append(member)
  }
}

var myFam = Family()
myFam.push(member: "Bob")
myFam.members

struct GenericFam<T> {
  var members: [T] = []

  mutating func push(member: T) {
    members.append(member)
  }
  
}
//: Generic Initialization
var genericFamily = GenericFam<Int>()
var genericFamily2 = GenericFam<String>()

genericFamily2.members

// Implicitly Determined 
let myHappyFamily = GenericFam(members: [1, 2, 3, 4, 5])


//: Generic Extension

extension GenericFam {
  var firstElement: T? {
    if members.isEmpty {
      return nil
    } else {
      return members[0]
    }
    
  }
  
}

let geekFamilyMember = GenericFam(members: ["Bob", "Bobby"])
geekFamilyMember.firstElement


//: Type Constraint

class LOL {}

class BabyLol: LOL {}

func addLOLClassOnly<T: LOL>(array: [T]) { }


addLOLClassOnly(array: [LOL(), LOL(), LOL(), BabyLol()])
[1, 2, 3, 4, 5] // Array is a generic sturct







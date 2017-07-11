/*:
 ## Learn Swift with Bob
 ### Functional Programming
 ### 6004_Reduce
 
 **Problem:** Combine all into one
 
 ---
 */
//: ### Imperative/Non-Functional
//: Addition
var numberOne = Int()
for number in Array(1...10) {
  numberOne += number
}

numberOne

//: Subtraction
var numberTwo = Int()
for number in Array(1...10) {
  numberTwo -= number
}

numberTwo

//: ### Declarative/Functional Programming
let added = Array(1...10).reduce(0) { $0 + $1 } // 55
let subtracted = Array(1...10).reduce(0) { $0 - $1 } // -55


//: Let's Find Out
func myReduce(_ seed: Int, numbers: [Int], operation: (Int, Int) -> Int) {
  var current = seed
  for number in numbers {
    current = operation(current, number)
  }
}

myReduce(0, numbers: Array(1...10)) { $0 + $1 }

//: Max Number
let maxNumber = Array(1...10).myReduce(0) { (total, number) in max(total, number) }
let bigNumber = Array(1...10).myReduce(0) { max($0, $1) }

//: Create Function that Returns
func reduce(_ seed: Int, numbers: [Int], operation: (Int, Int) -> Int) -> Int {
  var current = seed
  for number in numbers {
    current = operation(current, number)
  }
  return current
}

reduce(0, numbers: Array(1...10)) { $0 + $1 }
//: Generic Reduce
extension Array {
  func myReduce<U>(_ seed: U, operation:(U, U) -> U)  -> U {
    var current = seed
    for item in self {
      current = operation(current, item as! U)
    }
    return current
  }
}

//: Example
let names = ["Bob", "Bobby", "Lee"]
let description = names.myReduce("Names:") { "\($0) " + $1 }
print(description)

//: Multiple Functions
let lowerNames = names.map { $0.lowercased() }.myReduce("Names:") { "\($0) " + $1 }
print(lowerNames)

//: The Purest Form
extension Array {
  func reduce(_ seed: Element, operation:(Element, Element) -> Element) -> Element {
    var current = seed
    for item in self {
      current = operation(current, item)
    }
    return current
  }
}

let hello = ["Bob", "Bobby", "Lee"].reduce("Names:") { "\($0) " + $1 }




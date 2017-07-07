/*:
 
 ## Learn Swift with Bob
 ### Functional Programming
 ### Filter
 
 **Problem:** How to get things done with one line of code?
 
 ---
 */

//: > Most people use Swift functions without knowing the behind implementation

//: Imperative/Non-functional
// Get even numbers
var evens = [Int]()

for i in 1...10 {
  if i % 2 == 0 {
    evens.append(i)
  }
}
//: Declarative/Functional
Array(1...10).filter { (number) in number % 2 == 0 }
Array(1...10).filter { $0 % 2 == 0 }
//: ### Become an A student
let recentGrade = ["A", "A", "A", "A", "B", "D"] // It can be any data
//: Imperative/Non-functional
var happyGrade: [String] = []

for grade in recentGrade {
  if grade == "A" {
    happyGrade.append(grade)
  } else {
    print("My mama not happy")
  }
}
print(happyGrade) // ["A", "A", "A", "A"]

//: ### Functional Way
//: Create closure block that returns `true`/`false`
var isMomHappy: (String) -> Bool = { grade in return grade == "A" }
isMomHappy = { $0 == "A" }

isMomHappy("A") // true
isMomHappy("B") // true



//: Create function that takes the closure
func simpleStringFilter(grades: [String], operation: (String) -> Bool) {
  var happyGrade: [String] = []
  for grade in grades {
    if operation(grade) {
      happyGrade.append(grade)
    }
  }
}

//: Execute the function by passing `isMomHappy`
simpleStringFilter(grades: recentGrade, operation: isMomHappy) // ["A", ...]


func stringFilter(grades: [String], operation: (String) -> Bool) -> [String] {
  var happyGrade: [String] = []
  for grade in grades {
    if operation(grade) {
      happyGrade.append(grade)
    }
  }
  return happyGrade
}

let myGrade = ["A", "A", "A", "A", "B", "D"]
stringFilter(grades: myGrade, operation: isMomHappy)

//: Pass the closure block indirectly
let lovelyGrade = stringFilter(grades: myGrade, operation: isMomHappy)

//: Pass the closure block directly
stringFilter(grades: myGrade, operation: { element in return element == "A" })
stringFilter(grades: myGrade, operation: { $0 == "A" })

//: Generic Functions
func bobFilter<Bob>(array: [Bob], operation: (Bob) -> Bool) -> [Bob] {
  var result: [Bob] = []
  for element in array {
    if operation(element) {
      result.append(element)
    }
  }
  return result
}

func myFilter<T>(array: [T], operation: (T) -> Bool) -> [T] {
  var result: [T] = []
  for element in array {
    if operation(element) {
      result.append(element)
    }
  }
  return result
}

//: Ex 1) Filter Numbers
let AStudent = myFilter(array: Array(1...100), operation: { $0 >= 93 && $0 <= 100 })
print(AStudent) // [93, 94, 95, ... 100]

//: Ex 2) Vote Counting
let answer = [true, false, true, false, false, false, false]
let trueAnswer = myFilter(array: answer, operation: { $0 == true })

//: Trailing Closure
let falseAnswer = myFilter(array: answer) { $0 == false }



//: The Built-in Filter Functionl
let zeroToHund = Array(1...100)
zeroToHund.filter{ $0 % 2 == 0 }.filter { $0 <= 50 }
// [2, 4, 6, 8, 10, 12, 14, ..., 50]

//: The Purest Form
extension Array {
  func myFilter(_ operation: (Element) -> Bool) -> [Element] {
    var result: [Element] = []
    for item in self {
      if operation(item) {
        result.append(item)
      }
    }
    return result
  }
}

let result = Array(1...100).myFilter { $0 % 2 == 0 }




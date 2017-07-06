/*:
 
 ## Learn Swift with Bob
 ### Functional Programming
 ### Filter
 
 **Problem:** How to get things done with one line of code?
 
 ---
 */

//: > Examples people use without knowing the behind implementation


//: Imperative/Non-functional
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

func stringFilter(grades: [String], returnBool: (String) -> Bool) -> [String] {
  var happyGrade: [String] = []
  for grade in grades {
    if returnBool(grade) {
      happyGrade.append(grade)
    }
  }
  return happyGrade
}


let myGrade = ["A", "A", "A", "A", "B", "D"]
let lovelyGrade = stringFilter(grades: myGrade, returnBool: isMomHappy)

stringFilter(grades: myGrade, returnBool: { $0 == "A" })

func myFilter<Bob>(array: [Bob], logic: (Bob) -> Bool) -> [Bob] {
  var result: [Bob] = []
  for element in array {
    if logic(element) {
      result.append(element)
    }
  }
  return result
}

let AStudent = myFilter(array: Array(1...100), logic: { $0 >= 93 && $0 <= 100 })
print(AStudent) // [93, 94, 95, ... 100]


let answer = [true, false, true, false, false, false, false]
let trueAnswer = myFilter(array: answer, logic: { $0 == true })
// Trailing Closure
let falseAnswer = myFilter(array: answer) { $0 == false }

let zeroToHund = Array(1...100)
zeroToHund.filter{ $0 % 2 == 0 }.filter { $0 <= 50 }
// [2, 4, 6, 8, 10, 12, 14, ..., 50]

//: The Purest Form
extension Array {
  func myFilter(_ logic: (Element) -> Bool) -> [Element] {
    var result: [Element] = []
    for item in self {
      if logic(item) {
        result.append(item)
      }
    }
    return result
  }
}


let result = Array(1...100).myFilter { $0 % 2 == 0 }




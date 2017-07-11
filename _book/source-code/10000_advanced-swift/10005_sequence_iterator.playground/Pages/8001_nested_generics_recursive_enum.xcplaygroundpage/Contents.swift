/*:
 ## Learn Swift with Bob
 ### Advanced Swift
 ### Sequence and IteratorProtocol  
 
 
 **Problem:** What goes under the hood of a `for-in` loop.
 
 ---
 
 */
//: What we take it for granted
let iOSSkills = ["Swift", "UIKIt", "RxSwift", "TDD"]
for skill in iOSSkills {
  print(skill)
}
// Prints "Swift"
// Prints "UIKIt"
// Prints "RxSwift"
// Prints "TDD"

for character in ("Bob the Developer").characters {
  print(character)
}


//: Behind the scene
var skillIterator = iOSSkills.makeIterator()
while let skill = skillIterator.next() {
  print(skill)
}


let numbers = [2, 3, 5, 7]
var numbersIterator = numbers.makeIterator()

numbersIterator.next()
numbersIterator.next()
numbersIterator.next() // Optional(5)
numbersIterator.next()
numbersIterator.next()
numbersIterator.next()


//: Sequnce Protocol

struct MyCountdown: Sequence {
  let start: Int
  
  func makeIterator() -> CountdownIterator {
    return CountdownIterator(self)
  }
}


//: IteratorProtocol
struct CountdownIterator: IteratorProtocol {
  let countdown: MyCountdown
  var times = 0
  
  init(_ countdown: MyCountdown) {
    self.countdown = countdown
  }
  
  mutating func next() -> Int? {
    let nextNumber = countdown.start - times
    guard nextNumber > 0
      else { return nil }
    
    times += 1
    return nextNumber
  }
}

//: Testing
var threeTwoOne = MyCountdown(start: 3)

var iterator = threeTwoOne.makeIterator()
iterator.next()
iterator.next()
iterator.next()

//: Magic
for count in threeTwoOne {
  print("\(count)...")
}










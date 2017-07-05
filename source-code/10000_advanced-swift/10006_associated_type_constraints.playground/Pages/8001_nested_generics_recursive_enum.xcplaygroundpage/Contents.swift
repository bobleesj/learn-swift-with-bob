/*:
 ## Learn Swift with Bob
 ### Advanced Swift
 ### Intro to Test Driven Swift
 
 **Problem:** Learn how to create safe apps
 
 ---
 */

//: Test Driven Development
// -Onone      // none a.k.a. debug
// -O          // fast a.k.a. release
// -Ounchecked // super fast testing

/*:
 
 Standard Swift library come with five assertion functions
 1. assert()
 2. assertionFailure()
 3. precondition()
 4. preconditionFailure()
 5. fatalError()
 
 */
//: assert()
assert(true)


func enterName(name: String) {
  if name == "" {
    assert(false, "You must enter a full name")
  } else if name == "Bob" {
    assert(false, "There is only one Bob")
  }
}

// enterName(name: "Bob")

print("File: \(#file)")
print("Line: \(#line)")



var expectedResult = 10
var actualResult = 10

assert(actualResult == expectedResult, "The actual result doesn't match with the expected")


//: assertionFailure()

import Foundation
let randomNumber: Int = Int(arc4random_uniform(3))


switch randomNumber {
case 0, 1, 2:
  print(randomNumber)
default:
  assertionFailure("Unexpected index \(randomNumber)")
}

//: precondition()
// Identical as assert()
let expectedNumber = (1, 3)
let actualNumber = (1, 3)

precondition(actualNumber == expectedNumber, "\(actualNumber) is not the same as \(expectedNumber)")

//: PreconditionFailture()
// preconditionFailure("Good")


//: fatalError()
let number: Int = Int(arc4random_uniform(100))

func enterNumberReturnString(index: Int) -> String {
  switch index {
  case 0, 1, 2:
    return "\(number)"
  default:
//    assertionFailure("Unexpected index \(number)")
//    abort()
    fatalError("Unepxpected index \(number)")
  }
}

//: > `@noreturn`, the compiler confirms that the marked function will not return. The application would terminate instead.








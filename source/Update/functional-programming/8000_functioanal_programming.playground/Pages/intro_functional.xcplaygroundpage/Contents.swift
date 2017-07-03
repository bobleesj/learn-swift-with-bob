/*:
 ## Learn Swift with Bob
 ### Functional Programming
 ### Intro to Functional Paradigm
 
 **Problem:** What's functional?
 */


//: Imperative vs Declarative


// Somewhere in ViewController
let numbers = [1, 2, 3]
var sum = 0
for number in numbers {
  sum += number
}

// Somewhere in NextViewController
let newNumbers = [4, 5, 6]
var newSum = 0
for newNumber in numbers {
  newSum += newNumber
}


func saveMeFromMadness(elements: [Int]) -> Int {
  var sum = 0
  for element in elements {
    sum += element
  }
  
  return sum
}


//: Ex) Moutain climb


// Somewhere in ViewController
saveMeFromMadness(elements: [1, 2, 3])
// Somewhere in NextViewController
saveMeFromMadness(elements: [4, 5, 6])

// Show example using Google Spreadsheet
//: > “Functional Programming is a paradigm that allows you to make your code explicit. There is no state and no mutuality”

// More variables → more memorization → more headache → more bugs → more life problems.
// More variables → Easy to f up → Done

// Functional Programming --> Create and apply functions to solve a problem




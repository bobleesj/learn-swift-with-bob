/*:
 
 ## Learn Swift with Bob
 ### Functional Programming
 ### Intro to Functional Paradigm
 
 **Problem:** What is a functional programming
 
 ---
 */


// Show Giff File intro to functional programming

//: > “Functional Programming is a paradigm that allows you to make your code explicit. There is no state and no mutuality”



//: ### Non-functional Programming

// Somewhere in ViewController
let numbers = [1, 2, 3]
var sum = 0
for number in numbers {
  sum += number
}


// // Somewhere in NextViewController
let newNumbers = [4, 5, 6]
var newSum = 0
for newNumber in numbers {
  newSum += newNumber
}



//: > **Bob's Definition:** Functional programming is nothing more than using functions to derive results


//: ### Functional Programming 
func saveMeFromMadness(elements: [Int]) -> Int {
  var sum = 0
  for element in elements {
    sum += element
  }
  
  return sum
}


saveMeFromMadness(elements: [1, 2, 3, 4, 5, 6])


// Somewhere in ViewController
saveMeFromMadness(elements: [1, 2, 3])
// Somewhere in NextViewController
saveMeFromMadness(elements: [4, 5, 6])



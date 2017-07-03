/*:
 ## Learn Swift with Bob
 ### Chapter 1: The Swift Fundamentals
 ### Optionals
 
 **Problem:** Why do optionals exist?
 
 #### Rules
 1. Every variable type must be defined (Implicit/Explicit)
 2. The type is inferred based on the value
 ---
 */
//: Implicit and Explicit Type
let name: String = "Bob"          // Explicit
let newName = "Bob the Developer" // Implicit

let myAge: Int = 20               // Explicit
let mySisterAge = 14              // Implicit
let myGPA: Double = 3.54          // Explicit


//: Fetching Profile Picture
// If could return "URL" or "nothing"
let myFace = "https://..."


//: Introducing Optionals
// Optional type allows storing nil
let myName: String? = nil
let yourName: String? = "Bob Lee"

let bobAge: Int? = nil
let robAge: Int? = 123
let danAge: Int? = 3

// robAge + danAge
let yourAge = 100
/*:
 Optional Rules:
 1. Optionals do not interact with each other
 2. Convert Optionals to normal types, the process known as *unwrapping*
 */
//: ### Optional Unwrapping
//: Forced Unwrapping
let newRobAge = robAge!
let newDanAge = danAge!

// Problem 

var image: String? = nil

// let normalImage = image!  // let normalImage = nil
// print(normalImage)


//: Implicit Unwrapping
// Conditonal Statement
let imageFromFaceBook: String? = "Bob's Face"

if let normalImage = imageFromFaceBook {
  print(normalImage)
} else {
  print("There is no image")
}

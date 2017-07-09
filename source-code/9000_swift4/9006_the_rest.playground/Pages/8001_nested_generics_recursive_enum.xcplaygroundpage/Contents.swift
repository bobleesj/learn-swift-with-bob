/*:
 ## Learn Swift with Bob
 ### What's New in Swift 4
 ### 9006_The Rest
 
 **Problem:** What Else?
 
 ---
 
 */

//: ### Multi-Line
//: Your Past
let multiLines = "Sentence 1\n Sentence 2\n Sentence 3\n"
print(multiLines)

//: Swift 4
let swift4Lines = """
Boom
Boom Boom
Boom Boom Boom
"""
print(swift4Lines)

//: ### One-Sided Ranges
let stringArray = ["One", "Two", "Thee", "Four", "Five"]
let lessThanIndexThree = stringArray[..<3]
print(lessThanIndexThree)
let lessThanIndexFour = stringArray[...3]
print(lessThanIndexFour)

let greaterThanIndexFour = stringArray[3...]
print(greaterThanIndexFour)

//: Apply to `Switch Statement`
let age = 400
switch age {
case 0...10:
  print("Child")
case 11...:
  print("Adult")
default:
  print("?")
}



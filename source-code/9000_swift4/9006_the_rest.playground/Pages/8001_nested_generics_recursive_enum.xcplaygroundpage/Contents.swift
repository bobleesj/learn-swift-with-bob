/*:
 ## Learn Swift with Bob
 ### What's New in Swift 4
 ### Advanced Dictionary
 
 **Problem:** Functional programming met Swift dictionary
 
 ---
 
 */


//: ### Multi-Line
let longString = """
When you write a string that spans multiple
lines make sure you start its content on a
line all of its own, and end it with three
quotes also on a line of their own.
Multi-line strings also let you write "quote marks"
freely inside your strings, which is great!
"""

//: ### One-Sided Ranges
let characters = ["Dr Horrible", "Captain Hammer", "Penny", "Bad Horse", "Moist"]
let bigParts = characters[..<3]
let smallParts = characters[3...]
print(bigParts)
print(smallParts)


print("hello")
func hello() {
  print("Hello!")
}

hello()


let name = "Bob Lee the Bob the Developer"

print("hello")
print("Bob Lee the Bob the Developer")
print("1 + 1 : 3")




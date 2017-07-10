/*:
 ## Learn Swift with Bob
 ### What's New in Swift 4
 ### 9005_Advanced Dictionary
 
 **Problem:** Functional programming met Swift dictionary
 
 ---
 
 */

//: ### Default Value
//: Your Past
var myInfo = ["name": "Bob Lee", "age": "14"]
let name = myInfo["name"] // Optional("Bob Lee")

//: Default Value for Dictionary
let footSize = myInfo["footsize", default: "No Value"]
let myName = myInfo["name", default: "No Value"] // "Name"

//: **Practical Usage**: Everywhere for accessing dictionary value


//: ### Grouping a `sequence` into a dictionary
let contacts = ["Julia", "Susan", "John", "Alice", "Alex"]
let grouped = Dictionary(grouping: contacts, by: { $0.first! })
print(grouped)


let duplicates = [("a", 1), ("b", 7), ("a", 3), ("b", 4)]
let myLetter = Dictionary(duplicates, uniquingKeysWith: { (first, _) in first })
print(myLetter)

//: ### Zip: (Dictionary Like)
let words = ["one", "two", "three", "four"]
let numbers = 1...4

for (word, number) in zip(words, numbers) {
  print("\(word): \(number)")
}
// Prints "one: 1"
// Prints "two: 2
// Prints "three: 3"
// Prints "four: 4"

//: Zip to Dictionary
let friends = ["Hoy", "Dan", "Huy"]
let friendsWithValue = Dictionary(uniqueKeysWithValues: zip(1..., friends))

//: ### Functional Programming with Set
let set: Set = [1,2,3,4,5]
let filteredSet = set.filter { $0 % 2 == 0 } // Returns Set
type(of: filteredSet)

//: ### Funtional Programming to Dictionary
let dictionary = ["name": "Bob", "age": "15", "hairColor": "Black"]

let filtered = dictionary.filter {
  $0.key == "name"
}

print(filtered)

let mapped = dictionary.mapValues { value in
  value.uppercased()
}

print(mapped)









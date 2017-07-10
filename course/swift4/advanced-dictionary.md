# Advanced Dictionary
## Introduction
## Problem



### Default Value
```swift
var myInfo = ["name": "Bob Lee", "age": "14"]
let name = myInfo["name"] // Optional("Bob Lee")
```

```swift
let footSize = myInfo["footsize", default: "No Value"] // "No Value"
let myName = myInfo["name", default: "No Value"] // "Name"
```

> I'd use it everywhere.


### Grouping a sequence into a dictionary

```swift
let contacts = ["Julia", "Susan", "John", "Alice", "Alex"]
let grouped = Dictionary(grouping: contacts, by: { $0.first! })

grouped // ["J": ["Julia", "John"], "S": ["Susan"], "A": ["Alice", "Alex"]]


let duplicates = [("a", 1), ("b", 7), ("a", 3), ("b", 4)]
let myLetter = Dictionary(duplicates, uniquingKeysWith: { (first, _) in first })
uniquingKeysWith // ["b": 7, "a": 1]
```

### Zip (Dictionary Like)
```swift
let words = ["one", "two", "three", "four"]
let numbers = 1...4

for (word, number) in zip(words, numbers) {
  print("\(word): \(number)")
}
// Prints "one: 1"
// Prints "two: 2
// Prints "three: 3"
// Prints "four: 4"
```

Zip to Dictionary
```swift
let friends = ["Hoy", "Dan", "Huy"]
let friendsWithValue = Dictionary(uniqueKeysWithValues: zip(1..., friends))
```


### Functional Programming with Set
```swift
let set: Set = [1,2,3,4,5]
let filteredSet = set.filter { $0 % 2 == 0 } // Returns Set
type(of: filteredSet)
```
### Functional Programming with Dictionary

```
let dictionary = ["name": "Bob", "age": "15", "hairColor": "Black"]

let filtered = dictionary.filter {
  $0.key == "name"
}

print(filtered)

let mapped = dictionary.mapValues { value in
  value.uppercased()
}

print(mapped)
```


## Conclusion

### Source Code
[9005_advanced_dictionary.playground]()

### Resources
[Swift Evolution: Dictionary and Set Enhancement (Github)](https://github.com/apple/swift-evolution/blob/master/proposals/0165-dict.md)

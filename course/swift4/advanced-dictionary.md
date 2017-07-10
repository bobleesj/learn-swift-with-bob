# Advanced Dictionary
## Introduction
Welcome to Lesson 5, Advanced Dictionary of What's New in Swift 4. Before I say anything about this lesson. I have you warn you what would happen by the time the you will have completed this course. First, you would feel a sense of superiority, even feel over-confidence because most developers do not code the way you will. Let's find out what I mean by the previous statement.

## Problem
Functional programming met Swift dictionary

### Default Value
First, let's begin with a warm-up.

```swift
var myInfo = ["name": "Bob Lee", "age": "14"]
let name = myInfo["name"] // Optional("Bob Lee")
```

When you attempt to access a value, the dictionary return an optional type. In Swift 4, however, you may prevent that from happening.

```swift
let myName = myInfo["name", default: "No Value"] // "Name"
let footSize = myInfo["footsize", default: "No Value"] // "No Value"
```

> I'd use it everywhere since I do not like optionals floating around in my codebase. Optional types represent death for other lines of code. To prevent death, you have to add more lines of code.

### Grouping a sequence into a dictionary
The `Dictionary` struct provides a couple custom initializers that allow you to create a dictionary using an array.

```swift
let contacts = ["Julia", "Susan", "John", "Alice", "Alex"]
let grouped = Dictionary(grouping: contacts, by: { $0.first! })

grouped // ["J": ["Julia", "John"], "S": ["Susan"], "A": ["Alice", "Alex"]]
```

I don't exactly know the custom init method looks like. As the parameter indicates, it requires the value of each element in the array.


### Unique Key
You may also create an array filled with tuple to a dictionary with unique keys.

```swift
let duplicates = [("a", 1), ("b", 7), ("a", 3), ("b", 4)]
let myLetter = Dictionary(duplicates, uniquingKeysWith: { (letter, number) in letter })
uniquingKeysWith // ["b": 7, "a": 1]
```

What a powerful way to manipulate an array of tuples.

### Zip (Dictionary Like)
Some may not be familiar with `Zip`. Let's go over before moving on to the next step.

```swift
let words = ["one", "two", "three", "four"]
let numbers = 1...words.count

for (word, number) in zip(words, numbers) {
  print("\(word): \(number)")
}
// Prints "one: 1"
// Prints "two: 2
// Prints "three: 3"
// Prints "four: 4"
```

For `zip`, the parameters must conform to the `sequence` protoocol. You will learn more about it in the next chapter.

### Zip to Dictionary
Let us apply `Zip` to create a beautiful dictionary.

```swift
let friends = ["Hoy", "Dan", "Huy"]
let friendsWithValue = Dictionary(uniqueKeysWithValues: zip(1..., friends))
```
> You don't need to memorize. All you need to know is, "things" exist.

### Functional Programming with Set
In the past, when you apply built-in functions such as `filter`, it returns `Array<T>`. In Swift, it returns `Set<T>`

```swift
let set: Set = [1,2,3,4,5]
let filteredSet = set.filter { $0 % 2 == 0 } // Returns Set
type(of: filteredSet) // Set
```
### Functional Programming with Dictionary
Now, this is the real deal. You will never the code the same way if you understand this. But, again, this should be a review of the previous chapters.

```swift
let dictionary = ["name": "Bob", "age": "15", "hairColor": "Black"]

let filtered = dictionary.filter {
  $0.key == "name"
}

print(filtered) // ["name": "Bob"]
```

This is just purely beautiful and nice.

```swift
let mapped = dictionary.mapValues { value in
  value.uppercased()
}

print(mapped) // ["name": "BOB", "age": "15", "hairColor": "BLACK"]
```

This is just short and nice. Amazing code. I love it.


## Conclusion
That's it. That's just it. As I promised, you will never code the way you've been doing in the past. In fact, Swift 4 has changed my perspectives towards how to manipulate key-value in Dictionary. But, still, some may feel overwhelmed by the amount of information that I've presented to you thus far. Don't you worry. I do not want you to memorize. In fact, memorization isn't needed anymore in this world where the internet and your left hand, Google is available 24/7. As I mentioned, all you need to know is, "I've been it before and those things exist". That's it. All you have to do is search and learn more!

Do not try to memorize any, simply understand the fundamentals and look at API guidelines and references for your usage. At least it works out for me.

### Source Code
[9005_advanced_dictionary.playground]()

### Resources
[Swift Evolution: Dictionary and Set Enhancement (Github)](https://github.com/apple/swift-evolution/blob/master/proposals/0165-dict.md)

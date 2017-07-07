# Reduce
## Introduction
Welcome to Lesson 3 of Functional Programming. I don't think I have to talk too much. Let's get into the lesson right away.

## Problem
Combine all into one

### Imperative/Non-Functional
Let's try to add up numbers in an array.

```swift
var numberOne = Int()
for number in Array(1...10) {
  numberOne += number
}

numberOne // 55
```

Let's try to subtract all numbers in an array.
```swift
var numberTwo = Int()
for number in Array(1...10) {
  numberTwo -= number
}

numberTwo // -55
```

Again, there must be a better way. You know the drill.

### Declarative/Functional Programming
```swift
let added = Array(1...10).reduce(0) { $0 + $1 } // 55
let subtracted = Array(1...10).reduce(0) { $0 - $1 } // -55
```

You will discover how the `reduce` function works behind the scene by the end of this lesson. Let's get started.

```swift
func myReduce(_ seed: Int, numbers: [Int], operation: (Int, Int) -> Int) {
  var current = seed
  for number in numbers {
    current = operation(current, number)
  }
}
```

`seed` represents the initial value you wish to start off with.

```swift
myReduce(0, numbers: Array(1...10)) { $0 + $1 }
```

### Ex) Finding the Max
```swift
let maxNumber = Array(1...10).reduce(0) { (total, number) in max(total, number) }
let bigNumber = Array(1...10).reduce(0) { max($0, $1) }
```

So far, `myReduce` has not returned any. Let's create a function that returns the final value in `Int`.

```swift
func reduce(_ seed: Int, numbers: [Int], operation: (Int, Int) -> Int) -> Int {
  var current = seed
  for number in numbers {
    current = operation(current, number)
  }
  return current
}

reduce(0, numbers: Array(1...10)) { $0 + $1 }
```

### Generic Reduce
Again, creating a generic function is just a required for the sake of time and efficiency.

```swift
extension Array {
  func myReduce<U>(_ seed: U, operation:(U, U) -> U)  -> U {
    var current = seed
    for item in self {
      current = operation(current, item as! U)
    }
    return current
  }
}
```

Currently, there is a force casting using `as! U`. It occurs since the type of `U` is not defined until you use the `myReduce` function.

```swift
let names = ["Bob", "Bobby", "Lee"]
let description = names.myReduce("Names:") { "\($0) " + $1 }
print(description) // "Names: Bob Bobby Lee"
```

Not only that, you may "chain" multiple functions.

```swift
let lowerNames = names.map { $0.lowercased() }.myReduce("Names:") { "\($0) " + $1 }
print(lowerNames) // "Names: bob bobby lee"
```

### The Purest Form
```swift
//: The Purest Form
extension Array {
  func reduce(_ seed: Element, operation:(Element, Element) -> Element) -> Element {
    var current = seed
    for item in self {
      current = operation(current, item)
    }
    return current
  }
}

let hello = ["Bob", "Bobby", "Lee"].reduce("Names:") { "\($0) " + $1 }
```
### Source Code
[6004_reduce.playground]()

## Conclusion
I hope by now you are truly seeing the power of functions. Well, a functional paradigm is not specifically tied to iOS development. In fact, you've learned how to apply and utilize closure and generics in web development, server development, Android development, and other platforms. This course isn't just about learning Swift. It is about to learn how to code with beauty and class. Let's get to the final function of this chapter. 

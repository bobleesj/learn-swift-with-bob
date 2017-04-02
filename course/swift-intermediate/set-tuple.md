# Set and Tuple

## Introduction
Welcome to Lesson 9 of The Swift Fundamentals. The first objective is to learn how to group a list of items with `set`. The second is to work with various types in a variable/constant with `tuple.` Enough said, let's go.

## Problem
 1. I'd love to eliminate duplicated items
 2. I'd love to combine all kinds of types





## Introducing Sets
A set stores values of the same type in a collection with **no defined ordering** and **no duplicated elements**.

### Multiple Ways to Create Arrays
Before we create sets in Swift, first let's review multiple ways to create an array in Swift
```
//: Multiple ways to create arrays
var arrayOne: [Double] = [] // Most Common
var arrayTwo = [Double]()

var arrayThree: Array<Double> = []
var arrayFour: Array<Double> = Array()
var arrayFive = Array([1123.08, 234.23])

var arraySix = Array(1...100)
var arraySeven = Array(repeatElement("Bob", count: 10))
```

### Multiple Ways to Create Sets
```swift
var setOne: Set = [1, 2, 3, 4, 5]
var setTwo: Set<String> = ["Bob", "Bobby", "Bob the Developer"]
var emptySet = Set<String>()
```

## Built-In Set Methods
```swift
emptySet.insert("Bob")
emptySet.contains("Bob") // true
emptySet.remove("Bob")
```

### Prepare Two Arrays 
```
var oddNumbers: [Int] = []
var evenNumbers: [Int] = []

for number in 1...50 {
  if number % 2 == 0 {
    evenNumbers.append(number)
  } else {
    oddNumbers.append(number)
  }
}
```


### Swift Naming Guide
| Mutating | Non-Mutating |
|:---:|:---:|
| array.append() | array.sorted() |
| array.sort() | array.appending |


<img src=/course/swift-intermediate/assets/swift-set-structure.png alt="Built-in Set methods" width=600px/>



### Source Code

### Reference

## Conclusion

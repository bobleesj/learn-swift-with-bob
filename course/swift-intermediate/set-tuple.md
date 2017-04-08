# Set and Tuple

## Introduction
Welcome to Lesson 9 of The Swift Fundamentals. The first objective is to learn how to group a list of items with `Set`. The second is to work with various types within a single variable/constant with `Tuple.` Enough said, let's get started.

## Problem
 1. I'd love to eliminate duplicated items: `sets`
 2. I'd love to combine all kinds of types: `tuples`

## Introducing Sets
A set stores values of the same type in a collection with **no defined ordering** and **no duplicated elements**.

### Multiple Ways to Create Arrays
Before we create sets in Swift, first let's review multiple ways to create an array.

> Remember, `Array` is just a generic struct.

```swift
var arrayOne: [Double] = [] // Most Common
var arrayTwo = [Double]()

var arrayThree: Array<Double> = []
var arrayFour: Array<Double> = Array()
var arrayFive = Array([1123.08, 234.23])

var arraySix = Array(1...100)
var arraySeven = Array(repeatElement("Bob", count: 10))
```
> Remember, `Set` is just a generic struct.

### Multiple Ways to Create Sets
`Set` in Swift looks similar to `Array`. You may convert from sets to arrays and vice versa.

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

## Create Two Arrays

```swift
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

### Check

```swift
oddNumbers // [1, 3, 5, 7, 9, ...]
evenNumbers // [2, 4, 6, 8, 10, ...]
```

### Tertiary Operator
You will learn more in [Lesson 11_Operators](/course/swift-intermediate/operators.md)  

```swift
for number in 1...50 {
  (number % 2 == 0) ? evenNumber.append(number) : oddNumber.append(number)
}
```

## Convert Array to Set

```swift
var oddNumberSet = Set(oddNumbers)
let evenNumberSet = Set(evenNumbers)
```

### Built-In Set Methods

<img src=/course/swift-intermediate/assets/swift-set-structure.png alt="Built-in Set methods" width=600px/>


#### Union

```swift
oddNumberSet.union(evenNumberSet)
```

#### Symmetric Difference

```swift
oddNumberSet.symmetricDifference(evenNumberSet)
```

#### Intersection

```swift
oddNumberSet.intersection(evenNumberSet)
```

#### Subtract

```swift
oddNumberSet.subtract(evenNumberSet)

var numberSet = Set([1, 2, 3])
let secondNumberSet = Set([1, 2])

numberSet.subtract(secondNumberSet)
print(numberSet) // {3}
```

`Subtract` mutates `oddNumberSet`. You can predict whether a method is mutating or not based on the naming guide below.

### Swift Naming Guide
| Mutating | Non-Mutating |
|:---:|:---:|
| *verb* | *adjective* |
| array.append() | array.sorted() |
| array.sort() | array.appending |

### Sort
Since sets do not provide any order, sets must be converted to an array type for sorting.

```swift
let sortedArray = evenNumberSet.sorted()
```

#### Functional Programming

```swift
let sortedArrayFromHighToLow = evenNumberSet.sorted { $0 > $1 }
print(sortedArrayFromHighToLow) // [100, 98, 96, ...]
```

> If you are interested in learning more about Functional Programming with MVVM, you can be on the mailing list for my [upcoming courses](/ABOUT.md#course).

###  Practical Usage of Set
 - Finidng unique letters
 - Finding unique visitors
 - Any game logic (You have to visualize)

## Introducing Tuples

```swift
let firstScore = (name: "Bob", score: 9)
firstScore.0
firstScore.1

firstScore.name
firstScore.score
```

```swift
let secondScore = ("Rob", 10)
secondScore.0
secondScore.1
```


### Practical Usage
```swift
let httpSuccess = (code: 200, description: "success")
httpSuccess.code

let httpFailture: [Any] = [401, "Fail"]
```


## Bonus Tips

```swift
// Okay
var dog = "dog", cat = "cat"
print(dog)
```

```swift
// Better
var (x, y, z) = (1, 2, 3)
print(x)
print(y)
```

```swift
var shoppingList = ["Eggs", "Milk", "Rice"]

for (index, value) in shoppingList.enumerated() {
  print(index, value)
}
```

`enumerated` turns into a tuple


### Source Code
[1009_set_tuple.playground](https://www.dropbox.com/sh/w3b55cig44dkn18/AADfa-mpPqoWgDUOrhn02_goa?dl=0)

## Conclusion

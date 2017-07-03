# Set and Tuple

## Introduction
Welcome to Lesson 9 of The Swift Fundamentals. There are two objects. The first is to learn how to group a list of items with `sets`. The second is to work with various types within a single variable/constant with `tuples`.

## Problem
 1. I'd love to eliminate duplicated items: `sets`
 2. I'd love to combine all kinds of types: `tuples`

## Introducing Sets
A set stores values of the same type in a collection with **no defined ordering** and **no duplicated elements**.

### Multiple Ways to Create Arrays
Before we create sets in Swift, let's review multiple ways to create an array.

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
`Set` in Swift looks similar to `Array`.

```swift
var setOne: Set = [1, 2, 3, 4, 5]
var setTwo: Set<String> = ["Bob", "Bobby", "Bob the Developer"]
var emptySet = Set<String>()
```

## Built-In Set Methods
Similar to `Array`, `Set` contains default methods and properties.

```swift
emptySet.insert("Bob")
emptySet.contains("Bob") // true
emptySet.remove("Bob")
```

## Create Two Arrays
You may convert `Array` to `Set`, or vice versa. In this example, let us convert `Array` to `Set`. First, create two arrays filled with odd and even numbers.

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

### Tertiary Operator
You may use tertiary operator as an alternative to achieve the same result above. You will learn more in [1011_intro_operators](/course/swift-fundamentals/intro-operators.md)  

```swift
for number in 1...50 {
  (number % 2 == 0) ? evenNumber.append(number) : oddNumber.append(number)
}
```

### Check
```swift
oddNumbers // [1, 3, 5, 7, 9, ...]
evenNumbers // [2, 4, 6, 8, 10, ...]
```

## Convert Array to Set

```swift
var oddNumberSet = Set(oddNumbers)
let evenNumberSet = Set(evenNumbers)
```

`oddNumberSet` and `evenNumberSet` no longer has defined order.

## Built-In Set Methods
`Set` provides methods to work with multiple sets.

<img src=/course/swift-fundamentals/assets/swift-set-structure.png alt="Built-in Set methods" width=600px/>

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

`Subtract` mutates `oddNumberSet`. Therefore, the `oddNumberSet` instance must be `var` rather than `let`. You can predict whether a method is mutating or not based on the naming guide below.

### Swift Naming Guide
| Mutating | Non-Mutating |
|:---:|:---:|
| *verb* | *adjective* |
| array.append() | array.sorted() |
| array.sort() | array.appending |

### Sort
Since sets do not provide any order, sets must be converted to an array type to be sorted. There is a built-in method called, `sorted()`.

```swift
let sortedArray = evenNumberSet.sorted()
print(sortedArray) // [2, 4, 6, ...]
```

#### Functional Programming
The `sorted()` is flexible.

```swift
let sortedArrayFromHighToLow = evenNumberSet.sorted { $0 > $1 }
print(sortedArrayFromHighToLow) // [100, 98, 96, ...]
```

In this course, you are not going to learn how `sorted()` is constructed. However, if you are interested in learning more about Functional Programming with MVVM, you can be on the mailing list for my [upcoming courses](/ABOUT.md#course).

###  Practical Usage of Set
 - Finding unique letters and unique visitors
 - Any game logic (Up to your imagination)

## Introducing Tuples
You may combine multiple types of value in a single `let` or `var`.

```swif
let firstScore = (name: "Bob", score: 9)
```

You may access elements through calling the index similar to `Array`

```swift
firstScore.0 // "Bob"
firstScore.1 // 9
```

You may also access the elements through the labels.

```swift
firstScore.name // "Bob"
firstScore.score // 9
```

However, you don't have to specify the argument labels.

```swift
let secondScore = ("Rob", 10)
secondScore.0
secondScore.1
```


### Practical Usage
This is your past.
```swift
let httpFailure: [Any] = [401, "Fail"]
```


You no longer have to upcast to `Any`.

```swift
let httpSuccess = (code: 200, description: "success")
httpSuccess.code
```



## Bonus Tips
You created multiple instances in a single line.

```swift
// Okay
var dog = "dog", cat = "cat"
print(dog)
```

Instead, you may use `tuple`

```swift
// Better
var (x, y, z) = (1, 2, 3)
print(x)
print(y)
```

You may convert an array into a tuple that contains index and element through the `enumerated()` method.

```swift
var shoppingList = ["Eggs", "Milk", "Rice"]

for (index, value) in shoppingList.enumerated() {
  print(index, value)
}
```

### Source Code
[1009_set_tuple.playground](https://www.dropbox.com/sh/u0ltcnxjiao4s9s/AAAAAZZdGxSUhUCd2nUCpKwFa?dl=0)

### Reference
[Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/)
## Conclusion
To recap, `Set` is used to group non-duplicate items with no order. `Tuple` is used to group all kinds of types with the order you define.  Second, you've learned how to identify mutating vs non-mutating methods based on the naming guide. Make sure you follow the same principle in your codebase as well. Don't get too caught up with Functional Programming. I know it sounds cool. You will get a taste of it in chapter 3, Intro to Functional Swift.

In the next lesson, you will learn how to write modular and beautiful code with `extension`.

> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

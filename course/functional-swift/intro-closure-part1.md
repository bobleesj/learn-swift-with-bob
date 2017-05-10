# Intro to Closures Part 1

## Introduction
Welcome to Lesson of 1 of Intro to Functional Swift. You will learn what makes closures different from the Swift functions. If you've never used closures before, this lesson will be tough.

## Problem
Who are you closures, () -> ()?

### Definition
 - A closure is a function without name and the `func` keyword (for now).
 - Quick and easy to carry around as a variable/constant or pass as a parameter

## Functions
To appreciate closures, let us begin with functions. Create a function that add two numbers.

```swift
func addTwoNumbers(number1: Int, number2: Int) -> Int {
  return number1 + number2
}
```

### First Class Citizen
You may store a function into a variable/constant.

```swift
var addFunction = addTwoNumbers
addFunction(10, 30) // 40
```

## Introducing Closures
Create a closure whose functionality is identical as above. A closure block begins and ends with `{`,`}`.

```swift
var addClosures: (Int, Int) -> Int = {
  (number1: Int, number2: Int) in
  return number1 + number2
}

addClosures(4, 10) // 14
```

The type of  `addClosures` is `(Int, Int) -> Int`. It is identical to `addTwoNumbers` from the early example. `number1` and `number2` are the parameter labels. Anything comes after  the keyword,`in`, is a return block.


### Short Form
It is not required to enter `return` after `in` only if the closure solely returns value.

```swift
var addClosuresTwo = {
  (number1: Int, number2: Int) in
  print("Hello")
  return number1 + number2 // return required
}

var addClosuresThree = {
  (number1: Int, number2: Int) in
  number1 + number2 // return not required
}

addClosuresThree(4, 6)
```

The `addClosuresTwo` requires `return` since there is an additional line of `print("Hello")`. Besides, you may skip the `return` keyword.


### Shortest Form
As long as you specify the type, you may not create an argument label.

```swift
var addClosuresFour: (Int, Int) -> Int = { $0 + $1 }
addClosuresFour(4, 5) // 9
```

In the example above, `$0` and `$1` refer to the first and second parameter.    Swift recognizes 4 as `$0` and 5, `$1` from `addClosuresFour(4, 5)`.

## Another Example
Let us create a function that does not require any parameter but returns `String`.

```swift
func callString() -> String {
  return "hello, I'm a function"
}
```

Let us express the `callString` function with a closure block instead.


```swift
let callStringWtihClosure: () -> String = { () in
  print("hello")
  return "hello, I'm a closure"
}

callStringWtihClosure()
// "hello, I'm a closure"

// Skip Return
let callStringWtihClosureTwo: () -> String = { () in
  "hello, I'm a closure"
}
```

### Short Form {#no-parameter}
If you pass no parameter, you may ignore explicit type definition.

```swift
// Type defined explicitly
let callStringWtihClosureThree: () -> String = { "hello, I'm a closure" }

// Type defined implicitly
let callStringWtihClosureFour = { "hello, I'm a closure" }
callStringWtihClosureFour // () -> String
```

### Resource
[No Fear Closure in Swift 3 with Bob]

[No Fear Closure in Swift 3 with Bob]: https://blog.bobthedeveloper.io/no-fear-closure-in-swift-3-with-bob-72a10577c564


### Source Code
[3001_intro_closures_part1.playground](https://www.dropbox.com/sh/dz7zn4gthlms8oh/AAAlcQb3Nu_SD2X3NDLRnZxKa?dl=0)


## Conclusion
To recap, you've learned functions and closures are identical. However, you may express closures using various forms which often lead to zenness and effective communication. You've learned the basics. You will discover the power of closures as you step up one at a time.

You may feel uncomfortable. You should be. In fact, if you are not struggling, you are not learning. Accumulating knowledge goes against the Second Law of Thermodynamics that the universe wants to remain scattered. When you defy the law as a human being, you face consequences. Embrace the pain and it's a natural phenomenon.

In the following lesson, you will how learn how to pass and return a closure block within a function.

> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

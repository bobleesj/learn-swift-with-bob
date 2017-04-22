# Recursive Enums

## Introduction
Welcome to Lesson 5 of Advanced Enum. In this lesson, you will discover how to create a complex enum structure using a recursive. Some may have not heard the term, "recursive" before. I will briefly show you what a recursive function is. Nonetheless, this lesson may be challenging.

## Problem
Enum contains its own enum type

## Recursive Function
Let us begin this lesson by learning about what a recursive function is.

```swift
func recursiveFunction() {
  print("Hi!")
  recursiveFunction() // loop
}
```

When you execute the `recursiveFunction`, it never ends.

```swift
recursiveFunction()
// "Hi'"
// "Hi'"
// ...
// "Hi"
```

## Design Enum
Create an enum, `ArithmeticExpression`. It contains three cases with associated types. Two of the cases contain its own enum type, `ArithmeticExpression`.  The `indirect` keyword is needed to indicate that the enum is a special animal.


```swift
indirect enum ArithmeticExpressions {
  case number(Int)
  case addition(ArithmeticExpressions, ArithmeticExpressions)
  case multiplication(ArithmeticExpressions, ArithmeticExpressions)
}
```

You may initialize using the `number` case or with `addition` or `multiplication`.

```swift
ArithmeticExpressions.number(4)
ArithmeticExpressions.addition(.number(4), .number(4))

let five = ArithmeticExpressions.number(5)
let four = ArithmeticExpressions.number(4)
```

You may create a recursive function to execute, `addition` and `multiplication`.


```swift
func evaluate(_ expression: ArithmeticExpressions) -> Int {
  switch expression {
  case let .number(value):
    return value
  case let .addition(left, right):
    return evaluate(left) + evaluate(right)
  case let .multiplication(left, right):
    return evaluate(left) * evaluate(right)
  }
}
```

> **Important:** You may have to look at the function multiple times until you get it. Don't give up.

Let us execute the function.

```swift
evaluate(ArithmeticExpressions.number(4))
evaluate(ArithmeticExpressions.addition(.number(4), .number(4))) // 8
let multiplicationEnumType = ArithmeticExpressions.multiplication(.number(4), .number(4))
evaluate(multiplicationEnumType)  // 16
```

## Alternative Normal Enum
A recursive enum to do addition and multiplication is an overkill. Let us use a normal one.

```swift
enum Operation {
  case addition(Int, Int)
  case multiplication(Int, Int)

  var result: Int {
    switch self {
    case let .addition(number1, number2):
      return number1 + number2
    case let .multiplication(number1, number2):
      return number1 * number2
    }
  }
}
```

Execute.

```swift
Operation.addition(4, 4).result
```

However, I personally don't like the you have to use `result` to get the final value.

## Another Alternative
You may create a struct along with functions.

```swift
struct StructOperation {
  func addTwoNumbers(_ number1: Int, _ number2: Int) -> Int {
    return number1 + number2
  }
  func multiplfyNumbers(number1: Int, number2: Int) -> Int {
    return number1 * number2
  }
}
```

Execute
```swift
StructOperation().addTwoNumbers(4, 9)
```

This feels better. Yet, let us make it more zen.

## My Choice
Use closures instead.

```swift
struct MathOperation {
  static let addition: (Int, Int) -> Int = { $0 + $1 }
  static let multiplication: (Int, Int) -> Int  = { $0 * $1 }
}
```

Execute

```swift
MathOperation.addition(10, 10) // 20
```

The best.

### Source Code
[7005_recursive_enum.playground](https://www.dropbox.com/sh/1jax0kxocjui44s/AAC-nenilj-c5K0q7S2pzC0ga?dl=0)

### References
[The Swift Programming Language (Swift 3.1)](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Enumerations.html#/)

## Conclusion
One of the code smells is "needless complexity". You don't need to be fancy. Remember, protocols and enums are double edged swords. If you don't know how handle them well, it may hurt or even kill you. In Chapter 8, you will learn in-detail about how an `indirect` enum works using a binary tree data structure.

In the following lesson, you will learn how to combine enums with generics. 

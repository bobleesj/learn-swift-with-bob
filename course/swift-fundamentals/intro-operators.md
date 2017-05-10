# Intro to Operators

## Introduction
Welcome to Lesson 11 of The Swift Fundamentals. In Lesson 9, You've tasted the power of Swift operators for replacing a traditional `else-if` statement with a tertiary operator. In this lesson, you will be able be recognize a number of operators and use them when appropriate.


## Problem
Write less, produce more

## Definition
An operator is a symbol for a function.

### Unary operators
```swift
!true // false
!false // true
```

### Binary operators
```swift
1 + 2
4 == 4
1 / 4
5 % 2
```

### Typical Else-If
Create an `else-if` statement.

```swift
let iCanDrink = false

if iCanDrink {
  print("You may enter")
} else {
  print("No no")
}
```

Needlessly complex.

### Tertiary Operator
Instead of writing the long `else-if` block. You may use an operator to achieve the same effect.

```swift
iCanDrink ? print("You may enter") : print("No no") // "No no"
```

The statement above states, if `iCanDrink` is `true`, `print("You may drinK")`, else, `print("No no")`.

### Add odd/even numbers
In Lesson 9, we created odd and even arrays.

```swift
var evenNumbers: [Int] = []
var oddNumbers: [Int] = []

for number in 1...50 {
  if number % 2 == 0 {
    evenNumbers.append(number)
  } else {
    oddNumbers.append(number)
  }
}
```

### Tertiary Operator
Since there are only two conditions, a tertiary operator is used instead.

```swift
for number in 1...50 {
  (number % 2 == 0) ? evenNumbers.append(number) : oddNumbers.append(number)
}
```

## Unwrapping Optionals
You may unwrap `optionals` without using `if-let`. You may use a good old way.

```swift
var age: Int? = nil
var defaultAge: Int = 20

var finalUserAge = Int() // 0

if age != nil {
  finalUserAge = age!
} else {
  finalUserAge = defaultAge
}
```
Needlessly complex.

### Nil-Coalescing Operator
Let us type less but produce more.

```swift
finalUserAge = age ?? defaultAge // finalUserAge is 20
```

The above states that if `age` contains `nil`, use `defaultAge` instead. Nice and simple.

### Source Code
[1011_operators.playground](https://www.dropbox.com/sh/1cz94ffju3e8smz/AABbbdMDL5Ch1-8T4ZHlPlvFa?dl=0)

## Conclusion
You've only scratched the surface. In Chapter 8, you will learn how to create your own operators. I know you are excited. Stay consistent and you will get there, hopefully soon.

In the next lesson, you will learn how to create fake names for types. Keep marching forward.

> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

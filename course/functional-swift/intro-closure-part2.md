# Intro to Closures Part 2
## Introduction
Welcome to Lesson 2 of Intro to Functional Swift. In the previous lesson, you've learned how to create a closure block with various forms. Today, you will learn how to create a special function. It not only takes a closure block as its parameter and but also returns it.

## Problem
Can you pass/return a function/functions to a function?

## Review
Add two numbers using a closure

```swift
var addWithClosures: (Int, Int) -> Int = { (number1: Int, number2: Int) in
  return number1 + number2
}
```

Return `String`

```swift
var returnString: () -> String = { () in
  "hello"
}

let returnedValue = returnString() // "hello"
```

## First Class Citizen
The Swift functions and closures are often referred as "First Class Citizen". You may

  1. store in a variable/constant
  2. pass as a parameter
  3. return

> **Disclosure**: The Swift Function is called Global Closure

## Return Closure
Let us create a function that returns a closure block. There are two ways.

### Return Closure Indirectly
First, design a function whose return type is `(Int, Int) -> Int`.

```swift
func returnClosure() -> ((Int, Int) -> Int) {
  return addWithClosures
}

let addClosure = returnClosure()
addClosure(4, 10)
returnClosure()(4, 10) // addWithClosure(4, 10)
```

You've returned `addWithClosures` whose type is `(Int, Int) -> Int` as well.  If there is no `()` at the end, it is considered as a constant/variable.

### Return Closure Directly
You may return a closure block directly instead of `addWithClosures`.

```swift
func returnClosureDirectly() -> ((Int, Int) -> Int) {
  return { (number1, number2) in number1 + number2 }
}
returnClosureDirectly()(4, 10) // 14
```

You may use the short from instead.

```swift
func returnClosureDirectlyTwo() -> ((Int, Int) -> Int) {
  return { $0 + $1 }
}
returnClosureDirectlyTwo()(4, 10) // 14
```

## Pass Closure
Create a function whose parameter accepts `() -> String`. Then, execute the closure block within the function.

```swift
func insertClosureBlock(closureBlock: () -> String) -> String {
  return closureBlock()
}
```

### Design Closure Block
Create a closure which will be passed in the `insertClosureBlock` function.

```swift
func hello() -> String {
  return "hello"
}
```

### Pass Closure Indirectly
```swift
insertClosureBlock(closureBlock: hello)
// "hello"
```

### Pass Closure Directly
```swift
insertClosureBlock(closureBlock: { _ in return "hello" })
insertClosureBlock(closureBlock: { return "hello" })
insertClosureBlock(closureBlock: { "hello" })
```

### Resources
No Fear Closures with Bob [Part 1](https://medium.com/ios-geek-community/no-fear-closure-in-swift-3-with-bob-72a10577c564#.m832h4jppz) and [Part 2](https://medium.com/ios-geek-community/no-fear-closure-in-swift-3-with-bob-72a10577c564#.m832h4jpp).

### Source Code
[3002_intro_closures_part2.playground](https://www.dropbox.com/sh/9otg5tvwsu6v4tu/AACZbraHNlnvc39Vppz7Rcdsa?dl=0)

## Conclusion
You've learned how to pass and return a closure block directly and indirectly within a function. The is the fundamental root of functional programming which I'm not going to dive much into in this course. You may sign up for my mailing list if you are interested in learning about reactive programming with RxSwift and MVVM.

We've covered the basics of closures in Swift. From now on, difficulty of this chapter will dramatically increase. Before you step onto the arena, I recommend you to read my articles and practice on your own until you become well-versed with the closure syntax. If not, you will suffer.

In the following lesson, you will learn how to initialize an object using a closure block and the meaning of `lazy` in the Swift Programming Language.

> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

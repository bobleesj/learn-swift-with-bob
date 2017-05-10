# Trailing Closures

## Introduction
Welcome to Lesson 5 of Intro to Functional Swift. You will learn how to beautify a closure block.

## Problem
A closure is too long to pass through a function

### Design Function
Create a function which takes two parameters: `Int` and `() -> Void`

```swift
func trailingClosure(number: Int, closure: () -> Void) {
  print("You've entered \(number)")
  closure()
}
```


### Design Closure Block
Create a closure block which will be passed to `trailingClosure`

```swift
func helloFunc() -> Void {
  print("Hello, Function!")
}
helloFunc // () -> Void

let helloClosure = {
  print("Hello, Closure!")
}
```

### Execute Function
Pass `helloFunc` and `helloClosure` to the function.

```swift
trailingClosure(number: 100, closure: helloFunc)
trailingClosure(number: 100, closure: helloClosure)
```

If a function's last parameter requires a closure block, you may beautify.

```swift
// Trailing Closure #1
trailingClosure(number: 100, closure: { print("Hello!!!") })

// Trailing Closure #2
trailingClosure(number: 100) { print("Hello!!!!!") }
```

### Another Example
```swift
func trailingClosures(number: Int, closure: (Int) -> Int) {
  let newNumber = closure(number)
  print(newNumber)
}
```

The last parameter of the function above requires `(Int) -> Int`. You may use a trailing closure block instead.

```swift
// Without trailing closure
trailingClosures(number: 1000, closure: { number in number * number })

// With trailing clousre
trailingClosures(number: 500) { number in number * number }
trailingClosures(number: 400) { $0 * $0 }
```

### Source Code
[3005_trailing_closures.playground](https://www.dropbox.com/sh/ahn75farmnscvxy/AADFWLKiwFwJoyMjd2dTFbwCa?dl=0)


## Conclusion
You've learned how to beautify a function whose last parameter contains a closure block. Trailing closures improve readability and zenness. You will see its beauty throughout the course.

In the following lesson, you will learn one of the most dreaded topics of all time: Completion handlers. You will learn how to design on your own. It's time to level up.

> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

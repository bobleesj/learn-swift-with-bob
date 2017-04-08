# Closures vs Functions (Part 2)
## Introduction
In the previous lesson, you've learned how to create a closure. Now, you are going to create a function that both use it as a parameter, and even returns it.

## Problem
Can you pass/return a function/functions to a function?

### Review
Add two numbers using a closure

```swift
var addWithClosures: (Int, Int) -> Int = { (number1: Int, number2: Int) in
  return number1 + number2
}
```
Return a string value
```swift
var returnString: () -> String = { () in
  "hello"
}

let returnedValue = returnString() // "hello"
```

### First Class Citizen
  1. Pass
  2. Return
  3. Store

> **Disclosure**: Function is called Global Closure

## Return Closure
Now only you may pass a closure to a function block, you may return a closure.


### Return closure block

```swift
func returnClosure() -> ((Int, Int) -> Int) {
  return addWithClosures
}

let addClosure = returnClosure()
addClosure(4, 10)
returnClosure()(4, 10) // addWithClosure(4, 10)
```

### Return direct closure
```swift
func returnClosureDirectly() -> ((Int, Int) -> Int) {
  return { (number1, number2) in number1 + number2 }
}
returnClosureDirectly()(4, 10) // 14

func returnClosureDirectlyTwo() -> ((Int, Int) -> Int) {
  return { $0 + $1 }
}
returnClosureDirectlyTwo()(4, 10) // 14
```

## Pass Closure
```swift
func insertClosureBlock(closureBlock: () -> String) -> String {
  return closureBlock()
}
```

### Enter closure indirectly
```swift
insertClosureBlock(closureBlock: hello)
```

### Enter closure directly
```swift
insertClosureBlock(closureBlock: { _ in return "hello" })
insertClosureBlock(closureBlock: { return "hello" })
insertClosureBlock(closureBlock: { "hello" })
```


### Resources
If you are not familiar with closures, it takes a while for you to get used to it. I highly recommend you to read my article on No Fear Closures with Bob [Part 1](https://medium.com/ios-geek-community/no-fear-closure-in-swift-3-with-bob-72a10577c564#.m832h4jppz) and [Part 2](https://medium.com/ios-geek-community/no-fear-closure-in-swift-3-with-bob-72a10577c564#.m832h4jpp).

### Source Code
[3002_intro_closures_part2.playground](https://www.dropbox.com/sh/dws40juw0rrx9mn/AACQjdv5oVoqNrB8ar2skfXva?dl=0)

## Conclusion
If you were to take away one thing, please remember this. You can pass closure to an argument label and even return closure. This is the basis of functional programming, which I'm not going to dive into. If you want to register for the course, feel free to send me an email, `bob@bobthedeveloper.io` to receive personal updates from me, and receive special offers on books, courses, and so on. My next course will be about MVVM, Protocol Oriented Programming, Functional Programming, and RxSwift. If you really want to improve your coding skill, I highly recommend it for you. You will be surprised how much you will learn more me. Keep developing your skill. If you are confused, make sure check out the resources, and keep googling and searching. Feel free to ask questions as well.

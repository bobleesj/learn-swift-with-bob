# Closures vs Functions (Part 2)
## Introduction
Welcome to Lesson 2 of The UIKIt Fundamentals Part 1 Intro to Functional Programming. In our previous lesson, you've learned how to create a closure. Now, you are going to create a function that both use it as a parameter, and even returns it.

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

### Pass Closure
You may pass a closure to a function. Create a function that takes a closure whose type is `() -> String`.

```swift
func insertClosure(closure: () -> String) -> String{
  return closure()
}

insertClosure(closure: returnString)
```

> **Disclosure**: Function is called Global Closure

### Return Closure
Now only you may pass a closure to a function block, you may return a closure.

```swift
func returnClosure() -> ((Int, Int) -> Int) {
  return { (number1, number2) in number1 + number2 }
}

let returnedClosure = returnClosure()
returnedClosure(5, 10)

returnClosure()(5, 15)
```

#### Return Short Closures
You might get confused by this. Again, a closure begins with `{` and ends with `}`.
```swift
func returnShortClosure() -> ((Int, Int) -> Int) {
  return { $0 * $1 }
}

returnShortClosure()(10, 10) // 100
```

### Resources
If you are not familiar with closures, it takes a while for you to get used to it. I highly recommend you to read my article on No Fear Closures with Bob [Part 1](https://medium.com/ios-geek-community/no-fear-closure-in-swift-3-with-bob-72a10577c564#.m832h4jppz) and [Part 2](https://medium.com/ios-geek-community/no-fear-closure-in-swift-3-with-bob-72a10577c564#.m832h4jpp).

### Source Code
[1302_Closures vs Functions (Part 2)](https://www.dropbox.com/sh/95xt4fmepicptte/AABvcKLuJ3oBMUSo_xtHYeLEa?dl=0)

## Conclusion
If you were to take away one thing, please remember this. You can pass closure to an argument label and even return closure. This is the basis of functional programming, which I'm not going to dive into. If you want to register for the course, feel free to send me an email, `bobleesj@gmail.com` to receive personal updates from me, and receive special offers on books, courses, and so on. My next course will be about MVVM, Protocol Oriented Programming, Functional Programming, and RxSwift. If you really want to improve your coding skill, I highly recommend it for you. You will be surprised how much you will learn more me. Keep developing your skill. If you are confused, make sure check out the resources, and keep googling and searching. Feel free to ask questions as well. s

#### Stay Connected
If you'd like to be on my mailing list and receive personal updates on upcoming books and courses, feel free to send me an email at `bobleesj@gmail.com`
<p>
<a href="http://bobthedeveloper.io"><img src="https://img.shields.io/badge/Personal-Website-333333.svg"></a>
<a href="https://facebook.com/bobthedeveloper"><img src="https://img.shields.io/badge/Facebook-Like-3B5998.svg"></a> <a href="https://youtube.com/bobthedeveloper"><img src="https://img.shields.io/badge/YouTube-Subscribe-CE1312.svg"</a> <a href="https://twitter.com/bobleesj"><img src="https://img.shields.io/badge/Twitter-Follow-55ACEE.svg"></a> <a href="https://instagram.com/bobthedev
"><img src="https://img.shields.io/badge/Instagram-Follow-BB2F92.svg"></a> <a href="https://linkedin.com/in/bobleesj"><img src= "https://img.shields.io/badge/LinkedIn-Connect-0077B5.svg"></a>
<a href="https://medium.com/@bobleesj"><img src="https://img.shields.io/badge/Medium-Read-00AB6C.svg"/></a>
</p>

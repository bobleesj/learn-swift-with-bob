# Trailing Closures

## Introduction
Welcome to Lesson 3 of The UIKIt Fundamentals Part 1 Intro to Functional Programming. Today, we are going to learn how to make your closure block readable to your eyes when you try to use it as a parameter/argument. It's quite hard to describe in words. So, let's just dive into it.

## Problem
A closure is too long to pass through a function

### Design Function
```swift
func trailingClosure(number: Int, closure: () -> Void) {
  print("You've entered \(number)")
  closure()
}
```

### Design Closure Block
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
```swift
trailingClosure(number: 100, closure: helloFunc)
trailingClosure(number: 100, closure: helloClosure)

trailingClosure(number: 100, closure: { print("Hello!!!") })
trailingClosure(number: 100) { print("Hello!!!!!") }
```

When there is a closure block at the end of parameter, you may use `trailing closures`.

### Another Example
```swift
func trailingClosures(number: Int, closure: (Int) -> Int) {
  let newNumber = closure(number)
  print(newNumber)
}

trailingClosures(number: 1000, closure: { number in number * number })

trailingClosures(number: 500) { number in number * number }
trailingClosures(number: 400) { $0 * $0 }
```






### Source Code
### Resources
[3005_trailing_closures.playground](https://www.dropbox.com/sh/ahn75farmnscvxy/AADFWLKiwFwJoyMjd2dTFbwCa?dl=0)


## Conclusion
Boom! That's it. You've learned how to make the last part of the closure parameter readable by using trailing closure which allows you have fewer brackets throughout which is super important for readability. In the next learn, how we use trailing closures to completion handler block which is the most important concept in this chapter. Let's dive into it. Look, if you are still struggling, it's your job. Google and practice your own to figure out what the heck is closures. You can not skip this. Learning closures is important for animation, networking with the server, and so on. Hustle my friends.

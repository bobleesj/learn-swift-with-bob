# Trailing Closures

## Introduction
Welcome to Lesson 3 of The UIKIt Fundamentals Part 1 Intro to Functional Programming. Today, we are going to learn how to make your closure block readable to your eyes when you try to use it as a parameter/argument. It's quite hard to describe in words. So, let's just dive into it.

## Problem
A closure is too long to pass through a function

### Trailing Closure
Create a function that contains a closure block as the last parameter
```swift
func trailingClosure(number: Int, closure: (String) -> String) {
}
```
You may insert a closure right inside.
```swift
trailingClosure(number: 123, closure: { word in word })
```

If the last parameter is a closure block,

```swift
trailingClosure(number: 123) { word in word }
```

Here is another example.
```swift
func trailingClosures(closure: (Int) -> Int) { }
```

Without trailing closure
```swift
trailingClosures(closure: { number in number })
```

With trailing closures
```swift
trailingClosures() { number in number }
trailingClosures() { $0 }
```

### Source Code
### Resources
[3005_trailing_closures.playground](https://www.dropbox.com/sh/ahn75farmnscvxy/AADFWLKiwFwJoyMjd2dTFbwCa?dl=0)


## Conclusion
Boom! That's it. You've learned how to make the last part of the closure parameter readable by using trailing closure which allows you have fewer brackets throughout which is super important for readability. In the next learn, how we use trailing closures to completion handler block which is the most important concept in this chapter. Let's dive into it. Look, if you are still struggling, it's your job. Google and practice your own to figure out what the heck is closures. You can not skip this. Learning closures is important for animation, networking with the server, and so on. Hustle my friends.

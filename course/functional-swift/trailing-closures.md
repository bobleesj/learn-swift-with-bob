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
[1303_Trailing Closures](https://www.dropbox.com/sh/npx0qq1tpwo2253/AAD1UiAnjX0Olgud9VkTi5hYa?dl=0)


## Conclusion
Boom! That's it. You've learned how to make the last part of the closure parameter readable by using trailing closure which allows you have fewer brackets throughout which is super important for readability. In the next learn, how we use trailing closures to completion handler block which is the most important concept in this chapter. Let's dive into it. Look, if you are still struggling, it's your job. Google and practice your own to figure out what the heck is closures. You can not skip this. Learning closures is important for animation, networking with the server, and so on. Hussle my friends.

#### Stay Connected
If you'd like to be on my mailing list and receive personal updates on upcoming books and courses, feel free to send me an email at `bobleesj@gmail.com`
<p>
<a href="http://bobthedeveloper.io"><img src="https://img.shields.io/badge/Personal-Website-333333.svg"></a>
<a href="https://facebook.com/bobthedeveloper"><img src="https://img.shields.io/badge/Facebook-Like-3B5998.svg"></a> <a href="https://youtube.com/bobthedeveloper"><img src="https://img.shields.io/badge/YouTube-Subscribe-CE1312.svg"</a> <a href="https://twitter.com/bobleesj"><img src="https://img.shields.io/badge/Twitter-Follow-55ACEE.svg"></a> <a href="https://instagram.com/bobthedev
"><img src="https://img.shields.io/badge/Instagram-Follow-BB2F92.svg"></a> <a href="https://linkedin.com/in/bobleesj"><img src= "https://img.shields.io/badge/LinkedIn-Connect-0077B5.svg"></a>
<a href="https://medium.com/@bobleesj"><img src="https://img.shields.io/badge/Medium-Read-00AB6C.svg"/></a>
</p>

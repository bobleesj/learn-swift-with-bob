# Convenience Init

## Introduction
Welcome to the first lesson of The UIKit Fundamentals Part 1 Chapter 2 Advanced Object Oriented Programming. In this lesson, you will learn how to become lazy.  In other words, you learn to become smart and effective when it comes to initializing an object. In programming, getting lazy to write less code is in fact good for your teammates and users as long as it's readable. Bill Gates once mentioned, whenever there is hard work to be done, he assigns it to the laziest person as he or she is sure to find an easy way of doing it. So, let's get started.

## Problem
I'm lazy. Can we initialize quickly?

### Create Class with Designated Init
Create a class called `Human`
```swift
class Human {
 var name: String

 init(name: String) {
   self.name = name
 }

 init(_ newName: String) {
   name = newName
 }

}
 ```

### Convenience Init
Convenience init initializes the designated init method by calling `self.init`.
```swift
class Human {
  var name: String

  init(name: String) {
    self.name = name
  }

  init(_ newName: String) {
    name = newName
  }

 convenience init() {
   self.init(name: "Bob")
 }

 convenience init(enterNumber: Int) {
   self.init(name: String(enterNumber))
 }

}
```

### Create Objects
```swift
let ben = Human("Hi")  // init(_ newName: String)
let leob = Human()  // convenience init()
let bob = Human(name: "Bob")  // init(name: String)

let rob = Human()  // Convenience Init()
rob.name  // "Bob"
```

### Initialize UIColor
Create an instance that stores `UIColor`.

```swift
import UIKit

let randomColor = UIColor(colorLiteralRed: 255/255, green: 80/255, blue: 85/255, alpha: 1)
```

#### Custom Convenience Init
Create our own convenience init that initializes the designated init by adding `extension` to `UIColor`.

```swift
extension UIColor {
 convenience init(r: Float, g: Float, b: Float) {
   self.init(colorLiteralRed: r/255, green: g/255, blue: b/255, alpha: 1)
 }
}

let randomColorWtihMe = UIColor(r: 20, g: 10, b: 50)
```

### Source Code
[2001_convenience_init.playground](https://www.dropbox.com/sh/s8huk2ugoeawb1c/AABvP4MipSe4CSypX7QEgZmZa?dl=0)

## Conclusion
You've learned how to become lazy and effective at the same time. Imagine you are creating a library for your teammates to use. They no longer have to use a designated init method to initialize an object. It's  not necessary. It's a win-win situation. In the next lesson, let's talk about how initialization may fail.

#### Stay Connected
Get to know me in-person through Instagram's story  @[bobthedev](https://instagram.com/bobthedev)

<p>
<a href="http://bobthedeveloper.io"><img src="https://img.shields.io/badge/Personal-Website-333333.svg"></a>
<a href="https://facebook.com/bobthedeveloper"><img src="https://img.shields.io/badge/Facebook-Like-3B5998.svg"></a> <a href="https://youtube.com/bobthedeveloper"><img src="https://img.shields.io/badge/YouTube-Subscribe-CE1312.svg"</a> <a href="https://twitter.com/bobleesj"><img src="https://img.shields.io/badge/Twitter-Follow-55ACEE.svg"></a> <a href="https://instagram.com/bobthedev
"><img src="https://img.shields.io/badge/Instagram-Follow-BB2F92.svg"></a> <a href="https://linkedin.com/in/bobleesj"><img src= "https://img.shields.io/badge/LinkedIn-Connect-0077B5.svg"></a>
<a href="https://medium.com/@bobleesj"><img src="https://img.shields.io/badge/Medium-Read-00AB6C.svg"/></a>
</p>

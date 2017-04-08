# Convenience Init

## Introduction
Welcome to the first lesson of Object Oriented Swift. In this lesson, you will learn how to become lazy.  In other words, you learn to become smart and effective when it comes to initializing an object. In programming, getting lazy to write less code is in fact good for your teammates and users as long as it's readable. Bill Gates once mentioned, whenever there is hard work to be done, he assigns it to the laziest person as he or she is sure to find an easy way of doing it. So, let's get started.

## Problem
I'm lazy. Can we initialize quickly?

## Create Class with Designated Init
Create a class called `Human`

```swift
class Human {
  var name: String
  init(name: String) {
    self.name = name
 }

  // Convenience init intializes the designated init method
  convenience init() {
    self.init(name: "Bob Lee")
  }
}
 ```

Convenience init initializes the designated init method by calling `self.init`.

### Create Object
```swift
let lee = Human(name: "Bob Lee") // init(name: String)
let bob = Human() // Convenience init()
```

## Initialize UIColor
Create an instance that stores `UIColor`.

```swift
import UIKit

let randomColor = UIColor(colorLiteralRed: 255/255, green: 80/255, blue: 85/255, alpha: 1)
```

## Custom Convenience Init
Create our own convenience init that initializes the designated init by adding `extension` to `UIColor`.

```swift
extension UIColor {
 convenience init(r: Float, g: Float, b: Float) {
   self.init(colorLiteralRed: r/255, green: g/255, blue: b/255, alpha: 1)
 }
}

let myFavoriteColor = UIColor(r: 255, g: 80, b: 85)
```

### Application
 1. Useful for quick initialization for open source projects
 2. Custom convenience like UIKIt

### Source Code
[2001_convenience_init.playground](https://www.dropbox.com/sh/s8huk2ugoeawb1c/AABvP4MipSe4CSypX7QEgZmZa?dl=0)

## Conclusion
You've learned how to become lazy and effective at the same time. Imagine you are creating a library for your teammates to use. They no longer have to use a designated init method to initialize an object. It's  not necessary. It's a win-win situation. In the next lesson, let's talk about how initialization may fail.

# Convenience Init

## Introduction
Welcome to the first lesson of Object Oriented Swift. You will learn how to become lazy.  In other words, you become smarter and effective when it comes to initializing an object. In programming, getting lazy to write less code is in fact good for your teammates and users as long as it's readable and gets the job done. Bill Gates once mentioned, whenever there is hard work to be done, he assigns it to the laziest person as he or she is sure to find an easy way of doing it.

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

`Convenience` init initializes the designated init method by calling `self.init`.

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
Create our own `convenience` init that initializes the designated init by adding `extension` to `UIColor`.

```swift
extension UIColor {
 convenience init(r: Float, g: Float, b: Float) {
   self.init(colorLiteralRed: r/255, green: g/255, blue: b/255, alpha: 1)
 }
}

let myFavoriteColor = UIColor(r: 255, g: 80, b: 85)
```

### Application
 1. Quick initialization for open source projects
 2. Custom `convenience` inits with `UIKit`

### Source Code
[2001_convenience_init.playground](https://www.dropbox.com/sh/gg0vl09ki85j5hz/AAAqLOU8t5tWkIcMCCVJBuAUa?dl=0)

## Conclusion
You've learned how to become lazy and effective at the same time. Imagine, you are the owner of a library for your teammates. They no longer have to use the bloated designated init method. Instead, you may provide multiple `convenience` init methods so that their lives become easier. It is similar to how the Apple engineers have provided us with convenience init methods for `UIColor`. It's a win-win situation.

In the next lesson, you will learn how to fail initializations.

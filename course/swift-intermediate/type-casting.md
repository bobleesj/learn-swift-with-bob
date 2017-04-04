# Type Casting
## Introduction
Welcome back to lesson 5 of The Swift Fundamentals with Bob. You might be tired of seeing these `!`s and `?`s since Lesson 1. But you know what, you've got to know all. It is absolutely necessary for you to distinguish their usage in every situation.

In this lesson, you are going to learn how to convert types in objects that are created with classes. If you've been programming with Storyboard in iOS, you've been using `type casting` for a while.

## Problem
  1. How do you distinguish between `as`, `as?`, `as!` ?
  2. Why does Xcode keep telling me what to do?

## Type Casting in UIKit
You've probably seen something like this.
```swift
import UIKit
let label = UILabel() as UIView
```

<img src="/course/swift-intermediate/assets/uikit-framework-hierarchy.png" alt="The UIKit framework hierarchy"/>

## Human Class
Design a class called, `Human` that contains a single method.

```swift
class Human {
  func introduce() {
    print("Hi, I'm a human")
  }
}
```

## Human Subclass
Design `Korean` and `Japanese` that inherit from the `Human` class.

```swift
class Korean: Human {
  func singGangNamStyle() {
    print("Oppa Gangnam Style")
  }
}

class Japanese: Human {
  func doNinja() {
    print("Shhh.....")
  }
}
```

Check if everything works.
```swift
let bob = Korean()
bob.introduce()
bob.singGangNamStyle()
```

## Type Casting
Now, you may want to convert `Korean` to `Human` or `Human` to `Korea`. There are two ways: upcasting and downcasting.

### Upcasting
Upcasting is all about going to its base/super class. Imagine the UIKIt class structure. If you may upcast `UILable` to `UIView`. To upcast, use `as`.

```swift
let newBob = bob as Human  // Korean -> Human
newBob.introduce()
// newBob.singGangNamStyle()
// Does not exist
```

### Upcasting Example in Swift
```swift
var name = "Bob" as Any
var number = 20 as Any
var anyArray = [name, number] // [Any]
```

### Downcasting
Downcasting is the opposite of upcasting. Downcasting may fail. As a result, you may as force downcasting or implicit downcasting.

### Force Downcasting
It does not return an optional type but if it fails, crashes as well.

```swift
// Force Downcasting
let newValue = anyArray[0] as! String
```
> Downcasting only applies when you upcast first

### Safe Downcasting
 It returns an optional type. If downcasting fails, returns `nil`.

```swift
// Implicit Downcasting (safety)
let newNewValue = anyArray[0] as? Int
```

## Type Casting in Practice
### Create Instances

```swift
let shion = Japanese()
let lee = Korean()
let kenji = Japanese()
let park = Korean()
```

### Group
Explicit upcasting
```swift
 let humans: [Human] = [shion as Human, lee as Human, kenji as Human, park as Human]
```

Upcasting inferred
```swift
let humans: [Human] = [shion, lee, kenji, park]
```

## Call Method in Element
```swift
for human in humans {
  if let korean = human as? Korean {
    korean.singGangNamStyle()
  }

  if let japanese = human as? Japanese {
    japanese.doNinja()
  }
}
```

## Usage Case in iOS Development

```swift
import UIKit

let loginButton = UIButton()
let loginMessage = UILabel()
let loginView = UIView()

let UIComponents = [loginButton, loginMessage, loginView]

for component in UIComponents {
  if let button = component as? UIButton {
    // Change background color
    // Add Title
    // ...
  }

  if let label = component as? UILabel {

  }

  if let view = component as? UIView {

  }
}
```

However, upcasting is not recommended since there is a better way to go about with Protocol Oriented Programming. You will find out more the differences soon. ˜


```swift
class MyViewController: UIViewController {  
  func introduce() {
    print(self)
  }
}
```

You probably have used `type casting` to identify your designated view controller from Storyboard.

```swift
let storyboard = UIStoryboard(name: "Main", bundle: nil)
let vc = storyboard instantiateViewController(withIdentifier: "VC") as! VC

vc.introduce
```

### Source Code
[1005_type_casting.playground]

[1005_type_casting.playground]:
https://www.dropbox.com/sh/i09nd3r1ii55deo/AABSiq-tuXxkUDn-Qrl7QL6la?dl=0

### Resources
If you are still confused with type casting, feel free to watch my YouTube video I posted earlier.

[The Complete Swift 3 Tutorials with Bob: Type Casting (YouTube)](https://www.youtube.com/watch?v=A2M5sIXFNbg&t=12s)

## Conclusion
To recap, you've learned two ways convert types. One is upcasting with `as`, which always works because you are going up to the super class and you are getting rid of properties and methods.You've also learned downcasting which converts  object to more specific types within the class hierarchy. However, as you've seen, it may work and may not work. Therefore you use either `as?`to safely convert. Lastly, you've learnde how `type casting` can be used to group objects together and apply universal attributes through a `for-in` loop. However, upcasting isn't recommended in iOS development because it's quite a bit of a headache to convert back and forth, and there is a better way to go about grouping objects together: Protocol Oriented Swift. We will learn more about it in Chapter 3.

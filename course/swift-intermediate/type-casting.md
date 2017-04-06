# Type Casting
## Introduction
Welcome to lesson 5 of The Swift Fundamentals with Bob. We've covered a number of `!`s and `?`s since Lesson 1. You've got to know all. It is absolutely necessary for you to distinguish their usage in every situation.

In this lesson, you are going to learn how to convert types in objects that are created with classes. In fact, if you've used  `Storyboard` in iOS, you've been using `type casting` for a while. Let's go.

## Problem
  1. How do you distinguish between `as`, `as?`, `as!`?
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
Design `Korean` and `Japanese` which inherit from the `Human` class.

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
Now, you may want to convert `Korean` to `Human` or `Human` to `Koream`. There are two ways: upcasting and downcasting.

### Upcasting
Upcasting is all about going up to the base/super class. In the early example you've upcasted `UILabel` to `UIView` by usin `as`.

```swift
let newBob = bob as Human  // Korean -> Human
newBob.introduce()
newBob.singGangNamStyle() // Does not exist
```

### Upcasting Example in Swift

```swift
var name = "Bob" as Any
var number = 20 as Any
var anyArray = [name, number] // [Any]
```

### Downcasting
Downcasting is the opposite of upcasting. For example, from `Any` to `String` would be downcasting. However, it may fail. As a result, there are two ways to downcast: `Force downcasting` or `Implicit Downcasting`.

### Force Downcasting
It does not return an optional type.  but if it fails, it crashes.

```swift
// Force Downcasting
let newValue = anyArray[0] as! String
let newValue = anyArray[1] as! String // Error
```
> Downcasting only applies when you upcast first


### Implicit Downcasting
 It returns an optional type. If it fails, it returns `nil`.

```swift
let newNewValue = anyArray[0] as? Int
print(newNewValue) // Optional(20)
```

## Type Casting in Practice

### Create Instances

```swift
let shion = Japanese()
let lee = Korean()
let kenji = Japanese()
let park = Korean()
```

### Create Array Using Upcasting

```swift
 let humans: [Human] = [shion as Human, lee as Human, kenji as Human, park as Human]
```

Automatic upcasting

```swift
let humans: [Human] = [shion, lee, kenji, park]
let humans = [shion, lee, kenji, park]
```

### Loop

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

## Usage in iOS Development
Typecasting can be used to group UI Components and add attributes as a whole.

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

However, upcasting is not recommended since there is a better way to go about: Protocol Oriented Programming. You will find out more the differences soon.

 If you've worked with `Storyboard`, you have used `type casting` to identify the designated view controller.

```swift
let storyboard = UIStoryboard(name: "Main", bundle: nil)
let vc = storyboard instantiateViewController(withIdentifier: "VC") as! VC
```

### Source Code
[1005_type_casting.playground](https://www.dropbox.com/sh/i09nd3r1ii55deo/AABSiq-tuXxkUDn-Qrl7QL6la?dl=0)

### Reference
[AnyObject and Any in Swift (Stack Overflow)](http://stackoverflow.com/questions/25809168/anyobject-and-any-in-swift)

## Conclusion
I lied. I said `Type Casting` is used to convert types in classes, but you may also convert `Int` and `String` to `Any` even though they are made up of structs, not classes.

Unnecessary upcasting isn't recommended among iOS developers because it's quite a bit of a headache to cast back and forth. Again, there is an alternative to go about when it comes to grouping objects together: Protocol Oriented Swift. We will learn more about it in Chapter 3.

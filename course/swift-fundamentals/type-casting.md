# Type Casting
## Introduction
Welcome to lesson 5 of The Swift Fundamentals with Bob. You've learned a number of `!` and `?` since Lesson 1. These are language features that distinguish Swift from the rest, and you've got to know all, when, where, how, and, most importantly, why.

In this lesson, you learn how to convert types in objects that are created with classes and structs. In fact, if you use `Storyboard` in iOS, you must know `type casting`.

## Problem
  1. How do you distinguish between `as`, `as?`, `as!`?
  2. Why does Xcode keep telling me what to do?

## Type Casting in UIKit
You might have seen,

```swift
import UIKit
let label = UILabel() as UIView
```
You've converted `UILabel` to `UIView`. `UILabel` is a subclass of `UIView`. Let us attempt to replicate the phenomenon with custom classes.

<img src="/course/swift-fundamentals/assets/uikit-framework-hierarchy.png" alt="The UIKit framework hierarchy"/>

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

Check if all good

```swift
let bob = Korean()
bob.introduce() // "Hi, I'm a human"
bob.singGangNamStyle() // "Oppa Gangnam Style"
```

## Type Casting
You may convert `Korean` to `Human` or vice versa. There are two ways: upcasting and downcasting.

### Upcasting
Upcasting occurs when an object converts its type to the base class. In the early above, you've upcasted `UILabel` to `UIView` using `as`.

> The word "up" aligns with the structure in the graph above.

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

> I forgot to mention that `Int` and `String` are struct types which lack base classes. However, structs may only "upcast" to `Any`.


### Downcasting
Downcasting is the opposite. You may downcast `Any` to `String`. However, it may fail since `Any` could contain many types. Analogous to `optionals`, there are two ways to downcast: **Force downcasting** or **Implicit downcasting**

### Force Downcasting
It does not return an `optional` type.  but if it fails, it crashes.

```swift
// Force Downcasting
let newValue = anyArray[0] as! String
let newValue = anyArray[1] as! String // Error
```
> Downcasting is only available only after upcasting.

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

  if let label = component as? UILabel {}
  if let view = component as? UIView {}
}
```

> **Important:** Upcasting is not a recommended practice since there is a better way to go about: Protocol Oriented Programming. I mention drawbacks of using type casting through comparison in Chapter 3 and 5.


### Another Example
To fetch a view controller from `Storyboard`, downcast to identify the designated view controller.

```swift
let storyboard = UIStoryboard(name: "Main", bundle: nil)
let vc = storyboard instantiateViewController(withIdentifier: "VC")
// type of vc = UIViewController
let vc = storyboard instantiateViewController(withIdentifier: "VC") as! VC
// type of vc = VC
```

### Source Code
[1005_type_casting.playground](https://www.dropbox.com/sh/i09nd3r1ii55deo/AABSiq-tuXxkUDn-Qrl7QL6la?dl=0)

### Reference
[AnyObject and Any in Swift (Stack Overflow)](http://stackoverflow.com/questions/25809168/anyobject-and-any-in-swift)

## Conclusion
I lied. I said type casting allowed to convert types in classes. However, you may also convert `Int` and `String` to `Any` even though they are made up of structs, not classes.

Unnecessary type casting is not recommended among iOS developers because it causes a massive headache from casting back and forth. There is an alternative to go about. You will learn how to group objects together through Protocol Oriented Swift in Chapter 3. I know you are excited. Learn fast, but stay patient and consistent.

In the next lesson, you will learn how to design reusable code through `generics`. You will come out dry, not wet, a.k.a we enjoy typing.  

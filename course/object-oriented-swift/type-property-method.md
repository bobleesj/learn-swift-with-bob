# Type Property and Method

## Introduction
Welcome to Lesson 7 of Object Oriented Swift. You are going to learn one of the most useful, yet confusing topics.

## Problem
 I'm confused by `static`, `final`, `class`. What are those?

## Static Property and Method
No longer have to initialize an object to access properties and methods. Let us design a struct that contains a type property and a type method.

### Design Struct

```swift
struct SomeStructure {
  static var storedTypeProperty = "Some value."
  static var computedProperty: Int {
    get {
      return 120
    }
    set {
      print("You've set to \(newValue)")
    }
  }
  static func hello() {
    print("hello")
  }
}
```

Access the properties and methods

```swift
SomeStructure.storedTypeProperty // "Some Value"
SomeStructure.hello() // 'hello"'
```

> Anything that has `static` in front will not be overridden.

## Class
Unlike `static`, `class` is only used within Classes. On the other hand, classes also support `static`.

> Unlike `static`, `class` properties may be overridden.

### Design Class
Create a class called `GrandParent`.

```swift
class GrandParent {
  static var numberOfYearsInMarriage = 30
  static func introduce() {
    print("We've been married for \(numberOfYearsInMarriage)")
 }

  class func introducing() {
    print("We've been married for \(numberOfYearsInMarriage)")
  }

  final func cantOverride() {
    print("you can't change me")
  }
}
```

### Design Subclass
Now, create `Parent` class that inherits `GrandParent`.  You may override `class func introducing()`, but you may not override `final func cantOverride()`. `final` prevents Classes from overriding.

```swift
class Parent: GrandParent {
  override class func introducing() {
    print("I'm married for 5 years")
  }
//  override static func introduce() {
//    print("I'm married for 5 years")
//  }
}

Parent.introducing() // "I'm married for 5 years"
```


### Practical Usage
You may store a list of items.

```swift
class BluetoothID {
 struct iPhone {
   static let iPhone4 = "4234-1232-1232-5465"
   static let iPhone5 = "7867-5676-4535-1235"
   static let iPhone6 = "3938-6738-1424-9876"
   static let iPhone7 = "4845-3148-1237-1296"
   static let iPhone8 = "7967-8123-7892-4563"
 }
}
```

```swift
BluetoothID.iPhone.iPhone8 // "4234-1232-1232-5465"
BluetoothID.iPhone.iPhone8 // ""7967-8123-7892-4563"
```

### Alternative

You may also use `enum`.
```swift
enum AirDropID: String {
 case iPhone4 = "4234-1232-1232-5465"
 case iPhone5 = "7867-5676-4535-1235"
 case iPhone6 = "3938-6738-1424-9876"
 case iPhone7 = "4845-3148-1237-1296"
 case iPhone8 = "7967-8123-7892-4563"
}

AirDropID.iPhone8.rawValue // "7967-8123-7892-4563"
```

### Source Code
[2007_type_property.playground](https://www.dropbox.com/sh/y4cqhy4v912e01a/AABxIMrWsWch3h3C693Q2gWAa?dl=0)


## Conclusion
You've learned how to access properties and methods without creating an object. When you work structs, you may only have `static` type. When you work classes, however, you may have `static` and `class` type. If you wish to prevent any property from being overridden, you may use the `final` keyword.

When you start taking The UIKit Fundamentals with Bob, you will discover the beauty of static methods and properties.

In the following lesson, you will learn how to create the only object that exists everywhere.


> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

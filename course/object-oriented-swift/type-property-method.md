# Type Property

## Introduction
Welcome to Lesson 7, the last lesson of The UIKIt Fundamentals with Bob, Part 1 Object Oriented Programming. Today, you are going to learn one of the most confusing topics when it comes to Object Oriented Programming. It's type methods and properties. If you aren't familiar with those, don't you worry. Right now, you may feel confused, but you will come out strong, confident, and pumped. You will be excited to apply what you will learn today in your code later. Enough of talking. Let's go!

## Problem
I don't know when to use `static`, `final`, `class`. What are those?

### Static Property and Method
Anything that has `static` in front will not be overridden. In fact, `static` is the only type property and method used within `struct` since it does not provide inheritance.

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

Access properties and methods
```swift
SomeStructure.storedTypeProperty // "Some Value"
SomeStructure.hello() // 'hello"'
```

### Class
Unlike `static`, `class` is only used within Classes. But, Classes also support `static`. `class` properties and types may be overridden.

#### Design Class
Create a class called `GrandParent`. It contains one static property and one static method. It also contains a normal method and another method with `final` attached.

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

#### Design Subclass
Now, create `Parent` class that inherits `GrandParent`.  You may override `func sayHi()`, but you may not override `final func sayHello()`. `final` prevents Classes from overriding. It's similar to `static`.

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
You may store a list of items using the follow way below.

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

You may also use `enum`. but I prefer the method above since I do n't have to call `rawValue`.


### Alternative
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

### Resources
### Source Code
[2007_type_property.playground](https://www.dropbox.com/sh/vkvljugb258t153/AAB2WsksH_AkczcD8kdt5x3ha?dl=0)


## Conclusion

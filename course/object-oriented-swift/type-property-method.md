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

Access properties
```swift
SomeStructure.computedProperty = 150
SomeStructure.computedProperty = 24234
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

 func sayHi() {
   print("What's popping?")
 }

 final func sayHello() {
   print("What Up?")
 }

}
```

#### Design Subclass
Now, create `Parent` class that inherits `GrandParent`.  You may override `func sayHi()`, but you may not override `final func sayHello()`. `final` prevents Classes from overriding. It's similar to `static`.

```swift
class Parent: GrandParent {
 override func sayHi() {
   super.sayHi()
   print("I'm a parent")
 }

//  override func sayHello() {
//    print("What Up?")
//  }
// Error

}

```

#### Access Type Property and Method
Now, let us grab `numberOfYearsInMarriage` and `introduction`

```swift
Parent.numberOfYearsInMarriage // 30
Parent.introduce()
Parent().sayHi()  // Good
Parent().sayHello() // Good
```

### Design Class
Create a class called, `Human` that contains two type properties.

```swift
class Human {
 static var legs = 2

 // class var name = "Bob"
 // Error: Stored property not valid for class var

 class var myName: String {
   return "Human"
 }

}
```
### Design Subclass
> Again, subclasses can override class methods/properties, but cannot override static methods and properties.

Create a class called, `Bob` that inherits `Human`. Attempt to override `myName` class type property.

```swift
class Bob: Human {
 override class var myName: String {
   return "My name is Bob"
 }
}
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
BluetoothID.iPhone.iPhone8
```

You may also use `enum`. but I prefer the method above since I do n't have to call `rawValue`.

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
Remember a couple things. First, if you use `final` or `static`, that means you may inherit, but you can not override. Second, when you are using `class property`, you have to use computed property for some reason I couldn't find out. Right now, you are learning how each organ works one by one. You are learning about the stomach, the larges intestines, and on on. Later in Part 2 and Part 3, you will learn how those organs form the entire digestive system, also known as the iOS platform.


#### Stay Connected
If you'd like to be on my mailing list and receive personal updates on upcoming books and courses, feel free to send me an email at `bobleesj@gmail.com`
<p>
<a href="http://bobthedeveloper.io"><img src="https://img.shields.io/badge/Personal-Website-333333.svg"></a>
<a href="https://facebook.com/bobthedeveloper"><img src="https://img.shields.io/badge/Facebook-Like-3B5998.svg"></a> <a href="https://youtube.com/bobthedeveloper"><img src="https://img.shields.io/badge/YouTube-Subscribe-CE1312.svg"</a> <a href="https://twitter.com/bobleesj"><img src="https://img.shields.io/badge/Twitter-Follow-55ACEE.svg"></a> <a href="https://instagram.com/bobthedev
"><img src="https://img.shields.io/badge/Instagram-Follow-BB2F92.svg"></a> <a href="https://linkedin.com/in/bobleesj"><img src= "https://img.shields.io/badge/LinkedIn-Connect-0077B5.svg"></a>
<a href="https://medium.com/@bobleesj"><img src="https://img.shields.io/badge/Medium-Read-00AB6C.svg"/></a>
</p>

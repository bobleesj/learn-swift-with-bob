# Override Init

## Introduction
Welcome to Lesson 4 of The UIKIt Fundamentals Part 1 Object Oriented Programming. In this lesson, you are going to learn what it means by the word `super`. A lot of beginners often have no clue but copy because they have seen on StackOver Flow or tutorials. Today, we are going to dive in what's really going on. There are a lot of examples, so let's get started.

## Problem
Problem: Super... Super.init?

### UIViewController
You might have seen something like this below. Many wonder what `super` and `override` stand for. Let us find out.

```swift
import UIKit

class MyViewController: UIViewController {
 override func viewDidLoad() {
   super.viewDidLoad()
   print("Hello")
 }
}
```

### Create Vehicle Class
Create a class called `Vehicle`. It contains one gettable property and one method.

```swift
class Vehicle {

 var description: String {
   return "Hello, I'm moving at 30km/hr"
 }

 func warning() {
   print("Be careful, I'm going pretty fast")
 }

}
```

### Subclass
You may customize inherited properties and methods by inserting `override`.  You may access inherited properties and methods by calling `super`.

```swift
class ToyCar: Vehicle {

 let price = "$100"

 override var description: String {
   return "\(super.description), I'm \(price)"
 }

 override func warning() {
   super.warning() // "Be careful, I'm going pretty fast"
   print("Let me just tell you, I'm not dangerous much")
 }

}
```

#### Subclass Object
Create an object to check if the methods and properties have been overridden in the subclass,`ToyCar`.

```swift
let myCar = ToyCar()
myCar.description
myCar.warning()
```

### Super Init
You may override init from super class. However, the number one rule is: you must put associated value to every property even from the super class.

#### Design Super Class
Create a class that contain one property called, `origin`.

```swift
class Human {
 var origin: String

 init(enterOrgin: String) {
   origin = enterOrgin
 }
}
```
#### Design Subclass
Create a subclass, called `Korean` that inherits from `Human`. The `Korean` class contains a property called, `name`.  However, when you initialize, you must initialize the `origin` property from the `Human` class by calling `super.init`.

```swift
class Korean: Human {

 let name: String

 // Init Method #1
 init(enterName: String) {
   name = enterName
   super.init(enterOrgin: "Bob the Developer")
 }

 // Init Method #2
 init(enterName: String, myOrigin: String) {
   name = enterName
   super.init(enterOrgin: myOrigin)
 }

}
```
#### Create Object
There are two init methods in the `Korean` class. You may choose any since both initialize the `origin` property from the `Human` class.

```swift
let bob = Korean(enterName: "Bob the Dev")
let bobby = Korean(enterName: "Bob the Dev", myOrigin: "Korean")
```

### Override Init
Similar to how you may override a method and property, you may include additional lines of code by overriding the init method.

#### Design Base Class
Design a class called, `Tesla`. It contains a property called, `numberOfWheels`.

```swift
class Tesla {
 var numberOfWheels: Int

 init(enterWheelNumber: Int) {
   numberOfWheels = enterWheelNumber
 }
}
```
#### Override Init
You may override the init method in the `Tesla` class. Let us add a print statement when you call the init method.

```swift
class ModelS: Tesla {
 override init(enterWheelNumber: Int) {
   super.init(enterWheelNumber: 500)  // Calling the init method
   print("Yo, I've cerated this object bruh")
 }
}

let myFutureSexyCar = ModelS(enterWheelNumber: 500)
// print("Yo, I've cerated this object bruh")

myFutureSexyCar.numberOfWheels // 500
```

### Source Code
[1204_Override Init/Method](https://www.dropbox.com/sh/4jl0hxqy7m3i4zx/AAC_q3xyS0iKVsxn4NXr0INga?dl=0)



## Conclusion
Now, you understand what goes under when you see or type phrases such as `super.init`, `super.viewDidLoad`, and `override`. If you have not been confident with OOP, this lesson could have been tough for you. So, make sure review if necessary.

#### Stay Connected
If you'd like to be on my mailing list and receive personal updates on upcoming books and courses, feel free to send me an email at `bobleesj@gmail.com`
<p>
<a href="http://bobthedeveloper.io"><img src="https://img.shields.io/badge/Personal-Website-333333.svg"></a>
<a href="https://facebook.com/bobthedeveloper"><img src="https://img.shields.io/badge/Facebook-Like-3B5998.svg"></a> <a href="https://youtube.com/bobthedeveloper"><img src="https://img.shields.io/badge/YouTube-Subscribe-CE1312.svg"</a> <a href="https://twitter.com/bobleesj"><img src="https://img.shields.io/badge/Twitter-Follow-55ACEE.svg"></a> <a href="https://instagram.com/bobthedev
"><img src="https://img.shields.io/badge/Instagram-Follow-BB2F92.svg"></a> <a href="https://linkedin.com/in/bobleesj"><img src= "https://img.shields.io/badge/LinkedIn-Connect-0077B5.svg"></a>
<a href="https://medium.com/@bobleesj"><img src="https://img.shields.io/badge/Medium-Read-00AB6C.svg"/></a>
</p>

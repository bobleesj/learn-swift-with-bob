# Override Init

## Introduction
In this lesson, you are going to learn what it means by the word `super`. A lot of beginners often have no clue but copy because they have seen on StackOver Flow or tutorials. Today, we are going to dive in what's really going on. There are a lot of examples, so let's get started.

## Problem
Problem: Super... Super.init?

### UIViewController
You might have seen something like this below. Many wonder what `super` and `override` stand for. Let us find out.

```swift
import UIKit

class MyViewController: UIViewController {
  // viewDidLoad() is built-in and it runs automatically
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

### Override Method and Property
```swift
class ToyCar: Vehicle {
  override var description: String {
    return "\(super.description) hey, I'm a cute car"
  }

  override func warning() {
    print("hello, don't mind me")
    super.warning()
  }
}

let myFutureCar = ToyCar()
myFutureCar.description
myFutureCar.warning()
```

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
let myFutureCar = ToyCar()

myFutureCar.description
// "Hello, I'm moving at 30km/hr, I'm a cute car"
myFutureCar.warning()
// "hello, dont' mind me"
// "Be careful, I'm going pretty fast"
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
  let city: String

  init(enterCity: String) {
    self.city = enterCity
    super.init(enterOrgin: "Korean")
  }

  init(enterCity: String, origin: String) {
    self.city = enterCity
    super.init(enterOrgin: origin)
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

class ModelS: Tesla {
  override init(enterWheelNumber: Int) {
    super.init(enterWheelNumber: enterWheelNumber)
    print("Wow, you've got a nice car")
  }
}

ModelS(enterWheelNumber: 50) // Wow, you've got a nice car
```

### Source Code
[2005_override_init_method_property.playground](https://www.dropbox.com/sh/ij2zoiv26j2oriq/AAB--yW4-5OLaZNSPYjYAROOa?dl=0)


## Conclusion
Now, you understand what goes under when you see or type phrases such as `super.init`, `super.viewDidLoad`, and `override`. If you have not been confident with OOP, this lesson could have been tough for you. So, make sure review if necessary.

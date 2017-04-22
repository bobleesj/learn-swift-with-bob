# Override Everything

## Introduction
Welcome to Lesson 5 of Object Oriented Swift. You will master the word `super` and `override`. A lot of beginners  have no clue because they simply copy from StackOver Flow and shallow tutorials. I was one of them. That's no longer acceptable from now on.

## Problem
Problem: Super... Super.init?

### Example from UIViewController
You might have seen something like this below.

```swift
import UIKit

class MyViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    print("Hello")
  }
}
```

> **Important:** The viewDidLoad() method runs automatically by the `UIViewController` class.

Many wonder what `super` and `override` stand for. Let us find out.

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
Create a class called, `ToyCar`, and inherit `Vehicle`. You may customize inherited properties and methods by inserting `override`.  You may access inherited properties and methods by calling `super`.

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
```

Now, let us access the `description` property and the `warning` method of `ToyCar`.

```swift
let myFutureCar = ToyCar()
myFutureCar.description
// "Hello, I'm moving at 30km/hr hey I'm a cute car"
myFutureCar.warning()
// "hello, don't mind me"
// "Be careful, I'm going pretty fast"
```

## Super Init
You may override an init method from the super class. Remember, every property must be initialized even the ones from the super class.

### Design Super Class
Create a class that contain a property called, `origin`.

```swift
class Human {
 var origin: String

 init(enterOrgin: String) {
   origin = enterOrgin
 }
}
```

### Design Subclass
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
### Create Object
There are two init methods in the `Korean` class. You may choose any since both initialize the `origin` property from the `Human` class.

```swift
let bob = Korean(enterName: "Bob the Dev")
let bobby = Korean(enterName: "Bob the Dev", myOrigin: "Korean")
```

## Override Init
Not only you may override methods and properties, but also init methods.

### Design Base Class
Design a class called, `Tesla`. It contains a property called, `numberOfWheels`.

```swift
class Tesla {
  var numberOfWheels: Int

  init(enterWheelNumber: Int) {
    numberOfWheels = enterWheelNumber
  }
}
```

### Design SubClass
Design a called, `ModelS` that inherits `Tesla`. Add the `override` keyword in front of the init method and call `super.init` to initialize the property from the `Tesla` class. Once you initialize the property, you may add additional lines of code for customization.

```swift
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
From now on, you no longer have to fear `super.init`, `super.viewDidLoad`, and `override`. If you feel stuck, I recommend you to watch the lecture multiple times and then ask questions if necessary. You've got to understand every piece of information from here. If not, you will suffer. A lot.

In the following lesson, you will learn how one init method can initialize the other.

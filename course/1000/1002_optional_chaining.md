# Optionals Chainings

## Introduction
Welcome to Lesson 2 of Part 1 the Swift Fundamentals with me. Just to recap, in our previous lesson, you've learned why we optionals, and there were two ways to unwrap.

But, have you ever wondered why `?` and `!` automatically appear when you randomly try to get  properties and methods of an object? If you haven't, that's okay. You will find out. The goal is to prevent you from guessing and checking. Let's dig in what's really going under the hood. We shall begin.

## Problem
Why do I see "?" and "!" when accessing methods and properties?


### Optional Chaining in UIKit
You might have seen something like this.
```swift
import UIKit
let label = UILabel().highlightedTextColor?.cgColor
```
A mysterious `?` appears all of a sudden.

### Design Human
Create a class called `Human` that contains one property and method.

```swift
class Human {
  var name: String
  init(name: String) {
    self.name = name
  }

  func sayHello() {
    print("Hello")
  }
}
```
Create an instance called `bob`.

```swift
let bob = Human(name: "Bob")
bob.name
bob.sayHello()
```

### Design Apartment
Create `Apartment` class that contains a property whose type is `Human?`.
```swift
class Apartment {
  var human: Human?
}
```

#### Initialize Property
Create an instance of `Apartment` and assign its `human` property whose type is optional.

```swift
var seoulApartment = Apartment()
seoulApartment.human = Human(name: "Bobby")
```

#### Call Property and Method
Now, try to grab the `human` property of `seoulApartment`. Since the type of `human` is optional, `?` gets added automatically.
```swift
var myName = seoulApartment.human?.name // Always return an optional since human is optional.
```
`myName` is an optional type. Therefore, unwrapping is needed.
```
if let name = myName {
  print(name)
}
```

### Source Code

### Resources


## Conclusion
Now, you no longer have to guess when to use `?` and `!` when you are working with objects such as UIKit. Please remember that if you see any `?`, it will return an optional type. So make sure unwrap implicitly. If you have any questions, make sure check out resources above.

In our next lesson, you are learn how to use a `guard` statement to implicitly unwrap and why you use it in the first place instead of using `if let`.

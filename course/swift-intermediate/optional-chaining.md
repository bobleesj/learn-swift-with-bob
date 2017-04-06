# Optionals Chainings

## Introduction
Welcome to Lesson 2 of The Swift Fundamentals. In the previous lesson, you've learned why we use optionals and the two ways to unwrap/convert.

However, have you wondered why `?` and `!` automatically appear when you try to get properties and methods of an object? If you haven't, that's okay. You will find out. The goal is to prevent you from guessing. Let us find out what goes under the hood.

## Problem
Why do I see "?" and "!" when accessing methods and properties?

## Optional Chaining in UIKit
You might have seen something like this,
```swift
import UIKit
let label = UILabel().highlightedTextColor?.cgColor
```
The mysterious `?` appears all of a sudden.

## Design Human
Create a class called `Human` that contains a property, `name` and a method, `sayHello()`.

```swift
class Human {
  var name: String
  init(name: String) {
    self.name = name
  }

  func sayHello() {
    print("Hello, I'm \(name)")
  }
}
```

## Design Apartment
Create `Apartment` class that contains a property whose type is `Human?`.
```swift
class Apartment {
  var human: Human?
}
```

### Initialize Property
Create an instance of `Apartment` and assign its `human` property whose type is optional.

```swift
var seoulApartment = Apartment()
seoulApartment.human = Human(name: "Bobby")
```

### Call Property and Method
Now, try to grab the `human` property of `seoulApartment`. Since the type of `human` is optional, `?` gets added automatically.

> **Rules:** When you attempt to access a property whose type is optional, Swift will add `?`. Anything that comes after the `?` will be optional.

```swift
var myName = seoulApartment.human?.name // Always return an optional since human is optional.
```

`myName` is an optional type. Therefore, unwrapping is needed.

```
if let name = myName {
  print(name)
}
```

### Force Unwrap
You may force unwrap, and it will return a normal type. However, there is no property intialized, it will crash.
```swift
var NYCApartment = Apartment()
let NYCResident = NYCApartment.human!.name // Error: No value for human
```

### Source Code
[1002_optional_chainings.playground](https://www.dropbox.com/sh/t809vje5icodnvz/AACWWIxjan6RlEfvgCuT87uVa?dl=0)

### Resources
[My Favorite Xcode Shortcuts](https://blog.bobthedeveloper.io/bobs-favorite-xcode-8-shortcuts-part-1-3-36381e07284d)

## Conclusion
Now, you no longer have to guess when to use `?` and `!`. It should be particularly useful when you work with the UIKit objects. But, make sure safely unwrap.

In the next lesson, you are learn how to use a `guard` statement to implicitly unwrap multiple optionals, and why you use it instead of using a classic `if let` statement.

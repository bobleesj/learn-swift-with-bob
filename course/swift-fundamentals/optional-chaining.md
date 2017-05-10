# Optionals Chainings

## Introduction
Welcome to Lesson 2 of The Swift Fundamentals. In the previous lesson, you've learned why we use `optionals` and how to convert them to normal types.

However, you might have wondered why `?` and `!` automatically appear when you access properties and methods of an object. If you haven't, that's okay. The goal is to prevent you from guessing. Let us find out what goes under the hood

## Problem
Why do I see `?` and `!` when accessing methods and properties?

## Optional Chaining in UIKit
You might have seen,  

```swift
import UIKit
let label = UILabel().highlightedTextColor?.cgColor
```
The mysterious `?` appears all of a sudden. Let us attempt to replicate the phenomenon.

## Design Human
Create a class, `Human`, which contains a `String` property, `name` and a method, `sayHello()`.

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
Create a class, `Apartment`, which contains a property whose type is `Human?`.

```swift
class Apartment {
  var human: Human?
}
```

### Initialize Property
Create an instance of `Apartment` and assign its `human` property.

```swift
var seoulApartment = Apartment()
seoulApartment.human = Human(name: "Bobby")
```

### Call Property and Method
Now, try to grab the `human` property of `seoulApartment`. Since the type of `human` is optional, `?` gets added automatically.

> **Rules:** When you access a property whose type is `optional`, Swift will add `?`. Anything that comes after the `?` will be `optional`.

<br>

```swift
var myName = seoulApartment.human?.name // Always return an `optional` type since human is `optional`.
```

`myName` is an `optional` type. Therefore, unwrapping is needed.

```
if let name = myName {
  print(name)
}
```

### Force Unwrap
You may force unwrap while optional chaining. However, if the property is not initialized, it will crash.

```swift
var NYCApartment = Apartment()
let NYCResident = NYCApartment.human!.name // Error: No value for human
```

### Source Code
[1002_optional_chainings.playground](https://www.dropbox.com/sh/t809vje5icodnvz/AACWWIxjan6RlEfvgCuT87uVa?dl=0)

### Resources
My Favorite Xcode Shortcuts [Part 1], [Part 2], [Part 3]

[Part 1]: https://blog.bobthedeveloper.io/bobs-favorite-xcode-8-shortcuts-part-1-3-36381e07284d

[Part 2]: https://blog.bobthedeveloper.io/bobs-favorite-xcode-shortcuts-part-2-3-c076e506cd20

[Part 3]: https://blog.bobthedeveloper.io/bobs-favorite-xcode-8-shortcuts-part-3-3-afd2bf590442

## Conclusion
You've learned `optional chaingins` provide shortcuts to nested properties and methods among classes and structs. However, `?` automatically appears when you access a property whose type is `optional` to indicate that anything that comes after may contain no value since the `optional` property may be `nil`.

In the next lesson, you will learn how to use a `guard` statement to implicitly unwrap multiple `optionals` instead of classic `if let` statements.

Again, if you wish to increase your coding productivity, feel free to check my articles posted.

> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

# Protocol as Type

## Introduction
Welcome to Lesson 3 of The UIKIt Fundamentals Part 1 Intro to Protocol Oriented Programming. You should be guilty if you haven't thought about how POP can be applied in your future app. If you are just consuming without thinking. You are a zombie. You are passive. You are not going to learn. Stop being passive. Think. Well, let's learn more about Protocol Oriented Programming. You will be awed.

## Problem
No more type casting

Create a protocol called, `EastAsianable`. It contains two properties.

## Design Protocol
```swift
protocol EastAsianable {
  var useChopstics: Bool { get }
  var origin: String { get }
}
```

Create an extension to `EastAsianable` that sets `useChopstic` to `true`.

## Extend Protocol
```swift
extension EastAsianable {
  // Extension may not contain stored properties
  var useChopstics: Bool {
    return true
  }
}
```

## Create Blueprints
Create `Korean`, `Japanese`, and `Chinese` that conforms to `EastAsianable`.
```swift
struct Korean: EastAsianable {
  var origin: String = "Korea"
}


class Japanese: EastAsianable {
  var origin: String = "Japan"
}

struct Chinese: EastAsianable {
  var origin: String = "China"
}
```

### Protocol as Type
Just like you may group into an array using `[String]` and `[Int]`, you may group elements that conform to the same protocol.

```swift
let eastAsians: [EastAsianable] = [Korean(), Japanese(), Chinese()]
```

Since every element that conforms to `EastAsianable` contains `origin`, you may loop through the element.

```swift
for eastAsian in eastAsians {
  print("I'm from \(eastAsian.origin)")
}
```

### Practical Examples
Practical Examples: You may combine UILabel, UIImageView, loop through to change colors, animation, and so on. Use your imagination.

### Protocol Met Generics
Create a protocol called, `Sleekable` that contain a property.
```swift
protocol Sleekable {
var price: String { get }
}
```

Create `Diamond`, `Ruby`, and `Glass` that conform to `Sleekable`.

```swift
struct Diamond: Sleekable {
var price: String = "Very High"
}

struct Ruby: Sleekable {
var price: String = "High"
}

class Glass: Sleekable {
var price: String = "Dirt Cheap"
}
```

Create a generic function that only takes a parameter whose type must conform to `Sleekable`.
```swift
func stateThePrice<T: Sleekable>(enterGem: T) {
  print("I'm expensive. In fact, I'm \(enterGem.price)")
}

stateThePrice(enterGem: Ruby())
// "I'm expensive. In fact, I'm Dirt Cheap"
```

### Source Code
[4003_protocol_type.playground](https://www.dropbox.com/sh/vvy34bgbyio7k4p/AADYOs3OUaU38RSdN4HaG4OWa?dl=0)


### Resources
[Intro to Protocol Oriented Programming  (Blog)](https://medium.com/ios-geek-community/introduction-to-protocol-oriented-programming-in-swift-b358fe4974f#.cwpeva7h8)


## Conclusion

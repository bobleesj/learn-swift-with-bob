# Protocol as Type

## Introduction
Welcome to Lesson 3 of Protocol Oriented Swift. In this lesson, you will learn how to group objects together through `protocols`.

## Problem
No more type casting

## Design Protocol
Create a protocol called, `EastAsianable`. It contains two properties.

```swift
protocol EastAsianable {
  var useChopstics: Bool { get }
  var origin: String { get }
}
```

## Extend Protocol
Create an extension to `EastAsianable` that sets `useChopstic` as `true`

```swift
extension EastAsianable {
  // Extension may not contain stored properties
  var useChopstics: Bool {
    return true
  }
}
```

## Create Blueprints
Create structs of `Korean`, `Japanese`, and `Chinese` that conform to `EastAsianable`.

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
you may group elements that conform to the `EastAsianable` protocol.

```swift
let eastAsians: [EastAsianable] = [Korean(), Japanese(), Chinese()]
```
The type of the array is `[EastAsianable]`.

Since every element that conforms to `EastAsianable` contains `origin`, you may loop through array.

```swift
for eastAsian in eastAsians {
  print("I'm from \(eastAsian.origin)")
}
```

### Practical Examples
You may combine UILabel, UIImageView, loop through to change colors, animation. Use your imagination.

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
```

The `stateThePrice` function only accepts objects that conform to `Sleekable`.
```swift
stateThePrice(enterGem: Ruby())
// "I'm expensive. In fact, I'm Dirt Cheap"
```

### Source Code
[4003_protocol_type.playground](https://www.dropbox.com/sh/z5o36isv7jvzsfo/AACIeaZ34TreiJ67IOOeB3CGa?dl=0)

### Resources
[Intro to Protocol Oriented Programming](https://medium.com/ios-geek-community/introduction-to-protocol-oriented-programming-in-swift-b358fe4974f#.cwpeva7h8)


## Conclusion
You've learned how to combine objects created with structs and classes into a single array without type casting. It works because a protocol is used as a type. A true magic.

In the following lesson, you will learn how to pass data between classes using `delegate`.

> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

# Equatable and Comparable Protocol

## Introduction
Welcome to Lesson 4 of Advanced Swift. Since Chapter 4, you've learned practical aspects of using protocols along with associated types and extensions. However, you haven't looked into how native types such as `String`, `Int` conform to default protocols pre-designed by Swift engineers.

## Problem
Understand, "Swift is a protocol oriented language"

## Equatable
`String`, `Int`, `Double`, and other native types conform to `Equatable`. Any type conforms to `Equatable` has a required method below.

```swift
func ==(lhs: Self, rhs: Self) -> Bool
```

### Custom Struct
Let us create a struct, `Blog` and conforms to `Equatable`.

```swift
struct Blog {
  let author: String
  let title: String
}

extension Blog: Equatable {
  static func ==(lhs: Blog, rhs: Blog) -> Bool {
    return lhs.author == rhs.author && lhs.title == rhs.title
  }
}
```
Blog objects have the `==` infix operator.

```swift
let firstArticle = Blog(author: "Bob Lee", title: "Protocol AssociatedType")
let secondArticle = Blog(author: "Bob Lee", title: "Type Eraser")

firstArticle == secondArticle // false
```

### Custom Tuple
Let us create another struct called `GridPoint`.

```swift
struct GridPoint {
  var grid: (Int, Int)
  init(_ numberOne: Int, _ numberTwo: Int) {
    grid = (numberOne, numberTwo)
  }
}
```

Let `GridPoint` conforms to `Equatable`.
```swift
extension GridPoint: Equatable {
  static func ==(lhs: GridPoint, rhs: GridPoint) -> Bool {
   return lhs.grid.0 == rhs.grid.0 && lhs.grid.1 == rhs.grid.1
  }
}
```

Let us check.

```swift
let pointOne = GridPoint(4, 10)
let pointTwo = GridPoint(4, 10)
pointOne == pointTwo // true
```

## Comparable
Most number types such as `Int`, `Double`, conform to `Comparable`.

```swift
10 > 5 // true
10 <= 4 // false
123.1 >= 100.0 // false
```

### Required Method
`Comparable` inherits `Equatable`. Therefore, `Self` has to implement `==` as well.

```swift
public protocol Comparable : Equatable {
  public static func <(lhs: Self, rhs: Self) -> Bool
  public static func <=(lhs: Self, rhs: Self) -> Bool
  public static func >=(lhs: Self, rhs: Self) -> Bool
  public static func >(lhs: Self, rhs: Self) -> Bool
}
```

### Enum with Comparable
Create an enum called, `OS`.

```swift
enum OS {
  case iOS
  case android
}

extension OS: Comparable {
  static func ==(lhs: OS, rhs: OS) -> Bool {
    return lhs == rhs
  }

  static func <(lhs: OS, rhs: OS) -> Bool {
    return rhs == .iOS ? true : false
  }

  static func <=(lhs: OS, rhs: OS) -> Bool {
    return false
  }

  static func >=(lhs: OS, rhs: OS) -> Bool {
    return false
  }

  static func >(lhs: OS, rhs: OS) -> Bool {
    return lhs == .iOS ? true: false
  }
}
```

Let us test.

```swift
let iOS = OS.iOS
let android = OS.android

// iOS < android // false
// iOS <= android // false
// iOS >= android // false
// iOS > android // true

// android > iOS // false
// android >= iOS // false
// android <= iOS // false
// android < iOS // true
```

> **Important:** iOS can not be equal to Android. It can be only greater.

### Source Code
[8004_equatable_comparable.playground](https://www.dropbox.com/sh/zusz6m5vrynqj8i/AADpeaEYRIgh5jPODZtTefD0a?dl=0)

### Resources
[swiftdoct.org/Array](http://swiftdoc.org/v3.0/type/Array/hierarchy/)

## Conclusion
We've taken a look at two popular protocols: `equatable` and `comparable`. You've learned that native Swift types such as `Int`, `Double`, conform to them and have required operators. After, you've learned how to create your own types that conform to `equatable` and `comparable` to provide the same effect with the native types.

In the following lesson, you will learn protocols that make a `for-in` loop possible.

> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

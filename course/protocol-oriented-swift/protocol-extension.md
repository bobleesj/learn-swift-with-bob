# Protocol Extension

## Introduction
Welcome to Lesson 2 of Protocol Oriented Swift. You will learn a magic. You will dramatically reduce the number of lines of code.

## Problem
I don't even want to type anymore.

### Create Protocol
Create a protocol called `MathGenius` that contains one method.

```swift
protocol MathGenius {
  func calculateGPA()
}
```

### Create Protocol Extension
Create an extension to `MathGenius`. The extension contains a default method.

```swift
extension MathGenius {
  func calculateGPA() {
    print("I'm too cool for skool")
  }
}
```

Create a struct that conforms to `MathGenius`. Since the extension provides a default method, you no longer have to specify the required method. If you do, it will override the default method.

```swift
struct Bob: MathGenius {
  func calculateGPA() {
    print("1.2 GPA")
  }
}

Bob().calculateGPA() // "1.2 GPA""
```

You don't have to provide the default method due to `extension`.

```swift
struct Bobby: MathGenius {}
Bobby().calculateGPA() // "I'm too cool for skool"
```

### Practical Protocol Extension
Create a protocol that contains a method that takes two `Double` parameters and returns `String`.

```swift
protocol FindAreable {
  func calculateArea(side: Double, length: Double) -> String
}
```

Create an extension to `FindAreable` which will return a statement whose type is in `String`.

```swift
extension FindAreable {
  func calculateArea(side: Double, length: Double) -> String {
    let area = String(side * length)
    return "The area is \(area)"
  }
}
```

Every struct and class that conforms to `FindArea` contains the default `calculateArea` method from the `extension`.

```swift
struct Square: FindAreable {}
struct Hexagon: FindAreable {}

Square().calculateArea(side: 4, length: 4)
Hexagon.init().calculateArea(side: 6, length: 10)
```

### Usage Case
 - UILabel, UIImageView, UIView --> Animation
 - Storyboard Identifier
 - Reusable table and collection view cells

### Resources
If you are interested in how you may apply `Protocols` to UIKit, you may read [Protocol Oriented View with Bob (Blog)](https://medium.com/ios-geek-community/protocol-oriented-programming-view-in-swift-3-8bcb3305c427#.u3rr936vm).

### Source Code
[4002_protocol_extension.playground](https://www.dropbox.com/sh/zjn5tytza7yycwp/AADSzYya-HOgr0UDaOfj6H46a?dl=0)

## Conclusion
Protocol Oriented Swift is only limited by your imagination. 

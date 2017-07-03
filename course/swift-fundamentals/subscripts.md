# Subscripts

## Introduction
Welcome to lesson 7, `Subscripts`, of The Swift Fundamentals with Bob. What if I told you that you may create a shortcut?

## Problem
I'd love to have a shortcut instead of calling a method.

## Normal Method
Create a class called, `HelloKitty` which contains a method that returns a string value.

```swift
struct HelloKitty {
  func saySomething() -> String {
    return "I'm Cute"
  }
}
```

Create an instance and call `saySomething()`
```swift
let babe = HelloKitty()
babe.saySomething() // "I'm Cute"
```

## Introducing Subscripts
`Subscripts` are analogous to methods. Yet, there is no name. Instead you add the keyword, `subscript`.

```swift
struct WeekDays {
  var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]

  subscript(index: Int) -> String {
    return days[index]
  }  
}
```

Call the subscript by adding `[]` at the end of the instance.

```swift
let myDays = WeekDays()
myDays[0]  // "Monday"
myDays[1]  // "Tuesday"
```

## Dictionary
When you access elements in a dictionary, it always returns an `optional` type.

```swift
var info = ["Height": 183, "Body Fat": 12.5, "Weight": 76]
let height = info["Height"] // height is an optional string
```

## Artificial Dictionary
Let us access an element without returning an optional type using `subscripts`.

```swift
struct HealthInfo {
  var info = ["Height": 183, "Body Fat": 12.5, "Weight": 76]

  subscript(key: String) -> Double {
    if let newInfo = info[key] {
      return newInfo
    } else {
      return 0
    }
  }
}
```

> **Important:** You may use `guard` instead.

### Access Elements
Return non-optionals using the subscript method.

```swift
let bob = HealthInfo()
bob["Height"]         // 183
bob["Body Fat"]        // 12.5
bob["123456789"]       // 0
```

## Shortcoming of Subscript
No context means = ☠️

### Practical Usage
 1. Get the number of rows in table/collection
 2. Anything has to do with pairs and collection types

### Source Code
[1107_subscripts.playground](https://www.dropbox.com/sh/0i0ut11pvx3wfux/AAARAUiJ3AGd7gn3p1JfxtLZa?dl=0)


## Conclusion
Now you understand the meaning of creating a shortcut. However, `subscripts` often leads to confusion due to no explicit name. Swift engineers recommend that brevity is not the ultimate goal. Effective communication trumps everything else.

In the next lesson, you will learn the fundamental difference between `structs` and `classes`. In other words, you will learn the meaning of reference types and value types.

> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

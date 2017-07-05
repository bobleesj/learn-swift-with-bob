# Typealias

## Introduction
Welcome to the last lesson of The Swift Fundamentals. You've come a long way. You will learn how to create fake names for anything. This lesson should be nice and short.

## Problem
The parameters are unreadable and boring

> **Typealias:** A false or assumed identity. - [Oxford Dictionary]

[Oxford Dictionary]: https://en.oxforddictionaries.com/definition/alias

### Typealias for String
Instead of using `String`, let us create a fake name for `String`.

```swift
typealias Name = String

func insertName(name: Name) {}
insertName(name: "Bob Lee")
```

### Typealias for Custom Class
```swift
class Employee {}

typealias MyEmployees = [Employee]
func listEmployees(enterEmployees: MyEmployees) {}
```
### Typealias for Tuple
```swift
typealias GridPoint = (Int, Int)

func enterPoint(grid: GridPoint) {
 print("You've entered, \(grid.0) and \(grid.1)")
}

enterPoint(grid: (4, 2))
```

### Type Definition
Let's review how to initialize `Array`, `Dictionary`, and `Optional`.

#### Array Type
```swift
let arrayOne: Array<String> = ["Bob", "Bobby"] // Generic Struct
let arrayTwo: [String] = ["Bob", "Bobby"]
```

#### Dictionary Type
```swift
let dictTwo: Dictionary<String, Int> = ["Alex": 31, "Paul": 39] // Generic Struct
let dictOne: [String: Int] = ["Alex": 31, "Paul": 39]
```

#### Optional Type
```swift
var optionalOne: String?
var optionalTwo: Optional<String> // Generic Enum
```

> You will learn more about `optionals` in Chapter 8: Advanced Enums.

### Source Code
[1012_typealias.playground](https://www.dropbox.com/sh/14785va0a9oor2x/AADwfnJXD17kyB36ch0LA8A4a?dl=0)

## Conclusion
That's it. You've learned how fake.

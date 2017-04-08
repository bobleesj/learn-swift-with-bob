# Typealias

## Introduction

## Problem
The parameters are unreadable and boring

### Typealias for `String`
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

#### Array Type
```swift
let arrayOne: Array<String> = ["Bob", "Bobby"] // Generic Struct
let arrayTwo: [String] = ["Bob", "Bobby"]
```

#### Dictionary Type
```swift
let dictOne: [String: Int] = ["Alex": 31, "Paul": 39]
let dictTwo: Dictionary<String, Int> = ["Alex": 31, "Paul": 39] // Generic Struct
```

#### Optional Type
```swift
var optionalOne: String?
var optionalTwo: Optional<String> // Generic Enum
```


### Source Code
[1012_typealias.playground](https://www.dropbox.com/sh/shyk6w8fvnpgdpa/AAAcKgqK2gmRGjWxvdQcDpJXa?dl=0)

### Reference

## Conclusion

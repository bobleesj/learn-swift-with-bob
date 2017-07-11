# Extra in Swift 4


## Introduction
There are a couple more potentially useful features that were introduced in Swift 4. Let's take a look.

## Problem
What Else?

### Multi-Line
Your past
```swift
let multiLines = "Boom 1\n Boom Boom 2\n Boom Boom Boom 3\n"
```

Swift 4
```swift
let swift4Lines = """
Boom
Boom Boom
Boom Boom Boom
"""
```

Nice and easy.

### One-Sided Ranges
You do not have to set a boundary for `Range`.

```swift
let stringArray = ["One", "Two", "Thee", "Four", "Five"]
```

Let us apply.

```swift
let lessThanIndexThree = stringArray[..<3]
// "One", "Two", "Thee"]

let lessThanIndexFour = stringArray[...3]
// ["One", "Two", "Thee", "Four"]

let greaterThanIndexFour = stringArray[3...]
// ["Four", "Five"]
```

Let us apply to `Switch`.

```swift
let age = 400
switch age {
case 0...10:
  print("Child")
case 11...:
  print("Adult")
default:
  print("?")
```

### Source Code
[9006_the_rest.playground]()

## Conclusion
Nice and short. That's it!

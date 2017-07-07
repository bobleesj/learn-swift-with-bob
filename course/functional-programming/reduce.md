# Reduce
## Introduction

## Problem
Combine all into one

### Imperative/Non-Functional
Let's try to add up numbers in an array.

```swift
var numberOne = Int()
for number in Array(1...10) {
  numberOne += number
}

numberOne // 55
```

Let's try to subtract all numbers in an array.
```swift
var numberTwo = Int()
for number in Array(1...10) {
  numberTwo -= number
}

numberTwo // -55
```

Again, there must be a better way. You know the drill.

### Declarative/Functional Programming
```swift
let added = Array(1...10).reduce(0) { $0 + $1 } // 55
let subtracted = Array(1...10).reduce(0) { $0 - $1 } // -55
```

You will discover how it works behind the scene by the end of this lesson. Let's get started.



### Source Code

### Resources


## Conclusion

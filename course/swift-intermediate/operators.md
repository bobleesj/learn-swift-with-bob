# Intro to Operators

## Introduction

## Problem
Write less, produce more

### Definition
> An operator is a symbol for a function

#### Unary operators
```swift
!true // false
!false // true
```

#### Binary operators
```swift
1 + 2
4 == 4
1 / 4
5 % 2
```

### Typical Else-If
```swift
let iCanDrink = false

if iCanDrink {
  print("You may enter")
} else {
  print("No no")
}
```

### Tertiary Operator
```swift
iCanDrink ? print("You may enter") : print("No no") // "No no"
```

### Add odd/even numbers
```swift
var evenNumbers: [Int] = []
var oddNumbers: [Int] = []

for number in 1...50 {
  if number % 2 == 0 {
    evenNumbers.append(number)
  } else {
    oddNumbers.append(number)
  }
}
```

### Tertiary Operator
```swift
for number in 1...50 {
  (number % 2 == 0) ? evenNumbers.append(number) : oddNumbers.append(number)
}
```

## Unwrapping Optionals
```swift
var age: Int? = nil
var defaultAge: Int = 20

var finalUserAge = Int() // 0

if age != nil {
  finalUserAge = age!
} else {
  finalUserAge = defaultAge
}
```
### Nil-Coalescing Operator
```swift
finalUserAge = age ?? defaultAge // finalUserAge is 20
```

### Source Code
[1011_operators.playground](https://www.dropbox.com/sh/1cz94ffju3e8smz/AABbbdMDL5Ch1-8T4ZHlPlvFa?dl=0)

### Reference

## Conclusion

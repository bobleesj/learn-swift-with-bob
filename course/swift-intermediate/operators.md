# Intermediate Operators

## Introduction

## Lecture Notes


prefix operator %
prefix func % (percentage: Int) -> Double {
  return (Double(percentage) / 100)
}

%42

postfix operator %
postfix func % (percentage: Int) -> Double {
  return (Double(percentage) / 100)
}

42%


//: Prefix
!true
!false

/*
+: Unary plus
-: Unary minus
!: Logical NOT
~: Bitwise NOT


```
func +(left: [Double], right: [Double]) -> [Double] {
  var sum = [Double](repeating: 0.0, count: left.count)
  for (i, _) in left.enumerated() {
    sum[i] = left[i] + right[i]
  }

  return sum
}

print([1, 2] + [3, 4]) // [1, 2, 3, 4]

infix operator ** { associativity precedence 160 }
```


```swift
 1. infix specifies that it is a binary operator, taking a left and right hand argument
 2. operator is a reserved word that must be preceded with either prefix, infix, or postfix
 ** is the operator itself
 3. associativity left means that operations are grouped from the left
 4. precedence 160 means that it will evaluate with the same precedence as the exponential operators << and >> (left and right bitshift).
```


```swift
import Foundation

func ** (left: Double, right: Double) -> Double {
  return pow(left, right)
}

2 ** 3
```


```swift
prefix operator √

prefix func √ (number: Double) -> Double {
  return sqrt(number)
}

√12031231203021
```

```swift
infix operator ± { associativity left precedence 140 }
func ± (left: Double, right: Double) -> (Double, Double) {
  return (left + right, left - right)
}

prefix operator ± {}
prefix func ± (value: Double) -> (Double, Double) {
  return 0 ± value
}

2 ± 3
// (5, -1)

±4
// (4, -4)
```




//: Guideline
// Don’t create an operator unless its meaning is obvious and undisputed. Seek out any potential conflicts to ensure semantic consistency.
// Custom operators should only be provided as a convenience. Complex functionality should always be implemented in a function, preferably one specified as a generic using a custom protocol.

["Bob", "Bobby"] + ["Bob", "Bobbb"]


//: Operator Overloading
// Operator overloading allows you to change the way existing operators work with specific structures or classes. This is exactly what you need – you’d like to change the way the + operator works with Int arrays!


// In programming languages, associativity (or fixity) is a property that determines how operators with the same level or precedence are grouped in the absence of any parentheses.


// In Swift, the precedence of an operator is defined as a decimal integer value in the range 0 to 255 inclusive. They higher the number, the higher the precedence and the sooner the compiler evaluates it.
func * (left: String, right: Int) -> String {
  if right <= 0 {
    return ""
  }

  var result = left
  for _ in 1..<right {
    result += left
  }

  return result
}

"a" * 6
"abab" * 3

84 * 2



//: Choosing a Type
/*
With Swift, you can define binary, unary and ternary operators. These indicate the number of targets involved.
Unary operators involve a single target and are defined either as postfix (i++) or prefix (++i), depending on where they appear in relation to the target.
Binary operators are infix because they appear in between the two targets, for example 1 + 1.
Ternary operators operate on three targets. In Swift, the conditional operator is the only Ternary operator, for example a ? b : c.


//: Nil-Coalescing Operator

// The nil-coalescing operator (a ?? b) unwraps an optional a if it contains a value, or returns a default value b if a is nil. The expression a is always of an optional type. The expression b must match the type that is stored inside a.

let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil

var colorNameToUse = userDefinedColorName ?? defaultColorName

"Bob" == "Bboby"

// Tertiaray Operator
//https://developer.apple.com/reference/swift/swift_standard_library_operators


var anOptionalInt: Int? = 10

var anotherOptional = (anOptionalInt != nil ? anOptionalInt! : 0)

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

// var sumWithMultiplication = 1 + 3 - 3 * 2


### Terminology
 1. Unary operators operate on a single target (such as -a). Unary prefix operators appear immediately before their target (such as !b), and unary postfix operators appear immediately after their target (such as c!).
 2. Binary operators operate on two targets (such as 2 + 3) and are infix because they appear in between their two targets.
 3. Ternary operators operate on three targets. Like C, Swift has only one ternary operator, the ternary conditional operator (a ? b : c).



#### Reference
http://nshipster.com/swift-operators/





### Problem

### Source Code

### Reference

## Conclusion

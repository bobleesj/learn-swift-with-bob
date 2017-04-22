# Advanced Operators

## Introduction
Welcome to Lesson 2 of Advanced Swift. Throughout the previous lessons, I've given you a little taste about Advanced Operators. It's your turn.

## Problem
Learn how to create custom operators

## Inout

> **Note:** Function parameters are constants by default.

Let us create a function whose parameter is decorated with `inout`.

```swift
func enterSomething(_ a: inout Int) {
  a += 1
  print(a)
}
```

`inout` parameters can be modified. Let us execute the function.

```swift
var number = 10
enterSomething(&number)
```

Let us check `number`

```swift
print(number) // 11
```

It has been mutated by the function even though it was used as the parameter.  

## Design Prefix and PostFix Operators
Let us get to the objective.

### Prefix Operator
Let us create one.  Define an operator.

```swift
prefix operator √
```

Add logics to the operator.

```swift
prefix func √(number: Double) -> Double {
  return sqrt(number)
}

√1000000 // 1000
√10000234234 // Some number
```

Let us a create a silly one.

```swift
prefix operator ©
prefix func ©(enterWord: String) -> String {
  return "\(enterWord)™"
}
```

Let us apply

```swift
 ©("Bob the Developer")
 // "Bob the Developer™"
 ```

> **Important:** Click `opt-g` to create ©


### PostFix Operator
Postfix is an operator that comes after the value.

```swift
let myName: String? = "Bob"
myName!
```

Let us create one.

```swift
postfix operator =!

postfix func =!(value: String?) -> String {
  guard let unwrappedValue = value else {
    return ""
  }
  return unwrappedValue
}
```

Let us apply.

```swift
myName=!
// "Bob"
```

Let us create an operator, `%%` that determines whether the number is odd or even.

```swift
postfix operator %%
postfix func %%(enterNumber: Int) -> String {
  return enterNumber % 2 == 0 ? "Even" : "Odd"
}
```

Let us use the operator.

```swift
Int(arc4random())%% // "Even" or "Odd"
```

## Infix Operator
This is the real deal. Let us take a look at a couple default examples.

| Group | Precedence | Examples |
| --- | --- | --- |
| BitwiseShiftPrecedence |   precedence 160  | <<, >> |
| MultiplicationPrecedence |  associativity left precedence 150  |  /, %, &, * |
| AdditionPrecedence |  associativity left precedence 140 | +, - |
| RangeFormationPrecedence |  precedence 135 |  ..<, ... |
| CastingPrecedence | precedence 132  | is, as |
| ComparisonPrecedence |precedence 130  | <, <=, ==, !=, === |
| LogicalConjunctionPrecedence | associativity left precedence 120  | && |
| NilCoalescingPrecedence |  associativity right precedence 110  | ?? |
| TernaryPrecedence |  associativity right precedence 100  | ? |
| AssignmentPrecedence  | associativity right precedence 90  | =, *=, /=, += |


### Old Method
Let us create one.

```swift
infix operator ** { associativity left precedence 130 }
```

Let us add logics.

```swift
func ** (left: Double, right: Double) -> Double {
  return pow(left, right)
}
```

Let us call the operator.

```swift
2 ** 3 // 8
2 ** 10 // 1024
```

### Swift 3.0
Precedence value is no longer used. Instead, the priority of custom operators is determined relatively.

Let us a create a group called, `CustomOperatorPrecedence`.

```swift
precedencegroup CustomOperatorPrecedence {
  higherThan: AdditionPrecedence
  lowerThan: MultiplicationPrecedence
  associativity: left
}
```

Define an operator, `????` that conforms to `CustomOperatorPrecedence`.

```swift
 infix operator ????: CustomOperatorPrecedence
```

The `????` is used to generate a random number.

```swift
func ???? (left: UInt32, right: UInt32) -> Double {
  let lower : UInt32 = left
  let upper : UInt32 = right
  let randomNumber = arc4random_uniform(upper - lower) + lower
  return Double(randomNumber)
}
```

Execute the operator.

```swift
1 ???? 10 // 10
1 ???? 124234324 // 124234324
```

## Operator Overloading
You may override an operator that is pre-defined by Swift engineers. Let us attempt to add an extra functionality with `*` as shown below.

```swift
"a" * 10
"aaaaaaaaa"
```

Add extra feature.

```swift
func * (left: String, right: Int) -> String {
  guard right >= 0 else {
    print("Make sure enter number higher 0")
    return ""
  }

  var result = String()
  for _ in 1..<right {
    result += left
  }

  return result
}
```

Execute the operator
```swift
"Bob" * 10 // "BobBobBob..."
```

### Another Example
Let us attempt to achieve the effect as shown by operator below.

```swift
[1, 2] + [3, 4] // [4.0, 6.0]
```

Add logics to the operator.

```swift
func +(left: [Double], right: [Double]) -> [Double] {
  var sum = [Double](repeatElement(0.0, count: left.count))

  print(left.enumerated())
  for (i, _) in left.enumerated() {
    sum[i] = left[i] + right[i]
  }

  return sum
}
```

### Source Code
[8002_advanced_operators](https://www.dropbox.com/sh/ri3z2v69o2ls1a1/AABbuPxeBoQkWF1i8domQ8qoa?dl=0)

### References
[Swift Operators by Matt Thompson](http://nshipster.com/swift-operators/)

[The Swift Programming Language (Swift 3.1) - Advanced Operators](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AdvancedOperators.html)



## Conclusion
First, you've learned that `inout` parameters can be modified within the function. Second, you've learned how to create `prefix` and `postfix` operators by defining them first and adding the logic second. Lastly, you've learned the old way of creating `infix` operators with the definite precedence value.  Now, however, you define the precedence value relative to default operator groups. However, be careful not to overuse custom operators. Once you use them, you should create documents for your teammates and for yourself.

In the following lesson, you will the final aspect of Swift Error Handling.

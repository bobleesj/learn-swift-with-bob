# The Enum Basics
Welcome to the first lesson of Advanced Enum. Before you learn intermediate and advanced in later lessons, let us get everyone on the same page.

## Problem
Let's Review

### Types of Enumeration

 1. Basic Enumerations
 2. Enumerations that have Raw Values
 3. Enumerations that have Associated Values

## Basic Enumerations
Create an enum called `Compass`. It contains 4 cases.

```swift
enum Compass {
  case north
  case south
  case east
  case west
}
```

You define multiple cases in a single line
```swift
enum Planet {
  case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
```

To initialize, you choose one of the cases.
```swift
let earth = Planet.earth // init
```

You may run through a `switch` statement to identify the `enum` type.

```swift
switch earth {
case .earth:
  print("Mostly safe")
default:
  print("Not a safe place for me")
}

// "Mostly safe"
```

## Raw Value
An enumeration may contain value. Swift supports the following types for the value of an enum:
 - `Int`
 - `Float`
 - `String`
 - `Bool`

### Raw Value: String
```swift
 enum Food: String {
   case pizza
   case banana
   case chicken
   case bigMac
 }

let stringValueFromPizza = Food.pizza.rawValue
print(stringValueFromPizza) // pizza
```

### Raw Value: Int
```swift
enum Days: Int {
  case mon, tue, wed, thu, fri = 10, sat, sun
}
// mon = 0, tue = 1, wed = 2, ... , fri = 10, sat = 11

let myDay = Days.fri.rawValue
print(myDay) // 10
```

### Initialization from Raw Value
You may create an enum object using a raw value. it may fail. Therefore, the returned object may be `nil`.

```swift
let possibleeDay = Days(rawValue: 10) // returns optional
print(possibleeDay!)
```

You may combine with a `switch` statement.

```swift
if let someDay = Days(rawValue: 3) {
  switch someDay {
  case .sat, .sun:
    print("Weekends!!")
  default:
    print("Weekdays!")
  }
} else {
  print("No such day exists")
}
```

## Associated Value
Each case may contain value along with it.
### Example from Doc
```swift
enum Barcode {
  case upc(Int, Int, Int, Int)
  case qrCode(String)
}

var qrCode = Barcode.qrCode("XYZ")
var upcCode = Barcode.upc(4, 2, 5, 5)
```


### Validation
Determine if the instance is `Barcode.qrCode` using an `else-if` statement. The process is similar to implicit unwrapping.

```swift
if case let Barcode.qrCode(value) = qrCode {
  print("This is a qrcode")
  print(value)
}
```

You may capture the associated value of the instance, `qrCode` using `case let`. You've named the captured value as `value`.

Determine whether he `upcCode` instance is `Barcode.upcCode`.

```swift
if case let Barcode.upc(numberSystem, manufacturer, product, check) = upcCode {
  print("numbersystem:", numberSystem)
  print("manufaturer:",manufacturer)
  print("product:",product)
  print("check:",check)
}
```

### Validation with Switch Statement
Instead of checking each enum object individually using an `else-if`, you may use a `switch` statement.

```swift
let code = upcCode

switch code {
case .upc(let numberSystem, let manufacturer, let product, let check):
  print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
  print("QR code: \(productCode).")
}
```

The code below is identical as above. It gives off zenness.

```swift
switch code {
case let .upc(numberSystem, manufacturer, product, check):
  print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
  print("QR code: \(productCode).")
}
```

### Source Code
[7001_enum_basics.playground](https://www.dropbox.com/sh/qif4q2x1x5ltj0f/AAAcCOW4tTO5ftO5VGy1eJi6a?dl=0)

## Conclusion
You've reviewed the three types of enums in the Swift Programming Language. If you are not comfortable with any, make sure you review and watch this video multiple times to get used to the syntax. Upcoming lessons will get more complex.

In the following lesson, you will learn how to use Swift enums to type less but produce more using practical examples in iOS development. 

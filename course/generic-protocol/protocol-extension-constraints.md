# Protocol Extension and Type Constraints
## Introduction
Welcome to Lesson 2 of Generic Protocols. In Chapter 1, you've learned how to add constraints to generic functions with the example of `LOL` classes. Likewise, you may add constraints to a protocol extension so that the default implementation may only apply to specific classes and structs.

## Problem
Limit the scope of Protocol Extension with `where` and `Self`

## Generic Function - [Review](/course/swift-fundmentals/generics.md#type-constraints)

Create a called `LOL` and create a function called `addLOLClassOnly`. The parameter of the function only works with value whose type is `LOL`.

```swift
class LOL {}
func addLOLClassOnly<T: LOL>(array: [T]) { }
addLOLClassOnly(array: [LOL()])
```

## Design Protocol
Create a protocol called, `GenericProtocol`. Create `SomeClass` and `SomeStruct` of which conform to the protocol.

```swift
protocol GenericProtocol {
  associatedtype myType
}

class SomeClass: GenericProtocol {
  typealias myType = String
}
class SomeStruct: GenericProtocol {
  typealias myType = Int
}
```

## Design Protocol Extension
You may add constraints/conditions to `extension` by adding a `where` clause.

Create an extension that its default implementation applies to those whose associated type, `myType` is `String`

```swift
extension GenericProtocol where myType == String {
  static func introduce() {
    print("Yo, I'm Bob")
  }
}
```

Classes, structs, and enums with `myType` as `String` contain the `introduce()` static method.

```swift
SomeClass.introduce() // "Yo I'm Bob"
SomeStruct.introduce() // Error
```

You may also add another `where` clause by adding `,`. Let us apply the extension to `SomeClass` only.

```swift
extension GenericProtocol where myType == String, Self == SomeClass {
  static func introduce() {
    print("Yo, I'm Bob")
  }
}
```

> **Notes:** `Self` refers to the class/struct/enum that conforms to the protocol.

## Design Pre-Defined Associated Type
In the previous lesson, you've left `associatedtype` to be defined by the `Self`. Yet, you may pre-define the type within the protocol.


```swift
protocol FamilyProtocol {
  associatedtype familyType = Int
  var familyMembers: [familyType] { get set }
}
```

If you create a struct that conforms to `FamilyProtocol`, the required property, `familyMembers` has the type of `[Int]`.

```swift
struct NumberFamily: FamilyProtocol {
  var familyMembers: [Int] = [1, 3, 4]
}
```

### Source Code
[6002_Protocol Extension and Type Constraints.playground](https://www.dropbox.com/sh/ntf6ihf5ltpf8f1/AADSqimYJjoMB59xplWGr0aoa?dl=0)

## Conclusion
Like generic constraints, you've learned how to limit the scope of protocol extensions by implementing `where` clauses. What a powerful tool. It prevents you from creating bloated objects filled with unnecessary methods and properties.

In the following lesson, you will learn how to override pre-defined associated type.

> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

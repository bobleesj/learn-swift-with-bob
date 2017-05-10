# Intro to Protocol Associated Type
## Introduction
Welcome to the first lesson of Generic Protocols. In Chapter 4, Protocol Oriented Swift, you've mastered how to set protocol requirements. In this chapter, you will learn how to set the requirements generic, providing freedom and scalability.

## Problem
How to create generic protocols

> **#1 Rule:** Type must be defined before compiled.

## Design Generic Struct - [Review](/course/swift-fundamentals-generics.md)
Create a generic struct that has one property whose name is `property`.

```swift
struct GenericStruct<T> {
  var property: T?
}
```

When you initialize, you may define `T` implicitly or explicitly.

```swift
let explicitly = GenericStruct<Bool>()
// T is Bool
let implicitly = GenericStruct(property: "Bob")
// T is String
```

## Design Normal Protocol
To appreciate generic protocols, let's go back to your past. Design a protocol that has one property requirement whose name is `property` in `String`.

```swift
protocol NormalProtocol {
  var property: String { get set }
}
```

## Design Class
Create a class called, `NormalClass` that conforms to `NormalProtocol`.

```swift
class NormalClass: NormalProtocol {
  var property: String = "Bob"
}
```

`property` must be `String`. This ain't free. There is an alternative.

## Introducing Generic Protocol
When you design a protocol, you may add `associatedtype` which is analogous to `typealias`. Unlike `typealias`, the type is not defined.

```swift
protocol GenericProtocol {
  associatedtype myType
  var anyProperty: myType { get set }
}
```

The type, `myType`, of `anyProperty` will be defined by either classes, structs, or enums.


## Define Associated Type
Create a struct called, `SomeStruct` and conforms to `GenericProtocol`. As the requirement, `anyProperty` must be present. However, you may implicitly define the type of `myType` based on the value you assign to `anyProperty`.

```swift
struct SomeSturct: GenericProtocol {
  var anyProperty = 1996 // myType = Int
}

struct NewStruct: GenericProtocol {
  var anyProperty = "Bob" // myType = String
}
```

## Define Associated Type with Typealias
As an alternative, you may define the type of `myType` explicitly by creating `typealias`.

```swift
struct ExplicitStruct: GenericProtocol {
  typealias myType = Bool
  var anyProperty = true  
}
```

### Source Code
[6001_intro_associated_type.playground](https://www.dropbox.com/sh/45dd9m5lsm4hwj1/AAA1PGWk72J0CZRPGzQ2kntGa?dl=0)

## Conclusion
You've learned how to create generic protocols by implementing `associatedtype`. Like generic structs, the type of `associatedType` must be defined by the structs, classes, or enums that conform to the protocol. There are two ways to specify the type of `associatedType`. You may implicitly define it based on the value you assign. Second, or you may explicitly create a `typealias` that define the type upfront.

In the following lesson, you will learn how to add limitation/constraints to protocol `extension` like generic constraints.

> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

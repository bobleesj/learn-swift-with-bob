# Class vs Struct

## Introduction
Welcome to Lesson 8. There are two objectives. First, you will learn the fundamental difference between structs and classes by understanding value types and reference types. I expect you to know that structs do not provide inheritance. However, we will focus on the reason behind.

## Problem
  1. What are the differences besides inheritance?
  2. When to use Structs over Classes?

## Design Class

```swift
class HumanClass {
  var name: String
  init(name: String) {
    self.name = name
  }
}
```

### Create Instance

```swift
var humanClassObject = HumanClass(name: "Bob")
humanClassObject.name // "Bob"
```

Create another instance that "copies" `humanClassObject`

```swift
let newHumanClassObject = humanClassObject
```

Change the `name` property of `newHumanClassObject` to "Bobby".

```swift
humanClassObject.name = "Bobby"
newHumanClassObject.name // "Bobby"
```

The name property of `newHumanClassObject` has been changed to "Bobby" as well.


## Design Struct
```swift
struct HumanStruct {
  var name: String
  init(name: String) {
    self.name = name
  }
}
```
### Create Instance

```swift
var structObject = HumanStruct(name: "Bob")
let newStructObject = structObject
```

Change the name property of `structObject` to "Bobby".

```swift
structObject.name = "Bobby"
newStructObject.name // "Bob"
```

However, it has no effect on `newStructObject.name` because `newStructObject` has no relationship.  The graph below shows the fundamental difference between `value types` vs `reference types`.

<img src="/course/swift-intermediate/assets/refernece-value-type-difference.png" alt="The difference in value type and reference type"/>


## One Difference in Mutability
Due to the fundamental difference, there is an interesting discrepancy when it comes to `let`.

### Mutability in Classes

```swift
class BobClass {
  var name = "Bob"
}

let bobClass = BobClass()
bobClass.name = "Bobby"

let newBobClass = bobClass

newBobClass.name = "Bob the Developer"
bobClass.name // "Bob the Developer"
```

Although the instance, `bobClass` has been created as a constant, the property of it has been mutated. It is possible because the instance does not own any object, but has a reference to `BobClass`.

### No Mutability in Structs

```swift
struct BobStruct {
  var name = "Bob"
}

let bobStruct = BobStruct()
bobStruct.name

bobStruct.name = "Bob Lee"
// Error: Immutable
```

In structs, when an instance is created with a constant, `let`, it's not possible to mutate its property since the instance has its own copy and the `let` protects anyone from interfering with its own instance.

### When to use Struct/Value Type?
 - 10,000 - 1,000,000 faster than Class
 - No mutability due to no relationship between objects
 - When subclassing not needed and non-nested structure is recommended

### Resources
To learn more about cons of Object Oriented Programming, you may read the beginning of [Intro to Protocol Oriented Programming]. You will learn more about POP in [Chapter 4].

[Intro to Protocol Oriented Programming]:  https://blog.bobthedeveloper.io/introduction-to-protocol-oriented-programming-in-swift-b358fe4974f

[Chapter 4]: /course/protocol-oriented-swift/introduction.md

### Reference
[If you're subclassing, you are doing it wrong - Hector Matos](https://krakendev.io/blog/subclassing-can-suck-and-heres-why)
<br>[All evidence points to OOP being bullshit](https://content.pivotal.io/blog/all-evidence-points-to-oop-being-bullshit)
<br>[Object Oriented Programming is exceptionally bad](https://www.leaseweb.com/labs/2015/08/object-oriented-programming-is-exceptionally-bad/)

### Source Code
[1008_class_struct_difference.playground]

[1008_class_struct_difference.playground]:https://www.dropbox.com/sh/der2imu4z41c7nr/AAAaLyZhh4jJLe-_oQFPFGmxa?dl=0

## Conclusion
You've learned the fundamental difference classes or structs through value types vs reference types. At this point, you might feel as if there is no point of learning the difference. You are right, when you are creating small apps, it doesn't really matter. But, once you start to have a complex structure, that's when you truly see how OOP can be difficult to manage as you've seen the UIKIt diagram.

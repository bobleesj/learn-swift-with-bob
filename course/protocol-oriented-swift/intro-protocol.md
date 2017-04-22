# Introduction to Protocol

## Introduction
Welcome to Lesson 1 of Protocol Oriented Swift. In this lesson, the goal is to master the `protocol` syntax before you take full advantage of what it offers on the table.

## Problem
Problem: Protocols, who are you?

> **Analogy:** Protocol is like a basketball coach. He/she tells players what to do, but he/she doesn't know how to dunk.


### Drawbacks of OOP
Before implementing protocols, you should be aware of drawbacks from solely relying on OOP.

 1. When you subclass, you have to inherit properties and methods which you may not need. The object becomes unnecessarily bloated.
 2. When you make a lot of super classes, it becomes extremely hard to navigate between each class and fix bugs/edit.
 3. Since objects are referencing to the same place in memory, if you make a copy and create a small change its property, it can mess up the rest. (Mutability due to reference)

## Design Protocol
Create a protocol called, `Humanable`. It contains two properties and one method. Do not worry about `get` and `set` for now.

```swift
protocol Humanable {
  var name: String { get set }
  var race: String { get }
  func sayHi()
}
```

Create a class that conforms to `Korea` just like how you would subclass. To prevent Swift from screaming, you must implement two properties and one method defined in the protocol.

```swift
struct Korean: Humanable {
  var name: String = "Bob Lee"
  var race: String = "Asian"
  func sayHi() {
    print("Hi, I'm \(name)")
  }
}

class American: Humanable {
  var name: String = "Joe Smith"
  var race: String = "White"
  func sayHi() {
    print("Hi, I'm \(name)")
  }
}
```

## Protocol Inheritance
A protocol may "inherit" the requirements from other protocols.

```swift
protocol SuperHumanable: Humanable {
  var canFly: Bool { get set }
  func punch()
}
```

Any classes, structs, enums that conform the `SuperHumanable` must contain properties and methods from `Humanable` as well.  

```swift
struct BobtheDeveloper: SuperHumanable {
  var name: String = "Bob"
  var race: String = "Asian"
  func sayHi() {
    print("I code")
  }

  var canFly: Bool = false
  func punch() {
    print("I don't punch")
  }
}
```

> **Important:** { get } or { get set } only apply to computed property. If a class has a stored property, you may choose either { get } or { get set }.

## Computed Property
When a class/struct/enum contains computed properties, you must take into account of `{ get }` or `{ get set }` while setting the requirements of a protocol.

Create a protocol called, `Breathable`. It contains two properties: `isBreathing` and `isLiving`.

```swift
protocol Breathable {
  var isBreating: Bool { get set }
  var isLiving: Bool { get }
}
```

Create a struct that conforms to `Breathable`. The struct contains properties: `isBreathing` and `isLiving`. Define them as computed properties.

```swift
struct Human: Breathable {
  var isBreating: Bool {
    get { return true }
    set {}
  }

  var isLiving: Bool {
    get { return true }
    set {}
  }
}
```

> **Rule:** When you set the requirement as { get } you may make the property gettable or settable. If it is defined as { get set }, you must define the property as settable.


| { get } | { get set } |
| --- | --- |
| Stored Property 😀 | Stored Property 😀  |
| Computed Property --> Gettable, Settable (Optional) | Computed Property --> Gettable, Settable (Must) |

### Source Code
[4001_intro_protocols.playground](https://www.dropbox.com/sh/yk5uq09o8y4ob61/AABd3FKbRtI0mi4j77jAYrtma?dl=0)

### References
[All evidence points to OOP being bullshit by John Barker ](https://content.pivotal.io/blog/all-evidence-points-to-oop-being-bullshit)

[If you're subclassing, you are doing it wrong by Hector Matos](https://krakendev.io/blog/subclassing-can-suck-and-heres-why)


## Conclusion
For stored properties, it does not matter whether you use `{ get }` or `{ get set }`. For computed properties, however, if you define the requirement as `{ get set }`, the property must be settable. If it is `{ get }` alone, the property can be gettable or settable. Remember, protocol is like a basketball coach. structs, enums, classes, are like players.

In the following lesson, you will learn how to create a scalable architecture with protocol `extension`, a.k.a, the magic.    

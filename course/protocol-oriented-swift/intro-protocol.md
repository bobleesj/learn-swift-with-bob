# Introduction to Protocol

## Introduction
 Before I talk about details, I'd like to share with you that learning Protocol was such a daunting task. Not only it was located at the end of the Swift documentation, but it just felt really foreign to me. It sounded scary. Of course, it feels natural to use it, so I understand if you are not comfortable with it. I just would like to tell you that you might have to watch this video multiple times to get by. You might have to read 10 more articles for you to fully get comfortable. I really expect you guys to be proactive when you are confused. I will do my part which is to explain in the most clear way possible. Well, let's get started from the bottom with me. Let's go!

## Problem
Problem: Protocols, who are you?

> Protocol is like a basketball coach. He/she tells players what to do, but he/she doesn't know how to dunk.


### Drawbacks of OOP
 1. When you subclass, you have to inherit properties and methods which you may not need. Your object becomes unnecessarily bloated.
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
```swift
protocol SuperHumanable: Humanable {
  var canFly: Bool { get set }
  func punch()
}

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

> { get } or { get set} only apply to computed property. If you are defining a stored property, you may choose either { get } or { get set }.


### Computed Property
Create a protocol called, `Breathable`. It contains two properties: `isBreathing` and `isLiving`.

```swift
protocol Breathable {
  var isBreating: Bool { get set }
  var isLiving: Bool { get }
}
```

Create a struct that conforms to `Breathable`. The struct contains properties: `isBreathing` and `isLiving`. Define them as computed properties rather than stored.

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

> **Rule:** If you are using a computer property, if it is { get } you may make a property gettable or settable. If it is defined as { get set } within a protocol, you must make it gettable and settable.


| { get } | { get set } |
| --- | --- |
| Stored Property 😀 |  Computed Property --> Gettable, Settable (Optional) |
| Stored Property 😀 | Computed Property --> Gettable, Settable (Must) |


### Resources

### Reference
https://krakendev.io/blog/subclassing-can-suck-and-heres-why

https://content.pivotal.io/blog/all-evidence-points-to-oop-being-bullshit

### Source Code
[4001_intro_protocols.playground](https://www.dropbox.com/sh/yk5uq09o8y4ob61/AABd3FKbRtI0mi4j77jAYrtma?dl=0)

## Conclusion
Are you wrapping your heads around? Again, make sure you remember a couple rules. If you use { get } or { get set }. You can both use it as a stored property and change the value as you wish. However, if you identify a property with { get set } please remember if you use computed property, you have to make it settable as well. For { get }, you can do whatever you want. In our next lesson, you are going to see some of practical aspects of Protocol. You've only seen the tip of an ice berg. Let's get started my friend. Super excited to make you smarter.

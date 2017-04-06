# Introduction to Protocol

## Introduction
Welcome to Lesson 1 of The UIKIt Fundamentals Part 1 Intro to Protocol Oriented Programming. Before I talk about details, I'd like to share with you that learning Protocol was such a daunting task. Not only it was located at the end of the Swift documentation, but it just felt really foreign to me. It sounded scary. Of course, it feels natural to use it, so I understand if you are not comfortable with it. I just would like to tell you that you might have to watch this video multiple times to get by. You might have to read 10 more articles for you to fully get comfortable. I really expect you guys to be proactive when you are confused. I will do my part which is to explain in the most clear way possible. Well, let's get started from the bottom with me. Let's go!


There are certainly benefits of using OOP, but the opposites as well.
When you subclass, you have to inherit properties and methods which you may not need. Your object becomes unnecessarily bloated.
When you make a lot of super classes, it becomes extremely hard to navigate between each class and fix bugs/edit.
Since objects are referencing to the same place in memory, if you make a copy and create a small change its property, it can f up the rest. (Mutability due to reference)

## Problem
Problem: I don't know Protocol

> Protocol is like a basketball coach. He/she tells players what to do, but he/she doesn't know how to dunk.

### Protocol
Create a protocol called, `Rookieable`. It contains two properties and one method. Do not worry about `get` and `set` for now.

```swift
protocol Rookieable {
var numberOfEXP: String { get set }
var name: String { get }

func introduce()
}
```

Create a class that conforms to `Rookieable` just like how you would subclass. To prevent Swift from screaming, you must implement two properties and one method defined in the protocol.

```swift
class Bob: Rookieable {
// Stored property has no effect on get or set
var numberOfEXP: String = "13"
var name: String = "Bob"

func introduce() {
print("Hi, I'm \(name) and I have \(numberOfEXP) years of experience")
}

}
```

Create an object and call the `introduce` method.
```swift
Bob().introduce()
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
set { } // If no set, error occurs. isBreathing is { get set }
}

var isLiving: Bool {
get { return true }
set { }
}

}
```

> **Rule:** If you are using a computer property, if it is { get } you may make a property gettable or settable. If it is defined as { get set } within a protocol, you must make it gettable and settable.

### Resources
### Source Code
[4001_intro_protocols.playground](https://www.dropbox.com/sh/yk5uq09o8y4ob61/AABd3FKbRtI0mi4j77jAYrtma?dl=0)

## Conclusion
Are you wrapping your heads around? Again, make sure you remember a couple rules. If you use { get } or { get set }. You can both use it as a stored property and change the value as you wish. However, if you identify a property with { get set } please remember if you use computed property, you have to make it settable as well. For { get }, you can do whatever you want. In our next lesson, you are going to see some of practical aspects of Protocol. You've only seen the tip of an ice berg. Let's get started my friend. Super excited to make you smarter.

# Extension
## Introduction
Welcome to Lesson 10 of The Swift Fundamentals. In this lesson, you will learn how to keep your codebase modularized and dry through`extension`.

## Problem
1. I like to keep it short and modularized.
2. Prevent anything massive.

## Design Struct
First, design a struct called, `Bob`. It contains two initialized properties: `name` and `skill`.

```swift
struct Bob {
  var name = "Bob"
  var skill = "Work"

  init() {}
}
```

## Extend Class
You may "extend" the `Bob` struct and add all kinds of work.

```swift
extension Bob {
  var description: String {
    let myName = self.name
    let mySkill = self.skill // object.name
    return "I'm \(name), I know \(skill)"
  }

  init(enterSkill: String) {
    self.skill = enterSkill
    print("You've entered a new skill")
  }

  subscript(mySkill: String) -> String {
    return "This is your secret weapon"
  }
}
```
> `self` refers to the object created by the struct. If you do not know how to work with `computed properties`, you may visit [2002_computed_property] and come back after.

[2002_computed_property]: /course/object-oriented-swift/computed-property.md

### Check
Create an object called `bob`.

```swift
let bob = Bob()
bob.description // I'm Bob, I know work"
```

You may use `init(enterSkill: String)` from the `extension` block.

```swift
let newBob = Bob(enterSkill: "Drawing")
newBob.description // I'm Bob, I know drawing"
```

## Extend Swift Native Types
> Remember, `Int` just a struct


Instead of creating a separate function, you may extend `Int` and add a property.

```swift
extension Int {
  var squared: Int {
    return self * self
  }
}
```

Now, objects whose type is `Int`, contain the `squared` property.

```swift
let myNumber = 10 // self is 10
myNumber.squared // 100
```

### The Rule
 - You may not have a stored property within `extension`.


### The Scope
As mentioned, `extension` allows developers to implement all kinds of features.

 - Add computed instance properties and computed type properties ([2002_computed_property])
 - Define instance methods and type methods ([2007_type_property_method])
 - Provide new initializers
 - Define subscripts ([1007_subscripts])
 - Define and use new nested types with enum/struct
 - Make an existing type conform to a protocol


[1007_subscripts]: /course/swift-fundamentals/subscripts.md
[2002_computed_property]: /course/object-oriented-swift/computed-property.md
[2007_type_property_method]: /course/object-oriented-swift/type-property-method.md


### Source Code
[1010_extension.playground](https://www.dropbox.com/sh/nom0467cql4yt1g/AAB4UmnnlpCE1c36qbXZKAiOa?dl=0)

## Conclusion
You've learned the meaning of `self`.  I use `extension` to modularize view controller to prevent MVC, a.k.a, Massive View Controller.

In Chapter 4, you will learn the sheer power of `extension` along with `protocols` If you are interested in learning how to build apps with `Protocols` and best practices that I know of, you may join the [waiting list] for the upcoming course: [The UIKIt Fundamentals with Bob].

[The UIKIt Fundamentals with Bob]: /ABOUT.md/#course

[waiting list]: https://boblee.typeform.com/to/oR9Nt2

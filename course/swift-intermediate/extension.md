# Extension
## Introduction
Welcome to Lesson 10 of The Swift Fundamentals. In this lesson, you will learn how `extension` provides a separate place to add features to `structs` and `classes` without making them bloated.

## Problem
I like to keep it short and modularized. Prevent Massive Class

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
You may add all kinds to the `Bob` struct. However, you may not add stored properties.

> `self` refers to the object created by the struct.

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

> If you do not know how to work with `computed properties`, you may visit [2002_computed_property].

[2002_computed_property]: /course/object-oriented-swift/computed-property.md

### Check
Create an object called `bob`.

```swift
let bob = Bob()
bob.description // I'm Bob, I know work"
```

Use the `init(enterSkill: String)` init method from the `extension`.

```swift
let newBob = Bob(enterSkill: "Drawing")
newBob.description // I'm Bob, I know drawing"
```

## Extend Swift Native Types
> Remember, `Int` just a struct

```swift
extension Int {
  var squared: Int {
    return self * self
  }
}
```

```swift
let myNumber = 10 // self is 10
myNumber.squared // 100
```

### The Rule
 - You may not have a stored property


### The Scope
As mentioned, `extension` allows developers to implement all kinds of features. Let's see what it offers.

 - Add computed instance properties and computed type properties ([2002_computed_property])
 - Define instance methods and type methods ([2007_type_property_method])
 - Provide new initializers
 - Define subscripts ([1007_subscripts])
 - Define and use new nested types with enum/struct (Later)
 - Make an existing type conform to a protocol (Later)


[1007_subscripts]: /course/swift-intermediate/subscripts.md
[2002_computed_property]: /course/object-oriented-swift/computed-property.md
[2007_type_property_method]: /course/object-oriented-swift/type-property-method.md


### Source Code
[1010_extension.playground](https://www.dropbox.com/sh/nom0467cql4yt1g/AAB4UmnnlpCE1c36qbXZKAiOa?dl=0)

## Conclusion
In this lesson, you've learned the meaning of `self` and the power of `extension`.  I use `extension` to modularize view controllers and classes. You will learn more along with `protocols` in Chapter 4. If you'd like to know how I use `extension` in building apps, you can join the [waiting list] for the upcoming course: The UIKIt Fundamentals with Bob.

[waiting list]: https://boblee.typeform.com/to/oR9Nt2

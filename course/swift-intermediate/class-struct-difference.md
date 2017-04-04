# Class vs Struct

## Introduction
Great to see you at lesson 8 of Part 1 Swift Fundamentals with Bob. I'm super excited. You all know, and you should by now, that there is no inheritance in Structs. Right? Okay, anything else? Sure, there is. Let's find out.

## Problem
  1. What's the difference besides inheritance?
  2. When to use Structs over Classes?

### Create Class
```swift
class HumanClass {
  var name: String
  init(name: String) {
    self.name = name
  }
}
```

#### Create Class Instance
```swift
var humanClassObject = HumanClass(name: "Bob")
humanClassObject.name
```

Create an instance that has a reference to `humanClassObject`

```swift
let newHumanClassObject = humanClassObject
```

Change the `name` property of `humanClassObject` to "Bobby". Then, the name property of `newHumanClassObject` will be also changed to "Bobby".

```swift
humanClassObject.name = "Bobby"
newHumanClassObject.name // "Bobby"
```

### Create Struct
```swift
struct HumanStruct {
  var name: String
  init(name: String) {
    self.name = name
  }
}
```
#### Create Struct Object

```swift
var structObject = HumanStruct(name: "Bob")
let newStructObject = structObject
```

Change the name property of `structObject` to "Bobby". However, it has no effect on `newStructObject.name` because `newStructObject` is no relationship between the two objects.

```swift
structObject.name = "Bobby"
newStructObject.name // "Bob"
```

<img src="/course/swift-intermediate/assets/refernece-value-type-difference.png" alt="The difference in value type and reference type"/>


## One Difference in Mutability

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

// bobStruct.name = "Bob Lee"
// Error: Immutable
```

In structs, when an instance is created with a constant, `let`, it's not possible to mutate its property because the instance has its own copy and the `let` protects anyone from interfering with its own instance.

### When to use Struct/Value Type?
 - 100,000 - 1,000,000 faster than Class
 - No mutability due to no relationship between objects
 - Avoid subclassing if you can to prevent any further headache.

### Resources
You may take a look at why Object Oriented Programming isn't the best option. You don't have to read the entire article. since you will learn about Protocol Oriented Swift in Chapter 4.

[Intro to Protocol Oriented Programming](https://medium.com/ios-geek-community/introduction-to-protocol-oriented-programming-in-swift-b358fe4974f#.nyah1q3fo)


### Source Code
[1008_class_struct_difference.playground]

[1008_class_struct_difference.playground]:https://www.dropbox.com/sh/der2imu4z41c7nr/AAAaLyZhh4jJLe-_oQFPFGmxa?dl=0 

## Conclusion
You've learned the fundamental difference in how memory is managed when an object is created either through classes or structs. You've learned the difference between reference type and value type. At this point, you might feel as if there is no point of learning the difference. You are right, when you are creating small apps, it doesn't really matter. But, once you start to have a complex structure, that's when you truly see how OOP can be difficult to manage as you've seen the diagram of the UIKIt Structure created by Apple engineers. ]

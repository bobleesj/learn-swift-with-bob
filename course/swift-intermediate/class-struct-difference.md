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

### When to use Struct/Value Type?
 - 100,000 - 1,000,000 faster than Class
 - No mutability due to no relationship between objects

### Resources
You may take a look at why Object Oriented Programming isn't the best option. You don't have to read the entire article. We are going to cover Protocol Oriented Programming in Chapter 4.

[Intro to Protocol Oriented Programming](https://medium.com/ios-geek-community/introduction-to-protocol-oriented-programming-in-swift-b358fe4974f#.nyah1q3fo)


### Source Code
[1108_Class vs Struct](https://www.dropbox.com/sh/eiy1yqq1em7f4n5/AABWZr6yNX8OCzrinGSaUXMfa?dl=0)


## Conclusion
You've learned the fundamental difference in how memory is managed when an object is created either through classes or structs. You've learned the difference between reference type and value type. At this point, you might feel as if there is no point of learning the difference. You are right, when you are creating small apps, it doesn't really matter. But, once you start to have a complex structure, that's when you truly see how OOP can be difficult to manage as you've seen the diagram of the UIKIt Structure created by Apple engineers. In Part 3 of this course, I hope to talk more why I prefer using value type over reference type.

#### Stay Connected
I focus on building a long-term relationship with you. Feel free to follow on my social media for personal updates and engagement. You may see what my daily activity is like on Instagram.  

<p>
<a href="http://bobthedeveloper.io"><img src="https://img.shields.io/badge/Personal-Website-333333.svg"></a>
<a href="https://facebook.com/bobthedeveloper"><img src="https://img.shields.io/badge/Facebook-Like-3B5998.svg"></a> <a href="https://youtube.com/bobthedeveloper"><img src="https://img.shields.io/badge/YouTube-Subscribe-CE1312.svg"</a> <a href="https://twitter.com/bobleesj"><img src="https://img.shields.io/badge/Twitter-Follow-55ACEE.svg"></a> <a href="https://instagram.com/bobthedev
"><img src="https://img.shields.io/badge/Instagram-Follow-BB2F92.svg"></a> <a href="https://linkedin.com/in/bobleesj"><img src= "https://img.shields.io/badge/LinkedIn-Connect-0077B5.svg"></a>
<a href="https://medium.com/@bobleesj"><img src="https://img.shields.io/badge/Medium-Read-00AB6C.svg"/></a>
</p>

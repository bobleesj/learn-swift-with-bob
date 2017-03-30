# Type Casting

## Introduction
Welcome back to lesson 4 of Part 1 the Swift Fundamentals with Bob. you must be tired of seeing these `!`s and `?`s since Lesson 1. But you know what, You've got to get through it. It is absolutely necessary for you to distinguish every situation when you use those two symbols. There is no excuse for it. In this lesson, you are going to learn how to convert types in objects that are created with classes. I don't think I need to talk to much. Let's learn by doing it.


## Problem
How do you distinguish between as, as?, as! ?

Why does Xcode keep telling me what to do?

### Type Casting from UIKit
You've probably seen something like this.
```swift
import UIKit
let label = UILabel() as UIView
```
You've got to know what just happened. Let's figure out with me.

### Human Class
Design a class called, `Human` that contains a single method.

```swift
class Human {
  func introduce() {
    print("Hi, I'm a human")
  }
}
```

### Human Subclass
Design `Korean` and `Japanese` that inherit from the `Human` class.

```swift
class Korean: Human {
  func singGangNamStyle() {
    print("Oppa Gangnam Style")
  }
}

class Japanese: Human {
  func doNinja() {
    print("Shhh.....")
  }
}
```

#### Check
```swift
let bob = Korean()
bob.introduce()
bob.singGangNamStyle()
```

### Type Casting
Now, you may want to convert `Korean` to `Human` or `Human` to `Korea`. There are two ways: upcasting and downcasting.

#### Upcasting
Upcasting is all about going to its base/super class. Imagine the UIKIt class structure. If you may upcast `UILable` to `UIView`. To upcast, use `as`.

```swift
let newBob = bob as Human  // Korean -> Human
newBob.introduce()
newBob.singGangNamStyle() // Does not exist
```

#### Upcasting Example in Swift
```swift
var name = "Bob" as Any
var number = 20 as Any
var anyArray = [name, number] // [Any]
```


#### Downcasting
Downcasting the opposite of upcasting. Downcasting may fail. As a result, you may as force downcasting or implicit downcasting.

#### Force Downcasting (!)
It does not return an optional type but it fails, crashes.

```swift
// Force Downcasting
let newValue = anyArray[0] as! String
```
> Downcasting only applies when you upcast first.

#### Safe Downcasting (?)
 It returns an optional type. If downcasting fails, returns `nil`.

```swift
// Implicit Downcasting (safety)
let newNewValue = anyArray[0] as? Int
```

### Type Casting in Practice

#### Create Instances

```swift
let shion = Japanese()
let lee = Korean()
let kenji = Japanese()
let park = Korean()
```

#### Group
Explicit upcasting
```swift
 let humans: [Human] = [shion as Human, lee as Human, kenji as Human, park as Human]
```

Upcasting inferred
```swift
let humans: [Human] = [shion, lee, kenji, park]
```

#### Call Method in Element
```swift
for human in humans {

  if let korean = human as? Korean {
    korean.singGangNamStyle()
  }

  if let japanese = human as? Japanese {
    japanese.doNinja()
  }

}
```

### Source Code


### Resources
If you are still confused with type casting, feel free to watch my YouTube video I posted earlier.

[The Complete Swift 3 Tutorials with Bob: Type Casting (YouTube)](https://www.youtube.com/watch?v=A2M5sIXFNbg&t=12s)



## Conclusion
Great job, if you've understood what type casting is finally. It is somewhat similar to optionals, right? You've learn two ways convert types. One is upcasting with `as`, which always works because you are going up to super class and you getting rid of properties and methods.You've also learned downcasting which converts  object to more specifc classes. However, as you've seen it may work and may not work. Therefore you use either `as?`to safely convert or `as!` to force convert. In Part 2, you will find out how type casting is used to groups UI objects. I know you are excited. In our next lesson, we are going to deal with another `?` and `!`. It's going to be the last one, and you will no longer have to fear those red signs on the left. Let's keep learning.

# Subscripts

## Introduction
Welcome back to lesson 7 of The Swift Fundamentals with Bob. What if I told you that you may create a shortcut? I know it sounds abstract. Let's learn more.

## Problem
I'd love to have a shortcut instead of calling a method.

## Normal Method
Create a class called, `HelloKitty` which contains a method that returns a string value.

```swift
struct HelloKitty {
  func saySomething() -> String {
    return "I'm Cute"
  }
}
```

Create an instance and call `saySomething()`
```swift
let babe = HelloKitty()
babe.saySomething()
```

## Subscripts
Subscripts provide shortcuts. It is analogous to creating a method but without a name.

```swift

struct WeekDays {
  var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]

  subscript(index: Int) -> String {
    return days[index]
  }  
}
```

### Shortcut

Call the subscript by entering `[]`.
```swift
let myDays = WeekDays()

myDays[0]  // "Monday"
myDays[1]  // "Tuesday"
```

## Dictionary
When you access elements in a dictionary, it always returns an optional type.

```swift
var info = ["Height": 183, "Body Fat": 12.5, "Weight": 76]

let height = info["Height"] // height is an optional string
```

## Artificial Dictionary Subscript
Access element without returning an optional type
```swift
struct HealthInfo {
  var info = ["Height": 183, "Body Fat": 12.5, "Weight": 76]

  subscript(key: String) -> Double {
    if let newInfo = info[key] {
      return newInfo
    } else {
      return 0
    }
  }

}
```
### Access Elements
Return normal type

```swift
let bob = HealthInfo()
bob["Height"]         // 183
bob["Body Fat"]        // 12.5
bob["123456789"]       // 0
```

## Shortcoming of Subscript
No Context means = ☠️

### Resources

### Source Code
[1107_subscripts.playground]

[1107_subscripts.playground]: https://www.dropbox.com/sh/mrrmaocche40bye/AADQlKE45soQzf48J1MEK1V3a?dl=0


## Conclusion
Great, now you know what I meant by creating a shortcut. However, subscripts can be quite misleading because there is no name to it. As a result, it might create massive confusion if you work with someone else. So make sure, don't use it too often. Sometimes, it might be better for you to use a property or a method for clarity.

Swift engineers recommend that, brevity is not the worthwhile goal. Communication is important because a programming language is not only a way humans talk to computers, but also between us, humans.

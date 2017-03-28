# Subscripts

## Introduction
Welcome back to lesson 7 of Part 1 the Swift Fundamentals with Bob. What if I told you right now that you can create a shortcut? I know it sounds super super abstract. But, I will walk you through. I know you guys trust me more than any. Let's dive into it.

## Problem
I want a shortcut instead of calling a method.

### Normal Method
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

### Subscripts
Subscripts provide shortcuts. It is analogous to creating a method but without a name.

```swift

struct WeekDays {
  var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]

  subscript(index: Int) -> String {
    return days[index]
  }  
}
```

#### Access Shortcut

Call the subscript by entering `[]`.
```swift
let myDays = WeekDays()

myDays[0]  // "Monday"
myDays[1]  // "Tuesday"
```

### Dictionary
When you access elements in a dictionary, it always returns an optional type.

```swift
var info = ["Height": 183, "Body Fat": 12.5, "Weight": 76]

let height = info["Height"] // height is an optional string
```

### Artificial Dictionary Subscript
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
#### Access Elements
Return normal type

```swift
let bob = HealthInfo()
bob["Height"]         // 183
bob["Body Fat"]        // 12.5
bob["123456789"]       // 0
```

### Shortcoming of Subscript
No Context means ☠️

### Resources

### Source Code
[1107_Subscripts](https://www.dropbox.com/sh/hqjvfrlf6ha2kqz/AAANCaEigEMbbckdHgOSPr3da?dl=0)


## Conclusion
Great, now you know what I meant by creating a shortcut. However, subscripts can be quite misleading because there is no name to it. As a result, it might create massive confusion if you work with someone else. So make sure, don't use it too often. Sometimes, it might be better for you to use a property or a method for clarity.

An Apple engineering once said, brevity is not the worthwhile goal. Communication is important because a programming language is not only a way humans talk to computers, but also between us, humans. Clear communication trumps all.

#### Stay Connected
I focus on building a long-term relationship with you. Feel free to follow on my social media for personal updates and engagement. You may see what my daily activity is like on Instagram.  

<p>
<a href="http://bobthedeveloper.io"><img src="https://img.shields.io/badge/Personal-Website-333333.svg"></a>
<a href="https://facebook.com/bobthedeveloper"><img src="https://img.shields.io/badge/Facebook-Like-3B5998.svg"></a> <a href="https://youtube.com/bobthedeveloper"><img src="https://img.shields.io/badge/YouTube-Subscribe-CE1312.svg"</a> <a href="https://twitter.com/bobleesj"><img src="https://img.shields.io/badge/Twitter-Follow-55ACEE.svg"></a> <a href="https://instagram.com/bobthedev
"><img src="https://img.shields.io/badge/Instagram-Follow-BB2F92.svg"></a> <a href="https://linkedin.com/in/bobleesj"><img src= "https://img.shields.io/badge/LinkedIn-Connect-0077B5.svg"></a>
<a href="https://medium.com/@bobleesj"><img src="https://img.shields.io/badge/Medium-Read-00AB6C.svg"/></a>
</p>

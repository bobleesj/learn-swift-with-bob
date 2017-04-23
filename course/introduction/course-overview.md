# Course Overview

## Prerequisites
To maximize your learning, you should be familiar with the following Swift syntax.

## Swift Fundamentals

### For-In Loops
```swift
for _ in 1...100 {
  print("Repeat")
}

// "Repeat"
// "Repeat"
// ...
```

### Switch Statement
```swift
switch number {
case 1...10 :
  print("Your number is between 1 to 10")
default:
  print("I don't know")
}
```

### Var vs Let
```swift
let imuttableName = "Bob"
var muttableName = "Bobby"

imuttableName = "SangJoon" // Error
```

### Else-If Statement
```swift
if isBobHansome {
  print("He good")
} else {
  print("That's okay")
}
```

### Types
```swift
let string = "String"
let bool = true
let double = 20.0
let int = 20
```

### Array and Dictionary
```swift
let countries = ["S.Korea", "USA", "Vietnam", "Malaysia"]
let info = ["Height": 183, "Age": 20]
```

### Function
```swift
func returnName() -> String {
  return "Bob the Developer"
}
```

### Basic Operators
```swift
1 + 1
3 / 2
2 * 4
9 % 5
```

### Intro to Enums
```swift
enum Race: String {
  case asian
  case white
  case black
  case hispanic
}

Race.asian.rawValue // "asian"
```

## Object Oriented Programming
You should be familiar with initialization, property, method, and inheritance

```swift
 class Human {
   let name: String

   init(enterName: String) {
     name = enterName
   }

   func sayName() {
     print("Hi, I'm \(name)")
   }

 }
```

If you are not confident with any of those topics above, you may watch my videos I've for complete beginners below on YouTube. Remember, this course is designed for those have played around with Swift and iOS.

[The Complete Swift 3 Beginner's Tutorial with Bob](https://www.youtube.com/playlist?list=PL8btZwalbjYlRZh8Q1VK80Ly0YsZ7PZxx)

## The Goal
It is to come out coding in a different playing field. Understand what makes Swift unique from other languages. You will learn every possible `?` `!` and the Swift way such as Error Handling, enum oriented programming, and intro to functional programming. Focus on value types over reference types. Learn how to manage memory so that your app takes up the least amount of space when running. 

## Course Expectation
Based on the Stack Overflow survey in 2016, Swift is considered as the second most loved language out of thousands. However, don't let its readability and hype fool you. It's a complex language inspired by many programming languages out there. In fact, you will suffer, and I want it that way. Let me explain.

### Be Skeptical
I’m a biased human being. I hope you do not trust me all the way. 😅 If you spot any practices that raise your eyebrows, make sure challenge me and come up with a better solution. Although I try to prevent that from happening through doing my homework, I encourage you to think outside of the box.

### Be Proactive
You might have seen those red error messages on the left side. I expect you to figure out and search what the issue is. Copy and paste the error message on Google. Ask me questions. Do whatever it takes. Do not move on without knowing the cause and how you could prevent them from occurring.
I mentioned that learning is done by you, not me. I’m here to teach you how to catch fish. I’m going to show you how to use nets and fish rods. After this course, you are expected to use those tools on your own. You might cut yourself through sharp edges, but it's just a part of your learning journey and becoming a stronger version of yourself.


## Ideal Learning Stage
| Step | Detail |
| --- | --- |
| The Why | Each lesson should flow like a story. In the beginning, I start off with a problem statement. It consists of doubts and questions I personally encountered. For example, I would ask, what's the purpose of using optionals? A problem statement organically leads to why we learn such materials and features
| Application | After having gone through the specific problem statement by showing new features and how to use them, I present how it applies to real-life situations.
| Resources | I attach additional resources for you to study more. You may go further on your own.
| Visualization | It's your turn. I don't believe in practice problems. We no longer live in a world where there are fixed answers. You visualize how the feature you've learned can be applicable for your future endeavor. Albert Einstein said, "Imagination is more important than knowledge". Practice problems turn you into a machine. We have more than enough in 2017, by the current education system.
| Test |  It's time to put your visualization into practice. You should fail. That's good. You are trying something new. "Failure is an option here. If things are not failing, you are not innovating enough" - Elon Musk





#### Source code
[0002_Prerequisites](https://www.dropbox.com/sh/33thop7ornp9u90/AACA-JPFoW3ie4EAW56-WZH2a?dl=0)

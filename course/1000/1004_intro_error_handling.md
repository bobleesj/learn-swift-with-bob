# Error Handling

## Introduction
Welcome to Lesson 5 of Part 1: Swift Intermediates with Bob. In this lesson, you are going to learn how to write modular and more explicit code to indicate an error message instead of using a bloated, nested,  `else-if` statement. Let's dive into it.

## Problem
1. How do you warn your co-workers this function can result unexpected outcomes?
2. What is `do-try` block?
3. How do you distinguish `try?`, `try!`, and `try`?

### Problem with Else-If alone
1. Bloated Function
2. Modularity

Create a program for a roller coaster height limit
```swift
func checkHeight(height: Int) {
  if height > 200 {
    print("You are going to hit your head and fall off")
    // Take him/her off from the ride
    // Code ...
    // Seatbeat Tighten

  } else if height < 140 {
    print("You might fly in the air")
    // Take him/her off from the ride
    // Code ...

  } else {
    print("Enjoy")
    // Take him/her to the ride
    // Code ...
  }
}
```

### Error Handling
Error Handling is just additional way to write an `else-if` statement to deal with error messages

#### Design Error
Create an enum that conforms to `Error` protocol. Determine a few cases.  

```swift
// Design Error
enum HeightError: Error {
  case maxHeight
  case minHeight
}
```

#### Design Throwable Function
Create a function that can throw errors by inserting `throws` at the end of the function parameter.

```swift
func checkHeightError(height: Int) throws {
  if height > 200 {
    throw HeightError.maxHeight
  } else if height < 140 {
    throw HeightError.minHeight
  } else {
    print("Enjoy your ride")
  }
}
```

#### Call and Handle Error
To call a function that contains `throws`, run the function block by inserting `try` in front of the function within a `do` block. A `catch` block is used to recognize and handle error thrown by the function.

```swift
do {
  try checkHeightError(height: 240)
} catch HeightError.maxHeight {
  print("Get out of here")
  // Logic
} catch HeightError.minHeight {
  print("Too short to ride")
}
 ```

### Error Handling to Object Initialization
Error handling not only applies to functions, but also objects.

#### Design Error
```swift
enum NameError: Error {
  case noName
}
```

#### Design Throwable Class
When the user enters an empty string when initializing, the init method throws `NameError.noName`.
```swift
class Course {
  var name: String

  init(name: String) throws {
    if name == "" {
      throw NameError.noName
    } else {
      self.name = name
      print("You've created an object!")
    }
  }
}
```

> Create an object using `try` within `do`.

#### Init and Handle Error
```swift
do {
  let myCourse = try Course(name: "")
} catch NameError.noName {
  print("Please make sure put something")
  // Logic
}
```

### try? vs try!
`try` is only used within a `do-catch` block. However, `try?` and `try!` can be used without it. In other words, you can only call a method or init, without handling error.

#### try?
It returns an optional value if it is used for init. If it throws an error, the result will be `nil`.

```swift
let newCourse = try? Course(name: "Bob the Dev") // returns Course?
let newDopeCourse = try? Course(name: "") // nil
```

#### try!
It will return a normal type if is used for init. If a method/init throws an error, it will crash.

```swift
// try!
let myNewCourse = try! Course(name: "Bobby Lee")
// let myDopeNewCourse = try! Course(name: "")
```

### Source Code
[1105_Error Handling](https://www.dropbox.com/sh/r1axtorwrjdr4a4/AACXvFONcrqDb6ZnuBW9xaHqa?dl=0)

### Resources
[Intro to Error Handling (Blog)](https://goo.gl/EaepCa)

## Conclusion
In this lesson, you've learned the motivation for using the Swift Error Handling syntax such as `catch`, `do`, and `try` instead of writing a `else-if` statement to handle unexpected outcomes. You've also learned the differences between `try`, `try?`, and `try!`. You can only use `try` when you use it within a `do` block. However, if you don't care about catching errors that are thrown, you may use `try?` and `try!`. But make sure you never use `!` because it can crash at any time.

That's it guys. we've covered the entire `!`s and `?`s that appear in Swift such as `type casting`, `error handling`, `optionals`, and `optional chaining`. I'm so proud of how much you've come, and you will find out how these Swift concepts play major roles in Part 2 of the course and, of course, Part 3. In the next lesson, we will how make to ourselves dry. In other words, we are going to prevent us from repeating ourselves.


#### Stay Connected
I focus on building a long-term relationship with you. Feel free to follow on my social media for personal updates and engagement. You may see what my daily activity is like on Instagram.  

<p>
<a href="http://bobthedeveloper.io"><img src="https://img.shields.io/badge/Personal-Website-333333.svg"></a>
<a href="https://facebook.com/bobthedeveloper"><img src="https://img.shields.io/badge/Facebook-Like-3B5998.svg"></a> <a href="https://youtube.com/bobthedeveloper"><img src="https://img.shields.io/badge/YouTube-Subscribe-CE1312.svg"</a> <a href="https://twitter.com/bobleesj"><img src="https://img.shields.io/badge/Twitter-Follow-55ACEE.svg"></a> <a href="https://instagram.com/bobthedev
"><img src="https://img.shields.io/badge/Instagram-Follow-BB2F92.svg"></a> <a href="https://linkedin.com/in/bobleesj"><img src= "https://img.shields.io/badge/LinkedIn-Connect-0077B5.svg"></a>
<a href="https://medium.com/@bobleesj"><img src="https://img.shields.io/badge/Medium-Read-00AB6C.svg"/></a>
</p>

# Error Handling

## Introduction
Welcome to Lesson 4: Error Handling. If I remember correctly, Error handling came across as daunting because I thought I had to be a professional debugger to fully utilize the feature. So, I avoided this topic for a while. But, I've noticed, it's nothing more than writing an `else-if` statement to deal with an error message. However, the large difference is that the Swift Error Handling allows you to write cleaner, modular, and readable code. Let's dive into it.

## Problem
1. How do you warn your co-workers the function may result unexpected outcomes?
2. What is `do-try` block?
3. How do you distinguish `try?`, `try!`, and `try`?

### Problem with Else-If alone
1. Bloated Function
2. Lack Modularity
3. Uncertainty

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
Error handling not only applies to functions, but also initialization.

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

#### Init and Handle Error
Create an object using `try` within `do`.

```swift
do {
  let myCourse = try Course(name: "")
} catch NameError.noName {
  print("Please make sure put something")
  // Logic
}
```

### Distinguish Between `try?`, `try!`, and `try`
`try` is only used within a `do-catch` block. However, `try?` and `try!` can be used without it. In other words, you may call throwable method or init without handling error.

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


### Resources
[Intro to Error Handling by Bob the Developer](https://goo.gl/EaepCa)

## Conclusion
In this lesson, you've learned the reason behind the Swift Error Handling syntax such as `catch`, `do`, and `try`. You've also learned the differences between `try`, `try?`, and `try!`. You can only use `try` when you use it within a `do` block. However, if you don't care about catching errors that are thrown, you may use `try?` and `try!`. Again, avoid using`!` since it may crash at any time.

In the next lesson, you will learn the final usage of `!` and `?` in the Swift programming language through `type casting`which allows you to convert types that are made with classes. 🤔 In fact, you've been using a for a while. Let's learn more.

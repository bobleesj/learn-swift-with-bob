# Error Handling

## Introduction
Welcome to Lesson 4. Error Handling came across as daunting. I thought I had to be a professional debugger to fully utilize the feature. However,  I've soon discovered, it's nothing more than writing an `else-if` statement to deal with an error message block. The difference is the Swift Error Handling allows you to write cleaner, modular, and readable code. Let's dive into it.

## Problem
1. How do you warn your co-workers the function may result unexpected outcomes?
2. What is a `do-try` block?
3. How do you distinguish between `try?`, `try!`, and `try`?


## Design Safety Feature
Determine who may ride the roller coaster.
```swift
func checkHeight(height: Int) {
  if height > 200 {
    print("You are going to hit your head and fall off")
    // Take him/her off from the ride
    // Code ...
    // Seatbelt tighten

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

### Problem with Else-If alone
1. Bloated Function
2. Lack Modularity
3. Uncertainty

## Error Handling
Error Handling is just additional way to write an `else-if` statement to deal with error messages

### Design Error
Create an enum that conforms to `Error` protocol. Determine a few cases.  

```swift
enum HeightError: Error {
  case maxHeight
  case minHeight
}
```

### Design Throwable Function
Create a function that can throw/return errors by inserting `throws` at the end of the function parameter.

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

### Call and Handle Error
To call a function that contains `throws`, the function requires `try` within a `do` block. A `catch` block is used to recognize and the error thrown by the function. If there is no error thrown, the `catch` block is ignored.

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

## Error Handling with Object Initialization

### Design Error

```swift
enum NameError: Error {
  case noName
}
```

### Design Throwable Class
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

### Initialize and Handle Error
Create an object using `try` within a `do-catch` block.

```swift
do {
  let myCourse = try Course(name: "")
} catch NameError.noName {
  print("Please make sure put something")
  // Logic
}
```

## Distinguish Between `try?`, `try!`, and `try`
`try` is only used within a `do-catch` block. However, `try?` and `try!` can be used without it.

### try?
It returns an optional value. If it throws an error, the result will be `nil`.

```swift
let newCourse = try? Course(name: "Bob the Dev") // returns Course?
let newDopeCourse = try? Course(name: "") // nil
```

### try!
It returns a normal type. If a method/init throws an error, it will crash.

```swift
let myNewCourse = try! Course(name: "Bobby Lee") // 👍
let myDopeNewCourse = try! Course(name: "") // ☠️
```

### Source Code
[1004_intro_error_handling.playground](https://www.dropbox.com/sh/kiib6lgy1xa7lww/AAANnWweDDT_KB4-hFJEB9taa?dl=0)

### Resources
If you wish to review or get a better understanding, you may read <br>
[Intro to Error Handling by Bob the Developer](https://goo.gl/EaepCa)

## Conclusion
In this lesson, you've learned the Swift Error Handling syntax such as `catch`, `do`, and `try`. You've also learned the differences between `try`, `try?`, and `try!`. You can only use `try` within a `do-catch` block. However, if you do not mind catching the error thrown, you may use `try?` and `try!` alone. Again, avoid using`!` since it may crash at any time.

In the next lesson, you will learn the final usage of `!` and `?` in the Swift Programming Language through `type casting`which allows you to convert types that are made with classes. 🤔

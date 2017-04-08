# Property Observer

## Introduction
Welcome to Lesson 6 of The UIKIt Fundamentals with Bob, Part 1 Object Oriented Programming. You are going to learn how to put a tracker to a property. For example, never mind. Let's just do it.

## Problem
How can I add observer/tracker to a property?

### willSet and didSet
  1. `willSet` is called just before the value is set
  2. `didSet` is called immediately after the new value is set.

### Create Step Counter
Create a variable called, `totalSteps`. When the variable encounters a new value, you may notify the user that the value has been changed. In the `willSet` block, `newTotalSteps` refers to the new value stored. In the `didSet` block, `oldValue` refers to the previous value before `totalSteps` encounters a new value.

## Grade Tracker
```swift
var myGrade: Int = 80 {
  willSet(newGrade) {
    print("About to change your grade to \(newGrade)")
  }
  didSet {
    print("Your grade has been changed")
    print("you had \(oldValue) previously. Now you have \(myGrade)")
  }
}

myGrade = 100
```

## Step Counter
```swift
var totalSteps: Int = 20 {
  willSet(newTotalSteps) {
    print("About to set totalSteps to \(newTotalSteps)")
  }
  didSet {
    if totalSteps > oldValue  {
      print("Added \(totalSteps - oldValue) steps")
    }
  }
}

totalSteps = 60
```

### Application
You may notify the user or change background color once the user successfully logs in to the apps.

```swift
var userLoginInfo: Bool = false {
  willSet(newValue) {
    print("The user has tried something")
  }
  didSet {
    if userLoginInfo {
      print("The user has switched from \(oldValue) to \(userLoginInfo)")
      // Backgroud color
      // Animation
      // Pop Up
      // All kinds of stuff
  }
 }
}

userLoginInfo = true
// The user has tried something
// The user has switched from false to true
userLoginInfo = true
// The user has tried something
// The user has switched from true to true
```

### Similarity with Computed Property
 - Always recalculated

### What makes Property Observers different
 - There is a default value and it is observed rather than calculated.
 - `willSet` and `didSet` will not get called when you initialize it.

### Source Code
[2003_property_observers.playground](https://www.dropbox.com/sh/tfvmjjrppvy0g01/AABB5kYVgf6ImcptnOvQ53VGa?dl=0)

## Conclusion
Great! The whole purpose of using property observer is to write less code but provide greater readability. You don't have to create a function with a switch or else-if statement. As you've seen there are ways ways to check whether user has been logged or not, computed property for me works great because it provides a separate block of code with distinct keywords such as `didSet` and `willSet`.

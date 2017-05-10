# Property Observer

## Introduction
Welcome to Lesson 3 of Object Oriented Swift. You are going to learn how to add an observer to a property so that you may track when it is mutated or anything happens.

## Problem
How can I add observer/tracker to a property?

### willSet and didSet
  1. `willSet` is called just before the value is set
  2. `didSet` is called immediately after the new value is set to the property.


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
```

Let us modify `myGrade`.

```swift
myGrade = 100
// "About to change your grade to 100"
// "Your grade has been changed"
// "You had 80 previously. Now you have 100"
```

The `willSet` block is called before `myGrade` is set to 100. The `didSet` block runs only after. `oldValue` refers to the initial value.


## Step Counter
Create a variable called, `totalSteps`. When the variable encounters a new value, you may notify the user that the value has been changed.


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
```

```swift
totalSteps = 60
// "About to set totalSteps to 60"
// "Added 20 steps"
```

## Application
You may notify the user or change background color once the user successfully logs in to the app.

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
 - Always recalculated even if the value has not changed.

### What makes Property Observers different
 - There is a default value and it is observed rather than calculated.
 - `willSet` and `didSet` will not get called when you initialize it.

### Source Code
[2003_property_observers.playground](https://www.dropbox.com/sh/tfvmjjrppvy0g01/AABB5kYVgf6ImcptnOvQ53VGa?dl=0)

## Conclusion
The purpose of using property observers is not only to write less code but also to provide greater readability through the distinctive keywords. You no longer have to create unnecessary functions filled with `switch` or `else-if` statements. No need.

In the next lesson, you will design init methods that may return `nil` through failable initializations.

> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

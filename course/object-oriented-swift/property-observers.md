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

totalSteps = 100  
// About to set totalSteps to 100
// Added 80 steps
```
### Real Life Application
You may notify the user or change background color once the user successfully logs in to the apps.

```swift
var userLoggedIn: Bool = false {
 willSet(newValue) {
   print("The user has tried something")
 }
 didSet {
   if userLoggedIn {
     print("The user switched from \(oldValue) to \(userLoggedIn)")
   }
 }
}

userLoggedIn = false
// "The user has tried something"
userLoggedIn = true
// "The user has tried something"
// "The user switched from false to true"
```


### Source Code
[1206_Property Observer](https://www.dropbox.com/sh/icjktltawrgwmxn/AADakYCf4MubhbRBmGmvTreOa?dl=0)

## Conclusion
Great! The whole purpose of using property observer is to write less code but provide greater readability. You don't have to create a function with a switch or else-if statement. As you've seen there are ways ways to check whether user has been logged or not, computed property for me works great because it provides a separate block of code with distinct keywords such as `didSet` and `willSet`.

#### Stay Connected
If you'd like to be on my mailing list and receive personal updates on upcoming books and courses, feel free to send me an email at `bobleesj@gmail.com`
<p>
<a href="http://bobthedeveloper.io"><img src="https://img.shields.io/badge/Personal-Website-333333.svg"></a>
<a href="https://facebook.com/bobthedeveloper"><img src="https://img.shields.io/badge/Facebook-Like-3B5998.svg"></a> <a href="https://youtube.com/bobthedeveloper"><img src="https://img.shields.io/badge/YouTube-Subscribe-CE1312.svg"</a> <a href="https://twitter.com/bobleesj"><img src="https://img.shields.io/badge/Twitter-Follow-55ACEE.svg"></a> <a href="https://instagram.com/bobthedev
"><img src="https://img.shields.io/badge/Instagram-Follow-BB2F92.svg"></a> <a href="https://linkedin.com/in/bobleesj"><img src= "https://img.shields.io/badge/LinkedIn-Connect-0077B5.svg"></a>
<a href="https://medium.com/@bobleesj"><img src="https://img.shields.io/badge/Medium-Read-00AB6C.svg"/></a>
</p>

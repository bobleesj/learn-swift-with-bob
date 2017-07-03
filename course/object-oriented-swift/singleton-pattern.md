# Singleton Pattern

## Introduction
Welcome to the last lesson of Object Oriented Swift. You will learn how to create an object that exists anywhere. The object is like me. There is only one Bob. I'm omnipresent.


## Definition of Singleton
A singleton is an object which is instantiated exactly once.

## Design Class
Create a class called, `AccountManager`.  It has a `static` property with an object of the class itself.

```swift
class AccountManager {
  static let sharedInstance = AccountManager()

  var userInfo = (ID: "bobthedev", Password: 01036343984)

  // Networking: communicating server
  func network() {
    // get everything
  }

  private init() { }
}
```

> The `private`  prevents initialization outside of the `AccountManager` class. If you wish to learn more, you may read [The Complete Understanding of Access Control in Swift](https://blog.bobthedeveloper.io/the-complete-understanding-of-access-control-in-swift-3-c1c71f2add0b)

## Access Object

```swift
AccountManager.sharedInstance.userInfo
// (ID "bobthedev", Password 01036343984)

// ViewController One
AccountManager.sharedInstance.userInfo.ID // "bobthedev"

// ViewController Two
AccountManager.sharedInstance.userInfo.ID = "bobleesj"

// ViewController Three
AccountManager.sharedInstance.userInfo.ID // "bobleesj'
```

In each view controller, you have access to only one `AccountManager()`.

## Examples
The iOS ecosystem often use the singleton pattern for developers to access the universal object. A few examples include, `UIApplication`, `UserDefault`, `NSNotification`. If you wish to learn more about these classes, you may sign up for the upcoming course: [The UIKit Fundamentals with Bob](/ABOUT.md#course).

### Source Code
[2008_singleton_pattern.playground](https://www.dropbox.com/sh/dtbnd48v6b4fwah/AAC4JDS6WNe22U4qG3begJioa?dl=0)

### Resources
[The Complete Understanding of Access Control in Swift 3](https://blog.bobthedeveloper.io/the-complete-understanding-of-access-control-in-swift-3-c1c71f2add0b)

## Conclusion
You've learned the definition of `Singleton`. Again, think of me. There is only one Bob the Developer.

Often developers avoid the singleton pattern at all cost. It exists everywhere, and when you have a number of them, it becomes difficult to track. So, I'd recommend not to overuse the pattern. If you wish to know how to work with `UIApplication`, `UserDefault`, and `NSNotification` along with `Protocols`, you may sign up for the upcoming course and receive updates from me.

> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

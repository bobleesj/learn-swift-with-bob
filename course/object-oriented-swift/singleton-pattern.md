# Singleton Pattern

## Introduction

> A singleton is an object which is instantiated exactly once.

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

```swift
AccountManager.sharedInstance.userInfo
// (ID "bobthedev", Password 01036343984)
```

```swift
// ViewController One
AccountManager.sharedInstance.userInfo.ID // "bobthedev"

// ViewController Two
AccountManager.sharedInstance.userInfo.ID = "bobleesj"

// ViewController Three
AccountManager.sharedInstance.userInfo.ID // "bobleesj
```

> Example `UIApplication`, `UserDefault`, `NSNotification`.

### Source Code

[2008_singleton_pattern.playground](https://www.dropbox.com/sh/skwlaur16yxwgsf/AADHj1oFxXUovanhnIX6M86Qa?dl=0)
### Reference

## Conclusion

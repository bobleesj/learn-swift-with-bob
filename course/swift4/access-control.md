# Access Control

## Introduction
Welcome to the first lesson of What's New in Swift 4. Today, you will learn ways to prevent others from messing around with your code. You will learn the benefits of doing it and even control how much others can mess around with your code. Let's get started.

## Problem
I don't want you to use my code.

`open`, `public`, `internal`, `file-private`, `private`, who are they?


### Why is this important?
 - Reduce indexing/compilation time while building an app
 - Apple Engineers do not want developers to touch their code, sometimes
 - No need to overwhelm your teammates with unnecessary methods


### 5 Levels of Access Control
  1. `private` (Most Secure)
  2. `fileprivate`
  3. `internal`
  4. `public`
  5. `open` (Least Secure)

### Private
Only available within the scope, `{}`

#### Ex 1) Game Application
```swift
class Game {
  private var number = 0

  var score: Int {
    return number
  }

  func increaseNumberByOne() {
    number += 1
  }
}

Game().number // Error
Game().score // Good
```

#### Ex 2) Singleton
In the single pattern, there is a `private` method for initialization to prevent extra initialization.

```swift
class AccountManager {

  static let sharedInstance = AccountManager()
  var userInfo = (ID: "bobthedev", Password: 01036343984)

  private init() {} // Prevent public initialization
}
```

You are not allowed to initialize the `AccountManager` class outside the "scope" of `AccountManager`.

```swift
AccountManager() // Error
```

### Swift 4 Private Extension
Before Swift 4, it was not able to use anything that has to do with `private` even with `extension`. However, it is possible in Swift 4. For example,


```swift
class MyStatus {
  private var isHappy = true
}
```

You have access to `isHappy` within `extension`.

```swift
extension MyStatus {
  func checkStatus() {
    print(isHappy)
  }
}
```

Nice and easy


### Private Setter
There is a problem with using `private` because it is good for encasulating, but it is not accessed outside the scope at all. To prevent that from happening, we may use, `private(set)`. It states, you have access to this property/function but it can be only mutated/changed within the scope.

```swift
class Human {
  private(set) var name: String
  init(enterName: String) {
    name = enterName
  }
}

let bob = Human(enterName: "Bob Lee")
bob.name = "Bobby" // Error
```

### File Private
As the name indicates, it is only accessible within the file.  Create two files, `NewViewController.swift` and `ViewController.swift`.

```swift
// NewViewController.swift
fileprivate class NewViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }

}
```

You've declared that `NewViewController` is `fileprivate`.Let us attempt to access the class in another file.

```swift
// ViewController.swift
class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // let newViewController = NewViewController() // Error
  }

}
```

Impossible.


### Internal
Anything has to with `internal` is accessed within the same module. `intermal` is automatically applied if you do not specify one's access level. For example,

```swift
// file.swift
var name = "Bob"
internal var name = "Bob"
```

They are both identical.  

#### Understanding Module
Simply put, a module is just one Xcode project.  To be more specifc, take a look at the definition below.

> **Definition:** A module is a single unit of code distribution — a framework or application that is built and shipped as a single unit and that can be imported by another module with Swift’s import keyword.


`UIKit` is also considered as one module. When you `import` an external library as shown below,

```swift
import RandomLibraryFromGithub
```

`RandomLibraryFromGithub` is a single module. It is probably one Xcode project.

If `RandomLibraryFromGithub` contains an `internal` method as shownb below, you do not have access to the method in your project.

```swift
// RandomLibraryFromGithub.swift

funt hello() {
  print("From RandomLibraryFromGithub")
}
```
Let's attempt to import `RandomLibraryFromGithub` in your currnet project and execute `hello()`.

```swift
// Your Project

import RandomLibraryFromGithub
hello() // Error: not found
```

Not possible.

### Open
They are similar. You have access to anything that is `public` or `open` even if it is imported.

```swift
class BobbyViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    print("hello")
  }
}
```

`viewDidLoad` is a function that is marked with `open`. You even have the ability to override it.

### Public
If it is marked with `public`, you have access to it but you don't have the ability to override. For example,

```swift
// RandomLibraryFromGithub
public func A() {}
open func B() {}
```

```swift
// In your current project
override func A(){} // error
override func B(){} // success
  ```

### Summary of Access Control (low to high)
| Control | Purpose | Example |
| --- | --- | --- |
| Open | Available every where, override possible | `UICollectionView`, `UIViewController` |
| Public | Available every where, override not possible | `UICollectionViewDelegate` |
| Internal | Only available within the module | Everything you define by default |
| File-Private | Only available within the  file | items in `fileOne.swift` not available in `fileTwo.swift` |
| Private | Only available within the scope | `private` initialization in the singleton pattern |


### Resources
[9001_access_control]()

## Conclusion
In this lesson, you've learned the 5 basic levels in Access Control in Swift. Again, remember that it provides quicker compilation/indexing time, less overwhelming of your teammates, and mostly you feel nice and safe. Access control is the fundamental way Apple Engineers protect their source code that we, developers, continue to follow their way. Well, you can do the same for your teammates as well. Keep it simple and stupid.

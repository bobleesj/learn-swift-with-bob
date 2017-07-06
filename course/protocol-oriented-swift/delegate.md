# Delegate

## Introduction
Welcome to one of the most confusing topics of all time. You might have heard about the delegate pattern. Perhaps, you've seen, `tableView.delegate = self`. I've discovered a lot of developers have no idea how to explain what goes underneath. They just simply copy and paste as if it just works. In fact, I was one of them for solid 6 months when I first started learning iOS. Today, however, you are with me, Bob the Developer.

Do not worry about its vague terminology, called "delegate".  This is a pattern that is used to communicate or send data between objects that are created with classes and structs. That's it. With that in mind, let me explain this magic for you.

## Problem
How does delegate even work?

> **Purpose of Delegate:** Communicate/Pass Data between objects

In this tutorial, you will learn how to send data from `FirstVC` to `SecondVC` using the delegate pattern.

### Design Protocol
Create a protocol called, `PassDataDelegate`. It contains a method that takes `data` whose type is in `String`.

```swift
protocol PassDataDelegate {
  func passData(data: String)
}
```

### Design Delegator (Sender)
Create a class that contains an optional property whose type is `PassDataDelegate?`.

```swift
class FirstVC {
  var delegate: PassDataDelegate?
}
```

If you call the method, `passData` of the property, `delegate`, it will return `nil` since you have not initialized `delegate`.

```swift
FirstVC().delegate?.passData(data: "Bob") // nil
```

### Design Delegate (Receiver)
Create `SecondVC` that conforms to `PassDataDelegate`.  `SecondVC` must contain `passData(data: String)` due to the protocol.

```swift
class SecondVC: PassDataDelegate {
  func passData(data: String) {
    print("The CEO gave me \(data)")
  }
}
```

### Create instances
```swift
let firstVC = FirstVC()
let secondVC = SecondVC()
```

Set `firstVC.delegate` to `secondVC`. It is possible since `secondVC` conforms to `PassDataDelegate` because Swift Protocol can be used as one's type.

```swift
firstVC.delegate = secondVC
```

When you set the relationship as above, you may call the `passData` method that resides in the `secondVC` object from the `firstVC`object.

### Assign Delegate
```swift
firstVC.delegate = secondVC
firstVC.delegate?.passData(data: "A bunch of contracts")  
// "The CEO gave me a bunch of contracts"
```

In the example above, `firstVC` is calling the `passData` method and it passes `data`, called, "A bunch of contracts". When it occurs, the full implementation of the method that resides in `secondVC` get called. Thus, the `print` function is also get executed.

### UITableView in ViewController
```swift
import UIKit

class BobViewController: UIViewController, UITableViewDelegate {
  let tableView = UITableView()

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(tableView)
    // Hey BobViewController/Delegate, do something with the data I've given you
    // Download Image...
    // ...
  }
}
```

In the example above, `tableView` is the delegator/sender/CEO, while the object of  `BobViewController` is the delegate/receiver/Secretary. The method, `func tableView(_talbeView: UITableView, didSelectRowAt indexPath: IndexPath)`, is called by the `tableView`. Yet, the full implementation is executed within the `BobViewController` object.

### Source code
[4004_delegate.playground](https://www.dropbox.com/sh/s2ttgjx7yhucyyu/AAC9ROxz-_X8yKy2wxJK_QLfa?dl=0)

### Resources
[The Complete Understanding of Delegate and DataSource](https://blog.bobthedeveloper.io/the-complete-understanding-of-swift-delegate-and-data-source-9c91ecd7f1)

[Introduction to Delegate in Swift](https://blog.bobthedeveloper.io/the-meaning-of-delegate-in-swift-347eaa9674d)


## Conclusion
You've learned the delegate pattern is used to pass data between objects. In fact, you've learned how to pass data from`FirstVC` to `SecondVC` in one direction. Simply put, you've learned passing data from the CEO to the secretary. In the following lesson, you will learn that you can also send data backward, the secretary to the CEO using `data source`. You will find out.

If you have not grasped the concept of delegate, I recommend you to ask questions on Udemy, Slack, or any other platforms. I've also attached additional articles for you to take a look at. You've got to know the principle because in the next course, you will learn how this pattern is to communicate between iOS, the operating system, and us, developers.

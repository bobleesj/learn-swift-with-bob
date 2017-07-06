# Data Source
## Introduction
Welcome to the last lesson of Protocol Oriented Swift. In the previous lesson, you've learned how to pass data from the CEO to the secretary. In this lesson, you will learn how to pass data from the secretary to the CEO. Lastly, you will learn how the datasource pattern is used within the iOS ecosystem using `UITableView`.  It's not much different from the previous lesson. Let's get started.

## Problem
Can the CEO hear from the Secretary?


### Purpose
> **Purpose of Data Source:** Communicate (Backward) from SecondVC(delegate) to FirstVC(delegator)

It is also a part of the delegate pattern. Do not get caught up with the name, "data source". Just follow me along.


### Design Protocol
```swift
protocol PassDataDelegate {
  func passData(data: String) -> String
}
```

There is only one difference. The `passData` method return `String`. You will find out how everything works together.


### Design Delegator (Sender/CEO)
```swift
class FirstVC {
  var delegate: PassDataDelegate?
}

FirstVC().delegate?.passData(data: "a bunch of contracts") // nil
```


### Design Delegate (Receiver/Secretary)
```swift
class SecondVC: PassDataDelegate {
  func passData(data: String) -> String {
    print("The CEO gave me \(data)")
    return "I'm too tired..."
  }
}
```

The `SecondVC` object contains a method `passData`. Unlike the previous tutorial, the method now returns `String`.

### Create Objects
```swift
let firstVC = FirstVC()
let secondVC = SecondVC()
```
Everything is the same.

### Assign Delegate
```swift
firstVC.delegate = secondVC
```

### Execute the Method
Here is the difference.
```swift
let message = firstVC.delegate?.passData(data: "a bunch of contracts!")
print(message!) // "I'm too tired"
```

The `firstVC` object now hears "I'm too tired" which is an implementation by the `secondVC` object.

### Practical Examples in iOS
Let us find out how the `return` part is used within the iOS ecosystem.

```swift
import UIKit

class BobViewController: UIViewController, UITableViewDataSource {
  var tableView = UITableView()
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2000
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell(style: .default, reuseIdentifier: "cell")
  }
}
```
The `BobViewController` object must contains two methods which are `numberOfRowsInSection` and `cellForRowAt`. The object must return `Int` and `UITableView` to the `tableView` object. The `tableView` object then uses the data received from the `BobViewController` object to generate its UI and all sorts of things we developers have no idea since the `UIKIt` framework ain't open sourced.

### Source code
[4004_delegate.playground](https://www.dropbox.com/sh/s2ttgjx7yhucyyu/AAC9ROxz-_X8yKy2wxJK_QLfa?dl=0)

### Resources
[The Complete Understanding of Delegate and DataSource](https://blog.bobthedeveloper.io/the-complete-understanding-of-swift-delegate-and-data-source-9c91ecd7f1)

[Introduction to Delegate in Swift](https://blog.bobthedeveloper.io/the-meaning-of-delegate-in-swift-347eaa9674d)

## Conclusion
When you first started this lesson, you must have thought `data source` must be something extraordinary and difficult. Not at all. It is still a part of the delegate pattern, yet it is nothing more than a method that returns. For the naming purpose, if you think the secretary must talk to the CEO, then call the secretary as the `~datasource`. If not, just name it as `~delegate`. If you've completed understood the delegate pattern with me, great job. You are ready for the next advanced iOS course.

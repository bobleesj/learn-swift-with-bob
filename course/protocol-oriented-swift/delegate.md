# Delegate

## Introduction
Welcome to the last lesson of Protocol Oriented Swift. Passing data between classes using the delegate pattern is the fundamental way we, developers, receive information from the operating system. For instance, the user opens your app through a push notification, the iOS notifies and send information about the launch method to a class called, `AppDelegate` in which we have access to. This lesson is not about protocol oriented programming. Instead, you will utilize `protocols` to send data between classes or structs.

## Problem
Pass data between classes

> **Advice:** You just have to memorize it. It's a gift from Apple engineers. Take it. Do not question why it works. But, find out why it is useful. You might have to watch this video multiple times to get yourself comfortable.

### Design Protocol
Create a protocol called, `PassDataDelegate`. It contains a method that takes `data` whose type is in `String` and returns `String`.

```swift
protocol PassDataDelegate {
  func passData(data: String) -> String
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
Create `SecondVC` that conforms to `PassDataDelegate`.  `SecondVC` must contain `passData(data: String)`.

```swift
class SecondVC: PassDataDelegate {
  func passData(data: String) -> String {
    print("Something happened")
    return "You've entered \(data)"
  }
}
```

### Create instances
```swift
let firstVC = FirstVC()
let secondVC = SecondVC()
```

Set `firstVC.delegate` to `secondVC`. It is possible since `secondVC` conforms to `PassDataDelegate`.

```swift
firstVC.delegate = secondVC // you are sending data to classTwo
```

When you set the relationship as above, you may call a method from `firstVC` along with its custom data. You may use the data in `secondVC`.

```swift
//: Assign Delegate
firstVC.delegate = secondVC
firstVC.delegate?.passData(data: "Hello, 1231231")  
// "You've entered Hello, 1231231"
```

When the the `passData` method is called from the `firstVC`, `secondVC` contains now receives the data and may execute any lines of code.


> **Analogy:** Imagine `firstVC` is an operating system (delegator) while `secondVC` is the class (delegate) that receives information from the OS.

### Source code

[4004_delegate.playground](https://www.dropbox.com/sh/s2ttgjx7yhucyyu/AAC9ROxz-_X8yKy2wxJK_QLfa?dl=0)

### Resources
[Introduction to Delegate in Swift]

[Introduction to Delegate in Swift]: https://blog.bobthedeveloper.io/the-meaning-of-delegate-in-swift-347eaa9674d


## Conclusion
The delegate pattern is tough to describe how it exactly works because it's a tool provided by Apple engineers. As I said, it works because smart individuals have designed the feature for us so we just have to read manual and implement. If you feel uncomfortable with the setup, I recommend you to watch this video multiple times and practice on your own. You may use a real app to pass data between view controllers.

There is one more thing called, `data source`. If you wish to learn more how to create custom delegate and data source, you may join the next course, The UIKIt Fundamentals with Bob.

> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

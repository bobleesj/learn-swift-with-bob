# Delegate

## Introduction
Welcome to the last lesson of The UIKIt Fundamentals Part 1 Intro to Protocol Oriented Programming. Today, you learn the most important concept. It is not technically about protocol oriented programming. You use Protocol, but you will learn how to pass data between two classes using it. There are a lot of bullshit tutorials out there. You've come to the right place. Let me tell you the majority of people don't understand what's going on, and they simply copy off from the screen. Have you ever seen, tableView.delegate = self? What the heck is that?


## Problem
Pass Data between Classes

> You just have to memorize it. It's a gift from Apple engineers. Take it. Do not question why it works. But, find out why it is useful.You might have to watch this video multiple times

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

If you call the method, `passData` associated with the property, `delegate`, it will return `nil` since you have not initialized `delegate`.

```swift
FirstVC().delegate?.passData(data: "Bob") // nil
```

### Design Delegate (Receiver)

Create `ClassTwo` that conforms to `PassDataDelegate`.  `ClassTwo` must contain `passData(data: String)`.

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

Set `classOne.delegate` to `classTwo`. It is possible since `classTwo` conforms to `PassDataDelegate`.
```swift
classOne.delegate = classTwo // you are sending data to classTwo
```

As soon as you make the relationship like above, whenver you call a method from `firstVC`, you pass data to `secondVC` and execute the required method.

```swift
//: Assign Delegate
firstVC.delegate = secondVC
firstVC.delegate?.passData(data: "Hello, 1231231")  
// "You've entered Hello, 1231231"
```

### Source code

[4004_delegate.playground](https://www.dropbox.com/sh/j7xreau3y2kq8bo/AACG17ayoM8W8JMM3O6jbB5ya?dl=0)

### Resources
[Introduction to Delegate in Swift]

[Introduction to Delegate in Swift]: https://blog.bobthedeveloper.io/the-meaning-of-delegate-in-swift-347eaa9674d


## Conclusion
Great, how was it guys? For those who are confused, you might have to watch this video 5-10 times to get used to it. You might have to search up on Google and learn more. You might have to playaround. If you are confused by my lesson and you are not getting it, it's your fault. It took me 2 weeks to understand delegate. It's not easy. But, you just have to struggle when you are not in the comfort zone.  Struggle is virtue.

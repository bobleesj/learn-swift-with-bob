# Completion Handlers

## Introduction
Welcome to the last lesson of Intro to Functional Swift. If you've done any API calls, such as Facebook Login, you used completion handler blocks. Today, you will learn why we use them and how to design one like a pro.

## Problem
I've heard about it. I don't know how to make one

## Definition
Do something when something has been done

### Usage
  1. Notify the user when the download completed
  2. Animation

### Design Handler Block
Create a closure which will be called within a function.

```swift
let handlerBlock: (Bool) -> () = {
  if $0 {
    print("Download Completed")
  }
}

let myHandlerBlock: (Bool) -> () = { (isSuccess: Bool) in
  if isSuccess {
    print("Download has been finished")
  }
}

myHandlerBlock(true) // "Download has been finished"
```

### Design Function
Create a function that is similar to downloading an image by calling a `for-in` loop. Once the download has been finished, you may notify the user.

```swift
func downloanAnImage(completionBlock: (Bool) -> Void) {
  for _ in 1...10000 {
    print("Downloading")
  }

  completionBlock(true)
}
```

The function above takes a parameter whose type is `(Bool) -> Void`. You will pass `myHandlerBlock`.

```swift
downloanAnImage(completionBlock: myHandlerBlock)
// 1
// 2
// ...
// 10000
// "Download has been finished"
```

### Pass Closure Directly
You may pass a closure block directly when you execute the `downloadAnImage` function. Notice the trailing closure block.

```swift
downloanAnImage { (isSuccess: Bool) in
  if isSuccess {
    print("Done, bruh")
  }
}

// 1
// 2
// ...
// 10000
// "Done, bruh"
```

### Source Code
[3006_completion_handlers.playground](https://www.dropbox.com/sh/t47kpcnzuhtgni9/AAA1Yvq52s6XVOFgMLRjOPRka?dl=0)

### Resources
[Completion Handlers in Swift with Bob]

[Completion Handlers in Swift with Bob]: https://blog.bobthedeveloper.io/completion-handlers-in-swift-with-bob-6a2a1a854dc4


## Conclusion
You've learned how to notify the user when the download has been completed. Some may feel uncomfortable with the syntax. I recommend you to read the article I've attached. When you enroll the UIKIt Fundamentals with Bob, you will learn how to pass data between classes, structs, and enums. You will use  callbacks asynchronously with multi-threads to network with server. 

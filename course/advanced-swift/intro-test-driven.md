# Intro to Test Driven Swift

## Introduction
Welcome to the last lesson of Learn Swift with Bob. There are three objectives. First, you will learn why Swift seems slow when you work with playgrounds. Second, you will learn how Swift and Apple engineers send those red marks on the left side and tell you what to do. Last, you will learn how compile Swift files using Terminal only. I assume you already know how to navigate between folders using Terminal.


## Problem
 Learn how to create safe apps

## Swift Optimization
| Type | Speed | Usage |
| --- |: --- :|: --- :|
| -Onone | slow | debug |
| -O | fast | release |
| -Ounchecked | Super fast | testing |


## Assert Function
The standard Swift library come with five assertion functions:
  - assert()
  - assertionFailure()
  - precondition()
  - preconditionFailure()
  - fatalError()

## Assert
You may enter a closure block to `assert`. It returns either `true` or `false`.


```swift
assert(true) // pass
```

Let us create a function that may return `assert(false)`.

```swift
func enterName(name: String) {
  if name == "" {
    assert(false, "You must enter a full name")
  } else if name == "Bob" {
    assert(false, "There is only one Bob")
  }
}

enterName(name: "Bob")
// Error
```
Here is another example.

```swift
var expectedResult = 10
var actualResult = 10

assert(actualResult == expectedResult, "The actual result doesn't match with the expected")
```

You may use `#file` and `#line`

```swift
print("File: \(#file)")
print("Line: \(#line)")
```

## AssertionFailure
It destroys no matter what.

```swift
import Foundation
let randomNumber: Int = Int(arc4random_uniform(3))

switch randomNumber {
case 0, 1, 2:
  print(randomNumber)
default:
  assertionFailure("Unexpected index \(randomNumber)")
}
```

If `randomNumber` contains any number besides 0, 1, 2, it will crash the program.

## Precondition
It is identical to `Assert`. However, it is also called when Swift is compiled at `-0`.

```swift
let expectedNumber = (1, 3)
let actualNumber = (1, 3)

precondition(actualNumber == expectedNumber, "\(actualNumber) is not the same as \(expectedNumber)")
```

> **Note:** I don't recommend using `Precondtion` or `PreconditionFailture` since the user has no idea what the error is.


## PreconditionFailure
Identical as `AssertionFailure`. It is called during `-O`.

## FatalError
It is useful for terminating an app no matter what.

```swift
let number: Int = Int(arc4random_uniform(100))

func enterNumberReturnString(index: Int) -> String {
  switch index {
  case 0, 1, 2:
    return "\(number)"
  default:
//    assertionFailure("Unexpected index \(number)")
//    abort()
    fatalError("Unexpected index \(number)")
  }
}
```

> `@noreturn`, the compiler confirms that the marked function will not return. The application would terminate instead.


| | Debug (Onone) | Release (O) |	Test (Ounchecked) |
| --- | --- | --- | --- |
| assert() |	YES	| NO	| NO |
| assertionFailure() |	YES |	NO |	NO|
| precondition() |	YES	| YES	| NO |
| preconditionFailure() |	YES |	YES	| YES|
| fatalError() |	YES	| YES |	YES |

> **Note:** `YES` - is for termination.


### Source Code
[8006_intro_test_driven.playground](https://www.dropbox.com/sh/50zf77pdviz3z7l/AAAA3lvpzwmqad9ure9T9wCoa?dl=0)


### Reference
[Swift Assertions - Andy Bargh](https://andybargh.com/swift-assertions/)

[Swift asserts - the missing manual by Marcin Krzyżanowski](http://blog.krzyzanowskim.com/2015/03/09/swift-asserts-the-missing-manual/)

[Optimizing Swift Performance](https://developer.apple.com/videos/play/wwdc2015/409/)

[Apple: Optimization Tips](https://github.com/apple/swift/blob/master/docs/OptimizationTips.rst)


## Conclusion
You've completed the objectives. You've learned the three ways to compile Swift files. You've learned how to make your program crash so that you are able to guarantee that the entire app should work if it passes. However, as the title indicates, this is an intro to test driven development. You may join my mailing list to sign up for the upcoming courses. See you in the final video of Learn Swift with Bob.

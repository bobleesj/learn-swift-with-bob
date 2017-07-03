# Sequence and IteratorProtocol

## Introduction
Welcome to Lesson 5 of Advanced Swift. When it comes to learning new features, I've been using the microwave analogy that things just work because smart engineers have designed them. But, there are times you might have to create your own custom microwave. For example, you might want to create one for yourself during the winter because it's hard to code with frozen fingers. Then, you've got know all. In this lesson, let's find out the secret behind the Swift `for-in` loop and learn how to create our own custom types that have the magic.

## Problem
What goes under the hood of a `for-in` loop.

## Take For Granted
When you first learned Swift or other programming languages, you've probably used the feature below without giving a second thought. (I didn't)

```swift
let iOSSkills = ["Swift", "UIKIt", "RxSwift", "TDD"]
for skill in iOSSkills {
  print(skill)
}
// Prints "Swift"
// Prints "UIKIt"
// Prints "RxSwift"
// Prints ""TDD""
```

Let us convert a `String` value into `CharacterView` and loop each character.

```swift
for character in ("Bob the Developer").characters {
  print(character)
}
// "B"
// "o"
// "b"
// ...
// "r"
```

> **Important:** The Swift `for-in` loop exists since `Array<String>` and `CharacterView` both conforms to `Sequence` and `IteratorProtocol`.

### Behind the Scene
First, the `iOSSkill`, whose type is `Array<String>` conforms to `Sequence`, has the required method, `makeIterator`. The method returns an object that conforms to `IteratorProtocol`. The returned object has a required method called, `next()` which returns the next element with an optional type.

```swift
var skillIterator = iOSSkills.makeIterator()

while let skill = skillIterator.next() {
  print(skill)
}

// Prints "Swift"
// Prints "UIKIt"
// Prints "RxSwift"
// Prints ""TDD""
```

It also applies to `Array<Int>`.

```swift
let numbers = [2, 3, 5, 7]
var numbersIterator = numbers.makeIterator()

numbersIterator.next()
numbersIterator.next()
numbersIterator.next() // Optional(5)
numbersIterator.next()
numbersIterator.next()
numbersIterator.next()
```

## Custom Type

### Sequence Protocol
Let us create our own struct that conforms to `Sequence`.  The struct is called, `MyCountdown`. The struct has the required method, `makeIterator`. The method returns an object that conforms to `ProtocolIterator`.

```swift
struct MyCountdown: Sequence {
  let start: Int

  func makeIterator() -> CountdownIterator {
    return CountdownIterator(self)
  }
}
```


### IteratorProtocol
Let us create a struct, `CountdownIterator` that conforms to `IteratorProtocol`.  The struct contains the required method, `next()` which returns an element.


```swift
struct CountdownIterator: IteratorProtocol {
  let countdown: MyCountdown
  var times = 0

  init(_ countdown: MyCountdown) {
    self.countdown = countdown
  }

  mutating func next() -> Int? {
    let nextNumber = countdown.start - times
    guard nextNumber > 0
      else { return nil }

    times += 1
    return nextNumber
  }
}
```


### Testing
Let us find out if the `makeIterator` and `next` methods work.

```swift
var threeTwoOne = MyCountdown(start: 3)
var iterator = threeTwoOne.makeIterator()
iterator.next() // 3
iterator.next() // 2
iterator.next() // 1
```

## Magic
The `MyCountdown`. is eligible for the Swift `for-in` loop.

```swift
for count in threeTwoOne {
  print("\(count)...")
}
```
### Source Code
[8005_sequence_iterator.playground](https://www.dropbox.com/sh/v2wzlgdch6ht5u1/AADwD_4kUKxf4SF47DZi87jSa?dl=0)


### Resources
[Swift Standard Library Functions](https://developer.apple.com/reference/swift/swift_standard_library_functions?changes=latest_minor)

[Swift Change Log](https://github.com/apple/swift/blob/master/CHANGELOG.md)

[Swiftdoc.org](http://swiftdoc.org/v3.0/type/Array/hierarchy/)

### References
[API Reference - IteratorProtocol](https://developer.apple.com/reference/swift/iteratorprotocol)

[Ray Wenderlich - Building Custom Collection Swift](https://www.raywenderlich.com/139591/building-custom-collection-swift)

[Protocols in Swift by Chris Eidhof](http://chris.eidhof.nl/post/protocols-in-swift/)

[How To Conform to the Sequence Protocol - Natasha The Robot](https://www.natashatherobot.com/swift-conform-to-sequence-protocol/)


## Conclusion
First, you've learned the hidden implementation by the Swift `for-in` loop. To make types eligible for the magic, it has to conform to the `Sequence` protocol and has the required method that returns an object that conforms to `IteratorProtocol`. The iterator object also has the required method of `next()` to get the next element. The word `sequence` sounds as if types must look like a dictionary, array, or set. It doesn't have to. Again, the purpose of this lesson was not introduce you to various protocols. It was to let you know how native types conform to pre-written protocols and has added features like a `for-in` loop. If you wish to study, I recommend you to take a look at the references and read the documentation.

In the following lesson, you will learn how to execute swift files using Terminal and how Xcode sends error messages, a.k.a, the red marks.

> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

# Lazy Init with Closures

## Introduction
Welcome to Chapter 3 of Intro to Functional Swift. There are two objectives. The first is to learn how to initialize an object using a closure block. The second is to understand when, where, how, and why we use the `lazy` keyword in the Swift Programming Language.

## Problem
How to initialize an object with a closure?

## Unconventional Way
If you've followed tutorials online or looked through open source projects, it's not uncommon to initialize UI components with the following way.

```swift
import UIKit

let box: UIView = {
  let view = UIView()
  return view
}()
```

However, a lot of students fail to explain because they simply copy.

## Create UI Components
To appreciate the unconventional method, let us begin the "normal" way to create UI components programmatically.

```swift
let buttonSize = CGRect(x: 0, y: 0, width: 100, height: 100)

// ViewControllerOne
let bobButton = UIButton(frame: buttonSize)
bobButton.backgroundColor = .black
bobButton.titleLabel?.text = "Bob"
bobButton.titleLabel?.textColor = .white

// ViewControllerTwo
let bobbyButton = UIButton(frame: buttonSize)
bobbyButton.backgroundColor = .black
bobbyButton.titleLabel?.text = "Bobby"
bobbyButton.titleLabel?.textColor = .white
```

It is tedious.


## Create Button with Function
You may create a function instead.

```swift
func createButton(enterTitle: String) -> UIButton {
  let button = UIButton(frame: buttonSize)
  button.backgroundColor = .black
  button.titleLabel?.text = enterTitle
  return button
}
createButton(enterTitle: "Yoyo")
```

However, when you build apps, it is unlikely that buttons look identical. Therefore, the function may require multiple parameters for customization. It becomes more tedious and readability decreases.

## Introducing Unconventional Way
The unconventional way uses a closure block to initialize an object.

### Create Object with Closure
First, let us figure out how to create an object using a closure block.

Design a `Human` struct

```swift
struct Human {
  init() {
    print("Born 1996")
  }
}
```

Create an instance called, `bobInstance`.

```swift
let createBob = { () -> Human in
  let human = Human()
  return human
}

let bobInstance = createBob()
```

You've created two constants: `createBob` and `bobInstance`. Unnecessary.

### Initialize in Single Line
```swift
let bobby = { () -> Human in
  let human = Human()
  return human
}()
```

Now, `bobby` contains the `human` object.

### Create UIView Unconventionally
Let us apply the same principle to creating a `UIView` object.

```swift
let bobView = { () -> UIView in
  let view = UIView()
  view.backgroundColor = .black
  return view
}()

let bobbyView = { () -> UIView in
  let view = UIView()
  view.backgroundColor = .black
  return view
}()
```

The closure block has no parameter. Therefore, you no longer have to define the type explicitly - [3001_intro_closures_part1](/course/functional-swift/intro-closure-part1.md/#no-parameter)

```swift
let newBobbyView: UIView = {
  let view = UIView()
  view.backgroundColor = .black
  return view
}()
```

You only have to define the type of `newBobbyView` as `UIView`.

## Introducing Lazy Var
The `lazy` keyword is used in front of a variable.

```swift
class IntenseMathProblem {
  lazy var complexNumber: Int = {
    1 * 1
  }()
}
```

`lazy` properties are not initialized until you access them.

```swift
let problem = IntenseMathProblem() // no value for complexNumber
problem.complexNumber // now, complexnumber is 1
```

## Application
You may use `lazy` to sort your database.

```swift
class SortFromDataBase {
  // Data
  lazy var sortNumberFromDatabase: [Int] = {
    // Caluation and sorting
    [1, 2, 3, 4, 5, 6, 7, 8, 9]
  }()
}
// SortFromDataBase().sortNumberFromDatabase
```

You do not want to sort your entire database. It would burn a lot of computing power.


The same principle applies to image compression.

```swift
class CompressionManager {
  lazy var compressedImage: UIImage = {
    let image = UIImage()
    // Compress the image
    // Logic
    return image
  }()
}
```

## Rules
 1. You can’t use `lazy` with `let` since there is no initial value, and it is attained later when it is accessed.
 2. You can’t use it with a Computed property since computed property is always recalculated (requires CPU) when you modify any of the variables that has a relationship with the lazy property.
 3. `lazy` is only valid for members of a struct or class

### Resources
[Swift Lazy Initialization with Closures]

[Swift Lazy Initialization with Closures]: https://blog.bobthedeveloper.io/swift-lazy-initialization-with-closures-a9ef6f6312c


### Source Code
[3003_lazy_init_closures.playground](https://www.dropbox.com/sh/tdmnhesaeqlwox4/AAA1aCtKuhI1V1YXJkaV2L05a?dl=0)

## Conclusion
You've learned how to initialize an object using closures instead of the tedious method above. I do not use `Storyboard`. In fact, I have a "library" of UI Components so that I don't waste time typing all day. I just copy the closure block from the library and modify a little. Second, you've learned to use the `lazy` keyword in front of a property that requires heavy computing.

In the following lesson, you will discover a unique behavior of closures.

> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

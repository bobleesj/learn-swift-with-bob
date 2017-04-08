# Lazy Init with Closures

## Introduction

## Problem
How to initialize an object with a closure?


## Unconventional Way
```swift
import UIKit

let box: UIView = {
  let view = UIView()
  return view
}()
```

## Create UI Components
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

## Create Button with Function
```swift
func createButton(enterTitle: String) -> UIButton {
  let button = UIButton(frame: buttonSize)
  button.backgroundColor = .black
  button.titleLabel?.text = enterTitle
  return button
}
createButton(enterTitle: "Yoyo")
```

## Introducing Unconventional Way

### Create Object with Closure
```swift
struct Human {
  init() {
    print("Born 1996")
  }
}

let createBob = { () -> Human in
  let human = Human()
  return human
}

let bobInstance = createBob()
```

### Initialize in Single Line
```swift
let bobby = { () -> Human in
  let human = Human()
  return human
}()
```

### Create `UIView` Unconventionally
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

let newBobbyView: UIView = {
  let view = UIView()
  view.backgroundColor = .black
  return view
}()

// () -> UIView
```

## Introducing Lazy Var
```swift
class IntenseMathProblem {
  lazy var complexNumber: Int = {
    1 * 1
  }()
}

let problem = IntenseMathProblem() // no value for complexNumber
problem.complexNumber // now, complexnumber is 1
```

```swift
class SortFromDataBase {
  // Data
  lazy var sortNumberFromDatabase: [Int] = {
    // Caluation and sorting
    [1, 2, 3, 4, 5, 6, 7, 8, 9]
  }()
}
// SortFromDataBase().sortNumberFromDatabase

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
 1. You can’t use lazy with let since there is no initial value, and it is attained later when it is accessed.
 2. You can’t use it with a Computed property since computed property is always recalculated (requires CPU) when you modify any of the variables that has a relationship with the lazy property.
 3. Lazy is only valid for members of a struct or class

### Resources
[Swift Lazy Initialization with Closures]

[Swift Lazy Initialization with Closures]: https://blog.bobthedeveloper.io/swift-lazy-initialization-with-closures-a9ef6f6312c


### Source Code
[3003_lazy_init_closures.playground](https://www.dropbox.com/sh/tdmnhesaeqlwox4/AAA1aCtKuhI1V1YXJkaV2L05a?dl=0)
### Reference

## Conclusion

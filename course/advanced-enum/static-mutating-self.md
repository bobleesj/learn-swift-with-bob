# Static and Mutating Methods with self
Welcome to Lesson 2 of Advanced Enum. You will learn how to utilize properties and methods within enums to produce safe and beautiful code. The examples will include `UIStoryboard`, `Cell Identifier`, and `UIColor`.

## Problem
Let's make it practical

## Practical with Storyboard
Create an enum called `Storyboard` with raw value, `String`.  It contains a computed property called, `identifier` whose type is `String`.

```swift
enum Storyboard: String {
  case profile
  case setting
  case newsfeed

  var identifier: String {
    return self.rawValue
  }
}
```

You no longer have to type manually.
```swift
let profile = Storyboard.profile
profile.identifier // "profile"
```


## API Guideline Goal
Hypothetically, you may need to create a function with a parameter whose type is `Storyboard`.

```swift
func describeStoryboard(storyboard: Storyboard) -> String {
  switch storyboard {
  case .profile:
    return "\(storyboard.identifier): Profile picture, followers"
  case .setting:
    return "\(storyboard.identifier): Logout, invite"
  case .newsfeed:
    return "\(storyboard.identifier): videos, texts"
  }
}
```

Instead of typing manually, you are able to pick and choose any cases within `Storyboard`. Look familar?

```swift
describeStoryboard(storyboard: .profile)
```

## Mutating Method
You may create a `mutating` function that mutates its own `case`.


```swift
enum MealProcess: String {
  case breakfast, lunch , dinner

  var description: String {
    return self.rawValue
  }

  mutating func nextMeal() {
    print("Time to move on from \(self.description)")

    switch self {
    case .breakfast:
      self = .lunch
      print("I had a nice lunch")
    case .lunch:
      self = .dinner
      print("I had a nice dinner")
    case .dinner:
      self = .breakfast
      print("I had a nice breakast")
    }
  }
}
```
> **Important:** `self` refers to the initialized enum object with a defined case.

Let us initialize an object with the `breakfast` case and call the `nextMeal()` function.

```swift
var currentMeal = MealProcess.breakfast
currentMeal.nextMeal() // .lunch
currentMeal.nextMeal()  // .dinner
```

The `nextMeal` function modifies the case of `currentMeal`.

## Static Method
Create an enum called, `AppleDevices`. It contains a `static` function which returns `AppleDevices` based on the name of the parameter used in the function.

```swift
enum AppleDevices {
  case iWatch, iPhone, iMac, MacPro

  static func getAppleDevice(name: String) -> AppleDevices? {
    switch name {
    case "iWatch":
      return .iWatch
    case "iPhone":
      return .iPhone
    case "iMac":
      return .iMac
    case "MacPro":
      return .MacPro
    default:
      return nil
    }
  }
}
```

You may return an initialized enum object by calling `getAppleDevice`.

```swift
let userProduct = AppleDevices.getAppleDevice(name: "iWatch")
print(userProduct) //  AppleDevices.iWatch
```

Let us refactor using raw value.

```swift
enum AppleDevices: String {
  case iWatch, iPhone, iMac, MacPro

  static func getProduct(name: String) -> AppleDevices? {
    return AppleDevices(rawValue: name)
  }

  static func getAppleDevice(enterName: String) -> AppleDevices? {
    switch enterName {
    case "iWatch", "iPhone", "iMac", "MacPro":
      return getProduct(name: enterName)
    default:
      return nil
    }
  }
}
```

Looks nice and zen.

## Custom Init
You may add a custom init method to create an object you wish.

```swift
enum AppleDevice: String {
  case iWatch, iPhone, iMac, MacPro

  init?(name: String) {
    if name == "iWatch" {
      self = .iWatch
    } else {
      return nil
    }
  }
}

AppleDevice(name: "iWatch")
AppleDevice(rawValue: "iWatch")
```

Another example with number category.

```swift
enum IntCategory {
  case small
  case medium
  case big
  case weird

  init(number: Int) {
    switch number {
    case 0..<1000 :
      self = .small
    case 1000..<100000:
      self = .medium
    case 100000..<1000000:
      self = .big
    default:
      self = .weird
    }
  }
}

IntCategory(number: 12413423432) // .weird
```

## Practical Usage

### HTTP Request
You may organize a group of HTTP instructions using enums instead of multiple tuples.

```swift
//: HTTP Request
enum HttpError: String {
  case Code400 = "Bad Request"
  case Code401 = "Unauthorized"
  case Code402 = "Payment Required"
  case Code403 = "Forbidden"
  case Code404 = "Page Not Found"

  var description: String {
    return self.rawValue
  }
}

HttpError.Code400.description
```

### Cell Identifier
Like `Storyboard`, you want to limit typing with your fingers. Instead, pick and choose.

```swift
enum CellType: String {
  case ButtonValueCell = "ButtonValueCell"
  case UnitEditCell = "UnitEditCell"
  case LabelCell = "LabelCell"
  case ResultLabelCell = "ResultLabelCell"

  var name: String {
    return self.rawValue
  }
}
```

### UIColor
No more typing. It is useful both for your teammates with effective communication.

```swift
import UIKit

enum NavigationTheme {
  case Placid
  case Warning
  case Danger

  var barTintColor: UIColor {
    switch self {
    case .Placid: return UIColor.clear
    case .Warning: return UIColor.blue
    case .Danger: return UIColor.red
    }
  }
}
```

You may get `barTintColor` based on the enum case.

```swift
let colorSituation = NavigationTheme.Placid
colorSituation.barTintColor
```

Enums also support `extension`. Let us add a custom init.
```swift
extension NavigationTheme {
  init(numberOfTasks: Int) {
    switch numberOfTasks {
    case 0...3:
      self = .Placid
    case 4...9:
      self = .Warning
    default:
      self = .Danger
    }
  }
}
```

The example above is useful for coloring a to-do list app.

Let us retrieve `barTintColor` based on `numberOfTasks`.

```swift
let currentColor = NavigationTheme(numberOfTasks: 10).barTintColor
```

### Source Code
[7002_stating_mutating_self.playground](https://www.dropbox.com/sh/8hqaxles0b9fcdv/AABbjQSsukVkVjBwzSJBxaMHa?dl=0)

## Conclusion
You've tasted the power of enums. Again, no more typing. In your head, you should be thinking how to deploy enums to beautify your previous projects. If the iOS engineers have not used enums for any APIs,  for instance, `UIColor`, we, developers, have to memorize and type all day while checking the documentation unlimited times. Use it for your advantage as well.

In the following lesson, you will learn how to add multiple enums within a single enum.

> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

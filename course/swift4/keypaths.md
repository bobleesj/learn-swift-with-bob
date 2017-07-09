# Key Paths
## Introduction
Welcome to the second lesson of What's New in Swift 4. You will discover how to save time by typing less. No need to talk much. Let's get started.

## Problem
I'm tired of chaining.

### Design Model
```swift
struct Developer {
  var platform: Platform
  var information: Information
}

enum Platform {
  case iOS
  case android
}

struct Information {
  var name, strengths, motivation: String
}
```

### Create Objects
```swift
let robInformation = Information(name: "Rob", strengths: "Zenness", motivation: "Change the world")
let bobInformation = Information(name: "Bob", strengths: "Dryness", motivation: "None")

let rob = Developer(platform: .android, information: robInformation)
let bob = Developer(platform: .iOS, information: bobInformation)
```

### Your Past
In order to access the `name` property, you had to chain through for each object.

```swift
rob.information.name // "Rob"
bob.information.name // "Bob"
```

However, in Swift 4, it provides an alternative that provides safety and less typing.

### Introduction Swift 4 Key Paths
You may have the access/path to the property or method as shown below.

```swift
let bobPlatform = bob[keyPath: \Developer.platform] // iOS
let bobName = bob[keyPath: \Developer.information.name] // 'Bob"
```

#### Store Path
You may store the path and simply apply.
```swift
let informationKeyPath = \Developer.information
let bobInfo = bob[keyPath: informationKeyPath]
let robInfo = rob[keyPath: informationKeyPath]
```

#### Append Key Path
Fortunately, you may also append more paths to the original path as long as there is one.

```swift
let nameKeyPath = informationKeyPath.appending(path: \.name)
bob[keyPath: nameKeyPath] // "Bob"
rob[keyPath: nameKeyPath] // "Rob"
```

### Source Code
[9001_keypaths]()

### Resources
[Smart KeyPaths: Better Key-Value Coding for Swift - Apple](https://github.com/apple/swift-evolution/blob/master/proposals/0161-key-paths.md)

## Conclusion
Congratulations. Remember, even if you are chaining through, you may make a single mistake that leads to catastrophic result. Although it is a brand new feature, if you need to access Property or Method through many chainings, I recommend you to utilize the keypath feature provided in Swift 4.

In the following lesson, you will learn how to make subscripts generic. 

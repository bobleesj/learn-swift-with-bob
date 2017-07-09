# Key Paths
## Introduction
Welcome to the first lesson of What's New in Swift 4. You will discover how to save time by typing less. No need to talk much. Let's get started.

## Problem
I'm tired of chaining

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
```swift
rob.information.name // "Rob"
bob.information.name // "Bob"
```

### Introduction Swift 4 Key Paths

Access Through "Path"
```swift
let bobPlatform = bob[keyPath: \Developer.platform] // iOS
let bobName = bob[keyPath: \Developer.information.name] // 'Bob"
```

#### Store Path
```swift
let informationKeyPath = \Developer.information
let bobInfo = bob[keyPath: informationKeyPath]
let robInfo = rob[keyPath: informationKeyPath]
```

#### Append Key Path
```swift
//: Append Key Path
let nameKeyPath = informationKeyPath.appending(path: \.name)
bob[keyPath: nameKeyPath] // "Bob"
rob[keyPath: nameKeyPath] // "Rob"
```

### Source Code
### Resources
## Conclusion

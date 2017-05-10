# Override Protocol Associated Type
## Introduction
Welcome to Lesson 3 of Generic Protocols. Nice and easy. You will learn multiples way to override pre-defined associated type.

## Problem
 How to override typed-defined protocol?

## Design Protocol
Create a protocol called, `FamilyProtocol`. It has an `associatedtype` called `familyType` in `Int`.

```swift
protocol FamilyProtocol {
  associatedtype familyType = Int
  var familyMembers: [familyType] { get set }
}
```
## Design Struct
Create a struct that conforms to `FamilyProtocol`.

```swift
struct NumberFamily: FamilyProtocol {
 var familyMembers: [Int] = [1, 2, 3]
}

let numberFam = NumberFamily() // familyType == Int
```

## Override Associated Type Directly
You may override `familyType` by creating a `typealias` in `String` or any other types.

```swift
struct NormalFamily: FamilyProtocol {
  typealias familyType = String
  var familyMembers:  = ["Bob", "Bobby"]
  }
}
```

You don't even need to create a `typealias`. `familyType` can be modified based on the value.

```swift
struct NormalFamily: FamilyProtocol {
  var familyMembers:  = ["Bob", "Bobby"]
  }
}
```

## Override Associated Type With Generic Struct
Create a generic struct with a type `T`. The struct conforms to `FamilyProtocol`.


```swift
struct LeeFamily<T>: FamilyProtocol {
  var familyMembers: [T] = []
}
```

```swift
let family = LeeFamily(familyMembers: ["Bob", "Bobby", "Lee"])
```

### Process
1. `T` becomes `String` based on  `["Bob", "Bobby", "Lee"]`
2. `familyType` becomes `String` based on `T`

### Source Code
[6003_override_associated_type](https://www.dropbox.com/sh/fglol4vr7ixozjp/AABwWMDh1XnVo8Lr__YjcO5Ua?dl=0)

### Resources
[Generic Protocols with Associated Type](https://blog.bobthedeveloper.io/generic-protocols-with-associated-type-7e2b6e079ee2)


## Conclusion
You've learned how to override pre-defined associated types in protocols. Yet, it's ironic that you set the type as defined within protocols because it goes against the meaning of `generics`. Just don't do it.

In the following lesson, you will discover that Protocol Oriented Programming is not the ultimate savior in all cases.

> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

# Nested Enums
Welcome to Lesson 3 of Advanced Enum. You will learn how to add multiple enums within an enum to design organized structure and design. This lesson will take your game to the next level.

## Problem
Just more than one

## Intro to Nested Enums
Create an enum called `FutureCourse`. It contains other enums called, `LearnSwiftWithBob` and `UIKitFundamentals`.

```swift
enum FutureCourse {
  enum LearnSwiftWithBob: String {
    case genericProtocol
    case advancedEnum

    var chapaterDescription: String {
      return self.rawValue
    }
  }

  enum UIKitFundamentals: String {
    case realmDatabase
    case noStoryboard
    case cloudComputing

    var chapterDescription: String {
      return self.rawValue
    }
  }

}

Initialize an object
```swift
FutureCourse.LearnSwiftWithBob.advancedEnum.chapaterDescription
FutureCourse.UIKitFundamentals.cloudComputing.chapterDescription
```

## Game Design
Create a struct called, `Character`. Add a nested enum called `CharacterType` and `Skill`. The `Character` struct has two property whose types are `CharacterType` and `Skill`.

```swift
struct Character {
  enum CharacterType {
    case prince
    case warrior
    case priest
  }

  enum Skill {
    case airwalk
    case transparency
    case prediction
  }

  let type: CharacterType
  let skill: Skill
}
```

To initialize, you all have to pick and choose.

```swift
let warrior = Character(type: .priest, skill: .airwalk)
```

> **Important:** Follow this pattern for designing your app.

## Another Game Design
Instead of using a struct as above, you may achieve the similar outcome using enums only.

```swift
enum Wearable {
  enum Weight: Int {
    case light
    case medium
    case heavy
  }
  enum Price: Int {
    case leather
    case iron
    case steel
  }

  case armor(weight: Weight, price: Price)
  // case houseMaterial(weight: Weight, price: Price)

  func getDescription() -> String {
    switch self {
    case let .armor(weight, price) :
      return "You've chosen \(weight) and \(price)"
    }
  }
}
```

```swift
let myClothes = Wearable.armor(weight: .heavy, price: .steel)
myClothes.getDescription()
// "You've chosen heavy and steel"
```
You don't have to create structs/classes for every design.

### Source Code
[7003_nested_enum.playground](https://www.dropbox.com/sh/2i21j3pvm33susy/AABR4YoVfzRVUhQFqZR30MMWa?dl=0)

## Conclusion
You've learned how nested enums may be useful for replacing classic structs and classes. I recommend you use both of them. When you design APIs for your teammates or open source libraries, attempt to use enums for anything has to do with choosing options because the user of your code doesn't' have to type or go through multiple properties and methods all mixed together. Instead, enums allows him/her to pick and choose available cases for the particular enum. The skill that requires you to code in a different league is deploying enums in the right context.

In the following lesson, you will learn how to combine enums with protocols.

> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

# Protocol Oriented Enum
Welcome to Lesson 4 of Advanced Enum. So far, you've interacted protocols with structs and classes. Today, let us spice things up with enums. By the end of this lesson, you will learn how to create a simple game design with what you've learned so far. Also, you will get a taste of creating your own custom operators in the Swift Programming Language.

## Problem
Let's combine the best of the best

## Game Design
A player could be either .`dead` or `.alive`. When alive, the player has a number of hearts/lives. If the number goes to zero, the player becomes dead.

### Design Protocol
Create a protocol called, `LifeSpan`. It contains one property, `numberOfHearts` and two `mutating` functions which will be used to increase/decrease a player's heart.

```swift
protocol LifeSpan {
  var numberOfHearts: Int { get }
  mutating func increaseHeart() // heart +1
  mutating func getAttacked() // heart -1
}
```

### Design Enum
Create an enum called `Player`. It conforms to `LifeSpan`. There are two cases. The object can be either `dead` or `alive`. The `alive` case contains an associated value called `currentHeart`. It also contains a gettable computed property, `numberOfHearts`. `numberOfHearts` is determined based on whether `self` is `case` or `alive`.


```swift
enum Player: LifeSpan {
  case dead
  case alive(currentHeart: Int)

  var numberOfHearts: Int {
    switch self {
    case .dead: return 0
    case let .alive(numberOfHearts): return numberOfHearts
    }
  }

  mutating func increaseHeart() {
    switch self {
    case .dead:
      self = .alive(currentHeart: 1)
    case let .alive(numberOfHearts):
      self = .alive(currentHeart: numberOfHearts + 1)
    }
  }

  mutating func getAttacked() {
    switch self {
    case .alive(let numberOfHearts):
      if numberOfHearts == 1 {
        self = .dead
      } else {
        self = .alive(currentHeart: numberOfHearts - 1)
      }
    case .dead:
      break
    }
  }
}
```

> **Important:** The `break` keyword is used to escape out of the `switch` statement.

### Play Game
Let us test. Begin with `.dead`.

```swift
var state = Player.dead // .dead
state.increaseHeart()  // 1
state.numberOfHearts // 1
state.increaseHeart() // 2
state.getAttacked()  // 1
state.getAttacked() // 0, .dead
state.numberOfHearts // 0
```

## Custom Operators (Taste)
First design a enum, `GameAction`.

```swift
enum GameAction {
  case Start
  case Pause
  case Stop
  case Restart(delay: Int)
}
```

Check whether `==` works.

```swift
GameAction.Stop == GameAction.Stop // Error
```

You may create your own operator. Follow the code below.

```swift
func ==(lhs: GameAction, rhs: GameAction) -> Bool {
  switch (lhs, rhs) {
  case (.Start, .Start), (.Pause, .Pause), (.Stop, .Stop):
    return true
  case let (.Restart(lhsDelay), .Restart(rhsDelay)):
    return lhsDelay == rhsDelay
  default:
    return false
  }
}

GameAction.Restart(delay: 10) == GameAction.Restart(delay: 10) // true
```

> **Note:** You will more in de-tail in Chapter 8: Advanced Swift.


### Source Code
[7004_protocol_enum.playground](https://www.dropbox.com/sh/ptksoqsu5c0fnqm/AABm-0gtKqxkNyMyjRkSEXCqa?dl=0)

## Conclusion
Some may feel uncomfortable with the excessive usage of enums. That is good. You are challenged by new ways of thinking. However, you are right. You may not need to use enums. Just like protocols, it could be an overkill for certain implementations. In the following lesson, you will learn a recursive enum structure to add and multiply numbers. After, I will show you alternatives that are much simpler and more zen. Just like protocols, enums are not the ultimate savior. You have to learn and study every tool to a point you are able to calculate tradeoffs and benefits by foreseeing the future.

> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

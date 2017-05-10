# Type Eraser

## Introduction
Welcome to the last lesson of Generic Protocols. In the previous lesson, you've discovered the problem that occurs when you work with protocol as a type. Let us find an alternative.

## Problem
Let's circumvent the problem

## Design Protocol, Struct, Classes
The example from the previous lesson is used.

```swift
// Design FileType
struct Folder {}
struct Cell {}

// Design Protocol
protocol Listable {
  associatedtype FileType
  func getFileType() -> String
}

// Design Classes
class FolderCell: Listable {
  typealias FileType = Folder
  func getFileType() -> String {
    return "FolderCell with \(FileType.self) type"
  }
}

class CollectionCell: Listable {
  typealias FileType = Cell
  func getFileType() -> String {
    return "CollectionCell with \(FileType.self) type"
  }
}

class ListCell: Listable {
  typealias FileType = Cell
  func getFileType() -> String {
    return "ListCell with \(FileType.self) type"
  }
}
```

> **Important:** Make sure you review generics and closures to fully understand what's coming.

## Design Wrapper
Design a generic class called, `AnyCell`.  It conforms to the `Listable` protocol. It has an init method which you must enter an object that conforms to `Listable`.


```swift
class AnyCell<T>: Listable {
  typealias FileType = T

  private let _getFileType: () -> String

  init<U: Listable>(_ enterAnyCell: U) where U.FileType == T {
    // T defined based on U
    _getFileType = enterAnyCell.getFileType
  }

  func getFileType() -> String {
    return _getFileType()
  }
}
```

## Execute
Use `AnyCell` to create an object.

```swift
let collectionCell: AnyCell = AnyCell(CollectionCell())
let listCell: AnyCell = AnyCell(ListCell())
```

You may group items whose `FileType` is identical.

```swift
let fileTypeWithCells = [collectionCell, listCell]
print(fileTypeWithCells[0].getFileType())
print(fileTypeWithCells[1].getFileType())
```


> **Type Erasing:** Erase Abstract Type (`associatetype`, `T`) to Concrete Type (`String`, `Int`, `File,` `Cell`)


### Source Code
[6005_type_erasing.playground](https://www.dropbox.com/sh/molxejcbknq8vrd/AAC4aSMkFc5w8ckHnkZmah2Ba?dl=0)

### References
[Protocol Oriented Programming is Not a Silver Bullet by Chris Eidhof](http://chris.eidhof.nl/post/protocol-oriented-programming)

[Beyond Crusty: Real-World Protocols by Rob Napier](http://www.thedotpost.com/2016/01/rob-napier-beyond-crusty-real-world-protocols)

## Conclusion
The lesson could have been tough since it assumes you've mastered generics and closures. If you are stuck, I recommend you to get the fundamentals of them and then come back after. If you wish to study more, I recommend you to take a look at the references I've attached. They focus on why Protocol Oriented Programming is not the ultimate savior for all cases. Often, it is recommended you use pure structs or enums which you will learn in-detail in the following chapter. Anyhow, the person who came up with the solution is definitely smarter than I'm.

> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

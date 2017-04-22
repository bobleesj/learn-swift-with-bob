# Protocol Pitfalls

## Introduction
Welcome to Lesson 4 of Generic Protocols. In Chapter 4, you've learned how to use protocols as a type so that you may group objects together regardless of classes, structs, and enums. With associated types, however, it no longer works. You will discover that Protocol Oriented Programming has its own flaw.

## Problem
Can't use it as a type



## Design File Type
Design structs called, `Folder` and `Cell` which will be used later by the protocol.

```swift
struct Folder {}
struct Cell {}
```

## Design Protocol
Design a protocol called, `Listable`. It contains an associated type called, `FileType` which will be replaced by the structs you've designed above.

```swift
protocol Listable {
  associatedtype FileType
  func getFileType() -> String
}
```

## Design Classes
Design classes called, `FolderCell`, `CollectionCell`, `ListCell`.
```swift
class FolderCell: Listable {
  typealias FileType = Folder
  func getFileType() -> String {
    return "FolderCell with \(FileType.self) type"
  }
}
```

<img src="/course/generic-protocol/assets/31_folder_cell.png" width="300px" title="Folder Cell" />

```swift
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

<img src="/course/generic-protocol/assets/32_file_cell.png" width="300px" title="List Cell and Collection Cell" />

`FileType` of `FolderCell` is `Folder`. `FileType`of `CollectionCell` and `ListCell` is `Cell`.



## Problem
```swift
let cell: Listable = CollectionCell() // Error
```
> **Error:** Listable' can only be used as a generic constraint because it has Self or associated type requirements

You may only use `Listable` as a generic constraint as shown below.

```swift
func enterListCell<T: Listable>(enterCell: T) {}
enterListCell(enterCell: FolderCell())
enterListCell(enterCell: ListCell())
```

The compiler does not know the type of `FileType` as shown below.

```swift
import Foundation
let cell: Listable = arc4random() * 2 == 0 ? FolderCell() : ListCell()
```

`FileType` could be `Folder` or `Cell`. It is only known when you execute the `arc4Random()` method. By the time it is called, it is already compiled

### Source Code
[6004_protocol_pitfalls](https://www.dropbox.com/sh/taxydi2cxionzxp/AAD7aKreX1i1wDwJKL1Q-yVEa?dl=0)

## Conclusion
This is frustrating. In the following lesson, you will learn how to use the brain to circumvent the problem. 

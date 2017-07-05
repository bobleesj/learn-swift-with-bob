/*:
 ## Learn Swift with Bob
 ### Generic Protocols
 ### Protocol Pitfalls
 
 **Problem:** Can't use it as a type
 
 ---
 
 */
//: Design File Type
struct Folder {}
struct Cell {}


//: Design Protocol
protocol Listable {
  associatedtype FileType
  func getFileType() -> String
}


//: Design Classes
class FolderCell: Listable {
  typealias FileType = Folder
  func getFileType() -> String {
    return "FolderCell with \(FileType.self) type"
  }
}

FolderCell().getFileType()


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

//: Problem
// let cell: Listable = CollectionCell()
//: > 'Listable' can only be used as a generic constraint because it has Self or associated type requirements
func enterListCell<T: Listable>(enterCell: T) {}
enterListCell(enterCell: FolderCell())
enterListCell(enterCell: ListCell())


import Foundation

// let cell: Listable = arc4random() * 2 == 0 ? FolderCell() : ListCell()
// let cell: [Listable] = [CollectionCell(), ListCell()]












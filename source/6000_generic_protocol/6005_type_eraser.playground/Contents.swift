/*:
 ## Learn Swift with Bob
 ### Generic Protocols
 ### Type Eraser
 
 **Problem:** Let's circumvent the problem
 
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

//: Prerequsites
//: - Generics
//: - Closure



//: Design Wrapper
class AnyCell<T>: Listable {
  
  
  typealias FileType = T
  
  private let _getFileType: () -> String
  
  init<U: Listable>(_ enterAnyCell: U) where U.FileType == T {
    _getFileType = enterAnyCell.getFileType
  }
  
  func getFileType() -> String {
    return _getFileType()
  }
}

let collectionCell: AnyCell = AnyCell(CollectionCell())
let listCell: AnyCell = AnyCell(ListCell())
let fileTypeWithCells = [collectionCell, listCell]

print(fileTypeWithCells[0].getFileType())
print(fileTypeWithCells[1].getFileType())


// Erase Abstract Type (<T>, associated type) to Concrete Type (String, Int, File, Cell)



















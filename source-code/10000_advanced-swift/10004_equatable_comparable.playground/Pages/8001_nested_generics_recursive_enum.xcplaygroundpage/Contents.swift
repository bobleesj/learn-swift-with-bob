/*:
 ## Learn Swift with Bob
 ### Advanced Swift
 ### Equtable and Comparable Protocol
 
 **Problem:** Understand, *"Swift is a protocol oriented langauge"*
 
 ---
 */


5 == 5
"Bob" == "Bob"

//: ### Equatable
//func ==(lhs: Self, rhs: Self) -> Bool

//: Custom Struct
struct Blog {
  let author: String
  let title: String
}

extension Blog: Equatable {
  static func ==(lhs: Blog, rhs: Blog) -> Bool {
    return lhs.author == rhs.author && lhs.title == rhs.title
  }
}

Blog(author: "Bob", title: "Swift") == Blog(author: "Bob", title: "Swift")


//: Custom Tuple
struct GridPoint {
  var grid: (Int, Int)
  init(_ numberOne: Int, _ numberTwo: Int) {
    grid = (numberOne, numberTwo)
  }
}

extension GridPoint: Equatable {
  static func ==(lhs: GridPoint, rhs: GridPoint) -> Bool {
    return lhs.grid.0 == rhs.grid.0 && lhs.grid.1 == rhs.grid.1
  }
}

let pointOne = GridPoint(4, 10)
let pointTwo = GridPoint(4, 11)

pointOne.grid
pointTwo.grid

pointOne == pointTwo // true

//: ### Comparable

//: Examples
10 > 5 // true
10 <= 4 // false
123.1 >= 100.0 // false


/*
 public protocol Comparable : Equatable {
 public static func <(lhs: Self, rhs: Self) -> Bool
 public static func <=(lhs: Self, rhs: Self) -> Bool
 public static func >=(lhs: Self, rhs: Self) -> Bool
 public static func >(lhs: Self, rhs: Self) -> Bool
 }
 */

enum OS {
  case iOS
  case android
}

extension OS: Comparable {
  static func ==(lhs: OS, rhs: OS) -> Bool {
    return lhs == rhs
  }
  
  static func <(lhs: OS, rhs: OS) -> Bool {
    return rhs == .iOS ? true : false
  }
  
  static func <=(lhs: OS, rhs: OS) -> Bool {
    return false
  }
  
  static func >=(lhs: OS, rhs: OS) -> Bool {
    return false
  }
  
  static func >(lhs: OS, rhs: OS) -> Bool {
    return lhs == .iOS ? true: false
  }
}


let iOS = OS.iOS
let android = OS.android

iOS < android // false
iOS <= android // false
iOS >= android // false
iOS > android // true

android > iOS // false
android >= iOS // false
android <= iOS // false
android < iOS // true

print("hello")














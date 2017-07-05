/*:
 ## Learn Swift with Bob
 ### Advanced Swift
 ### Nested Generics and Recursive Enum
 
 **Problem:**
 1. Learn how to created nested generic enum
 2. Learn more about recursive enum with binary tree
 
 ---
 
 */
//: ### Nested Generics
//: Before Swift 3.1


//: Design Generic Enums
enum Gadget<T> {
  case smartphone
  case laptop
  case fridge
  case others(T)
}

enum Company<T> {
  case Samsung
  case Apple
  case Sony
  case others(T)
}


//: Design Struct
struct Product<T> {
  
  let company: Company<T>
  let gadget: Gadget<T>
  let reviews: [T]
  
  init(enterCompany: Company<T>, enterGadget: Gadget<T>, enterReview: [T]) {
    company = enterCompany
    gadget = enterGadget
    reviews = enterReview
  }
}

let myProduct = Product(enterCompany: .Apple, enterGadget: .fridge, enterReview: ["Good, silver, but expensive"])


//: Swift 3.1
struct Team<T> {
  struct TeamMember {
    let name: T?
    let age: T?
  }
}



struct NestedProduct<T> {
  
  indirect enum Gadget {
    case smartphone
    case laptop
    case fridge
    case others(T)
  }
  
  indirect enum Company {
    case Samsung
    case Apple
    case Sony
    case others(T)
  }
  
  let company: Company
  let gadget: Gadget
  
  let reviews: [T]
  
  init(enterCompany: Company, enterGadget: Gadget, enterReView: [T]) {
    company = enterCompany
    gadget = enterGadget
    reviews = enterReView
  }
}

let myFridge = NestedProduct(enterCompany: .Apple, enterGadget: .laptop, enterReView: ["Good"])


//: > **Cyclic Dependency:** A relation between two or more modules which either directly or indirectly depend on each other to function properly. The tight coupling of the mutually dependent modules which reduces or makes impossible the separate re-use of a single module.

//: ### Recursive Enum
//: Reference vs Value Type in Associated Value
class BobClass {}
struct BobStruct {}
enum BobEnum {
  case bobCase
}

let bobClass = BobClass()
let bobStruct = BobStruct()
let bobEnum = BobEnum.bobCase


enum MyEnum {
  case myClass(BobClass)
  case mySruct(BobStruct)
  case myEnum(BobEnum)
}

MyEnum.myClass(bobClass)
MyEnum.mySruct(bobStruct)
MyEnum.myEnum(bobEnum)


//: The Meaning of `indirect enum` with Binary Tree
indirect enum Tree {
  case Empty
  case Node(value: Int ,left: Tree ,right: Tree)
}

let tree1 = Tree.Node(value: 1, left: Tree.Empty, right: Tree.Empty)
let tree2 = Tree.Node(value: 2, left: Tree.Empty, right: Tree.Empty)
let tree3 = Tree.Node(value: 3, left: tree1, right: tree2)
let tree4 = Tree.Node(value: 4, left: tree3, right: Tree.Empty)

//: Recursive Function to Sum Values
func evaluateTree(tree:Tree) -> Int {
  switch tree {
  case .Empty:
    return 0
  case .Node(let value, let left, let right):
    return value + evaluateTree(tree: left) + evaluateTree(tree: right)
  }
}

evaluateTree(tree: tree1)
evaluateTree(tree: tree3)





















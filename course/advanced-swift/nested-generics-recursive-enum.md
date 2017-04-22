# Nested Generics and Recursive Enum

## Introduction
Welcome to the first lesson of Advanced Swift. So far, you've learned how to create generic structs, classes, enums, and functions. Today, you will learn how to add generics within generics. Next, you will learn the meaning of `indirect` enums using the binary data structure.

## Problem
1. Learn how to created nested generic enum
2. Learn more about recursive enum with binary tree

## Nested Generics
Let us take your game to the next level with generics.

### Before Swift 3.1
To appreciate nested generics, let us look into your/my past.

### Design Generic Enums
Create two generic enums: `Gadget` and `Company`.

```swift
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
```

### Design Struct
Create a struct called, `Product`. It contains three properties: `company`, `gadget`, and `reviews`.

```swift
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
```

The init method seems unpleasant. Let us attempt to initialize.

```swift
let myProduct = Product(enterCompany: .Apple,
                                    enterGadget: .fridge,
                                    enterReview: ["Good, silver, but expensive"])
```

There must be an alternative.

## Swift 3.1
Now, you may add a generic type within a generic type. Create a generic struct, `Team`. Within the struct, it also contains another generic structure, `TeamMember`.

```swift
struct Team<T> {
  struct TeamMember {
    let name: T?
    let age: T?
  }
}
```

Let us use nested generics using the `Product `example.

```swift
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
```

> **Important:** The `indirect` keyword is needed in front of `Company` and `Gadget` due to a [bug](https://bugs.swift.org/browse/SR-3779). You will learn more about the meaning of `indirect` soon.


> **Cyclic Dependency:** A relation between two or more modules which either directly or indirectly depend on each other to function properly. The tight coupling of the mutually dependent modules which reduces or makes impossible the separate re-use of a single module.


Let us initialize using the generic enums

```swift
let myFridge = NestedProduct(enterCompany: .Apple,
                                             enterGadget: .laptop,
                                             enterReView: ["Good"])
```

You are following the principle: write less, produce more.

## Recursive Enum
Before I introduce you to the meaning of `indirect`, let us take a look the characteristic of enum associated value.

First, let us design blueprints using `class`, `struct`, and `enum`.

```swift
class BobClass {}
struct BobStruct {}
enum BobEnum {
  case bobCase
}
```

Let us initialize

```swift
let bobClass = BobClass()
let bobStruct = BobStruct()
let bobEnum = BobEnum.bobCase
```

Create an enum, `MyEnum`, with associated value.

```swift
enum MyEnum {
  case myClass(BobClass)
  case mySruct(BobStruct)
  case myEnum(BobEnum)
}
```

Let us initialize.

```swift
MyEnum.myClass(bobClass)
MyEnum.mySruct(bobStruct)
MyEnum.myEnum(bobEnum)
```

Let us visualize.

<img src="/course/advanced-swift/assets/11_value_types_reference_types.jpg" title="Reference vs Value Types in Associated Value">

> **Notes:** The associated value of `myStruct` and `myEnum` are stored while `myClass` is referenced somewhere in the cloud.

### The Meaning of indirect enum with Binary Tree
Let us create an enum called, `Tree`. There are two cases, either `Empty` or `Node`. The `Node` case has associated value.

```swift
indirect enum Tree {
  case Empty
  case Node(value: Int ,left: Tree ,right: Tree)
}
```

Let us create a couple nodes.

```swift
let tree1 = Tree.Node(value: 1, left: Tree.Empty, right: Tree.Empty)
let tree2 = Tree.Node(value: 2, left: Tree.Empty, right: Tree.Empty)
let tree3 = Tree.Node(value: 3, left: tree1, right: tree2)
```

Let us visualize

<img src="/course/advanced-swift/assets/12_binary_tree_1.jpg" title="">

Let us add two more nodes

```swift
let tree1 = Tree.Node(value: 1, left: Tree.Empty, right: Tree.Empty)
let tree2 = Tree.Node(value: 2, left: Tree.Empty, right: Tree.Empty)
let tree3 = Tree.Node(value: 3, left: tree1, right: tree2)
let tree4 = Tree.Node(value: 4, left: tree3, right: tree5)
let tree5 = Tree.Node(value: 5, left: Tree.Empty, right: Tree.Empty)
```

Let us visualize

<img src="/course/advanced-swift/assets/13_binary_tree_2.jpg" title="">

> **Important:** `indirect` enums no longer store associated value. It references. For instance, the associated value of `tree4` has a reference to `tree5` and `tree3`. `tree3` has a reference to `tree1` and `tree2`.

### Recursive Function to Sum Values
Let us calculate the sum of every tree from the top using a recursive enum.

```swift
func evaluateTree(tree:Tree) -> Int {
  switch tree {
  case .Empty:
    return 0
  case .Node(let value, let left, let right):
    return value + evaluateTree(tree: left) + evaluateTree(tree: right)
  }
}
```

Let us test.

```swift
evaluateTree(tree: tree1) // 1
evaluateTree(tree: tree3) // 6
```

> **Important:** You may have to dissect the function multiple times to understand. I recommend you to start using a smaller node.

### Source Code
[8001_nested_generics_recursive_enum](https://www.dropbox.com/sh/lwoz1mtx52ew6z7/AAAdQu_kOGYD_cpwZgwlmiRna?dl=0)


### References
[Generic struct crashes because of “cyclic metadata dependency](https://bugs.swift.org/browse/SR-3779)

[My Question on Stack Overflow](http://stackoverflow.com/questions/43382840/swift-3-1-nested-generics-bug-with-cyclic-metadata/43382919#43382919)

## Conclusion
There were two objectives. First, you've learned how to design beautiful code with nested generics. Second, you've learned the difference between normal enums and `indirect` enums when it comes to associated value. Remember, `indirect` enums point rather than store. Some may be baffled by the recursive function to add the value of all nodes. Well, I can't help you much. I recommend you to start with one node and move up.

In the following lesson, finally, you will learn how to create custom operators. 

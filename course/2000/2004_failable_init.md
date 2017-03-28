# Failable Init

## Introduction
Welcome to Lesson 2 of The UIKIt Fundamentals Part 1 Object Oriented Programming. In this lesson you are going learn how to design an init method that, first, possibly returns no object, but `nil`, second, even throws an error using error handling we talked about in Chapter 1.Let's dive into it.

## Problem
Can initialization fail? Okay, how?

### Failable Init
Insert `?` right after `init`. When the init method is called, you may return `nil`.  If initialization is successful, it returns an object whose type is optional.

```swift
class Product {
  let name: String
  init?(name: String) {
    if name.isEmpty { return nil }
    self.name = name
  }
}
```
#### Create Object
```swift
var iOSGeeKCommunity = Product(name: "iOS Geek Community") // returns Product?
var myNewProduct = Product(name: "") // nil

print(myNewProduct)
myNewProduct?.name
print(iOSGeeKCommunity?.name)
```

### Error Handling with Init
> This is a review from 1105_Error Handling.

#### Design Error
```swift
// Second Part: Throwing Error
enum NameError: Error {
  case noName
}
```

#### Design Throwable Struct
If the user enters an empty string value, it throws `NameError.noName`.

```swift
struct UdemyCourse {
  let courseName: String

  init(name: String) throws {
    if name == "" {
      throw NameError.noName
    }
    self.courseName = name
  }
}
```

#### Call and Handle Error
```swift
do {
  let myCourse = try UdemyCourse(name: "Bob")
  myCourse.courseName

} catch NameError.noName {
  print("Bob, please enter the name")
}
```

#### try?
If error is thrown, it will return `nil`. If not, it will return an optional type.

```swift
var myCourse = try? UdemyCourse(name: "Bob Lee")
myCourse // Optional
```

#### try!
If error is thrown, it will crash. If not, it will return a non-optional object.
```swift
var newCourse = try! UdemyCourse(name: "") // Crash
```

### Resources
This is a review for you if you are not still familiar with Error Handling.

[Intro to Error Handling (Blog)](https://medium.com/ios-geek-community/intro-to-error-handling-in-swift-3-edb2ce6a6668#.2uk9hyp7h)

### Source Code
[1202_Failable Init](https://www.dropbox.com/sh/hf36tvvnzqbx8ke/AABB67EWiJ8GMN-BU-EHjPwXa?dl=0)

## Conclusion
You've done two things with me in this lesson. First, you've learned how design an init method that may return `nil` or optional type by putting a `?` right to the `init` keyword. As we talked about it before. Anything that has `?` in Swift will give you an optional value. Second, you've revisited error handling. The `throws` keyword is not only used within an `else-if` block, but also it can used for an `init` method.

#### Stay Connected
If you'd like to be on my mailing list and receive personal updates on upcoming books and courses, feel free to send me an email at `bobleesj@gmail.com`
<p>
<a href="http://bobthedeveloper.io"><img src="https://img.shields.io/badge/Personal-Website-333333.svg"></a>
<a href="https://facebook.com/bobthedeveloper"><img src="https://img.shields.io/badge/Facebook-Like-3B5998.svg"></a> <a href="https://youtube.com/bobthedeveloper"><img src="https://img.shields.io/badge/YouTube-Subscribe-CE1312.svg"</a> <a href="https://twitter.com/bobleesj"><img src="https://img.shields.io/badge/Twitter-Follow-55ACEE.svg"></a> <a href="https://instagram.com/bobthedev
"><img src="https://img.shields.io/badge/Instagram-Follow-BB2F92.svg"></a> <a href="https://linkedin.com/in/bobleesj"><img src= "https://img.shields.io/badge/LinkedIn-Connect-0077B5.svg"></a>
<a href="https://medium.com/@bobleesj"><img src="https://img.shields.io/badge/Medium-Read-00AB6C.svg"/></a>
</p>

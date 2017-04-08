# Failable Init

## Introduction
In this lesson you are going learn how to design an init method that, first, possibly returns no object, but `nil`, second, even throws an error using error handling we talked about in Chapter 1.  

## Problem
Can initialization fail?


## Error Handling (Review)
```swift
enum NameError: Error {
  case noName
}

struct UdemyCourse {
  let courseName: String

  init(name: String) throws {
    if name.isEmpty {
      throw NameError.noName
    }
    self.courseName = name
  }
}

do {
  let myCourse = try UdemyCourse(name: "Bob")
  myCourse.courseName

} catch NameError.noName {
  print("Bob, please enter the name")
}
```


## Design Failable Init
Insert `?` right after `init`. When the init method is called, you may return `nil`.  If initialization is successful, it returns an object whose type is optional.

```swift
class Blog {
  let name: String
  init?(name: String) {
    if name.isEmpty {
      // handle error
      return nil
    }
    self.name = name
  }
}

let blog = Blog(name: "") // nil 

if let myBlog = blog {
  print(myBlog.name)
}
```

> I personally prefer error-handling approach since more explicit and no need to unwrap


### Resources
This is a review for you if you are not still familiar with Error Handling.

[Intro to Error Handling (Blog)](https://medium.com/ios-geek-community/intro-to-error-handling-in-swift-3-edb2ce6a6668#.2uk9hyp7h)

### Source Code
[2004_failable_init.playground](https://www.dropbox.com/sh/zduzf0flqdly0st/AAAkq8tFl8vfQ4FGoRoccLRla?dl=0)

## Conclusion
You've done two things with me in this lesson. First, you've learned how design an init method that may return `nil` or optional type by putting a `?` right to the `init` keyword. As we talked about it before. Anything that has `?` in Swift will give you an optional value. Second, you've revisited error handling. The `throws` keyword is not only used within an `else-if` block, but also it can used for an `init` method.

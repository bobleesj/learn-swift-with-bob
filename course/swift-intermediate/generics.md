# Generics
## Introduction
Welcome to Lesson 6 of The Swift Fundamentals with Bob. When you think of the word, "generic", what makes you think? Well, I'm sure you've thought of writing code that can work with many other types. Some of you guys be like, "What'?". I will walk you through. But remember, the number one goal is to write as little as possible, but produce more with.

## Problem
I smell something.
> For the reference read more about [code smell](/content/software-engineering/coding-principles.md#code-smell)

## Your Past
Let us reflect on how we rolled in the past. Let's attempt to access each element in an array.

```swift
let highSchoolGPA = [2.8, 3.2, 3.5, 3.8, 3.5]
let favoritePeople = ["Elon Musk", "Steve Jobs", "Kevin O'leary"]
let favoriteNumbers = [3, 20]
```

Worst way to access elements
```swift
highSchoolGPA[0]
highSchoolGPA[1]
highSchoolGPA[2]
```

### Loop and Print
But, there is a better way.

```swift
func printDoubleElement(array: [Double]) {
  for GPA in array {
    print(GPA)
  }
}

func printStringElement(array: [String]) {
  for person in array {
    print("I love \(person)")
  }
}

func printNumberElement(array: [Int]) {
  for number in array {
    print("I like \(number)")
  }
}
```
> Needlessly many functions. It goes against the DRY principle. Don't Repeat Yourself.

## Introducing Generics
A generic function allows you to pass any value regardless of types.   

```swift
func genericFunction<anything>(value: anything) {
  print(value)
}

func genericFunctions<WHATEVER>(value: WHATEVER) {
  print(value)
}
```

You may pass any type of value. Swift sets the type of `value` identical to what the user enters.

```swift
genericFunction(value: "Bob")  // value is String
genericFunction(value: true)    // value is Bool
```

### Generic Loop
Let us apply to a function that loops through an array.

```swift
func printElement<T>(array: [T]) {
  for element in array {
    print(element)
  }
}
```
Call the function

```swift
printElement(array: highSchoolGPA)
printElement(array: favoritePeople)
```

> Generic code enables you to write flexible, reusable functions and types that can work with any type, subject to requirements that you define.

Now only you can create a generic function, but also generic classes and structs. First, let's begin with a non-generic struct.

### Non-Generic Struct
```swift
struct Family {
  var members = [String]()

  mutating func push(member: String) {
    members.append(member)
  }
}
```

### Non-Generic Instance
```swift
var myFam = Family()
myFam.push(member: "Bob")
myFam.members
```

What if you need to create a struct whose type isn't `String`, but `Int`? You probably have to create an entire new struct whose the `members` property is in `[Int]`. Well, it goes against the dry principle. Let's gets started.

## Generic Struct
```swift
struct genericFam<T> {
  var members = [T]()

  mutating func push(member: T) {
    members.append(member)
  }
}
```

### Create Object Explicitly
Now, let's create an object from a generic struct. But, you have to specify the type you'd like to interact with.

```swift
// Generic whose type is String
var myGenericFamily = genericFam<String>()
myGenericFamily.push(member: "Bobby")

// Generic whose type is Int
var genericFamily = genericFam<Int>()
genericFamily.push(member: 123)
```
### Create Object Implicitly
Struct type inferred based on the property type.

```swift
let myHappyFamily = genericFam(members: [1, 2, 3, 4, 5])  // struct is now Int type
```

## Generic Extension
Grab the first value
```swift
extension genericFam {
  var firstElement: T? {
    if members.isEmpty {
      return nil
    } else {
      return members[0]
    }
  }
}

let geekFamilyMember = genericFam(members: ["Bob", "Bobby"])
let firstElement = geekFamilyMember.firstElement
```



### Resources
[The Complete Swift 3 Tutorial with Bob: Extension (YouTube)](https://www.youtube.com/watch?v=4pPtLjkF0HE)

[Intro to Generics in Swift with Bob (Bob the Developer)](https://medium.com/ios-geek-community/intro-to-generics-in-swift-with-bob-df58118a5001#.fkmmjqnwd)

### Source Code
[1006_generics.playground](https://www.dropbox.com/sh/wuf65widfors50d/AABCJF-aojTJLPGdA79Vc78Ma?dl=0)

## Conclusion
That's it. Generics provide such a powerful tool that many of the Swift library is written with generic code. To recap, you've learned how to make a generic function by putting a diamond sign on the right. You've also learned how to create generic structs. In Chapter 6, you will learn a lot more about generics.

You've learned a lot. I'm very proud of you. You might not find generics as useful in this course, but when you start learning practical protocol oriented programming, functional programming, and reactive programming, you will find out how generics appear quite often. That being said, let's keep learning.

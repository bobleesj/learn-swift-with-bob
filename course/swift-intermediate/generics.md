# Generics
## Introduction
Welcome to Lesson 6 of The Swift Fundamentals with Bob. When you think of the word, "generic", what makes you think? Well, I'm sure you've thought of versatile code. Some of you guys be like, "What'?". I will walk you through. Remember, the number one goal is to write as little as possible, but produce as much.

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

The Worst way to access elements

```swift
highSchoolGPA[0]
highSchoolGPA[1]
highSchoolGPA[2]
```

### Loop and Print
This works as well.

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
> Needlessly many functions. It goes against the DRY principle.

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

Swift infers the type of `anything` based on the input.

```swift
genericFunction(value: "Bob")  // value is String
genericFunction(value: true)    // value is Bool
```

### Generic Loop
Let us create a generic function.

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

> Generic code enables you to write flexible, reusable functions, classes, enums, protocols, and structs subject to **requirements** that you define.

Now only you can create generic functions, but also generic classes and structs. Let us begin with a non-generic struct.

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

What if you wish to create a struct whose type pre-defined as `String`, but `Int`? You probably have to create an entire new struct. It goes against the DRY principle.

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
Now, let us create an object from the generic struct. You have to specify the type you'd like to interact with.

```swift
var myGenericFamily = genericFam<String>()
myGenericFamily.push(member: "Bobby")

var genericFamily = genericFam<Int>()
genericFamily.push(member: 123)
```
### Create Object Implicitly
However, the type of structs can be inferred based on the input.

```swift
let myHappyFamily = genericFam(members: [1, 2, 3, 4, 5])  // T becomes Int
```

## Generic Extension
You may add an [extension](/course/swift-intermediate/extension.md) to generics for more features. Let us grab the first element in the `members` property.

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
[Intro to Generics in Swift with Bob](https://medium.com/ios-geek-community/intro-to-generics-in-swift-with-bob-df58118a5001#.fkmmjqnwd)

### Source Code
[1006_generics.playground](https://www.dropbox.com/sh/wuf65widfors50d/AABCJF-aojTJLPGdA79Vc78Ma?dl=0)

## Conclusion
To recap, you've learned how to design generic functions and structs. In Chapter 6, you will more about advanced generics along with enums and protocols. If you feel uncomfortable with the syntax, I recommend you to watch the lecture again and refer to the article I've attached.

You've come a long way. I'm very proud of your progress. You may not find generics as useful in this course. However, as you start implement practical protocol oriented programming, functional programming, and reactive programming, you will soon discover generics appear quite often.

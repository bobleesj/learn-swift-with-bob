# Intro to Generics
## Introduction
Welcome to Lesson 6 of The Swift Fundamentals with Bob. When you think of the word, "generic", what makes you think? Well, I'm sure you've thought of versatile code. What? Don't you dare worry. I will walk you through. Remember, the number one goal is to write as little as possible, but produce as much.

## Problem
I smell something.
> For the reference, read more about [code smell](/content/software-engineering/coding-principles.md#code-smell)

## Access Elements
Let us reflect on how we rolled in the past.

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
This is slightly better.

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

Swift infers the type of `anything` or `WHATEVER` based on the input.

```swift
genericFunction(value: "Bob")  // anything is String
genericFunctions(value: true)    // WHATVER is Bool
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
printElement(array: highSchoolGPA) // 2.8, 3.2, 3.5, ...
printElement(array: favoritePeople) // 'Elon Musk", "Steve Jobs", ...
```

> Generic code enables you to write flexible, reusable functions, classes, enums, protocols, and structs subject to [requirements](/course/swift-fundamentals/generics#type-constraints) that you define.

Now only you can create generic functions, but also generic classes and structs. Let us begin with a non-generic struct.

### Non-Generic Struct
Create a `Family` struct that contains `members` whose type is `[String]`. Add a method that appends to the array.

```swift
struct Family {
  var members = [String]()

  mutating func push(member: String) {
    members.append(member)
  }
}
```

> **Important:** The `mutating` keyword is added to function of `enum` and `struct` that mutates its own property/properties.

### Non-Generic Instance
```swift
var myFam = Family()
myFam.push(member: "Bob")
myFam.members // ["Bob"]
```

The struct above only works with `String`. Some families may have names in `Int`. Then, you must create a new struct. It goes against the DRY principle.

## Generic Struct

```swift
struct genericFam<T> {
  var members = [T]()

  mutating func push(member: T) {
    members.append(member)
  }
}
```

Instead of using `WHATEVER` or `anything`, `T` is a standard among iOS developers.

### Define Type Explicitly
Now, let us create an object from the generic struct. You have to specify the type based on the rule in Lesson 1.

```swift
var myGenericFamily = genericFam<String>()
myGenericFamily.push(member: "Bobby")

var genericFamily = genericFam<Int>()
genericFamily.push(member: 123)
```
### Define Type Implicitly
However, the type can be inferred based on the input.

```swift
let myHappyFamily = genericFam(members: [1, 2, 3, 4, 5])  // T becomes Int
```

## Generic Extension
You may add an [extension](/course/swift-fundamentals/extension.md) to generics for more features. Let us grab the first element in the `members` property.

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
let firstElement = geekFamilyMember.firstElement // "Bob"
```

## Type Constraints {#type-constraints}
So far, you could enter any value to define `T`. But, you may restricts the type you only want to interact with.

First, design two classes.

```swift
class LOL {}
class BabyLol: LOL {}
```

Now, let's create a function that only allows you to enter `LOL`.

```swift
func addLOLClassOnly<T: LOL>(array: [T]) { }
```

When you run the `addLOLClassOnly` function, you can't add anything besides whose type is `LOL`.

```swift
addLOLClassOnly(array: [LOL(), LOL(), LOL(), BabyLol()])
addLOLClassOnly(array: [1, 2, 3, 4, 5]) // Error
```

> **Important:** `BabyLol()` has been automatically upcasted to `LOL`.


### Resources
[Intro to Generics in Swift with Bob](https://medium.com/ios-geek-community/intro-to-generics-in-swift-with-bob-df58118a5001#.fkmmjqnwd)

### Source Code
[1006_generics.playground](https://www.dropbox.com/sh/p8i8134nmljh0js/AADR4Gi-RyEfyc_AwtA9H4aEa?dl=0)

## Conclusion
You now understand how to maintain yourself dry through generic functions and structs. In later chapters, you will more about advanced generics along with `enums` and `protocols`. If you wish to review generic the syntax, I recommend you to watch the lecture again or refer to the article I've attached.

In the next lesson, you will learn how to provide shortcuts within classes and structs instead of calling methods and properties.

> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

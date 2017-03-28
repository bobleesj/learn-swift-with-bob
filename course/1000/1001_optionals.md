# Optionals

## Introduction
Welcome to Lesson 1 of the Swift Fundamentals with Bob. When I first started programming in Swift just like many of you, I took courses from Udemy, Treehouse, Lynda. I bought books and whatever resources I could acquire to learn iOS Development.

For a month, I never really understood what those `?` and `!` stood for. Xcode kept telling me what to do on the left side. You know what I'm talking about. I got frustrated. It seemed like no courses gave me clear reasons how to use optionals, and most importantly, why Swift engineers have implemented such feature that is so unique compared to other programming languages. Well, let's dive into it.

## Problem
Why did Swift engineers implement optionals?

### Implicit and Explicit Type

#### Rule
 1. Every variable type must be defined (Implicit/Explicit)
 2. The Type is inferred based on the value

```swift
// String
let name: String = "Bob"          // Explicit
let newName = "Bob the Developer" // Implicit

// Numbers
let myAge: Int = 20               // Explicit
let mySisterAge = 14              // Implicit
let myGPA: Double = 3.54          // Explicit
```

### Fetching Profile Picture
When you fetch a profile picture from Facebook, it may return no value or `nil`. However, you can't store `nli` to a normal type based on the rule above.

```swift
// If could return "URL" or "nothing"
// Successful
let myProfileImageURL: String = "https//facebook.com/bobthedeveloper"
```

### Introduction to Optionals
Optional type allows storing `nil`.

```swift
let myName: String? = nil
let myNewName: String? = nil

print(myName)
print(myNewName)

let bobAge: Int? = nil
let robAge: Int? = 123
let danAge: Int? = 3
```

### Optionals Rules
1. Optionals/Normal Types do not interact with each other
2. Convert Optionals to Normal Type for usage. The process is also known as unwrapping.

```swift
// robAge + danAge
// Error
```

### Optionals Unwrapping
There are two ways to convert/unwrap optional types to normal types

1. Forced unwrapping
2. Implicit unwrapping

#### Forced Unwrapping
Forced Unwrapping should be avoided since it causes a crash if an optional contains `nil`. You may convert by inserting `!` at the end of  a variable/constant.

```swift
let profileImageFromFacebook: String? = "ImageURL..."
print(profileImageFromFacebook) // Optional

var image = profileImageFromFacebook! // String? converted to String

print(image) // Normal Type
print(profileImageFromFacebook!) // Normal Type

```
In order to interact between variables, you must convert.

```swift
let newRobAge = robAge!
let newDanAge = danAge!

newRobAge + newDanAge // Good
```

Bad things happen when you try to force unwrap an optional type whose value contains `nil`.

```swift
let bobAge: Int? = nil
// let newBobAge = bobAge! // Error
```

> You can't store `nil` to a normal type in Swift. It violates the rule mentioned above.

#### Implicit Unwrapping
Implicit unwrapping is another way to convert. However, even if an optional type contains `nil`, it does not break the system.

```swift
let profileImageFromFacebook: String? = "Bob's pretty image"

if let image = profileImageFromFacebook {
  print(image)
}
```
Now `image` is contain a normal type of `String`. You may use the `image` constant within the block.


### Source Code

### Resources
If you are still confused with optionals, feel free to watch an additional video similar to this on my YouTube channel. If not, you may skip.

[The Complete Swift 3 Tutorial with Bob: Optionals (YouTube)](https://www.youtube.com/watch?v=nTvngVHWe-M)


## Conclusion
Now you finally understand the why Swift engineers have implemented optionals and how to use them.

To be more specific, you've learned two fundamental concepts in the Swift programming language. The rule number one is that every variable type, even if optional, has to be defined whether explicitly or implicitly. Second, there are two ways to unwrap optionals to normal types.  `!` is used to force unwrap. `if let` is used to safely unwrap.

In our next lesson, you will learn why `?` and `!` appear you create an object and access its properties and methods.

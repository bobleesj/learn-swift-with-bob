# Optionals

## Introduction
Welcome to first lesson of the Swift Fundamentals with Bob. When I first started programming in Swift just like many of you, I took courses from Udemy, Treehouse, Lynda. I bought books and whatever resources I could acquire to learn iOS Development.

In the beginning, however, I could not understand what those `?` and `!` stood for, and why we use them. Xcode kept telling me what to do on the left side. You probably know what I'm talking about. I got frustrated. It seemed like no courses gave me clear reasons how to use optionals, and most importantly, why Swift engineers have implemented such feature that is so unique compared to other programming languages. Well, if you have asked the similar question, I'm here for you.

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
When you fetch a profile picture from Facebook, it may return no value or `nil`. However, you can't store `nil` to a normal type based on the rule above.

```swift
// If could return "URL" or "nothing"
// Successful
let myProfileImageURL: String = "https//facebook.com/bobthedeveloper"

let emptyProfileFile: String // Error
```

### Introduction to Optionals
Optional type allows storing `nil`, a.k.a absence of value.

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
2. Convert Optionals to Normal Type for usage. The process is also known as `unwrapping`.

```swift
// robAge + danAge
// Error
```

### Optionals Unwrapping
There are two ways to convert/unwrap optional types to normal types

1. Forced unwrapping
2. Implicit unwrapping

#### Forced Unwrapping
 You may convert by inserting `!` at the end of  a variable/constant. Forced Unwrapping should be avoided since it causes a crash if an optional contains `nil`.

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
// let newBobAge = bobAge!
// Error
```

> You can't store `nil` to a normal type in Swift. It violates the rule mentioned above.

#### Implicit Unwrapping
Implicit unwrapping is another way to convert. However, even if an optional type contains `nil`, it does not break the system. Instead, it ignores. Implicit unwrapping is similar to an `else-if` statement.

```swift
let profileImageFromFacebook: String? = "Bob's pretty image"

if let image = profileImageFromFacebook {
  print(image)
}
```
Now `image` is contain a normal type of `String`. You may use the `image` constant within the block. If `profileImageFromFacebook`. contains `nil`, Swift ignore the `{ print("image)") }`

### Source Code

### Resources
If you are still stuck with optionals, feel free to watch an additional video similar to this on my YouTube channel.

[The Complete Swift 3 Tutorial with Bob: Optionals (YouTube)](https://www.youtube.com/watch?v=nTvngVHWe-M)

<iframe src="https://docs.google.com/presentation/d/1DDhLcBX6kBheVXlQNxMCrJp_OP0mXC82NgJHCPnW-OY/embed?start=false&loop=false&delayms=3000" frameborder="0" width="100%" height="460" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>

## Conclusion
You've learned two fundamental concepts in the Swift programming language. The rule number one is that every variable type, even if optional, has to be defined whether explicitly or implicitly. Second, there are two ways to unwrap optionals to normal types.  `!` is used to force unwrap. `if let` is used to safely unwrap. This lesson might have been easy for you. Still, I just wanted to make sure everyone is on the same page.

In our next lesson, you will learn why `?` and `!` automatically appear when you create an object and access its properties and methods.

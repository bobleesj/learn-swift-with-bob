> **Note:** Learn Swift with Bob is available on Udemy. If you wish to receive a 30% discount link, you may use the coupon link [here](https://www.udemy.com/learn-swift-with-bob/?couponCode=LECTURENOTES).

# Optionals
## Introduction
Welcome to the first lesson of The Swift Fundamentals. When I first started programming in Swift, I took courses from Udemy, Treehouse, Lynda, and many more. Yet, I could not understand what those `?`s and `!`s stood for.  Xcode kept telling me what to do on the left side, causing more problems. It seemed like no instructor could explain the reasoning behind how to use optionals, and most importantly, why Swift engineers have implemented a such feature that is unique compared to other programming languages. Today, You will discover the **why** with me.

## Problem
Why did Swift engineers implement `optionals`?

## Implicit and Explicit Type

### Rules
 1. Every variable type must be defined (Implicit/Explicit)
 2. The type is inferred based on the value

```swift
// String
let name: String = "Bob"          // Explicit
let newName = "Bob the Developer" // Implicit

// Numbers
let myAge: Int = 20               // Explicit
let mySisterAge = 14              // Implicit
let myGPA: Double = 3.54          // Explicit
```
> Reasons for the rules above [Google Slide](/course/swift-intermediate/optionals.md#google_slide)

## Fetching Profile Picture
When you fetch a profile picture from Facebook, it may return no value, a.k.a`nil`. However, you may not store `nil` to a normal type based on the rule above.

```swift
// If could return "URL" or "nothing"

// Successful
let myProfileImageURL: String = "https//facebook.com/bobthedeveloper"
// Error
let myProfilePictureURL: String = nil
```

## Introduction to Optionals
Optionals allow storing `nil`, a.k.a absence of value.

```swift
let myName: String? = nil
let yourName: String? = "Bob Lee"

print(myName) // nil   
print(yourName) // Optional("Bob Lee")

let bobAge: Int? = nil
let robAge: Int? = 123
let danAge: Int? = 3
```

## Optionals Rules
1. Optionals/Normal Types do not interact with each other
2. Convert Optionals to Normal Types for usage. The process is also known as `unwrapping`.

```swift
robAge + danAge
// Error
```

## Optionals Unwrapping
There are two ways to convert/unwrap optional types to normal types

1. Forced unwrapping
2. Implicit unwrapping

### Forced Unwrapping
 You may convert by inserting `!` at the end of  the variable. Forced Unwrapping should be avoided since it causes a crash if the optional type contains `nil` since a normal type can't store `nil`.

```swift
let profileImageFromFacebook: String? = "ImageURL..."
print(profileImageFromFacebook) // Optional
```

Now, let us unwrap `profileImageFromFacebook`.

```swift
var image = profileImageFromFacebook! // String? converted to String
print(image) // Normal Type
print(profileImageFromFacebook!) // Normal Type
```

You must unwrap to work with variables.  

```swift
let newRobAge = robAge!
let newDanAge = danAge!

newRobAge + newDanAge // Good
```

Bad things happen when you try to force unwrap an optional type whose value contains `nil`.

```swift
var image: String? = nil
let normalImage = image!  // let normalImage = nil
// Error
```

> You can't store `nil` to a normal type in Swift. It violates the Swift rule.

### Implicit Unwrapping
Implicit unwrapping is a safe way to convert. If the optional type contains `nil`, it does not break the system. Instead, it ignores. Implicit unwrapping is an added feature to an `else-if` statement.

```swift
let imageFromFaceBook: String? = "Bob's Face"

if let normalImage = imageFromFaceBook {
  print(normalImage)
} else {
  print("There is no image")
}
```
Now `normalImage` contains a normal type of `String`. You may use the `normalImage` constant within the `if` block. On the contrary, if `imageFromFaceBook` contains `nil`, Swift executes the `else` block instead.

### Source Code
[1001_optionals.playground](https://www.dropbox.com/sh/wmnw7tpa16v8emo/AADjm-MP8lZOKZM0P6kPA4rea?dl=0)

### Resources {#google_slide}
<iframe src="https://docs.google.com/presentation/d/1DDhLcBX6kBheVXlQNxMCrJp_OP0mXC82NgJHCPnW-OY/embed?start=false&loop=false&delayms=3000" frameborder="0" width="100%" height="460" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>

## Conclusion
You've learned two fundamental concepts in the Swift Programming Language. The rule number one states, every type, even if `optionals`, has to be defined explicitly or implicitly for safety. Second, there are two ways to unwrap `optionals` to normal types.  You may force unwrap with `!` or safety unwrap with `if-let`.

In the next lesson, you will learn why `?` and `!` automatically appear when you create an object and access its properties and methods.

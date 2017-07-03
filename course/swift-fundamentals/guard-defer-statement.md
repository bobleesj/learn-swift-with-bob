# Guard Statement
## Introduction
Welcome to Lesson 3 of The Swift Fundamentals. When I started learning Swift for the first time, an `else-if` statement made sense. However, a `guard` statement rather seemed daunting. In fact, the name doesn't tell anything about what it does. One day, however, I discovered something. A `guard` statement is just another for you to write an `else-if` statement. A `guard` statement promotes zenness. In other words, it adds clarity, emptiness, and lots of cloud and space. Let us find out through examples.

> **Zenness:** A trait where peace, calmness, and inner awesomeness are all intertwined - [Urban Dictionary](http://www.urbandictionary.com/define.php?term=Zenness)

## Problem
1. Is there any alternative way to write an `else-if` statement?
2. How do you safely unwrap multiple `optionals`?

## Typical Else-If
Without having known about `guard`, you have used a long `else-if` statement to indicate an error message block.

```swift
func checkDrinkingAge() {
  let canDrink = true

  if canDrink {
    print("You may enter")
    // More Code
    // More Code
    // More Code

  } else {
    // More Code
    // More Code
    // More Code
    print("Let me take you to the jail")
  }
}
```

### Issues with Else-If
1.  Nested brackets
2.  Have to read every line to spot the error message

## Guard Statement
A `guard` block only runs if the condition is `false`, and it will exit out of the function through `return`. If the condition is `true`, Swift ignores the `guard` block. It provides an **early exit** and **fewer brackets**.

```swift
func checkDrinkProgram() {
  let iCanDrink = true

  guard iCanDrink else {
    // if iCanDrink == false, run this block
    print("Let's me take you to the jail")
    return
  }

  print("You may drink")
  // You may move on
  // Come on.
  // You may leave
  // You don't need to read this.
  // Only one bracket on the bottom: feeling zen.
}
```

## Unwrap Optionals with Else-If
A `guard` statement is not only useful for replacing a typical conditional block with an `else-if` statement, but also great for unwrapping `optionals` by minimizing the number of brackets. To compare, let's first begin how to unwrap multiple `optionals` with `else-if`.

First, let us create three `optionals` that will be unwrapped.

```swift
var publicName: String? = "Bob Lee"
var publicPhoto: String? = "Bob's Face"
var publicAge: Int? = nil
```
## The Worst Nightmare
You never want to do this.

```swift
func unwrapOneByOne() {
  if let name = publicName {
    if let photo = publicPhoto {
      if let age = publicAge {
        print("Bob: \(name), \(photo), \(age)")
      } else {
        print("age is mising")
      }
    } else {
      print("photo is missing")
    }
  } else {
    print("name is missing")
  }
}
```

The code above certainly works but violates the DRY principle. It's atrocious. Let us break it down.

> **DRY:** Don't Repeat Yourself

### Slightly Better
The code below is more readable than above.

```swift
func unwrapBetter() {
  if let name = publicName {
    print("Yes name")
  } else {
    print("No name")
    return
  }

  if let photo = publicPhoto {
    print("Yes photo")
  } else {
    print("No photo")
    return
  }

  if let age = publicAge {
    print("Yes age")
  } else {
    print("No age")
    return
  }
}
```
> When Swift encounters `return`, it stops and exits out of the function immediately

## Unwrap with Guard
The `else-if` statements can be replaced with `guard`.

```swift
func unwrapOneByOneWithGuard() {
  guard let name = publicName else {
    print("Name missing")
    return
  }

  guard let photo = publicPhoto else {
    print("Photo missing")
    return
  }

  guard let age = publicAge else {
    print("Age missing")
    return
  }
  print(name)
  print(photo)
  print(age)
}
```

## Unwrap Multiple Optionals with Else-If
So far, you've been unwrapping `optionals` one by one. Swift allows us to unwrap multiple `optionals` at once. If one of them contains `nil`, it will execute the `else` block.

```swift
func unwrap() {
  if let name = publicName, let photo = publicPhoto, let age = publicAge {
    print("Your name is \(name). I see your face right here, \(photo), you are \(age)")
  } else {
    // if any one of those is missing
    print("Something is missing")
  }
}
```
> **Important:** Be aware that when you unwrap multiple `optionals` at once, you can't identify which contains `nil`.

## Unwrap Multiple Optionals with Guard
Of course, we should use `guard` over `else-if`.

```swift
func unwrapWithGuard() {
  guard let name = publicName, let photo = publicPhoto, let age = publicAge else {
    // if one or two of the variables contain "nil"
    print("Something is missing")
    return
  }

  print("Your name is \(name). I see your, \(photo). You are \(age).")
  // Animation Logic
  // Networking
  // More Code, but still zen
}
```

## Defer Statement
> Defer Statement: Put off (an action or event) to a later time; postpone.

A `defer` block only executes only after current scope (loop, method, etc) exits.

```swift
func simpleDefer() {
  defer { print("Chill, later")  }
  print("Print First")
}
```

Let us execute the `simpleDefer()` function.
```swift
simpleDefer()
// "Print First"
// "Chill, later"
```

Another example,
```swift
for i in 1...3 {
  defer { print ("Deferred \(i)") }
  print ("First \(i)")
}

// First 1
// Deferred 1
// First 2
// Deferred 2
// First 3
// Deferred 3
```

### Usage Case for Defer
  - Executing completion handler blocks which you will learn in Chapter 3.  
  - Any code you want to explicitly inform your team without requiring them to read the entire function

### Source Code
[1003_guard_defer_statement.playground](https://www.dropbox.com/sh/s3zztv3o6h3xv6v/AABWT2Le9T9SXJegSq9pr19pa?dl=0)

## Conclusion
In this lesson, you've learned the power of `guard` over typical `else-if`.  First, it provides an early exit. Second, no one has to read the entire function to spot the error messages. You use a `guard` statement not just to please yourself, but for the sake of your teammates' falling hair when he/she reads your code. Keep guarding, everyone. Don't defer your learning, however.

> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

# Guard Statement
## Introduction
Welcome to Lesson 3 of The Swift fundamentals. When I learned Swift as my first programming language,  I understood  an `else-if` statement. However, a `guard` statement confused the heck out of me. Some of you guys may feel the same way as I did. Don't worry. I'm here for you today. You will understand that a `guard` statement is just another for you to write an `else-if` statement. A `guard` statement promotes zenness. In other words, it adds clarity, emptiness, and lots of cloud and space.

## Problem
Is there any better way to write an `else-if` statement? How do you safely unwrap multiple optionals?

## Typical else-if
Without having known guard statements, you probably have used a long `else-if` statement to indicate an error message block.

```swift
func checkDrinkingAge() {
  let canDrink = true

  if canDrink {
    print("You may enter")
    // More
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

## Issues with else-if
1.  Nested brackets
2.  Have to read every line to spot the error message

## Guard Statement
A `guard` block only runs if the condition is `false`, and it will exit out of the function through `return`. If the condition is `true`, Swift will ignore the block. Eventually, it provides an **early exit** and **fewer brackets**.

```swift
func checkDrinkProgram() {
  let iCanDrink = true

  guard iCanDrink else {
    // if iCanDrink == false, run this block
    print("You can't drink")
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
A `guard` statement is not only useful for replacing an `else-if` statement, but also great for unwrapping optionals by minimizing the number of brackets. To compare, let's first begin how to unwrap multiple optional types using an `else-if`.

First, there are three optional variables.

```swift
var publicName: String? = "Bob Lee"
var publicPhoto: String? = "Bob's Face"
var publicAge: Int? = nil
```


### The Worst Nightmare
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
`return` within each `else` block is used to exit out of the function.

## Unwrap with Guard
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
You may unwrap multiple optional types at once. If one of them contains `nil`, it will execute the `else` block.

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

## Unwrap Multiple Optionals with Guard
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

In Swift, it will execute a block of code until the current scope (loop, method, etc) exits.

```swift
func simpleDefer() {
  defer {
    print("Chill, later")
  }

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
 Completion handler block, or any code you want to explicitly inform your team without having to read the entire block.

### Source Code
[1003_guard_defer_statement.playground](https://www.dropbox.com/sh/n0kb3mv5unyhj5w/AADzn2E55lnMbi2d39pVjS6aa?dl=0)

## Conclusion
Now you understand the power of using a `guard` statement. It provides an early exit and you don't have to read all the way to the bottom spot the error messages. You use a `guard` statement not just to please yourself, but also for the sake of your teammates' falling hair when he/she reads your code.

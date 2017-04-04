# Guard Statement
## Introduction
Welcome back to Lesson 3 The Swift fundamentals. First of all, let me share a story of mine. When I learned Swift as my first programming language,  I understood  an `else-if` statement. It wasn't a big deal. For example, if something is `true`, run the block of code. However, a `guard` statement confused the heck out of me. Some of you guys may feel the same way as I did. Don't worry. I'm here for you today. You will understand that a `guard` statement is just another for you to write an `else-if` statement. A `guard` statement promotes zenness. In other words, it adds clarity, emptiness, and lots of cloud and space. Let's get in.

## Problem
Is there any better way to write an `else-if` statement? How do you safely unwrap many optionals?

### Typical else-if
Without having known guard statements, you probably used a long `else-if` statement to handle an error message block.

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

### Issues with else-if
1.  Nested brackets
2.  Have to read every line to spot the error message

### Guard Statement
A `guard` block only runs if the condition is `false`, and it will exit out of the function through `return`. If the condition is `true`, Swift will ignore the block.  Eventually, it provides an early exit and fewer brackets.

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
A `guard` statement is not only useful for replacing an `else-if` statement, but also for unwrapping optionals by minimizing the number of brackets. To compare, let's first begin how to unwrap multiple optional types using an `else-if`.

First, there are three optional types.

```swift
var publicName: String? = nil
var publicPhoto: String? = "URL"
var publicAge: Int? = 31
```


### Worst Nightmare
```swift
 func unwrapOneByOne() {
  if let name = publicName {
    if let photo = publicPhoto {
      if let age = publicAge {
        print("Yes age")
      } else {
        print("No age")
        return
      }
      print("Yes photo")
    } else {
      print("No photo")
      return
    }
    print("Yes name")
  } else {
    print("No name")
    return
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
### Unwrap Multiple Optionals with Else-If
```swift
func unwrap() {
  if let name = publicName, let photo = publicPhoto, let age = publicAge {
    print("Your name is \(name). I see your face here, \(photo), you are \(age)")
  } else {
    print("Something is missing")
    // Animation Logic
    // Networking
    // return
  }
```

### Unwrap Multiple Optionals with Guard
Let's learn how a `guard` statement is used as a way to safely/implicitly unwrap optionals.

```swift
func safetlyUnwrapUsingGuard() {
  guard let name = publicName, let photo = publicPhoto, let age = publicAge else {
    //  If  one or more optionals contain nil
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

### Usage Case
 Completion handler block, or any code you want to explicitly inform your team without reading the entire block.  function/method.

### Source Code
[1003_guard_defer_statement.playground]

[1003_guard_defer_statement.playground]: https://www.dropbox.com/sh/t809vje5icodnvz/AACWWIxjan6RlEfvgCuT87uVa?dl=0


### Resources
[The Complete Swift 3 Tutorial with Bob: Guard Statement (YouTube)](https://www.youtube.com/watch?v=oeUYGNLqqqg)

## Conclusion
By now, I hope you understand the power of using a `guard` statement. It provides an early exit and you don't have to read all the way to the bottom spot the error messages. You use a `guard` statement not just to please yourself, but also for the sake of your teammates' falling hair when he/she reads your code.

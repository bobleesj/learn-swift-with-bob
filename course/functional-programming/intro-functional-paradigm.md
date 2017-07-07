# Intro to Functional Paradigm
## Introduction
Welcome to the first lesson of Functional Programming in Swift. I've decided to dedicate this lesson for explaining what it means to look at or solve problems with a functional perspective. Let's begin.

## Problem
What is functional programming


### Definition
> “Functional Programming is a paradigm that allows you to make your code explicit. There is no state and no mutuality”  - What?

Most bloggers begin with the statement above. However, it's a horrible sentence to bring up in the very beginning. Let's learn the statement above organically with me.

### Non-Functional Programming
In the past, to sum an array, you probably have used the approach below.

```swift
// Somewhere in ViewController
let numbers = [1, 2, 3]
var sum = 0
for number in numbers {
  sum += number
}
```

If you need to use the add functionality again, you probably have reused the code somewhere else.

```swift
// Somewhere in NextViewController
let newNumbers = [4, 5, 6]
var newSum = 0
for newNumber in numbers {
  newSum += newNumber
}
```

The above examples are horrendous. It violates the DRY principle which we must serve. There is no need to create 5 lines of code which can be done just in a single line.

### Functional Programming
Let's begin the process. Let's create a function instead.

```swift
func saveMeFromMadness(elements: [Int]) -> Int {
  var sum = 0
  for element in elements {
    sum += element
  }

  return sum
}
```

Now, let's attempt to use the above function.

```swift
// Somewhere in ViewController
saveMeFromMadness(elements: [1, 2, 3])

// Somewhere in NextViewController
saveMeFromMadness(elements: [4, 5, 6])
```

Look, now you only need to write two lines of code which required 10 lines. That's it.

> **Bob's Definition:**  Functional programming is nothing more than using functions to derive results. No need to get fancy.

### Usage Case
One area that a functional paradigm is used in Excel's Spreadsheet functions. The functions are written probably written in the C# language. We simply use built-in functions to derive results.

![Excel Sum Function](/course/functional-programming/assets/excel-sum-function.gif)

#### Declarative: Functional
Sometimes, functional programming is described as *declarative*. In other words, the user does not care about the process. They only care about the result. For example, when my father is using Excel to manage the company's financial data, he doesn't care how the `Sum` function is written behind the scene. He simply uses the function.

Ex) Jump off from an airplane vs climb the mountain.

#### Imperative: Non-Functional
It tells you how you got the answer from A → B.

Ex) The for-in loop

### Benefits of Functional Programming
A functional paradigm ensures no mutability or no change in state when used.
  - Modularity
  - No explicit state management
  - Fewer lines
  - Conventional communication

### Source Code
[5001_intro_functional_paradigm]()

### Resources
[Intro to Swift Functional Programming](https://blog.bobthedeveloper.io/intro-to-swift-functional-programming-with-bob-9c503ca14f13)

[10 Tips to become a better developer](https://medium.com/ios-geek-community/10-tips-to-become-better-swift-developer-a7c2ab6fc0c2#.rcnngphgj)

## Conclusion
Now, I've demystified the concept of "Functional Programming" for you. Again, based on my simplest definition, it's nothing more than using functions to solve problems.

In the Swift Foundation library built by Apple Engineers, there are dozens of useful functions for us developers may use. However, as a developer, we've got to know the behind scene of each function. In the rest of the chapter, you will learn how those functions are created and you will be able to produce on your custom functions depending on your need. From now on, the lesson can get rough and tough, again, make sure you completely understand closures and generics before you jump in.  

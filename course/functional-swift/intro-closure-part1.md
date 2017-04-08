# Closures vs Functions


## Introduction
When I learned Swift as my firsts programming language, I had a really hard time understanding closures. I avoided it as much as possible, and I didn't know why we use it in the first place. It took me good 3 months to completely understand Closures. So, I don't expect you to be comfortable with closures taking by taking a couple of lessons. It is hard, and you just have to admit it. It's riding a bicycle for the first time. You just have to fall and feel uncomfortable until you get used it. It's like seeing a mathematical formula you've never seen before. You just have to get used it. Enough said, let's find out how closures is different from normal functions. Brace yourself.

## Problem
Who are you closures, () -> ()?

### Definition
 - A closure is a function without name and the func keyword (for now).
 - Quick and easy to carry around as a variable/constant or just pass as a parameter

### Functions
Create a function that add two numbers.
```swift
func addTwoNumbers(number1: Int, number2: Int) -> Int {
  return number1 + number2
}
```

#### First Class Citizen
You may store a function into a variable/constant.
```swift
var addFunction = addTwoNumbers
addFunction(10, 30) // 40
```

### Introducing Closures
Store closures into a variable. A closure begins with `{`. In order to store into a variable/constant, you must specify its type.

```swift
var addClosures: (Int, Int) -> Int = {
  (number1: Int, number2: Int) in
  return number1 + number2
}

addClosures(4, 10) // 14
```

#### Short Form
You may not enter `return` after `in` if only if you enter the value that the closure expects to return.

```swift
var addClosuresTwo = {
  (number1: Int, number2: Int) in
  return number1 + number2
}

var addClosuresThree = {
  (number1: Int, number2: Int) in
  number1 + number2
}

addClosuresThree(4, 6)
```

#### Shortest Form
As long as you specify the type, you may not create an argument label. You may just insert `$0` or `$1`.

```swift
var addClosuresFour: (Int, Int) -> Int = { $0 + $1 }

addClosuresFour(4, 5) // 9
```

### One example with () -> String
```swift
func callString() -> String {
  return "hello, I'm a function"
}

let callStringWtihClosure: () -> String = { () in
  print("hello")
  return "hello, I'm a closure"
}

callStringWtihClosure()
// "hello, I'm a closure"

let callStringWtihClosureTwo: () -> String = { () in
  "hello, I'm a closure"
}

let callStringWtihClosureThree: () -> String = { "hello, I'm a closure" }
let callStringWtihClosureFour = { "hello, I'm a closure" }
callStringWtihClosureFour // () -> String
```

### Resource
If you are not familiar with closures, you have to get used to it. Again, it took me ages to a couple weeks to get used to it. You must understand. Keep googling on your own.

[No Fear Closure in Swift 3 with Bob]

[No Fear Closure in Swift 3 with Bob]: https://blog.bobthedeveloper.io/no-fear-closure-in-swift-3-with-bob-72a10577c564


### Source Code
[3001_intro_closures_part1.playground](https://www.dropbox.com/sh/dz7zn4gthlms8oh/AAAlcQb3Nu_SD2X3NDLRnZxKa?dl=0)


## Conclusion
Do you feel uncomfortable or confused? That's okay. It's just a part of the process of acquiring knowledge. You struggle to learn because it indicates that you are not in your comfort zone. Learning is done by your. So, if you need to, refer to my resources, and google until you figure out what's going on. Don't give up. I hope you are able to distinguish the difference between a function and variable. Remember you can store a function into a variable and carry it around. Also, when you make a closure, you must indicate its type. You've learned how to write a closure statement using longer as well as shorter syntax by putting dollar signs and eliminating `in` and `return`. In the next lesson, you will find out how to pass closure as a parameter in a function.

# Closures vs Functions


## Introduction
Welcome to Lesson 1 of The UIKIt Fundamentals Part 1 Intro to Functional Programming. When I learned Swift as my firsts programming language, I had a really hard time understanding closures. I avoided it as much as possible, and I didn't know why we use it in the first place. It took me good 3 months to completely understand Closures. So, I don't expect you to be comfortable with closures taking by taking a couple of lessons. It is hard, and you just have to admit it. It's riding a bicycle for the first time. You just have to fall and feel uncomfortable until you get used it. It's like seeing a mathematical formula you've never seen before. You just have to get used it. Enough said, let's find out how closures is different from normal functions. Brace yourself.

## Problem
Who are you closures? () -> ()?

### Definition
A closure is a function without name and the func keyword (for now).

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
addFunction(10, 14) // 24
addFunction(14, 21) // 35
```

### Introducing Closures
Store closures into a variable. A closure begins with `{`. In order to store into a variable/constant, you must specify its type.

```swift
var addClosures: (Int, Int) -> Int = { (number1: Int, number2: Int) in
  return number1 + number2
}

addClosures(4, 10) // 14
addClosures(52, 123) // 178
```

#### Short Form
You may not enter `return` after `in` if only if you enter the value that the closure expects to return.

```swift
var sumWithClosure: (Int, Int) -> Int = { (number1: Int, number2: Int) in
  number1 + number2
}
```

#### Shortest Form
As long as you specify the type, you may not create an argument label. You may just insert `$0` or `$1`.

```swift
var sumWithClosures: (Int, Int) -> Int = { $0 + $1 }
sumWithClosures(4, 10)
```

### More Examples

```swift
// No paramter. Just return String
let closureString: () -> String = { () in
  return "hello"
}

// Identical example as above, but shorter form
let closuresString: () -> String = { "hello" }
closuresString()

// Enter two parameters and return Int
var timesClosure: (Int, Int) -> Int = { $0 * $1 }
timesClosure(523, 12321)
```

### Resource
If you are not familiar with closures, you may watch this introductory video. You have to get used to it. Again, it took me ages to a couple weeks to get used to it. You must understand. Keep googling on your own.

[The Complete Swift 3 Tutorial: Closures (YouTube)](https://www.youtube.com/watch?v=fzqRas21_BM&t=17s)

### Source Code
[1301_Closures vs Functions](https://www.dropbox.com/sh/lrzldf9n402hm3c/AACLZ8h2N9LY1NGLMVoJJzz0a?dl=0)

Closure Part 1
Closure Part 2

## Conclusion
Do you feel uncomfortable or confused? That's okay. It's just a part of the process of acquiring knowledge. You struggle to learn because it indicates that you are not in your comfort zone. Learning is done by your. So, if you need to, refer to my resources, and google until you figure out what's going on. Don't give up. I hope you are able to distinguish the difference between a function and variable. Remember you can store a function into a variable and carry it around. Also, when you make a closure, you must indicate its type. You've learned how to write a closure statement using longer as well as shorter syntax by putting dollar signs and eliminating `in` and `return`. In the next lesson, you will find out how to pass closure as a parameter in a function.

#### Stay Connected
If you'd like to be on my mailing list and receive personal updates on upcoming books and courses, feel free to send me an email at `bobleesj@gmail.com`
<p>
<a href="http://bobthedeveloper.io"><img src="https://img.shields.io/badge/Personal-Website-333333.svg"></a>
<a href="https://facebook.com/bobthedeveloper"><img src="https://img.shields.io/badge/Facebook-Like-3B5998.svg"></a> <a href="https://youtube.com/bobthedeveloper"><img src="https://img.shields.io/badge/YouTube-Subscribe-CE1312.svg"</a> <a href="https://twitter.com/bobleesj"><img src="https://img.shields.io/badge/Twitter-Follow-55ACEE.svg"></a> <a href="https://instagram.com/bobthedev
"><img src="https://img.shields.io/badge/Instagram-Follow-BB2F92.svg"></a> <a href="https://linkedin.com/in/bobleesj"><img src= "https://img.shields.io/badge/LinkedIn-Connect-0077B5.svg"></a>
<a href="https://medium.com/@bobleesj"><img src="https://img.shields.io/badge/Medium-Read-00AB6C.svg"/></a>
</p>

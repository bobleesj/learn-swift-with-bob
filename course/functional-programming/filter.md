# Filter
## Introduction
Welcome to the legit lesson of Functional Programming in Swift. As I've mentioned, there are a lot more than 4 functions besides `filter`, `map`, `reduce`, and `flatmap` in the functional programming world. However, the purpose isn't to memorize all. It is to understand what goes under the hood so that nobody has to become a zombie. Today, let's take a look at one popular function called, `filter` which is used to "filter" a group of objects.

## Problem
How to get things done with one line of code?

> **Note:** Most people use Swift functions without knowing the behind implementation

### Imperative/Non-functional
Let's attempt to grab even numbers using a non-functional approach.

```swift
// Get even numbers
var evens = [Int]()

for i in 1...10 {
  if i % 2 == 0 {
    evens.append(i)
  }
}
```

It certainly works. But, you know what I'm about to say.

### Declarative/Functional
If you remember correct, `Array` is just a `struct` and it contains built-in methods. `filter` is one of them. Let us utilize the `filter` function to get things done. You don't have to understand what goes under the hood at this point, but you will by creating our own custom `filter` function.

```swift
Array(1...10).filter { (number) in number % 2 == 0 }
Array(1...10).filter { $0 % 2 == 0 }
```

Let us find out what the heck is going on. Don't you worry. As long as you are comfortable with closures and generics, you will get through with me.

### Become an A Student
My mom used to love (still do since I'm in college) when I handed my grade sheet filled with "A"s. Let's find out how to only get "A" letters to please my mom.

```swift
let recentGrade = ["A", "A", "A", "A", "B", "D"] // It can be any data
```

#### Imperative/Non-functional
In the past, you probably have done something like this as shown below.

```swift
var happyGrade: [String] = []

for grade in recentGrade {
  if grade == "A" {
    happyGrade.append(grade)
  } else {
    print("My mama not happy")
  }
}
print(happyGrade) // ["A", "A", "A", "A"]
```

The code above tells you the steps how you filtered `recentGrade`. This is long, boring, and confusing. You've created arbitrary instances such as `happyGrade` and `grade` which other developers must interpret. It consumes more calories which isn't good for executing a simple task.  

### Functional Way
From now on, you might find it difficult. Bear with me. First of all, let's create a function either returns `true` or `false` based on the parameter.

Create closure block that returns true/false

```swift
var isMomHappy: (String) -> Bool = { grade in return grade == "A" }
isMomHappy = { $0 == "A" }

isMomHappy("A") // true
isMomHappy("B") // true
```

Create a function that take the closure block whose type is `(String) -> Bool`. I will call the parameter as `operation`.

```swift
func simpleStringFilter(grades: [String], operation: (String) -> Bool) {
  var happyGrade: [String] = []
  for grade in grades {
    if operation(grade) {
      happyGrade.append(grade)
    }
  }
}
```

Within the `simpleStringFilter`, the `operation` closure is executed. If `operation` returns `true`, append the grade to `happyGrade`.

Let's execute `simpleStringFilter`.  The `isMomHappy` closure is passed  to the `operation` parameter.

```swift
simpleStringFilter(grades: recentGrade, operation: isMomHappy) // ["A", ...]
```

The entire function may also return `[String]`

```swift
func stringFilter(grades: [String], operation: (String) -> Bool) -> [String] {
  var happyGrade: [String] = []
  for grade in grades {
    if operation(grade) {
      happyGrade.append(grade)
    }
  }
  return happyGrade
}
```

Execute `stringFilter`.

```swift
let myGrade = ["A", "A", "A", "A", "B", "D"]
let happyGrade = stringFilter(grades: myGrade, operation: isMomHappy)
happyGrade // ["A", ...]
```

### Pass Closure Directly
So far, you've passed the closure block indirectly to the `operation` parameter using `isMomHappy`. However, you may directly enter a closure block. The syntax may look strange but I'm sure you are comfortable with closures at this point.

```swift
stringFilter(grades: myGrade, operation: { element in return element == "A" })
stringFilter(grades: myGrade, operation: { $0 == "A" })
```

### Generic Function
If you remember from Chapter 1, intro to generics, it doesn't make sense to create a distinct function just for `String` only. Let us utilize the Swift generics.

```swift
func bobFilter<Bob>(array: [Bob], operation: (Bob) -> Bool) -> [Bob] {
  var result: [Bob] = []
  for element in array {
    if operation(element) {
      result.append(element)
    }
  }
  return result
}
```

The placeholder type of `bobFilter` is `Bob` which should be defined later. Usually, we use `T` instead.

```swift
func myFilter<T>(array: [T], operation: (T) -> Bool) -> [T] {
  var result: [T] = []
  for element in array {
    if operation(element) {
      result.append(element)
    }
  }
  return result
}
```

### Examples
So, let us find out how `myFilter` can be used.

#### Ex 1) Filter Numbers
```swift
let AStudent = myFilter(array: Array(1...100), operation: { $0 >= 93 && $0 <= 100 })
print(AStudent) // [93, 94, 95, ... 100]
```

#### Ex 2) Vote Counting
```swift
let answer = [true, false, true, false, false, false, false]
let trueAnswer = myFilter(array: answer, operation: { $0 == true })
```

The rest is history. You can use your imagination from now on.

You may also utilize trailing closures to beautify.

```swift
let falseAnswer = myFilter(array: answer) { $0 == false }
```

### Built-in Swift Filter
As I mentioned earlier, `Array<T>` comes with its own `filter`. Let us utilize. We don't have to reinvent.

```swift
let zeroToHund = Array(1...100)
zeroToHund.filter{ $0 % 2 == 0 }.filter { $0 <= 50 }
// [2, 4, 6, 8, 10, 12, 14, ..., 50]
```

### The Purest Form
The built-in `filter` may look something like this. Since you have not taken generics protocols in the following chapter and Advanced Swift, you may be confused with `Element`. It's the type of an array for now.  

```swift
extension Array {
  func myFilter(_ logic: (Element) -> Bool) -> [Element] {
    var result: [Element] = []
    for item in self {
      if logic(item) {
        result.append(item)
      }
    }
    return result
  }
}
```

Let us test it out.

```swift
let result = Array(1...100).myFilter { $0 % 2 == 0 }
```

### Source Code
[6002_filter.playground]()

### Resources
[Intro to Functional Programming](https://blog.bobthedeveloper.io/intro-to-swift-functional-programming-with-bob-9c503ca14f13)

## Conclusion
Congratulations. You've learned what goes under the hood of `filter`, one of the most common functions. From now on, you understand what it means to pass a closure block at the end and you've learned how the closure block is used within the main function. This principle applies in every other major functions we will take a look at. Along with generics, it allows reusability, thus scalability in your code base.

At the end of the lesson, I've mentioned `Element` of an array. I don't expect you to know what it is. However, in the last chapter of this course, you will learn the behind scene by understanding the statement, "Swift is a protocol oriented programming language". Let's continue. 

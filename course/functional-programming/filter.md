# Filter
## Introduction
Welcome to the legit lesson of Functional Programming in Swift. As I've mentioned, there are a lot more than 4 functions besides `filter`, `map`, `reduce`, and `flatmap` in the functional programming world. However, the purpose isn't to memorize all. It is to understand what goes under the hood so that nobody has to become a zombie. Today, let's take a look at one popular function called, `filter` which is used to "filter" a group of objects.

## Problem
How to get things done with one line of code?

> **Note:** Most people use Swift functions without knowing the behind implementation

### Imperative/Non-functional
```swift
// Get even numbers
var evens = [Int]()

for i in 1...10 {
  if i % 2 == 0 {
    evens.append(i)
  }
}
```

### Declarative/Functional
You may execute the task above using the built-in `filter` method by the `Array` struct. However, you will discover how things work throughout this lesson. If you are stuck, don't you worry. I will walk you through.

```swift
Array(1...10).filter { (number) in number % 2 == 0 }
Array(1...10).filter { $0 % 2 == 0 }
```

### Become an A Student
My mom used to like when I handed my grade sheet filled with "A"s. Let's find out how to only get "A" letters to please my mom.

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

### Generic Filter
```swift
func bobFilter<Bob>(array: [Bob], logic: (Bob) -> Bool) -> [Bob] {
  var result: [Bob] = []
  for element in array {
    if logic(element) {
      result.append(element)
    }
  }
  return result
}
```

```swift
func myFilter<T>(array: [T], logic: (T) -> Bool) -> [T] {
  var result: [T] = []
  for element in array {
    if logic(element) {
      result.append(element)
    }
  }
  return result
}
```

```swift
let myGrade = ["A", "A", "A", "A", "B", "D"]
let lovelyGrade = stringFilter(grades: myGrade, operation: isMomHappy)
```

```swift
stringFilter(grades: myGrade, operation: { $0 == "A" })
```

```swift
let AStudent = myFilter(array: Array(1...100), logic: { $0 >= 93 && $0 <= 100 })
print(AStudent) // [93, 94, 95, ... 100]
```

```swift
let answer = [true, false, true, false, false, false, false]
let trueAnswer = myFilter(array: answer, logic: { $0 == true })
```

```swift
// Trailing Closure
let falseAnswer = myFilter(array: answer) { $0 == false }
```


```swift
let zeroToHund = Array(1...100)
zeroToHund.filter{ $0 % 2 == 0 }.filter { $0 <= 50 }
// [2, 4, 6, 8, 10, 12, 14, ..., 50]
```

### The Purest Form

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

Test it out.

```swift
let result = Array(1...100).myFilter { $0 % 2 == 0 }
```

### Source Code

### Resources

## Conclusion

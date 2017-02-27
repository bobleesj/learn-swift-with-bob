
# Intro to Functional Programming

## Non Functional Programming

```swift
// Somewhere in ViewController
let numbers = [1, 2, 3]
var sum = 0
for number in numbers {
  sum += number
}
```

```swift
// Somewhere in NextViewController
let newNumbers = [4, 5, 6]
var newSum = 0
for newNumber in numbers {
  newSum += newNumber
}
```

## Functional Approach

```swift
func saveMeFromMadness(elements: [Int]) -> Int {
  var sum = 0
  for element in elements {
    sum += element
  }

  return sum
}
```

## Calling Functions
```swift
// Somewhere in ViewController
saveMeFromMadness(elements: [1, 2, 3])
// Somewhere in NextViewController
saveMeFromMadness(elements: [4, 5, 6])
```

## Introduction to Filter Imperatively

```swift
let recentGrade = ["A", "A", "A", "A", "B", "D"] // My College Grade

var happyGrade: [String] = []
for grade in recentGrade {
  if grade == "A" {
    happyGrade.append(grade)
  } else {
    print("Ma mama not happy")
  }
}

print(happyGrade) // ["A", "A", "A", "A"]
```


## Functional Filter
```swift
let mumHappy: (String) -> Bool = { grade in return grade == "A" }
let mamHappy: (String) -> Bool = { $0 == "A" }
```

### Filter String
```swift
func stringFilter(grade: [String], returnBool: (String) -> Bool) -> [String] {
  var happyGrade: [String] = []

  for letter in grade {
    if returnBool(letter) {
      happyGrade.append(letter)
    }
  }
  return happyGrade
}
```

```swift
let myGrade = ["A", "A", "A", "A", "B", "D"]
```

```swift
let lovelyGrade = stringFilter(grade: recentGrade, returnBool: mamHappy)
print(lovelyGrade) // ["A", "A", "A", "A"]
```

## Pass Closure Directly
```swift
stringFilter(grade: myGrade, returnBool: { grade in
return grade == "A" })
```

## Generic Filter
```swift
func myFilter<Bob>(array: [Bob], logic: (Bob) -> Bool) -> [Bob] {
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
let AStudent = myFilter(array: Array(1...100), logic: { $0 >= 93 && $0 <= 100 })
print(AStudent) // [93, 94, 95, ... 100]
```

## Application to Vote Counting
```swift
let answer = [true, false, true, false, false, false, false]
let trueAnswer = myFilter(array: answer, logic: { $0 == true })
```

### Trailing Closure
```swift
let falseAnswer = myFilter(array: answer) { $0 == false }
```


## Swift Default Filter
```swift
let zeroToHund = Array(1...100)
print(zeroToHund.filter{ $0 % 2 == 0 }.filter {$0 <= 50})
```


Updates on [Instagram](https://instagram/bobthedev) and [Facebook Page](https://facebook.com/bobthedeveloper).  More tutorials on [YouTube](https://youtube.com/bobthedeveloper)

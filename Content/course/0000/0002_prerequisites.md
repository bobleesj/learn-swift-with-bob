# Course Prerequisites
To maximize your learning, you should be familiar with the following Swift syntax.

## Swift Fundamentals

### For-In Loops
```swift
for _ in 1...100 {
  print("Repeat")
}

// "Repeat"
// "Repeat"
// ...
```

### Switch Statement
```swift
switch number {
case 1...10 :
  print("Your number is between 1 to 10")
default:
  print("I don't know")
}
```

### Var vs Let
```swift
let imuttableName = "Bob"
var muttableName = "Bobby"

imuttableName = "SangJoon" // Error
```

### Else-If Statement
```swift
if isBobHansome {
  print("He good")
} else {
  print("That's okay")
}
```

### Types
```swift
let string = "String"
let bool = true
let double = 20.0
let int = 20
```

### Array and Dictionary
```swift
let countries = ["S.Korea", "USA", "Vietnam", "Malaysia"]
let info = ["Height": 183, "Age": 20]
```

### Function
```swift
func returnName() -> String {
  return "Bob the Developer"
}
```

### Basic Operators
```swift
1 + 1
3 / 2
2 * 4
9 % 5
```

### Intro to Enums
```swift
enum Race: String {
  case asian
  case white
  case black
  case hispanic
}

Race.asian.rawValue // "asian"
```

## Object Oriented Programming
You should be familiar with initialization, property, method, and inheritance

```swift
 class Human {
   let name: String

   init(enterName: String) {
     name = enterName
   }

   func sayName() {
     print("Hi, I'm \(name)")
   }

 }
```

If you are not confident with any of those topics above, you may watch my videos I've for complete beginners below on YouTube. Remember, this course is designed for those have played around with Swift and iOS.

[The Complete Swift 3 Beginner's Tutorial with Bob](https://www.youtube.com/playlist?list=PL8btZwalbjYlRZh8Q1VK80Ly0YsZ7PZxx)


#### Source code
[0002_Prerequisites](https://www.dropbox.com/sh/33thop7ornp9u90/AACA-JPFoW3ie4EAW56-WZH2a?dl=0)

# Map
## Introduction
Welcome to the second legit lesson of functional programming. In the previous lesson, you've learned how to filter objects within a group of objects. Today, we are going to take a look at how to manipulate each object in a group of objects with one line of code. For example, if you have an array of `[3, 4, 5]`, you can simply square each element to `[9, 16, 25]` in one line of code. Let's begin.

## Problem
`[1, 2, 3, 4, 5]` to `[1, 4, 9, 16, 25]` in one line


### Imperative/Non-functional
Let us attempt to square each element in an array.

```swift
var squaredNumbers: [Double] = []

var numbers = [1.0, 2.0, 3.0, 4.0, 5.0]
for number in numbers {
  squaredNumbers.append(number * number)
}
```

Horrendous.

### The Built-in Map Function
Swift provides us with a built-in method just like `filter`.

```swift
numbers.map { $0 * $0 } // [1, 4, 9, 16, 25]
```

Let us find out what goes under the hood.

### Non-Generic Map (Double)
Unlike `filter`, the `map` function adds each element to an array. The `operation` parameter, closure block, manipulates each element as shown below.

```swift
func myMap(numbers: [Double], operation: (Double) -> Double) {
  var result: [Double] = []
  for number in numbers {
    let transformedValue = operation(number)
    result.append(transformedValue)
  }
}
```

Let `myMap` return `[Double]`

```swift
func myMap(numbers: [Double], operation: (Double) -> Double) -> [Double] {
  var result: [Double] = []
  for number in numbers {
    let transformedValue = operation(number)
    result.append(transformedValue)
  }
  return result
}
```

Let's utilize the `myMap` function by entering a closure block under `operation`.

```swift
// Longer Version
myMap(numbers: [1, 2, 3, 4, 5]) { (number) -> Double in number * number }

 // Shorter Version
myMap(numbers: [1, 2, 3, 4, 5]) { $0 * $0 }
```

### Slightly Generic Map
Creating generic functions saves time. In other words, if you do not create generic functions, you are wasting time. We do not want that. Let's utilize our limited time while breathing.

Instead of defining the type as `Double`, let's use a placeholder type, `T`.

```swift
func slightlyGenericMap<T>(_ items: [T], _ operation: (T) -> T) -> [T] {
  var result = [T]()
  for item in items {
    result.append(operation(item))
  }
  return result
}
```

#### Ex 1) Lowercase Each Element
Let us attempt to lowercase each element in an array whose type is `String`.

```swift
let upperLetters = ["BOB", "BOBBY", "LEE"]
```

Let us create a closure block which will be added to the `operation` parameter. Remember, functions are also considered as "global closures".

```swift
func lowercase(enterString: String) -> String {
  return enterString.lowercased()
}
```

#### Pass Closure **Indirectly**
Let us enter the closure block into the `slightlyGenericMap` function.

```
slightlyGenericMap(upperLetters, lowercase) // ["bob", "bobby", ...]
```

#### Pass Closure **Directly** (Longer Form)

```swift
slightlyGenericMap(upperLetters) { (letter) -> String in
  letter.lowercased()
}
```

> Remember, you do not need `return` if the closure block doesn't do anything besides it returns one value.

#### Pass Closure **Directly** (Shorter Form)
Simply, we may utilize `$0` which refers to the first parameter which `operation` will use.

```swift
slightlyGenericMap(upperLetters) { $0.lowercased() }
```

That's it.

### Extremely Generic Map
However, this isn't the end. What if you wish to convert all elements, for example, for `Int` to `String`? In the `slightlyGenericMap` function, if `T` is defined, you must return `[T]`. This isn't that much generic. We can take it to the next level.

What we need to focus is what the closure block in the `operation` parameter  returns. It is possible that the each element type can be converted as shown below.

```swift
func convertNumberToString(number: Int) -> String {
  return "You are number \(String(number))"
}
```

Well, no problem. We can add one more placeholder type.

```swift
func genericMap<T, U>(_ items: [T], _ operation: (T) -> U) -> [U] {
  var result = [U]()
  for item in items {
    result.append(operation(item))
  }
  return result
}
```

The type of `result` is `U`. It may be identical to `T`. If you use `convertNumberToString`, however, the type of `U` would be `String`, while `T` would remain as `Int`.

#### Ex 2) Manipulate Number to String
Let us attempt to convert each element whose type is `Int` to `String` using the `genericMap` above.

#### Pass Closure **Indirectly**
```swift
let myNumbers = [1, 2, 3, 4, 5]
genericMap(myNumbers, convertNumberToString)
```

#### Pass Closure **Directly** (Longer Form)
```swift
genericMap(myNumbers) { (number) -> String in
  return "You are number \(String(number))"
}
```
#### Pass Closure **Directly** (Shorter Form)
```swift
genericMap(myNumbers) { "You are number \(String($0))" }
```

### The Purest Form
This is probably how the built-in `map` function is written.

```swift
extension Array {
  func myMap<U>(_ operation: (Element) -> U) -> [U] {
    var result = [U]()
    for item in self {
      result.append(operation(item))
    }
    return result
  }
}

let result = Array(1...10).myMap { $0 * 10 }
```

### Source Code
[6003_map.playground]()

## Conclusion
By now, you should be grasping the concept of functional programming in Swift. Once you learn functional programming, you will never code the same way as you did in the past. Congratulations. Let's continue and move forward. In the you in the next lesson. 

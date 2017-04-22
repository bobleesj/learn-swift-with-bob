# Swift Capture Lists

## Introduction
Welcome to Lesson 4 of Intro to Functional Swift. Today, you will discover a unique behavior of closures, and how to make it right.

## Discovery Stage
First, let us create two variables.

```swift
var a = 0
var b = 0
```

### Design Closure
Create a closure block which prints `a` and `b`.

```swift
let newClosure = { print(a, b) }
newClosure() // (0, 0)
```

### Design Closure Array
Create an array whose type is `[() -> ()]`. `newClosure` will be added to `closureArray`.

```swift
var closureArray: [() -> ()] = []
var i = 0
```

### Append Closure
Let us add multiple closure blocks to the array using a `for-in` loop.

```swift
for _ in 1...5 {
  closureArray.append {
    print(i)
  }
  i += 1
}
// i is 5 by now
```

### Execute Closure
Let us call the function.

```swift
closureArray[0]() // 5 😲
closureArray[1]() // 5 🤔
closureArray[2]() // 5 😨
closureArray[3]() // 5 😭
closureArray[4]() // 5 😱
```

You might have expected each element to print, `0`, `1`, `2`, `3`, `4`. However, each closure uses the final value of `i` which is 5 at the end of the loop.

> **Important:** A closure block is  a reference type. You will learn more in Chapter 5.

## Characteristic of Closure
Let us dig deeper.

### Design Closure
```swift
var c = 0
var d = 0

let smartClosure: () -> () = { _ in
  print(c, d)
}
```

First, modify the value of `c` and `d`. Second execute the closure.

```swift
c = 9
d = 9
smartClosure() // (9, 9)
```

`smartClosure()` prints `(9, 9)`. When the value of `c` and `d` mutate, the change is reflected on the closure by default.

## Introducing Capture List
Let us destroy the default behavior.

> **Strategy:** Do not reference. Copy

Add an array `[a, b]` before `in`. The array is referred to as a capture list.

```swift
let smarterClosure: () -> () = { [c, d] in
  print(c, d)
}

smarterClosure() // (9, 9)
```

Now , attempt to modify the value of `c` and `d`

```swift
c = 10
d = 10
```

Execute `smarterClosure`. You will discover that the change is not reflected on the closure anymore.

```swift
smarterClosure() // (9, 9)
```

The capture list "copies" the value of `c` and `d` at the particular time the closure was created. It become invincible.


## Destroy Unique Behavior
Let us go back to the early example with the `for-in` loop to append the closure block to the array.

### Design Closure
```swift
var smartClosureArray: [() -> ()] = []
var j = 0
```

### Append Closure
Capture `j`

```swift
for _ in 1...5 {
  smartClosureArray.append { [j] in
    print(j)
  }
  j += 1
}
```

You may rebrand `j`. In this case, I will refer to `j` as `num` within the closure block.

```swift
for _ in 1...5 {
  smartClosureArray.append { [num = j] in
    print(num)
  }
  j += 1
}
```
### Execute
Let us find out whether you've killed the default behavior.

```swift
smartClosureArray[0]() // 0 ☝️
smartClosureArray[1]() // 1 💪
smartClosureArray[2]() // 2 🎁
smartClosureArray[3]() // 3 🎉
smartClosureArray[4]() // 4 🎅
```


### Resources
[Capture List in Closures]

[Capture List in Closures]: https://blog.bobthedeveloper.io/swift-capture-list-in-closures-e28282c71b95

### Source Code
[3004_capture_lists.playground](https://www.dropbox.com/sh/4gn1y6if86aeciw/AABVwstQZJCqGnNfKPfRo76ja?dl=0)

## Conclusion
You've learned the default behavior of a closure block which is identical to that of instances created with class objects. In fact, closures are reference types. In Chapter 5, however, you will discover some of problems that may arise due to the default behavior. Stay tuned.

In the following lesson, you will learn how to beautify closures.

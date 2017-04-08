# Swift Capture Lists

## Introduction

## Problem

```swift
var a = 0
var b = 0
```

### Design Closure
```swift
let newClosure = { print(a, b) }
newClosure() // (0, 0)
```

### Design Closure Array
```swift
var closureArray: [() -> ()] = []
var i = 0
```

### Append Closure
```swift
for _ in 1...5 {
  closureArray.append {
    print(i)
  }
  i += 1
}
// i = 5

closureArray[0]() // 5 😲
closureArray[1]() // 5 🤔
closureArray[2]() // 5 😨
closureArray[3]() // 5 😭
closureArray[4]() // 5 😱
```


### Characteristic of Closure
> A closure block is  a reference type

```swift
var c = 0
var d = 0

let smartClosure: () -> () = { _ in
  print(c, d)
}

c = 9
d = 9

smartClosure() // (9, 9)
```

## Introducing Capture List
> Do not reference, Copy

```swift
let smarterClosure: () -> () = { [c, d] in
  print(c, d)
}

smarterClosure() // (9, 9)

c = 10
d = 10

smarterClosure() // (9, 9)
```

### Design Closure
```swift
var smartClosureArray: [() -> ()] = []
var j = 0
```
### Append Closure
```swift
for _ in 1...5 {
  smartClosureArray.append { [num = j] in
    print(num)
  }
  j += 1
}

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

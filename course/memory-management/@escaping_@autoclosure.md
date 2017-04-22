# Escaping and Autoclosures
## Introduction
Welcome to the last lesson of Swift Memory Management. You will learn at which circumstances you use `escaping` and `autoclosures`. No fear closures.

## Problem
What are those?


## Escaping Closures

> **Definition:** If the closure block is executed after the function returns, you must add `@escaping`.

### Scenario 1
Create an array whose type is `[() -> Void]`.

```swift
var closureBlocks: [() -> Void] = []
```

Create function whose parameter type is `() -> Void`. The function will take the parameter and append to the `closureBlocks` array.

```swift
func funcWithClosure(closure: @escaping () -> Void) {
  closureBlocks.append(closure)
}
```

The `@escaping` keyword is added since the closure can be called after the function returns/executes.

### Scenario 2
Asynchronous operation does not execute code line-by-line. Instead, it runs many at the same time.

```swift
import Foundation

func funcWithNetworkingClosure(closure: @escaping () -> Void) {
  DispatchQueue.global().async {
    closure() // Ex) downloading
  }
}

```
The `@escaping` is added automatically.

When you pass a closure block to the function, the closure block is executed even after the function returns.

```swift
funcWithNetworkingClosure {
  for _ in 1...1000 {
    print("downloading")
  }
}

// "downloading"
// "downloading"
// ...
// execute other operations
// "downloading"
// "downloading"
// execute other operations
```

> **Note:** If you wish to learn more about multi-tasking and asynchronous operations,, you may read [Intro to Grand Central Dispatch in Swift 3 with Bob](https://blog.bobthedeveloper.io/intro-to-grand-central-dispatch-in-swift-3-with-bob-lee-1d4b56f731b3)

## Normal Function
A normal function is `@nonescaping` by default. In other words, the closure is executed before the function returns/finishes.


```swift
class Normal {
  let name = "Bob"

  func normalFunctionWithClosure(closure: (String) -> Void) {
    closure(self.name)
  }
}

Normal().normalFunctionWithClosure { (myName) in
  print(myName)
}
```

When you execute the function, the closure block is initialized and deallocated as the function returns. The function also gets deallocated. It happens almost simultaneously. If the function is `@escaping`, however, the closure block is not deallocated while the function block is.


### Benefits of Non-Escaping
1. There is no retain cycle for non-escaping functions since everything is deallocated
2. You may use `self` keyword without worrying about memory leak
3. Performance and the ability for the compiler to optimize


## Introducing @autoclosures

```swift
func checkIDCard(hasCard: () -> Bool) {
  if hasCard() {
    print("You've an ID")
  }
}

checkIDCard(hasCard: { return true})
checkIDCard(hasCard: { true })
checkIDCard { true }
```
The `@autoclosure` keyword allows you to pass a closure block with no brackets.

```swift
func checkIDCard(hasCard: @autoclosure () -> Bool) {
  if hasCard() {
    print("You've an ID")
  }
}

checkIDCard(hasCard: true)
```

## Lazy Init Capture
You've learned how to initialize an object with `lazy` and closures. However, you must be careful of potential retain cycle. Let us find out if there is one.

### Create Lazy

```swift
class BobGreet {
  var name = "Bob the Developer"

  lazy var greeting: String = {
    return "Hello, \(self.name)"
  }()

  deinit {
    print("I'm gone, bruh 🙆‍")}
}
```

The closure block as a `strong` reference to `self`. However, let us attempt to deallocate regardless.

### Deallocate
```swift
var bobGreet: BobGreet? = BobGreet()
bobGreet?.greeting
bobGreet = nil // "I'm gone, bruh 🙆‍"
```

> **Important:** a closure block with a `lazy` property is `@noescape` by default.

### Source Code
[5004_escaping_autoclosures.playground](https://www.dropbox.com/sh/6vk04zbv1ifajc0/AABQhPhB3yYUF0qa8s8YXWdka?dl=0)

### Resources
[Intro to Grand Central Dispatch in Swift 3 with Bob](https://blog.bobthedeveloper.io/intro-to-grand-central-dispatch-in-swift-3-with-bob-lee-1d4b56f731b3)

## Conclusion
You've learned 3 concepts. First, a function requires the `@escaping` keyword if the closure block in the parameter is executed after the function returns. Second, the `@auotoclosure` keyword is used to enter a closure block without brackets. However, the closure must have no parameters. Lastly, there is no retain cycle in `lazy` properties.

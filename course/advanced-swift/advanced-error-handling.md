# Advanced Error Handling
Welcome to Lesson 3 of Advanced Swift. In chapter 1, you've learned the native way to send and handle error using the `error handling` syntax including `try`, `catch`, and `do`. What if I told you, there is a function whose parameter also throws an error? Let's take a look.

## Problem
What is `rethrow`?

## Worth Learning
Let us find out whether Swift engineers use `rethrow` in the first place. `option-click` on `Array`. Scroll through.

```swift
Array<String>()
```

There are a number of functions that incorporate `rethrow`. But, many of us may not have realized. You will find out the why.

## Design Functions
First, let us design two functions.

```swift
func nonThrowableFunc() {
  print("From nonThrowable function")
}

func throwableFunc() throws {
  print("From throwable function")
  throw TestingError.randomError
}
```

## Design Error Case
Create an enum called, `TestingError`. It contains a case, `randomError`.

```swift
enum TestingError: Error {
  case randomError
}
```

## Create Throwable Function
Create a function, `rethrowableFuncWithErrorHandling`. It takes a parameter whose type is `() throws -> ()`. Execute the parameter within the function block and use `do-try-catch` for error handling. At the end, the function is marked with "rethrows".

> **Notes:** Just bear with me for 30s.

```swift
func rethrowableFuncWithErrorHandling(function: () throws -> ()) rethrows {
  do {
    try function()
  } catch TestingError.randomError {
    print("Random Error thrown by the function in the parameter")
  } catch {
    fatalError("FATAL ERROR: Weird Error")
  }
}
```

### Pass Throwable Function
Let us pass a throwable function to `rethrowableFuncWithErrorHandling`.

```swift
try? rethrowableFuncWithErrorHandling(function: throwableFunc)
```

> **Important:** You can only use `try` within a `do-catch` block. Playground is messed up.


### Pass Non-throwable Function
You may also pass a non-throwable function to `rethrowableFuncWithErrorHandling`.

```swift
rethrowableFuncWithErrorHandling(function: nonThrowableFunc)
```

> **Important:** Since the function, `rethrowableFuncWithErrorHandling`.is marked with `rethrows`, you may also enter a non-throwable function even though the parameter requires a throwable function. This is the why we, developers, do not even question the existence of the `rethrows` keyword.

### Source Code
[8003_advanced_error_handling](https://www.dropbox.com/sh/1bg3nlm5e3dvkzv/AAB4U2NHCaVvmjLYeDp3wRO3a?dl=0)


## Conclusion
Congratulations, you've mastered the Swift Error Handling. To recap, you may add the `rethrows` keyword to a function whose  parameter also can throws an error. However, you may still pass a non-throwable function since the original is identified as `rethrows`. This is the reason why we developers use APIs created Apple engineering without realizing that the original function may also throw an error.

In the following lesson, you will finally understand the statement, "Swift is a protocol oriented language".


> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

# Error Handling with Enum Result Type

## Introduction
Welcome to the last lesson of Chapter 7. You will learn how to combine two enums to throw and handle errors without using the Swift 3.1 `error handling` syntax.


## Problem
Error Handling back then

## HTTPS Request
The example can be designed for a website.

### Design Error
Create a enum, `HTTPError`. It contains two error cases: `nonFound404` and `forbidden403`.

```swift
enum HTTPError {
  case notFound404
  case forbidden403
}
```

> **Note:** The `Error` protocol is not required

### Design Result Type
Create a generic enum, `ResultType`. Like `Optional`, it contains two cases: `Success(T)` AND `failure(HTTPError)`.

```swift
enum ResultType<T> {
  case success(T)
  case failure(HTTPError)
```

Test

```swift
let success = ResultType.success("Bob")
let failure: ResultType<String> = ResultType.failure(.notFound404)
}
```

> **Important:** Remember to define `T` when you use the `failure` case.  

### Design Function and Return Error
Create a function called `findSubDomain`. You need to enter `String`. It will return `ResultType<String>`.

```swift
func findSubDomain(subdomain: String) -> ResultType<String> {
  // Switch Statement
  switch subdomain {
  case "business":
    return ResultType.failure(.forbidden403)
  case "blog":
    return ResultType.failure(.notFound404)
  default:
    return ResultType.success("Found website")
  }
}
```

Execute the function and create an instance, `result`, to store the returned value of `ResultType<String>`.

```swift
let result = findSubDomain(subdomain: "business")
```

### Handle Error
Once the function returns, you may use a classic `switch` statement to determine whether the instance is `.failure` or `.success`.

```swift
switch result {
case let .success(subDomainName):
  print(subDomainName)
case let .failure(errorType):
  switch errorType {
  case .notFound404:
    print("Not Found: 404")
  case .forbidden403:
    print("Not Allowed: 403")
  }
}
```

No need to get fancy with `try`, `catch`, and `throw`

### Source Code
[7007_result_type_error_handling](https://www.dropbox.com/sh/x3bfjb6dxbv3qoa/AABOsRG7FSNt_9KlssX4iN96a?dl=0)

## Conclusion
It's up to you which method you prefer, the old or the new. The iOS platform itself uses the new syntax since it provides higher readability due to the explicit keywords such as `try`, `catch`, and `throws`. However, you still need to know how to send and handle errors using a `ResultType` enum because some developers still prefer the earlier method. You've got to know all.

In the following chapter, you will have one more lesson about The Swift error handling. There is one keyword you've got to know.

> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

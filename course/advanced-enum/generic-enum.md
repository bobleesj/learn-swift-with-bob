# Generic Enums

## Introduction
Welcome to Lesson 6 of Advanced Enum. Chapter 1, you've learned how to create generic structs, classes, and functions. In Chapter 5, you've learned how to create generic protocols using associated types. In this lesson, you will learn how to create generic enums. When you hear the term `generic`, you already know the purpose. It is to provide scalable and reusable code, following the principle of DRY.

## Problem
A little more complex associated value

## Introducing Generic Enums
Like structs, classes, and functions, the syntax looks identical.

```swift
enum Information<T, U> {
  case name(T)
  case website(T)
  case age(U)
}
```

Let us initialize.

```swift
Information.name("Bob") // Error
```
The compiler is able to recognize `T` as `String` based on "Bob". However, the type of `U` is not defined yet. Therefor, you must define both `T` and `U` explicitly as shown below.

```swift
Information<String, Int>.age(20)
```

## Optionals with Enum
option-click on `Optional`. It is an enum with associated value defined as `T`. There are two ways to create optional types: 1. Traditional 2. Native

```swift
// Traditional
let explicitOptionals = Optional("Bob")
// Native
let quickOptionals: String? = "Bob"

print(explicitOptionals) // Optional("Bob")
print(quickOptionals) // Optional("Bob")
```

## Custom Optionals
Let us attempt to create our own "optional" type.

```swift
enum MyOptional<T> {
  case none // nil
  case some(T)

  init(_ anyValue: T) {
    self = MyOptional.some(anyValue)
  }
}
```

Let us initialize

```swift
MyOptional("Bobby")
```

Safe unwrapping for `MyOptional` does not work.  The`Optional` enum probably has its own custom operators.

```swift
if let value = MyOptional {
  print(value)
} // Error
```

### Source Code
[7006_generic_enum.playground](https://www.dropbox.com/sh/qif4q2x1x5ltj0f/AAAcCOW4tTO5ftO5VGy1eJi6a?dl=0)


## Conclusion
You've learned how to create generic enums with associated value which allows enums like `Optional` to convert any type into its own optional type. If you have two or more non-concrete types such as `T` and `U`, make sure you explicitly define them.

In the following lesson, you will learn how error handling was done in the past with generic enums. 

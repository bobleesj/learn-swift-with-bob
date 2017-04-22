# Computed Property

## Introduction
Welcome to Lesson 2 of Object Oriented Swift. You will learn how to create relationships between variables. You no longer have to manage two or more variables separately. You probably have seen `get` and `set` before. If you haven't, don't you worry. I will walk you through by placing your feet on mine.

## Problem
Do we have to make functions all the time to calculate something?

## Atrocious Code
Unrelated functions that take up many lines. The functions below are used to calculate a radius and diameter.

```swift
func getDiameter(radius: Double) -> Double {
 return radius * 2
}
func getRadius(diameter: Double) -> Double {
 return diameter / 2
}

getDiameter(radius: 10) // return 20
getRadius(diameter: 200) // return 100
getRadius(diameter: 600) // return 300
```

The two functions are separate and there is no relationship . Computed Property will help you solve this problem.

## Introducing Computed Property
You may create a variable that only can be read. It is also referred to as a gettable property.

> Computed = calculated

### Gettable Property
Create a only readable property.

```swift
class NumberClass {
  var readableNumber: Double {
    get {
      // Complex logic
      return 777
    }
  }
  var readableNumbers: Double {
    return 789
  }
}

```

If you attempt to modify the property, it will give you an error.

```swift
readableNumber = 10 // Error
readableNumbers = 20 // Error
```

### Gettable and Settable Property
You may not only make a property gettable, but also settable by inserting `set` right after `get`.  Let us create a relationship between radius and diameter.

```swift
var radius: Double = 10
var diameter: Double {
  get {
    return radius * 2
  }
  set {
    radius = newValue / 2
  }  
}
```

`newValue` refers to the newly set value of `diameter`.  For example, when you set `diameter` to 100,  `newValue` becomes 100.

```swift
diameter = 50
radius = 100
diameter // 200
```

Instead of calling `newValue`, you may add a different name. In the example below, there is a relationship between `area` and `side`. Instead of calling `newValue`, let us use `newArea`.

```swift
import Foundation

var side: Double = 100
var area: Double {
 get {
   return side * side
 }
 set(newArea) {
   side = sqrt(newArea)
 }
}
```

There is a relationship between `side` and `area`.

```swift
area = 1000
side // 31.6
```

### Applications
 - Grabbing and storing data the server
 - Propagating relationships between properties
 - Preventing others from manipulating your code

### Source Code
[2002_computed_property.playground](https://www.dropbox.com/sh/sunfww1daece1fe/AAB31bu-Q-_V_ZF2-AOaUdc9a?dl=0)

## Conclusion
 You've learned what it means to create a gettable property that can be only read. You've also learned how to create a settable property which allows you to modify its value as well as those of others. The UIKIt framework often utilizes gettable properties to prevent us, developers, from modifying them. 

In the lesson lesson, you will learn how to add an observer to a property.

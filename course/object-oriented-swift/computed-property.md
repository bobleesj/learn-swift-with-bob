# Computed Property

## Introduction
Welcome to Lesson 3 of Object Oriented Swift. Today, we are going to learn how to create relationships between variables. So that you don't need to manage two or more variables separately. Are you confused? Well, have you heard, `get` and `set` before? Haven't? No worry. I will walk you through by placing your feet on mine. Let's dive into it.

## Problem
Do we have to make functions all the time to calculate something?

## Atrocious Code
Unrelated functions that take up many lines. The functions below are used to calculate radius.

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

## Introducing Computed Property
You may create a variable that only can be read. You may not customize. It is also referred to as a gettable property.

> Computed = calcualted

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

```swift
diameter = 50
radius = 100
diameter // 200
```

Now, if you set `diameter` to 100,  `newValue` becomes 100. As a result, `radius` will be 50. If you set `radius` to 500, `diameter` will be 1000.

Instead of calling `newValue`, you may name the recently set value as you wish. In the example below, there is a relationship between `area` and `side`. Instead of calling `newValue`, I call it as `newArea`.

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
In the beginning of the lesson, you've learned what it means to create a `gettable` property by calling `get` or just by returning value. After that, you've also learned how to add `set` which allows you to modify its value as well as those of other variables. We are going to take a look at how Apple Engineers use computed property to create the iOS ecosystem safe and non-customizable. I know you are super excited to build apps. You will learn how everything fits together in Part 2 and Part 3 of this course.

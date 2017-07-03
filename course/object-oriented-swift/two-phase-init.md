# Two Phase Init

## Introduction
Welcome to Lesson 6 of Object Oriented Swift. You will learn how one init method may initialize the other. The process is analogous to that of `convenience`. At the end, you will learn how the NASA could have saved millions of dollars if they used the feature Swift offers.

## Problem
How can one init init the other?

### Design Rocket Ship
Design a struct called `NuclearRocket`. There are two init methods and two properties: `meters` and `liters`.

```swift
struct NuclearRocket {
  var meters: Double
  var liters: Double

  // Init for 🇰🇷
  init(meters: Double, liters: Double) {
    self.meters = meters
    self.liters = liters
  }

  // Init for 🇺🇸
  init(ft: Double, gallons: Double) {
    let convertedMeters = ft / 3.28
    let convertedLiters = gallons * 3.79
    self.init(meters: convertedMeters, liters: convertedLiters)
  }
}
```

Using the second init method, you may initialize the properties using `ft` and `gallon`. Yet, you've initalized the `meters` and `liters` properties by calling`self.init`.

#### Create Object
For Korean scientists
```swift
var rocket = NuclearRocket(meters: 20, liters: 20)
rocket.liters // 20
rocket.meters // 20
```

For American scientists
```swift
var newRocket = NuclearRocket(ft: 300, gallons: 2)
newRocket.liters // 7.56
newRocket.meters // 91.4
```
### Source Code
[2006_two_phase_init.playground](https://www.dropbox.com/sh/f028fdc3n7vy10n/AADP3OItB2SValnXXFjCo13ka?dl=0)


## Conclusion
In 1998, The NASA launched The Mars Climate robot to study the Mars. However, a year later, it went out of the orbit. It was due to the computer software which produced non-SI units. The program returned units of pound instead of the SI units of newton. $327.6 million evaporated. They could have potentially used  two phase initializations in Swift.

In the following lesson, you will learn how to use methods and properties without creating an actual object.

> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

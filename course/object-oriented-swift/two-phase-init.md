# Two Phase Init

## Introduction
In this lesson, you are going to learn how one init method initializes the other. Sounds super confusing? Well, let's find out how it works. At the end of this lesson, you will learn how NASA could have saved millions of dollars if they used the feature Swift offers.

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

Using the second init method, you may initialize the properties using `ft` and `gallon` because it calls the first init method by calling `self.init`. This is analogous to `convenience init`.

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
[2006_two_phase_init.playground](https://www.dropbox.com/sh/e8bnkpbuurly7cu/AAAaACwZ5M0i_vP6Df7Twxqja?dl=0)


## Conclusion
Great, to be honest, I haven't used two phase init in my previous apps before. I just wanted to make sure when you read someone's code, you are ready to rock and roll.

So, let's go back to the introduction. Why this is important.  The Mars Climate robot launched by NASA in 1998 to study the Mars.  However, a year later,  communication with the spacecraft was lost as the spacecraft, due to ground-based computer software which produced output in non-SI units of pound instead of the SI units of newton. $327.6 million gone. The two phase init could have been useful.

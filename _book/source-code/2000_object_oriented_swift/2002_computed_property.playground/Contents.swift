/*:
 ## Learn Swift with Bob
 ### Object Oriented Swift
 ### Computed Property
 
 **Problem:** Do we have to make functions all the time to calculate something?
 */
func getDiameter(radius: Double) -> Double {
  return radius * 2
}
func getRadius(diameter: Double) -> Double {
  return diameter / 2
}

getDiameter(radius: 10) // return 20
getRadius(diameter: 200) // return 100
getRadius(diameter: 600) // return 300


//: ### Introducing Computed Property
//: > computed = calculated

//: Gettable Property
//: > Create a variable that only can be read. It can't be modified
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


//: Settable Property
var radius: Double = 10

var diameter: Double {
  get {
    return radius * 2
  }
  set {
    radius = newValue / 2
  }
}

diameter = 50
radius = 100
diameter


//: Finding Area
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


area = 1000
side


//: Applications
//: 1. Grabbing and storing data the server // unchageable
//: 2. Propagating relationships between properties
//: 3. Preventing others from manipulating your code
























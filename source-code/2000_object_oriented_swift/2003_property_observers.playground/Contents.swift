
/*:
 ## Learn Swift with Bob
 ### Object Oriented Swift
 ### Property Observer
 
 Problem: How can I add observer/tracker to a property?
 */

//: Grade Tracker
// willSet is called just before the value is stored.
// didSet is called immediately after the new value has been stored.

var myGrade: Int = 80 {
  willSet(newGrade) {
    print("About to change your grade to \(newGrade)")
  }
  didSet {
    print("Your grade has been changed")
    print("you had \(oldValue) previously. Now you have \(myGrade)")
  }
}

myGrade = 100


//: Step Counter
var totalSteps: Int = 20 {
  willSet(newTotalSteps) {
    print("About to set totalSteps to \(newTotalSteps)")
  }
  didSet {
    if totalSteps > oldValue  {
      print("Added \(totalSteps - oldValue) steps")
    }
  }
}

totalSteps = 60

//: Applicaton
var userLoginInfo: Bool = false {
  willSet(newValue) {
    print("The user has tried something")
  }
  didSet {
    if userLoginInfo {
      print("The user has switched from \(oldValue) to \(userLoginInfo)")
      // Backgroud color
      // Animation
      // Pop Up
      // All kinds of stuff
  }
 }
}

userLoginInfo = true
userLoginInfo = true


//: Similarity with Computed Property
//: 1. Always recalculated

//: What makes Property Observers different
//: 1.  There is a default value and it is observed rather than calculated.
//: 2. `willSet` and `didSet` will not get called when you initialize it.









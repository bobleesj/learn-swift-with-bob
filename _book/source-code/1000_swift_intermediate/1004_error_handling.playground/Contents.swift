/*:
 ## Learn Swift with Bob
 ### Chapter 1: The Swift Fundamentals
 ### Intro to Error Handling
 
 **Problem:**
 1. Warn your co-workers the function can cause *dangerous results*.
 2. Understanding of a `do-try` block
 3. Distinguish between `try?`, `try!`, and `try`
 
 ---
 */

func checkHeight(height: Int) {
  if height > 200 {
    print("You are going to hit your head and fall off")
    // Take him/her off from the ride
    // Code ...
    // Seatbeat Tighten
    
  } else if height < 140 {
    print("You might fly in the air")
    // Take him/her off from the ride
    // Code ...
    
  } else {
    print("Enjoy")
    // Take him/her to the ride
    // Code ...
  }
}
//: Problem with an else-if statement
// Problem 1: Bloated Function
// Problem 2: Modurality


//: > Error Handling is just another way to write an else-if statement to deal with error messages
// Design Error
enum HeightError: Error {
  case maxHeight
  case minHeight
}


// Call Function
func checkHeightError(height: Int) throws {
  if height > 200 {
    throw HeightError.maxHeight
  } else if height < 140 {
    throw HeightError.minHeight
  } else {
    print("Enjoy your ride")
  }
}

// Handle with Error
do {
  try checkHeightError(height: 150)
} catch HeightError.maxHeight {
  print("Please get out of here")
} catch HeightError.minHeight {
  print("Too shrot to ride")
}


//: Error Handling with Object Initialization

// Design Error
enum NameError: Error {
  case noName
}

// Design Class
class Course {
  var name: String
  
  init(name: String) throws {
    if name == "" {
      throw NameError.noName
    } else {
      self.name = name
      print("You've created an object right")
    }
  }
  
}


// Initalize and Handle Error
do {
  let myCourse = try Course(name: "")
} catch NameError.noName {
  print("ERROR: Please make sure enter name")
  // more code
}

//: Distinguish `try?`, `try!`, and `try`

//: try?
// if error not thrown, --> optional 
// if erorr thrown --> nil

let newCourse = try? Course(name: "Bob the Dev")
if let myCourse = newCourse {
  print(myCourse.name)
}

let newDopeCourse = try? Course(name: "")

//: try!
let myNewCourse = try! Course(name: "Bobby Lee")
// let myDopeNewCourse = try! Course(name: "")

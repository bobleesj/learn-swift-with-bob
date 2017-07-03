/*:
 ## Learn Swift with Bob
 ### Intro to Functional Swift
 ### Lazy Init with Closures
 
 **Problem:** How to initialize an object with a closure?
 
 ---
*/

import UIKit


//: Unconventional Way
let box: UIView = {
  let view = UIView()
  return view
}()


//: Create UI Components
let buttonSize = CGRect(x: 0, y: 0, width: 100, height: 100)


// ViewControllerOne
let bobButton = UIButton(frame: buttonSize)
bobButton.backgroundColor = .black
bobButton.titleLabel?.text = "Bob"
bobButton.titleLabel?.textColor = .white


// ViewControllerTwo
let bobbyButton = UIButton(frame: buttonSize)
bobbyButton.backgroundColor = .black
bobbyButton.titleLabel?.text = "Bobby"
bobbyButton.titleLabel?.textColor = .white


//: Create Button with Function
func createButton(enterTitle: String) -> UIButton {
  let button = UIButton(frame: buttonSize)
  button.backgroundColor = .black
  button.titleLabel?.text = enterTitle
  return button
}
createButton(enterTitle: "Yoyo")



//: Introducing Unconventional Way
struct Human {
  init() {
    print("Born 1996")
  }
}

let createBob = { () -> Human in
  let human = Human()
  return human
}

let bobInstance = createBob()


//: Initialize in a single line
let bobby = { () -> Human in
  let human = Human()
  return human
}()

//: Create UIView Unconventionally
let bobView = { () -> UIView in
  let view = UIView()
  view.backgroundColor = .black
  return view
}()

let bobbyView = { () -> UIView in
  let view = UIView()
  view.backgroundColor = .black
  return view
}()

let newBobbyView: UIView = {
  let view = UIView()
  view.backgroundColor = .black
  return view
}()

// () -> UIView

//: ### Lazy Var

class IntenseMathProblem {
  lazy var complexNumber: Int = {
    1 * 1
  }()
}

let problem = IntenseMathProblem() // no value for complexNumber 
problem.complexNumber // now, complexnumber is 1 




class SortFromDataBase {
  // Data
  lazy var sortNumberFromDatabase: [Int] = {
    // Caluation and sorting
    [1, 2, 3, 4, 5, 6, 7, 8, 9]
  }()
}

// SortFromDataBase().sortNumberFromDatabase


class CompressionManager {
  lazy var compressedImage: UIImage = {
    let image = UIImage()
    // Compress the image
    // Logic
    return image
  }()
}



/*:
 Lazy Rules:
 
 1. You can’t use lazy with `let` since there is no initial value, and it is attained later when it is accessed.
 2. You can’t use it with a `Computed property` since computed property is always recalculated (requires CPU) when you modify any of the variables that has a relationship with the lazy property.
 3. `Lazy` is only valid for members of a struct or class
 
 */














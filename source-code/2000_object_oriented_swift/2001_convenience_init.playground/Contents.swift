/*:
 ## Learn Swift with Bob
 ### Object Oriented Swift
 ### Convenience Init
 
 **Problem:** I'm lazy. Can we initialize quickly?
 
 ---
 */
class Human {
  var name: String
  init(name: String) {
    self.name = name
 }
  
  // Convenience init intializes the designated init method
  convenience init() {
    self.init(name: "Bob Lee")
  }
}

let lee = Human(name: "Bob Lee") // init(name: String)
let bob = Human() // Convenience init()



/*:
 Real Life Situation
 */

import UIKit


let randomColor = UIColor(colorLiteralRed: 255/80, green: 80/255, blue: 85/255, alpha: 1)


extension UIColor {
  convenience init(r: Float, g: Float, b: Float) {
    self.init(colorLiteralRed: r/255, green: g/255, blue: b/255, alpha: 1)
  }

}

let myFavoriteColor = UIColor(r: 255, g: 80, b: 85)


//: Application
//: 1. Useful for quick initialization for open source projects
//: 2. Custom convenience like UIKIt











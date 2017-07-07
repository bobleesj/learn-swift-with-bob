/*:
 ## Learn Swift with Bob
 ### Chapter 1: The Swift Fundamentals
 ### Optional Chainings
 

 **Problem:** Why do I see "?" and "!" when accessing methods and properties?
 
 ---
 */

//: > Example from UIKit
import UIKit
let labelColor = UILabel().highlightedTextColor?.cgColor

//: Design Class
class Human {
  var name: String
  
  init(name: String) {
    self.name = name
  }
  
  func sayHello() {
    print("Hello, I'm \(name)")
  }
}

//: Design Another Class
class Apartment {
  var human: Human?
}


//: Initialization
var seoulApartment = Apartment()
seoulApartment.human = Human(name: "Bobby")

seoulApartment.human?.sayHello()
if let residentName = seoulApartment.human?.name {
  print(residentName)
} else {
  
}

var NYCApartment = Apartment()
// let NYCResident = NYCApartment.human!.name

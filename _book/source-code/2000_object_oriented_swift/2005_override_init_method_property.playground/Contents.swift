
/*:
 ## Learn Swift with Bob
 ### Object Oriented Swift
 ### Override Method, Init, Property
 
 Problem: Super... Super.init?
 */
import UIKit

class MyViewController: UIViewController {
  // viewDidLoad() is built-in and it runs automatically
  override func viewDidLoad() {
    super.viewDidLoad()
    print("Hello")
  }
}



class Vehicle {

  var description: String {
    return "Hello, I'm moving at 30km/hr"
  }
  
  func warning() {
    print("Be careful, I'm going pretty fast")
  }
  
}



//: Override Method and Property

class ToyCar: Vehicle {
  override var description: String {
    return "\(super.description) hey, I'm a cute car"
  }
  
  override func warning() {
    print("hello, don't mind me")
    super.warning()
  }
}

let myFutureCar = ToyCar()
myFutureCar.description
// "Hello, I'm moving at 30km/hr, I'm a cute car"
myFutureCar.warning()
// "hello, dont' mind me"
// "Be careful, I'm going pretty fast"


//: super.init
class Human {
  var origin: String
  
  init(enterOrgin: String) {
    origin = enterOrgin
  }
}

Human(enterOrgin: "Korea")


class Korean: Human {
  let city: String
  
  init(enterCity: String) {
    self.city = enterCity
    super.init(enterOrgin: "Korean")
  }
  
  init(enterCity: String, origin: String) {
    self.city = enterCity
    super.init(enterOrgin: origin)
  }
}

//: Override Init
class Tesla {
  var numberOfWheels: Int
  
  init(enterWheelNumber: Int) {
    numberOfWheels = enterWheelNumber
  }
}

class ModelS: Tesla {
  override init(enterWheelNumber: Int) {
    super.init(enterWheelNumber: enterWheelNumber)
    print("Wow, you've got a nice car")
  }
}

ModelS(enterWheelNumber: 50)













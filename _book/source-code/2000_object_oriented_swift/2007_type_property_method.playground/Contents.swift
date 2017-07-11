/*:
 
 ## Learn Swift with Bob 
 ### Object Oriented Swift
 ### Type Property and Method
 
 Problem: I'm confused by `Static`, `Final`, `Class`. What are those?
 
 */


//: Structs: Static Only
struct SomeStructure {
  static var storedTypeProperty = "Some value."
  static var computedProperty: Int {
    get {
      return 120
    }
    set {
      print("You've set to \(newValue)")
    }
  }
  static func hello() {
    print("hello")
  }
}

SomeStructure.storedTypeProperty
SomeStructure.hello()

//: Classs: Class and Static
// Static can't be overidden
class GrandParent {
  static var numberOfYearsInMarriage = 30
  static func introduce() {
    print("We've been married for \(numberOfYearsInMarriage)")
 }
  
  class func introducing() {
    print("We've been married for \(numberOfYearsInMarriage)")
  }
  
  final func cantOverride() {
    print("you can't change me")
  }
}

class Parent: GrandParent {
  override class func introducing() {
    print("I'm married for 5 years")
  }
//  override static func introduce() {
//    print("I'm married for 5 years")
//  }
}

Parent.introducing()
Parent.introduce()



//: Application 
struct BluetoothID {
  struct iPhone {
    static let iPhone4 = "4234-1232-1232-5465"
    static let iPhone5 = "7867-5676-4535-1235"
    static let iPhone6 = "3938-6738-1424-9876"
    static let iPhone7 = "4845-3148-1237-1296"
    static let iPhone8 = "7967-8123-7892-4563"
  }
}

BluetoothID.iPhone.iPhone4
BluetoothID.iPhone.iPhone8

//: Alternative
enum AirDropID: String {
  case iPhone4 = "4234-1232-1232-5465"
  case iPhone5 = "7867-5676-4535-1235"
  case iPhone6 = "3938-6738-1424-9876"
  case iPhone7 = "4845-3148-1237-1296"
  case iPhone8 = "7967-8123-7892-4563"
}

AirDropID.iPhone8.rawValue



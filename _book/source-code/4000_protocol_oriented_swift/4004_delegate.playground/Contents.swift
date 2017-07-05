/*:
 
 ## Learn Swift with Bob
 ### Protocol Oriented Swift
 ### Delegate
 
 **Problem:** Communicate between classes and structs
 
 ---
 */
//: Delegate
//: 1. A gift from Apple engineers
//: 2. microwave analogy

//: Design Protocol
protocol PassDataDelegate {
  func passData(data: String)
}


//: Design Delegator (Sender)
class FirstVC {
  var delegate: PassDataDelegate?
}

FirstVC().delegate?.passData(data: "Bob")


//: Design Delegate (Receiver)
class SecondVC: PassDataDelegate {
  func passData(data: String) {
    print("Something happened")
  }
}


//: Create Objects
let firstVC = FirstVC()
let secondVC = SecondVC()

//: Assign Delegate
firstVC.delegate = secondVC
firstVC.delegate?.passData(data: "Hello, 1231231")  














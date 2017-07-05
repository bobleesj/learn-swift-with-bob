/*:
 
 ## Learn Swift with Bob
 ### Protocol Oriented Swift
 ### Delegate
 
 **Problem:** Pass Data between Classes
 
 ---
 */
//: Delegate
//: 1. A gift from Apple engineers
//: 2. microwave analogy

//: Design Protocol
protocol PassDataDelegate {
  func passData(data: String) -> String
}


//: Design Delegator (Sender)
class FirstVC {
  var delegate: PassDataDelegate?
}

FirstVC().delegate?.passData(data: "Bob")


//: Design Delegate (Receiver)
class SecondVC: PassDataDelegate {
  func passData(data: String) -> String {
    print("Something happened")
    return "You've entered \(data)"
  }
}


//: Create Objects
let firstVC = FirstVC()
let secondVC = SecondVC()


//: Assign Delegate
firstVC.delegate = secondVC
firstVC.delegate?.passData(data: "Hello, 1231231")  














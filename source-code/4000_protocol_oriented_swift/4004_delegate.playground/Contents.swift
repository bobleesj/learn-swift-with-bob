/*:
 
 ## Learn Swift with Bob
 ### Protocol Oriented Swift
 ### Delegate
 
 **Problem:** How does delegate even work?
 
 ---
 */

//: > **Purpose of Delegate:** Communicate between objects


//: **Goal:** Send data from `FirstVC` to `SecondVC`

//: Design Protocol
protocol PassDataDelegate {
  func passData(data: String)
}


//: Design Delegator (Sender)
class FirstVC {
  func drawCircle() {}
  var delegate: PassDataDelegate?
}

FirstVC().delegate?.passData(data: "A bunch of contracts")


//: Design Delegate (Receiver)
class SecondVC: PassDataDelegate {
  func passData(data: String) {
    print("The CEO gave me \(data)")
  }
}


//: Create Objects
let firstVC = FirstVC()
let secondVC = SecondVC()

//: Assign Delegate
firstVC.delegate = secondVC
firstVC.delegate?.passData(data: "A bunch of contracts")




//: Practical Example in iOS
import UIKit

class BobViewController: UIViewController, UITableViewDelegate {
  let tableView = UITableView()
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(indexPath)
  }
}


//: tableView.delegate.tableView(_ tableView: UITableView, didSelectRorwAt indexPath: IndexPath)


// UITableView is the delegator/CEO/sender
// BobViewController is the delegate/Secretary/receiver




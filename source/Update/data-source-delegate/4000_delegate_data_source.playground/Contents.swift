//: Design FirstVC
protocol FirstVCDelegate {
  func passData(data: String) -> String
}

//: Design Delegator
class FirstVC {
  var dataFromSecretary: String?
  var delegate: FirstVCDelegate?
}

//: Design Delegate
class SecondVC: FirstVCDelegate {
  func passData(data: String) -> String {
    print("The CEO gave me \(data)")
    return "Too much work"
  }
}

//: Create Objects
let firstVC = FirstVC()
let secondVC = SecondVC()

//: Assign Delegate
firstVC.delegate = secondVC

//: Send Data
firstVC.dataFromSecretary = firstVC.delegate?.passData(data: "a bunch of contracts")
print(firstVC.dataFromSecretary!)




//: Extra Example (X working)
/*
import UIKit

class BobViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("Why you print me!")
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1996
  }
}
*/












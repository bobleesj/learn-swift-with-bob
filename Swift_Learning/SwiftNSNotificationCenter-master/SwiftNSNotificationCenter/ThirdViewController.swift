import Foundation
import UIKit

class ThirdViewController: UIViewController {
	@IBOutlet weak var notificationLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		NotificationCenter.default.addObserver(self, selector: #selector(actOnSpecialNotification), name: NSNotification.Name(rawValue: mySpecialNotificationKey), object: nil)
	}
	
	func actOnSpecialNotification() {
    print("notified +++")
		self.notificationLabel.text = "I heard it too"
	}
  
//  override func viewDidDisappear(_ animated: Bool) {
//    super.viewDidDisappear(true)
//    NotificationCenter.default.removeObserver(self) // remove all
//  }
}

import Foundation
import UIKit

class SecondViewController: UIViewController {
	@IBOutlet weak var notificationLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		NotificationCenter.default.addObserver(self, selector: #selector(SecondViewController.actOnSpecialNotification), name: NSNotification.Name(rawValue: mySpecialNotificationKey), object: nil)
    // The object whose notifications the observer wants to receive 
    // Only notifications sent by this sender are dleivered to the observer 
    // If nil, the notification doesn't user a notification's sender to decide whether to dleiver it to the observer 
  
	}
	
  func actOnSpecialNotification(notification: NSNotification) {
		self.notificationLabel.text = "I heard the notification!"
    //print(notification.userInfo!["myText"] as Any)
    
	}
}

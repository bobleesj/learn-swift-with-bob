import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var birdTypeLabel: UILabel!
                        
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup that your app requires
	}
	
	@IBAction func updateBirdTypeLabel(_ sender: UIButton) {
		self.birdTypeLabel.fadeOut(completion: {
			(finished: Bool) -> Void in
			self.birdTypeLabel.text = "Bird Type: Swift"
			
			})
	}
}

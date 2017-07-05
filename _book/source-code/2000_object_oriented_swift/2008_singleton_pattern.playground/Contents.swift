/*:
 ## Learn Swift with Bob
 ### Object Oriented Swift
 ### Singleton Pattern
*/

//: > A singleton is an object which is instantiated exactly once.

class AccountManager {
  
  static let sharedInstance = AccountManager()
  
  var userInfo = (ID: "bobthedev", Password: 01036343984)
  
  // Networking: communicating server 
  func network() {
    // get everything
  }
  
  private init() {}
}

AccountManager.sharedInstance.userInfo



// ViewController One 
AccountManager.sharedInstance.userInfo.ID

// ViewController Two 
AccountManager.sharedInstance.userInfo.ID = "bobleesj"

// ViewController Three
AccountManager.sharedInstance.userInfo.ID






//: Example `UIApplication`, `UserDefault`, `NSNotification`.





















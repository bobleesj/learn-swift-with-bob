/*:
 ## Learn Swift with Bob
 ### What's New in Swift 4
 ### 9001_access_control
 
 **Problem:** I don't want you to touch my code.
 
 ---
 
 */

/*:
 ### Why is this important?
 - Reduce indexing/compilation time while building an app
 - Apple Engineers do not want developers to touch their code, sometimes
 - No need to overwhelm yorur teammates with unnecessary methods
 */

/*:
 ### 5 Levels of Access Control
 1. `private` (Most Secure)
 2. `fileprivate`
 3. `internal`
 4. `public`
 5. `open` (Least Secure)
 
 */

//: ### Private
//: Ex 1) Game Application
class Game {
  private var number = 0
  
  var score: Int {
    return number
  }
  
  func increaseNumberByOne() {
    number += 1
  }
}

// Game().number (Error)
Game().score


//: Ex 2) Singleton
class AccountManager {
  
  static let sharedInstance = AccountManager()
  var userInfo = (ID: "bobthedev", Password: 01036343984)
  
  private init() {}
}

//: ### Swift 4 Private Extension
class MyStatus {
  private var isHappy = true
}


extension MyStatus {
  func checkStatus() {
    print(isHappy)
  }
}


//: ### Private Setter Only
// Open View Controller
class Human {
  private(set) var name: String
  init(enterName: String) {
    name = enterName
  }
}

let bob = Human(enterName: "Bob Lee")
// bob.name = "Bobby" // Error








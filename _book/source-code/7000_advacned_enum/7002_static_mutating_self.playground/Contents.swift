/*:
 ## Learn Swift with Bob
 ### Advanced Enum
 ### Static and Mutating Methods with `self`
 
 **Problem:** Let's make it practical
 
 ---
 
 */
//: Practical with Storyboard
enum Storyboard: String {
  case profile
  case setting
  case newsfeed
  
  var identifier: String {
    return self.rawValue
  }
}

let profile = Storyboard.profile
profile.identifier

//: API Guideline Goal
func describeStoryboard(storyboard: Storyboard) -> String {
  switch storyboard {
  case .profile:
    return "\(storyboard.identifier): Profile picture, followers"
  case .setting:
    return "\(storyboard.identifier): Logout, invite"
  case .newsfeed:
    return "\(storyboard.identifier): videos, texts"
  }
}

describeStoryboard(storyboard: .profile)


//: Mutating Methods
enum MealProcess: String {
  case breakfast, lunch , dinner
  
  var description: String {
    return self.rawValue
  }
  
  mutating func nextMeal() {
    print("Time to move on from \(self.description)")
    
    switch self {
    case .breakfast:
      self = .lunch
      print("I had a nice lunch")
    case .lunch:
      self = .dinner
      print("I had a nice dinner")
    case .dinner:
      self = .breakfast
      print("I had a nice breakast")
    }
  }
}

var currentMeal = MealProcess.breakfast
currentMeal.nextMeal()
currentMeal.nextMeal()


//: Statitc Method

//enum AppleDevices {
//  case iWatch, iPhone, iMac, MacPro
//
//  static func getAppleDevice(name: String) -> AppleDevices? {
//    switch name {
//    case "iWatch":
//      return .iWatch
//    case "iPhone":
//      return .iPhone
//    case "iMac":
//      return .iMac
//    case "MacPro":
//      return .MacPro
//    default:
//      return nil
//    }
//  }
//}
//
//let userProduct = AppleDevices.getAppleDevice(name: "iWatch")

enum AppleDevices: String {
  case iWatch, iPhone, iMac, MacPro
  
  static func getProduct(name: String) -> AppleDevices? {
    return AppleDevices(rawValue: name)
  }
  
  static func getAppleDevice(enterName: String) -> AppleDevices? {
    switch enterName {
    case "iWatch", "iPhone", "iMac", "MacPro":
      return getProduct(name: enterName)
    default:
      return nil
    }
  }
}


//: Custom Init
enum AppleDevice: String {
  case iWatch, iPhone, iMac, MacPro
  
  init?(name: String) {
    if name == "iWatch" {
      self = .iWatch
    } else {
      return nil
    }
  }
}

AppleDevice(name: "iWatch")
AppleDevice(rawValue: "iWatch")


enum IntCategory {
  case small
  case medium
  case big
  case weird
  
  init(number: Int) {
    switch number {
    case 0..<1000 :
      self = .small
    case 1000..<100000:
      self = .medium
    case 100000..<1000000:
      self = .big
    default:
      self = .weird
    }
  }
}

IntCategory(number: 12413423432)



//: ### Practical Case

//: HTTP Request
enum HttpError: String {
  case Code400 = "Bad Request"
  case Code401 = "Unauthorized"
  case Code402 = "Payment Required"
  case Code403 = "Forbidden"
  case Code404 = "Page Not Found"
  
  var description: String {
    return self.rawValue
  }
}

HttpError.Code400.description

//: Cell Identifier
enum CellType: String {
  case ButtonValueCell = "ButtonValueCell"
  case UnitEditCell = "UnitEditCell"
  case LabelCell = "LabelCell"
  case ResultLabelCell = "ResultLabelCell"
  
  var name: String {
    return self.rawValue
  }
}

//: UIKit
import UIKit

enum NavigationTheme {
  case Placid
  case Warning
  case Danger
  
  var barTintColor: UIColor {
    switch self {
    case .Placid: return UIColor.clear
    case .Warning: return UIColor.blue
    case .Danger: return UIColor.red
    }
  }
}

let colorSituation = NavigationTheme.Placid
colorSituation.barTintColor


extension NavigationTheme {
  init(numberOfTasks: Int) {
    switch numberOfTasks {
    case 0...3:
      self = .Placid
    case 4...9:
      self = .Warning
    default:
      self = .Danger
    }
  }
}

let currentColor = NavigationTheme(numberOfTasks: 10).barTintColor

















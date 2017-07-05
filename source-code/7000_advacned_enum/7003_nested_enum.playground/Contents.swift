/*:
 ## Learn Swift with Bob
 ### Advanced Enum
 ### Nested Enum
 
 **Problem:** Just more than one
 
 ---
 
 */
//: Intro to Nested Enum
enum FutureCourse {
  enum LearnSwiftWithBob: String {
    case genericProtocol
    case advancedEnum
    
    var chapaterDescription: String {
      return self.rawValue
    }
  }
  
  enum UIKitFundamentals: String {
    case realmDatabase
    case noStoryboard
    case cloudComputing
    
    var chapterDescription: String {
      return self.rawValue
    }
  }

}

FutureCourse.LearnSwiftWithBob.advancedEnum.chapaterDescription
FutureCourse.UIKitFundamentals.cloudComputing.chapterDescription

//: Game Design
struct Character {
  enum CharacterType {
    case prince
    case warrior
    case priest
  }
  
  enum Skill {
    case airwalk
    case transparency
    case prediction
  }
  
  let type: CharacterType
  let skill: Skill
  
}

let warrior = Character(type: .priest, skill: .airwalk)

//: Another Game Design
enum Wearable {
  enum Weight: Int {
    case light
    case medium
    case heavy
  }
  enum Price: Int {
    case leather
    case iron
    case steel
  }
  
  case armor(weight: Weight, price: Price)
  // case houseMaterial(weight: Weight, price: Price)
  
  func getDescription() -> String {
    switch self {
    case let .armor(weight, price) :
      return "You've chosen \(weight) and \(price)"
    }
  }
}

let myClothes = Wearable.armor(weight: .heavy, price: .steel)
myClothes.getDescription()















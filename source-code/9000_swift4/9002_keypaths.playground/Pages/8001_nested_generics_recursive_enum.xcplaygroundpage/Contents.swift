/*:
 ## Learn Swift with Bob
 ### What's New in Swift 4
 ### Key Paths
 
 **Problem:** I'm tired of chaining
 
 ---
 
 */
//: Design Model
struct Developer {
  var platform: Platform
  var information: Information
}

enum Platform {
  case iOS
  case android
}
  
struct Information {
  var name, strengths, motivation: String
}

//: Create Objects
let robInformation = Information(name: "Rob", strengths: "Zenness", motivation: "Change the world")
let bobInformation = Information(name: "Bob", strengths: "Dryness", motivation: "None")

let rob = Developer(platform: .android, information: robInformation)
let bob = Developer(platform: .iOS, information: bobInformation)

//: Your past
rob.information.name // "Rob"
bob.information.name // "Bob"

//: ### Introduction Swift 4 Key Paths
//: Access Through "Path"
let bobPlatform = bob[keyPath: \Developer.platform] // iOS
let bobName = bob[keyPath: \Developer.information.name] // 'Bob"

//: Store Path
let informationKeyPath = \Developer.information
let bobInfo = bob[keyPath: informationKeyPath]
let robInfo = rob[keyPath: informationKeyPath]


//: Append Key Path
let nameKeyPath = informationKeyPath.appending(path: \.name)
bob[keyPath: nameKeyPath] // "Bob"
rob[keyPath: nameKeyPath] // "Rob"


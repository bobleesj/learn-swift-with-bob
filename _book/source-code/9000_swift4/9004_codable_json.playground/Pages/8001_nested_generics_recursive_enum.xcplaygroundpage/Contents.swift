/*:
 ## Learn Swift with Bob
 ### What's New in Swift 4
 ### 9004_Codable and JSON Serialization
 
 **Problem:** Map JSON to Object in one line of code and the opposite
 
 ---
 
 */

//: Your Past
/*
let republicOfKorea = JSON(dictionary: [
  "capital": "Seoul",
  "name": "Republic of Korea",
  "population": 50000000
  ])
 */

// Itunes API Doc: https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api/#overview
// API Call: https://itunes.apple.com/lookup?id=909253


//: Import Foundation
import Foundation


//: Design Model
struct User: Codable {
  var name : String
  var loginMethods : [LoginMethods]
  var numberOfFriends : Int
}

enum LoginMethods: String, Codable {
  case facebook, instagram, linkedin, twitter
}


//: Dummy Model
struct AnotherUser: Codable {
  var name : String
  var social : [LoginMethods]
  var numberOfFriends : Int
}

//: Create Object
let bob = User(name: "Up", loginMethods: [.facebook, .instagram], numberOfFriends : 4)

//: ### Encode (Object to JSON)
//: Create Encoder
let jsonEncoder = JSONEncoder()

//: Modify Setting/Property¯
jsonEncoder.outputFormatting = .prettyPrinted
jsonEncoder.dataEncodingStrategy = .base64Encode

//: Encode
var data: Data?

do {
  let jsonData = try jsonEncoder.encode(bob)
  data = jsonData
  let jsonString = String(data: jsonData, encoding: .utf8)
  print("JSON String : " + jsonString!)
}
catch(let error) {
  print(error)
}

//: ### Decode (JSON to Object)

//: Create Decoder
let jsonDecoder = JSONDecoder()

//: Decode
do {
  let bob = try jsonDecoder.decode(User.self, from: data!)
  // let bob = try jsonDecoder.decode(AnotherUser.self, from: data!)
  print("Name : \(bob.name)")
  print("Number of friends: \(bob.numberOfFriends)")
} catch(let error) {
  print(error)
}


//: > It has to look identical --> Less flexible

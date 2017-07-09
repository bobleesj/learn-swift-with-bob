# Codable and JSON Serialization
## Introduction
## Problem
Map JSON to Object in one line of code

## Conclusion

```swift
let republicOfKorea = JSON(dictionary: [
  "capital": "Seoul",
  "name": "Republic of Korea",
  "population": 50000000
  ])

let koreaCaital: String? = republicOfKorea["capital"]
let koreaName: String? = republicOfKorea["name"]
let koreaPopulation: Int? = republicOfKorea["population"]
```

### Import Foundation
```swift
import Foundation
```

### Design Model

```
struct User: Codable {
  var name : String
  var loginMethods : [LoginMethods]
  var numberOfFriends : Int
}

enum LoginMethods: String, Codable {
  case facebook, instagram, linkedin, twitter
}
```

### Create Object
```swift
let bob = User(name: "Up", loginMethods: [.facebook, .instagram], numberOfFriends : 4)
```

### Encode (Object to JSON)

```swift
//: Create Encoder
let jsonEncoder = JSONEncoder()
```

#### Customize Encoder
```swift
jsonEncoder.outputFormatting = .prettyPrinted
jsonEncoder.dataEncodingStrategy = .base64Encode
```

#### Execution
```swift
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
```

### Decode (JSON to Object)

#### Create Decoder
```swift
let jsonDecoder = JSONDecoder()
```

#### Execution
```swift
do {
  let bob = try jsonDecoder.decode(User.self, from: data!)
  // let bob = try jsonDecoder.decode(AnotherUser.self, from: data!)
  print("Name : \(bob.name)")
  print("Number of friends: \(bob.numberOfFriends)")
} catch(let error) {
  print(error)
}
```

### Source Code
[9004_json_serialization_codable]()
### Resources

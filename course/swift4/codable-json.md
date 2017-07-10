# Codable and JSON Serialization
## Introduction
Welcome, everyone. Today, you will learn how to convert an object to a json file vice versa with a single line of code. If you have never worked with `JSON` before, don't you worry. I will walk you through.

## Problem
Map JSON to Object in one line of code and the opposite


### Introducing JSON
How to resemble a `json` file as seen in the previous lesson.

```swift
let republicOfKorea = JSON(dictionary: [
  "capital": "Seoul",
  "name": "Republic of Korea",
  "population": 50000000
  ])
```

The `json` format above would look,

```json
{
  "capital": "Seoul",
  "name:": "Repulibc of Korea",
  "population": 50000000  
}
```

When you make an API call, `https://itunes.apple.com/lookup?id=909253`you will receive data from the server,

```json
{
 "resultCount":1,
 "results": [
{"wrapperType":"artist", "artistType":"Artist", "artistName":"Jack Johnson", "artistLinkUrl":"https://itunes.apple.com/us/artist/jack-johnson/id909253?uo=4", "artistId":909253, "amgArtistId":468749, "primaryGenreName":"Rock", "primaryGenreId":21}]
}
```

Let us attempt to convert an object to a json format using the `encode` API introduced in Swift 4.

### Import Foundation
First thing first, import `Foundation`.

```swift
import Foundation
```

### Design Model
Let us create a blueprint for an object.

```swift
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

That's right. I have 4 friends.

### Encode (Object to JSON)
Let's attempt convert the `bob`object to a `json` format

```swift
//: Create Encoder
let jsonEncoder = JSONEncoder()
```

#### Customize Encoder
You may customize how the final form of `json` would look like as shown below. You don't have to.

```swift
jsonEncoder.outputFormatting = .prettyPrinted
jsonEncoder.dataEncodingStrategy = .base64Encode
```

#### Execution
Let us convert the `bob` object to `json` using the `jsonEncoder` object.

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

You could technically execute the above method in one line of code using `try!`. But, it's better to handle error so that no one goes wild.

```json
JSON String : {
  "name" : "Up",
  "loginMethods" : [
    "facebook",
    "instagram"
  ],
  "numberOfFriends" : 4
}
```

### Decode (JSON to Object)
Let's attempt to convert the `json` file to an object using `JSONDecoder`.

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

The `bob` local constant has been created within the `do` block based on the type of `User`. The `json` format has to match with the data model structure of the class/struct parameter. If not, you will get an error.

### Final Thought
`JSONEncoder` and `JSONDecoder` are powerful features. However, you still have to be cautious since the data structure of the object must match with that of the json file. If not, it's not great. Make sure you are aware.

### Source Code
[9004_json_serialization_codable]()

### Resources
[Itunes JSON API](https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api/#overview)

[Working with JSON in Swift - Apple](https://developer.apple.com/swift/blog/?id=37)

[How to parse Json in Swift - Roadfile Software](http://roadfiresoftware.com/2016/12/how-to-parse-json-with-swift-3/)

[Swift JSON Tutorial - Ray Wenderlich](https://www.raywenderlich.com/150322/swift-json-tutorial-2)


## Conclusion
In this lesson, we haven't learned how to parse and map a `json` file using the old approach since you can find those things anywhere on the internet. In fact, I have attached a couple resources for you to take a look at if you want.

However, you've learned how to convert an object to a json file by conforming to the `Codable` protocol. And, you've learned how to map a json file to an object with one line of code. Still, you have to cautious since the blueprint/data structure must match together. 

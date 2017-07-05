/*:
 ## Learn Swift with Bob
 ### Generic Protocols
 ### Intro to Associated Type
 
 **Problem:** How to create generic protocols
 
 ---
 
 */
//: > **#1 Rule:** Type must be defined before compiled.

//: Design Generic Struct (Review)
struct GenericStruct<T> {
  var property: T?
}

let explicitly = GenericStruct<Bool>()
// T is Bool 
let implicitly = GenericStruct(property: "Bob")
// T is String 

//: Design Normal Protocol
protocol NormalProtocol {
  var property: String { get set }
}
//: Design Class
class NormalClass: NormalProtocol {
  var property: String = "Bob"
}



//: ### Introducing Generic Protocol
protocol GenericProtocol {
  associatedtype myType
  var anyProperty: myType { get set }
}


//: Define Associated Type
struct SomeSturct: GenericProtocol {
  var anyProperty = 1996 // myType = Int
}

struct NewStruct: GenericProtocol {
  var anyProperty = "Bob" // myType = String
}

//: Define Associated Type with Typealias
struct ExplicitStruct: GenericProtocol {
  typealias myType = Bool
  var anyProperty = true  
}


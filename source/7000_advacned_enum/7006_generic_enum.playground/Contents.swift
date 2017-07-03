/*:
 ## Learn Swift with Bob
 ### Advanced Enum
 ### Generic Enum
 
 **Problem:** A little more complex associated value
 
 ---
 
 */

//: Introducing Generic Enum
enum Information<T, U> {
  case name(T)
  case website(T)
  case age(U)
}

// Information.name("Bob")
// T is "String", but U?

Information<String, Int>.age(20)

//: Optionals with Enum
let explicitOptionals = Optional("Bob")
let quickOptionals: String? = "Bob"

print(explicitOptionals)
print(quickOptionals)


//: Custom Optionals

enum MyOptional<T> {
  case none // nil
  case some(T)
  
  init(_ anyValue: T) {
    self = MyOptional.some(anyValue)
  }
}


MyOptional("Bobby")

//if let value = MyOptional {
//  print(value)
//}














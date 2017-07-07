/*:
 ## Learn Swift with Bob
 ### Generic Protocols
 ### Protocol Extension and Type Constraints
 
 **Problem:** Limit the scope of Protocol Extension with `where` and `Self`
 
 ---
 
 */
//: Generic Function (Review)
class LOL {}
func addLOLClassOnly<T: LOL>(array: [T]) { }
addLOLClassOnly(array: [LOL()])




//: Design Protocol
protocol GenericProtocol {
  associatedtype myType
}



class SomeClass: GenericProtocol {
  typealias myType = String
}
class SomeStruct: GenericProtocol {
  typealias myType = Int
}


//: Design Protocol Extension
extension GenericProtocol where myType == String, Self == SomeClass {
  static func introduce() {
    print("Yo, I'm Bob")
  }
}

SomeClass.introduce()



//: Design Pre-Defined Associated Type
protocol FamilyProtocol {
  associatedtype familyType = Int
  var familyMembers: [familyType] { get set }
}


struct NumberFamily: FamilyProtocol {
  var familyMembers: [Int] = [1, 3, 4]
}









/*:
 ## Learn Swift with Bob
 ### Generic Protocols
 ### Override Protocol Associated Type
 
 **Problem:**  How to override typed-defined protocol?
 
 ---
 */

//: Design Protocol
protocol FamilyProtocol {
  associatedtype familyType = Int
  var familyMembers: [familyType] { get set }
}


//: Design Struct
struct NumberFamily: FamilyProtocol {
 var familyMembers: [Int] = [1, 2, 3]
}

let numberFam = NumberFamily() // familyType == Int 

//: Override Associated Type Directly
struct NormalFamily: FamilyProtocol {
// typealias familyType = String
//  var familyMembers = ["Bob", "Bobby"]
  
  var familyMembers = ["Bob", "Bobby"]
		
}


//: Override Associated Type With Generic Struct
struct LeeFamily<T>: FamilyProtocol {
  var familyMembers: [T] = []
}


let family = LeeFamily(familyMembers: ["Bob", "Bobby", "Lee"])
  // 1. T becomes String ["Bob", "Bobby", "Lee"]
  // 2. familyType becomes String based on T










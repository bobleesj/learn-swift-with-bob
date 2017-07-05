/*:
 
 ## Learn Swift with Bob
 ### Functional Programming
 ### Flatmap
 
 **Problem:** A closure is too long to pass through a function
 
 ---
 */




extension Array {
  func flatMap<U>(transform: (Element) -> U?) -> [U] {
    var result = [U]()
    for item in map(transform) {
      if let nonOptional = item {
        result.append(nonOptional)
      }
    }
    return result
  }
}



let collections = [[5,2,7],[4,8],[9,1,3]]
let flat = collections.flatMap { $0 }
print(flat)


let onlyEvenSimpler = collections.flatMap { $0.filter { $0 % 2 == 0 } }






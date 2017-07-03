/*:
 ## Learn Swift with Bob
 ### Functional Programming
 ### Intro to Functional Paradigm
 
 **Problem:** What's functional?
 */



let possibles:[Int?] = [nil, 1, 2, 3, nil, nil, 4, 5]
let actuals = possibles.flatMap { $0 }
print(actuals)



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


//: ## Flat Map
let collections = [[5,2, 1, 2, 3, 7],[4,8],[9,1,3]]
let flat = collections.flatMap { $0 }
print(flat)

let people: [String?] = ["Tom" ,nil ,"Peter" ,nil ,"Harry"]
let valid = people.flatMap {$0}
print(valid)




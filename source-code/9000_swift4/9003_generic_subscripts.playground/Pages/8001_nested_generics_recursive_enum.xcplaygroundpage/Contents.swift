/*:
 ## Learn Swift with Bob
 ### What's New in Swift 4
 ### Generic Subscripts
 
 **Problem:** Can subscripts return `T`?
 
 ---
 
 */

//: Your Past
struct WeekDays {
  private var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
  
  subscript(index: Int) -> String {
    return days[index]
  }
  
}

//: JSON
struct JSON {
  private var storage: [String: Any]
  
  init(dictionary: [String: Any]) {
    self.storage = dictionary
  }
  
  subscript<T>(key: String) -> T? {
    return storage[key] as? T
  }
}

//: Create Object
let republicOfKorea = JSON(dictionary: [
  "capital": "Seoul",
  "name": "Republic of Korea",
  "population": 50000000
  ])

//: Access Value
let koreaCaital: String? = republicOfKorea["capital"]
let koreaName: String? = republicOfKorea["name"]
let koreaPopulation: Int? = republicOfKorea["population"]

//: > I don't recommend using `Subscripts`.


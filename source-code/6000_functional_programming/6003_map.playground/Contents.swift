/*:
 
 ## Learn Swift with Bob
 ### Functional Programming
 ### Map
 
 **Problem:** A closure is too long to pass through a function
 
 ---
 */



var values = [2.0,4.0,5.0,7.0]
var squares: [Double] = []
for value in values {
  squares.append(value*value)
}


values = [2.0,4.0,5.0,7.0]
squares = values.map { $0 * $0 }
// [4.0, 16.0, 25.0, 49.0]


func myMap<T, U>(_ items: [T], _ f: (T) -> U) -> [U] {
  var result = [U]()
  for item in items {
    result.append(f(item))
  }
  return result
}


print(myMap([1, 2, 3, 4 , 5, 6]) { $0 * $0 })



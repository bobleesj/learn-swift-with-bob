
//: Imperative/Non-functional
var squaredNumbers: [Double] = []

var numbers = [1.0, 2.0, 3.0, 4.0, 5.0]
for number in numbers {
  squaredNumbers.append(number * number)
}

numbers.map { $0 * $0 } // [1, 4, 9, 16, 25]
let cast = ["Vivien", "Marlon", "Kim", "Karl"]
let lowercaseNames = cast.map { $0.lowercased() }

func myMap(numbers: [Double], logic: (Double) -> Double) -> [Double] {
  var result: [Double] = []
  for number in numbers {
   let transformedValue = logic(number)
    result.append(transformedValue)
  }
  return result
}

myMap(numbers: [1, 2, 3, 4, 5]) { (number) -> Double in  number * 10 }
myMap(numbers: [1, 2, 3, 4, 5]) { $0 * 10 }
//: Generics 
func myMap<T, U>(_ items: [T], _ operation: (T) -> U) -> [U] {
  var result = [U]()
  for item in items {
    result.append(operation(item))
  }
  return result
}

myMap([1, 2, 3, 4 , 5, 6]) { String($0 * $0) }
//: The Purest Form
extension Array {
  func myMap<U>(_ operation: (Element) -> U) -> [U] {
    var result = [U]()
    for item in self {
      result.append(operation(item))
    }
    return result
  }
}


let result = Array(1...10).myMap { $0 * 10 }
print(result)




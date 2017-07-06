/*:
 
 ## Learn Swift with Bob
 ### Functional Programming
 ### Reduce
 
 **Problem:** Combine all elements into one
 
 ---
 */


let result = Array(1...10).reduce(0) { $0 + $1 }
print(result)


func myReduce(seed: Int, numbers: [Int], operation: (Int, Int) -> Int) {
  var current = seed
  for number in numbers {
    current = operation(current, number)
  }
  print("The number is \(current)")
}

myReduce(seed: -100, numbers: Array(1...4), operation: { $0 + $1 })

// seed 없이 보여준다 초반에는



extension Array {
  func myReduce<T, U>(seed:U, operation:(U, T) -> U) -> U {
    var current = seed
    for item in self {
      current = operation(current, item as! T)
    }
    return current
  }
}




let maxNumber = Array(1...10).reduce(0) { (total, number) in max(total, number) }
print(maxNumber)

let evenSum = Array(1...10)
  .filter { (number) in number % 2 == 0 }
  .reduce(0) { (total, number) in total + number }

print(evenSum)

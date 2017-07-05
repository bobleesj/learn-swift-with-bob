/*:
 
 ## Learn Swift with Bob
 ### Functional Programming
 ### Reduce
 
 **Problem:** A closure is too long to pass through a function
 
 ---
 */


extension Array {
  func myReduce<T, U>(seed:U, combiner:(U, T) -> U) -> U {
    var current = seed
    for item in self {
      current = combiner(current, item as! T)
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

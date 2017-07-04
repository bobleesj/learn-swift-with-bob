// Reduce
/*:
 ## Learn Swift with Bob
 ### Functional Programming
 ### Reduce
 
 **Problem:** Convert big numbers to one or more
 */


var evens = [Int]()
for i in 1...10 {
  if i % 2 == 0 {
    evens.append(i)
  }
}

var evenSum = 0
for i in evens {
  evenSum += i
}

print(evenSum)

evenSum = Array(1...10)
  .filter { (number) in number % 2 == 0 }
  .reduce(0) { (total, number) in total + number }

print(evenSum)


extension Array {
  func myReduce<T, U>(seed:U, combiner:(U, T) -> U) -> U {
    var current = seed
    for item in self {
      current = combiner(current, item as! T)
    }
    return current
  }
}



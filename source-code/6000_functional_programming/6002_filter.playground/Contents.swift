/*:
 
 ## Learn Swift with Bob
 ### Functional Programming
 ### Filter
 
 **Problem:**
 
 ---
 */


var evens = [Int]()
for i in 1...10 {
  if i % 2 == 0 {
    evens.append(i)
  }
}
print(evens)



func isEven(number: Int) -> Bool {
  return number % 2 == 0
}
evens = Array(1...10).filter(isEven)
print(evens)

evens = Array(1...10).filter { (number) in number % 2 == 0 }
print(evens)


evens = Array(1...10).filter { $0 % 2 == 0 }
print(evens)


func myFilter<T>(source: [T], predicate:(T) -> Bool) -> [T] {
  var result = [T]()
  for i in source {
    if predicate(i) {
      result.append(i)
    }
  }
  return result
}
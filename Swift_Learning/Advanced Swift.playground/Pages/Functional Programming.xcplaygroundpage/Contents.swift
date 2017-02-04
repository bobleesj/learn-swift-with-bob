func isEven(number: Int) -> Bool {
  return number % 2 == 0
}

let evens = Array(1...10).filter(isEven)

print(evens)



var newEvens = Array(1...10).filter { (number) in number % 2 == 0 }
var newEvensss = Array(1...10).filter { $0 % 2 == 0 }
print(newEvensss)

print(newEvens)


// Higher Order functino:  passed as a argument /return
// First-class function: store into a value
// Closure: no name functions

// The magic behind Filter 

func myFilter<T>(source: [T], predicate:(T) -> Bool) -> [T] {
  var result = [T]()
  for i in source {
    if predicate(i) {
      result.append(i)
    }
  }
  return result
}


let newValue = myFilter(source: Array(1...10)) { $0 % 2 == 0 }

// Reduce

var evenSum = Array(1...10).filter { (number) in number % 2 == 0 }.reduce(0) { (total, number) in total + number }

print(evenSum)



//func reduce<U>(initial: U, combine: (U, T) -> U) -> U

let maxNumber = Array(1...10).reduce(0) { (total, number) in max(total, number) }
print(maxNumber)

let numbers = Array(1...10).reduce("numbers: ") {(total, number) in total + "\(number)"}
print(numbers)




extension Array {
  func myReduce<T, U>(seed:U, combiner:(U, T) -> U) -> U {
    var current = seed
    for item in self {
      current = combiner(current, item as! T)
    }
    return current
  }
}


import Foundation

let words = ["Cat", "Chicken", "fish", "Dog",
             "Mouse", "Guinea Pig", "monkey"]

typealias Entry = (Character, [String])

func buildIndex(words: [String]) -> [Entry] {
  let letters = words.map {
    (word) -> Character in
    Character(word.substringToIndex(advanced(word.startIndex, 1)
      ).uppercaseString)
  }
  print(<#T##items: Any...##Any#>)(letters)
  return [Entry]();
}

print(buildIndex(words: words))



// Advanced Concepts
// Chaining, Composition and Currying






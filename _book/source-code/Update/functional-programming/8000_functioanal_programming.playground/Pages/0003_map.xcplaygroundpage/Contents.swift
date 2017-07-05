
//: ## Map

extension Array {
  func  myMap<T>(_ transform: (Element) -> T) -> [T] {
    var result: [T] = []
    for x in self {
      result.append(transform(x))
    }
    return result
  }
}

Array(1...10).myMap { (Number) -> Int in
  return Number * 10
}


let suits = ["♠", "♥", "♣", "♦"]
let ranks = ["J","Q","K","A"]
let result = suits.flatMap { suit in ranks.map {
  rank in  (suit, rank)
  }
}

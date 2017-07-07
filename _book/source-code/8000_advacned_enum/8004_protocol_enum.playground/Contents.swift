/*:
 ## Learn Swift with Bob
 ### Nested Enum
 ### Protocol Oriented Enum
 
 **Problem:** Let's combine the best of the best
 
 ---
 
 */
//: ### Game Design
//: Design Protocol
protocol LifeSpan {
  var numberOfHearts: Int { get }
  mutating func increaseHeart() // heart +1
  mutating func getAttacked() // heart -1
}


//: Design Enum
enum Player: LifeSpan {
  case dead
  case alive(currentHeart: Int)
  
  var numberOfHearts: Int {
    switch self {
    case .dead: return 0
    case let .alive(numberOfHearts): return numberOfHearts
    }
  }
  
  mutating func increaseHeart() {
    switch self {
    case .dead:
      self = .alive(currentHeart: 1)
    case let .alive(numberOfHearts):
      self = .alive(currentHeart: numberOfHearts + 1)
    }
  }
  
  mutating func getAttacked() {
    switch self {
    case .alive(let numberOfHearts):
      if numberOfHearts == 1 {
        self = .dead
      } else {
        self = .alive(currentHeart: numberOfHearts - 1)
      }
    case .dead:
      break
    }
  }
}

//: Play Game
var state = Player.dead // .dead
state.increaseHeart()
state.numberOfHearts
state.increaseHeart()
state.getAttacked()
state.getAttacked()
state.numberOfHearts



//: Custom Operations (Taste)
enum GameAction {
  case Start
  case Pause
  case Stop
  case Restart(delay: Int)
}

// GameAction.Stop == GameAction.Stop


func ==(lhs: GameAction, rhs: GameAction) -> Bool {
  switch (lhs, rhs) {
  case (.Start, .Start), (.Pause, .Pause), (.Stop, .Stop):
    return true
  case let (.Restart(lhsDelay), .Restart(rhsDelay)):
    return lhsDelay == rhsDelay
  default:
    return false
  }
}


GameAction.Restart(delay: 10) == GameAction.Restart(delay: 10)
1 + 3 / 3














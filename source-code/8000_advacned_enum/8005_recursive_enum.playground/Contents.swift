/*:
 ## Learn Swift with Bob
 ### Advanced Enum
 ### Recursive Enum
 
 **Problem:** Enum contains its own enum type
 
 ---
 
 */
func recursiveFunction() {
  print("Hi!")
  recursiveFunction()
}

// recursiveFunction()

//: Design Enum
indirect enum ArithmeticExpressions {
  case number(Int)
  case addition(ArithmeticExpressions, ArithmeticExpressions)
  case multiplication(ArithmeticExpressions, ArithmeticExpressions)
}

ArithmeticExpressions.number(4)
ArithmeticExpressions.addition(.number(4), .number(4))

let five = ArithmeticExpressions.number(5)
let four = ArithmeticExpressions.number(4)

func evaluate(_ expression: ArithmeticExpressions) -> Int {
  switch expression {
  case let .number(value):
    return value
  case let .addition(left, right):
    return evaluate(left) + evaluate(right)
  case let .multiplication(left, right):
    return evaluate(left) * evaluate(right)
  }
}

evaluate(ArithmeticExpressions.number(4))
evaluate(ArithmeticExpressions.addition(.number(4), .number(4)))

let multiplicationEnumType = ArithmeticExpressions.multiplication(.number(4), .number(4))

evaluate(multiplicationEnumType)


//: Alternative Normal Enum
enum Operation {
  case addition(Int, Int)
  case multiplication(Int, Int)
  
  var result: Int {
    switch self {
    case let .addition(number1, number2):
      return number1 + number2
    case let .multiplication(number1, number2):
      return number1 * number2
    }
  }
}

Operation.addition(4, 4).result


//: Another Alternative
struct StructOperation {
  func addTwoNumbers(_ number1: Int, _ number2: Int) -> Int {
    return number1 + number2
  }
  func multiplfyNumbers(number1: Int, number2: Int) -> Int {
    return number1 * number2
  }
}

StructOperation().addTwoNumbers(4, 9)

//: This is What I'd do
struct MathOperation {
  static let addition: (Int, Int) -> Int = { $0 + $1 }
  static let multiplication: (Int, Int) -> Int  = { $0 * $1 }
}

MathOperation.addition(10, 10)













var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
  completionHandlers.append(completionHandler)
  print("hello from SomeFunctionWithEscapingClosure")
}

someFunctionWithEscapingClosure(completionHandler: {
  print("hello babyabyaby")
})

//completionHandlers[0]()

var money: () -> Void = {
  print("money")
}

func sayHello() -> Void {
  print("sayHello")
}
completionHandlers.append(money)
completionHandlers.append(sayHello)
print(completionHandlers[1]())
print(completionHandlers[2]())

// A closure is said to be escape a function when the closure is passed as an argument to the function
// But is called after the function returns. 
// When you declare a function that takes a closure as one of its parameters, you can write @escaping before the parameter's type to type to indicate that the closure if allowed to escape.


var myCompletionHandlers: [() -> String] = []

func testEscapeClosure(completionHandler: @escaping () -> String) -> String {
  myCompletionHandlers.append(completionHandler)
  return "Does this returned come before"
}


print(testEscapeClosure { () -> String in
  return "Test1"
})

print(myCompletionHandlers[0]())

func hello() -> String {
  return "helllo"
}


class SomeClass {
  var x = 10
  func doSomething() {
    someFunctionWithEscapingClosure { self.x = 100 }
    }
}

// customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
func wow(customer customerProvider: () -> String) {
  print("Now serving \(customerProvider())!")
}

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

wow(customer: { customersInLine.remove(at: 0) } )
// Prints "Now serving Alex!"


// customersInLine is ["Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: @autoclosure () -> String) {
  print("Now serving \(customerProvider())!")
}


serve(customer: customersInLine.remove(at: 3))

// Prints "Now serving Ewa!"
var add: (Int, Int) -> Int = { (number1, number2) in
  return number1 + number2
}

func addTwoNumber(number1: Int, number2: Int) -> Int {
  return number1 + number2
}

var newAdd = addTwoNumber

var addValues: (Int, Int) -> Int = { return $0 + $1
}

var addValuess: (Int, Int) -> Int = { $0 + $1 }

var storedClosure: (Int, Int) -> Int = { (number1, number2) in
  print("Hello")
  return number1 + number2
}


storedClosure(3, 5)

func insertSomething(closure: () -> String) {
  closure()
}

func returnHelloWorld() -> String {
  print("Hello World")
  return "Hello World"
}

var closureHelloWorld: () -> String = { return "hello" }
insertSomething(closure: closureHelloWorld) // "hello"


insertSomething(closure: returnHelloWorld)
insertSomething(closure: closureHelloWorld)

insertSomething(closure: { return "hello world"})













/*:
 ## Learn Swift with Bob
 ### Swift Memory Management
 ### @escape and @autoclosures
 
 **Problem:** What are those?
 
 ---
 */
//: Scenario 1
var closureBlocks: [() -> Void] = []

func funcWithClosure(closure: @escaping () -> Void) {
  closureBlocks.append(closure)
}

// If the closure executed after the function finishes == @escape


//: Scenario 2
import Foundation

func funcWithNetworkingClosure(closure: @escaping () -> Void) {
  DispatchQueue.global().async {
    closure() // Ex) downloading
  }
}


//funcWithNetworkingClosure {
//  for _ in 1...1000 {
//    print("downloading")
//  }
//}

//: Normal Function
class Normal {
  let name = "Bob"
  
  func normalFunctionWithClosure(closure: (String) -> Void) {
    closure(self.name)
  }
}

Normal().normalFunctionWithClosure { (myName) in
  print(myName)
}

//: Benefits of Non-Escaping
//: 1. There is no retention cycle for non-escaping
//: 2. You may use `self` keyword without worrying about memory leak
//: 3. Performance and the ability for the compiler to optimize


//: @autoclosure
func checkIDCard(hasCard: () -> Bool) {
  if hasCard() {
    print("You've an ID")
  }
}

checkIDCard(hasCard: { return true})
checkIDCard(hasCard: { true })
checkIDCard { true }



func checkIDCard(hasCard: @autoclosure () -> Bool) {
  if hasCard() {
    print("You've an ID")
  }
}

checkIDCard(hasCard: true)



//: Lazy Init Capture
class BobGreet {
  var name = "Bob the Developer"
  
  lazy var greeting: String = {
    return "Hello, \(self.name)"
  }()
  
  deinit {
    print("I'm gone, bruh 🙆‍")}
}

var bobGreet: BobGreet? = BobGreet()
bobGreet?.greeting
bobGreet = nil // "I'm gone, bruh 🙆‍" 
// No-escaping by default




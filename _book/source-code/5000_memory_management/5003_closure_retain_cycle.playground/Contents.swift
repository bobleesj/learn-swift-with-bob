/*:
 ## Learn Swift with Bob
 ### Swift Memory Management
 ### Closure Retain Cycle 
 
 **Problem:**
 1. How to use `capture lists` to prevent retain cycle in closures
 2. When to use `unowned`
 
 ---
 */



//: Design Class
class BobClass {
  var bobClosure: (() -> ())?
  var name: String = "Bob"
  
  init() {
    bobClosure = { [unowned self] in
//      guard let object = self else {
//        return
//      }
//    
//      print("\(object.name) the Developer")
      print("\(self.name) the Developer")
    }
  }
  
  deinit {
    print("Bobclass gone")
  }
}

var bobClass: BobClass? = BobClass()
bobClass?.bobClosure!()


bobClass = nil



//: Design Independent Class
class Owner {
  var creditCard: CreditCard?
  deinit { print("Owner gone") }
}


//: Design Dependent Class
class CreditCard {
  unowned let owner: Owner
  
  init(enterOwner: Owner) {
    owner = enterOwner
  }
  
  deinit {
    print("Card gone")
  }
  
}


//: Create Instances
var bob: Owner? = Owner()
var myCard = CreditCard(enterOwner: bob!)
bob?.creditCard = myCard

bob = nil

// myCard.owner // crash



//: > If `self` will never be deallocated before the closure block, use `unowned`. If you try to access the value of an unowned reference after that instance has been deallocated, you’ll get a runtime error.



// Once there is no strong referenece to an object (reference count to 0), that object will get denit and its momery will be collected. 

// But there is a problem - retain cycle


// Every time you create a new instance of a class, ARC allocates a chunk of memory to store information about that instance. 

class Person {
  let name: String
  init(name: String) {
    self.name = name
    print("\(name) is being initialized")
  }
  deinit {
    print("\(name) is being deinitialized")
  }
}


var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed")

reference2 = reference1
reference3 = reference1

reference1 = nil

print(reference2?.name)
print(reference3?.name)
reference1?.name


// ARC is able to track the number of references to the new Person instace you create and to deallocate that Person instance when it is no longer needed. 


// But, there is a problem. It is possible to write in an instance of a class never gets to a point where it has zero strong references. This can happen when two class instances hold a strong refernces to each other

import UIKit
import XCPlayground


let button = UIImage(named: "UIButton Inheritance")

var num = 2
//: [Previous](@previous)


/*:
 This text is above the horizontal rule
 
 ---
 And this is below
 */

/*: Setup and use a link reference.
 [The Swift Programming Language]: http://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/ "Some hover text"
 
 For more information, see [The Swift Programming Language].
 */

//: show Swift keywords such as `for` and `let` as monspaced font.


/*:
 \* This is not a bullet item
 * but this is a bullet item
 */

//: [Next](@next)
//: [Previous](@previous)

func horizontalRuleExAMPLE() {
  
  /**
   An example of using a *horizontal rule*
   
   This text is above the horizontal rule
   
   *  *  *  *  *
   
   And this is below
   */
  
  
}

//: [Previous](@previous)


//: ![Icon for a playground](http://devimages.apple.com.edgekey.net/swift/images/playgrounds.png "A playground image")


//: [go back to first page](page1)





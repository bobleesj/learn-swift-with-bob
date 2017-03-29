> Currently Draft
# Bob the Developer Swift Styling Guide

#### Reference
[WWDC: Swift API Design Guidelines: ](https://developer.apple.com/videos/play/wwdc2016/403/)
<br>[The Swift Programming Language (Swift 3.1)](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/index.html)
<br>[SwiftFormat](https://github.com/nicklockwood/SwiftFormat)
<br>[The Official raywenderlich.com Swift Style Guide](https://github.com/raywenderlich/swift-style-guide)
<br>[Swift Blog: API Design Guidlines](https://swift.org/documentation/api-design-guidelines/)

## What Swift Engineers Believe
Clarity at the point of use is your most important goal. Entities such as methods and properties are declared only once but used repeatedly. Design APIs to make those uses clear and concise. When evaluating a design, reading a declaration is seldom sufficient; always examine a use case to make sure it looks clear in context.

Clarity is more important than brevity. Although Swift code can be compact, it is a non-goal to enable the smallest possible code with the fewest characters. Brevity in Swift code, where it occurs, is a side-effect of the strong type system and features that naturally reduce boilerplate.

Write a documentation comment for every declaration. Insights gained by writing documentation can have a profound impact on your design, so don’t put it off.

## Promote Clear Usage
### Include all the words needed to avoid ambiguity for a person reading code where the name is used.

```swift
extension List {
  public mutating func remove(at position: Index) -> Element
}
employees.remove(at: x)
```

```swift
employees.remove(x) // unclear: are we removing x?
```

### Omit needless words
In particular, omit words that merely repeat type information.

```swift
public mutating func removeElement(_ member: Element) -> Element?
allViews.removeElement(cancelButton)
```

```swift
public mutating func remove(_ member: Element) -> Element?

allViews.remove(cancelButton) // clearer
```

### Name variables, parameters, and associated types according to their roles, rather than their type constraints.

```swift
var string = "Hello"
protocol ViewController {
  associatedtype ViewType : View
}
class ProductionLine {
  func restock(from widgetFactory: WidgetFactory)
}
```

```swift
var greeting = "Hello"
protocol ViewController {
  associatedtype ContentView : View
}
class ProductionLine {
  func restock(from supplier: WidgetFactory)
}
```

### Compensate for weak type information to clarify a parameter’s role.

```swift
func add(_ observer: NSObject, for keyPath: String)

grid.add(self, for: graphics) // vague
```

```swift
func addObserver(_ observer: NSObject, forKeyPath path: String)
grid.addObserver(self, forKeyPath: graphics) // clear
```

### Strive for Fluent Usage
 Prefer method and function names that make use sites form grammatical English phrases.

 ```swift
 x.insert(y, at: z)          “x, insert y at z”
x.subViews(havingColor: y)  “x's subviews having color y”
x.capitalizingNouns()       “x, capitalizing nouns”
```

```swift
x.insert(y, position: z)
x.subViews(color: y)
x.nounCapitalize()
```

> It is acceptable for fluency to degrade after the first argument or two when those arguments are not central to the call’s meaning:


### Begin names of factory methods with “make”, e.g. x.makeIterator()

```swift
let foreground = Color(red: 32, green: 64, blue: 128)
let newPart = factory.makeWidget(gears: 42, spindles: 14)
```


```swift
let foreground = Color(havingRGBValuesRed: 32, green: 64, andBlue: 128)
let newPart = factory.makeWidget(havingGearCount: 42, andSpindleCount: 14)
```

### Name functions and methods according to their side-effects
```swift
// Those without side-effects should read as noun phrases, e.g. x.distance(to: y), i.successor().

// Those with side-effects should read as imperative verb phrases, e.g., print(x), x.sort(), x.append(y).
```
imperative for the mutating method and apply the “ed” or “ing” suffix to name its nonmutating counterpart.

When adding “ed” is not grammatical because the verb has a direct object, name the nonmutating variant using the verb’s present participle, by appending “ing.”



| Mutating | Non-Mutating |
| --- | --- |
| x.sort() | 	z = x.sorted() |
| x.append(y) |	z = x.appending(y) |


## Try to use Struct over Classes

## If you need extra features, use protocol extension


# Factory Method

## Camel Case
 Start with Uppercase for `Protocol`, `Class`, `Types`, `Enum` and lowercase for everything else

## Type
Try not ot use NS.
### Type Casting
```swift
bob as[String] // 🙅‍
bob as [String] // 🙆‍
```

### Type Inference
```swift
let selector = #selector(viewDidLoad)
view.backgroundColor = .red
let toView = context.view(forKey: .to)
let view = UIView(frame: .zero)
```

```swift
let selector = #selector(ViewController.viewDidLoad)
view.backgroundColor = UIColor.red
let toView = context.view(forKey: UITransitionContextViewKey.to)
let view = UIView(frame: CGRect.zero)
```

### NS Type
Avoid it

## Protocol

```swift
class MyViewController: UIViewController {
  // class stuff here
}

// MARK: - UITableViewDataSource
extension MyViewController: UITableViewDataSource {
  // table view data source methods
}

// MARK: - UIScrollViewDelegate
extension MyViewController: UIScrollViewDelegate {
  // scroll view delegate methods
}
```

```swift
class MyViewController: UIViewController, UITableViewDataSource, UIScrollViewDelegate {
  // all methods
}
```


## Collection Type

### Array
```swift
[ 1, 2, 3 ]  
[1, 2, 3]

let someDictionary: [String: Int] = ["Alex": 31, "Paul": 39]
let someDictionary: [String:Int] = ["Alex":31, "Paul":39]

let someDictionary: Dictionary<String, Int> = ["Alex": 31, "Paul": 39]
```

## Control Flow
```swift
if user.isHappy {
  // Do something
} else {
  // Do something else
}


if user.isHappy
{
  // Do something
}
else {
  // Do something else
}



do {
    try foo              
}              
catch {                 
    // bar            
}

do {
  try foo
} catch {
  // Bob Lee
}

}

```



## Property

### Computed Property
```swift
var diameter: Double {
  return radius * 2
}

var diameter: Double {
  get {
    return radius * 2
  }
}
```


## Operators
```swift
a+b+c        
a + b + c
```


## Function
```swift
foo.filter{return true}.map{$0}
foo.filter { return true }.map { $0 }

Foo <Bar> ()  
Foo<Bar>()

array.filter { return $0.foo == bar }       
array.filter { $0.foo == bar }
```

### Closure
Use trailing closure syntax only if there's a single closure expression parameter at the end of the argument list. Give the closure parameters descriptive names.

```swift
UIView.animate(withDuration: 1.0) {
  self.myView.alpha = 0
}

UIView.animate(withDuration: 1.0, animations: {
  self.myView.alpha = 0
}, completion: { finished in
  self.myView.removeFromSuperview()
})
```

```swift
UIView.animate(withDuration: 1.0, animations: {
  self.myView.alpha = 0
})

UIView.animate(withDuration: 1.0, animations: {
  self.myView.alpha = 0
}) { f in
  self.myView.removeFromSuperview()
}
```

```swift
attendeeList.sort { a, b in
  a > b
}
```

### Chaining
```swift
let value = numbers.map { $0 * 2 }.filter { $0 % 3 == 0 }.index(of: 90)

let value = numbers
  .map { $0 * 2 }
  .filter { $0 > 50 }
  .map { $0 + 10 }
```


## Comments
```swift
let a = 5// assignment     -->   let a = 5 // assignment
func foo() {/* no-op */}   -->   func foo() { /* no-op */ }

repeat {          
    // foo                
}            
while x {                
    //bar           
}

repeat {
  // foo
} while x {
  // bar
}
```

```swift
let foo: () -> ()
let foo: Void -> Void    
let foo: (Void) -> Void   
func foo() -> (Void)    


let foo: () -> Void
func foo() -> Void
```

```swift
lazy public weak private(set) var foo: UIView?    
private(set) public lazy weak var foo: UIView?

public override final func foo()             
final override public func foo()

convenience private init()                       
private convenience init()
```


```swift
if (foo == true) {}      
if foo == true {}

while (i < bar.count) {}    
while i < bar.count {}

queue.async() { ... }  
queue.async { ... }

let foo: Int = ({ ... })()   
let foo: Int = { ... }()
```

```swift
var foo: Int? = nil   
var foo: Int?

let foo: Int? = nil
let foo: Int? = nil // doesn't apply to `let` properties

var foo: Int? = 0      
var foo: Int? = 0 // doesn't affect non-nil initialzation
```

### Enum
```swift
enum Foo {                     
    case bar = "bar"  
    case baz = "quux"              
}             

enum Foo {
  case bar
  case baz = "quux"
}
```

## Constant
Constants are defined using the let keyword, and variables with the var keyword. Always use let instead of var if the value of the variable will not change.

Tip: A good technique is to define everything using let and only change it to var if the compiler complains!


## Optional
```swift
func computeFFT(context: Context?, inputData: InputData?) throws -> Frequencies {

  guard let context = context else {
    throw FFTError.noContext
  }
  guard let inputData = inputData else {
    throw FFTError.noInputData
  }

  // use context and input to compute the frequencies

  return frequencies
}


func computeFFT(context: Context?, inputData: InputData?) throws -> Frequencies {

  if let context = context {
    if let inputData = inputData {
      // use context and input to compute the frequencies

      return frequencies
    } else {
      throw FFTError.noInputData
    }
  } else {
    throw FFTError.noContext
  }
}
```

```swift
guard let number1 = number1,
      let number2 = number2,
      let number3 = number3 else {
  fatalError("impossible")
}
// do something with numbers


if let number1 = number1 {
  if let number2 = number2 {
    if let number3 = number3 {
      // do something with numbers
    } else {
      fatalError("impossible")
    }
  } else {
    fatalError("impossible")
  }
} else {
  fatalError("impossible")
}

```

## Delegate Method
When creating custom delegate methods, an unnamed first parameter should be the delegate source. (UIKit contains numerous examples of this.)


```swift
func namePickerView(_ namePickerView: NamePickerView, didSelectName name: String)
func namePickerViewShouldReload(_ namePickerView: NamePickerView) -> Bool

func didSelectName(namePicker: NamePickerViewController, name: String)
func namePickerShouldReload() -> Bool
```

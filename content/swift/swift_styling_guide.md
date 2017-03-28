> Currently Draft


# Bob the Developer Swift Styling Guide
> Become a better Swift developer as well

It's a combination of many I've looked. I've read the Swift documentation including the reference many times.

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
 - Prefer method and function names that make use sites form grammatical English phrases.

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





 - Init
 - Closure
 - Void
 - Enum
 - Method
 - Error Handling
 - If-let vs Else
 - Protocol



# Naming

## Camel Case
Uppercase for `Protocol`, `Class`, `Types`, `Enum`

lowercase for everything else


## Extra Syntax
 - Convenience, Private,


## Control Flow


```swift
foo as[String]   -->   foo as [String]

foo = bar [5]    -->   foo = bar[5]
```

```swift
[ 1, 2, 3 ]    -->    [1, 2, 3]
```

```swift
foo.filter{ return true }.map{ $0 }   -->   foo.filter { return true }.map { $0 }

foo({})                               -->   foo({})
```

```swift
Foo <Bar> ()    -->    Foo<Bar>()
```swift

```swift
foo . bar()   -->    foo.bar()

a+b+c         -->    a + b + c
```

```swift
let a = 5// assignment     -->   let a = 5 // assignment

func foo() {/* no-op */}   -->   func foo() { /* no-op */ }
```

```swift
if x                 if x {
{                        //foo
    //foo            }
}              -->   else {
else                     //bar
{                    }
    //bar
}
```


```swift
if x {               if x {
    //foo                //foo
}              -->   } else {
else {                   //bar
    //bar            }
}

do {                 do {
    try foo              try foo
}              -->   } catch {
catch {                  //bar
    //bar            }
}

repeat {             repeat {
    //foo                //foo
}              -->   } while x {
while x {                //bar
    //bar            }
}
```

```swift
let foo: () -> ()         -->    let foo: () -> Void

let bar: Void -> Void     -->    let bar: () -> Void

let baz: (Void) -> Void   -->    let baz: () -> Void

func quux() -> (Void)     -->    func quux() -> Void
```

```swift
lazy public weak private(set) var foo: UIView?    -->    private(set) public lazy weak var foo: UIView?

public override final func foo()                  -->    final override public func foo()

convenience private init()                        -->    private convenience init()
```


```swift
if (foo == true) {}           -->    if foo == true {}

while (i < bar.count) {}      -->    while i < bar.count {}

queue.async() { ... }         -->    queue.async { ... }

let foo: Int = ({ ... })()    -->    let foo: Int = { ... }()
```

```swift
var foo: Int? = nil     -->   var foo: Int?

let foo: Int? = nil     -->   let foo: Int? = nil // doesn't apply to `let` properties

var foo: Int? = 0       -->   var foo: Int? = 0 // doesn't affect non-nil initialzation
```

```swift
enum Foo {                     enum Foo {
    case bar = "bar"     -->       case bar
    case baz = "quux"              case baz = "quux"
}                              }
```

```swift
array.filter { return $0.foo == bar }    -->    array.filter { $0.foo == bar }
```



#### Reference

https://swift.org/documentation/api-design-guidelines/
https://github.com/raywenderlich/swift-style-guide
https://github.com/nicklockwood/SwiftFormat
https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/index.html
https://developer.apple.com/library/content/documentation/Xcode/Reference/xcode_markup_formatting_ref/

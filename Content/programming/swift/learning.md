## Learning

> This document shouldn't much make sense. This is used as a reference for me before I make tutorials for you guys.

## No Escape vs Escape

This will give compiler error in Xcode 8

```swift 
class MyClass {

    var myClosure: (() -> ())?

    func doSomething(finishBlock: () -> ()) {
        myClosure = finishBlock    // ‼️ Error: Assigning non-escaping parameter 'finishBlock' to an @escaping closure
    }
}
```

This will compile ok (explicitly write @escaping)

```swift
class MyClass {

    var myClosure: (() -> ())?

    func doSomething(finishBlock: @escaping () -> ()) {
        myClosure = finishBlock
    }
}
```
Benefits of @noescape:
 - Compiler can optimize your code for better Performance
 - Compiler can take care of memory management
 - There is no need to use a weak reference to self in the closure




### Lazy Variable
You must always declare a lazy property as a variable (with the var keyword), because its initial value might not be retrieved until after instance initialization completes. Constant properties must always have a value before initialization completes, and therefore cannot be declared as lazy.


Over the last few years I've used UIScrollViews with paging, full screen UICollectionViewCells (once had another collection view inside the cell, really really bad idea), and more recently UIPageViewControllers. I'd definitely suggest the UIPageViewControllers. It's just literally built for what you need. The one caveat I found was in the scroll view did scroll delegate for the page view controller, I got weird content offsets so had glitchy parallax effects. But I'm sure you could work around this. Page view controller seems to me like a view controller management system using a scroll view. The other thing I'd say is it's heavy on memory.

UIPageViewController is easy to use, and simple to set up. You can try it out in a test program to see if it will do what you want. You get better resource management, since it already supports reclaiming offscreen viewcontrollers.
using a UIScrollView in paging mode is more flexible. since you get a callback every time the contentOffset changes, you can do interactive animation during the left <-> right scroll. If you don't need that, then you're just re-implementing what you get for free with UIPageViewController. In particular, you have to do the sub-viewcontroller management and reclamation yourself.
Three other choices:
You could use UITableViewController, if you rotate the coordinate system 90° with an AffineTransform (Actually, you rotate, and flip to put the scrollbar at the bottom.) You have to do the corresponding transform on the UITableViewCells to get them to draw right-side up.
You could use UICollectionView with a FlowViewLayout. This makes doing transition animation even easier, for example, if you decide to have a Cover Flow-style animation someday, or look at the multi-page control in Safari's rightmost bottom button.


# MVVM
## Reference
 * [MVVM in Swift](http://artsy.github.io/blog/2015/09/24/mvvm-in-swift/) by Ash Furrow
 * [Introduction to Protocol-Oriented MVVM](https://realm.io/news/doios-natasha-murashev-protocol-oriented-mvvm/?gclid=Cj0KEQiAzZHEBRD0ivi9_pDzgYMBEiQAtvxt-AEH-8P1O-c_waPyrx9kVdrnt_llBshAJlbl5ldbI30aAlWD8P8HAQ) by Natasha

> Disclaimer: Many of examples and concepts are directly driven from the sources mentioned above.


# Introduction to MVVM
We will take a look at pro/cons of using MVC (Model-View Controller) to MVVM (Model-View-ViewModel). Ofen times, `ViewControllers` are responsible for:

 * Networking
 * User Interaction
 * Image Caching
 * Background Processing

As a result, the model and the View in MVC is rather short, but the ViewController is bloated. There is uneqal distribution of code.

<p align="center">
![MVVM](http://artsy.github.io/images/2015-09-24-mvvm-in-swift/mvvm.png)
</p>


Models don't talk to anybody
View models only talk to models
View controllers can't talk to models directly; they only interact with view models and views
Views only talk to the view controllers, notifying them interaction events (same as MVC)
The difference would be the view controller no longer has access to the model

Job of the view model
 * Date, DateFormatter
 * You shouldn't `import UIKit`
 * Typically the view model observes the view model somehow through KVO or FRP
 * MVVM and MVC both have a weakness that no clear place to put the networking logic
 *

What is View Model not responsible for: A MV does not know about the view. But, it does provide data for presenting. You could add netowkring in MV. VM and VC can communicate via delegates or FRP.


Formating in MV for numbers. People tend to put the logic into ViewController. View Model will take model and format.

```swift
let amount = 67890.23
```

ViewModel

```swift
struct AccountViewModel {
 let displayBalance: String

 init(model: BackAccount) {
  let formattedBalanced = model.balance.currencyValue
  displayBalance = "Your balance is \(formattedBalance)"
 }
}
```

ViewController

```swift
var viewModel = ViewModel(model: Account)
```

As soon as the model is updated, it updates the view model.

The problem,

```swift
class SwitchWithTextTableViewCell: UITableViewCell {
    func configure(
        title: String,
        titleFont: UIFont,
        titleColor: UIColor,
        switchOn: Bool,
        switchColor: UIColor = .purpleColor(), // you could set defaults
        onSwitchToggleHandler: onSwitchTogglerHandlerType? = nil)
    {
        // Configure views here
    }
}
```

#### Problem
You have to init many all the time.

```swift
protocol SwitchWithTextCellProtocol {
    var title: String { get }
    var titleFont: UIFont { get }
    var titleColor: UIColor { get }

    var switchOn: Bool { get }
    var switchColor: UIColor { get }

    func onSwitchToggleOn(on: Bool)
}
```

```swift
extension SwitchWithTextCellProtocol {
    var switchColor: UIColor {
        return .purpleColor()
    }
}
```

```swift
struct MinionModeViewModel: SwitchWithTextCellProtocol {
    var title = "Minion Mode!!!"
    var switchOn = true

    var switchColor: UIColor {
        return .yellowColor()
    }

    func onSwitchToggleOn(on: Bool) {
        if on {
            print("The Minions are here to stay!")
        } else {
            print("The Minions went out to play!")
        }
    }
}
```

```swift
// YourViewController.swift
let cell = tableView.dequeueReusableCellWithIdentifier("SwitchWithTextTableViewCell", forIndexPath: indexPath) as! SwitchWithTextTableViewCell

// This is where the magic happens!
cell.configure(withDelegate: MinionModeViewModel())

return cell
```

```swift
protocol SwitchWithTextCellDataSource {
    var title: String { get }
    var switchOn: Bool { get }
}

protocol SwitchWithTextCellDelegate {
    func onSwitchToggleOn(on: Bool)

    var switchColor: UIColor { get }
    var textColor: UIColor { get }
    var font: UIFont { get }
}
```

```swift
struct MinionModeViewModel: SwitchWithTextCellDataSource {
    var title = "Minion Mode!!!"
    var switchOn = true
}
```

```swift
extension MinionModeViewModel: SwitchWithTextCellDelegate {
    var switchColor: UIColor {
        return .yellowColor()
    }

    func onSwitchToggleOn(on: Bool) {
        if on {
            print("The Minions are here to stay!")
        } else {
            print("The Minions went out to play!")
        }
    }
}
```

```swift
let viewModel = MinionModeViewModel()
cell.configure(withDataSource: viewModel, delegate: viewModel)
return cell
```



## UITableView
[Source](https://medium.com/capital-one-developers/smooth-scrolling-in-uitableview-and-uicollectionview-a012045d77f#.75gj88i8s)

### Model

```swift
enum Role: String {
    case Unknown = "Unknown"
    case User = "User"
    case Owner = "Owner"
    case Admin = "Admin"

    static func get(from: String) -> Role {
        if from == User.rawValue {
            return .User
        } else if from == Owner.rawValue {
            return .Owner
        } else if from == Admin.rawValue {
            return .Admin
        }
        return .Unknown
    }
}

struct User {
    let avatarUrl: String
    let username: String
    let role: Role

    init(avatarUrl: String, username: String, role: Role) {
        self.avatarUrl = avatarUrl
        self.username = username
        self.role = role
    }
}
view raw
```

### View Model
```swift
struct UserViewModel {
    let avatarUrl: String
    let username: String
    let role: Role
    let roleText: String

    init(user: User) {
        // Avatar
        avatarUrl = user.avatarUrl

        // Username
        username = user.username

        // Role
        role = user.role
        roleText = user.role.rawValue
    }
}
```


## Implementing MVVM in iOS with RxSwift https://medium.cobeisfresh.com/implementing-mvvm-in-ios-with-rxswift-458a2d47c33d#.p7r1aky6k



# Networking

## Isolating tasks in Swift, or how to create a testable networking layer by Fernando Martín Ortiz

[Source](https://medium.com/ios-os-x-development/isolating-tasks-in-swift-or-how-to-create-a-testable-networking-layer-d0380e69f7e3#.hlnhlkkjd)

Single Responsibility.
A ConnectionManager contains too many responsibilities to be considered a good practice. Moreover, it is often implemented as a singleton. And I don’t say singletons are necessarily bad, but they can’t be injected as dependencies, and can’t be easily mocked when testing.


Put in this way, a network call implies, at least, three steps:
1. Create a request: this means setting the URL, method, parameters (either in URL path or http body) and HTTP headers.
2. Dispatch request: This is a very, very important step. The request that was created and configured in the previous step must be dispatched using URLSession, or a layer over that (for example, Alamofire).
3. Get and parse response: It’s important that this step should be implemented separated from the previous two. This is where you should validate JSON or XML response and parse that into a valid Entity (or Model if you prefer to say).


> Network layer should be implemented using, at least, three different components.

Request: A Request object has everything needed for configuring a network request. It is a struct, or class that is responsible for configuring a single network request. And this is very important: One network request, one Request object.


NetworkDispatcher: A NetworkDispatcher is an object that is responsible of getting a Request and return a Response. It should be implemented as a protocol. You should code against that protocol and not against a concrete class (or struct), and it should never, ever, be implemented as a singleton. If you do that, this NetworkDispatcher can be replaced for a MockNetworkDispatcher that doesn’t actually make any network request, and instead getting the response from a JSON file, leading to a naturally testable architecture.


NetworkTask: A NetworkTask is a subclass of the generic class Task. A task, as I will explain better in a moment, is a generic class that is responsible of getting an Input type and returning a Output type, either in a synchronous, or asynchronous way. You can implement a Task using RxSwift, ReactiveCocoa, Hydra, Microfutures, FOTask, or simply using closures. It’s up to you. The important part here is the concept, not the implementation details


## Implement Request
A `Request` is an object that is responsible of configuring everything that may be necessary to create a `URLRequest`.

```swift

import Foundation

enum HTTPMethod: String {
    case get, post, put, patch, delete
}

protocol Request {
    var path        : String            { get }
    var method      : HTTPMethod        { get }
    var bodyParams  : [String: Any]?    { get }
    var headers     : [String: String]? { get }
}

extension Request {
    var method      : HTTPMethod        { return .get }
    var bodyParams  : [String: Any]?    { return nil }
    var headers     : [String: String]? { return nil }
}

```


## Implement Networking Layer
static dispatch = the dispatch order is defined at compile time. It simply means that any function/method call say foo() or x.foo() will always invoke the very same function -- this is established once and then stays that way. This implies that the compiler can determine the type of x at compile time.

dynamic dispatch = the dispatch order is resolved at run time. This means the compiler builds a lookup table of all functions/methods and determines which one to actually call at run time. Say there there is class A and B, both of which implement interface X with method X.bar(). At runtime, y is examined and based on its actual class either A.bar() or B.bar() is called.

multiple dynamic dispatch = the dispatch order is dependent on function/method name + argument types (=a.k.a. signature), and the actual implementation that gets called is determined dynamically at runtime. Say class A implements methods A.fooBar(int) and A.fooBar(char), and there is a call to a.fooBar(x) in your program. At runtime both a and x are examined and the actual method to call is determined based on the type of x



# POP Oriented View Cell Registration

## Protocol Oriented Programming
https://realm.io/news/appbuilders-natasha-muraschev-practical-protocol-oriented-programming/


## iOS Cell Registration & Reusing with Swift Protocol Extensions and Generics


https://gist.github.com/gonzalezreal/92507b53d2b1e267d49a


## Protocol Oriented TablewView and CollectionView in Swift

http://basememara.com/protocol-oriented-tableview-collectionview/

## Protocol Oriented Segue

https://gist.github.com/msewell/5e185518a553b7ba9743451b5b817b31
https://www.natashatherobot.com/protocol-oriented-segue-identifiers-swift/





# Reuseable UITableViewDataSource

# A reusable UITableViewDataSource in Swift

https://medium.cobeisfresh.com/a-reusable-uitableviewdatasource-in-swift-e74d76bdda5f#.7yigp9s06


## The Data

```swift
enum SettingType {
  case Switch(text: String) //on-off
  case Segue(text: String) //navigate to a sub-section
  case Info(text: String, detail: String) //e.g. usage stats

  var identifier: String {
    switch self {
      case .Info: return "infoCell"
      case .Segue: return "segueCell"
      case .Switch: return "switchCell"
    }
  }
}
```

```swift
struct SettingsSection {
  var title: String?
  var cellData: [SettingType]

  init(title: String?, cellData: [SettingType]) {
    self.title = title
    self.cellData = cellData
  }
}
```

## SettingsTableViewDataSource

```swift
class SettingsTableViewDataSource: NSObject, UITableViewDataSource {

  var sections: [SettingsSection]

  init(sections: [SettingsSection]) {
    self.sections = sections
  }

  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return sections.count
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sections[section].cellData.count
  }

  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return sections[section].title


  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
  let setting: SettingType = sections[indexPath.section].cellData[indexPath.row]

  if let cell = tableView.dequeueReusableCellWithIdentifier(setting.identifier)  {
    switch setting {
    case .Switch(text: let text):
       cell.textLabel?.text = text
       cell.accessoryType = .DetailButton
       cell.accessoryView = UISwitch()
    case .Segue(text: let text):
       cell.textLabel?.text = text
       cell.accessoryType = .DisclosureIndicator
    case .Info(text: let text, detail: let detailText):
       cell.textLabel?.text = text
       cell.detailTextLabel?.text = detailText
    }
    return cell
  } else {
    fatalError("Unknown identifier")
  }
}

}
```



# Test Driven Development


## Unit Testing in Swift — Part 1: The Philosophy
 https://medium.cobeisfresh.com/unit-testing-in-swift-part-1-the-philosophy-9bc85ed5001b#.o6ex87nvk


## Unit Testing iOS in Swift — Part 2: A Testable Architecture
https://medium.cobeisfresh.com/unit-testing-ios-in-swift-part-2-a-testable-architecture-9048aca52e0a#.rc7nwl8oh




# Type Safe View
# Composable, type-safe UIView styling with Swift functions

https://medium.cobeisfresh.com/composable-type-safe-uiview-styling-with-swift-functions-8be417da947f#.9vz1pont6


 easy to create, change and maintain.

  all be declared in a single place,

  no repeated code.


  ```swift
  typealias UIViewStyle<T: UIView> = (T)-> Void
  ```


  ```swift
  let smallLabelStyle: UIViewStyle<UILabel> = { label in
  label.font = label.font.withSize(12)
}
```


```swift
let smallLabelStyle: UIViewStyle<UILabel> = { label in
  label.font = label.font.withSize(12)
}
let lightLabelStyle: UIViewStyle<UILabel> = { label in
  label.textColor = .lightGray
}
let captionLabelStyle: UIViewStyle<UILabel> = { label in
  smallLabelStyle(label)
  lightLabelStyle(label)
}
```



# Let's Play: Refactor the Mega Controller
https://realm.io/news/andy-matuschak-refactor-mega-controller/

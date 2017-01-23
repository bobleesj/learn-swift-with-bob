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














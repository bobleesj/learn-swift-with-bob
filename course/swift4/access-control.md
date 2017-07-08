# Access Control

## Problem
I don't want you to use my code.

`open`, `public`, `internal`, `file-private`, `private`, who are they?

### Understanding Module
Even UIKit is considered as one module. For example, when you try to interact with UIComponents such as UITableView, UIButton, UIViewController, and so on, you have to import the UIKit library/module on the top.

```swift
import UIKit
class BobController: UIViewController {}
```

```swift
import RandomLibraryFromGithub
```

> **Definition:** A module is a single unit of code distribution — a framework or application that is built and shipped as a single unit and that can be imported by another module with Swift’s import keyword.

### Summary of Access Control (low to high)
| Control | Purpose | Example |
| --- | --- | --- |
| Open | Available every where, override possible | `UICollectionView`, `UIViewController` |
| Public | Available every where, override not possible | `UICollectionViewDelegate` |
| Internal | Only available within the module | Everything you define by default |
| File-Private | Only available within the  file | items in `fileOne.swift` not available in `fileTwo.swift` |
| Private | Only available within the scope | `private` initialization in the singleton pattern |

### Private Set
```swift
private(set) var count: Int
```


### New in Swift 4



### Resources
## Conclusion

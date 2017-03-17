# Why you shouldn’t use delegates in Swift
The delegate pattern is okay. But there’s a better way.

By [Marin Benčević]

[Marin Benčević]: https://medium.cobeisfresh.com/why-you-shouldn-t-use-delegates-in-swift-7ef808a7f16b#.vp9iy3edf



### Typical Network Delegate Pattern

Design Protocol

```swift
protocol NetworkServiceDelegate {
    func didCompleteRequest(result: String)
}
```

Design Delegate
```swift
class NetworkService {
    var delegate: NetworkServiceDelegate?

    func fetchDataFromUrl(url: String) {
        API.request(.GET, url) { result in
            delegate?.didCompleteRequest(result)
        }
    }
}
```

Design Receiver/Delegator

```swift
class MyViewController: UIViewController, NetworkServiceDelegate {

    let networkService = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.delegate = self
    }
    func didCompleteRequest(result: String) {
        print("I got \(result) from the server!")
    }
}
```


## Using callbacks for delegation
Callbacks are similar in function to the delegate pattern. They do the same thing: letting other objects know when something happened, and passing data around.


instead of passing a reference to yourself, you are passing a function. Functions are first class citizens in Swift, so there’s no reason why you wouldn’t have a property that is a function!

```swift
class MyClass {
  var myFunction: (String)->() = { text in
    print(text)
  }
}
```



```swift

class NetworkService {

    var onComplete: ((result: String)->())? //an optional function

    func fetchDataFromUrl(url: String) {
        API.request(.GET, url) { result in
            onComplete?(result: result)
//                    ^ optional unwrapping for functions!
        }
    }
}
class MyViewController: UIViewController {

    let networkService = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.onComplete = { result in
            print("I got \(result) from the server!")
        }
    }
}

```


Another great way to use callbacks is when you want to get notified data has been changed. You can do this by calling the callback in a property observer:

```swift

var onUsernamesChanged: ([String]->())?

var loadedUsernames = [String]() {
    didSet {
        onUsernamesChanged?(loadedUsernames)
    }
}

```

## Why Use Callback vs Delegate?

 1. Decoupling: You must conform to protocol
 2. Multiple Delegation: What if you want to notify a ViewController when a request finishes, but maybe also a some sort of logger class, and some sort of analytics class.
With delegates, you would have to have an array of delegates, or three different delegate properties that might even have different protocols! (I’ll be the first to admit I’ve done this)
 3. Clearer separation of concerns
The way I see the difference between delegates and callbacks is that with delegates, the NetworkService is telling the delegate “Hey, I’ve changed.” With callbacks, the delegate is observing the NetworkService.
 4.


 My simple rule: if something requires one function as it's interface, a callback is usually a good solution. If more than one function is required, especially when they're required for the basic function of an object, a Delegate is probably a better solution.

 As always it depends on the specific situation, but absolute statements rarely work out in real-world usage.


Closures (blocks, callbacks, etc.) are good for when we want zero objects tied to waiting on the result. We just pass the closure and forget about it. 0 objects.

NSNotificationCenter is a good approach when we want any number of unknown objects to be able to respond to the result. The thing working on producing the result knows nothing about these objects, it just creates a notification when it's complete. 0-many objects.

The delegate pattern is good when we want exactly one object to respond to the result. Using the delegate pattern, the delegate and the worker object know quite a bit about each other. The worker object will define a protocol of set methods that its delegate must implement or can optionally implement, and the worker object can call any of these. 1 object.

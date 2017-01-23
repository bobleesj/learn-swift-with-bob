## Reference
[Frenchkit 2016 - Reactive Programming with RxSwift with FLORENT PILLET](https://www.youtube.com/watch?v=uBKofrA8ok0&t=859s)
[Marble Diagrams](rxmarbles.com)

# Functional Programming with RXSwift
Rx is all about anynchronous observable sequences. 

```swift
                                                                         
let urlString = "..."
NSURLSession.sharedSession()
 .rx_JSON(urlRequest)
 .map { 
  let root = $0 as! [String: Anyobject]
  let main = root["main"] as! [String: AnyObject]
  return main["temp"] as! Float
  
```

### Observable Sequence Lifecycle
```swift
let disposable = someObservable.subscribe (
 onNext: { print("value: \($0) },
 onError: { print("Error occured },
 onCompleted: { print("Completed") },
 onDisposed: { print("Disposed") }
)
 ```
 
If you'd like to dispose, 
 ```swift
  disposable.dispose()
 ```
 
RxCocoa provides extension to UIKits
 ```swift
 
import RxCocoa

let disposable = NSNotificationCenter.defaultCenter()
 .rx_notification(UIApplicationSignificantTimeChangeNotification)
 .subscribe {
  (notification: UINotification) in 
   print("Date Changed: time to update!")
 
 }

 ```
 
Another Example
```swift

import RxCocoa

@IBOutlet var textField: UITextField!

override func viewDidLoad() {
 super.viewDidLoad()
 let _ = textField.rx_text.subscribeNext {
  (text: String) in 
   print("text field changed to \(text)")
 }
}

```


Observables like like arrays 

```swift


```

Observerable Stream is like observe many things. During the stream, there are three things
 * onNext
 * onCompleted
 * onError 
 
 Observable sends data to the human
 
 ```swift
Observable.create<String>{ observer in 
 observer.onNext("1")
 observer.onNext("2")
 observer.onNext("3")
 observer.onCompleted()
}
.subscribe {
 print($0)
}
 ```
 
 ```swift
 ["1", "2", "3", "4", "5"].toObservable()
  .distinctUntilChanged()
  .subscribe { (event) in 
   print(event)
  }
  .addDisposableTo(disposeBag)
 
 ```
 
 

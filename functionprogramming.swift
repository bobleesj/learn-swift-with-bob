## Reference
[Frenchkit 2016 - Reactive Programming with RxSwift with FLORENT PILLET](https://www.youtube.com/watch?v=uBKofrA8ok0&t=859s)

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

### What did we just see?

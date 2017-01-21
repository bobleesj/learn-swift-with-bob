# Pass Data with NSNotification between ViewControllers in Swift 3
![An image of three phones aligned to each other](https://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2017/01/1484869328NS-Notification-Cover-Photo.png)

2017 is coming, and Christmas is coming and most of my friends are taking final exams and I’m writing Swift articles. Just random thoughts before I start grinding.

Now, let’s talk about how and why we use `NSNotification` to pass data and communicate/notify between classes and structs. By the way, `NSNotification`, unlike its name, has nothing to do with Push Notification — rookie mistake 101 (me).

Yes, there are many ways to pass data in Swift: `Delegate`, `Key-Value Observing`,  `Segue`,  and `NSNotification`, `Target-Action`, `Callbacks`. However, each one has its own pros and cons. They are like dining utensils. For example, I wouldn’t use chopsticks — although it’s pretty darn good — to eat soup.

Since there are many, I’m only going to cover one at a time, and I will going to mention why you should spoons instead of chopsticks along the way. It doesn’t make sense to tell the differences between chopsticks and knives before I have used both.

##What I think you will learn
In this tutorial, you will learn 2 things. First, you will understand how to “notify” other view controllers or even pass from a single view controller. Second, you will grasp the power of `NSNotification` and its weaknesses.

###UI Component
There are two view-controllers. `FirstVC` and `SecondVC`. I assume you already know how to embed `UINavigationController` and connect `IBOutlets` and `IBActions` and so on.

`SecondVC` will notify `FirstVC`. When I say “notify”, it’s like poking. It’s not sending any data, but certainly, we can. I will explain how to send data a bit later in this article. The example below is analogous to a user making a profile update on Facebook or Instagram. I’m not using `UITableView` since that would be overkill for explaining the concept.

![enter image description here](https://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2017/01/1484869331StroyBoard-.png)

Before we jump in, let’s picture how we would implement this at an extremely high level. Imagine two viewcontrollers are like a beautiful couple. They both have smartphones (NSNotification Objects) to talk to each other. Second, each smartphone has two features: **receiving and sending data**. Lastly, to locate each other’s device, they have a **common secret key**. However, it’s up to each other whether one wants to pick up the call or simply ignore.

Since we have a general understanding how they communicate with each other, let’s dive into Swift ☝️

First, we are going to store the secret key. You can make a separate Swift file or just create one outside of any view-controller like this.

```swift
import UIKit
let myNotificationKey = "com.bobthedeveloper.notificationKey"
class SecondVC: UIViewController {}
```

`myNotificationKey` will be used to connect those smartphones together. Of course, just like some other couples, you can have more than one key for whatever purposes. 🙃

Now, it’s time attach a smartphone. Let’s call this an observer. The observer will have four parameters. It will ask `Observer` which will be `self` since you are attaching the smartphone to `SecondVC`. Second, `Selector`, which is a function that runs when you notify. Third, name which refers to the secret code. Lastly, `object` which I will explain later when dealing with FirstVC. Just put `nil` for now.

```swift
class SecondVC: UIViewController {
  @IBOutlet weak var secondVCLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    NotificationCenter.default.addObserver(self, 
                                           selector: #selector(doThisWhenNotify), 
                                           name: NSNotification.Name(rawValue: myNotificationKey), 
                                           object: nil)
  }
  
  func doThisWhenNotify() { print("I've sent a spark!") }
}
```

*I don’t get the meaning of the `default` type property because there is no description in the API guideline. It says,*

>“No overview available” — [Apple](https://developer.apple.com/reference/foundation/nsnotificationcenter/1855943-defaultcenter?language=objc)

Anyway, `SecondVC` has a smartphone/observer, it’s time to send/notify when the button is tapped

```swift
@IBAction func tabToNotifyBack(_ sender: UIButton) {
  NotificationCenter.default.post(name: Notification.Name(rawValue: myNotificationKey), object: self)
  
  secondVCLabel.text = "Notification Completed!😜"
}
```

In this context,  `object` refers to the sender. Since `SecondVC` is notifying itself, it’s `self`.

Since `FirstVC` hasn’t registered an observer yet, the spark/poking will not affect it. I mentioned earlier, the partner has the right to pick up the phone or just ignore. In iOS, we called this “loose coupling”. There is no crazy binding shit going on unlike sending data between view controllers using delegate/protocol. I know some of you guys are confused. I plan to write an article on how to pass data using delegate in the future. Also, I will discuss `delegate vs NSNotification`

**Resource**
Pass Data between ViewControllers in Swift 3 without Segue ([YouTube](https://www.youtube.com/watch?v=jy_fHmuJIJg))

## Time to Receive
`FirstVC` is rather simple. It will add a smartphone and listen to the spark if it has the same secret key.

```swift 
import UIKit

 class FirstVC: UIViewController {
   @IBOutlet weak var FirstVCLabel: UILabel!
   
   override func viewDidLoad() {
     super.viewDidLoad()
     NotificationCenter.default.addObserver(self, 
                                            selector: #selector(doSomethingAfterNotified),
                                            name: NSNotification.Name(rawValue: myNotificationKey), 
                                            object: nil) }
   
   func doSomethingAfterNotified() {
     print("I've been notified")
     FirstVCLabel.text = "Damn, I feel your spark"
   } 
}
```
Now, let’s talk about `object` which is one of the parameters I skipped previously. If it is nil, you don’t care which/where smartphone is sending the data from as long as you have the secret key. I’ve never used anything 
besides `nil` so maybe for those who’ve used it before can help me out. *In other words, I don’t know how to implement* 


Now, it should look something like this. 

<p align="center">
  <img src="https://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2017/01/1484869321Notification-Storyboard-in-Gif.gif">
</p>


By the way, imagine SecondVC is like Facebook live. As long as there are many other view-controllers that contain observers which listen to the secret key, it can notify a lot of people. However, it is done **synchronously**. For those who don’t understand what it means, the task happens one at a time while blocking any other activities until the task is done. So, it will slow down devices if there are too many view-controllers. (not sure how many is too many).

**Source Code**
[Github](https://github.com/bobleesj/Blog_NSNotification_Send_Spark)

##Passing Data
Now you’ve learned how to *notify*. Let’s quickly learn how to send data while notifying. This is legit. This is where the real magic happens.

In SecondVC, instead of using the good old way,

```swift 
// Pass Spark
NotificationCenter.default.post(name: NSNotification.Name(rawValue: myNotificationKey), object: nil)
```

Now, you can send a spark that contains a dictionary

```swift
// Pass Data
NotificationCenter.default.post(name: NSNotification.Name(rawValue: myNotificationKey), object: nil, userInfo: ["name":"Bob"])
```
In the `FirstVC`, under `viewDidLoad`, you will insert this instead

```swift
NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: myNotificationKey), 
                                       object: nil, 
                                       queue: nil, 
                                       using:catchNotification)
```

I’m not going to talk about `queue`. If you put `nil`, the receiving task happens synchronously. In other words, if it’s not `nil`, `FirstVC` can receive data using `Grand Central Dispatch`. If you don’t understand GCD, don’t worry. I wrote two articles for you. Maybe I should write on how to pass data asynchronously using GCD! That would be interesting.

**Resources**
Intro to Grand Central Dispatch in Swift 3 ([Medium](https://medium.com/ios-geek-community/intro-to-grand-central-dispatch-in-swift-3-with-bob-lee-1d4b56f731b3#.m8s1uisl5))

UI & Networking like a Boss in Swift 3 ([Medium](https://medium.com/@pratik6554))

You’ve noticed something different. That’s right `catchNotification` This function will consume the spark which contains `userInfo!` `catchNotification` looks something like

```swift
func catchNotification(notification:Notification) -> Void {
  guard let name = notification.userInfo!["name"] else { return }
 
  FirstVCLabel.text = "My name, \(name) has been passed! 😄"
}
```

As soon as the button from `SecondVC` is pressed, `catchNotification` runs automatically and contains `userInfo` passed from `SecondVC`. If you don’t understand how to unwrap optionals using the guard statement, feel free to check my video below.

**Resource**
Guard Statement ([YouTube](https://www.youtube.com/watch?v=oeUYGNLqqqg))

So, finally it should look something like this

<p align="center">
  <img src="https://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2017/01/1484870950NSNotification-Pass-Data.gif">
</p>

**Resource**
[Source Code](https://github.com/bobleesj/Blog_NSNotification_Send_Data_ViewControllers)

## Remove Observer/Smartphone
If you want to remove any observer when the view has been dismissed, just insert the code below in `FirstVC` or any other view controllers.

```Swift
override func viewDidDisappear(_ animated: Bool) {
  super.viewDidDisappear(true)
  NotificationCenter.default.removeObserver(self)
}
```

## Last Remarks
This article took a bit longer than I had expected. But, it feels so good to write and engage with a lot of people. Thank you everyone for coming all the way to the bottom. Much appreciated. 👍 To be honest, I’m not that good with NSNotification. You can share your knowledge with everyone.

<p align="center">
  <em>Recommended Articles</em>:<br><br>
  <a href="#">Feel free to check out recommended articles:</a> <br><br>
  <a href="#">Top 10 Ground Rules for iOS Developers</a> <br><br>
  <a href="#">Intro to Grand Dispatch Central with Bob</a> <br><br>
 
</p>

# View Controller Programming Guide for iOS


## The Role of View Controllers
<img src=/Content/01_Swift_3/resources/View_Controller_Images.png/ alt="Relationship between a view controller and its views" width=600px>

> It is common practice to use outlets to access other views in your view controller’s view hierarchy. Because a view controller manages the content of all its views, outlets let you store references to the views that you need. The outlets themselves are connected to the actual view objects automatically when the views are loaded from the storyboard.

### User Interactions
View controllers are responder objects and are capable of handling events that come down the responder chain. However, view controllers rarely handle touch events directly. Instead, views usually handle their own touch events and report the results to a method of an associated delegate or target object.

Most events in a view controllers are handled using delegate or action methods.


### Resource Management
A view controller assumes responsibility for its views and objects. For example, The `UIViewController` class can get rid of views and UIKit objects. When the available space is low, UIKit asks apps to free up any resources by calling `didReceiveMemoryWarning`.

## The View Controller Hierarchy

### The Root View Controller
Every window has exactly one root view controller. `UIWindow` has no visible content of its own. When you use storyboards to configure your view controllers, UIKit sets the value of that property automatically  at launch time. For windows you create programmatically, you must set the root view controller yourself.

<img src=/Content/01_Swift_3/resources/The_root_view_controller.png/ alt="The root view controller" width=600px>


### Container View Controllers
A container view controller is able to keep more than one `UIViewController` objects into an array. Examples are `UINavigationController`, `UISplitViewController`, and `UIPageViewController`

<img src=/Content/01_Swift_3/resources/Container_Viewcontroller.png/ alt="Relationship between a view controller and its views" width=600px>

### Design Tips
Before you decide to create your custom view controllers, check whether the system has already provided some. It not only saves time but also provides a consistent experience for the user.

`UIImagePickerController`, taking videos and photos, alerts, managing files on iCloud, Address Book, MediaPlayer, EventKit, Message UI, AVFoundation.

### Handling User Interactions
 - View controllers define action methods for handling higher-level events such as Gesture recognizers
 - View controllers observe notifications sent by the system or other objects
 - View controllers act as a data source or delegate for another object.

 ### Displaying Your Views at Runtime with Storyboards
  1. Instantiates views using the information in your storyboard file
  2. Connects all outlets and actions
  3. Assigns the root view to the view controller's view property
  4. Calls the view controller's `awakeFromNib` method
  5. Call the view controller's `viewDidLoad` method.


## Implementing a Container View Controller
Container view controllers are a way to combine the content from multiple view controllers into a single user interface.
an

### Navigation View Controller
<img src=/Content/01_Swift_3/resources/Navigation_Controller.png/>

### Split View Controller
<img src=/Content/01_Swift_3/resources/Split_Viewcontroller.png/>

### Adding  Child View Controller to Content View Controller
 1. Call the `addChildViewController:` method of your container view controller. This method tells UIKit that your container view controller is managing the view of the child view controller.
 2. Add the child's root view to your container's view hierarchy
 3. Add any constraints for managing the size and position of the child's root view
 4. Call the `didMoveToParentViewController:` method of the child view controller

 ```swift
 func displayContentController(_ content: UIViewController) {
    self.addChildViewController(content)
    content.view.frame = self.frameForContentController()
    self.view.addSubview(self.currentClientView)
    content.didMove(toParentViewController: self)
}
 ```

### Removing a Child View Controller
 1. Call the child’s willMoveToParentViewController: method with the value nil.
 2. Remove any constraints that you configured with the child’s root view.
 3. Remove the child’s root view from your container’s view hierarchy.
 4. Call the child’s removeFromParentViewController method to finalize the end of the parent-child relationship.

```swift
func hideContentController(_ content: UIViewController) {
    content.willMove(toParentViewController: nil)
    content.view.removeFromSuperview()
    content.removeFromParent()
}
```

#### Transitioning Between Child View Controllers
```swift
func cycle(from oldVC: UIViewController, to newVC: UIViewController) {

    // Prepare the two view controllers for the change.
    oldVC.willMove(toParentViewController: nil)
    self.addChildViewController(newVC)

    // Get the start frame of the new view controller and the end frame
    // for the old view controller. Both rectangles are offscreen.
    newVC.view.frame = self.newViewStartFrame()
    var endFrame: CGRect = self.oldViewEndFrame()
    // Queue up the transition animation.
    self.transition(from: oldVC, to: newVC, duration: 0.25, options: [], animations: {() -> Void in
        // Animate the views to their final positions.
        newVC.view.frame = oldVC.view.frame
        oldVC.view.frame = endFrame
    }, completion: {(_ finished: Bool) -> Void in
        // Remove the old view controller and send the final
        // notification to the new view controller.
```


[Reference](https://developer.apple.com/library/content/featuredarticles/ViewControllerPGforiPhoneOS/ImplementingaContainerViewController.html#//apple_ref/doc/uid/TP40007457-CH11-SW1)

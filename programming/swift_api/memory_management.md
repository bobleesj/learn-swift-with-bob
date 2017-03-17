


## Make Memory Management Great Again

Swift 3 Automatic Reference Counting explained with ease for complete beginners without CS/CE degree

[Full Tutorial](https://medium.com/ios-geek-community/make-memory-management-great-again-f781fb29cea1)

## Weak vs Strong in Storyboard

> Outlets should generally be weak, except for those from File’s Owner to top-level objects in a nib file (or, in iOS, a storyboard scene) which should be strong. Outlets that you create should therefore typically be weak, because:

 - Outlets that you create to subviews of a view controller’s view or a window controller’s window, for example, are arbitrary references between objects that do not imply ownership.
 - The strong outlets are frequently specified by framework classes (for example, UIViewController’s view outlet, or NSWindowController’s window outlet).



[Resources Programming Guide]


[Resources Programming Guide]: https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/LoadingResources/CocoaNibs/CocoaNibs.html

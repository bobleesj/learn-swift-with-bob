# Delegate Retention Cycle
## Introduction
Welcome to Lesson 2 of Swift Memory Management. You will discover a potential retain cycle that might occur while using the delegate pattern.

## Problem
Why delegate should be `weak var`

## Design Delegate Pattern
Let us create a classic structure: the protocol, the delegator, and the delegate.

### Design Protocol

```swift
protocol SendDataDelegate {}
```

### Design Sender/Delegator

```swift
class SendingVC {
  var delegate: SendDataDelegate?

  deinit {
    print("Delegator gone")
  }
}
```

### Design Receiver/Delegate

```swift
class ReceivingVC: SendDataDelegate {
  lazy var sendingVC: SendingVC = {
    let vc = SendingVC()
    vc.delegate = self
    return vc
  }()

  deinit {
    print("Delegate gone")
  }
}
```

> **Important:** The closure init method is used with the `lazy` keyword from [3003_lazy_init_closures](/course/functional-swift/lazy-init-closures.md). You may not interact with `self` while creating a brand new property since it is not initialized. However, `lazy` allows since the property is initialized only after `self` has been created.


## Create Instances
```swift
var receivingVC: ReceivingVC? = ReceivingVC()
receivingVC?.sendingVC // lazy born
```

Let us visualize the relationship.

<img src="/course/memory-management/assets/21_retention_cycle_in_delegate.png" title="" />

There is a retain cycle. Even if you set `recevingVC` as `nil`, there is a reference count for both `ReceivingVC` and `SendingVC` from each other.

```swift
receivingVC = nil
// not deallocated
```

## Deallocate
Make one of the relationships/references as `weak`.

```swift
class SendingVC {
  weak var delegate: SendDataDelegate?
  ...
}
```

However, as soon as you work with `weak` which only applies to reference types, the compiler forces you to indicate the protocol as a different animal

```swift
protocol SendDataDelegate: class  {}
```

Let us visualize the relationship.

<img src="/course/memory-management/assets/22_prevemt_retention_cycle_weak_var.png" title="" />

Let us deallocate

```swift
receivingVC = nil
// "Delegate gone"
```

<img src="/course/memory-management/assets/23_deallocate_delegate.png" title="" />

Notice that the `SendingVC` object also has been deallocated since it no longer has a reference from the `ReceivingVC` object.


### Rules
 - A `weak` reference allows the referencing object to becoming `nil` (this happens automatically when the referenced object is deallocated)
 - Based on the rule above, the referencing object/variable must be `optional`

### Source Code
[5002_delegate_retention_cycle.playground](https://www.dropbox.com/sh/g2qi1hqrl0deevp/AADBpG8VWQkRdLd7-2REuHuTa?dl=0)

## Conclusion
You've learned how to spot a retain cycle within the delegate pattern. You may wonder which variable should be set as `weak`. The #1 rule is, a `weak` property has a reference to a class object which more likely to stays longer, and eventually has greater importance. For example, if the `SendingVC` object has a weak reference from the `recevingVC` property, the object will be deallocated immediately since the reference count is zero.

In the following lesson, you will discover the pitfall of using closures due to the unique behavior you've learned in Chapter 3, [3004_capture_lists](course/functional-swift/capture-lists.md)

> **Note:** Learn Swift with Bob is available on [Udemy](https://udemy.com/learn-swift-with-bob/). If you wish to receive a discount link, you may sign up [here](https://goo.gl/RR4K27).

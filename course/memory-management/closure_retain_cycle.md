# Closure Retention Cycle

## Introduction
Welcome to Lesson 3 of Swift Memory Management. In Intro to Functional Swift, you've discovered the unique behavior of closures, and soon noticed that they are reference types like classes. From the previous lesson, however, you must be careful using references due to retain cycle.

## Problem
1. How to use `capture lists` to prevent retain cycle in closures
2. When to use `unowned`

## Design Class
First, create a called, `BobClass`. It has two properties, `bobClosure` and `name` whose types are `(() -> ())?` and `String`.


```swift
class BobClass {
  var bobClosure: (() -> ())?
  var name: String = "Bob"

  init() {
    bobClosure = { print("Bob the Developer") }
  }

  deinit {
    print("Bobclass gone")
  }
}
```

Let us call the closure.

```swift
var bobClass: BobClass? = BobClass()
bobClass?.bobClosure!()
// "Bob the Developer"
```


Let us visualize the relationship.

<img src="/course/memory-management/assets/31_no_retention_cycle_closure.jpg" title="" />


The closure block is separate from the `BobClass` object.  The `bobClosure`property has a reference to the closure block.

Since the `BobClass` object as one reference from the `bobClass` property, you may deallocate the object.

```swift
bobClass = nil
// "Bobclass gone"
```

Let us visualize.

<img src="/course/memory-management/assets/32_deallocate_closure_object.jpg" title="" />

> **Important:** Notice the closure block has been also deallocated due to the reference count of zero.

## Retain Cycle
Let us create a reference from the closure block.

```swift
class BobClass {
  var bobClosure: (() -> ())?
  var name: String = "Bob"

  init() {
    bobClosure = { print("\(self.name) the Developer") }
  }

  deinit {
    print("Bobclass gone")
  }
}
```

> **Important:** The `self` refers to the object created by `BobClass`.

Now, let us deallocate.

```swift
bobClass = nil
// Not deallocated
```
Let us visualize the relationship to see the retain cycle.

<img src="/course/memory-management/assets/33_strong_retain_cycle_closure.jpg" title="" />

There is a retain cycle between the `BobClass` object and the closure block.

## Solution
There are two ways.

### Weak
The first way is to use a `weak` var. The closure should have a relationship as shown by the image below.

<img src="/course/memory-management/assets/34_use_capture_list_prevent_retention_cycle_var.jpg" title="" />

To achieve the result above, you must use `capture lists`. You will capture `self` as a `weak` reference.

```swift
class BobClass {
  var bobClosure: (() -> ())?
  var name: String = "Bob"

  init() {
    bobClosure = { [weak self] in
      guard let object = self else {
        return
      }

      print("\(object.name) the Developer")
    }
  }
}
```

However, the capture `self` within the closure has turned into an `optional` type. Let us review the rule of `weak`.

- A `weak` reference allows the referencing object to becoming `nil` (this happens automatically when the referenced object is deallocated)
- Based on the rule above, the referencing object/variable must be `optional`

### Unowned
You may capture `self`, as a non-optional type with `unowned`. Like `weak`, it does not increase the reference count.

```swift
class BobClass {
  var bobClosure: (() -> ())?
  var name: String = "Bob"

  init() {
    bobClosure = { [unowned self] in
      print("\(self.name) the Developer")
    }
  }
}
```

`unowned` states that the closure block must have a `non-nil` reference to the `BobClass` object. If the object is deallocated, it will cause a runtime error analogous to force-unwrapping `nil`.


<img src="/course/memory-management/assets/35_use_capture_list_prevent_retention_cycle_let.jpg" title="" />


## More Unowned
One example is not enough.


### Design Independent Class
Create a class called `Owner`. It contains a property whose type is `CreditCard?`.

```swift
class Owner {
  var creditCard: CreditCard?
  deinit { print("Owner gone") }
}
```

### Design Dependent Class
Create a class called `CreditCard`. It contains a non-optional property whose type is `Owner`.

```swift
class CreditCard {
  unowned let owner: Owner

  init(enterOwner: Owner) {
    owner = enterOwner
  }

  deinit { print("Card gone") }
}
```

## Create Instances
```swift
var bob: Owner? = Owner()
var myCard = CreditCard(enterOwner: bob!)
bob?.creditCard = myCard
```

Let us visualize.

<img src="/course/memory-management/assets/36_unowned_relationship.jpg" title="" />


Let us deallocate.

```swift
bob = nil
// "Owner Gone"
```

It works, since the `Owner` object has one reference from the `bob` property.

When `myCard` attempts to access its `unowned` property of `owner`, however, scary stuff happens.

```swift
myCard.owner // Run-time Error
```

Based on the definition of `unowned`, it must have a non-`nil` reference to the object. Since the `Owner` object has been deallocated, it crashes.


> If `self` will never be deallocated before the closure block, use `unowned`. If you try to access the value of an unowned reference after that instance has been deallocated, you’ll get a runtime error.

### Source Code
[5003_closure_retention_cycle.playground](https://www.dropbox.com/sh/qjxei16os00pqdh/AAD7SKIBxStQ4AzUwR6X0T4ba?dl=0)

### Resources
[Swift Retention Cycle in Closures and Delegate](https://blog.bobthedeveloper.io/swift-retention-cycle-in-closures-and-delegate-836c469ef128)

## Conclusion
Let us recap. Like classes, closures are reference types, so you must be aware of retain cycle. To prevent one, you use capture lists to set the reference from the closure to `self` as `weak` or `unowned`. Remember, when you set the reference as `weak`, the closure captures `self` as an optional type because the closure must be able to break the reference. If you use `unowned`, however, the object or variable must have a `non-nil` reference. The relationship can't be broken as you've seen in the Owner and Credit card example. You may use `unowned` if you are certain that the referenced object will not deallocated before the referencing object. If not, it will cause a run-time error.

In the following lesson, you will learn one of the dreaded topics in closures: `escaping` and `auotoclosures`. 

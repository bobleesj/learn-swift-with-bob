# Retain Cycle in Closures in Swift


## Weak vs Unowned
## Protocol and Delegate




## Closure Reference Cycle
You resolve a strong reference cycle between a closure and a class instance by defining a capture list as part of the closure's definition.

Each item in a capture list is a pairing of the `weak` or `unowned` keyword with a reference to a class instance (such as `self`).

```swift
lazy var someClosure: () -> String = {
    [unowned self, weak delegate = self.delegate!] in
    // closure body goes here
}
```

Define a capture in a closure as an unowned reference when the closure and the instance it captures will always refer to each other, and will always by deallocated at the same time.

Conversely, define a capture as a weak reference when the captured reference may become `nil` at some point in the future. Weak references are always of an optional type, and automatically become `nil`.

The capture of `self` by the closure is an unowned reference, and does not keep a strong hold on the `HTMLElement` instance has captured. If you set the strong reference from the `paragraph` variable to `nil`, the `HTMLElement` instance is deallocated.

# Generic Subscripts
Welcome to one of the least favored lessons of all time. Hopefully, this lesson is nice and short since I don't like using subscripts at all. Let's get started.

## Introduction

## Problem
Can subscripts return `T`?

### Your past
You remember in Chapter 1, this is probably how I introduced you to subscripts in Swift, whose role is to provide a shortcut.

```swift
struct WeekDays {
  private var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]

  subscript(index: Int) -> String {
    return days[index]
  }

}
```

Well, we can make it a little bit more complex and potentially more scalable.

### JSON
A `json` file looks like below.

```json
{
  "name": "Bob",
  "age": 21,
  "favoriteFood": ["Pizza", "Carbonara", "Hamburger"]
}
```

### Introducing Generic Subscripts
Let us create how to "design" a `json` like structure in Swift by using `Dictionary`.

```swift
struct JSON {
  private var storage: [String: Any]

  init(dictionary: [String: Any]) {
    self.storage = dictionary
  }
```

### Create JSON
```swift
let republicOfKorea = JSON(dictionary: [
  "capital": "Seoul",
  "name": "Republic of Korea",
  "population": 50000000
  ])
```

### Introducing Generic Subscripts
```swift
struct JSON {
  private var storage: [String: Any]

  init(dictionary: [String: Any]) {
    self.storage = dictionary
  }

  subscript<T>(key: String) -> T? {
    return storage[key] as? T
  }
}
```


### Access Value
Let us use the generic subscript method above.
```swift
let koreaCapital: String? = republicOfKorea["capital"]
let koreaName: String? = republicOfKorea["name"]
let koreaPopulation: Int? = republicOfKorea["population"]
```

Make sure you define `T?` from `any` explicitly as shown as `koreaCapital: String?`.

### My Opinion
I don't recommend using Subscripts even if it provides generics because there isn't much context available and it takes much effort to search through.

### Source Code
[9003_generic_subscripts]()

### Resources
[Generic Subscripts - Apple](https://github.com/apple/swift-evolution/blob/master/proposals/0148-generic-subscripts.md)

## Conclusion
Just to recap, in the very first chapter, you've learned that Swift provides a shortcut for accessing methods and properties. However, I warned you because that shortcut comes along with a big tradeoff. First, it is hard to found and second, it does not provide context unless the name of an object does. Also, even if you use generic subscripts, I don't like the fact that I have to explicitly define the placeholder type of `T`. It definitely can cause a huge issue for your teammates if they have not read or understand the object he/she is working with. So, I recommend not to use them. But, of course, if it is something quick and easy. feel free to.

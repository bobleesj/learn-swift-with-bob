# Generic Subscripts

## Introduction
## Problem
Can subscripts return `T`?

### Your past
```swift
struct WeekDays {
  private var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]

  subscript(index: Int) -> String {
    return days[index]
  }

}
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

### Create JSON
```swift
let republicOfKorea = JSON(dictionary: [
  "capital": "Seoul",
  "name": "Republic of Korea",
  "population": 50000000
  ])
```

### Access Value
```swift
let koreaCaital: String? = republicOfKorea["capital"]
let koreaName: String? = republicOfKorea["name"]
let koreaPopulation: Int? = republicOfKorea["population"]
```



### Source Code
### Resources

## Conclusion

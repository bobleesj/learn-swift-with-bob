# Advanced Dictionary
## Introduction
## Problem

```swift
let source = "how now brown cow"
var frequencies: [Character: Int] = [:]
for c in source {
  frequencies[c, default: 0] += 1
}
frequencies

let duplicates = [("a", 1), ("b", 2), ("a", 3), ("b", 4)]
let myLetter = Dictionary(duplicates, uniquingKeysWith: { (first, _) in first })
letters

print("Hello")
print(myLetter)


let defaults = ["foo": false, "bar": false, "baz": false]
var options = ["foo": true, "bar": false]
```


```swift
let 친구들 = ["찬호", "호이", "잭"]
let 친구들번호 = Dictionary(uniqueKeysWithValues: zip(1..., 친구들))
친구들[0]
친구들번호
```

```swift
let set: Set = [1,2,3,4,5]
let filteredSet = set.filter { $0 % 2 == 0 }
type(of: filteredSet)
let 내이름 = ["Cagney", "Lacey", "Bensen"]
let 사전 = Dictionary(uniqueKeysWithValues: zip(1..., names))
dict[2]


let filtered = dict.filter {
  $0.key % 2 == 0
}
type(of: filtered)

let mapped = dict.mapValues { value in
  value.uppercased()
}
```
### Map
```swift
// Grouping a sequence into a dictionary
let contacts = ["Julia", "Susan", "John", "Alice", "Alex"]
let grouped = Dictionary(grouping: contacts, by: { $0.first! })
grouped
```
## Conclusion

### Source Code
### Resources

# Generic Subscripts

## Introduction
## Problem

```swift
struct JSON {
  fileprivate var 스토리지: [String:Any]

  init(dictionary: [String:Any]) {
    self.스토리지 = dictionary
  }

  subscript<T>(key: String) -> T? {
    return 스토리지[key] as? T
  }
}
```


```swift
let 한국데이터 = JSON(dictionary: [
  "수도": "서울",
  "나라": "대한민국",
  "인구": 50,000,000
  ])

let 대한민국인구: struct JSON {
  fileprivate var 스토리지: [String:Any]

  init(dictionary: [String:Any]) {
    self.스토리지 = dictionary
  }

  subscript<T>(key: String) -> T? {
    return 스토리지[key] as? T
  }
}

let json = JSON(dictionary: [
  "수도": "서울",
  "나라": "대한민국",
  "인구": 50_000_000
  ])

// No need to use as? Int
let 대한민국인구: Int? = 한국데이터["인구"]
let 대한민국수도: String? = 한국데이터["수도"]
```


### Source Code
### Resources

## Conclusion

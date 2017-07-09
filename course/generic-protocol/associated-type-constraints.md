# Associated Type Constraints

## Introduction
## Problem

```swift
extension Sequence where Element: Numeric {
  var 합계: Element {
    var 결과: Element = 0
    for element in self {
      결과 += element
    }
    return 결과
  }
}

Array(1...10).합계
```



## Conclusion
### Resources
### Source Code

# Extra in Swift 4
## Introduction

## Problem
What are other useful updates?

```swift
let 시 = """가슴속에 하나 둘 색여지는 별을
이제 다 못헤는것은
쉬이 아침이 오는 까닭이오、
내일밤이 남은 까닭이오、
아직 나의 청춘이 다하지 않은 까닭입니다。
"""
```

```swift
var 👀 = "곁눈"
let 👩🏼‍🏫 = "귀여운 선생님"
```

### One-Sided Range

```swift
let 정수집합 = [1,2,3,4,5,6,7,8,9,10]
정수집합[8..<numbers.endIndex] // [8, 9, 10]
```

```swift
정수집합[8...] // [8, 9, 10]
```

```swift
let 정수 = 1

switch 정수 {
  case 1...:
  print("1 이상이군")
  case 0:
  print("0 이군")
  case ..<0:
  print("0 보다 작군")
  default:
  fatalError("엥, 숫자맞어?")
}
```


### Class and Protocol
```swift
protocol 오버워치하는 {}
protocol 수능공부하는 {}

class 엄마클라스: 오버워치하는 {}
class 동생클라스: 수능공부하는 {}

struct 가족 {
  let 엄마: 엄마클라스 & 오버워치하는
  let 여동생: 동생클라스 & 수능공부하는
}

let 밥동생 = 동생클라스()
let 밥엄마 = 엄마클라스()

가족(엄마: 밥엄마, 여동생: 밥동생)
```







### Source Code
### Resources
## Conclusion


// http://benscheirman.com/2017/06/ultimate-guide-to-json-parsing-with-swift-4/?utm_content=buffer69195&utm_medium=social&utm_source=facebook.com&utm_campaign=buffer

//: ### Element Associated Type
//: 스위프트가 프로토콜 지향개념을 이해하셔야지만 이해가 가능합니다. `Sequence`의 associated type 인 `Element`에  `extension`을 넣을 수 있습니다. 즉, 모든 프로토콜의 associated type에 constraint을 넣을 수 있습니다. 예전에는 사용했겠죠. `Iterator.Element`

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

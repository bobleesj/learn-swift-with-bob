/*:
 ## Learn Swift with Bob
 ### Swift 4
 ### Key Path
 
 **Problem:** What's functional?
 */


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

struct JSON {
  fileprivate var 스토리지: [String:Any]
  
  init(dictionary: [String:Any]) {
    self.스토리지 = dictionary
  }
  
  subscript<T>(key: String) -> T? {
    return 스토리지[key] as? T
  }
}

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


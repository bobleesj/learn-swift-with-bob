/*:
 ## Learn Swift with Bob
 ### Swift 4
 ### Key Path
 
 **Problem:** What's functional?
 */


// let 내이름 = 동물().유인원.인간.이름

struct 개발자 {
  var 개발플랫폼: 플랫폼
  var 개발자정보: 개인정보
}

enum 플랫폼 {
  case 아이오에스
  case 안드로이드
}

struct 개인정보 {
  var 이름, 장점, 입사동기: String
}

var 밥정보 = 개인정보(이름: "Bob", 장점: "무", 입사동기: "ㅋㅋ")
var 밥 = 개발자(개발플랫폼: .아이오에스, 개발자정보: 밥정보)
var Bob = 개발자(개발플랫폼: .아이오에스, 개발자정보: 밥정보)

밥.개인정보.이름 // "Bob"
Bob.개인정보.이름 // "Bob"

let 이름KeyPath = \개발자.개인정보.이름

밥[keyPath: 이름KeyPath] // "Bob"
Bob[keyPath: 이름KeyPath] // "Bob"

let 개인정보KeyPath = \개발자.개인정보
let 이름KeyPath = 개인정보KeyPath.appending(path: \.이름)

밥[keyPath: 이름KeyPath] // "Bob"

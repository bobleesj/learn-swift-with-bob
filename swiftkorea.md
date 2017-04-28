# Minimize Trackpad & Mouse Usage
기본적으로 arrow key대신 거리가 짧은 `ctrl-p-n-b-f` 사용하시는 것을 권장합니다. `delete`키 대신 `ctrl-h`. 영타는 표준으로 300타 이상 나오시기를 권장합니다. `cmd-left/right`대신 `ctrl-a`와 `ctrl-e` 사용하시길 바랍니다. 마지막으로 마우스를 만지면 그만큼 시간이 소비됩니다.

> **Note:** `enter`, `delete`, `arrow key` 최소화 하시길 바랍니다

## Source Code Inspection
오픈, Apple 소스 등등을  쉽게 찾아봅시다.

### Then 보기
| Mouse and Trackpad | Shortcuts |
| --- | --- |
| Use mouse to focus and type | Close the left panel using `cmd-0` or `cmd-j` to focus |
| Assistant 마우스로 클릭 | `cmd-shift-o`, Quick open 그리고 `opt-enter` |

### Then이 무엇인지 찾기
| Mouse and Trackpad | Shortcuts |
| --- | --- |
| `cmd-click` | `cmd-f`, `cmd-ctrl-j`또는  `cmd-ctrl-opt-j`사용 |

### UIViewController Method 보기
| Mouse and Trackpad | Shortcuts |
| --- | --- |
| `cmd-click` 그리고 마우스로 scroll | `ctrl-6` `fn-up/down` to scroll |
| 마우스로 그래그 | `ctrl-6`로 찾고 `ctrl-shift-left` |  

<br>

## Line Manipulation
흐름 끊기지 않으면서 코딩합시다.

### Then이름 바꾸기
| Mouse and Trackpad | Shortcuts |
| --- | --- |
| 일일이 클릭해서 지움 | `Select Word`를 key binding에 추가하고. 개인적으로 `ctrl-shift-w`로 지정 `cmd-ctrl-e`로 다같이 지움  |

### Folding 통해 지우기
| Mouse and Trackpad | Shortcuts |
| --- | --- |
| 드래그 하거나 `cmd-shift-up/down` | `cmd-l`로 라인 찾기 그리고 `cmd-ctrl-좌/우`로 folding 그리고 한 번에 지움 |

### Delete Line
| Mouse and Trackpad | Shortcuts |
| --- | --- |
| `cmd-left` 그리고 `cmd-delete` 사용 | `Delete Line`을 key bindings에 넣어줌. 개인적으로  `ctrl-shift-k` 사용 |


### 코딩하는 동한 라인움직이기
| Mouse and Trackpad | Shortcuts |
| --- | --- |
| move up an down to see but cursor also changes | `Scroll Line Down/Up`을  key bindings 에 추가. 개인적으로 `cmd-opt-ctrl-p/n`사용 |  

<br>
## API Help
닌자처럼 빠르게 정보를 캐어옵시다.

| Mouse and Trackpad | Shortcuts |
| --- | --- |
| `Help` 누른 다음 `Documentation and API Reference`  클릭  | `cmd-shift-0` |
| `option-click` | `cmd-ctrl-shift-?` |
| `cmd-shift-0`그리고 찾기 | `cmd-opt-ctrl-?` 로 바로 검색 |





<!-- <br>
## Presentation Script
Slide 1: 안녕하세요! 밥입니다. 오늘은 마우스와 트랙패드 사용을 줄이자에 대해서 발표해 보겠습니다.

Slide 2: 약 30초 동안 저의 대해 간단한 소개를 드리겠습니다. 저는 Bob the Developer라는 블로그를 작년 11월 달 부더 운영하고 있습니다. 운빨이 따라줘서 지금은 약 13,000명 follower와 매일 1000명에서 나타샤 같은 분들이 공유해주시면 3000명 정도 제 블로그에 와주시네요. 그리고 지금은 현제 유튜브나 인터넷 강의를 맏들고 있습니다. 하지만,

Slide 3: 앱 창업하다 망했구요, 미국대학 학비 제가 벌어서 다닐려고 휴학해서 이금 여기까지 왔네요. 저는 iOS 9부터 시작했구요, 여기 계신 분들은 다 저의 대선배 이십니다. 제가 이 자리에 서 있는 것도 참 우스꽝스럽구요 감사드리네요. 귀엽게 바주셨으면 합니다. 본문으로 가보곘습니다.

Slide 4: 일단 3가지 이유가 있습니다. 첫 번째는 예전에 제가 글을 썼는데 반응 좋았구요. 두 번째는 코딩과 합께 글을 쓸니 정말 1-2초가 아깝생각이 들었습니다. 그게보면 몇 달이 될 수 있구요 그래서 저는 Xcode그리고 아톰에 있는 단축기를 다 훝어봅니다.  마지막으로, 단축기를 쓰기 않으면 보이지 않는 육체적 그리고 정신적 고통이 동반합니다. 우리의 뇌는 근육과 같아서 불필요한 데에 힘을 쓰면 않좋겠죠.

Slide 5: ~~ 여기서 이런 것을 사용하시는, "귀엽군" 이렇게  넘어가주시면 감사하겠습니다.

Slide 6: 이런것들은 인터넷 치면 다 나오니까 안 하겠습니다.

Slide 7: 먼저 라이브 코딩에 앞서 기본을 먼저 피피티로 집고 넘어가보겠습니다. 다든 쓰실꺼라 믿습니다. 만약 새로우시면 이런게 있구나 나도 써야지라고 넘어가주시고 나중에 자료 참조하시면 좋을 것 같습니다.

Slide 8: 패널 - 왼쪽 오른쪽 아래

Slide 9: 파일 내비게이션이나 에러 찾을때 유용

Slide 10: 전 쓰기 않지만 스토리보드 attributes바꿀때 유용

Slide 11: Quick Open누구나 쓰실 것이라 생각합니다.

Slide 12: Assistant지만 이렇게만 쓰면 사실상 의미가 없습니다.

Slide 13: 크롬처럼 쓰실 수 잆구요. 느리시다면 않쓰시면 됩니다.

Slide 14: 자 이제. 떨리는 마음으로 Live시작해보겠습니다. 제가 톡을 준비하기 위해 구글의 있는 첫 검색 5페이지 다 검색해봤구요. Xocde다 keybinding 위에서 아래까지 나 훝어봤습니다.

Slide 15: 자신의 소스코드나 Apple소스 빠르게 정탐하기
Slide 16: 흐름이 끊기지 않고 뱌로 쓰기
Slide 17: 닌자가 첩자처럼 정보를 빨리 캐어오기 -->

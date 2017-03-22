> Will be translated to English soon - March 22, 2017 
# Coding Principles

## SOLID
A principle created by Robert Martin for Object Orietned Programming

S	SRP[4]
Single responsibility principle
a class should have only a single responsibility (i.e. only one potential change in the software's specification should be able to affect the specification of the class)
O	OCP[5]
Open/closed principle
“software entities … should be open for extension, but closed for modification.”
L	LSP[6]
Liskov substitution principle
“objects in a program should be replaceable with instances of their subtypes without altering the correctness of that program.” See also design by contract.
I	ISP[7]
Interface segregation principle
“many client-specific interfaces are better than one general-purpose interface.”[8]
D	DIP[9]
Dependency inversion principle
one should “depend upon abstractions, [not] concretions.”[8]
## Code Smell
Omen that causes bad future

응용 프로그램 수준의 스멜:

중복 코드
억지로 꾸민듯한 복잡성.
클래스 수준의 스멜:

커다란 클래스
기능에 대한 욕심
부적절한 관계
거부된 유산
게으른 클래스
리터럴의 과도한 사용
순환 복잡도
다운캐스팅
고아 변수 또는 컨스턴트 클래스
메서드 수준의 스멜:

너무 많은 매개변수
긴 메서드
과도하게 긴 식별자
과도하게 짧은 식별자
과도한 데이터의 반환



### Kiss
Keep it simple stupid
Less code takes less time to write, has less bugs, and is easier to modify. Simplicity is the ultimate sophistication. It seems that perfection is reached not when there is nothing left to add, but when there is nothing left to take away.

Avoid inheritance, polymorphism, dynamic binding and other complicated OOP concepts. Use delegation and simple if-constructs instead.
Avoid low-level optimization of algorithms especially when involving Assembler, bit-operations, and pointers. Slower implementations will work just fine.
Use simple brute-force solutions instead of complicated algorithms. Slower algorithms will work in the first place.
Avoid numerous classes and methods as well as large code blocks (see More Is More Complex)
For slightly unrelated but rather small pieces of functionality use private methods instead of an additional class.
Avoid general solutions needing parameterization. A specific solution will suffice.


### YAGNI
Avoid Creating a YAGNI (You aren’t going to need it) - You should try not to add functionality until you need it.

### Minimize Coupling
Any section of code (code block, function, class, etc) should minimize the dependencies on other areas of code. This is achieved by using shared variables as little as possible. “Low coupling is often a sign of a well-structured computer system and a good design, and when combined with high cohesion, supports the general goals of high readability and maintainability”

Eliminate, minimise, and reduce complexity of necessary relationships.
By hiding implementation details, coupling is reduced.
Apply the Law of Demeter.


## Hide Implementation Detail
Hiding implementation details allows change to the implementation of a code component while minimally affecting any other modules that use that component.
Hide Implementation Details
A software module hides information (i.e. implementation details) by providing an interface, and not leak any unnecessary information.

Why

When the implementation changes, the interface clients are using does not have to change.
How

Minimize accessibility of classes and members.
Don’t expose member data in public.
Avoid putting private implementation details into a class’s interface.
Decrease coupling to hide more implementation details.


## Boy-Scout Rule
The Boy Scouts of America have a simple rule that we can apply to our profession: “Leave the campground cleaner than you found it”. The boy-scout rule states that we should always leave the code cleaner than we found it.

Why

When making changes to an existing codebase the code quality tends to degrade, accumulating technical debt. Following the boyscout rule, we should mind the quality with each commit. Technical debt is resisted by continuous refactoring, no matter how small.
How

With each commit make sure it does not degrade the codebase quality.
Any time someone sees some code that isn’t as clear as it should be, they should take the opportunity to fix it right there and then.


- 새로운 코드 작성은 작은 생명체의 탄생이나 다름없다. 제품을 출시하기 전에, 해당 코드가 스프트웨어 사회에 유용하면서도 수익성 높은 구성원이 될 수 있도록 애정을 기울려 키워내야한다.
- 소프트웨어 시스템이 가능하는 한, 코드들은 유지 보수되어야 한다. 갈 줄의 코드마다 비용이 든다. 코드를 길게 많이 쓸수록 유지 보수 비용은 높아진다.
- 코드는 버그를 품고 있다. 코드가 많을수록 버그가 숨을 수 있는 공간도 많아진다.
- 리팩토링이라는 용어는 1990년대 들어 프로그래서 사전에 등장했다. ‘소프트웨어를 수정하는 특정한 방법’이라고 설명되어 있는데, 리팩토링은 코드 가독성을 높이고, 내부 구조를 향상하며, 유지 보수를 원활이 하기 위한 것이다. 무엇보다도, 나중에 있을 기능 형상에 대비하려는 것이다
- 모든 변수를 맨 상단에 놓고 나중에 가져다 쓰는 방식의 C 어ㅗㄴ어 스타일은 이제 시대에 뒤처졌다. ]
- 소프트웨어 시스템은 마치 도시와 같다. 고속도로와 숙박업소, 뒷골목, 건물로 복잡하게 얽혀있는 덩어리나 다름없다. 바쁜 도시 안에서는 많은 일이 벌어진다. 어떤 건물은 크고 아름다운가 하면 어떤 건물은 낮고 기능적이다. 또 다른 건물은 낡아빠지고 망가져 있다.
- 대도시에서 가장 미묘하면서도 심각한 문제는 바로 복에였다. 명확한 설계나 기능이 필요한 위치에 대한 명확한 지침이 없다 보니, 코드베이스 저난에 걸쳐 마구잡이로 똑같은 기능이 거듭 구현되었다.
- 90/90법칙: 보통 개발 공정 중에 앞의 90%을 예상 일정 가운데 90%의 시간 동안 진행한다. 하지만, 남은 10%의 공정에 대해서는 앞의 90%의 공정을 완료하는 데 들인 것과 동일한 시간과 노력이 필요하다 - 톰 카길
- 브룩스 법칙: 지체되는 소프트웨어 개발 프로젝트에 인력을 더하는 것은 개발을 늦을 뿐이다.
- KISS: 간결한 고드는 설계하는 데 많은 노력이 필요한다. 다만 간결한 코드가 곧 과도하게 단순한 코드를 의미하지는 않는다.
- 가장 간결한 방법으로 작업하고 가장 간결한 코드를 작성해야 한다. 다만 지나치게 단순하면 실제 문제를 해결하지 못한다. ‘간결한’ 해결책은 ‘요구사항을 ‘충족’시켜야 하며, 그렇지 않으면 해결책이라 할 수 없다.

않좋은 코드 문제

- 낮은 품질의 비주기적인 제품 업데이트
- 유연하지 못한 시스템으로 어려워진 신구 기능 추가 및 변경
- 스트레스, 사기, 이직 등 사람의 문제
- 코드 작업에 필요한 엄청난 고뇌와 야근
- 그러므로 코드작성에 앞서 계획적으로 설계하기

질문들

- 외부에 노출하는 API는 깔끔하고 합리적인가?
- 자료형을 잘 고르고, 변수 명을 적절히 지었는가?
- 코드의 레이아웃을 일관성 있게 작성했는가?
- 특정 기능을 구현하는 코드 부분이 어디에 있는지 쉽게 찾을 수 있는가?
- 어쨰서 코드는 자주 똥 덩어리가 되는 것일까?
- 어떻게 하면 작업을 시작하는 단계부터 이런 일을 방지할 수 있을까?

오류 처리

- 불안정한 코드: 이러한 유형의 코드는 찾아내기 어려운 충돌로 가득 차 있다.
- 불안전한 코드: 크래서들은 소프트웨어 시스템을 파괴하기 위해 종종 오류 처리 과정의 취약점을 이용한다.

버그 대비책

- 버그가 생긴 뒤에 고치기보다는 처음부터 버그가 생기지 않도록 적극적으로 예방하는 편이 훨씬 낫다. 유비무환이다.
- 디버깅이 스프트웨어 버그를 없애는 과정이라면, 프로그래밍은 분명 버그를 만드는 과정이다 - 에르허르 데이크스타라, 컴퓨터 과학자

테스트

- 위대한 소프트웨어를 제대로 만들기 위해서는 피드백을 받아야 한다.
- 매뉴얼 테스트는 컴퓨터가 하게하게 하도록 해라

소프트웨어 개발 절차 중 많은 부분이 예술 작품을 창조하는 것과 유사한다

- 창조적: 상상력이 필요하다. 소프트웨어는 능숙하게 구축하고 정확하게 설계해야 한다. 프로그래머는 자신이 만들고자 하는 코드에 대한 비전, 그리고 만드는 방법에 대한 계획이 있어야 한다. 이는 때도는 엄청난 독창성을 필요로 한다
- 미학적: 좋은 코드의 특징은 우아함, 아름다움, 그리고 균형에서 찾을 수 있다. 이 말은 좋은 코드의 기준이 특정 문화적 관례의 프레임워크 안에 있음을 의미한다.
- 기계적 수동적: 예술가에 비유하자면, 지정된 매개물을 가지고 지정된 도구와 절차, 기법으로 작업하는 것이나 마찬가지 이다.
- 팀 기반: 수많은 형태의 예술은 한 사람이 아닌 여러 사람의 노고에서 비롯된 결고물이다. 에술 형식을 통틍어 예술가는 걸작을 완성할 때까지 밥낮으로 스튜디오에 노예처러 앉아 있지만은 않는다.

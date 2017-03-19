
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

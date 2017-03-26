> Currently Draft

# Coding Principles

## SOLID
> A principle created by Robert Martin for Object Oriented Programming

| Acronym | Name | Description | Example |
| --- | --- | --- | --- |
| SRP	| The Single Responsibility Principle | Every module or class should have responsibility over a single part of the functionality, and that responsibility should be entirely encapsulated by the class  | Do not create a singleton for networking of every view controller |
| LSP	| The Liskov Substitution Principle | Derived classes must be substitutable for their base classes. | You may create a button with `UIButton` or with your own subclassed button. The subclassed button may replace `UIButton`.
| ISP	| The Interface Segregation Principle | Clients should not be forced to implement interfaces they don't use. | When you use UITableView, although two methods are required, the rest are optional. |
| DIP	| The Dependency Inversion Principle | Depend on [abstractions](Content/others/software_engineering/coding_principles.md#abstraction), not on concretions. | We don't have to create the UIKit framework. |

### Abstraction {#abstraction}
The programmer works with an idealized interface and can add additional levels of functionality that would otherwise be too complex to handle. For example, a programmer writing code that involves numerical operations may not be interested in the way numbers are represented in the underlying hardware and its assembly language. In iOS Development, developers use frameworks created and encapsulated by Apple UIKit engineers.




## Code Smell
> Omen that causes bad future


### Universal Smell
- Needless complexity
- Duplication
- Overused typed literals

### Object Oriented Programming
 - "One does it all" Class
 - Too many variables
 - Long method
 -


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

### Law of Demeter
The Law of Demeter (LoD) or principle of least knowledge is a design guideline for developing software, particularly object-oriented programs. In its general form, the LoD is a specific case of loose coupling. The guideline was proposed by Ian Holland at Northeastern University towards the end of 1987, and can be succinctly summarized in each of the following ways:[1]

Each unit should have only limited knowledge about other units: only units "closely" related to the current unit.
Each unit should only talk to its friends; don't talk to strangers.
Only talk to your immediate friends.


### Minimize Coupling
Any section of code (code block, function, class, etc) should minimize the dependencies on other areas of code. This is achieved by using shared variables as little as possible. “Low coupling is often a sign of a well-structured computer system and a good design, and when combined with high cohesion, supports the general goals of high readability and maintainability”

Eliminate, minimise, and reduce complexity of necessary relationships.
By hiding implementation details, coupling is reduced.
Apply the Law of Demeter.

Each unit should have only limited knowledge about other units: only units "closely" related to the current unit



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

Writing code is similar to breeding living organisms. Before one releases, make sure the code provides value to the community. The code must be taken care of with love and constant attention.

Code contains bugs. More code means more bugs.

Software system is like a city. There are highways, buildings, and people. Some buildings are taller, some worn out.

> The Ninety-ninety rule: The first 90 percent of the code accounts for the first 90 percent of the development time. The remaining 10 percent of the code accounts for the other 90 percent of the development time. — Tom Cargill, Bell Labs


## Questions
- Does your exterior API look pretty and logical?
- Do the names of variables follow similar patterns

## Bug Prevention
 - Rather than fixing bugs, it's better to prevent one
 - If debugging is to get rid of bugs, programming must be producing bugs.


## Quotes from Edsger Dijkstra
 - Elegance is not a dispensable luxury but a factor that decides between success and failure
 - Aim for brevity while avoiding jardon
 - Object-oriented programming is an exceptionally bad idea which could only have originated in California

## Software development is similar to art
 - Creativity and Independent thinking
 - Beauty: balance,
 - Use tools
 - Team based .

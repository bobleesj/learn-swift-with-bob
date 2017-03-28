# Coding Principles

## SOLID
> A principle created by [Robert Martin] for Object Oriented Programming

[Robert Martin]: https://en.wikipedia.org/wiki/Robert_Cecil_Martin

| Acronym | Name | Description | Example |
| --- | --- | --- | --- |
| SRP	| The Single Responsibility Principle | Every module or class should have responsibility over a single part of the functionality, and that responsibility should be entirely encapsulated by the class  | Do not create a singleton for networking of every view controller |
| LSP	| The Liskov Substitution Principle | Derived classes must be substitutable for their base classes. | Subclassed`UIButton` may be used anywhere that requires `UIButton`. |
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
- Over usage of `var` instead of `let`

### Object Oriented Programming
 - "One does it all" Class
 - Long method

## KISS
> Keep it simple stupid

Less code takes less time to write, has less bugs, and is easier to modify. Simplicity is the ultimate sophistication. It seems that perfection is reached not when there is nothing left to add, but when there is nothing left to take away.

Avoid inheritance, polymorphism, dynamic binding and other complicated OOP concepts. Use delegation and simple if-constructs instead.

Use simple brute-force solutions first instead of complicated algorithms. Slower algorithms will work in the first place.

For slightly unrelated but rather small pieces of functionality use private methods instead of an additional class.


## YAGNI
Avoid Creating a YAGNI (You aren’t going to need it) - You should try not to add functionality until you need it.

## Law of Demeter
The Law of Demeter (LoD) or principle of least knowledge is a design guideline for developing software, particularly object-oriented programs.
 1. Each unit should have only limited knowledge about other units: only units "closely" related to the current unit.
 2. Each unit should only talk to its friends; don't talk to strangers. Only talk to your immediate friends.

### Elaboration
Any section of code (code block, function, class, etc) should minimize the dependencies on other areas of code. This is achieved by using shared variables as little as possible. Low coupling is often a sign of a well-structured computer system and a good design, and when combined with high cohesion, supports the general goals of high readability and maintainability.

Eliminate, minimize, and reduce complexity of necessary relationships.
By hiding implementation details, coupling is reduced.



## Hide Implementation Detail
Hiding implementation details allows change to the implementation of a code component while minimally affecting any other modules that use that component.

A software module hides information (i.e. implementation details) by providing an interface, and not leak any unnecessary information.

You may follow a couple principles:
  - Minimize accessibility of classes and members.
  - Don’t expose member data in public.
  - Avoid putting private implementation details into a class’s interface.
- Decrease coupling to hide more implementation details.


## Boy-Scout Rule
"Leave the campground cleaner than you found it”. The boy-scout rule states that we should always leave the code cleaner than we found it.

### Why
When making changes to an existing codebase the code quality tends to degrade, accumulating technical debt. Following the boyscout rule, we should mind the quality with each commit.

### How
With each commit make sure it does not degrade the codebase quality.
Any time someone sees some code that isn’t as clear as it should be, they should take the opportunity to fix it right there and then.

Writing code is similar to breeding living organisms. Before one releases, make sure the code provides value to the community. The code must be taken care of with love and constant attention.


## Patterns
 - The Ninety-ninety rule: The first 90 percent of the code accounts for the first 90 percent of the development time. The remaining 10 percent of the code accounts for the other 90 percent of the development time. — Tom Cargill, Bell Labs


## Bug Prevention
 - Rather than fixing bugs, it's better to prevent one
 - If debugging is to get rid of bugs, programming must be producing bugs.


## Quotes  
 - Elegance is not a dispensable luxury but a factor that decides between success and failure - Edsger Dijkstra
 - Aim for brevity while avoiding jardon
 - Object-oriented programming is an exceptionally bad idea which could only have originated in California - Edsger Dijkstra

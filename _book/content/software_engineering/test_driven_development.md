# Test-Driven Development
Test-driven development (TDD) is a software development process that relies on the repetition of a very short development cycle: requirements are turned into very specific test cases. This is opposed to software development that allows software to be added that is not proven to meet requirements. - Wikipedia

## Development Cycle

### Add a Test
Each new feature begins with writing a test. The developer must understand the feature's specification and requirements. This stage occurs the developer starts to implement new features.

### Run Test and Expect Fail
Show that the new test does not pass without requiring new code base. It rules out the possibility that the new test is flawed and will always pass.

### Write Just Enough Code
The next step is to write some code that causes the test to pass. The new code written at this stage is not perfect and may, for example, pass the test in an inelegant way.

### Run Tests
It all test cases pass, the programmer can be confident that the new code meets the test requirements, and does not break or degrade any existing features. If not, the programmer adjusts.

### Refactor
The growing code-base must be cleaned up regularly during test-driven development. Object, class, module, variable, and method names should clearly represent their current purpose an use.

## Principles
 - Fake it till you make it
 - You ain't gonna need it (YAGNI)
 - Keep it simple, stupid (KISS)

## Benefits
 - Shortens the programming feedback
 - Provides detailed (executable) specifications
 - Promotes development of high-quality code

## Avoid
Writing too many tests at once, writing tests that are too large or coarse-grained, writing overly trivial tests, for instance omitting assertions, writing tests for trivial code, for instance accessors

## Quotes
The act of writing a unit test is more an act of design than verification - Robert C Martin

Walking on water and developing software from a specification are both easy if both are frozen - Edward V. Berard.

If it's worth building, it's worth testing. If it's worth testing, why are you wasting your time working on it? - Scott Ambler.


<br>
<br>
# Testing with Xcode
https://developer.apple.com/library/content/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/01-introduction.html#//apple_ref/doc/uid/TP40014132-CH1-SW1




#### Reference
[Testing in Xcode 6](https://developer.apple.com/videos/play/wwdc2014/414/)

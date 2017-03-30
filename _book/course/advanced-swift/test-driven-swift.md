# Test Driven Swift

## Lecture Notes
here is a term in software development – defensive coding – it is an approach to software design and development that tries to ensure that an application continues to function despite unexpected events such as actions by users or changes in the environment in which the app is running. The thing is, despite employing these techniques, situations can, and sometimes do, still occur that mean that execution of our app simply can’t continue. In this article we’ll look at how to identify and debug those situations using a group of functions available in Swift called assertions.



In their simplest form, assertions are runtime checks that we can put into our code to confirm that a particular boolean expressions evaluate to true. As such, they assert that a particular condition is true.

### Why Break?
if statements or optional bindings, execution would simply limp along in some indeterminate state rather than giving us the opportunity to check what had gone wrong or understand how we got there. We could do this with the debugger, but assertions give us the opportunity to stop our program at that critical point where one of the codes assumptions fails regardless of whether we’re running in the debugger or not. This allows us to optionally print out additional information to help diagnose the reason that our assertion failed as well as, when running in a debug environment such as Xcode, allowing us to interrogate the state of the applications variables and call stack. This is invaluable for building quality into your applications.

### The Five Types of Swift Assertion
– assert()
– precondition()
– assertionFailure()
– preconditionFailure()
– fatalError()





### Reference
https://andybargh.com/swift-assertions/

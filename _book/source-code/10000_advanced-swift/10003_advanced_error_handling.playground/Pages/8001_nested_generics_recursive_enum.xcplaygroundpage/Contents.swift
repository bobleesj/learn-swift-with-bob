/*:
 ## Learn Swift with Bob
 ### Advanced Swift
 ### Advanced Error Handling
 
 **Problem:** What is `rethrow`?
 
 ---
 */
Array<String>()


//: Design Functions
func nonThrowableFunc() {
  print("From nonThrowable function")
}
func throwableFunc() throws {
  print("From throwable function")
  throw TestingError.randomError
}

//: Design Error Case
enum TestingError: Error {
  case randomError
}

func rethrowableFuncWithErrorHandling(function: () throws -> ()) rethrows {
  do {
    try function()
  } catch TestingError.randomError {
    print("Random Error thrown by the function in the parameter")
  } catch {
    fatalError("FATAL ERROR: Weird Error")
  }
}



//: Enter throwable function
try? rethrowableFuncWithErrorHandling(function: throwableFunc)
// try rethrowableFuncWithErrorHandling(function: throwableFunc)



//: Enter non-throwable function
rethrowableFuncWithErrorHandling(function: nonThrowableFunc)



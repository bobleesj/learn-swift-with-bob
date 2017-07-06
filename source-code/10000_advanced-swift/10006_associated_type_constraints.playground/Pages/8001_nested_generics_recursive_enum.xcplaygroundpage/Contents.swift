/*:
 ## Learn Swift with Bob
 ### Advanced Swift
 ### Intro to Test Driven Swift
 
 **Problem:** Learn how to create safe apps
 
 ---
 */

 

// Element Associated Type
 let twoDArray = [1, 2, 3]
 let threeDArray = [[1], [2], [3]]
 
 extension Array {
 func typeCheckWithInt() {
 if type(of: self) == [Int].self {
 print("2D array")
 }
 if type(of: self) == [[Int]].self {
 print("3D array")
 }
 }
 
 func typeCheckWithElement() {
 if type(of: self) == [Element].self {
 print("2D array")
 }
 if type(of: self) == Element.self  {
 print("3D array")
 }
 }
 }






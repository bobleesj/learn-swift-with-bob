


// Sets
// A set stores distinct values of the same type in a collection with no defined ordering. You can use a set instead of an array when the order of items is not important, or when you need to ensure that an item only appears once. 

var letters = Set<Character>()

print("lettere is the type Set<Character> with \(letters.count) items.")

letters.insert("a")
letters.insert("d")
letters.insert("b")

print(letters)

var test = Set<Int>([1,2,3,4,5,6,11,12,13,14,15])

var test2 = Set<Int>([1,2,3,4,5,6,7,8,9,10])
var test3 = Set([1,2,3,4,5,6,7,8])


var newSet = test.intersection(test2)
newSet = test.union(test2)
var sorted = newSet.sorted()

for element in newSet {
  print(element)
}




var newBobSet: Set = [1, 2, 3, 4, 5, 6, 7]

import UIKit

protocol ImagePresentable {
  var imageName: String { get }
}

protocol TextFieldPresentable {
  var placeholder: String { get }
  var text: String { get }
  
  func onTextFieldDidEndEditing(textField: UITextField)
}


print("hello")




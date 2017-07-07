
/*:
 ## Learn Swift with Bob
 ### Functional Programming
 ### Intro to Functional Paradigm
 
 **Problem:** Filter
 */


// Filter
func myFilter<T>(source: [T], predicate:(T) -> Bool) -> [T] {
  var result = [T]()
  for i in source {
    if predicate(i) {
      result.append(i)
    }
  }
  return result
}


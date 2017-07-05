
/*:
 ## Learn Swift with Bob
 ### Object Oriented Swift
 ### Failable Init
 
 **Problem:** Can initialization fail?
 */
//: Error Handling (Review)
enum NameError: Error {
  case noName
}

struct UdemyCourse {
  let courseName: String
  
  init(name: String) throws {
    if name.isEmpty {
      throw NameError.noName
    }
    self.courseName = name
  }
}

do {
  let myCourse = try UdemyCourse(name: "Bob")
  myCourse.courseName
  
} catch NameError.noName {
  print("Bob, please enter the name")
}



//: Design Failable Init

class Blog {
  let name: String
  init?(name: String) {
    if name.isEmpty {
      // handle error
      return nil
    }
    self.name = name
  }
}

let blog = Blog(name: "")

if let myBlog = blog {
  print(myBlog.name)
}



//: > I personally prefer error-handling approach since more explicit and no need to unwrap




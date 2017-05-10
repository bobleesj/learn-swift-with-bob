# Course Overview
Welcome to [Learn Swift with Bob](https://udemy.com/learn-swift-with-bob/). You've made the right choice. You won't regret the decision to embark the journey with me. Before you and I jump into the lessons, let us go through the prerequisites, table of content, and course expectation.

## Prerequisites
This course is designed for Swift intermediate. So, I won't cover the basics. Please visit [learnSwiftwithBob.com](https://learnSwiftwithBob.com) and go to prerequisites. You will find a list of items you are expected to know. There is a YouTube video for each concept, so if you ever get stuck, you can always learn and come back. In a nutshell, you should be already be familiar with `switch`, `else-if`, basic `enums`, `function`, and what it means to initialize properties.

#### Variables and Constants
```swift
let imuttableName = "Bob"
var muttableName = "Bobby"

imuttableName = "SangJoon" // Error
```

[Variable vs Constants](https://www.youtube.com/watch?v=W8l-Kt_aKNo&list=PL8btZwalbjYlRZh8Q1VK80Ly0YsZ7PZxx&index=1)

#### Conditional Statement
```swift
if isBobHansome {
  print("He good")
} else {
  print("That's okay")
}
```

[Conditional Statement](https://www.youtube.com/watch?v=ayuB4HChkI0&index=2&list=PL8btZwalbjYlRZh8Q1VK80Ly0YsZ7PZxx)

#### Array and Dictionary
```swift
let countries = ["S.Korea", "USA", "Vietnam", "Malaysia"]
let info = ["Name": "Bob", "Age": "20"]
```

[Array and Dictionary](https://www.youtube.com/watch?v=yfFkj_8c70o&index=3&list=PL8btZwalbjYlRZh8Q1VK80Ly0YsZ7PZxx)

#### For-In Loops
```swift
for _ in 1...100 {
  print("Repeat")
}

// "Repeat"
// "Repeat"
// ...
```

[For-In Loop](https://www.youtube.com/watch?v=bPrdNIEoZio&list=PL8btZwalbjYlRZh8Q1VK80Ly0YsZ7PZxx&index=4)

#### Switch Statement
```swift
switch number {
case 1...10 :
  print("Your number is between 1 to 10")
default:
  print("I don't know")
}
```

[Switch Statement](https://www.youtube.com/watch?v=Q-X3Xbr6LP8&index=5&list=PL8btZwalbjYlRZh8Q1VK80Ly0YsZ7PZxx)

#### Function
```swift
func returnName() -> String {
  return "Bob the Developer"
}
```

[Function](https://www.youtube.com/watch?v=mvteZcbFRbA&list=PL8btZwalbjYlRZh8Q1VK80Ly0YsZ7PZxx&index=6)


#### Intro to Enums
```swift
enum Race: String {
  case asian
  case white
  case black
  case hispanic
}

Race.asian.rawValue // "asian"
```

[Basic Enum](https://www.youtube.com/watch?v=DHCgaQ5GeR4&list=PL8btZwalbjYlRZh8Q1VK80Ly0YsZ7PZxx&index=8)


#### Object Oriented Programming
You should be familiar with initialization, property, method, and inheritance

```swift
 class Human {
   let name: String

   init(enterName: String) {
     name = enterName
   }

   func sayName() {
     print("Hi, I'm \(name)")
   }
 }
```

[What is Object Oriented Programming](https://www.youtube.com/watch?v=orvmHi498YI&index=9&list=PL8btZwalbjYlRZh8Q1VK80Ly0YsZ7PZxx)

[Inheritance](https://www.youtube.com/watch?v=YtA1b7dX_ZE&list=PL8btZwalbjYlRZh8Q1VK80Ly0YsZ7PZxx&index=10)

[Initialization](https://www.youtube.com/watch?v=Jejtrj9Xfpk&index=11&list=PL8btZwalbjYlRZh8Q1VK80Ly0YsZ7PZxx)


## Table of Content
There are 8 chapters in this course. From Chapter 1 to 4, you will get a firm understanding of Intro to Functional, and Protocol, and Object Oriented Programming. In Chapter 5, you will fully understand how objects are created and removed. In Chapter 6 and 7, you will learn how to create value oriented swift code along with protocols, generics, and enums. In the last chapter, you will acquire various advanced and hidden tips about the Swift programming language.

## Course Expectation
Based on the Stack Overflow survey in 2016, Swift is considered as the second most loved language out of thousands. However, don't let its readability and hype fool you. It's a complex language inspired by many. Let us through the course expectation.

### Be Skeptical
I’m a biased human being. I hope you do not trust me all the way. If you spot any practices that raise your eyebrows, make sure challenge me and come up with a better solution. Although I try to prevent that from happening through doing my homework, I encourage you to think outside of the box.

### Be Proactive
You might have seen those red error messages on the left side. I expect you to figure out and search what the issue is. Copy and paste the error message on Google. Ask me questions. Do whatever it takes. Do not move on without knowing the cause and how you could prevent them from occurring in the future.

### Learning Mentality
Learning is done by you, not me. I’m here to teach you how to catch fish. I’m going to show you how to use nets and fish rods. After this course, you are expected to use those tools on your own. You might cut yourself through sharp edges, but it's just a part of your learning journey and becoming a stronger version of yourself.

## Ideal Learning Stage
Let us through an ideal learning stage for the students.


| Step | Detail |
| --- | --- |
| The Why | Each lesson should flow like a story. In the beginning, I start off with a problem statement. It consists of doubts and questions I personally encountered. For example, I would ask, what's the purpose of using `optionals`? A problem statement organically leads to why we learn.
| Application | After having gone through the specific problem statement by showing new features and how to use them, I present how it applies to real-life situations.
| Resources | With additional resources and references, you may go further study on your own. | 
| Visualization | It's your turn. I don't believe in practice problems. We no longer live in a world where there are fixed answers. You visualize how the feature you've learned can be applicable for your future endeavor. Albert Einstein said, "Imagination is more important than knowledge". Practice problems turn you into a machine. We have more than enough by the current education system designed to reduce cost for testing.
| Test |  It's time to put your visualization into practice. You should fail. That's good. You are trying something new. "Failure is an option here. If things are not failing, you are not innovating enough" - Elon Musk |

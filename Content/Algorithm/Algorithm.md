# Overview

1. Sorting Algorithms
Bubble, Selection, Heap, Merge, Insertion, Pancake, Merge, Quick
2. Algorithms on Linked Lists
Iterative, Recursive, Merge two sorted linked lists,

Hash maps,
Graphs and trees: Binary Tree, BST, AVL Tree, Trie
Heaps
Queues and stacks
Tries


2. Linked Lists
Dynamic Programming

즉, Divide & Conquer는 위에서 시작하여 필요한 계산을 해 나가는 반면에, Dynamic programming은 밑에서 시작하여 결과를 저장하 면서 원하는 답을 찾아 나간다.

Mathematical Foundations of Computing (CS103)
CS103 will give students the mathematical foundations necessary for computer science. Topics include proof techniques and logic; induction; sets, functions, and relations; an introduction to formal languages; DFA's, NFA's, and Regular Expressions; Context-Free Grammars, Turing Machines, and NP-Completeness.

Introduction to Probability for Computer Scientists (CS109)
CS109 is designed to teach students material from probability and statistics that is relevant to computer science. Topics include combinatorics; probability theory; conditional probability, and independence; probability distributions; Bayes' Theorem, Law of Large Numbers, and the Central Limit Theorem; and hypothesis testing. The class will also cover applications of probability including hashing, data analysis, inference, and an introduction to machine learning.

Object Oriented Programming
This intermediate-level programming course teaches object-oriented programming in C++. Topics: Pointers, dynamic memory allocation and recursion. Classes and objects including constructors, destructors, methods (member functions) and data members. Access and the interface to relationships of classes including composition, association and inheritance. Polymorphism through function overloading operators. Inheritance and templates. Use of the standard template library containers and algorithms.

Discrete Mathematics MA-UY 2314
Logic, proofs, set theory, functions, relations, asymptotic notation, recurrences, modeling computation, graph theory.

Data Structures and Algorithms (CS161)
CS161 gives students the tools to analyze data structures and algorithms. Students will also practice devising algorithms for various problems. These skills are widely applicable and alumni report CS161 as one of the most useful classes at Stanford. Topics include algorithmic complexity analysis (Big Oh, Omega, Theta), recurrence relations, and the master method. In addition, students learn about several different classes of algorithms and data structures, including randomized algorithms, divide and conquer strategies, greedy algorithms, hasing, heaps, graph algorithms, and search algorithms (including blind and A* search).

Greedy Programming

Floyd-Warshall Algorithm: Finding the shortest distance from the top of a graph


https://www.youtube.com/watch?v=HtSuA80QTyo&list=PLUl4u3cNGP61Oq3tWYp6V_F-5jb5L2iHb


## Linear Search
```swift
func linearSearch<T: Equatable>(_ array: [T], _ object: T) -> Int? {
  for (index, obj) in array.enumerated() where obj == object {
    return index
  }
  return nil
}
```

```swift
let array = [5, 2, 4, 7]
linearSearch(array, 2)  // This will return 1
```

## Binary Search
```swift
func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound {
        // If we get here, then the search key is not present in the array.
        return nil

    } else {
        // Calculate where to split the array.
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2

        // Is the search key in the left half?
        if a[midIndex] > key {
            return binarySearch(a, key: key, range: range.lowerBound ..< midIndex)

        // Is the search key in the right half?
        } else if a[midIndex] < key {
            return binarySearch(a, key: key, range: midIndex + 1 ..< range.upperBound)

        // If we get here, then we've found the search key!
        } else {
            return midIndex
        }
    }
}
```
```swift
let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]

binarySearch(numbers, key: 43, range: 0 ..< numbers.count)  // gives 13
```

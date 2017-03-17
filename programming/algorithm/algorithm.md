# Search Algorithm


## A note on Big-O notation
Big-O | Name | Description
------| ---- | -----------
O(1) | constant | This is the best.
O(log n) | logarithmic | Pretty great.
O(n) | linear | Good performance.
O(n log n) | linearithmic | Decent performance.
O(n^2) | quadratic | Kinda slow.
O(n^3) | cubic | Poor performance.
O(2^n) | exponential | Very poor performance.
O(n!) | factorial | Intolerably slow.

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
let array = [1, 2, 3, 4, 5]
linearSearch(array, 2)
```

### Performance
0(n)

> Comparable: A type that can be compared using the relational operators <, <=, >=, and >.


> Equatable: Types that conform to the Equatable protocol can be compared for equality using the equal-to operator (==) or inequality using the not-equal-to operator (!=). Most basic types in the Swift standard library conform to Equatable.

## Binary Search
The Swift's built-in `indexOf()`function performs a linear search. But, it's slow since it  is O(n). Binary search is O(log n).

```swift
func binarySearch<T: Comparable>(_ a: [T], key: T) -> Int? {
  var lowerBound = 0
  var upperBound = a.count
  while lowerBound < upperBound {
    print("loop")
    let midIndex = lowerBound + (upperBound - lowerBound) / 2
    if a[midIndex] == key {
      return midIndex
    } else if a[midIndex] < key {
      lowerBound = midIndex + 1
    } else {
      upperBound = midIndex
    }
  }
  return nil
}
```
### Performance
O(log n)

## Count Occurrences
Combine binary search
```swift
func countOccurrencesOfKey(_ key: Int, inArray a: [Int]) -> Int {
  func leftBoundary() -> Int {
    var low = 0
    var high = a.count
    while low < high {
      let midIndex = low + (high - low)/2
      if a[midIndex] < key {
        low = midIndex + 1
      } else {
        high = midIndex
      }
    }
    return low
  }

  func rightBoundary() -> Int {
    var low = 0
    var high = a.count
    while low < high {
      let midIndex = low + (high - low)/2
      if a[midIndex] > key {
        high = midIndex
      } else {
        low = midIndex + 1
      }
    }
    return low
  }

  return rightBoundary() - leftBoundary()
}
```

```swift
let a = [ 0, 1, 1, 3, 3, 3, 3, 6, 8, 10, 11, 11 ]
countOccurrencesOfKey(3, inArray: a)  // returns 4
```

## Select Minimum/Maximum


### Resources
[Ray Wenderlich Swift Algorithm Club](https://github.com/raywenderlich/swift-algorithm-club)

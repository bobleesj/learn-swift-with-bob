
import Foundation

let a = NSMutableArray(array: [1,2,3])
let b:NSArray = a

a.insert(4, at: 3)
print(b)


// I don't want to be able to mutate d
let d = c.copy() as! NSArray c.insert(4, at: 3)
d // ( 1, 2, 3 )

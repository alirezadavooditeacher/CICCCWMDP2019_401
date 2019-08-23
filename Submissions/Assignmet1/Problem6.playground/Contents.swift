import UIKit

// Problem 6
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
print("SomeInt is now \(someInt) and anotherInt is now \(anotherInt)")
swapTwoInts(&someInt, &anotherInt)
print("SomeInt is now \(someInt) and anotherInt is now \(anotherInt)")

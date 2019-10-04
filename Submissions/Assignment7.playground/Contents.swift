//: A UIKit based Playground for presenting user interface
  
import UIKit

/* Problem0
 Write and run all the sample codes in the Generics chapter
 */
// Generics
// The Problem That Generics Solve
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anothreInt is now \(anotherInt)")

func swapTwoInts2(_ a: inout Int, _ b: Int) {
    let temporaryA = a
    a = b
    //  When not using "inout", b becomes "let" and it'll be not be able tosubstitution and then the folloing code will get error
    //    b = temporaryA
}

var someInt2 = 3
var anotherInt2 = 107
swapTwoInts2(&someInt2, anotherInt2) // & use when using "inout"？
print("someInt is now \(someInt), and anothreInt is now \(anotherInt)")

func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}


// Generic Functions
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}


// Generic is possible to substitute any type
var someInt3 = 10
var anotherInt3 = 100
swapTwoValues(&someInt3, &anotherInt3)

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)


// Generic Types
struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

struct Stack<Element> {
    var items = [Element]()

    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
print("\(stackOfStrings.items)\n")


let fromTheTop = stackOfStrings.pop()
print("fromTheTop is \(fromTheTop)")
print("then stackOfStrings became\n\(stackOfStrings.items)")


// Extending a Generic Type
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackOfStrings.topItem {
    print("The top item on the stack is \(topItem).")
}


// Type Constraints
// Type Constraint Syntax
//func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
// function body goes here
//}
// Type Counstraints in Action
func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}

func findIndex<T: Equatable>(of valuToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valuToFind {
            return index
        }
    }
    return nil
}

let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])


// Associated Types
// Associated Types in Action
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct IntStack2: Container {
    // original IntStack implementation
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // conformance to the Container protocol
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

struct Stac<Element>: Container {
    // original Stack<Element> implementation
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // conformance to the Container protocol
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}


// Adding Constraints to an Associated Type
protocol Container2 {
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

protocol SuffixableContainer: Container2 {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}

//extension Stack: SuffixableContainer {
//    func suffix(_ size: Int) -> Stack {
//        var result = Stack()
//        for index in (count-size)..<count {
//            result.append(self[index])
//        }
//        return result
//    }
//}
//var stackOfInts = Stack<Int>()
//stackOfInts.append(10)
//stackOfInts.append(20)
//stackOfInts.append(30)
//let suffix = stackOfInts.suffix(2)
//extension IntStack; SuffixableContainer {
//    func suffix(_ size: Int) -> Stack<Int> {
//        var result = Stack<Int>()
//        for index in (count-size)..<count {
//            result.append(self[index])
//        }
//        return result
//    }
//}


// Generic Where Clauses
func allItemsMatch<C1: Container, C2: Container>
    (_ someContainer: C1, _ anotherContainer: C2) -> Bool
    where C1.Item == C2.Item, C1.Item: Equatable {

        // Check that both containers contain the same number of items.
        if someContainer.count != anotherContainer.count {
            return false
        }

        // Check each pair of items to see if they're equivalent.
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }

        // All items match, so return true.
        return true
}


var stackOfStrings2 = Stack<String>()
stackOfStrings2.push("uno")
stackOfStrings2.push("dos")
stackOfStrings2.push("tres")

var arrayOfStrings = ["uno", "dos", "tres"]

//if allItemsMatch(stackOfStrings, arrayOfStrings) {
//    print("All items match.")
//} else {
//    print("Not all items match.")
//}


// Extensions with a Generic Where Clause
extension Stack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}

if stackOfStrings.isTop("tres") {
    print("Top element is tres")
} else {
    print("Top element is something else.")
}

struct NotEquatable { }
var notEquatableStack = Stack<NotEquatable>()
let notEquatableValue = NotEquatable()
notEquatableStack.push(notEquatableValue)
//notEquatableStack.isTop(NotEquatableValue)  // Error
extension Container where Item: Equatable {
    func startsWith(_ item: Item) -> Bool {
        return count >= 1 && self[0] == item
    }
}

//if [9, 9, 9].startsWith(42) {
//    print("Stars with 42.")
//} else {
//    print("Starts with something else.")
//}

//extension Countainer where Item == Double {
//    func average() -> Double {
//        var sum = 0.0
//        for index in 0..<count {
//            sum += self[index]
//        }
//        return sum / Double(count)
//    }
//}
//print([1260.0, 1200.0, 98.6, 37.0].average())

// Associated Types with a Generic Where Clause
protocol Cntainer {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }

    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
    func makeIterator() -> Iterator
}

protocol ComparableContainer: Container where Item: Comparable { }


// Generic Subscripts
extension Container {
    subscript<Indices: Sequence>(indices: Indices) -> [Item]
        where Indices.Iterator.Element == Int {
            var result = [Item]()
            for index in indices {
                result.append(self[index])
            }
            return result
    }
}

--------------------
import UIKit


extension Dictionary {

    func method(_ predivate:(Key) -> Bool) -> [Value] {
        var list:[Value] = []

        for (key,value) in self {
            if predivate(key) {
                list.append(value)
            }
        }

        return list
    }
}

struct Student {
    let firstName: String
    let lastName: String
    let gpa: Int
    var studentID: String

    static func studentIDGenerate() -> String {
        return String(Int.random(in: 10000 ... 99999))
    }
}

//  dict: [studentID:instance of student]
let studentA = Student(firstName: "A", lastName: "Student", gpa: 80, studentID: Student.studentIDGenerate())
var dict: [String:Student] = [studentA.studentID:studentA]


var predicate : (String)-> Bool = { (studentID: String) -> Bool in
    if let sid = Int(studentID) {
        if sid%2 == 0 {
            return true
        } else {
            return false
        }
    }
    return false
}

let list : [Student] = dict.method(predicate)
print(dict)
print(list)


//Problem2:

import UIKit



func exchange<T>(_ index1: Int, _ index2: Int, _ arr: [T]) -> [T] {
    var newarr = arr
    let index1Ofarr = arr[index1]
    let index2Ofarr = arr[index2]
    newarr.remove(at: index1)
    newarr.insert(index2Ofarr, at: index1)
    newarr.remove(at: index2)
    newarr.insert(index1Ofarr, at: index2)
    return newarr
}

print(exchange(3, 5, [0,1,2,3,4,5]))

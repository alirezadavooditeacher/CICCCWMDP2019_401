import UIKit

// The problem That Generics solve
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

func swapTwoStrings(_ a:inout String, _ b: inout String){
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(_ a:inout Double, _ b:inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

// Generic Functions
func swapTwoValues<T>(_ a:inout T, _ b: inout T){
    let temporaryA = a
    a = b
    b = temporaryA
}

swapTwoValues(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someInt, &anotherInt)
print("someString is now \(someString), and anotherString is now \(anotherString)")

// Generic Types
//struct IntStack {
//    var items = [Int]()
//    mutating func push(_ item: Int) {
//        items.append(item)
//    }
//    mutating func pop() -> Int {
//        return items.removeLast()
//    }
//}

//struct Stack<Element> {
//    var items = [Element]()
//    mutating func push(_ item: Element) {
//        items.append(item)
//    }
//    mutating func pop() -> Element {
//        return items.removeLast()
//    }
//}
//var statckOfStrings = Stack<String>()
//statckOfStrings.push("uno")
//statckOfStrings.push("dos")
//statckOfStrings.push("tres")
//statckOfStrings.push("cuatro")

//let fromTheTop = statckOfStrings.pop()
//print("\(fromTheTop)")

// Extending a Generic Type
//extension Stack {
//    var topItem: Element? {
//        return items.isEmpty ? nil : items[items.count - 1]
//    }
//}
//if let topItem = statckOfStrings.topItem {
//    print("The top item on the stack is \(topItem).")
//}

//Type Constraints Syntax
//func someFucntion<T: SomeClass, U: SomeProtocol>(someT: T, SomeU:U){
//    // function body goes here
//}

// Type Constraints in Action
//func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
//    for(index, value) in array.enumerated() {
//        if value == valueToFind {
//            return index
//        }
//    }
//    return nil
//}
//
//let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
//if let foundIndex = findIndex(ofString: "llama", in: strings) {
//    print("The index of llama is \(foundIndex)")
//}

//func findIndex<T>(of valueToFind: T, in array:[T]) -> Int? {
//    for (index, value) in array.enumerated() {
//        if value == valueToFind {
//            return index
//        }
//    }
//    return nil
//}

func findIndex<T: Equatable>( of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let doubleIndex = findIndex(of: 9.3, in: [3.13159, 0.1, 0.25])
print(doubleIndex)
let stringIndex = findIndex(of: "Andrea", in:["Mike","Malcolm","Andrea"])
print(stringIndex)

//Associated Type in Action
protocol Container {
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item{ get }
}

//struct IntStack: Container {
//    // original IntStack implementation
//    var items = [Int]()
//    mutating func push(_ item: Int) {
//        items.append(item)
//    }
//    mutating func pop() -> Int {
//        return items.removeLast()
//    }
//
//    // conformance to the Container protocol
//    typealias Item = Int
//    mutating func append(_ item: Int) {
//        self.push(item)
//    }
//    var count: Int {
//        return items.count
//    }
//    subscript(i: Int) -> Int {
//        return items[i]
//    }
//}

struct Stack<Element>: Container {
    // original Stack<Element> implementation
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
    // conformance to the Container protpcol
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

//extension Array: Container {}


// Generic Where Clauses
func allItemsMatch<C1: Container, C2: Container>(_ someContainer:C1, _ anotherContainer: C2)-> Bool where C1.Item == C2.Item, C1.Item: Equatable{
    
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
    
    //All items match, so return true.
    return true
}
var statckOfStrings = Stack<String>()
statckOfStrings.push("uno")
statckOfStrings.push("dos")
statckOfStrings.push("tres")
statckOfStrings.push("cuatro")
//
//var arrayOfStrings = ["uno","dos","tres"]
//
//if allItemsMatch(statckOfStrings, arrayOfStrings) {
//    print("All items match.")
//} else {
//    print("Not all items match.")
//}

// Extensions with a Generic Where Clause
extension Stack where Element: Equatable {
    func isTop(_ item: Element ) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}

if statckOfStrings.isTop("tres") {
    print("Top element is tres.")
} else {
    print("Top element is something else.")
}

struct NotEquatable {}
var notEquatableStack = Stack<NotEquatable>()
let notEquatableValue = NotEquatable()
notEquatableStack.push(notEquatableValue)
//notEquatableStack.isTop(notEquatableValue)

extension Container where Item:Equatable {
    func startsWith(_ item: Item) -> Bool {
        return count >= 1 && self[0] == item
    }
}
//if [9,9,9].startsWith(42) {
//    print("Starts with 42.")
//} else {
//    print("Starts with something else.")
//}

extension Container where Item == Double {
    func average() -> Double {
        var sum = 0.0
        for index in 0..<count {
            sum += self[index]
        }
        return sum / Double(count)
    }
}
//print([1260.0, 1200.0, 98.6, 37.0].average())


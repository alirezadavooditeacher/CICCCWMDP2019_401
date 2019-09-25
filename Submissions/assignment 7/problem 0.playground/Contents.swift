import UIKit

/*********************/
//Generic Functions
/********************/
//we use T as a generic type, so it works for Int, String, Double...
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoValues(&someInt, &anotherInt)

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)

/********************/
//Generic types
/********************/
//this structure can receive any type to push or pop in a stack
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

//here we define the struct type as String
//now items variable become array of String
var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")


/********************/
//Extending Generic Type
/*******************/
//this extension add a computed property that returns the top item
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

/************************/
//Generic type constraint
/***********************/
//we use it to restrict the generic type to not accept everything
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    
}
class SomeClass {}
protocol SomeProtocol {}

//constraint in action
//this function will find out if an item is in the array and return its index
func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        //this comparisson only works because T must be of constraint Equatable
        if value == valueToFind {
            return index
        }
    }
    return nil
}
let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])

/**********************/
//Associated type
/**********************/
//on this example "item" is used on function and subscript
//using associatedtype we make item accept any type as value
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

//struct used as Int
struct IntStack: Container {
    // original IntStack implementation
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // conformance to the Container protocol
    // item is assuming type of Int for Container protocol
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

//example using Container of any type
//there is no need to using typealias because it is getting it from the context
struct StackArr<Element>: Container {
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

//just add Container protocol to Array type
extension Array: Container {}

//protocol using constraint type
protocol ContainerEquatable {
    //here item must be of type Equatable
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

/*************************/
//generics with where clause
/*************************/
//C1 and C2 must conform Container protocol, C1 must be Equatable and variable Item from C1 and C2 should be the same type
func allItemsMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.Item == C2.Item, C1.Item: Equatable {
    
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

/***********************/
//extension with generics and where clause
/***********************/
//it extends StackArr class where Element that is a generic type is Equatable
extension StackArr where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}
//it extends average function only for who confoms Container protocol and Item variable is Double
extension Container where Item == Double {
    func average() -> Double {
        var sum = 0.0
        for index in 0..<count {
            sum += self[index]
        }
        return sum / Double(count)
    }
}
print([1260.0, 1200.0, 98.6, 37.0].average())

/***************************/
// associated type with generic where clause
/**************************/
protocol Container1 {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
    //here interator must conform InteratorProtocol where Element variable is the same type as Item variable
    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
    func makeIterator() -> Iterator
}

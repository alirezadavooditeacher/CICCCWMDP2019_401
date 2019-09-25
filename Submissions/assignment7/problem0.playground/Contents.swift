import Cocoa

var str = "Hello, playground"

func swapIntoInts(_ a: inout Int, _ b: inout Int) {
    let temporary = a
    a = b
    b = temporary
}

var someInt = 3
var anotherInt = 107
swapIntoInts(&someInt, &anotherInt)
print("someInt is now \(someInt) and another Int is \(anotherInt)")

func swapTwoStrings(_ a: inout String, _ b: inout String){
    let temporary = a
    a = b
    b = temporary
}

func swapTwoDouble (_ a: inout Double, _ b: inout Double){
    let temporary = a
    a = b
    b = temporary
}

func swapTwoValues<T>(_ a: inout T, _ b: inout T){
    let temporary = a
    a = b
    b = temporary
}

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)

//struct IntStack {
//    var items = [Int]()
//    mutating func push(_ item: Int) {
//        items.append(item)
//    }
//    mutating func pop() -> Int {
//        return items.removeLast()
//    }
//}

struct Stack<Element>{
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

let fromTheTop = stackOfStrings.pop()

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil: items[items.count - 1]
    }
}

if let topItem = stackOfStrings.topItem {
    print("The top item on the stack is \(topItem)")
}

//func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U){
//
//}

func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings){
    print("the index of llama is \(foundIndex)")
}

//func findIndex<T>(of valueToFind: T, in array:[T]) -> Int? {
//    for (index, value) in array.enumerated() {
//        if value == valueToFind {
//            return index
//        }
//    }
//    return nil
//}

func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    
    return nil
}


let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])

//protocol Container {
//    associatedtype Item
//    mutating func append(_ item: Item)
//    var count: Int { get }
//    subscript(i: Int) -> Item { get }
//}

struct IntStack: Container {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Int{
        return items[i]
    }
}

protocol Container {
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
protocol  SuffixableContainer: Container {
    associatedtype Suffix:
        SuffixableContainer where
        Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}

// shows error!!!

extension Stack: SuffixableContainer {

    func suffix(_ size: Int) -> Stack {
        var result = Stack()
        for index in (count-size)..<count {
            result.append(self[index])
        }
    }
}

// textbook

//extension Stack: SuffixableContainer {
//    func suffix(_ size: Int) -> Stack {
//        var result = Stack()
//        for index in (count-size)..<count {
//            result.append(self[index])
//        }
//        return result
//    }
//    // Inferred that Suffix is Stack.
//}

//var stackOfInts = Stack<Int>()
//stackOfInts.append(10)
//stackOfInts.append(20)
//stackOfInts.append(30)
//let suffix = stackOfInts.suffix(2)



//extension IntStack: SuffixableContainer {
//    func suffix(_ size: Int) -> Stack<Int>{
//        var result = Stack<Int>()
//        for index in (count - size)..<count {
//            result.append(self[index])
//        }
//        return result
//    }
//}

//func allItemMatch< C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) where C1.Item == C2.Item, C1.Item: Equatable {
//    if someContainer != anotherContainer.count {
//        return false
//    }
//
//    for i in 0..< someContainer.count {
//        return false
//    }
//
//    return true
//}
//
//
//var stackOfStrings = Stack<String>()
//stackOfStrings.push("uno")
//stackOfStrings.

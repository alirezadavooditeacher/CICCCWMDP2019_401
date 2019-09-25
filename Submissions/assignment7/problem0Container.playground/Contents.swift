import Cocoa

var str = "Hello, playground"
protocol Container {
    associatedtype Item:Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}


struct Stack<Element:Equatable>:Container {
    var items = [Element]()
    mutating func push(_ item:Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
//
    mutating func append(_ item:Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}
    
protocol  SuffixableContainer: Container {
    associatedtype Suffix:
        SuffixableContainer where
        Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}
//
//// shows error!!!
extension Stack: SuffixableContainer {

    func suffix(_ size: Int) -> Stack {
        var result = Stack()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
}
var stackOfInts = Stack<Int>()
stackOfInts.append(10)
stackOfInts.append(20)
stackOfInts.append(30)
let suffix = stackOfInts.suffix(2)

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

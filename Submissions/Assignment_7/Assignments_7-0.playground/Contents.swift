import UIKit
//Generic
func swapTwoInts(a: inout Int, _ b: inout Int){
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(a: &someInt, &anotherInt)

print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

func swapTwoValue<T>(_ a:inout T, _ b:inout T){
    let temporaryA = a
    a = b
    b = temporaryA
}

var A = "AAA"
var B = "BBB"
swapTwoValue(&A, &B)
print("A = \(A), B = \(B)")

struct IntStack{
    var items = [Int]()
    mutating func push(_ item:Int){
        items.append(item)
    }
    mutating func pop()->Int{
        return items.removeLast()
    }
}

struct Stack<Element>{
    var items = [Element]()
    mutating func push(_ item:Element){
        items.append(item)
    }
    mutating func pop()-> Element{
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
print(stackOfStrings.items.count)
stackOfStrings.pop()
print(stackOfStrings.items.count)

extension Stack{
    var topItem: Element?{
        return items.isEmpty ? nil : items[items.count-1]
    }
}

if let topItem = stackOfStrings.topItem{
    print("The top item on the stack is \(topItem)")
}

//func someFunction<T: SomeClass, U:SomeProtocol>(someT:T, someU:U){
//
//}

func findIndex(ofString valueToFind: String, in array: [String]) -> Int?{
    for (index, value) in array.enumerated(){
        if value == valueToFind{
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet","terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings){
    print("The index of llama is \(foundIndex)")
}

func findIndex<T:Equatable>(of valueToFind: T, in array: [T])-> Int?{
    for(index, value) in array.enumerated(){
        if value == valueToFind{
            return index
        }
    }
    return nil
}

let doubleIndex = findIndex(of: 9.3, in: [3.123, 0.3, 0.25])
let stringIndex = findIndex(of: "Andrea", in: ["Mike","Malcolm","Andrea"])



//Associated type

protocol Container{
    associatedtype Item
    mutating func append(_ item:Item)
    var count: Int{get}
    subscript(i:Int) -> Item{get}
}

struct InStack: Container {
    //original IntStack implementation
    var items = [Int]()
    mutating func push(_ item:Int){
        items.append(item)
    }
    mutating func pop()->Int{
        return items.removeLast()
    }
    //conformance to the Container protocol
    typealias Item = Int                    // importance!!!!!!
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count:Int{
        return items.count
    }

    subscript(i:Int)->Int{
        return items[i]
    }
}

struct Stack1 <Element>: Container {
    //original IntStack implementation
    var items = [Element]()
    mutating func push(_ item:Element){
        items.append(item)
    }
    mutating func pop()->Element{
        return items.removeLast()
    }
    //conformance to the Container protocol
    
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count:Int{
        return items.count
    }
    
    subscript(i:Int)->Element{
        return items[i]
    }
}

extension Array: Container{}

protocol Container1{
    associatedtype Item: Equatable
    mutating func append(_ item:Item)
    var count: Int{get}
    subscript(i:Int) -> Item{get}
}


protocol SuffixableContainer:Container{
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size:Int) -> Suffix
}

extension Stack1: SuffixableContainer {
    typealias Suffix = Stack1
    func suffix(_ size: Int) -> Stack1 {
        var result = Stack1()
        for index in (count - size)..<count {
            result.append(self[index])
        }
        return result
    }
}
var stackOfInts = Stack1<Int>()
stackOfInts.append(10)
stackOfInts.append(20)
stackOfInts.append(30)
let suffix = stackOfInts.suffix(2)

func allItemMatch<C1: Container, C2: Container>(_ someContainer:C1, _ anotherContainer:C2)-> Bool where C1.Item == C2.Item, C1.Item: Equatable{
    if someContainer.count != anotherContainer.count{
        return false
    }
    for i in 0 ..< someContainer.count{
        if someContainer[i] != anotherContainer[i]{
            return false
        }
    }
    return true
}

var stackOfStrings1 = Stack1<String>()
stackOfStrings1.push("uno")
stackOfStrings1.push("dos")
stackOfStrings1.push("tres")
var arrayOfStrings = ["uno","dos","tres"]

if allItemMatch(stackOfStrings1, arrayOfStrings){
    print("All items match")
}else{
    print("Not match")
}

extension Stack1 where Element: Equatable{
    func isTop(_ item:Element)->Bool{
        guard let topItem = items.last else{
            return false
        }
        return topItem == item
    }
}

if stackOfStrings1.isTop("tres"){
    print("Top element is tres")
}else{
    print("Top is somthing else")
}

struct NotEquatable{}
var notEquatableStack = Stack1<NotEquatable>()
let notEquatableValue = NotEquatable()
notEquatableStack.push(notEquatableValue)
//notEquatableStack.isTop(notEquatableValue)
//Erro

extension Container where Item: Equatable{
    func startWith(_ item: Item)->Bool{
        return count >= 1 && self[0] == item
    }
}
if [9,9,9].startWith(42){
    print("Starts with 42")
}else{print("Start with other number")}

extension Container where Item == Double{
    func average() -> Double{
        var sum = 0.0
        for index in 0..<count{
            sum += self[index]
        }
        return sum / Double(count)
    }
}
print([1260,1200,98.6,37].average())

protocol Container2{
    associatedtype Item
    mutating func append(_ item:Item)
    var count: Int{get}
    subscript(i:Int) -> Item{get}
    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
    func makeIterator()-> Iterator
}

protocol ComparableContainer: Container where Item: Comparable{}

extension Container {
    subscript<Indices: Sequence>(indices:Indices)-> [Item] where Indices.Iterator.Element == Int {
        var result = [Item]()
        for index in indices{
            result.append(self[index])
        }
        return result
    }
}


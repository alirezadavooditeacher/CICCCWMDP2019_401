import UIKit

protocol Protocol1 {
    var property1: Int? {get}
}

protocol Protocol2 {
    var property2: String {get}
}

protocol Protocol3 {
    var property3: (Int?) -> String {get}
}

class Class1: Protocol1, Protocol2, Protocol3 {
    var property1: Int?
    var property2: String
    var property3: (Int?) -> String
    
    init(p1: Int?, p2: String, p3: @escaping (Int?) -> String) {
        self.property1 = p1
        self.property2 = p2
        self.property3 = p3
    }
    
}

var predicate = {(n: Int?) -> String in return "It's a number!"}

let item1 = Class1(p1: 2, p2: "Hello", p3: predicate)
let item2 = Class1(p1: 4, p2: "Word", p3: predicate)
let item3 = Class1(p1: 2, p2: "Test", p3: predicate)

var list1 = [Class1]()
list1.append(item1)
list1.append(item2)
list1.append(item3)

var dict1 = ["Item1":item1, "Item2":item2, "Item3":item3]

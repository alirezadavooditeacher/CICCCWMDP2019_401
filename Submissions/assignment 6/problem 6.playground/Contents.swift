import UIKit

protocol Protocol1 {
    var property1: Int? {get set}
}
protocol Protocol2 {
    var property2: String {get set}
}
protocol Protocol3 {
    var property3: (Int?) -> String {get set}
}

var list1: [Protocol1 & Protocol2 & Protocol3] = []
var dictionary: [String: Protocol1 & Protocol2 & Protocol3] = [:]

class MyClass: Protocol1, Protocol2, Protocol3 {
    var property1: Int?
    var property2:String
    var property3: (Int?) -> String
    init(property2:String, property3: @escaping (Int?)->String) {
        self.property2 = property2
        self.property3 = property3
    }
}

let myClass = MyClass(property2: "property2", property3: {(num:Int?) -> String in return "property3"})

list1.append(myClass)
dictionary["elemtent1"] = myClass

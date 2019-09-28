import UIKit

/* Problem6
 Consider the following protocols:
 
 Protocol Protocol1 {
 var property1: Int?
 }
 Protocol Protocol2 {
 var property2: String
 }
 Protocol Protocol3 {
 var property3: Int?->String
 }
 
 • Define an array called list1 whose elements are of a type (for instance a class) which conforms to all above protocol.
 • Using protocol composition, define a dictionary whose keys are of type String and the values are of a type that conforms to all above (three above) protocols.
 */

protocol Protocol1 {
    var property1: Int? {get}
}
protocol Protocol2 {
    var property2: String {get}
}
protocol Protocol3 {
    var property3: (Int?) -> String {get}
}

class Protocol123: Protocol1, Protocol2, Protocol3 {
    var property1: Int?
    var property2: String
    var property3: (Int?) -> String
    init(property1:Int?, property2: String, property3: @escaping (Int?) -> String){
        self.property1 = property1
        self.property2 = property2
        self.property3 = property3
    }
}

func forProtocol3(_ num: Int?) -> String {
    if let number = num {
        return "Number: \(number)"
    } else {
        return "Empty"
    }
}

let p123 = Protocol123(property1: 10, property2: "abc", property3: forProtocol3)

var list1: [Protocol123] = [p123]
var dict: [String:Protocol1 & Protocol2 & Protocol3] = ["":p123]

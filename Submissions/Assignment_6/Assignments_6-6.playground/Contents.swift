import UIKit

protocol protocol1{
    var property1: Int? {get}
}
protocol protocol2{
    var property2: String {get}
}
protocol protocol3{
    var property3: (Int?)->String{get}
}

func p3(input:Int?)-> String{
    if let input1 = input{
        return "Function input is \(input1)"
    }else{return "nil"}
}

class Element: protocol1, protocol2, protocol3{
    var property1: Int?
    var property2: String
    var property3: (Int?)->String
    init(property1: Int?, property2: String, property3: @escaping (Int?)->String){
        self.property1 = property1
        self.property2 = property2
        self.property3 = property3
    }
}

let ele1 = Element(property1: 1, property2: "A", property3: p3)
let ele2 = Element(property1: 2, property2: "B", property3: p3)
var list1: [Element] = [ele1,ele2]

var dic: [String:protocol1 & protocol2 & protocol3] = [:]
dic["Element1"] = ele1
dic["Element2"] = ele2
print("property1: \(dic["Element1"]!.property1!)\nproperty2: \(dic["Element1"]!.property2)\nproperty3: \(dic["Element1"]!.property3(5))")

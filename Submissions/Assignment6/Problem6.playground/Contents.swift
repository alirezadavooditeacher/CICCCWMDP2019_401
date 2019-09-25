import UIKit

protocol Protocol1 {
    var property1: Int? { get }
    
}
protocol Protocol2 {
    var property2: String { get }
}
protocol Protocol3 {
    var property3: (Int?)->String { get }
}

func p3(input:Int?)-> String{
    if let input1 = input{
        return "Function input is \(input1)"
    }else{return "nil"}
}

class allPro:Protocol1,Protocol2,Protocol3 {
    var property1: Int?
    
    var property2: String
    
    var property3: (Int?) -> String
    init(pro1:Int?, pro2:String, pro3:@escaping (Int?) -> String) {
        self.property1 = pro1
        self.property2 = pro2
        self.property3 = pro3
    }
}
let ele1 = allPro(pro1: 1, pro2: "A", pro3: p3)
let ele2 = allPro(pro1: 2, pro2: "B", pro3: p3)
var list1: [allPro] = [ele1,ele2]

var dic: [String:Protocol1 & Protocol2 & Protocol3] = [:]
dic["Element1"] = ele1
dic["Element2"] = ele2
print("property1: \(dic["Element1"]!.property1!)\nproperty2: \(dic["Element1"]!.property2)\nproperty3: \(dic["Element1"]!.property3(5))")

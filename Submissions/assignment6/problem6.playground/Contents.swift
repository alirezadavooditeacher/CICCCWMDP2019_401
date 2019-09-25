import Cocoa

var str = "Hello, playground"

protocol Protocol1 {
    var property1: Int? { get }
}

protocol Protocol2 {
    var property2: String { get }
}

protocol Protocol3 {
    var property3: (Int?)->String { get }
}

class protocol1 : Protocol1 {
    
    var property1: Int? {
        let ramdomNum = Int.random(in: 0...10)
        if ramdomNum < 5 {
            return nil
        } else {
            return ramdomNum
        }
    }
    
}

class protocol2 : Protocol2 {
    
    var property2: String = "aliali"
    
}

class protocol3 : Protocol3 {
    
    var property3: (Int?) -> String = { (num) in
        if num != nil {
            return "This is \(String(describing: num))"
        } else {
            return "This is nil."
        }
    }
    
}

let instance1 = protocol1()
let instance2 = protocol2()
let instance3 = protocol3()

var list1:[Any] = [instance1, instance2, instance3]
let dictionary:[String:Any] =  ["protocol1" :instance1, "protocol2" : instance2, "protocol3" : instance3]

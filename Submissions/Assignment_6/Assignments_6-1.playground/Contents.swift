import UIKit

protocol SomeProtocol{
    var property1: Int{get}
    var property2: String{get set}
    var property3: (()->Int)?{get}
    static var property4: String?{get set}
    static func method1(arg param: Int)
    func method2(arg param: Int)-> Int?
    mutating func method3()-> String?
}

class Class1:SomeProtocol{
    var s1 = "property"
    static var s2 = "static property"
    var property1: Int{
        return 1
    }
    var property2: String{
        get{
        return s1
        }
        set{
            s1 = newValue + " property2"
        }
    }
    var property3: (() -> Int)?{
        func p3()-> Int{
            return 3
        }
        return p3
    }
    static var property4: String?{
        get{
            return Class1.s2
        }
        set{
            Class1.s2 = newValue ?? "static property4"
        }
    }
    static func method1(arg param: Int) {
        print(param)
    }
    func method2(arg param: Int) -> Int? {
        var m2 = 0
        m2 = param
        return m2
    }
    func method3() -> String? {
        let m3 = "m3"
        return m3
    }
}

let c1 = Class1()
print(c1.property1)
print(c1.property2)
c1.property2 = "new"
print(c1.property2)
c1.property3
Class1.property4
Class1.property4 = "new property4"
print(Class1.property4!)
Class1.method1(arg: 11)
print(c1.method2(arg: 22)!)
print(c1.method3()!)

struct Structure1:SomeProtocol{
    var s1 = "property"
    static var s2 = "static property"
    var property1: Int{
        return 1
    }
    var property2: String{
        get{
            return s1
        }
        set{
            s1 = newValue + " property2"
        }
    }
    
    var property3: (() -> Int)?{
        func p3()-> Int{
            return 3
        }
        return p3
    }
    static var property4: String?{
        get{
            return Structure1.s2
        }
        set{
            Structure1.s2 = newValue ?? "4"
        }
    }
    static func method1(arg param: Int) {
        print(param)
    }
    func method2(arg param: Int) -> Int? {
        var m2 = 0
        m2 = param
        return m2
    }
    func method3() -> String? {
        let m3 = s1
        return m3
    }
}
var s1 = Structure1()
print(s1.property1)
print(s1.property2)
s1.property2 = "new"
print(s1.property2)
s1.property3
Structure1.property4
Structure1.property4 = "new property4"
print(Structure1.property4!)
Structure1.method1(arg: 11)
print(s1.method2(arg: 22)!)
print(s1.method3()!)


var s0 = "property"

enum Enum1:SomeProtocol{
    case property

    static var s2 = "static property"
    var property1: Int{
        return 1
    }
    var property2: String{
        get{
            return s0
        }
        set{
            s0 = newValue + " property2"
        }
    }
    var property3: (() -> Int)?{
        func p3()-> Int{
            return 3
        }
        return p3
    }
    static var property4: String?{
        get{
            return Class1.s2
        }
        set{
            Class1.s2 = newValue ?? "4"
        }
    }
    static func method1(arg param: Int) {
        print(param)
    }
    func method2(arg param: Int) -> Int? {
        var m2 = 0
        m2 = param
        return m2
    }
    func method3() -> String? {
        let m3 = s0
        return m3
    }
}

var e1 = Enum1.property
print(e1.property1)
print(e1.property2)
e1.property2 = "new"
print(e1.property2)
e1.property3
Enum1.property4
Enum1.property4 = "new property4"
print(Enum1.property4!)
Enum1.method1(arg: 11)
print(e1.method2(arg: 22)!)
print(e1.method3()!)


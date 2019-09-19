import UIKit

protocol SomeProtocol1 {
    var property1: Int {get}
    var property2:String {get set}
    var property3: (()->Int)? {get}
    static var property4:String? {get set}
    static func method1(arg param:Int)
    func method2(arg param:Int) -> Int?
    mutating func method3() -> String?
}

class Class1: SomeProtocol1 {
    var property1: Int
    var property2: String
    var property3: (() -> Int)?
    static var property4: String? = nil
    
    init(property1: Int, property2: String, property3: (() -> Int)?) {
        self.property1 = property1
        self.property2 = property2
        self.property3 = property3
    }
    
    static func method1(arg param: Int) {
        print("Method1 \(param)")
    }
    
    func method2(arg param: Int) -> Int? {
        return 0
    }
    
    func method3() -> String? {
        return "Henrique"
    }
}
let class1 = Class1(property1: 1, property2: "Class", property3: nil)

struct Struct1: SomeProtocol1 {
    var property1: Int
    var property2: String
    var property3: (() -> Int)?
    static var property4: String?
    
    static func method1(arg param: Int) {
        print("Method1 \(param)")
    }
    func method2(arg param: Int) -> Int? {
        return 0
    }
    mutating func method3() -> String? {
        self.property2 += " 1"
        return "Henrique"
    }
}

let struct1 = Struct1(property1: 2, property2: "Struct", property3: {() -> Int in 0})

enum Enum1: SomeProtocol1 {
    
    case on, off
    var property1: Int {
        return 0
    }
    
    var property2: String {
        get {
            return "Enum"
        }
        set {
        }
    }
    
    var property3: (() -> Int)? {
        return {() -> Int in 2}
    }
    
    static var property4: String? {
        get {
            return nil
        }
        set {
        }
    }
    
    static func method1(arg param: Int) {
        print("Method1 \(param)")
    }
    
    func method2(arg param: Int) -> Int? {
        return 2
    }
    
    mutating func method3() -> String? {
        property2 += " 1"
        return nil
    }
    
    
}

var enum1 = Enum1.on
enum1.method3()
print(enum1.property2)

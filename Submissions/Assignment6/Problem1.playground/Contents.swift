import UIKit

protocol SomeProtocol1 {
    var property1: Int { get }
    var property2: String { get set }
    var property3: (()->Int)? { get }
    static var property4: String? { get set }
    static func method1(arg param:Int)
    func methods2(arg param: Int)->Int?
    mutating func method3()-> String?
}

class Class1: SomeProtocol1 {
    var property1: Int
    var property2: String
    var property3: (() -> Int)?
    static var property4: String?
    static func method1(arg param: Int) {
        print(param)
    }
    
    func methods2(arg param: Int) -> Int? {
        return param
    }
    
    func method3() -> String? {
        return nil
    }
    
    init(property1:Int, property2: String, property3:(()->Int)?,property4:String?) {
        self.property1 = property1
        self.property2 = property2
        self.property3 = property3
    }
}

struct struct1: SomeProtocol1 {
    var property1: Int
    var property2: String
    var property3: (() -> Int)?
    static var property4: String?
    static func method1(arg param: Int) {
        print(param)
    }
    
    func methods2(arg param: Int) -> Int? {
        return param
    }
    
    func method3() -> String? {
        return nil
    }
}

enum Enum1: SomeProtocol1 {
    var property1: Int {
        return 0
    }
    
    var property2: String {
        get {
            return ""
        }
        set {
            print(newValue)
        }
    }
    
    var property3: (() -> Int)? {
        return {() -> Int in return 0 }
    }
    
    static var property4: String?
    
    static func method1(arg param:Int) {}
    
    func methods2(arg param: Int) -> Int? {
        return 1
    }
    
    func method3() -> String? {
        return "method3"
    }
}

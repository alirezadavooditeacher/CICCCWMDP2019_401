import UIKit

/* Problem1
 Consider the following protocol: Protocol SomeProtocol1
 {
 var property1: Int {get}
 var property2: String {get set}
 var property3: (()->Int)? {get}
 static var property4: String? {get set}
 static method1(arg param: Int)
 method2(arg param: Int) -> Int?
 mutating method3()-> String?
 }
 
 Now
 • Create a class called Class1 which confirms to the above protocol. Make some arbitrary implementations for the protocol’s requirements if needed.
 上記のプロトコルを確認するClass1というクラスを作成します。 必要に応じて、プロトコルの要件を任意に実装します。
 
 • Create a struct called Struct1 which confirms to the above protocol. Make some arbitrary implementations for the protocol’s requirements if needed.
 • Create an enum called Enum1 which confirms to the above protocol. Make some arbitrary implementations for the protocol’s requirements if needed.
 
 */


protocol SomeProtocol1 {
    var property1: Int {get}
    var property2: String {get set}
    var property3: (()->Int)? {get}
    static var property4: String? {get}
    static func method1 (arg param: Int)
    func method2 (arg param: Int) -> Int?
    mutating func method3() -> String?
}

class Class1: SomeProtocol1 {
    var forProperty2 = ""
    
    var property1: Int {
        get {
            return 100
        }
    }
    
    var property2: String {
        get {
            return forProperty2 + forProperty2 + forProperty2
        }
        set(str) {
            forProperty2 = str + "something"
        }
    }
    
    var property3: (()->Int)? {
        get {
            func forProperty3() -> Int {
                return 200
            }
            
            return forProperty3
        }
    }
    
    static var property4: String? {
        get {
            return "something"
        }
    }
    
    static func method1(arg param: Int) {
        print(param)
    }
    
    func method2(arg param: Int) -> Int? {
        if param > 0 {
            return param * 2
        } else {
            return nil
        }
    }
    
    func method3() -> String? {
        return "something"
    }
    
}

struct Struct1: SomeProtocol1 {
    var forProperty2: String
    
    var property1: Int {
        get {
            return 100
        }
    }
    
    var property2: String {
        get {
            return forProperty2 + forProperty2 + forProperty2
        }
        set(str) {
            forProperty2 = str + "something"
        }
    }
    
    var property3: (()->Int)? {
        get {
            func forProperty3() -> Int {
                return 200
            }
            
            return forProperty3
        }
    }
    
    static var property4: String? {
        get {
            return "something"
        }
    }
    
    static func method1(arg param: Int) {
        print(param)
    }
    
    func method2(arg param: Int) -> Int? {
        if param > 0 {
            return param * 2
        } else {
            return nil
        }
    }
    
    func method3() -> String? {
        return "something"
    }
}

enum Enum1: SomeProtocol1 {
    case case1
    case case2
    
    var property1: Int {
        get {
            return 100
        }
    }
    
    var property2: String {
        get {
            return "something"
        }
        set(str) {
            str + "something"
        }
    }
    
    var property3: (()->Int)? {
        get {
            func forProperty3() -> Int {
                return 200
            }
            
            return forProperty3
        }
    }
    
    static var property4: String? {
        get {
            return "something"
        }
    }
    
    static func method1(arg param: Int) {
        print(param)
    }
    
    func method2(arg param: Int) -> Int? {
        if param > 0 {
            return param * 2
        } else {
            return nil
        }
    }
    
    func method3() -> String? {
        return "something"
    }
    
}


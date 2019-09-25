import Cocoa

var str = "Hello, playground"
protocol SomeProtocol1{
    
    var property1: Int {get}
    var property2: String {get set}
    var property3: (()->Int)? {get}
    static var property4: String? {get set}
    static func method1(arg param: Int)
    static func method2(arg param: Int) -> Int?
    mutating func method3()-> String?
    
}

class Class1 : SomeProtocol1 {
    var property1: Int = 0
    
    var property2: String = ""
    
    var property3: (() -> Int)? = nil
    
    static var property4: String?
    
    init(property1: Int, property2: String, property3: @escaping () -> Int) {
        self.property1 = property1
        self.property2 = property2
        self.property3 = property3
    }
    
    static func method1( arg param: Int) {
        print("\(param)")
    }
    
    static func method2 (arg param: Int) -> Int? {
        if param > 50 {
            return param
        } else {
            return nil
        }
    }
    
    func method3() -> String? {
        let randomNum = Int.random(in: 0...10)
        if randomNum > 4 {
            return String(randomNum)
        } else {
//            print("this is method3 \(randomNum)")
            return nil
        }
    }
    
    
}

let class1 = Class1(property1: 19, property2: "こんにちは", property3: { return Int.random(in: 0...10)}).method3()
Class1.property4 = nil
Class1.method1(arg: Int.random(in: 1...100))
Class1.method2(arg: Int.random(in: 1...100))
print(class1)


import UIKit

protocol myProtocol{
    associatedtype Str
    func check(_ p: Str, _ q:Str)->Bool
}

struct test: myProtocol{
    typealias Str = String
    
    func check(_ p:String, _ q:String)->Bool{
        if (p == q) {return true}
        else{return false}
    }
    
}

let t1 = test()
t1.check("ss","ss")
t1.check("ss","tt")





import UIKit

var str = "Hello, playground"

protocol MyProtocol {
    func check()
}

class check:MyProtocol {
    func check() {
        let num = Int.random(in: 1...2)
    }
    
    
}

func sampleMethod<T: MyProtocol> (_ p: T, _ q: T) -> Bool {
    return p.check() == q.check() ? true:false
}

extension String:MyProtocol {
    func check() { print("this is string extension") }
}

var newString = "hey"
newString.check()




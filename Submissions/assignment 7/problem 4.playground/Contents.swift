import UIKit

protocol MyProtocol {
    func check()
}

func sampleMethod<T: MyProtocol>(_ p: T, _ q: T) -> Bool {
    return true
}

extension String: MyProtocol {
    func check() {
        
    }
}

let result = sampleMethod("a", "b")
print(result)

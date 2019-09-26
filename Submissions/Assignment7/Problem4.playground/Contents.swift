import UIKit

protocol MyProtocol {
    func check()
}

func sampleMethod<T: MyProtocol>(_ p: T, _ q: T) -> Bool {
    return true
}

extension String: MyProtocol {
    func check() {
        print("Is a String!")
    }
}

var string1 = "Hello"
var string2 = "World"

string1.check()
string2.check()

let test = sampleMethod(string1, string2)
print(test)

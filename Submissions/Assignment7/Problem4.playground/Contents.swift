import UIKit

protocol MyProtocol {
    associatedtype Item
    mutating func check(item:Item)
}

struct test<Element>: MyProtocol {
    mutating func check(item:Element) {
        print("A")
    }
    var str = [Element]()
}
let testA = test(str: ["AA","BB"])

func sampleMethod<T:MyProtocol>(_ p:T,_ q:T)->Bool {
    return true
}

let answer = sampleMethod(testA, testA)
print(answer)

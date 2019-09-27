import UIKit

/* Problem4
 Consider the following protocol

 Protocol MyProtocol {
    func check()
 }

 Now consider the following method:

 func sampleMethod<T: MyProtocol> (_ p: T, _ q: T) -> Bool {
    return true
 }

 Now we want to call the function you defined above for T=String as following:

 func sampleMethod (_ p: String, _ q: String) -> Bool {
    return true
 }

 What do we need to add to the above code to get this to work?
 */


protocol MyProtocol {
    func check()
}

func sampleMethod<T: MyProtocol> (_ p: T, _ q: T) -> Bool {
    return true
}

func sampleMethod2<String: MyProtocol> (_ p: String, _ q: String) -> Bool {
    return true
}

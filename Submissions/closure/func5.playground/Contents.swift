//: Playground - noun: a place where people can play

import UIKit

// A constant called func5 whose type is ([(int)->Void]) -> [String]



//let func5of1(_ closure:(Int) -> Void) -> [String] {
//    func inside(num1 a:Int) -> Void {
//        var numString = (String)
//    }
//
//    return
//}
//let func5 = {[(num1:Int) -> Void] -> [String]; in return }
//
//print(func5())


func func5(closure:[(Int) -> Void])-> [String] {
    
    // when you call closure, you can write like this.
    // closure[index number](prameter)
    closure[0](10)
    var arr = ["abc"]
    return arr
}

// the argument is put in the func5,
// when the function is called it is inside of this closure,
//if you print the argument like below you can know it.
let ff = func5(closure: [{(inrF5:Int)->Void in print("made it! \(inrF5)") }])
print(ff)

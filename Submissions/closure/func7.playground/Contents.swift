//: Playground - noun: a place where people can play

import UIKit

//A variable called func7 whose type is ([(int)->Void]?) -> [(int)->void]?

func func7(_ closure:[(Int) -> Void]?) -> [(Int) -> Void]? {
    
    let arr = [{(num:Int) -> Void in print("hello")}]
    
    return arr
}

var func17 = func7([{(intF:Int)->Void in print("made it! \(intF)") }]) 

//: Playground - noun: a place where people can play

import UIKit

//A constant called func4 whose type is ()->[()->Void]

func someFun()->[()->Void] {
    
    return [{() -> Void in print("made it!")}]
}

let func4 = someFun

//let func() -> () -> Void{
//    func(){
//        print(str)
//    }
//}

func4()

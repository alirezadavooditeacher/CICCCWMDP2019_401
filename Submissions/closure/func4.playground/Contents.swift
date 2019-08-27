//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let func4:() -> [() ->Void] = {{() -> [() -> Void in print(str)] }}

//let func() -> () -> Void{
//    func(){
//        print(str)
//    }
//}

func4()

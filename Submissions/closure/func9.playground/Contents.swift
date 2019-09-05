//: Playground - noun: a place where people can play

import UIKit

//A variable called func9 whose type is () -> ((Int)->Int, Int)?

func func9() -> ((_ num1:Int) -> Int, Int){
    var firstValue = {(a:Int) in return (a)}
    var tuple = (firstValue, 10)
    return tuple
}

var func19 = func9()

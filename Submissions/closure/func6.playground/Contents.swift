//: Playground - noun: a place where people can play

import UIKit

//A variable called func6 whose type is ([(int)->Void]) -> [(int)->void]



func func6(_ closure:[(Int) -> Void]) -> [(Int) -> Void] {
    closure[0](10)
    let arr = [{(intF:Int)->Void in print("made it! \(intF)") }]
    return arr
}

func6([{(intF:Int)->Void in print("made it! \(intF)") }])

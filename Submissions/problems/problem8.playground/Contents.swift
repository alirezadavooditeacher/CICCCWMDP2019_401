//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func variadic(list a: Int...) -> Bool {
    let num:Int = 5
    
    for _ in 0...a.count {
        if a.contains(num) {
            return true
        }
    }
    
    return false
}



var answer = variadic(list:1,4,6,7,43,100,66)
print("problem 7 is ...")
print(answer)

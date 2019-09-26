//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let arr = ["sum", "difference", "multiplication", "power", "division"]





func caluculator(num1 a:Int, num2 b:Int, operators mark:String) -> (Double, (Int, Int) -> Double)? {
   
    func sum(num1 a:Int, num2 b:Int) -> Double {
        print("sum")
        return (Double)(a + b)
    }
    
    func division(num1 a:Int, num2 b:Int) -> Double {
        print("division")
        if a > b {
            return (Double)(a / b)
        } else {
            return (Double)(b / a)
        }
    }
    
    func difference(num1 a:Int, num2 b:Int) -> Double {
        print("differences")
        if a > b {
            return (Double)(a - b)
        } else {
            return (Double)(b - a)
        }
    }
    
    func power(num1 a:Int, num2 b:Int) -> Double {
        print("power")
        var answer:Int = a
        for a in 1..<b {
            answer *= a
        }
        return (Double)(answer)
    }
    
    func multiplication(num1 a:Int, num2 b:Int) -> Double {
        print("multiplication")
        return (Double)(a * b)
    }
    
    let dictionary = ["sum": sum, "difference": difference, "power":power, "division":division, "multiplication":multiplication]
    
   
    // answer will have only function
    // in the condition the optional is unwrapped.
    if  let answer = dictionary[mark] {
        let result = answer(a, b)
        return (result, answer)
    } else {
        return nil
    }
    
    
}

for value in arr {
    if let (result, function) = caluculator(num1: 4, num2: 2, operators: value){
        print(result)
    } else {
        print("fail")
    }
}




//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let arr = ["OneTwo", "FiveHandred", "FifteenFive", "25Five", "1000TwentyFive"]

let dictionary = [OneTwo: (1,2), FiveHandred:(5, 100), FifteenFive:(15, 5), 25Five:(25, 5), 1000TwentyFive:(1000, 25)]

func sum(num1 a:Int, num2 b:Int) -> Double {
    return (Double)(a + b)
}

func division(num1 a:Int, num2 b:Int) -> Double {
    if a > b {
        return (Double)(a / b)
    } else {
        return (Double)(b / a)
    }
}

func difference(num1 a:Int, num2 b:Int) -> Double {
    if a > b {
        return (Double)(a - b)
    } else {
        return (Double)(b - a)
    }
}

func power(num1 a:Int, num2 b:Int) -> Double {
    var answer:Int
    for a in 0...b {
        answer *= a
    }
    return (Double)(answer)
}

func multiplicaton(num1 a:Int, num2 b:Int) -> Double {
    return (Double)(a * b)
}

func caluculator(num1 a:Int, num2 b:Int, operators mark:(Int, Int) -> Double) -> (Int, ??){
    
}





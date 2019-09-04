//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let mark = "%"

func problem15(num1 a:Int, num2 b:Int) -> Double{
    var answer:Double = 0
    var numA = a
    var numB = b
    
    func sum() -> Double{
        answer = Double(numA + numB)
        print(answer)
        return answer
    }
    
    func minus() -> Double{
        
        if  numA > numB || numA == numB {
            answer = Double(numA - numB)
        } else {
            answer = Double(numB - numA)
        }
        print(answer)
        return answer
    }
    
    func multiplication() -> Double{
        answer = Double(numA * numB)
        print(answer)
        return answer
    }

    func division() -> Double{
        
        if numA > numB || numA == numB{
            answer = Double(numA / numB)
        } else {
            answer = Double(numB / numA)
        }
        print(answer)
        return answer
    }

    func reminder() -> Double{
        if numA > numB || numA == numB {
            answer = Double(numA % numB)
        } else {
            answer = Double(numB % numA)
        }
        print(answer)
        return answer
    }
   
    switch  mark {
    case "+":
        return sum()
        
    case "-":
        return minus()
        
    case "*":
        return multiplication()
        
    case "/":
        return division()
        
    case "%":
        return reminder()
        
    default:
        print("a")
    }
    
    return answer
}

problem15(num1: 24, num2: 6)

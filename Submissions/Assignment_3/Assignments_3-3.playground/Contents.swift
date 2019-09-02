import UIKit
//problem3
enum Calculator{
    case Sum(Int,Int)
    case Subtraction(Int,Int)
    case Multiplication(Int,Int)
    case Division(Int,Int)
    
    static func calculate(opt:Calculator)->Int{
        switch opt{
        case let .Sum(num1,num2): return num1 + num2
        case let .Subtraction(num1,num2): return num1 - num2
        case let .Multiplication(num1,num2): return num1 * num2
        case let .Division(num1,num2): return num1 / num2
        }
    }
}
let num1 = 16
let num2 = 4

var cal = Calculator.Sum(16, 4)
let sum = Calculator.calculate(opt:cal)
print("\(num1)+\(num2)=\(sum)")

cal = Calculator.Subtraction(16, 4)
let sub = Calculator.calculate(opt:cal)
print("\(num1)-\(num2)=\(sub)")

cal = Calculator.Multiplication(16, 4)
let mul = Calculator.calculate(opt:cal)
print("\(num1)*\(num2)=\(mul)")

cal = Calculator.Division(16, 4)
let div = Calculator.calculate(opt:cal)
print("\(num1)/\(num2)=\(div)")

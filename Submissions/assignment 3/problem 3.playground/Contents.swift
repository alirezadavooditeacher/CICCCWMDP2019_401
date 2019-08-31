import UIKit


enum Calculator {
    case sum((Int,Int) -> Int)
    case subtraction((Int,Int) -> Int)
    case multiplication((Int,Int) -> Int)
    case division((Int,Int) -> Int)
    
    static func calculate(num1:Int, num2:Int, opr: Calculator) -> Int {
        switch opr {
        case .sum(let f):
            return f(num1, num2)
        case .subtraction(let f):
            return f(num1, num2)
        case .multiplication(let f):
            return f(num1, num2)
        case .division(let f):
            return f(num1, num2)
        }
    }
}

let sum = Calculator.sum({(num1:Int, num2:Int) -> Int in return num1 + num2 })
let subtraction = Calculator.subtraction({(num1:Int, num2:Int) -> Int in return num1 - num2 })
let multiplication = Calculator.multiplication({(num1:Int, num2:Int) -> Int in return num1 * num2 })
let division = Calculator.division({(num1:Int, num2:Int) -> Int in return num1 / num2 })

let sumResult = Calculator.calculate(num1: 10, num2: 5, opr: sum)
let subtractionResult = Calculator.calculate(num1: 10, num2: 5, opr: subtraction)
let multiplicationResult = Calculator.calculate(num1: 10, num2: 5, opr: multiplication)
let divisionResult = Calculator.calculate(num1: 10, num2: 5, opr: division)

print(sumResult, subtractionResult, multiplicationResult, divisionResult)

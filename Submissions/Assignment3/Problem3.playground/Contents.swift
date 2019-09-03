import UIKit

enum Calculator {
    case Sum, Substraction, Multiplication, Division
    
    static func calculate(num1:Int, num2:Int, opt:Calculator)->Int?{
        switch opt {
        case .Sum:
            return num1 + num2
        case .Substraction:
            return num1 - num2
        case .Multiplication:
            return num1 * num2
        case .Division:
            return num1 / num2
        default:
            return nil
        }
    }
}

var test = Calculator.Sum
var answer = Calculator.calculate(num1: 5, num2: 6, opt: test)
print("\(test) answer: \(answer)")

test = Calculator.Substraction
answer = Calculator.calculate(num1: 8, num2: 6, opt: test)
print("\(test) answer: \(answer)")

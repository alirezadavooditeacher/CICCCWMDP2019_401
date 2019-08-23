import UIKit

// Problem 1
let num1 = 12
let num2 = 6
var result = 0
let inputOperater = "*"
func caculaterWithArgumentLabel(inputNum1 num1: Int, inputNum2 num2: Int, inputOperator keyOperator: String) -> Int? {
    switch keyOperator {
    case "+":
        result = num1+num2
        print("\(num1) + \(num2) = \(result)")
        return result
    case "-":
        result = num1-num2
        print("\(num1) - \(num2) = \(result)")
        return result
    case "*":
        result = num1*num2
        print("\(num1) * \(num2) = \(result)")
        return result
    case "/":
        if(num1 == 0 || num2 == 0){
            print("The operation is not possible because one number is zero")
        } else {
            print("\(num1) / \(num2) = \(result)")
            result = num1/num2
        }
        return result
    default:
        return nil
    }
}

caculaterWithArgumentLabel(inputNum1: num1, inputNum2: num2, inputOperator: inputOperater)


// Problem 1 without argument label
func caculater(num1: Int, num2: Int, keyOperator: String) -> Int? {
    switch keyOperator {
    case "+":
        result = num1+num2
        print("\(num1) + \(num2) = \(result)")
        return result
    case "-":
        result = num1-num2
        print("\(num1) - \(num2) = \(result)")
        return result
    case "*":
        result = num1*num2
        print("\(num1) * \(num2) = \(result)")
        return result
    case "/":
        if(num2 == 0){
            print("The operation is not possible because one number is zero")
        } else {
            print("\(num1) / \(num2) = \(result)")
            result = num1/num2
        }
        return result
    default:
        return nil
    }
}

caculater(num1: num1, num2: num2, keyOperator: inputOperater)

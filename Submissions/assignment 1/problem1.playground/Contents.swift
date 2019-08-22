import UIKit

func calculate(_ num1: Int, and num2: Int, perform opr: Character) -> Double? {
    
    guard opr != "/" || num2 != 0 else {
        print("Division by zero is not possible")
        return nil
    }
    
    let operator1 = Double(num1)
    let operator2 = Double(num2)
    var result:Double = 0;
    
    switch opr {
    case "+":
        result = operator1 + operator2
    case "-":
        result = operator1 - operator2
    case "*":
        result = operator1 * operator2
    case "/":
        result = operator1 / operator2
    default:
        print("Invalid operator")
        return nil;
    }
    
    print(result)
    return result
}
calculate(4, and:-3, perform: "/")

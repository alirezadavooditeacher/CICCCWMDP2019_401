import UIKit

func calculator(_ opr: Character) -> ((Int, Int)->Double?)? {
    
    func sum(_ num1:Int, _ num2:Int) -> Double {
        return Double(num1) + Double(num2)
    }
    
    func subtraction(_ num1:Int, _ num2:Int) -> Double {
        return Double(num1) - Double(num2)
    }
    
    func multiplication(_ num1:Int, _ num2:Int) -> Double {
        return Double(num1) * Double(num2)
    }
    
    func division(_ num1:Int, _ num2:Int) -> Double? {
        guard num2 != 0 else {
            print("Division by zero not allowed")
            return nil
        }
        return Double(num1) / Double(num2)
    }
    
    switch opr {
    case "+":
        return sum
    case "-":
        return subtraction
    case "*":
        return multiplication
    case "/":
        return division
    default:
        return nil
    }
}

if let calc = calculator("+") {
    if let result = calc(3,7) {
        print(result)
    }
}

if let calc = calculator("-") {
    if let result = calc(3,7) {
        print(result)
    }
}

if let calc = calculator("*") {
    if let result = calc(3,7) {
        print(result)
    }
}

if let calc = calculator("/") {
    if let result = calc(3,7) {
        print(result)
    }
}

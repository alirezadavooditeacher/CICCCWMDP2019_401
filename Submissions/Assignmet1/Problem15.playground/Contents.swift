import UIKit

// Problem 15
func calculator(_ opt: Character) -> ((Int, Int)->Double)? {
    
    func sum(_ num1:Int, _ num2: Int) -> Double {
        return Double(num1+num2)
    }
    
    func sub(_ num1:Int, _ num2: Int) -> Double {
        return Double(num1-num2)
    }
    
    func multiply(_ num1:Int, _ num2: Int) -> Double {
        return Double(num1*num2)
    }
    
    
    func devision(_ num1:Int, _ num2: Int) -> Double {
        return Double(num1/num2)
    }
    
    func decimal(_ num1:Int, _ num2: Int) -> Double {
        return Double(num1%num2)
    }
    
    switch opt {
    case "+":
        return sum
    case "-":
        return sub
    case "*":
        return multiply
    case "/":
        return devision
    case "%":
        return decimal
    default:
        return nil
    }
}

let num1 = 10
let num2 = 5
if let f=calculator("+") {
    print("num1+num2=\(f(num1, num2))")
}
if let f=calculator("*") {
    print("num1*num2=\(f(num1, num2))")
}

if let f=calculator("/") {
    print("num1/num2=\(f(num1, num2))")
}

if let f=calculator("-") {
    print("num1-num2=\(f(num1, num2))")
}

if let f=calculator("%") {
    print("num1%num2=\(f(25, 10))")
}


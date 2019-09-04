import Cocoa

var str = "Hello, playground"

enum Calculator {
    case Sum:(Int, Int) -> Int =  {(a, b) in return a + b }
    case Substruction:(Int, Int) -> Int =  {(a, b) in return a - b }
    case Multiplication:(Int, Int) -> Int =  {(a, b) in return a * b }
    case Division:(Int, Int) -> Int =  {(a, b) in return a / b }
    
    var calculator = Calculator
    
    static func caluculate(num1:Int, num2:Int, opt:Calculator) {
        switch opt {
        case Calculator.Sum:
           Calculator.Sum(num1, num2)
            
        case Calculator.Substruction:
            Calculator.Substruction(num1, num2)
            
        case Calculator.Multiplication:
            Calculator.Multiplication(num1, num2)
            
        case Calculator.Division(num1, num2):
            Calculator.Division(num1, num2)
        }
}

}

import Cocoa

var str = "Hello, playground"

enum Calculator {
    case Sum((Int, Int) -> Int)
    case Substruction((Int, Int) -> Int)
    case Multiplication((Int, Int) -> Int)
    case Division((Int, Int) -> Int)
    
//    var calculator = Calculator()
    
    static func caluculate(num1:Int, num2:Int, opt:Calculator) -> Int {
        switch opt {
        case .Sum(let f):
           return f(num1, num2)

        case .Substruction(let f):
            return f(num1,num2)
            
        case .Multiplication(let f):
            return f(num1, num2)
            
        case .Division(let f):
            return f(num1, num2)
        }
}

}

// f is the closure below
let sum = Calculator.Sum({(a, b) in return a + b })
let substruction =  Calculator.Substruction({(a, b) in return a - b })
let multiplicaiton = Calculator.Multiplication({(a, b) in return a * b })
let division =  Calculator.Division({(a, b) in return a / b })

let sumResult = Calculator.caluculate(num1: 3, num2: 4, opt: sum)
let substructionResult = Calculator.caluculate(num1: 7, num2: 6, opt: substruction)
let multiplicationResult = Calculator.caluculate(num1: 100, num2: 3, opt: multiplicaiton)
let divisionResult = Calculator.caluculate(num1: 100, num2: 25, opt: division)

print(sumResult)
print(substructionResult)
print(multiplicationResult)
print(divisionResult)


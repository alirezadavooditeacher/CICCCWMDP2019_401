import UIKit

func calculator(num1:Int,num2:Int,operation:String) -> (Double,(Int,Int)->Double?)? {
    
    func sum (_ num1:Int, _ num2:Int) -> Double {
        return Double(num1) + Double(num2)
    }
    func difference (_ num1:Int, _ num2:Int) -> Double {
        return Double(num1) - Double(num2)
    }
    func multiplication (_ num1:Int, _ num2:Int) -> Double {
        return Double(num1) * Double(num2)
    }
    func division (_ num1:Int, _ num2:Int) -> Double? {
        guard num2 != 0 else {
            print("Division by zero not possible")
            return nil
        }
        return Double(num1) / Double(num2)
    }
    func power (_ num1:Int, _ num2:Int) -> Double {
        let result = pow(Decimal(num1),num2)
        return Double(truncating:result as NSNumber)
    }
    
    let operationsList = [
        "sum": sum,
        "difference": difference,
        "multiplication": multiplication,
        "division": division,
        "power": power,
    ]
    
    if let f = operationsList[operation] {
        if let result = f(num1, num2) {
            return (result, f)
        } else {
            return nil
        }
    } else {
        return nil
    }
}

let operations = ["sum", "division", "difference", "power", "multiplication"]

for operation in operations {
    let randNumber1 = Int.random(in: 0 ..< 10)
    let randNumber2 = Int.random(in: 0 ..< 10)
    if let (result, function) = calculator(num1: randNumber1, num2: randNumber2, operation: operation) {
        print("\(operation) of \(randNumber1) and \(randNumber2) = \(result)")
    }
}

import UIKit

func calculator(_ opt: Character) -> ((Int, Int)->Int)? {

    func sum(_ num1:Int, _ num2: Int) -> Int {
        return num1+num2
    }

    func sub(_ num1:Int, _ num2: Int) -> Int {
        return num1-num2
    }

    func multiply(_ num1:Int, _ num2: Int) -> Int {
        return num1*num2
    }


    func devision(_ num1:Int, _ num2: Int) -> Int {
        return num1/num2
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
    default:
        return nil
    }
}

//((Int, Int)->Int)?
let num1 = 10
let num2 = 5
var result = 0
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








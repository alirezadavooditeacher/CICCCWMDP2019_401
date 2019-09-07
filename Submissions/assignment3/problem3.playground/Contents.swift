import UIKit

/* Problem3
 - Define an enum called Calculator with 4 cases:
 o Sum, Subtraction, Multiplication and Division
 o The cases have an associated value which is of type (Int, Int)-> Int
 o ケースには、タイプ（Int、Int）-> Intの関連値があります
 
 o Create a static method called calculate for the enum Calculator which takes three
 input parameters:
 § num1: An integer
 § num2: An integer
 § opt: A Calculator enum
 o This function uses a switch statement based on the opt and each case return the result of calling the function which is the associated value of the case. For instance if the opt is Sum, the function will calculate the sum of the two input integers (num1 and num2)
 o この関数は、optに基づいてswitchステートメントを使用し、各ケースは、ケースに関連付けられた値である関数の呼び出し結果を返します。 たとえば、optがSumの場合、関数は2つの入力整数（num1およびnum2）の合計を計算します
 o Test: Write some test cases to test the enum and calling the calculate method.
 
 
 */

enum Calculator {
    case Sum
    case Subtraction
    case Multiplication
    case Division
    
    static func calculate (_ num1: Int, _ num2: Int, _ opt: Calculator) -> Int {
        switch opt {
        case .Sum:
            let sum = num1 + num2
            return sum
        case .Subtraction:
            let sub = num1 - num2
            return sub
        case .Multiplication:
            let mul = num1 * num2
            return mul
        case .Division:
            let div = num1 / num2
            return div
        }
        
    }
}

let sum = (3, 5)
let sub = (6, 4)
let mul = (4, 3)
let div = (21, 7)

print("\(sum.0) + \(sum.1) = \(Calculator.calculate(sum.0,sum.1,Calculator.Sum))")
print("\(sub.0) + \(sub.1) = \(Calculator.calculate(sub.0,sub.1,Calculator.Subtraction))")
print("\(mul.0) + \(mul.1) = \(Calculator.calculate(mul.0,mul.1,Calculator.Multiplication))")
print("\(div.0) + \(div.1) = \(Calculator.calculate(div.0,div.1,Calculator.Division))")

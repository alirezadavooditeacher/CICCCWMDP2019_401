import UIKit

/*Problem15
 Write a calculator function which takes an which takes the following inputs:
 • An operator character (+, -, *, /, %)
 • Define a nested function inside the calculator function for every possible operators
 defined above.
  上記で定義されたすべての演算子に対して、電卓関数内にネストされた関数を定義します。
 • The calculator function return a functionType of (Int, Int)-> Double
  電卓関数は、（Int、Int）-> DoubleのfunctionTypeを返します
 • Assign the output of the calculator function to a variable.
  計算機関数の出力を変数に割り当てます。
 • Use the variable to show examples how the code works for different operators.
  変数を使用して、さまざまな演算子に対するコードの動作例を示します。
*/

func calculator (_ operatorSymbol: String) -> ((Int, Int) -> Double)? {

    func addition (_ num1: Int, _ num2: Int) -> Double {
        return Double(num1 + num2)
    }

    func subtraction (_ num1: Int, _ num2: Int) -> Double {
        return Double(num1 - num2)
    }

    func multiplication (_ num1: Int, _ num2: Int) -> Double {
        return Double(num1 * num2)
    }

    func division (_ num1: Int, _ num2: Int) -> Double {
        return Double(num1 / num2)
    }
    
    func remainder (_ num1: Int, _ num2: Int) -> Double {
        return Double(num1 % num2)
    }

    if operatorSymbol == "+" {
        return addition
    } else if operatorSymbol == "-" {
        return subtraction
    } else if operatorSymbol == "*" {
        return multiplication
    } else if operatorSymbol == "/" {
        return division
    } else if operatorSymbol == "%" {
        return remainder
    } else {
        return nil
    }

}


var num1 = 6
var num2 = 3

if let a=calculator("+") {
    print("\(num1) + \(num2) = \(a(num1, num2))")
}
if let s=calculator("-") {
    print("\(num1) - \(num2) = \(s(num1, num2))")
}
if let m=calculator("*") {
    print("\(num1) * \(num2) = \(m(num1, num2))")
}
if let d=calculator("/") {
    print("\(num1) / \(num2) = \(d(num1, num2))")
}
if let r=calculator("%") {
    print("\(num1) % \(num2) = \(r(num1, num2))")
}

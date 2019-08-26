import UIKit

/*
 Problem1
 - Design for a function which takes 2 operands (number) and one operator (plus, minus, multiplication and division) and applies the operator on the operands and print and return the result.
 
 2つのオペランド（数値）と1つの演算子（プラス、マイナス、乗算、除算）を受け取り、オペランドに演算子を適用して結果を出力して返す関数の設計。
 
 
 Note: If operand1 is a non-zero number and the operand2 is zero, then the program should not perform the division operand and should print the operation is not possible because one number if zero (this is only for division operator) and return nil.
 
 注：operand1がゼロ以外の数値で、operand2がゼロの場合、プログラムは除算オペランドを実行せず、1つの数値がゼロの場合（除算演算子のみ）、nilを返すため、演算を実行できません。
 
 
 - Use both argument label and parameter name for this function.
 - Re-write the same function without using an argument label for the input parameters.
 
 -この関数には引数ラベルとパラメーター名の両方を使用します。
 -入力パラメーターに引数ラベルを使用せずに同じ関数を書き直します。
 
 */


func calculator1(num1: Int, num2: Int, operator1: String) {
    if (operator1 == "+"){
        print("\(num1) + \(num2) = \(num1+num2)" )
    } else if (operator1 == "-"){
        print("\(num1) - \(num2) = \(num1-num2)" )
    } else if (operator1 == "*"){
        print("\(num1) * \(num2) = \(num1*num2)" )
    } else if (operator1 == "/"){
        if (num1 > 0 && num2 == 0){
            print("It is imposible to calculate")
        } else {
            print("\(num1) / \(num2) = \(num1/num2)" )
        }
    }
}
print("---calculator1----------------------")
calculator1(num1: 12, num2: 6, operator1: "+")
calculator1(num1: 24, num2: 3, operator1: "-")
calculator1(num1: 6, num2: 2, operator1: "*")
calculator1(num1: 3, num2: 0, operator1: "/")
print("\n")


func calculator2(_ num1: Int, _ num2: Int, _ operator1: String) {
    if (operator1 == "+"){
        print("\(num1) + \(num2) = \(num1+num2)" )
    } else if (operator1 == "-"){
        print("\(num1) - \(num2) = \(num1-num2)" )
    } else if (operator1 == "*"){
        print("\(num1) * \(num2) = \(num1*num2)" )
    } else if (operator1 == "/"){
        if (num1 > 0 && num2 == 0){
            print("It is imposible to calculate")
        } else {
            print("\(num1) / \(num2) = \(num1/num2)" )
        }
    }
}
print("---calculator2----------------------")
calculator2(5, 32, "+")
calculator2(4, 12, "-")
calculator2(6, 5, "*")
calculator2(6, 3, "/")
print("\n")


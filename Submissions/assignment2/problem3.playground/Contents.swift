import UIKit

/* Problem 3: A Calculator---------------------------------------------????????????????
 o Define an array whose type is String
 o The size (要素の数) of the array is between 5-10 (pick an arbitrary number)
 o Initialize the array with some initial values.
 いくつかの初期値で配列を初期化する(宣言と代入を同時にすること？)
 
 o The possible values the items of the array can take is following  ??????????????
 配列のアイテムが取り得る値は次のとおりです。
 § sum
 § division
 § difference
 § power
 § multiplication
 o Definea function for each of the above mathematical operations(sum,division,difference, complement, power, multiplication)
 
 o Define a dictionary as following
 § The type of key is String
 § The type of the value is a function type (Int, Int) -> Double
 
 o Define a function called calculator which takes the following as inputs:
 § Two numbers
 § An operation (which is either sum, division, difference, power or multiplication)
 
 o The calculator function returns a tuple with two parameters:
 1- the result of the operation and
 2- the operation’s corresponding function. For instance of the operation sent to the function is sum, and the two numbers are 10 and 20 the function will return a tuple which is (20, the sum function from the dictionary).
 2-操作の対応する機能。たとえば、関数に送信される演算はsumであり、2つの数値は10と20です。関数は（20、辞書からのsum関数）であるタプルを返します。
 
 o Write a for-loop and iterate over the items of the array of the operations and call the calculator function for each item of the array.
 
 forループを記述して、操作の配列の項目を反復処理し、配列の各項目に対して計算機関数を呼び出します。
 */

let operations = ["+","/","-","^","*"]

func sum (_ num1: Int, _ num2: Int) -> Double {
    return Double(num1 + num2)
}

func division (_ num1: Int, _ num2: Int) -> Double {
    return Double(num1 / num2)
}

func difference (_ num1: Int, _ num2: Int) -> Double {
    return Double(num1 - num2)
}

func power (_ num1: Int, _ num2: Int) -> Double {
    return pow(Double(num1), Double(num2))
}

func multiplication (_ num1: Int, _ num2: Int) -> Double {
    return Double(num1 * num2)
}

var dictionary = [String : (Int, Int) -> Double]()


func calculator (_ num1: Int, _ num2: Int, _ operation: String) -> (Double, (Int, Int) -> Double) {
    
    if operation == "+" {
        let add = sum(num1, num2)
        return (add, sum)
        
    } else if operation == "/" {
        let div = division(num1, num2)
        return (div, division)
        
    } else if operation == "-" {
        let sub = difference(num1, num2)
        return (sub, difference)
        
    } else if operation == "^" {
        let pow = power(num1, num2)
        return (pow, power)
    } else /* if operation == "*" */ {
        let mul = multiplication(num1, num2)
        return (mul, multiplication)
    }
    
}

for operation in operations {
    let result = calculator(10,20,operation)
        
    let res = result.1(10,20)
        
    print(res)
}

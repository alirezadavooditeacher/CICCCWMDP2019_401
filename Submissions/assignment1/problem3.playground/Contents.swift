import UIKit

/* Problem3
 Design a function which receives a number as input parameter and adds the numbers
 together and returns the results. If the number is negative the function will return nil
 instead.
 
 入力パラメーターとして数値を受け取り、数値を加算して結果を返す関数を設計します。
 数値が負の場合、関数は代わりにnilを返します。
*/

func plus(_ numbers: Double...) -> Double? {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    if (total < 0){
        return nil
    } else {
        return total
    }
}
plus(1,2,3,4,5)

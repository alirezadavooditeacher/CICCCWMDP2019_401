import UIKit

/*
 Write a function which takes two integer numbers and swaps their values. Use inout parameter.
*/

func swap(_ num1: inout Int, _ num2: inout Int) {
    print(num1, num2)
    var temp = num1
    num1 = num2
    num2 = temp
    print(num1, num2)
}
var num1 = 3
var num2 = 10
swap(&num1, &num2)

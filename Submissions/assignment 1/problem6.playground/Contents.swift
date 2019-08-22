import UIKit

func swap(_ num1:inout Int, _ num2:inout Int) {
    let temp = num1
    num1 = num2
    num2 = temp
}
var num1 = 4
var num2 = 9
swap(&num1,&num2)
print(num1, num2)

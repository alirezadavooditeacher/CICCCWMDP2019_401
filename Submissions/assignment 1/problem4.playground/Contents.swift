import UIKit

func calculator(num1:Int, num2:Int) {
    
    func checkBetween(_ num1:Int, _ num2:Int) {
        for value in (num1 + 1)..<num2 {
            if value % 3 == 0 && value % 5 == 0 {
                print(value)
            }
        }
    }
    
    func checkPartial(_ num1:Int, _ num2:Int) {
        for value in num1..<num2 {
            if value % 6 == 0 || value % 7 == 0 {
                print(value)
            }
        }
    }
    
    func checkAll(_ num1:Int, _ num2:Int) {
        for value in num1...num2 {
            if value % 3 != 0 {
                print(value)
            }
        }
    }
    
    checkBetween(num1, num2)
    checkPartial(num1, num2)
    checkAll(num1, num2)
}
calculator(num1:4, num2:10)

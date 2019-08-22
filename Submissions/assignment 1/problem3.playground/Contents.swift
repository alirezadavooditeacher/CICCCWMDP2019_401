import UIKit

func sumNumbers(_ num:Int) -> Int? {
    var result = 0;
    var number = num
    
    repeat {
        result += number % 10
        number = Int(number / 10)
    } while(number > 0)
    
    if result < 0 {
        return nil
    }
    return result
}
let result = sumNumbers(268)
if let res = result {
    print(res)
} else {
    print("Negative result")
}

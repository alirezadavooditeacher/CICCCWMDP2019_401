import UIKit

// Problem 3
func addNum(inputNum num: Int) -> Int?{
    var resultAdd = 0
    if num < 0 {
        return nil
    } else {
        
        for _ in String(num).indices {
            resultAdd += num % 10
        }
        return resultAdd
    }
}
addNum(inputNum: 566)


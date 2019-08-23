import UIKit

// Problem 8
func findNumFromList(findNum keyNum: Int, listOfNum numbers: Int...) -> Bool {
    var boolResult = false
    for number in numbers {
        if number == keyNum {
            boolResult = true
            break
        }
    }
    return boolResult
}
findNumFromList(findNum: 2, listOfNum: 1,2,3,4,5)


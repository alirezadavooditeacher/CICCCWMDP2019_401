import UIKit

// Problem 9
func removeNumFromList(findNum keyNum: Int, listOfNum numbers: [Int]) -> [Int] {
    var newList = [Int]()
    for number in numbers {
        if number != keyNum {
            newList.append(number)
        }
    }
    return newList
}
var listOfNumbers: [Int] = [1,2,3,4,5]
removeNumFromList(findNum: 2, listOfNum: listOfNumbers)

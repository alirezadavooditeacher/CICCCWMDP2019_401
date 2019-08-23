import UIKit

// Problem 12
func findDistinctNum(lisfOfNum:[Int]) -> [Int]{
    
    var listOfNums = lisfOfNum
    listOfNums.sort()
    var resultList = [Int]()
    var previousNum:Int = listOfNums[0]
    var previousCnt:Int = 1
    
    for index in listOfNums.indices {
        if index > 0 {
            if previousNum == listOfNums[index]{
                previousCnt += 1
            } else {
                if previousCnt < 2 {
                    resultList.append(previousNum)
                }
                previousNum = listOfNums[index]
                previousCnt = 1
            }
            
        }else {
            previousNum = listOfNums[index]
        }
    }
    
    if previousCnt < 2 {
        resultList.append(previousNum)
    }
    return resultList
    
}

let l = findDistinctNum(lisfOfNum: [1,2,3,4,5,2,4])
print(l)

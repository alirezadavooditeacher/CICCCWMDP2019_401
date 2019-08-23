import UIKit

// Problem 11
func findSameNum(lisfOfNum:[Int]) -> (Int,Int)?{
    
    guard !lisfOfNum.isEmpty else {
        return nil
    }
    
    var listOfNums = lisfOfNum
    listOfNums.sort()
    var (num,count) = (listOfNums[0],0)
    var previousNum:Int = listOfNums[0]
    var previousCnt:Int = 1
    
    for index in listOfNums.indices {
        if index > 0 {
            if previousNum == listOfNums[index]{
                previousCnt += 1
            } else {
                
                if previousCnt > count {
                    num = previousNum
                    count = previousCnt
                }
                previousNum = listOfNums[index]
                previousCnt = 1
                
            }
            
        }else {
            previousNum = listOfNums[index]
        }
    }
    if previousCnt > count {
        num = previousNum
        count = previousCnt
    }
    return (num,count)
}

let k = findSameNum(lisfOfNum: [1,2,3,4,5,2,4])
print(k)

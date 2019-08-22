import UIKit

func removeRepeated(list:[Int]) -> [Int] {
    
    let originalList = Set<Int>(list)
    let newList = [Int](originalList)
    
    return newList
}
let result = removeRepeated(list: [2,8,1,6,3,7,2,7,2,1,1])
print(result)

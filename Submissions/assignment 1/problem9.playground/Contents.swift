import UIKit

func remove(num:Int, inList list:Set<Int>) -> Set<Int> {
    
    let occurences = [num]
    let newList = list.subtracting(occurences)
    return newList
    
}
let list = Set<Int>([7,9,2,4,6,3])
let newList = remove(num: 7, inList: list)
print(newList)

import UIKit

func missingNumbers(arr: [Int], brr: [Int]) -> [Int] {
    
    var listA = [Int:Int] ()
    var listB = [Int:Int] ()
    var missing = [Int]()
    for element in arr {
        if let val = listA[element] {
            listA.updateValue(val + 1, forKey: element)!
        } else {
            listA[element] = 1
        }
    }
    for element in brr {
        if let val = listB[element] {
            listB.updateValue(val + 1, forKey: element)!
        } else {
            listB[element] = 1
        }
    }
    for (index, value) in listB {
        if let each = listA[index] {
            if each != value {
                missing.append(index)
            }
        } else {
            missing.append(index)
        }
    }
    let newArray = missing.sorted()
    return newArray
}
print(missingNumbers(arr: [203, 204, 205, 206, 207, 208, 203, 204, 205, 206], brr: [203, 204, 204, 205, 206, 207, 205, 208, 203, 206, 205, 206, 204]))

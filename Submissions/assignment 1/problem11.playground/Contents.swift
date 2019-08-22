import UIKit

func numberOfOcurrences(list:[Int]) -> (Int, Int)? {
    
    guard !list.isEmpty else {
        return nil
    }
        
    var mapOccurences = [Int: Int]()
    var topOcurrence = 1
    var topNumber = list[0]
    
    for value in list {
        if var currentValue = mapOccurences[value] {
            currentValue = currentValue + 1
            mapOccurences[value] = currentValue
            let currentIndex = list.firstIndex(of: value)!
            let previousIndex = list.firstIndex(of: topNumber)!
            if currentValue >= topOcurrence && currentIndex <= previousIndex {
                topOcurrence = currentValue
                topNumber = value
            }
        } else {
            mapOccurences[value] = 1
        }
    }
    
    return (topNumber, topOcurrence)
}
let result = numberOfOcurrences(list: [2,8,1,6,3,7,2,7,2,1,1])
print(result)

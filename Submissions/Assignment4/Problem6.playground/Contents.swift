import UIKit

func missingNumbers(arr: [Int], brr: [Int]) -> [Int] {
    
    var dBrr = [String:Int]()
    var dArr = [String:Int]()
    var output = [Int]()
    
    for numB in brr {
        
        if let cnt = dBrr[numB.description]{
            dBrr[numB.description] = cnt + 1
        } else {
            dBrr[numB.description] = 1
        }
        
    }
    
    for numA in arr {
        if let cnt = dArr[numA.description]{
            dArr[numA.description] = cnt + 1
        } else {
            dArr[numA.description] = 1
        }
    }
    
    for key in dBrr.keys {
        if let cntA = dArr[key] {
            if let cntB = dBrr[key] {
                if cntB > cntA {
                    output.append(Int(key)!)
                }
            }
        } else {
            output.append(Int(key)!)
        }
    }
    
    return output.sorted()
}
missingNumbers(arr: [203,204,205,206,207,208,203,204,205,206], brr: [203,204,204,205,206,207,205,208,203,206,205,206,204])

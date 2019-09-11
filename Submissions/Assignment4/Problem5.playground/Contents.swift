import UIKit

func palindromeIndex(s: String) -> Int {
    
    let sReverse = String(s.reversed())

    guard s != sReverse else {
        return -1
    }

    let max = s.count
    var returnIndex:Int = -1

    for i in 0...max - 1 {
        let seachString = s.suffix(max - i)
        if seachString == String(seachString.reversed()){
            if i != max - 1 {
                returnIndex = i - 1
                return returnIndex
            } else {
                returnIndex = i
            }
        }
    }

    if returnIndex == max - 1 {
        for i in 0...max - 1 {
            let seachString = s.prefix(max - i)
            if seachString == String(seachString.reversed()){
                if i != max - 1 {
                    returnIndex = max - i
                    return returnIndex
                } else {
                    returnIndex = i
                }
            }
        }
    }
    returnIndex = -1
    return returnIndex
}
print("\(palindromeIndex(s: "aaab"))")


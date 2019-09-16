import Cocoa

var str = "Hello, playground"

func isFrequency(arr:[Int], brr:[Int]) -> [Int]{
    var missingArr:[Int] = []
    for valueBrr in brr{
        if !arr.contains(valueBrr){
            missingArr.append(valueBrr)
        }
    }
    
    missingArr.sort{$0 < $1}
    
    return missingArr
}

print(isFrequency(arr: [1,7,5,3], brr: [56,7,2,9,100]))

//var array = s
//var missingArr:[Character] = []
//for x in 0 ..< array.count {
//    for y in 1..<s.count {
//        if array[array.index(array.startIndex, offsetBy: x)] == array[array.index(array.startIndex, offsetBy: y)]{
//            let removedChar = array.remove(at: array.index(array.startIndex, offsetBy: x))
//            missingArr.append(removedChar)
//        }
//    }
//}
//return array
//}

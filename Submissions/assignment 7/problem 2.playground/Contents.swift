import UIKit

//we use T as a generic type, so it works for Int, String, Double...
func swapPositions<Element>(_ item1: Int, _ item2: Int, in arr: inout [Element]) -> [Element] {
    guard arr.indices.contains(item1) && arr.indices.contains(item2) else {
        return arr
    }
    let temp = arr[item1]
    arr[item1] = arr[item2]
    arr[item2] = temp
    return arr
}

var stringArr = ["this", "is", "a", "string"]
swapPositions(3, 1, in: &stringArr)
print(stringArr)

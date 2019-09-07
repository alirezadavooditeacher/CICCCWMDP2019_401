import UIKit

class MySort {
    var items = [Int]()
    var sorting: (inout [Int]) -> Void {
        return {(num: inout [Int]) -> Void in }
    }
}

class MyBubbleSort: MySort {
    override var sorting: (inout [Int]) -> Void {
        return {(num: inout [Int]) -> Void in
            for i in 0..<num.count {
                for j in 1..<num.count - i {
                    if num[j] < num[j-1] {
                        let tmp = num[j-1]
                        num[j-1] = num[j]
                        num[j] = tmp
                    }
                }
            }
        }
    }
}

class MyInsertionSort: MySort {
    override var sorting: (inout [Int]) -> Void {
        return {(num: inout [Int]) -> Void in
            for x in 1..<num.count {
                var y = x
                while y > 0 && num[y] < num[y - 1] {
                    num.swapAt(y - 1, y)
                    y -= 1
                }
            }
        }
    }
}

let bubbleSort = MyBubbleSort()
bubbleSort.items = [7,9,2,5,3,8,1,6,4]
bubbleSort.sorting(&bubbleSort.items)
print(bubbleSort.items)

let insertionSort = MyInsertionSort()
insertionSort.items = [7,9,2,5,3,8,1,6,4]
insertionSort.sorting(&insertionSort.items)
print(insertionSort.items)

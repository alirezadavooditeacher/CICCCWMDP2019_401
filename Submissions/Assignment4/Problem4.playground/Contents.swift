import UIKit

class MySort {
    
    var items = [Int]()
    var sorting: (inout[Int]) -> Void {
        return {(nums:inout[Int]) -> Void in }
    }
}

class MyBubbleSort: MySort {
    
    override var sorting: (inout[Int]) -> Void {
        return { (nums:inout[Int])->Void in
            for i in 0..<nums.count {
                for j in 1..<nums.count {
                    if nums[j] < nums[j-1] {
                        let tmp = nums[j-1]
                        nums[j-1] = nums[j]
                        nums[j] = tmp
                    }
                }
            }
            
            print("\(nums)")
        }
    }
}

class MyInsertionSort:MySort  {
    
    override var sorting: (inout [Int]) -> Void {
        return { (nums:inout [Int]) -> Void in
            var a = nums
            for x in 1..<a.count {
                var y = x
                while y > 0 && a[y] < a[y - 1] { // 3
                    a.swapAt(y - 1, y)
                    y -= 1
                }
            }
            nums = a
            print("\(nums)")
        }
    }
    
}

var myBubbleSort = MyBubbleSort()
myBubbleSort.items = [7,2,9,4,5,8]
myBubbleSort.sorting(&myBubbleSort.items)


var myInsertionSort = MyInsertionSort()
myInsertionSort.items = [7,2,9,4,5,8]
myInsertionSort.sorting(&myInsertionSort.items)

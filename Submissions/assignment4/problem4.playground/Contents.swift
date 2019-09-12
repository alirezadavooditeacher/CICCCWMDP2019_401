import Cocoa

var str = "Hello, playground"

class MySort {
    var items:[Int] = []
    var sorting:(inout [Int]) -> Void{
        return {(arr: inout [Int]) in print(arr)}
    }
}

func isAcsend(array:[Int]) -> Bool{
    var isAscend = true
    for index in 0 ..< array.count - 1{
        if array[index] > array[index + 1]{
            isAscend = false
        }
    }
    
    return isAscend
}



class MyBubbleSort: MySort {
    override var sorting:(inout [Int]) -> Void{
        return { (arr: inout [Int]) -> Void in
            for i in 0..<arr.count {
                for j in 1..<arr.count {
                    if arr[j] < arr[j-1] {
                        let tmp = arr[j-1]
                        arr[j-1] = arr[j]
                        arr[j] = tmp
                    }
                }
            }
          
//            repeat {
//                 // cuz don't need to compare last num to last num
//            for index1 in 0 ..< arr.count - 1{
//                for index2 in 1 ..< arr.count{
//                    if arr[index1] < arr[index2]{
//                       let temp = arr[index2]
//                        arr[index2] = arr[index1]
//                        arr[index1] = temp
//                    }
//                }
//            }
                print(arr)
//
//                // check if the array was sorted in the ascending order
//            }while(!isAcsend(array:arr))
//
        }
    }
}
class MyInsertionSort: MySort {
    override var sorting: (inout [Int]) -> Void {
        return { (arr:inout [Int]) -> Void in
        for index in 1..<arr.count {
            var y = index
            while y > 0 && arr[y] < arr[y - 1] {
                arr.swapAt(y - 1, y)
                y -= 1
            }
        }
       print(arr)
        
        }
    }
}

let numbers = [2,5,8,9,5,3,2]
let bubble = MyBubbleSort()
bubble.items = numbers
bubble.sorting(&bubble.items)
print(bubble.items)

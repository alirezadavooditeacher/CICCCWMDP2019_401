import UIKit

class MySort{
    var items = [Int]()
    var sorting: ([Int])-> Void{
        get{
            sort(arr:items)
            return sort
        }
    }
    func sort(arr:[Int])->Void{
        print("Array:\(arr)")
        let bubble = Bubble()
        let r1 = bubble.MyBubbleSort(arr: arr)
        print("Bubble Sort: \(r1)")
        
        let insert = Insertion()
        let r2 = insert.MyInsertionSort(arr: arr)
        print("Insertion Sort: \(r2)")
    }
}

class Bubble{
    func MyBubbleSort(arr:[Int]) -> [Int]{
        var arr1 = arr
        var temp = 0
        var flag = 0
        repeat {
            flag = 0
            for i in 0..<arr1.count-1{
                if arr1[i] > arr1[i+1]{
                    temp = arr1[i+1]
                    arr1[i+1] = arr1[i]
                    arr1[i] = temp
                    flag = 1
                }
            }
        }while(flag != 0)
        return arr1
    }
}

class Insertion{
    func MyInsertionSort(arr:[Int])-> [Int]{
        var arr1 = arr
        var keep = 0
        var index = 0
        var count = 0
        for i in 1..<arr.count{
            keep = arr1[i]
            index = i
            for j in stride(from:i-1, through: 0, by: -1){
                if keep < arr1[j]{
                    arr1[j+1] = arr1[j]
                    count += 1
                }
            }
            arr1[index-count] = keep
            index = 0
            count = 0
        }
        return arr1
    }
}

var Sorting = MySort()
Sorting.items = [4,8,0,3,1,2,6]
Sorting.sorting




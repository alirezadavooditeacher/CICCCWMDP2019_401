import UIKit

func Missing(size1:Int,list1:[Int],size2:Int,list2:[Int]){
    if size1 != list1.count{print("list1 size is wrong")}
    if size2 != list2.count{print("list2 size is wrong")}
    if size2 < size1{print("size2 must be greater than size1")}
    
    var temp = list2
    for value in list1{
        for i in 0..<temp.count{
            if value == temp[i]{
                temp.remove(at: i)
                break
            }
        }
    }
    print("list1:\(list1)\nlist2:\(list2)")
    print("Missing Number:\(temp)")

}

Missing(size1: 5,
        list1: [1,4,2,1,3],
        size2: 8,
        list2: [5,3,5,2,1,1,3,4])

import UIKit

func exchange<I>(Index1: inout Int, Index2: inout Int, arr: inout [I]){
    let temp = arr[Index1]
    arr[Index1] = arr[Index2]
    arr[Index2] = temp
    print(arr)
}
var Arr1 = [3,6,3,5,7]
var A = 0
var B = 3
exchange(Index1: &A, Index2: &B, arr: &Arr1)
var Arr2 = ["q","r","s","w"]
exchange(Index1: &A, Index2: &B, arr: &Arr2)

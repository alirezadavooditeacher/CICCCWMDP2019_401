import UIKit

func exchangePosition<T>(index1:Int, index2:Int,array:inout [T]){

    let item1 = array[index1]
    array[index1] = array[index2]
    array[index2] = item1
    
}
var arrayString = ["AA","BB","CC","DD","EE"]
exchangePosition(index1: 1, index2: 3, array: &arrayString)
print(arrayString)

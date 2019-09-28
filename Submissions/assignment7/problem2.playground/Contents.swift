import UIKit

/* Problem2
 Write a generic method to exchange the positions of two different elements in an array. The method receives 3 inputs:
 • Index of item 1(index1)
 • Index of item 2 (index2)
 • An array


 The method exchange the items located at index1 and index2 and return the new array.
 Now call the generic method you defined for a sample list (array) of strings.

 */

func exchange<T>(_ index1: Int, _ index2: Int, _ arr: [T]) -> [T] {
    var newarr = arr
    let index1Ofarr = arr[index1]
    let index2Ofarr = arr[index2]
    newarr.remove(at: index1)
    newarr.insert(index2Ofarr, at: index1)
    newarr.remove(at: index2)
    newarr.insert(index1Ofarr, at: index2)
    return newarr
}

print(exchange(3, 5, [0,1,2,3,4,5]))

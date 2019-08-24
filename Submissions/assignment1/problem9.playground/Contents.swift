import UIKit

/*
 Design and implement a function which receives two input parameters 1) a list of integer
 numbers and 2) a number. The function will find any occurrence of the given input
 number in the list and remove the number from the list and finally will return the new list.
*/

func findNum (_ set: Set<Int>, _ num: Int) -> Set<Int> {
    var set = set
    for i in set {
        if (i == num) {
            set.remove(num)
        }
    }
    return set
}

print(findNum([1,2,3,4,5], 3))

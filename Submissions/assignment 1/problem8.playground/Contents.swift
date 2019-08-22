import UIKit

func findNumber(_ num:Int, in list:Int...) {
    
    let listSet = Set<Int>(list)
    if listSet.contains(num) {
        print("This number is in the list")
    } else {
        print("This number is not in the list")
    }
}
findNumber(7, in: 5,8,9,3,2)

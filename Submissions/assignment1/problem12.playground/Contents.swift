import UIKit

/*
 Write a function which receives a list of integer which may contains repeated numbers.
 The function remove the repeated numbers and keeps the distinct number. The function
 should return the list of distinct numbers.
*/

func distinct (_ numbers: [Int]) {
    var repeatedlist = [Int]()
    var numcnt = -1
    var distinctlist = [Int]()
    print("list\n\(numbers)\n")
    
    
    for i in numbers {
        for j in numbers {
            if i == j {
                numcnt += 1
            }
        }
        repeatedlist.append(numcnt)
        numcnt = -1
    }
    
    print("repeated list\n\(repeatedlist)\n")
    // How to take index number
    for item in repeatedlist.enumerated(){
        if item.element==0 {
            distinctlist.append(numbers[item.offset])
        }
    }
    
    // wrong way how to take index number
//    for k in repeatedlist {
//
//        if let index = repeatedlist.index(of: k){ // repeatedlist.index(of: k) is index number of k
//            if  k == 0 {
//                distinctlist.append(numbers[index])
//            }
//        }
//    }
    
    print("distinct numbers\n \(distinctlist)")
}


var numbers = [1,3,5,1,3,2,4] // [5,2,4]
distinct(numbers)

//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var listNum:[Int] = [1,3,2,6,9,6,4,7]
var repeatedNum = 0

func repeated(list a:[Int]){
    for index1 in a.enumerated(){
        for index2 in a.enumerated() {
            
            // offset meaning is index number
            if a[index1.offset] == a[index2.offset] && (index1.offset != index2.offset) {
                repeatedNum += 1
            }
        }
        
    }
    
    print(repeatedNum-1)
}
repeated(list: listNum)

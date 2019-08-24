//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func removeRepeat(list a:[Int]){
    
    // Set doesn't have repeated number and you can't have order
    var newList = Set<Int>(a)
    print(newList)
}
var list = [1,5,8,6,3,1]
removeRepeat(list: list)

print()

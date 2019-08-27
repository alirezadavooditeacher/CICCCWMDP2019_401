//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// you can change this value. Depends on this value the result will be changed.
// if you assign true to this value the ascend function will be happend
// otherwise the descend function will be happend.
var isAscend = false

var arr = [String]()

func problem14(word1 a:String, word2 b:String, _ isA:Bool) -> [String]{
    
    func ascend(_ boolean:Bool) -> [String]{
        if a < b {
            arr.append(a)
            arr.append(b)
            print("hi")
        } else {
            arr.append(b)
            arr.append(a)
            print("hey")
        }
        
        print(arr)
        return arr
    }
    
    func descend(_ boolean:Bool) -> [String]{
        if a > b {
            arr.append(a)
            arr.append(b)
            print("rose")
        } else {
            arr.append(b)
            arr.append(a)
            print("henri")
        }
        
        print(arr)
        return arr
    }
    
    if isA == true {
        ascend(isAscend)
    } else {
        descend(isAscend)
    }
    
    return arr
}

problem14(word1: "Rose", word2: "Henrique", isAscend)


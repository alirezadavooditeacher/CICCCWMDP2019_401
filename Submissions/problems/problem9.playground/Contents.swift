//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var list1 = [1,2,6,3,5,8,0]
var which:Int = 2

func addRemove(_ list:inout Array<Int>, num b:Int) -> Array<Int>?{
    print("do you want to give or remove number? \nif give, press 1, otherwise press 2")
    
    var newList = [Int]()
    
    if which == 1 {
        list.append(b)
        print(list)
        return list
    }
    else if which == 2 {
        // value is the element in list
        for value in list{
            
            //  if the element is taken out, the num of list.count  is changed. That's why fatal erorr shows
            //            if list[index] == b {
            //                removeIndex = index
            //               break
            //            }
            
            if(value != b) {
                newList.append(value)
            } else {
                continue
            }
        }
        
        print(newList)
        return newList
    }
    else {
        return nil
    }
    
}

addRemove(&list1, num: 6)

//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//problem2

func shape1() {
    print("*****")
    print(" *** ")
    print("  *   ")
}

shape1()

func shape2(){
    var num:Int = 1
    for _ in 1...5 {
        for _ in 1...num {
            print("*", terminator: "")
        }
        print()
        num += 1
    }
}

shape2()

print()


func shape3() {
    var num:Int = 5
    for _ in 1...num {
        for _ in 1...num {
            print("*", terminator: "")
        }
        print()
        num -= 1
    }
    
}

shape3()

print()


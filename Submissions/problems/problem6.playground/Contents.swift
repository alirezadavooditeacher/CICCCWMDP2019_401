//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func swapped(num1 a:inout Int, num2 b:inout Int) {
    print("first: \(a) and \(b)")
    let temp:Int = a
    a = b
    b = temp
    
    print("swapped: \(a) and \(b)")
}

var int1 = 12
var int2 = 44

swapped(num1: &int1, num2: &int2)

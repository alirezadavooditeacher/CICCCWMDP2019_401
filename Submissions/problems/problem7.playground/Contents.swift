//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func palindrome(sentence s:String) -> Int?{
    let reverse = String(s.reversed())
    
    if s.isEmpty {
        print("This is nil")
        return nil
    }
    
    if s == reverse {
        return 1
    }
    else {
        print("this is not the palindrome")
        return 0
    }
    
}


var answer1 = palindrome(sentence:"")

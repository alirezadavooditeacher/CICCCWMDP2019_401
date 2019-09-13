//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"



extension String {
    func isPalindrome () -> Bool{
        if self == String(self.reversed())   {
            return true
        }
        return false
    }
    
    func reverseIt()-> String {
        return String(self.reversed())
    }
    
}



extension String {
    var countIndex:Int{
        return self.count
    }
    
    func uppercase() -> String {
        return String(self.uppercased())
    }
}

var s = "abba"
var palindrome = s.isPalindrome()
print("is it a palindrome? \(palindrome)")

var s2 = "Happy Birthday"
var indexNum = s2.countIndex
print("how many letters does it have: \(indexNum)")
var upperCased = s2.uppercase()
print(upperCased)




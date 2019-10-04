//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

struct Student {
    let firstName:String
    let lastName:String
    let gpa:Int
    
    static func studentIDGenerate () -> String {
        var result:String = ""
        var temp: Int
        var digit:String
        for _ in 1...5 {
            temp = Int.random()
            digit = String(temp)
            result += digit
        }
        return result
    }
    
    let studentID:String = studentIDGenerate()
}
//var dictionary:[String:Student] =

let a = Student.init(firstName: "shihomi", lastName: "kitajima", gpa: 16)
print(a.studentID)
.

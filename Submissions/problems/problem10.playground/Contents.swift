//: Playground - noun: a place where people can play

import UIKit

var student1 = ["English":78, "math":69, "science":87, "society":89, "Japanese":64] as [String : Int]
var student1Name = "Shihomi"

var student2 = ["English":100, "math":89, "science":85, "society":88, "Japanese":80] as [String : Int]
var student2Name = "Lucas"


func GPA(studentA a:[String:Any], studentB b:[String:Any]) -> (String, Double){
    
    var sumA:Double = 0
    var sumB:Double = 0
    
    
    var maxGpa:Double = 0
    
    for value in a.values {
        sumA += value as! Double
    }
    
    for value in b.values {
        sumB += value as! Double
    }
    
    let gpaA:Double = sumA / 5
    let gpaB:Double = sumB / 5
    
    if gpaA > gpaB {
        maxGpa = gpaA
        print(student1Name, maxGpa)
        return (student1Name, maxGpa)
    } else {
        maxGpa = gpaB
        print(student2Name, maxGpa)
        return (student2Name, maxGpa)
}

}

GPA(studentA: student1 as [String : AnyObject], studentB: student2 as [String : AnyObject])

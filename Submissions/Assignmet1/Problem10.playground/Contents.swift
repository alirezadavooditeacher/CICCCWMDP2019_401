import UIKit

// Problem 10
let studentInfo1 = ("Ali",67,87,90,45,80)
let studentInfo2 = ("Mike",67,87,10,90,39)
let studentInfo3 = ("Shoko",80,87,90,100,20)

let Infos = [studentInfo1,studentInfo2,studentInfo3]

func caculateGPA(data:[(String,Int,Int,Int,Int,Int)]) -> (String,Int){
    var allInfo:[String:Int] = [:]
    var rName :String = ""
    var rScore:Int = 0
    
    for d in data {
        allInfo[d.0] = (d.1 + d.2 + d.3 + d.4 + d.5)/5
    }
    
    var maxScore = allInfo.values.max()
    for (key,value) in allInfo {
        if value == maxScore {
            rName = key
            rScore = value
            break
        }
    }
    return (rName,rScore)
}
caculateGPA(data: Infos)

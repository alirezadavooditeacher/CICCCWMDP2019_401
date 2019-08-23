import UIKit

// Problem 4
func divisivleCalutater(startNum: Int, endNum: Int){
    var dThreeAndFive: String = ""
    var dSixOrSeven: String = ""
    var notDThree: String = ""
    
    for index in startNum...endNum {
        let caculateNum = index + startNum
        
        if caculateNum != startNum || caculateNum != endNum {
            if caculateNum % 3 == 0 && caculateNum % 5 == 0 {
                dThreeAndFive += String(caculateNum)
            }
        }
        
        if caculateNum != endNum {
            if caculateNum % 6 == 0 || caculateNum % 7 == 0 {
                dSixOrSeven += String(caculateNum)
            }
        }
        
        if !(caculateNum % 3 == 0) {
            notDThree += String(caculateNum)
        }
    }
    print("The numbers can divide by 3 and 5 is \(dThreeAndFive)")
    print("The numbers can divide by 6 or 7 is \(dSixOrSeven)")
    print("The numbers can't divide by 3 is \(notDThree)")
}

divisivleCalutater(startNum: 1, endNum: 20)

import UIKit
//problem2-5
func filter(list:[Int], predicate: [(Int)->Bool] ) -> [Int]?{
    var fList1 = [Int]()
    var fList2 = [Int]()
    var fList3 = [Int]()
    var fList4 = [Int]()
    for value in list{
        if predicate[0](value) == true{  // odd number
            fList1.append(value)
        }
        if predicate[1](value) == true{  //prime number
            fList2.append(value)
        }
        if predicate[2](value) == true{ //odd and prime
            fList3.append(value)
        }
        if predicate[3](value) == true{ // divisible by 7
            fList4.append(value)
        }
    }
    return fList4   // change here to chose the nth predicate result (fList1 or fList2 or fList3 or fList4)
    
}

let NumList = [2,5,16,7,23,21,49]  // input list
print("List:\(NumList)")

if let filterAns = filter(list:NumList,predicate:[
    {   (input:Int)->Bool in
            if input % 2 != 0{
                return true
            }else{ return false }
    },
    {   (input:Int)->Bool in
        var ans = true
        if input < 2 { ans = false }
        else if input > 2 && input % 2 == 0 { ans = false}
        else{
            for i in 2..<input{
                if  input % i == 0{
                    ans = false
                }
            }
        }
        return ans
    },
    {   (input:Int)->Bool in
        var ans = true
        if input <= 2 { ans = false }
        else if input > 2 && input % 2 == 0 { ans = false}
        else{
            for i in 2..<input{
                if  input % i == 0{
                    ans = false
                }
            }
        }
        return ans
    },
    { (input:Int)->Bool in
        if input % 7 == 0{return true}
        else{return false}
    }]){
        print("Ans:\(filterAns)")
        }



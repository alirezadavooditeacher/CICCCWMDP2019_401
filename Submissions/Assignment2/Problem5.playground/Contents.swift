import UIKit

func filter(list:[Int],predicates:[(Int)->Bool])->[Int]?{
    var answer = [Int]()
    
    for num in list {
        if predicates[0](num), predicates[1](num),predicates[2](num),predicates[3](num){
            answer.append(num)
        }
    }
    return answer
}

let listOfPositiveNum = [1,2,3,4,5,6,7,8,9,10]
let predicate1 = { (num:Int) -> Bool in return num / 2 != 0 ? true: false }
let predicate2 = { (num:Int) -> Bool in
    
    guard num != 1 else {
        return false
    }
    
    for Parameter in 2..<num{
        if num % Parameter == 0{
            return false
        }
    }
    return true
}

let predicate3 = {(num:Int) -> Bool in
    
    guard num != 1 else {
        return false
    }
    
    for Parameter in 2..<num{
        if num % Parameter == 0{
            return false
        }
    }
    
    if num / 2 != 0 {
        return true
    } else {
        return false
    }
}

let predicate4 = {(num:Int) -> Bool in return num % 7 == 0 ? true: false}

let fnc = filter(list: listOfPositiveNum, predicates: [predicate1,predicate2,predicate3,predicate4])
print("Answer: \(fnc)")


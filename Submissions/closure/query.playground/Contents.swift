//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var predicate1:(Int) -> Bool = {(num:Int) -> Bool in return num %  2 == 1}

func predicate2(num1:Int) -> Bool{
    
    var isPrime = true
    
    for num2 in 1...num1{
        if num2 == 1 || num2 == num1 {
            continue
        }
        if num1 % num2 == 0 {
            isPrime = false
            break
        }
    }
    
    return isPrime
}

func predicate3(num:Int) -> Bool{
    
    var isOddPrime = false
    if predicate1(num) == true && predicate2(num1:num) == true {
        isOddPrime = true
    }
    
    return isOddPrime
}

func predicate4(num:Int) -> Bool {
    var isDividedSeven = false
    if num % 7 == 0{
        isDividedSeven = true
    }
    return isDividedSeven
}



func filter(numList:[Int], predicates:[(Int) -> Bool]) -> [Int]?{
   
    
    var arrAnswer = [Int]()
    
    
    for num in numList {
        var isAppend = true
        
        for predicate in predicates {
            
            if !predicate(num) {
                isAppend = false
            } else {
                break
            }
        }
        
        if isAppend {
            arrAnswer.append(num)
        }
    }
    
    if numList.isEmpty {
        return nil
    }
    
    return arrAnswer
}

// pridicates are closure and should be outside of filter

let arrPredicates:[(Int) -> Bool] = [predicate1, predicate2, predicate3, predicate4]
var arrInt = [1,6,4,38,9,66]
print(filter(numList: arrInt, predicates: arrPredicates))





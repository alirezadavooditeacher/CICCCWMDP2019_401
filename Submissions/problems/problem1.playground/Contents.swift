//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//problem1

func add(x:Double, y:Double) -> Double{
    return x + y
}

func substruct(x:Double, y:Double) -> Double{
    return x - y
}

func multiplication(x:Double, y:Double) -> Double{
    return x * y
}

func  division(x:Double, y:Double) -> Double? {
    if x == 0 || y == 0 {
        return nil
    }
    return x / y
}

func problem1(num1 a:Double, num2 b:Double, sign mark:Character) {
    // ask user what kind of culculation?
    
    
    switch mark {
    case "+":
        var answer:Double = add(x: a,y: b)
        print(answer)
        
    case "-":
        var answer:Double = substruct(x: a,y: b)
        print(answer)
        
    case "*":
        var answer:Double = multiplication(x: a,y: b)
        print(answer)
        
    case "/":
        var answer:Double? = division(x: a,y: b)
        
        // if 文で　nilか確認したら、if文の中ではforced unwrapped ができる！
        if answer != nil {
            print(answer!)
        } else {
            print("we can't devide with 0")
        }
        
    default:
        print("It is not sign of culculation")
    }
}

problem1(num1: 10, num2: 7, sign: "/")


////rewrite
//func rewrite(_ a:Double, _ b:Double, _ mark:Character) {
//    // ask user what kind of culculation?
//    //var askCulculation =
//
//    switch mark {
//    case "+":
//        var answer = add(x: a,y: b)
//        print(answer)
//
//    case "-":
//        var answer = substruct(x: a,y: b)
//        print(answer)
//
//    case "*":
//        var answer = multiplication(x: a,y: b)
//        print(answer)
//
//    case "/":
//        var answer = division(x: a,y: b)
//
//        // if 文で　nilか確認したら、if文の中ではforced unwrapped ができる！
//        if answer != nil {
//            print(answer!)
//        } else {
//            print("we can't devide with 0")
//        }
//
//    default:
//        print("It is not sign of culculation")
//
//
//    }
//}

print("rewrite function is ")
//rewrite(100, 5, "/")
print()

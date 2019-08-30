import UIKit

var func1:(Int, Int)->Int
var func2:(String)->Void
let func3:()->Int
let func4:()->[()->Void]
let func5:([(Int)->Void])->[String]
var func6:([(Int)->Void])->[(Int)->Void]
var func7:([(Int)->Void]?)->[(Int)->Void]?
var func8:([(Int)->Void]?)->[(Int)->Void]?
var func9:()->((Int)->Int,Int)?

//Problem 2
func fakeFunc1(firstNum:Int, secondNum:Int) -> Int {
    return firstNum + secondNum
}
func1 = fakeFunc1

func fakeFunc2(s:String) {
    print(s)
}
func2 = fakeFunc2

func fakeFunc3() -> Int {
    return 0
}
func3 = fakeFunc3

func fakeFunc4() -> [()->Void] {
    return [{ () -> Void in print("Fake Function 4") }]
}
func4 = fakeFunc4

func fakeFunc5(function:[(Int)->Void])->[String] {
    return ["Fake","Function 5"]
}
func5 = fakeFunc5

func fakeFunc6(function: [(Int)->Void])->[(Int)->Void] {
    return [{ (Int) -> Void in print("Fake Function 6") }]
}
func6 = fakeFunc6

func fakeFunc7(function: [(Int)->Void]?)->[(Int)->Void]? {
    
    guard function != nil else {
        return nil
    }
    
    return [{ (Int) -> Void in print("Fake Function 7") }]
}
func7 = fakeFunc7

func fakeFunc9()->((Int)->Int,Int)? {
    return ({ (Int) -> Int in return 0 }, 1)
}
func9 = fakeFunc9

//PROBLEM 3
func calc(firstNum:Int,secondNum:Int,oper:String) -> (Double,(Int,Int)->Double?)? {
    
    func sum (_ firstNum:Int, _ secondNum:Int) -> Double {
        return Double(firstNum) + Double(secondNum)
    }
    func difference (_ firstNum:Int, _ secondNum:Int) -> Double {
        return Double(firstNum) - Double(secondNum)
    }
    func multiplication (_ firstNum:Int, _ secondNum:Int) -> Double {
        return Double(firstNum) * Double(secondNum)
    }
    func division (_ firstNum:Int, _ secondNum:Int) -> Double? {
        guard secondNum != 0 else {
            print("Invalid Division")
            return nil
        }
        return Double(firstNum) / Double(secondNum)
    }
    func power (_ firstNum:Int, _ secondNum:Int) -> Double {
        let result = pow(Decimal(firstNum),secondNum)
        return Double(truncating:result as NSNumber)
    }
    
    let operations = [ "+": sum,"/": division, "-": difference, "*": multiplication, "^": power ]
    
    if let f = operations[oper] {
        if let result = f(firstNum, secondNum) {
            return (result, f)
        } else {
            return nil
        }
    } else {
        return nil
    }
}

let operations = ["+", "/", "-", "^", "*"]

for opr in operations {
    let random1 = Int.random(in: 0 ..< 10)
    let random2 = Int.random(in: 0 ..< 10)
    if let (result, _) = calc(firstNum: random1, secondNum: random2, oper: opr) {
        print("\(opr) of \(random1) and \(random2) = \(result)")
    }
}

//PROBLEM 4
func sorter(words:[String],comparator:(String,String)->Bool) -> [String]? {
    guard !words.isEmpty else {
        return nil
    }
    let sortedWords = words.sorted(by: comparator)
    return sortedWords
}

var list = ["one", "two", "three", "four", "five"]
let Ascendingly = sorter(words: list) { (_ str1:String, _ str2:String) -> Bool in return str1 < str2 }!
print(Ascendingly)
let Descending = sorter(words: list) { (_ str1:String, _ str2:String) -> Bool in return str1 > str2 }!
print(Descending)
list = ["aa", "aba", "bb", "aabbb"]
let length = sorter(words: list) { (_ str1:String, _ str2:String) -> Bool in return str1.count > str2.count }!
print(length)

//PROBLEM 5
func filter(list:[Int],predicates:[(Int)->Bool]) -> [Int]? {
    var newList = [Int]()
    for number in list {
        var append = true
        for predicate in predicates {
            if !predicate(number) {
                append = false
                break
            }
        }
        if append {
            newList.append(number)
        }
    }
    
    if newList.isEmpty {
        return nil
    }
    return newList
}

let pred1 = { (number: Int) -> Bool in return number % 2 != 0 }
let pred2 = { (number: Int) -> Bool in
    if number % 2 == 0 && number != 2 || number < 2 {
        return false
        
    }
    for i in 3..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}
let pred3 = { (number: Int) -> Bool in
    if number < 2 || number % 2 == 0 { return false }
    for i in 3..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}
let pred4 = { (number: Int) -> Bool in return number % 7 == 0 }
let predicates = [pred1, pred2, pred3, pred4]

let predlist = [Int](0...100)
if let result = filter(list: predlist, predicates: predicates) {
    print(result)
}

import UIKit

func filter(list:[Int],predicates:[(Int)->Bool]) -> [Int]? {
    var newList = [Int]()
    for num in list {
        var append = true
        for predicate in predicates {
            if !predicate(num) {
                append = false
                break
            }
        }
        if append {
            newList.append(num)
        }
    }
    
    if newList.isEmpty {
        return nil
    }
    return newList
}

let predicate1 = { (num: Int) -> Bool in return num % 2 != 0 }
let predicate2 = { (num: Int) -> Bool in
    if num % 2 == 0 && num != 2 || num < 2 { return false }
    for i in 3..<num {
        if num % i == 0 {
            return false
        }
    }
    return true
}
let predicate3 = { (num: Int) -> Bool in
    if num < 2 || num % 2 == 0 { return false }
    for i in 3..<num {
        if num % i == 0 {
            return false
        }
    }
    return true
}
let predicate4 = { (num: Int) -> Bool in return num % 7 == 0 }
let predicates = [predicate1, predicate2, predicate3, predicate4]

let list = [Int](0...100)
if let result = filter(list: list, predicates: predicates) {
    print(result)
}

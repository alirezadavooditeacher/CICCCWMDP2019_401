import UIKit

class MyObserver {
    static var hold = false {
        didSet {
            if hold {
                totalHolds += 1
            }
        }
    }
    static var item = 0 {
        didSet {
            sumHolds += item
        }
    }
    static var totalHolds = 0
    static var sumHolds = 0
}

class MyNotification: MyObserver {
    var seen: Bool = false
    var totalSeen: Int = 0
    
    static func searchIt (numbers:[Int], predicate:(Int)->Bool) {
        totalHolds = 0
        sumHolds = 0
        for number in numbers {
            if predicate(number) {
                hold = true
                item = number
            } else {
                hold = false
            }
        }
    }
    
    static func fillIt (size: Int) -> [Int] {
        var randomNumbers = [Int]()
        for _ in 1...size {
            randomNumbers.append(Int.random(in: 1...100))
        }
        return randomNumbers
    }
}

let numbers = MyNotification.fillIt(size: 40)
let predicate1 = {(num:Int) -> Bool in num % 3 == 0}
let predicate2 = {(num:Int) -> Bool in num % 2 == 0}

MyNotification.searchIt(numbers: numbers, predicate: predicate1)
print("Predicate1: Number of holds: \(MyNotification.totalHolds), total: \(MyNotification.sumHolds)")
MyNotification.searchIt(numbers: numbers, predicate: predicate2)
print("Predicate2: Number of holds: \(MyNotification.totalHolds), total: \(MyNotification.sumHolds)")

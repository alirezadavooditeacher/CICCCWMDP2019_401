import UIKit

class MyObservier {
    
    static var itemCount:Int = 0 {
        didSet {
            self.itemCount += oldValue
        }
    }
    
    static var itemSum: Int = 0 {
        didSet {
            self.itemSum += oldValue
        }
    }
}

class MyNotification {
    static let seen: Bool = true
    static let totalSeen:Int = 0
    
    static func searchIt(serchNums:[Int], predicate: (Int) -> Bool){
        
        for num in serchNums {
            if predicate(num) {
                MyObservier.itemCount = 1
                MyObservier.itemSum = num
            }
        }
    }
    
    static func fillIt(size:Int)->[Int]{
        var randomList = [Int]()
        for _ in 1...size {
            randomList.append(Int.random(in: 1...100))
        }
        return randomList
    }
    
}
let searchList = MyNotification.fillIt(size: 5)
MyNotification.searchIt(serchNums: searchList) { (num) -> Bool in return num % 3 == 0 }
print("Predicate1 : numbers of hold: \(MyObservier.itemCount) total: \(MyObservier.itemSum)")
MyNotification.searchIt(serchNums: searchList) { (num) -> Bool in return num % 2 == 0 }
print("Predicate2 : numbers of hold: \(MyObservier.itemCount) total: \(MyObservier.itemSum)")


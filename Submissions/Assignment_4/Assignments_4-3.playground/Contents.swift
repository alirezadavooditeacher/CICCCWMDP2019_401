import UIKit
//problem 3
class MyNotification{
    let Seen:Bool = false
    let totalSeen:Int = 0
    
    func predicate1(num:Int)->Bool{
        if num % 3 == 0 {return true}
        else{return false}
    }
    func predicate2(num:Int)->Bool{
        if num % 2 == 0{return true}
        else{return false}
    }
    static func searchIt(arr:[Int], predicate:(Int)-> Bool)->[Int]{
        var hold = [Int]()
        for i in arr{
            if predicate(i){
                hold.append(i)
            }
        }
        return hold
    }
    static func fillIt(size:Int)->[Int]{
        var arr = [Int]()
        for _ in 0..<size{
            arr.append(Int.random(in:1...100))
        }
        print("Array:\(arr)")
        return arr
    }
    
}

class MyObserver{
    
    let holding = MyNotification.searchIt(
        arr:MyNotification.fillIt(size: 10),
        predicate: MyNotification().predicate1(num:))
    
    var sum : Int = 0{
        willSet(sum_new){
            print("Holding Number:\(holding)\nNumber of times the predicate holds:\(holding.count)")
        }
        didSet{
            print("Sum of number:\(sum)")
        }
    }
}
let my = MyObserver()
var sum2 = 0
for value in my.holding{
    sum2 += value
}
my.sum = sum2


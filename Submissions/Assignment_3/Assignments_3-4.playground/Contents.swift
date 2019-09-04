import UIKit
//problem4
class Search{
    var arr = [Int]()
    func reset()->Void{
        arr = []
    }
    func randomFill()->Void{
        for _ in 0..<10{
            arr.append(Int.random(in: 0..<10))
        }
    }
    static func linearSearch(num:Int,arr:[Int]){
        if arr.contains(num){ print("\(num) is in array:\(arr)")}
        else{ print("\(num) is not in array:\(arr)")}
    }
}
let test = Search()
test.randomFill()
print("random:\(test.arr)")

let test2 = test
test2.reset()
print("reset:\(test.arr)")

Search.linearSearch(num: 3, arr: [1,3,4,6,3])


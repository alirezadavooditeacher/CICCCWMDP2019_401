import UIKit

class Search {
    var numbers = [Int]()
    
    func randomFill(){
        for _ in 1...10 {
            numbers.append(Int.random(in: 1...10))
        }
    }
    
    static func linearSearch(numbers:[Int], searchNum:Int){
        
        numbers.contains(searchNum) ? print("\(searchNum) exsists in the list") : print("\(searchNum) doesn't exsist in the list")
    }
}

let test = Search()
test.randomFill()
Search.linearSearch(numbers: test.numbers, searchNum: Int.random(in: 1...10))

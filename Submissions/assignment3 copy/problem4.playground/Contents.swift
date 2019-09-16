import Cocoa

var str = "Hello, playground"

class Search {
    var arr:[Int] = []
    // don't initialize search = Search()
    
    func reset() {
        var emptyArr:[Int] = []
    }

    func randomFill(){
        var num = 0
        for _ in 1...10 {
            num = Int.random(in: 1..<10)
            arr.append(num)
        }
    }
    
    func linearSearch(list from:[Int], num aNum:Int) -> Bool {
        for value in from {
            if value == aNum {
                return true
                
            }
            
        }
        return false
    }
}
let s = Search()
s.randomFill()
//Search.randomFill()
if s.linearSearch(list:s.arr, num:7) {
    print("There is 7", s.arr)
} else {
    print("7 is not in the array", s.arr)
}

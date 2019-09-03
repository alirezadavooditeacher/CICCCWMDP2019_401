import Cocoa

var str = "Hello, playground"

class Search {
    var arr:[Int]
    let serch:Search = Search
    func reset() {
        var emptyArr:Int = []
    }

    func randomFill(){
        for num in 1...10 {
            num = Int.random(in: 1..<100)
            self.emptyArr.append(num)
        }
    }
    
    func linearSearch(list from:[Int], num aNum:Int){
        for value in from {
            if value == aNum {
                print("There is \(value)")
        }
            
    }
}

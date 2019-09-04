import UIKit


class Search {
    var numbers = [Int]()
    func reset() {
        self.numbers = [Int]()
    }
    func randomFill () {
        for _ in 1...10 {
            numbers.append(Int.random(in: 0 ..< 10))
        }
    }
    static func linearSearch(_ list:[Int], find target:Int) -> Bool {
        return list.contains(target)
    }
}

let search = Search()
search.randomFill()
if Search.linearSearch(search.numbers, find: 4) {
    print("Number 4 is in this list")
} else {
    print("Number 4 is not in the list", search.numbers)
}

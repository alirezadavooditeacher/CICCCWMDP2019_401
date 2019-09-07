import UIKit

/* Problem4
 - Create a class called Search which has an array of numbers as its instance variable.
 - Create an instance method for this class called, reset which create an empty array and return void.
 - Create an instance method for this class called randomFill which generates 10 random
 Integer and add them to the array of numbers and returns void (which is the instance
 variable of the class).
 - Create a static method called linearSearch which takes a list of Integer and a number. It
 check whether the number exist in the list of not.
 
 
 */

class Search {
    var nums: [Int] = []
    
    func reset() {
        var empty:[Int] = []  // I'm not sure what this is for.
    }
    
    func randomFill() {
        var cnt = 0
        var num = 0
        while cnt <= 10 {
            cnt += 1
            num = Int.random(in: 0...10)
            nums.append(num)
        }
    }
    
    static func linearSearch (_ nums: [Int], _ num: Int) -> Bool {
        for oneOfThem in nums {
            if oneOfThem == num {
                return true
            }
        }
        return false
    }
}

let search = Search()
search.randomFill()
let find = Int.random(in: 0...10)
let bool = Search.linearSearch(search.nums, find)

print("\(search.nums)\nAre there \(find) in the list?\n\(bool)")

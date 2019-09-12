import UIKit

//Problem 1

class Student {
    var name = ""
    var scores = [Int]()
    var average : Int {
        
        var sum = 0
        for score in scores {
            sum += score
        }
        return sum / scores.count
    }
}

var students = [Student]()

let student1 = Student()
student1.name = "Lucas"
let student2 = Student()
student2.name = "Shihomi"
let student3 = Student()
student3.name = "Henrique"
let student4 = Student()
student4.name = "Rose"
let student5 = Student()
student5.name = "Shoko"

students.append(student1)
students.append(student2)
students.append(student3)
students.append(student4)
students.append(student5)

// Populating the scores of all students

for student in students {
    for _ in 1...10 {
        student.scores.append(Int.random(in: 0 ... 10))
    }
}

print(student1.scores)
print(student2.scores)
print(student3.scores)
print(student4.scores)
print(student5.scores)


func topRankStudent(students: [Student]) -> String {
    var topAverage = 0
    var topStudent = ""
    for student in students {
        if student.average > topAverage {
            topAverage = student.average
            topStudent = student.name
        }
    }
    return topStudent
}

topRankStudent(students: students)

// Problem 2

enum AppleDevice : String {
    case iPhoneXs
    case iPhoneXR
    case iPhone8
    case iPhone7
    
    var price : Int {
        switch self {
        case .iPhoneXs:
            return 1000
        case .iPhoneXR:
            return 1100
        case .iPhone8:
            return 800
        case .iPhone7:
            return 750
        }
    }
}

//Problem 3

class MyObserver {
    static var numOfHolds = 0
    static var itemsSum = 0
    static var item = 0 {
        didSet {
            itemsSum += item
        }
    }
    static var holded = false {
        didSet {
            if holded == true {
                numOfHolds += 1
            }
            print("Numbers of holds: \(numOfHolds), Sum: \(itemsSum)")
        }
    }
}

class MyNotification : MyObserver {
    var seen = false
    var totalSeen = 0
    
    static func searchIt(numbers: [Int], predicate: (Int) -> Bool) {
        
        for num in numbers {
            if predicate(num) {
                holded = true
                item = num
            }
        }
    }
    
    static func fillIt(size: Int) -> [Int] {
        var numArray = [Int]()
        
        for _ in 1...size {
            numArray.append(Int.random(in: 1...100))
        }
        return numArray
    }

}

let predicate1 = {(num: Int) in num % 3 == 0}
let predicate2 = {(num: Int) in num % 2 == 0}

MyNotification.searchIt(numbers: MyNotification.fillIt(size: 50), predicate: predicate1)
MyNotification.searchIt(numbers: MyNotification.fillIt(size: 50), predicate: predicate2)


// Problem 4

class MySort {
    var items = [Int]()
    var sorting: (inout[Int]) -> Void {
        return {(nums:inout[Int]) -> Void in }
    }
}

class MyBubbleSort : MySort {
    override var sorting: (inout[Int]) -> Void {
        return { (nums:inout[Int])->Void in
            for _ in 0...nums.count {
                for value in 1...nums.count - 1 {
                    if nums[value - 1] < nums[value] {
                        let biggerNumber = nums[value - 1]
                        nums[value - 1] = nums[value]
                        nums[value] = biggerNumber
                    }
                }
            }
            print(nums)
        }
    }
}

class MyInsertionSort : MySort {
    override var sorting: (inout[Int]) -> Void {
        return { (nums:inout[Int])->Void in
            var arr = nums
            for x in 1..<arr.count {
                var y = x
                while y > 0 && arr[y] < arr[y - 1] {
                    arr.swapAt(y - 1, y)
                    y -= 1
                }
            }
        }
    }
}

var insertionSortArray = MyInsertionSort()
var bubbleSortArray = MyBubbleSort()

bubbleSortArray.items = [10,20,30,40,50,1,2,3]
bubbleSortArray.sorting

insertionSortArray.items = [10,20,30,40,50,1,2,3]
insertionSortArray.sorting


// Problem 5

var string = "aaa"


func palindromeIndex(word: String) -> Int {
    let reversedWord = String(word.reversed())
    var index = -1
    var newString = ""
    let indexToRemove : Int? = nil
    
    if reversedWord != word {
        index = -1
    }
    
    for (index,letter) in reversedWord.enumerated() {
        if indexToRemove == nil && letter != word[word.index(word.startIndex, offsetBy: index)] {
            indexToRemove == index
        } else {
            newString.append(letter)
        }
        
    }
    
    let newReversed = String(newString.reversed())
    
    if newString != newReversed {
        index = -1
    } else  {
        if let indexRemoved = indexToRemove {
            index = indexRemoved
        }
    }
    
    return index
    }
// Problem 6
func findingMissingNumbers(newArray: [Int], originalArray: [Int]) {
    var missingNumbersArray = [Int]()
    
    for number in originalArray {
        if !newArray.contains(number) {
            missingNumbersArray.append(number)
            print(missingNumbersArray)
        }
    }
}

findingMissingNumbers(newArray: [1, 2, 3], originalArray: [1, 2, 3, 4])


// Problem 7

struct Circle {
    var radius : Double = 0
    static let pi = 3.14
    var area : Double {
       return Circle.pi * radius * radius
    }
}

var circle = Circle()
circle.radius = 5
print(circle.area)

import UIKit

// Problem 1

print("--------------Problem 1---------------")

struct DateFormatted {
    var day = 0
    var month = 0
    var year = 0
    static func setDate(days:Int) -> DateFormatted? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let startDate = formatter.date(from: "2019-01-01") {
            if let newDate = Calendar.current.date(byAdding: .day, value: days - 1, to: startDate) {
                let day = Calendar.current.component(.day, from: newDate)
                let month = Calendar.current.component(.month, from: newDate)
                let year = Calendar.current.component(.year, from: newDate)
                let date = DateFormatted(day: day, month: month, year: year)
                return date
            }
        }
        return nil
    }
}
var dateFormatted = DateFormatted.setDate(days: 234)!;

enum WeekDay:String {
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
    case sunday = "Sunday"
    
    static func getWeekDay (date: DateFormatted) -> WeekDay? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let someDate = formatter.date(from: "\(date.year)-\(date.month)-\(date.day)") {
            let weekDay = Calendar.current.component(.weekday, from: someDate)
            
            switch weekDay {
            case 1:
                return .sunday
            case 2:
                return .monday
            case 3:
                return .tuesday
            case 4:
                return .wednesday
            case 5:
                return .thursday
            case 6:
                return .friday
            case 7:
                return .saturday
            default:
                return nil
            }
        }
        return nil
    }
}
var weekDay = WeekDay.getWeekDay(date: dateFormatted)!

print("The new date is \(weekDay.rawValue) - \(dateFormatted.month)/\(dateFormatted.day)/\(dateFormatted.year)")

// Problem 2

print("--------------Problem 2---------------")

struct Point {
    var x:Int
    var y:Int
    mutating func reset () {
        self.x = 0
        self.y = 0
    }
    func printPoint(point: Point) {
        print("This is point is at [\(point.x),\(point.y)]")
    }
    static func average(points:[Point],of coord:Character) -> Int? {
        guard coord == "x" || coord == "y" else {
            return nil
        }
        
        var avg = 0
        for point in points {
            if coord == "x" {
                avg += point.x
            } else {
                avg += point.y
            }
        }
        
        return avg / points.count
    }
    static func vectorAverage(points: [Point]) -> Point? {
        guard !points.isEmpty else {
            return nil
        }
        
        guard let avgX = average(points: points, of: "x") else {
            return nil
        }
        guard let avgY = average(points: points, of: "y") else {
            return nil
        }
        
        return Point(x: avgX, y: avgY)
    }
}

let pointA = Point(x: 5, y: 4)
let pointB = Point(x: 2, y: 8)
let pointC = Point(x: 9, y: 5)
let pointD = Point(x: 5, y: 3)

if var avgPoint = Point.vectorAverage(points: [pointA, pointB, pointC, pointD]) {
    avgPoint.printPoint(point: avgPoint)
    avgPoint.reset()
    avgPoint.printPoint(point: avgPoint)
}

// Problem 3

print("--------------Problem 3---------------")

enum Calculator {
    case sum((Int,Int) -> Int)
    case subtraction((Int,Int) -> Int)
    case multiplication((Int,Int) -> Int)
    case division((Int,Int) -> Int)
    
    static func calculate(num1:Int, num2:Int, opr: Calculator) -> Int {
        switch opr {
        case .sum(let f):
            return f(num1, num2)
        case .subtraction(let f):
            return f(num1, num2)
        case .multiplication(let f):
            return f(num1, num2)
        case .division(let f):
            return f(num1, num2)
        }
    }
}

let sum = Calculator.sum({(num1:Int, num2:Int) -> Int in return num1 + num2 })
let subtraction = Calculator.subtraction({(num1:Int, num2:Int) -> Int in return num1 - num2 })
let multiplication = Calculator.multiplication({(num1:Int, num2:Int) -> Int in return num1 * num2 })
let division = Calculator.division({(num1:Int, num2:Int) -> Int in return num1 / num2 })

let sumResult = Calculator.calculate(num1: 15, num2: 7, opr: sum)
let subtractionResult = Calculator.calculate(num1: 2, num2: 1, opr: subtraction)
let multiplicationResult = Calculator.calculate(num1: 5, num2: 2, opr: multiplication)
let divisionResult = Calculator.calculate(num1: 50, num2: 10, opr: division)

print("The sum is: \(sumResult), the subtraction is: \(subtractionResult), the multiplication is: \(multiplicationResult), the division is: \(divisionResult)")

// Problem 4

print("--------------Problem 4---------------")

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

// Problem 5

print("--------------Problem 5---------------")

struct Student {
    var firstName = ""
    var lastName = ""
    var address = ""
    var birthYear = 0
    var gpa = 0
    
    func printStudent () {
        print("Name: \(self.firstName) \(self.lastName)")
        print("Address: \(self.address)")
        print("Birthdate Year: \(self.birthYear)")
        print("GPA: \(self.gpa)")
    }
}

class Classroom {
    var students = [Student]()
    func generateList() {
        for i in 1...10 {
            let firstName = "First Name \(i)"
            let lastName = "Last Name \(i)"
            let address = "Address \(i)"
            let birthYear = 1920 + Int.random(in: 1...100)
            let gpa = Int.random(in: 1...100)
            students.append(Student(firstName: firstName, lastName: lastName, address: address, birthYear: birthYear, gpa: gpa))
        }
    }
    func getHighestGpa () -> Student? {
        var highestGpa = 0
        var bestStudent = students[0]
        for student in students {
            if student.gpa > highestGpa {
                highestGpa = student.gpa
                bestStudent = student
            }
        }
        
        bestStudent.printStudent()
        return bestStudent
    }
}

let classroom = Classroom()
classroom.generateList()
let student = classroom.getHighestGpa()

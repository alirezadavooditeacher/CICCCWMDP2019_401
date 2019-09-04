import UIKit

// Problem 1
struct Date {
    var day : Int
    var month : Int
    var year : Int
    
    static func convertToDate(numOfDays: Int) -> Date  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        
        let startDate = dateFormatter.date(from: "01.01.19")!
        let newDate = Calendar.current.date(byAdding: .day, value: numOfDays - 1, to: startDate)!
        
        let day = Calendar.current.component(.day, from: newDate)
        let month = Calendar.current.component(.month, from: newDate)
        let year = Calendar.current.component(.year, from: newDate)
        
        let date = Date(day: day, month: month, year: year)
        return date

    }
}

var dateTest = Date.convertToDate(numOfDays: 365)
var dateTest2 = Date.convertToDate(numOfDays: 50)
print(dateTest)
print(dateTest2)



enum WeekDay : String {
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
    case sunday = "Sunday"
    
    static func weekDay(date: Date) -> RawValue?  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        let newDate = dateFormatter.date(from: "\(date.day).\(date.month).\(date.year)")!
        let dayOfTheWeek = Calendar.current.component(.weekday, from: newDate)
        
        switch dayOfTheWeek {
        case 1:
            return WeekDay.sunday.rawValue
        case 2:
            return WeekDay.monday.rawValue
        case 3:
            return WeekDay.tuesday.rawValue
        case 4:
            return WeekDay.wednesday.rawValue
        case 5:
            return WeekDay.thursday.rawValue
        case 6:
            return WeekDay.friday.rawValue
        case 7:
            return WeekDay.saturday.rawValue
        default:
            return nil
        }
        
    }
}

if let dateTestWeekday = WeekDay.weekDay(date: dateTest){
    print(dateTestWeekday)
}




// Problem 2

struct Point {
    var x: Int
    var y: Int
    
    mutating func reset() {
        x = 0
        y = 0
    }
    
    func printPoint(point: Point) {
        print("The point is at coordinate [\(point.x), \(point.y)]")
    }
    
    static func average(points: [Point], character: Character) -> Int? {
        if character != "x" && character != "y" {
            return nil
        }
        var sum = 0
            for point in points {
                if character == "x" {
                    sum += point.x
                } else if character == "y" {
                    sum += point.y
                }
            }
        return sum / points.count
    }
    
    static func vectorAverage(points: [Point]) -> Point {
        let newPoint = Point(x: Point.average(points: points, character: "x")!, y: Point.average(points: points, character: "y")!)
        
        printPoint(newPoint)
        
        return newPoint
    }
    
}

var arrayOfPoints = [Point(x: 2, y: 1), Point(x: 4, y: 2), Point(x: 10, y: 30), Point(x: 5, y: 5)]


let answer = Point.vectorAverage(points: arrayOfPoints)

print(answer)


// Problem 3

enum Calculator {
    case sum
    case subtraction
    case division
    case multiplication
    
    static func calculate(num1: Int, num2: Int, opt: Calculator) -> Int? {
        switch opt {
        case .sum:
            return num1 + num2
        case .subtraction:
            return num1 - num2
        case .division:
            if num2 != 0 {
            return num1 / num2
            } else {
                return nil
            }
        case .multiplication:
            return num1 * num2
        }

    }
    
}

var test = Calculator.calculate(num1: 1, num2: 2, opt: .sum)!
var test2 = Calculator.calculate(num1: 10, num2: 5, opt: .division)!
var test3 = Calculator.calculate(num1: 20, num2: 2, opt: .multiplication)!
var test4 = Calculator.calculate(num1: 15, num2: 5, opt: .subtraction)!

print(test)
print(test2)
print(test3)
print(test4)


// Problem 4

class Search {
    var numbers = [1, 2, 3, 4]
    
    func reset() {
        numbers = [Int]()
    }
    
    func randomFill() {
        for _ in 1...10 {
            let number = Int.random(in: 0...50)
            numbers.append(number)
        }
    }
    
    static func linearSearch(numbers: [Int], n: Int) -> Bool {
        var numExists = false
        for number in numbers {
            if number == n {
                numExists = true
                break
            } else {
                numExists = false
            }
        }
        return numExists
    }
}


let number1 = Search()

Search.linearSearch(numbers: number1.numbers, n: 4)
Search.linearSearch(numbers: number1.numbers, n: 10)

// Problem 5

struct Student {
    var firstName : String
    var lastName : String
    var address : String
    var birthYear : String
    var gpa : Int
    
    static func printStudent(student: Student) {
        print("First name: \(student.firstName), Last name: \(student.lastName), Address: \(student.address), Birthyear: \(student.birthYear), GPA: \(student.gpa)")
    }
}


class Classroom {
    var students = [Student]()
    
    func generateList() {
        for i in 1...10 {
            let newStudent = Student(firstName: "Lucas\(i)", lastName: "Rocha\(i)", address: "Vancouver\(i)", birthYear: "200\(i)", gpa:Int.random(in: 0...10) )
            students.append(newStudent)
        }
    }
    
    func getHighestGPA() -> Student {
        var highestGPA = 0
        var studentWithHighestGPA = students[0]
        
        for student in students {
            if student.gpa > highestGPA {
                highestGPA = student.gpa
                studentWithHighestGPA = student
            }
        }
        Student.printStudent(student: studentWithHighestGPA)
        return studentWithHighestGPA
    }
    
}

var classRoom1 = Classroom()

classRoom1.generateList()
print(classRoom1.students)
classRoom1.getHighestGPA()


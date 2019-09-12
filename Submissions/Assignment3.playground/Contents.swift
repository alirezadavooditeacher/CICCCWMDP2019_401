

//problem1
struct Date{
    static func DayNum(dayNum:Int) ->Int{
        var day = 0
        var month = 0
        let year = 2019
        let DaysperMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
        if dayNum > 365{print("Wrong number of day,please enter a number between 1 and 365 ")}
        else{
            day = dayNum
            while day > DaysperMonth[month]{
                day = day - DaysperMonth[month]
                if(day>0)
                {   month += 1
                }else
                {   day = dayNum
                }
            }
            month += 1
        }
        print("Days:\(dayNum)\n\(year)/\(month)/\(day)")
        return dayNum
    }
    
}

enum WeekDay: String{
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
    static func weekday(dayNum: Int){
        let num = Date.DayNum(dayNum: dayNum)
        let wd = num % 7
        switch wd {
        case 6: print(WeekDay.Sunday)
        case 0: print(WeekDay.Monday)
        case 1: print(WeekDay.Tuesday)
        case 2: print(WeekDay.Wednesday)
        case 3: print(WeekDay.Thursday)
        case 4: print(WeekDay.Friday)
        case 5: print(WeekDay.Saturday)
        default: print()
        }
    }
}

//Date.DayNum(dayNum: 25)
//Date.DayNum(dayNum: 180)
//Date.DayNum(dayNum: 365)
WeekDay.weekday(dayNum:200)


//problem2
struct point{
    var x = 0.0
    var y = 0.0
    mutating func reset(){
        x = 0.0
        y = 0.0
    }
    func printPoint(){
        print("point:\([x,y])")
    }
    static func average(char:Character,arr:[(Int,Int)])->Double?{
        var sum_x = 0
        var sum_y = 0
        var av_x = 0.0
        var av_y = 0.0
        switch char {
        case "x":
            for i in 0..<arr.count{
                sum_x += arr[i].0
            }
            av_x = Double(sum_x)/Double(arr.count)
            return av_x
        case "y":
            for i in 0..<arr.count{
                sum_y += arr[i].1
            }
            av_y = Double(sum_y)/Double(arr.count)
            return av_y
        default:
            return nil
        }
    }
    static func vectorAverage(arr:[(Int,Int)])->(Double,Double){
        let r_x = average(char: "x", arr:arr)!
        let r_y = average(char: "y", arr:arr)!
        return (r_x,r_y)
    }
    
    
}
var test1 = point(x: 5, y: 2)
test1.printPoint()
test1.reset()
print("reset")
test1.printPoint()

if let t1 = point.average(char: "x", arr: [(2,5),(3,6)]){
    print("average x = \(t1)")
}
if let t2 = point.average(char: "y", arr: [(2,5),(3,6)]){
    print("average y = \(t2)")
}

let (a,b) = point.vectorAverage(arr: [(2,5),(3,6)])
let test2 = point.init(x: a, y: b)
test2.printPoint()


//problem3
enum Calculator{
    case Sum(Int,Int)
    case Subtraction(Int,Int)
    case Multiplication(Int,Int)
    case Division(Int,Int)
    
    static func calculate(opt:Calculator)->Int{
        switch opt{
        case let .Sum(num1,num2): return num1 + num2
        case let .Subtraction(num1,num2): return num1 - num2
        case let .Multiplication(num1,num2): return num1 * num2
        case let .Division(num1,num2): return num1 / num2
        }
    }
}
let num1 = 16
let num2 = 4

var cal = Calculator.Sum(16, 4)
let sum = Calculator.calculate(opt:cal)
print("\(num1)+\(num2)=\(sum)")

cal = Calculator.Subtraction(16, 4)
let sub = Calculator.calculate(opt:cal)
print("\(num1)-\(num2)=\(sub)")

cal = Calculator.Multiplication(16, 4)
let mul = Calculator.calculate(opt:cal)
print("\(num1)*\(num2)=\(mul)")

cal = Calculator.Division(16, 4)
let div = Calculator.calculate(opt:cal)
print("\(num1)/\(num2)=\(div)")


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

let test = test
test.reset()
print("reset:\(test.arr)")

Search.linearSearch(num: 3, arr: [1,3,4,6,3])


//problem5
struct Student{
    var firstName:String = ""
    var lastName:String = ""
    var address:String = ""
    var yearOfBirth:Int = 0
    var gpa:Int = 0
    static func printStudent(st:Student){
        print(st)
    }
}
class Classroom{
    var allStudent = [Student]()
    func generateList(){
        var student = Student()
        student.firstName = "A"
        student.lastName = "a"
        student.address = " 1 Ave"
        student.yearOfBirth = 1990
        student.gpa = 74
        allStudent.append(student)
        student.firstName = "B"
        student.lastName = "b"
        student.address = " 2 Ave"
        student.yearOfBirth = 1988
        student.gpa = 89
        allStudent.append(student)
        student.firstName = "C"
        student.lastName = "c"
        student.address = " 3 Ave"
        student.yearOfBirth = 1993
        student.gpa = 88
        allStudent.append(student)
        for i in 0..<allStudent.count{
            Student.printStudent(st:allStudent[i])
        }
    }
    func getHighestGap(){
        let maxGpa = max(allStudent[0].gpa, allStudent[1].gpa, allStudent[2].gpa)
        for i in 0..<allStudent.count{
            if maxGpa == allStudent[i].gpa {
                print("The highest GPA student:")
                Student.printStudent(st: allStudent[i])
            }
        }
    }
}

let cl = Classroom()
cl.generateList()
cl.getHighestGap()

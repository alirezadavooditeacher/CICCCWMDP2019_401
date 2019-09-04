import UIKit
//problem1

struct Date{
    static func DayNum(dayNum:Int) ->Int{
        var day = 0
        var month = 0
        var year = 2019
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





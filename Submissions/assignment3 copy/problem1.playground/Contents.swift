import Cocoa

var str = "Hello, playground"

struct Date {
    var day:Int = 0
    var month:Int = 0
    var year:Int = 0

    static func convertToDate(days:Int) -> Date{
        
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let startDate = formatter.date(from: "2019/01/01")!
        
        let result = Calendar.current.date(byAdding: .day, value: days - 1, to: startDate)!
        let calender = Calendar.current

        return Date(day: calender.component(.day, from: result), month: calender.component(.month, from: result), year: calender.component(.year, from: result))
    }
}

enum weekDay:String {
    case Monday = "Monday"
    case Tuesday = "Tuesday"
    case Wednesday = "Wednesday"
    case Thursday = "Thursday"
    case Friday = "Friday"
    case Saturday = "Saturday"
    case Sunday = "Sunday"

    static func whichDay(date:Date) -> weekDay? {
        let calender = Calendar.current
        // because the parameter , which is from can't store Date type
//        let weekday = calender.component(.weekday, from: date)
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        if let day = formatter.date(from: "\(date.year)/\(date.month)/\(date.day)"){
           let weekday = calender.component(.weekday, from: day)

        switch weekday {
        case 1:
            return Monday
        case 2:
            return Tuesday
        case 3:
            return Wednesday
        case 4:
            return Thursday
        case 5:
            return Friday
        case 6:
            return Saturday
        case 7:
            return Sunday
        default:
            return nil
            }
    }
        return nil
    }
}

let newDate = Date.convertToDate(days: 365)
let which = weekDay.whichDay(date: newDate)!
print(which)
//let day = formatter.date(from: "\(newDate.year)/\(newDate.month)/\(newDate.day)")!
//let weekday = Calendar.current.component(.weekday, from: day)
//print(weekday, newDate)




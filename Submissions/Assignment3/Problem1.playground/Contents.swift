import UIKit
import Foundation

// Problem1
// Struct Date:
struct SDate {
    var day, month, year: Int
    
    static func convertDay(addDay:Int) -> SDate{
        let today = Date()
        let answer = Calendar.current.date(byAdding: .day, value: addDay, to: today)
        let calendar = Calendar.current
        
        return SDate(day: calendar.component(.day, from: answer!), month: calendar.component(.month, from: answer!), year: calendar.component(.year, from: answer!))
    }
}

let instance1 = SDate.convertDay(addDay: 2)
print("\(instance1)")

let instance2 = SDate.convertDay(addDay: 100)
print("\(instance2)")

let instance3 = SDate.convertDay(addDay: 50)
print("\(instance3)")


// Enum WeekDay
enum WeekDay: String {
    case monday = "monday"
    case tuesday = "Tus"
    case wednesday = "Wen"
    case thursday = "Thu"
    case friday = "Fri"
    case saturday = "Sta"
    case sunday = "Sun"
    
    static func vonvertDays(date: SDate)->WeekDay?{
        
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        if let day = formatter.date(from: "\(date.year)/\(date.month)/\(date.day)") {
            let calendar = Calendar.current
            let weekDay = calendar.component(.weekday, from: day)
            
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
let weekday = WeekDay.vonvertDays(date: instance1)
print("\(weekday)")

import UIKit

struct DateFormatted {
    var day = 0
    var month = 0
    var year = 0
    static func setDate(days:Int) -> DateFormatted? {
        //format to create starting date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        //optional binding for starting date
        if let startDate = formatter.date(from: "2019-01-01") {
            //optional binding for creating new date is N days added
            if let newDate = Calendar.current.date(byAdding: .day, value: days - 1, to: startDate) {
                //Uses Calendar component to retrieve day, month, year
                let day = Calendar.current.component(.day, from: newDate)
                let month = Calendar.current.component(.month, from: newDate)
                let year = Calendar.current.component(.year, from: newDate)
                //new instance
                let date = DateFormatted(day: day, month: month, year: year)
                return date
            }
        }
        return nil
    }
}
var dateFormatted = DateFormatted.setDate(days: 365)!;

enum WeekDay:String {
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
    case sunday = "Sunday"
    
    static func getWeekDay (date: DateFormatted) -> WeekDay? {
        //prepare format for the new date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        //creating new date from added date
        if let someDate = formatter.date(from: "\(date.year)-\(date.month)-\(date.day)") {
            //get week day with calendar component
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

print("Your new date is \(weekDay.rawValue) - \(dateFormatted.month)/\(dateFormatted.day)/\(dateFormatted.year)")

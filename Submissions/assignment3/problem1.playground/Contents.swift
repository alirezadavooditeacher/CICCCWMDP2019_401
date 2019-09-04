import UIKit

/* Problem1
 - Struct Date:
 o Define a structure called Date with three integer fields, day, month and year.
 o Define a static method for this structure which receives a number between 1 and 365 and convert it to day, month and year. This function will return a Date struct
 1〜365の数値を受け取るこの構造の静的メソッドを定義し、それを日、月、年に変換します。
 この関数はDate構造体を返します
 
 o Test it: Create a few instances from this struct and test the static function with some different numbers.
 
 -  Enum WeekDay
 o Define an Enumeration with a raw values of type String for its cases to represents days of the week.
 
 o Define a static function for this enumeration which receives a Struct Date and return an Enum Weekday. The method tells what day of the week is the given input date.
 */

struct Date {
    var day = 0
    var month = 0
    var year = 0
    
    init(_ day: Int, _ month: Int, _ year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }
    
    static func getDay (_ day: Int) -> Date? {
        switch day {
        case 1...31:    // January - 31 days
            return Date(day, 1, 2019)
        case 32...59:   // February - 28 days
            return Date(day - 31, 2, 2019)
        case 60...90:   // March - 31 days
            return Date(day - 59, 3, 2019)
        case 91...120:   // April - 30 days
            return Date(day - 90, 4, 2019)
        case 120...151:   // May - 31 days
            return Date(day - 120, 5, 2019)
        case 151...181:   // Jun - 30 days
            return Date(day - 151, 6, 2019)
        case 182...212:   // July - 31 days
            return Date(day - 181, 7, 2019)
        case 213...243:   // August - 31 days
            return Date(day - 212, 8, 2019)
        case 245...273:   // September - 30 days
            return Date(day - 243, 9, 2019)
        case 277...304:   // October - 31 days
            return Date(day - 273, 10, 2019)
        case 308...334:   // November - 30 days
            return Date(day - 304, 11, 2019)
        case 32...365:   // December - 31 days
            return Date(day - 334, 12, 2019)
        default:
            return nil
        }
    }
}


enum WeekDay: String {
    case Sunday
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    
    static func sendDateToWeekDay (_ date: Date) -> WeekDay? {
        if date.month == 1 {
            if date.day == 6 || date.day == 13 || date.day == 20 || date.day == 27 {
                return WeekDay.Sunday
            } else if date.day == 7 || date.day == 14 || date.day == 21 || date.day == 28 {
                return WeekDay.Monday
            } else if date.day == 1 || date.day == 8 || date.day == 15 || date.day == 22 || date.day == 29 {
                return WeekDay.Tuesday
            } else if date.day == 2 || date.day == 9 || date.day == 16 || date.day == 23 || date.day == 30 {
                return WeekDay.Wednesday
            } else if date.day == 3 || date.day == 10 || date.day == 17 || date.day == 24 || date.day == 31 {
                return WeekDay.Thursday
            } else if date.day == 4 || date.day == 11 || date.day == 18 || date.day == 25 {
                return WeekDay.Friday
            } else if date.day == 5 || date.day == 12 || date.day == 19 || date.day == 26 {
                return WeekDay.Saturday
            } else {
                return nil
            }
        } else if date.month == 2 {
            if date.day == 3 || date.day == 10 || date.day == 17 || date.day == 24 {
                return WeekDay.Sunday
            } else if date.day == 4 || date.day == 11 || date.day == 18 || date.day == 25 {
                return WeekDay.Monday
            } else if date.day == 5 || date.day == 12 || date.day == 19 || date.day == 26 || date.day == 29 {
                return WeekDay.Tuesday
            } else if date.day == 6 || date.day == 13 || date.day == 20 || date.day == 27 {
                return WeekDay.Wednesday
            } else if date.day == 7 || date.day == 14 || date.day == 21 || date.day == 28{
                return WeekDay.Thursday
            } else if date.day == 1 || date.day == 8 || date.day == 15 || date.day == 22 {
                return WeekDay.Friday
            } else if date.day == 2 || date.day == 9 || date.day == 16 || date.day == 23 {
                return WeekDay.Saturday
            } else {
                return nil
            }
        } else if date.month == 3 {
            if date.day == 3 || date.day == 10 || date.day == 17 || date.day == 24 || date.day == 31 {
                return WeekDay.Sunday
            } else if date.day == 4 || date.day == 11 || date.day == 18 || date.day == 25 {
                return WeekDay.Monday
            } else if date.day == 5 || date.day == 12 || date.day == 19 || date.day == 26 {
                return WeekDay.Tuesday
            } else if date.day == 6 || date.day == 13 || date.day == 20 || date.day == 27 {
                return WeekDay.Wednesday
            } else if date.day == 7 || date.day == 14 || date.day == 21 || date.day == 28{
                return WeekDay.Thursday
            } else if date.day == 1 || date.day == 8 || date.day == 15 || date.day == 22 || date.day == 29 {
                return WeekDay.Friday
            } else if date.day == 2 || date.day == 9 || date.day == 16 || date.day == 23 || date.day == 30 {
                return WeekDay.Saturday
            } else {
                return nil
            }
        } else if date.month == 4 {
            if date.day == 7 || date.day == 14 || date.day == 21 || date.day == 28 {
                return WeekDay.Sunday
            } else if date.day == 1 || date.day == 8 || date.day == 15 || date.day == 22 || date.day == 29 {
                return WeekDay.Monday
            } else if date.day == 2 || date.day == 9 || date.day == 16 || date.day == 23 || date.day == 30 {
                return WeekDay.Tuesday
            } else if date.day == 3 || date.day == 10 || date.day == 17 || date.day == 24 {
                return WeekDay.Wednesday
            } else if date.day == 4 || date.day == 11 || date.day == 18 || date.day == 25 {
                return WeekDay.Thursday
            } else if date.day == 5 || date.day == 12 || date.day == 19 || date.day == 26 {
                return WeekDay.Friday
            } else if date.day == 6 || date.day == 13 || date.day == 20 || date.day == 27 {
                return WeekDay.Saturday
            } else {
                return nil
            }
        } else if date.month == 5 {
            if date.day == 5 || date.day == 12 || date.day == 19 || date.day == 26 {
                return WeekDay.Sunday
            } else if date.day == 6 || date.day == 13 || date.day == 20 || date.day == 27 {
                return WeekDay.Monday
            } else if date.day == 7 || date.day == 14 || date.day == 21 || date.day == 28 {
                return WeekDay.Tuesday
            } else if date.day == 1 || date.day == 8 || date.day == 15 || date.day == 22 || date.day == 29 {
                return WeekDay.Wednesday
            } else if date.day == 2 || date.day == 9 || date.day == 16 || date.day == 23 || date.day == 30 {
                return WeekDay.Thursday
            } else if date.day == 3 || date.day == 10 || date.day == 17 || date.day == 24 || date.day == 31 {
                return WeekDay.Friday
            } else if date.day == 4 || date.day == 11 || date.day == 18 || date.day == 25 {
                return WeekDay.Saturday
            } else {
                return nil
            }
        } else if date.month == 6 {
            if date.day == 2 || date.day == 9 || date.day == 16 || date.day == 23 || date.day == 30 {
                return WeekDay.Sunday
            } else if date.day == 3 || date.day == 10 || date.day == 17 || date.day == 24{
                return WeekDay.Monday
            } else if date.day == 4 || date.day == 11 || date.day == 18 || date.day == 25 {
                return WeekDay.Tuesday
            } else if date.day == 5 || date.day == 12 || date.day == 19 || date.day == 26 {
                return WeekDay.Wednesday
            } else if date.day == 6 || date.day == 13 || date.day == 20 || date.day == 27 {
                return WeekDay.Thursday
            } else if date.day == 7 || date.day == 14 || date.day == 21 || date.day == 28 {
                return WeekDay.Friday
            } else if date.day == 1 || date.day == 8 || date.day == 15 || date.day == 22 || date.day == 29 {
                return WeekDay.Saturday
            } else {
                return nil
            }
        } else if date.month == 7 {
            if date.day == 7 || date.day == 14 || date.day == 21 || date.day == 28 {
                return WeekDay.Sunday
            } else if date.day == 1 || date.day == 8 || date.day == 15 || date.day == 22 || date.day == 29 {
                return WeekDay.Monday
            } else if date.day == 2 || date.day == 9 || date.day == 16 || date.day == 23 || date.day == 30 {
                return WeekDay.Tuesday
            } else if date.day == 3 || date.day == 10 || date.day == 17 || date.day == 24 || date.day == 31 {
                return WeekDay.Wednesday
            } else if date.day == 4 || date.day == 11 || date.day == 18 || date.day == 25 {
                return WeekDay.Thursday
            } else if date.day == 5 || date.day == 12 || date.day == 19 || date.day == 26 {
                return WeekDay.Friday
            } else if date.day == 6 || date.day == 13 || date.day == 20 || date.day == 27 {
                return WeekDay.Saturday
            } else {
                return nil
            }
        } else if date.month == 8 {
            if date.day == 4 || date.day == 11 || date.day == 18 || date.day == 25 {
                return WeekDay.Sunday
            } else if date.day == 5 || date.day == 12 || date.day == 19 || date.day == 26 {
                return WeekDay.Monday
            } else if date.day == 6 || date.day == 13 || date.day == 20 || date.day == 27 {
                return WeekDay.Tuesday
            } else if date.day == 7 || date.day == 14 || date.day == 21 || date.day == 28 {
                return WeekDay.Wednesday
            } else if date.day == 1 || date.day == 8 || date.day == 15 || date.day == 22 || date.day == 29 {
                return WeekDay.Thursday
            } else if date.day == 2 || date.day == 9 || date.day == 16 || date.day == 23 || date.day == 30 {
                return WeekDay.Friday
            } else if date.day == 3 || date.day == 10 || date.day == 17 || date.day == 24 || date.day == 31 {
                return WeekDay.Saturday
            } else {
                return nil
            }
        } else if date.month == 9 {
            if date.day == 1 || date.day == 8 || date.day == 15 || date.day == 22 || date.day == 29 {
                return WeekDay.Sunday
            } else if date.day == 2 || date.day == 9 || date.day == 16 || date.day == 23 || date.day == 30 {
                return WeekDay.Monday
            } else if date.day == 3 || date.day == 10 || date.day == 17 || date.day == 24{
                return WeekDay.Tuesday
            } else if date.day == 4 || date.day == 11 || date.day == 18 || date.day == 25 {
                return WeekDay.Wednesday
            } else if date.day == 5 || date.day == 12 || date.day == 19 || date.day == 26 {
                return WeekDay.Thursday
            } else if date.day == 6 || date.day == 13 || date.day == 20 || date.day == 27 {
                return WeekDay.Friday
            } else if date.day == 7 || date.day == 14 || date.day == 21 || date.day == 28 {
                return WeekDay.Saturday
            } else {
                return nil
            }
        } else if date.month == 10 {
            if date.day == 6 || date.day == 13 || date.day == 20 || date.day == 27 {
                return WeekDay.Sunday
            } else if date.day == 7 || date.day == 14 || date.day == 21 || date.day == 28 {
                return WeekDay.Monday
            } else if date.day == 1 || date.day == 8 || date.day == 15 || date.day == 22 || date.day == 29 {
                return WeekDay.Tuesday
            } else if date.day == 2 || date.day == 9 || date.day == 16 || date.day == 23 || date.day == 30 {
                return WeekDay.Wednesday
            } else if date.day == 3 || date.day == 10 || date.day == 17 || date.day == 24 || date.day == 31 {
                return WeekDay.Thursday
            } else if date.day == 4 || date.day == 11 || date.day == 18 || date.day == 25 {
                return WeekDay.Friday
            } else if date.day == 5 || date.day == 12 || date.day == 19 || date.day == 26 {
                return WeekDay.Saturday
            } else {
                return nil
            }
        } else if date.month == 11 {
            if date.day == 3 || date.day == 10 || date.day == 17 || date.day == 24{
                return WeekDay.Sunday
            } else if date.day == 4 || date.day == 11 || date.day == 18 || date.day == 25 {
                return WeekDay.Monday
            } else if date.day == 5 || date.day == 12 || date.day == 19 || date.day == 26 {
                return WeekDay.Tuesday
            } else if date.day == 6 || date.day == 13 || date.day == 20 || date.day == 27 {
                return WeekDay.Wednesday
            } else if date.day == 7 || date.day == 14 || date.day == 21 || date.day == 28 {
                return WeekDay.Thursday
            } else if date.day == 1 || date.day == 8 || date.day == 15 || date.day == 22 || date.day == 29 {
                return WeekDay.Friday
            } else if date.day == 2 || date.day == 9 || date.day == 16 || date.day == 23 || date.day == 30 {
                return WeekDay.Saturday
            } else {
                return nil
            }
        } else if date.month == 12 {
            if date.day == 1 || date.day == 8 || date.day == 15 || date.day == 22 || date.day == 29 {
                return WeekDay.Sunday
            } else if date.day == 2 || date.day == 9 || date.day == 16 || date.day == 23 || date.day == 30 {
                return WeekDay.Monday
            } else if date.day == 3 || date.day == 10 || date.day == 17 || date.day == 24 || date.day == 31 {
                return WeekDay.Tuesday
            } else if date.day == 4 || date.day == 11 || date.day == 18 || date.day == 25 {
                return WeekDay.Wednesday
            } else if date.day == 6 || date.day == 13 || date.day == 20 || date.day == 27 {
                return WeekDay.Thursday
            } else if date.day == 7 || date.day == 14 || date.day == 21 || date.day == 28 {
                return WeekDay.Friday
            } else if date.day == 5 || date.day == 12 || date.day == 19 || date.day == 26 {
                return WeekDay.Saturday
            } else {
                return nil
            }
        }
        
        return nil
    }
    
}

var days1 = 30
var days2 = 100
var days3 = 213
var days4 = 365


if let date1 = Date.getDay(days1), let date = Date.getDay(days1) {
    print("\(date1.month).\(date1.day).\(date1.year)", terminator : " ")
    if let weekDay1 = WeekDay.sendDateToWeekDay(date) {
        print(weekDay1)
    }
}

if  let date2 = Date.getDay(days2), let date = Date.getDay(days2) {
    print("\(date2.month).\(date2.day).\(date2.year)", terminator : " ")
    if let weekDay2 = WeekDay.sendDateToWeekDay(date) {
        print(weekDay2)
    }
}

if let date3 = Date.getDay(days3), let date = Date.getDay(days3) {
    print("\(date3.month).\(date3.day).\(date3.year)", terminator : " ")
    if let weekDay3 = WeekDay.sendDateToWeekDay(date) {
        print(weekDay3)
    }
}

if let date4 = Date.getDay(days4), let date = Date.getDay(days4) {
    print("\(date4.month).\(date4.day).\(date4.year)", terminator : " ")
    if let weekDay4 = WeekDay.sendDateToWeekDay(date) {
        print(weekDay4)
    }
}

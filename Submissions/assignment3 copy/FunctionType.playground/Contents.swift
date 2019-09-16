//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let date:Date = Date()

let format = DateFormatter()
format.dateFormat = "yyyy-MM-dd HH:mm"
format.timeZone = TimeZone(identifier: "America/Vancouver")

print("time: ", format.string(from: date))


struct Date{
    
    var day:Int = 0
    var month:Int = 0
    var year:Int = 0
    
    
    // current date should be got in the function
    // this function add the days and current date
    // so if user put 7 days, this return the 1 week later from now
    mutating func convertToDate(day:Int) -> Date? {
        
        let currentDate = Calendar.current.component
        
        switch self.day {
            
        case 1...31:
            self.month = 1
            self.day = self.day
            print("aaa")
            
        case 32...59:
            self.month = 2
            self.day = day - 31
            
        case 60...90:
            self.month = 3
            self.day = day - 59
            
        case 91...120:
            self.month = 4
            self.day = day - 90
            
        case 121...151:
            self.month = 5
            self.day = day - 120
            
        case 152...180:
            self.month = 6
            self.day = day - 151
            
        case 181...211:
            self.month = 7
            self.day = day - 180
            
        case 212...243:
            self.month = 8
            self.day = day - 211
            
        case 244...273:
            self.month = 9
            self.day = day - 245
            
        case 274...304:
            self.month = 10
            self.day = day - 274
            
        case 305...334:
            self.month = 11
            self.day = day - 305
            
        case 335...365:
            self.month = 12
            self.day = day - 335
            
        default:
            break
        }
        
        return self
    }

}

var dateVariable = Date()
dateVariable.convertToDate(day: 566)
dateVariable.day = 3
print(dateVariable)

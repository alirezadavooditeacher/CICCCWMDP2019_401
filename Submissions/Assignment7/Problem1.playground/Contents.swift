import UIKit

extension Dictionary {
    func seeStudents(predicate: (Key) -> Bool) -> [Value] {
        var valueArray = [Value]()
        for (key, value) in self {
            if predicate(key) {
                valueArray.append(value)
            }
        }
        return valueArray
    }
}

struct Student {
    let firstName: String
    let lastName: String
    var gpa: Int
    let studentID: String
    
    static func studentIDGenerate() -> String {
        let number = Int.random(in: 10000...99999)
        return String(number)
    }
}

var studentDict = [String: Student]()
var st1 = Student(firstName: "Lucas", lastName: "Rocha", gpa: 87, studentID: Student.studentIDGenerate())
var st2 = Student(firstName: "Ellie", lastName: "Williams", gpa: 87, studentID: Student.studentIDGenerate())
var st3 = Student(firstName: "Joel", lastName: "Miller", gpa: 87, studentID: Student.studentIDGenerate())

studentDict[st1.studentID] = st1
studentDict[st2.studentID] = st2
studentDict[st3.studentID] = st3

let predicate = {(num: String) -> Bool in return Int(num)! % 2 != 0}

print(studentDict.seeStudents(predicate: predicate))

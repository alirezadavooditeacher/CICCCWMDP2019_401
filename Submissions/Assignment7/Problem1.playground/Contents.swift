import UIKit

extension Dictionary{
    
    func returnValue(_ predicate:(Key)->Bool)->[Value]{
        var returnValue:[Value] = []
        
        for (key,value) in self {
            if predicate(key) {
                returnValue.append(value)
            }
        }
        
        return returnValue
    }
}

struct Student {
    var firstName: String
    var lastName: String
    var gpa:Int
    var studentID: String
    
    init(firstName: String, lastName: String, gpa:Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.gpa = gpa
        self.studentID = Student.studentIDGenerate()
    }
    static func studentIDGenerate() ->String {
        
        let randomStudentID = String(Int.random(in: 10000...99999))
        return randomStudentID
    }
}

var student1 = Student(firstName: "Shoko", lastName: "K", gpa: 89)
//student1.studentID = student1.studentIDGenerate()
var student2 = Student(firstName: "Tama", lastName: "C", gpa: 60)
//student2.studentID = student2.studentIDGenerate()
var student3 = Student(firstName: "Mike", lastName: "D", gpa: 50)
//student3.studentID = student3.studentIDGenerate()

var dictionary = [student1.studentID:student1, student2.studentID:student2, student3.studentID:student3]

var checkOddNum = {(studentID:String)->Bool in return Int(studentID)! % 2 != 0}

let answer = dictionary.returnValue(checkOddNum)
print("dictionary: \(dictionary)")
print()
print("answer: \(answer)")

import UIKit

extension Dictionary {
    func predicate(_ predic: (Key)->Bool) -> [Value] {
        var result = [Value]()
        for (index, element) in self {
            if predic(index) {
                result.append(element)
            }
        }
        return result
    }
}

struct Student {
    var firstName: String
    var lastName:String
    var gpa: Double
    var StudentID: String
    
    static func studentIDGenerate() -> String {
        return String(Int.random(in: 10000...99999))
    }
}

let id1 = Student.studentIDGenerate()
let student1 = Student(firstName: "John", lastName: "Doe", gpa: 86, StudentID: id1)

let id2 = Student.studentIDGenerate()
let student2 = Student(firstName: "Mark", lastName: "Knopfler", gpa: 79, StudentID: id2)

let id3 = Student.studentIDGenerate()
let student3 = Student(firstName: "Dexter", lastName: "Holland", gpa: 93, StudentID: id3)

var students:[String: Student] = [
    id1: student1,
    id2: student2,
    id3: student3
]

var predicate = {
    (_ id: String) -> Bool in
    if Int(id)! % 2 == 0 {
        return false
    } else {
        return true
    }
}

let result = students.predicate(predicate)
if !result.isEmpty {
    for student in result {
        print("\(student.StudentID) - \(student.firstName) \(student.lastName) = \(student.gpa)")
    }
}

import UIKit

struct Student {
    let firstName, lastName, address: String
    let yearOfBirth: Date
    let gpa:Int
    
    static func printStudent(studentInf:Student){
        print("firstName: \(studentInf.firstName)")
        print("lastName: \(studentInf.lastName)")
        print("address: \(studentInf.address)")
        print("yearOfBirth: \(studentInf.yearOfBirth)")
        print("GPA: \(studentInf.gpa)")
    }
}

class Classroom {
    var students = [Student]()
    
    func generateList() ->[Student]{
        
        for i in 1...10 {
            
            let firstNM = "F\(i)"
            let lastNM = "L\(i)"
            let address = "address\(i)"
            let day = Date()
            let birth = Calendar.current.date(byAdding: .day, value: -Int.random(in: 1...1000), to: day)!
            let gpa = Int.random(in: 1...100)
            students.append(Student(firstName: firstNM, lastName: lastNM, address: address, yearOfBirth: birth, gpa: gpa))
        }
        
        return students
    }
    
    func getHighestGpa(studentsInf:[Student]) {
        
        var highestGpt = 0
        var highestStudent = [Student]()
        for student in studentsInf {
            if highestGpt < student.gpa {
                highestGpt = student.gpa
                highestStudent = [student]
            }
        }
        
        print("heiestStudent: \(highestStudent)")
        print("highestGpt: \(highestGpt)")
    }
}

let test = Classroom()
let studentsInf1 = test.generateList()
test.getHighestGpa(studentsInf: studentsInf1)

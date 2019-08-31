import UIKit

struct Student {
    var firstName = ""
    var lastName = ""
    var address = ""
    var birthYear = 0
    var gpa = 0
    //problem instructions say to set static method here
    //however I cannot print properties with they are not static
    func printStudent () {
        print("Name: \(self.firstName) \(self.lastName)")
        print("Address: \(self.address)")
        print("Birthdate Year: \(self.birthYear)")
        print("GPA: \(self.gpa)")
    }
}

class Classroom {
    var students = [Student]()
    func generateList() {
        for i in 1...10 {
            let firstName = "First Name \(i)"
            let lastName = "Last Name \(i)"
            let address = "Address \(i)"
            let birthYear = 1920 + Int.random(in: 1...100)
            let gpa = Int.random(in: 1...100)
            students.append(Student(firstName: firstName, lastName: lastName, address: address, birthYear: birthYear, gpa: gpa))
        }
    }
    func getHighestGpa () -> Student? {
        var highestGpa = 0
        var bestStudent = students[0]
        for student in students {
            if student.gpa > highestGpa {
                highestGpa = student.gpa
                bestStudent = student
            }
        }
        
        bestStudent.printStudent()
        return bestStudent
    }
}

let classroom = Classroom()
classroom.generateList()
let student = classroom.getHighestGpa()

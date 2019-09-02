import UIKit
//problem5
struct Student{
    var firstName:String = ""
    var lastName:String = ""
    var address:String = ""
    var yearOfBirth:Int = 0
    var gpa:Int = 0
    static func printStudent(st:Student){
        print(st)
    }
}
class Classroom{
    var allStudent = [Student]()
    func generateList(){
        var student = Student()
        student.firstName = "A"
        student.lastName = "a"
        student.address = " 1 Ave"
        student.yearOfBirth = 1990
        student.gpa = 74
        allStudent.append(student)
        student.firstName = "B"
        student.lastName = "b"
        student.address = " 2 Ave"
        student.yearOfBirth = 1988
        student.gpa = 89
        allStudent.append(student)
        student.firstName = "C"
        student.lastName = "c"
        student.address = " 3 Ave"
        student.yearOfBirth = 1993
        student.gpa = 88
        allStudent.append(student)
        for i in 0..<allStudent.count{
            Student.printStudent(st:allStudent[i])
        }
    }
    func getHighestGap(){
        let maxGpa = max(allStudent[0].gpa, allStudent[1].gpa, allStudent[2].gpa)
        for i in 0..<allStudent.count{
            if maxGpa == allStudent[i].gpa {
                print("The highest GPA student:")
                Student.printStudent(st: allStudent[i])
            }
        }
    }
}

let cl = Classroom()
cl.generateList()
cl.getHighestGap()

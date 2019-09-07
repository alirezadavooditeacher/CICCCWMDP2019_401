import UIKit

/* Problem5
 - Define a struct classed Student. Each student is defined by the following attributes:
 o firstName
 o lastName
 o address
 o Year of birth
 o gpa
 
 - Define a class called Classroom with an instance property which is an array of Students.
 - 生徒の配列であるインスタンスプロパティを使用して、Classroomというクラスを定義します。
 
 - Define a static method called printStudent for the struct Student to print the student’s
 information (firstName, lastName, address, year of birth and gpa)
 
 - Define an instance method for the class Classroom, called generateList. This method create 10 instances of the class students with some arbitrary information and add them to the listof students.
 - generateListと呼ばれるインスタンスメソッドをクラスClassroomのために定義します。
 このメソッドは、任意の情報を持つクラスの生徒のインスタンスを10個作成し、それらを生徒のリストに追加します。
 
 - Define an instance method for the class Classroom, called getHighestGpa. This methods will search into the array of Students and returns the student with the highest GPA. The method also prints the information of the student with the highest GPA.
 
 */

struct Student {
    let firstName: String
    let lastName: String
    let address: String
    let birth: Int
    let gpa: Int
}

class Classroom {
    var students = [Student(firstName: "A", lastName: "Student1", address: "BC", birth: 1990, gpa: 4),
                    Student(firstName: "B", lastName: "Student2", address: "BC", birth: 1991, gpa: 3),
                    Student(firstName: "C", lastName: "Student3", address: "BC", birth: 1992, gpa: 2),
                    Student(firstName: "D", lastName: "Student4", address: "BC", birth: 1993, gpa: 1),
                    Student(firstName: "E", lastName: "Student5", address: "BC", birth: 1994, gpa: 2)]
    
    static func printStudent() {
        for student in Classroom().students {
            print(student)
        }
        print("\n")
    }
    
    func generateList() {  // how can I call this function
        
        let student6 = Student(firstName: "F", lastName: "Student6", address: "BC", birth: 1995, gpa: 3)
        let student7 = Student(firstName: "G", lastName: "Student7", address: "BC", birth: 1996, gpa: 4)
        let student8 = Student(firstName: "H", lastName: "Student8", address: "BC", birth: 1997, gpa: 3)
        let student9 = Student(firstName: "I", lastName: "Student9", address: "BC", birth: 1998, gpa: 2)
        let student10 = Student(firstName: "J", lastName: "Student10", address: "BC", birth: 1999, gpa: 1)
        let student11 = Student(firstName: "K", lastName: "Student11", address: "BC", birth: 2000, gpa: 2)
        let student12 = Student(firstName: "L", lastName: "Student12", address: "BC", birth: 2001, gpa: 3)
        let student13 = Student(firstName: "M", lastName: "Student13", address: "BC", birth: 2002, gpa: 4)
        let student14 = Student(firstName: "N", lastName: "Student14", address: "BC", birth: 2003, gpa: 5)
        let student15 = Student(firstName: "O", lastName: "Student15", address: "BC", birth: 2004, gpa: 4)
        
        //self.students.append(student6)
        
        self.students += [student6, student7, student8, student9, student10, student11, student12, student13, student14, student15]
    }
    
    
    func getHighestGpa() -> (String, Int) {
        var gpa = 0
        var highest = Student(firstName: "", lastName: "", address: "", birth: 0, gpa: 0)
        for student in students {
            if student.gpa > gpa {
                gpa = student.gpa
                highest = student
            }
        }
        print(highest)
        return (highest.firstName, highest.gpa)
    }
    
    
}

Classroom.printStudent()

let classroom = Classroom()
classroom.generateList()  // Add new students
classroom.getHighestGpa()

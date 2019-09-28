import UIKit

/* Problem4
 Imagine you design a mobile view or a webpage which contains a table (Similar to the picture below). The table lists the students in our program. Create an application using the delegate approach which given a list of students it create the table. At the minimum you need two classes View and Table.
 In order to create the table, the Table should know about the following information. Also Imagine the View has a list of students and it uses a Table object to show the list of Students.
 - The View class has the list of students.
 - The list of students is not fixed and could be arbitrary. In other word, if there are 10
 students in the list, then the table has 10 rows. If there are only 2 students in the list, then
 table shows 2 rows and so on.
 
 - The Table class is responsible for showing the information in the table.
 Ali David, 80
 -----------------------
 Peter Jackson, 79
 -----------------------
 Donald Trump, 81
 -----------------------
 William Chen, 76
 -----------------------
 Ana Leu, 82
 
 
 - The Table requires the following information to be able to show the information
 -
 o Student data. Each row represents one students
 o How many students are in the list
 o The fixed height of each row
 - As mentioned, each row in the table represents an item which contains the following properties
 1- firstName 2-LastName 3- GPA
 
 */

class MobileView {
    var students = [Student]()
    var hight = 10
    func showTable() {
        tc().printStudents(self)
    }
}

struct Student {
    var firstName: String
    var lastName: String
    var gpa: Int
}

protocol tableCreator {
    func printStudents(_ students: MobileView)
}

class tc: tableCreator {
    func printStudents(_ mobileView: MobileView) {
        var cnt = 0
        for student in mobileView.students {
            cnt += 1
            if cnt == 1 {
                print(" \(mobileView.students.count) students' table")
            } else if cnt == mobileView.students.count {
                print("-----------------------\n \(student.firstName) \(student.lastName), \(student.gpa)\n-----------------------")
            } else {
                print("-----------------------\n \(student.firstName) \(student.lastName), \(student.gpa)")
            }
        }
    }
    
}


let student1 = Student(firstName: "Ali", lastName: "David", gpa: 80)
let student2 = Student(firstName: "Peter", lastName: "Jackson", gpa: 79)
let student3 = Student(firstName: "Donald", lastName: "Trump", gpa: 81)
let student4 = Student(firstName: "William", lastName: "Chen", gpa: 76)
let student5 = Student(firstName: "Ana", lastName: "Leu", gpa: 82)

let mv = MobileView()
mv.students = [student1,student2,student3,student4,student5]

mv.showTable()

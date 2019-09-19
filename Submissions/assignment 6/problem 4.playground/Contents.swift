import UIKit

struct Student {
    var firstName: String
    var lastName: String
    var gpa: Int
}
class View {
    var students: [Student] = []
    var studentsCounter: Int {
        return students.count
    }
    static var rowHeight = 20
    weak var table: TablePrinter?
    func addStudent(student: Student) {
        students.append(student)
    }
    func show() {
        table?.printTable(self)
    }
}

protocol TablePrinter: AnyObject {
    func printTable(_ view:View)
}

class Table: TablePrinter {
    func printTable(_ view: View) {
        print("Total of \(view.studentsCounter)")
        for student in view.students {
            print("\(student.firstName) \(student.lastName), \(student.gpa)")
        }
        print("Rows are \(View.rowHeight) height")
    }
}

let student1 = Student(firstName: "Ali", lastName: "David", gpa: 80)
let student2 = Student(firstName: "Peter", lastName: "Jackson", gpa: 79)
let student3 = Student(firstName: "Donald", lastName: "Trump", gpa: 81)
let student4 = Student(firstName: "William", lastName: "Chen", gpa: 76)
let student5 = Student(firstName: "Ana", lastName: "Leu", gpa: 82)

let view = View()
let table = Table()

view.addStudent(student: student1)
view.addStudent(student: student2)
view.addStudent(student: student3)
view.addStudent(student: student4)
view.addStudent(student: student5)

view.table = table
view.show()

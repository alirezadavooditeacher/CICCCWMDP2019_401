import Cocoa

var str = "Hello, playground"

class View {
    var table:Table
    init(table:Table) {
        self.table = table
    }
}

class Table {
    var howManyStudents:Int
    var arrStudents:[Student] = []
    init(students: Student...) {
        self.howManyStudents = students.count
        for student in students {
            arrStudents.append(student)
        }
    }
    
    func printTable() {
        let arrStudents = self.arrStudents
        print("=========================")
        for value in arrStudents{
            print("\(value.firstName) \(value.lastName) : \(value.GPA)")
            print("-------------------------")
        }
    }
}

class Student {
    let firstName:String
    let lastName:String
    let GPA:Int
    
    init(firstName: String, lastName:String, GPA: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.GPA = GPA
    }
    
}

let student1 = Student(firstName: "Shoko", lastName: "Hashimoto", GPA: 87)
let student2 = Student(firstName: "Shihomi", lastName: "Kitajima", GPA: 67)

let tableTest = Table(students: student1, student2)
let view = View(table: tableTest)
tableTest.printTable()

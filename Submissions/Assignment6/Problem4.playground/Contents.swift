import UIKit

// Problem 4

class Student {
    let firstName: String
    var lastName: String
    var gpa: Int
    
    init(fn: String, ln: String, gpa: Int) {
        self.firstName = fn
        self.lastName = ln
        self.gpa = gpa
    }
}

class View {
    var listOfstudents = [Student]()
    var delegate: PrintView?
    static var rowHeight = 10
}

protocol PrintView {
    func printInfo(view: View)
}

class Table: PrintView {
    func printInfo(view: View) {
        for student in view.listOfstudents {
            print("\(student.firstName) \(student.lastName), \(student.gpa)")
        }
        print("Row height: \(View.rowHeight)")
    }
}

let student1 = Student(fn: "Lucas", ln: "Rocha", gpa: 100)
let student2 = Student(fn: "Alan", ln: "Ferreira", gpa: 89)
let student3 = Student(fn: "John", ln: "Doe", gpa: 20)
let student4 = Student(fn: "Morty", ln: "Smith", gpa: 76)
let student5 = Student(fn: "Rick", ln: "Sanchez", gpa: 137)

let view = View()
let table = Table()

view.delegate = table

view.listOfstudents.append(student1)
view.listOfstudents.append(student2)
view.listOfstudents.append(student3)
view.listOfstudents.append(student4)
view.listOfstudents.append(student5)

view.delegate?.printInfo(view: view)

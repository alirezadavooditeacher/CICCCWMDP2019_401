import UIKit

struct student {
    var fistName:String
    var lastName:String
    var gpa:Int
}
class View {
    var studentsList = [student]()
    weak var delegate:printerDelegate?
    init(studentList:[student]) {
        self.studentsList = studentList
    }
    
    func makeTable() {
        delegate?.printResult(view: self)
    }
}
protocol printerDelegate: AnyObject {
    func printResult(view:View)
}
class Table:printerDelegate{
    func printResult(view:View) {
        print("--------------------")
        for student in view.studentsList {
            print("| \(student.fistName) \(student.lastName), \(student.gpa)       |")
            print("--------------------")
        }
        
    }
}


let s1 = student(fistName: "Mari", lastName: "D", gpa: 95)
let s2 = student(fistName: "Taro", lastName: "K", gpa: 70)
let s3 = student(fistName: "Mice", lastName: "C", gpa: 50)
let s4 = student(fistName: "Alex", lastName: "T", gpa: 45)

let view = View(studentList: [s1,s2,s3,s4])
let table = Table()
view.delegate = table
view.makeTable()


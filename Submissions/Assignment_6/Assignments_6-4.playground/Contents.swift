import UIKit

class Student{
    var firstname: String
    var lastname: String
    var GPA:Double
    init(firstname:String, lastname: String, GPA:Double){
        self.firstname = firstname
        self.lastname = lastname
        self.GPA = GPA
    }
}

class View{
    static var listOfStudent = [Student]()
    static weak var delegate: tableDelegate?
    static func printList(){
        delegate?.showList()   //
    }
    
}

protocol tableDelegate: AnyObject{
    func showList()
}



class Table:tableDelegate {
    func showList() {
        let viewList = View.listOfStudent
        for value in viewList{
            print("\(value.firstname) \(value.lastname) \(value.GPA)")
        }
    }
}

let st1 = Student.init(firstname: "Sam", lastname: "Lai", GPA: 78)
let st2 = Student.init(firstname: "Ted", lastname: "Haung", GPA: 86)
let st3 = Student.init(firstname: "Iva", lastname: "Lu", GPA: 94)
let st4 = Student.init(firstname: "Olivia", lastname: "Sim", GPA: 85)

View.listOfStudent.append(st1)
View.listOfStudent.append(st2)
View.listOfStudent.append(st3)
View.listOfStudent.append(st4)
let table = Table() //important
View.delegate = table //important
View.printList()


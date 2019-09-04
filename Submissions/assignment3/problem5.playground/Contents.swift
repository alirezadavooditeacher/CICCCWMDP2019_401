import Cocoa

var str = "Hello, playground"


struct Student{
    var firstName:String, lastName:String, address:String, YearOfBirth:Int, gpa:Double
}

class Classroom {
    var arrStudents:[Student] = []
    let classroom = Classroom()
    static func printStudent(firstName:String, lastName:String, address:String, YearOfBirth:Int, gpa:Double) {
        
        let classroom = Classroom()
        var student = Student(firstName: firstName, lastName: lastName, address: address, YearOfBirth: YearOfBirth, gpa: gpa)
        
        classroom.arrStudents.append(student)
        print(classroom.arrStudents)
        
        //mandatory
        //        for value in classroom.arrStudents {
        //
        //             print("Student : \(value)")
        //        }
        
    }
    
    func generateList(){
        Classroom.printStudent(firstName: "Shihomi", lastName: "Kitajima", address: "62nd ave", YearOfBirth: 1997, gpa: 2.8)
        Classroom.printStudent(firstName: "Rose", lastName: "lay", address: "metroTown", YearOfBirth: 1993, gpa: 4.5)
        Classroom.printStudent(firstName: "Shoko", lastName: "Hashimoto", address: "Joyce", YearOfBirth: 1992, gpa: 4.5)
        Classroom.printStudent(firstName: "Henrique", lastName: "???", address: "King Edward", YearOfBirth: 1988, gpa: 4.5)
        Classroom.printStudent(firstName: "Lucas", lastName: "Rocha", address: "Joyce2", YearOfBirth: 2000, gpa: 4.5)
        Classroom.printStudent(firstName: "Risa", lastName: "Takata", address: "commercial Broadway", YearOfBirth: 1995, gpa: 4.5)
        Classroom.printStudent(firstName: "Junya", lastName: "Yamada", address: "commercial Broadway", YearOfBirth: 1992, gpa: 4.5)
        Classroom.printStudent(firstName: "Francois", lastName: "???", address: "Marine Drive", YearOfBirth: 1983, gpa: 4.5)
        Classroom.printStudent(firstName: "Marie", lastName: "Otaki", address: "ChinaTown", YearOfBirth: 1988, gpa: 4.5)
        Classroom.printStudent(firstName: "Yesl", lastName: "Park", address: "Patterson", YearOfBirth: 1992, gpa: 5.0)
        
        
    }
    
    func getHighestGpa() -> Double{
        let classroom = Classroom()
        var result:Double = 0
        
        classroom.generateList()
        
        
        
        for arrStudent in arrStudents {
            if arrStudent.gpa > result {
                result = arrStudent.gpa
            }
        }
        
        print(result)
        return result
    }
}

let classroom = Classroom()
classroom.generateList()
classroom.getHighestGpa()



import Cocoa

var str = "Hello, playground"

struct Student{
    var firstName:String, lastName:String, address:String, YearOfBirth:Int, gpa:Double
    static func printStudent(firstName:String, lastName:String, address:String, YearOfBirth:Int, gpa:Double) {
        
        let classroom = Classroom()
        let student = Student(firstName: firstName, lastName: lastName, address: address, YearOfBirth: YearOfBirth, gpa: gpa)
        
//        classroom.arrStudents.append(student)
//        print(classroom.arrStudents)
    }
}

//var arrStudents:[Student] = []

class Classroom {
    var arrStudents:[Student] = []
//    let classroom = Classroom()
    
    
    func generateList(){
        arrStudents.append(Student(firstName: "Shihomi", lastName: "Kitajima", address: "62nd ave", YearOfBirth: 1997, gpa: 2.8))
        arrStudents.append(Student(firstName: "Rose", lastName: "lay", address: "metroTown", YearOfBirth: 1993, gpa: 5.0))
        arrStudents.append(Student(firstName: "Shoko", lastName: "Hashimoto", address: "Joyce", YearOfBirth: 1992, gpa: 4.5))
        arrStudents.append(Student(firstName: "Henrique", lastName: "???", address: "King Edward", YearOfBirth: 1988, gpa: 4.5))
        arrStudents.append(Student(firstName: "Lucas", lastName: "Rocha", address: "Joyce2", YearOfBirth: 2000, gpa: 4.5))
        arrStudents.append(Student(firstName: "Risa", lastName: "Takata", address: "commercial Broadway", YearOfBirth: 1995, gpa: 4.5))
        arrStudents.append(Student(firstName: "Junya", lastName: "Yamada", address: "commercial Broadway", YearOfBirth: 1992, gpa: 4.5))
        arrStudents.append(Student(firstName: "Francois", lastName: "???", address: "Marine Drive", YearOfBirth: 1983, gpa: 4.5))
        arrStudents.append(Student(firstName: "Marie", lastName: "Otaki", address: "ChinaTown", YearOfBirth: 1988, gpa: 4.5))
        arrStudents.append(Student(firstName: "Yesl", lastName: "Park", address: "Patterson", YearOfBirth: 1992, gpa: 4.0))
   
        
    }
    
    func getHighestGpa() -> (String,Double){
        let classroom = Classroom()
        var result:Double = 0
        var bestStudent:Student = arrStudents[0]
        
        classroom.generateList()
        
        for arrStudent in arrStudents {
            if arrStudent.gpa > result {
                result = arrStudent.gpa
                bestStudent = arrStudent
            }
        }
        
        print(" The best student is \(bestStudent.firstName) and the best score is \(result) ")
        return (bestStudent.firstName, result)
    }
}

let classroom = Classroom()
classroom.generateList()
classroom.getHighestGpa()


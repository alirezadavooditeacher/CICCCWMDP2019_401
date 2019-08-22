import UIKit

func findTopStudent(students:[(String, Int, Int, Int, Int, Int)]) -> (String, Int)? {
    
    guard !students.isEmpty else {
        print("No student informed")
        return nil
    }
    
    var topStudent = ("", 0)
    var gpa = 0;
    for student in students {
        gpa = student.1 + student.2 + student.3 + student.4 + student.5
        gpa = gpa/5
        if gpa > topStudent.1 {
            topStudent = (student.0, gpa)
        }
    }
    
    return topStudent
}
let students = [
    ("Student 1", 34, 98, 75, 17, 0),
    ("Student 2", 73, 35, 27, 84, 58),
    ("Student 3", 83, 73, 23, 95, 73),
    ("Student 4", 49, 84, 35, 95, 34),
]
if let (name, gpa) = findTopStudent(students: students) {
    print("The top student is \(name) and its GPA is \(gpa)")
}

import UIKit


class student {
    var name: String = ""
    var scores = [Int]()
    var average:Int {
        var totalSum = 0
        for score in scores {
            totalSum += score
        }
        return totalSum / 4
    }
}

let student1 = student()
student1.name = "A"
student1.scores = [40,80,55,60]

let student2 = student()
student2.name = "B"
student2.scores = [95,80,70,60]

let student3 = student()
student3.name = "C"
student3.scores = [10,20,60,10]

var allStudents = [student1,student2,student3]

func findTopStudent(studentsList:[student]) -> (String,Int){
    
    var topStudent = ""
    var topAverage = 0
    for student in studentsList {
        if topAverage < student.average {
            topStudent = student.name
            topAverage = student.average
        }
    }
    
    return (topStudent,topAverage)
}

let answer = findTopStudent(studentsList: allStudents)
print(answer)

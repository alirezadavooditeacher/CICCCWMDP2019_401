import UIKit
//Problem1
class student{
    var Name:String = ""
    var Scores = [Int]()
    var Average: Double{
        get{
            var sum = 0
            for value in Scores{
                sum = sum + value
            }
            return Double(sum)/Double(Scores.count)
        }
    }
}

let student_1 = student()
student_1.Name = "A"
student_1.Scores = [83,67,85,95]

let student_2 = student()
student_2.Name = "B"
student_2.Scores = [76,85,97,96]

let student_3 = student()
student_3.Name = "C"
student_3.Scores = [96,73,73,95]

var all = [student]()
all.append(student_1)
all.append(student_2)
all.append(student_3)

var topGrade = 0.0
var topStudentIndex = 0
for i in 0..<all.count{
    if all[i].Average > topGrade{
        topGrade = all[i].Average
        topStudentIndex = i
    }
}

print("Top student name: \(all[topStudentIndex].Name)\nAverage score: \(all[topStudentIndex].Average)")

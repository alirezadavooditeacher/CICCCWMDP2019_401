import UIKit

/* Problem1
 Define a class student as following:
 • The class has the following stored properties:
 o Name: which is a string
 o Scores: which is an array of course scores.
 • The class also has a computed property called average which is the average of courses’
 scores.
 • Define an array of arbitrary students. (Instance of students with random names and scores)
 • Find the top rank student.
 */

class Student {
    // stored properties
    var name: String = ""
    var scores = [Int]()
    
    // computed property
    var average: Int {
        var sum = 0
        for score in scores {
            sum += score
        }
        return sum / scores.count
    }
}

let student = Student()
// student1
student.name = "studentA"
student.scores = [13,53,32,41,96]
let st1 = (student.name, student.average)
// student2
student.name = "studentB"
student.scores = [27,34,71,26,43]
let st2 = (student.name, student.average)
// student3
student.name = "studentC"
student.scores = [72,53,34,47,53]
let st3 = (student.name, student.average)
// student4
student.name = "studentD"
student.scores = [54,27,63,54,57]
let st4 = (student.name, student.average)
// student5
student.name = "studentE"
student.scores = [65,37,56,84,51]
let st5 = (student.name, student.average)

var students = [st1,st2,st3,st4,st5]

// find the top average in the students
var temp = 0
var top = ("",0)
for student in students {
    if student.1 > temp {
        temp = student.1
        top = student
    }
}
print(top)

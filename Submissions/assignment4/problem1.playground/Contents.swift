import Cocoa

var str = "Hello, playground"

class Student {
    var name:String = "", scores:[Double] = []
    
    // this code below is changed from closure to getter method which is read only.
    var average:Double {
        
        var sum = 0.0
        for value in scores {
            sum += value
        }
        
        let result:Double = sum / Double(scores.count)
        return result
        
    }
}

var student1 = Student()
var arrStudents:[Student] = []

let student1name = "Henrique"
let student1scores = [50.0, 70.76, 77.00, 89.00]


student1.name = student1name
student1.scores = student1scores
arrStudents.append(student1)


var student2 = Student()
let student2name = "Shihomi"
let student2scores = [78.0,17.0,98.0,44.0]

student2.name = student2name
student2.scores = student2scores
arrStudents.append(student2)


for value in arrStudents {
    print(value.name)
    print(value.scores)
}

func findTopStudent() -> (String, Double){
    
    var topGpa = 0.0
    var topStudent = ""
    for value in arrStudents {
        if topGpa < value.average {
            topGpa = value.average
            topStudent = value.name
        }
    }
    return (topStudent, topGpa)
    
}

print(findTopStudent())


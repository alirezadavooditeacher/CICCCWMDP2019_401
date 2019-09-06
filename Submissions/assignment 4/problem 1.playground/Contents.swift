import UIKit

class Student {
    var name = ""
    var scores = [Double]()
    var average: Double {
        var total:Double = 0
        for score in scores {
            total += score
        }
        return scores.isEmpty ? 0 : total/Double(scores.count)
    }
    init(name:String, scores:[Double]) {
        self.name = name
        self.scores = scores
    }
    static func getTopStudent (_ students:[Student]) -> Student? {
        
        guard !students.isEmpty else {
            return nil
        }
        
        var topStudent = Student(name: "", scores: [])
        for student in students {
            if student.average > topStudent.average {
                topStudent = student
            }
        }
        return topStudent
    }
}

let shoko = Student(name: "Shoko", scores: [80,65,74,86,95])
let henrique = Student(name: "Henrique", scores: [76,59,83,95,73])
let shihomi = Student(name: "Shihomi", scores: [96,85,85,98,71])
let lucas = Student(name: "Lucas", scores: [77,84,92,85,99])
let rose = Student(name: "Rose", scores: [70,82,75,94,89])

if let topSudent = Student.getTopStudent([shoko, henrique, shihomi, lucas, rose]) {
    print("The top student is \(topSudent.name) and its average is \(topSudent.average)")
}

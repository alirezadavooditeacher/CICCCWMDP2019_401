import UIKit

struct Student{
    var firstName:String
    var lastName:String
    var gpa: Double
    static var StudentID:String = ""
    static func strudentIDGenerate()->String{
        StudentID = String(Int.random(in: 10000...99999))
        return StudentID
    }
}


let closure = {(ID:String)->Bool in
    if let IDInt = Int(ID){
        if IDInt % 2 == 1 {return true}
    }
    return false
}

extension Dictionary{
    
    func odd(closure:(Key)->Bool)->[Value]{
        var value = [Value]()
        for k in self.keys{
            if closure(k){
                value.append(self[k]!)
            }
        }
        return value
    }
    
}

var d1 = Dictionary<String,Student>()

d1[Student.strudentIDGenerate()] = Student(firstName:"Lily", lastName:"Lay", gpa: 87.5)
d1[Student.strudentIDGenerate()] = Student(firstName:"Ted", lastName:"Smith", gpa: 91.3)
d1[Student.strudentIDGenerate()] = Student(firstName:"Gary", lastName:"Wu", gpa: 83.3)



let arr = d1.odd(closure: closure)
print(arr)



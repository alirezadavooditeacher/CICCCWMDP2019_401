


import Cocoa

var str = "Hello, playground"

extension Dictionary {
    
    func addMethod(predicate: (Key) -> Bool) -> [Value] {
        var list:[Value] = []
        
        for (key, value) in self {
            if predicate(key) {
                list.append(value)
            }
        }
        return list
    }
}

struct Student {
    let firstName:String
    let lastName:String
    let gpa:Int
    
    
    static func studentIDGenerate () -> String {
        return String(Int.random(in: 100000...999999))
//        var temp: Int
//        var digit:String
        
        
//        for _ in 1...6 {
//            temp = Int.random(in: 100000...999999)
//            digit = String(temp)
//            result += digit
//}
//        return result
    }
    
    let studentID:String = studentIDGenerate()
}
var dictionary = [String:Student]()

let a = Student.init(firstName: "shihomi", lastName: "kitajima", gpa: 16)
let b = Student.init(firstName:"Rose", lastName:"lay", gpa:19)
dictionary[a.studentID] = a
dictionary[b.studentID] = b

print(a.studentID)
print(b.studentID)
print(dictionary.addMethod(predicate: { (a:String ) ->Bool in return Int(a)! % 2 != 0}))

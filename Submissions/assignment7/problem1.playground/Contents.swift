import UIKit

/* Problem1
 Write an extension for Dictionary to add a generic method in the dictionary which receives a predicate (a closure of type (Key)-> bool) and return an array of type [Value]. Remember a Dictionary is a generic type with Key and Value.
 predicateを受け取り配列のvalueを返す辞書の中にgeneric method を追加するためにextensionを書きなさい。
 (A predicate is a function type of type (Int)->Bool).
 
 Now, create a struct called Student and add the following properties in it:
 • firstName
 • lastName
 • gpa
 • StudentID
 
 Add a static method to the struct called static studentIDGenerate ()->String. This method create random StudentID for each instance of student. The random studentID is a string in number format which is between 10000 and 99999.
 
 Now create a dictionary of type <String, Student> and initialize it with some sample data. The key of the dictionary is the studentID and the value is the instance of the student.
 
 Now create a closure (predicate) which checks whether the studentID is a string representing an odd number. For instance 898987 is a studentID between 10000 and 99999 which represents an odd number.
 
 Now call the generic method you already defined on the dictionary and gives the above predicate closure as an input to the method. The method should return a list of students whose studentID meets the condition defined in the predicate closure.
 */

extension Dictionary {
    
    func method(_ predivate:(Key) -> Bool) -> [Value] {
        var list:[Value] = []
        
        for (key,value) in self {
            if predivate(key) {
                list.append(value)
            }
        }
        
        return list
    }
}

struct Student {
    let firstName: String
    let lastName: String
    let gpa: Int
    var studentID: String
    
    static func studentIDGenerate() -> String {
        return String(Int.random(in: 10000 ... 99999))
    }
}

//  dict: [studentID:instance of student]
let studentA = Student(firstName: "A", lastName: "Student", gpa: 80, studentID: Student.studentIDGenerate())
var dict: [String:Student] = [studentA.studentID:studentA]


var predicate : (String)-> Bool = { (studentID: String) -> Bool in
    if let sid = Int(studentID) {
        if sid%2 == 0 {
            return true
        } else {
            return false
        }
    }
    return false
}

let list : [Student] = dict.method(predicate)
print(dict)
print(list)

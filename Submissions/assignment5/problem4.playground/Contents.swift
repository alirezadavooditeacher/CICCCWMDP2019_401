import UIKit

/* Problem 4: Error Handling + Extension
 Using an enum called StringError define the following 3 errors:
 • InvalidStringFormatForIntConversionError
 • InvalidEmailFormatError
 • NotValidPassword(numberNeeded: Int)
 
 
 Write an extension for String and add the following methods:
 
 • A method which converts the String to an Int if possible. The method will throws an error called InvalidStringFormatForIntConversion if it is not possible to convert the String to an integer. Only a string whose all characters are digits is allowed to be converted to an Int, otherwise it cannot be converted.
 
 • A method which checks whether the String has a valid email format. A valid email format is like aaaa@b.c. If the string does not have a valid email format, the method will returns an error called InvalidEmailFormatError
 
 • A method which checks wither the string is long enough to be a valid password. A valid password is at least 8 characters long. If the string is less than 8 characters, then the method will throw an error and indicates how many more characters is needed in order to have a valid password. For instance if the string has 6 characters, then it needs 2 more characters in order to be a valid password.
 
 Design a class called TestExtension. The class has 3 static methods each of which test the above scenarios and handle the errors using try/catch block. The methods are
 • func convertStringToInt (word: String) -> Int?
 • func isItAnEmail(word: String)-> Boolean
 • func validatePassword(password: String)-> Boolean
 
 Write some tests in playground to show how the above classes works.
*/


enum StringError: Error {
    case InvalidStringFormatForIntConversionError
    case InvalidEmailFormatError
    case NotValidPassword(numberNeeded: Int)
}

extension String {
    func stringToInt() throws -> Int {
        if let num = Int(self) {
            return num
        } else {
            throw StringError.InvalidStringFormatForIntConversionError
        }
    }
    
    func validEmail() throws -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if emailPred.evaluate(with: self) {
            return true
        } else {
            throw StringError.InvalidEmailFormatError
        }
    }
    
    func least8Characters() throws -> Bool {
        if self.count >= 8 {
            return true
        } else {
            throw StringError.NotValidPassword(numberNeeded: 8 - self.count)
        }
    }
}

class TestExtension {
    static func convertStringToInt (_ word: String) -> Int?{
        var num = 0
        do {
            num = try word.stringToInt()
        } catch StringError.InvalidStringFormatForIntConversionError {
            print("the word is not number")
        } catch {
            print("error")
        }
        return num
        
    }
    
    static func isItAnEmail(_ word: String)-> Bool {
        var boolian = false
        do {
            boolian = try word.validEmail()
        } catch StringError.InvalidEmailFormatError {
            print("tha string is not E-mail")
        } catch {
            print("error")
        }
        return boolian
    }
    
    static func validatePassword(_ password: String)-> Bool {
        var boolian = false
        do {
            boolian = try password.least8Characters()
        } catch StringError.NotValidPassword(let numberNeeded) {
            print("enter password mroe than 8 characters, you need to type \(numberNeeded) more characters")
        } catch {
            print("error")
        }
        return boolian
    }
}


var word1 = "abcd"
var word2 = "1234"
TestExtension.convertStringToInt(word1)
TestExtension.convertStringToInt(word2)

var word3 = "dgaghaghsswga;lgagsd-"
var word4 = "ali@ciccc.com"
TestExtension.isItAnEmail(word3)
TestExtension.isItAnEmail(word4)

var password1 = "srg234"
var password2 = "asdsfas23df"
TestExtension.validatePassword(password1)
TestExtension.validatePassword(password2)

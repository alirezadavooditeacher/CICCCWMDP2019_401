import UIKit

enum StringError: Error {
    case InvalidStringFormatForIntConversionError
    case InvalidEmailFormatError
    case NotValidPassword(numberNeeded:Int)
}

extension String {
    
    func convertToInt() throws -> Int{
        if let intConvert = Int(self) {
            return intConvert
        } else {
            throw StringError.InvalidStringFormatForIntConversionError
        }
    }
    
    func checkMailFormat() throws -> Bool{
        let mailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let email = NSPredicate(format:"SELF MATCHES %@", mailFormat)
        
        if email.evaluate(with: self) {
            return true
        } else {
            throw StringError.InvalidEmailFormatError
        }
    }
    
    func checkPassword() throws -> Bool{
        if self.count >= 8 {
            return true
        } else {
            throw StringError.NotValidPassword(numberNeeded: 8 - self.count)
        }
    }
}

class TestExtension {
    static func convertStringToInt(word: String) -> Int? {
        do {
            return try word.convertToInt()
        } catch StringError.InvalidStringFormatForIntConversionError {
            print("This is not number. Please type any number!")
            return nil
        } catch {
            print("Unexpected Error")
            return nil
        }
    }
    
    static func isItAnEmail(word: String) -> Bool {
        do {
            try word.checkMailFormat()
            return true
        } catch StringError.InvalidEmailFormatError {
            print("Invalid Email!")
            return false
        } catch {
            print("Unexpected Error")
            return false
        }
    }
    
    static func validatePassword(password: String) -> Bool {
        do {
            try password.checkPassword()
            return true
        } catch StringError.NotValidPassword(numberNeeded: 8 - password.count) {
            print("Please type the password that longer than 8 characters!")
            return false
        } catch {
            print("Unexpected Error")
            return false
        }
    }
    
}

var result1 = TestExtension.convertStringToInt(word: "anc")
var result2 = TestExtension.isItAnEmail(word: "aaaa")
var result3 = TestExtension.validatePassword(password: "abc")

print(result1, result2, result3)


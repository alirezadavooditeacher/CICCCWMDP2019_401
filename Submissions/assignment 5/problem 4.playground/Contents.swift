import UIKit

enum StringError : Error {
    case InvalidStringFormatForIntConversionError
    case InvalidEmailFormatError
    case NotValidPassword(numberNeeded: Int)
}

extension String {
    func convertToInt() throws -> Int {
        if let result = Int(self) {
            return result
        } else {
            throw StringError.InvalidStringFormatForIntConversionError
        }
    }
    func isValidEmail() throws -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if emailPred.evaluate(with: self) {
            return true
        } else {
            throw StringError.InvalidEmailFormatError
        }
    }
    func passwordStrength() throws -> Bool {
        if self.count >= 8 {
            return true
        } else {
            throw StringError.NotValidPassword(numberNeeded: 8 - self.count)
        }
    }
}

class TestExtension {
    static func convertStringToInt (word: String) -> Int {
        var result = 0
        do {
            result = try word.convertToInt()
        } catch StringError.InvalidStringFormatForIntConversionError {
            print("It was not possible to convert this string into an Integer")
        } catch {
            print("An unexpected error ocurred")
        }
        return result
    }
    static func isItAnEmail (word: String) -> Bool {
        var result = false
        do {
            result = try word.isValidEmail()
        } catch StringError.InvalidEmailFormatError {
            print("This is not a valid email")
        } catch {
            print("An unexpected error ocurred")
        }
        return result
    }
    static func validatePassword(password: String) -> Bool {
        var result = false
        do {
            result = try password.passwordStrength()
        } catch StringError.NotValidPassword(let numberNeeded) {
            print("This password is not strong enought. It needs more \(numberNeeded) characters")
        } catch {
            print("An unexpected error ocurred")
        }
        return result
    }
}

var string1 = "134"
var string2 = "a@b.cc"
var string3 = "pass"

var result1 = TestExtension.convertStringToInt(word: string1)
var result2 = TestExtension.isItAnEmail(word: string2)
var result3 = TestExtension.validatePassword(password: string3)

print(result1, result2, result3)

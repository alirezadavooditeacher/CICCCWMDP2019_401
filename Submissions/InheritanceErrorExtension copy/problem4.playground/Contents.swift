//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

enum StringError:Error{
    case InvalidStringFormatForIntConversionError
    case InvalidEmailFormatError
    case NotValidPassword(numberNeeded: Int)
}

extension String {
    func convertStringToInt()  throws ->Int? {

        if let newString = Int(self){
            return newString
        } else {
            throw StringError.InvalidStringFormatForIntConversionError
        }
    }
    
    func isVaildEmail() throws -> Bool {
        var IndexAtMark = 0
        var result = false
        
        for (index, value) in self.enumerated() {
            if value == "@"{
                IndexAtMark = index
                break
            }
        }
        
        for _ in IndexAtMark ..< self.count {
            if self.contains(".com") {
                result = true
            }
        }
        
        if result == true {
            print("this is vaild e-mail address: \(self)")
            return result
        } else {
            throw StringError.InvalidEmailFormatError
        }
        
}
    
    func isEnoughLong() throws -> Int? {
        var countChar = 0
        for _ in self {
            countChar += 1
        }
        var NumNeeded = 0
        
        if countChar < 8 {
            NumNeeded = 8 - countChar
            throw StringError.NotValidPassword(numberNeeded: NumNeeded)
        }
        
        if NumNeeded > 0 {
            return NumNeeded
        } else {
            return nil
        }
        
    }

}


class TestExtension {
    static func convertStringToInt (word: String) -> Int? {
        do {
            try word.convertStringToInt()
        } catch  StringError.InvalidStringFormatForIntConversionError {
            print("can't convert from \(word) to Int")
        } catch {
            print("unexpected error : \(error)")
        }
        return Int(word)
    }
    
    static func isItAnEmail(word: String)-> Bool {
        do {
            try word.isVaildEmail()
        } catch  StringError.InvalidEmailFormatError {
            return false
        } catch {
            print("unexpected error : \(error)")
            return false
        }
        return true
    }
    static func validatePassword(password: String)-> Bool {
        
        do {
            try password.isEnoughLong()
        } catch StringError.NotValidPassword(let numberNeeded) {
            print("you need to input more \(numberNeeded) words.")
            return false
        } catch {
            print("unexpected error : \(error)")
            return false
        }
        return true
    }

    }
    
var string1 = "happy birthday"
var string2 = "heyJude@icloud.com"
var string3 = "abcdef"


var test1 = TestExtension.convertStringToInt(word: string1)
var test2 = TestExtension.isItAnEmail(word: string2)
var test3 = TestExtension.validatePassword(password: string3)

print("this is test1 : \(test1)")
print("this is test 2 : \(test2)")
print("this is test3 \(test3)")

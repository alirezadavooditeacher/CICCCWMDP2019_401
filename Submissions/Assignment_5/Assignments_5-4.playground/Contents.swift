import UIKit

enum StringError:Error{
    case InvalidStringFormatIntConverionError
    case InvalidEmailFormatError
    case NotValidPassword(numberNeeded:Int)
}

extension String{
    func num()throws{
        guard Int(self) != nil else{
            throw StringError.InvalidStringFormatIntConverionError
        }
    }
    
    func email()throws{
        let emailRegex = "[A-Z0-9a-z._]+@[A-Z0-9a-z.-_]+\\.[A-Za-z]{2,3}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@",emailRegex)
        guard emailPred.evaluate(with: self) else{
            throw StringError.InvalidEmailFormatError
        }
    }
    func password()throws -> Int{
        if self.count > 8 {return 0}
        else{
            let neededNum = 8 - self.count
            throw StringError.NotValidPassword(numberNeeded: neededNum)
        }
    }
}

class TestExtension{
    static func convertStringToInt(word:String)->Int?{
        do{
            try word.num()
            print(word)
            return Int(word)
        }catch StringError.InvalidStringFormatIntConverionError{
            print("It has chars in the String. It can not be converted into Interger ")
            return nil
        }catch{
            print("Invalid Error")
            return nil
        }
    }
    static func isItAnEmail(word:String)->Bool{
        do{
            try word.email()
            print("Correct form:\(word)")
            return true
        }catch StringError.InvalidEmailFormatError{
            print("It is incorrect email format.")
            return false
        }catch{
            print("Invalid Error")
            return false
        }
    }
    static func validatePassword(word:String)->Bool{
        do{
            try word.password()
            print("Password length is correct")
            return true
        }catch StringError.NotValidPassword(numberNeeded: 8 - word.count){
            print("Password needs \(8 - word.count) more characters")
            return false
        }catch{
            print("Invalid Error")
            return false
        }
    }
}

TestExtension.convertStringToInt(word: "1245")
TestExtension.convertStringToInt(word: "1245f")
TestExtension.isItAnEmail(word: "ff")
TestExtension.isItAnEmail(word: "rrr@hh.com")
TestExtension.validatePassword(word: "ertyd")
TestExtension.validatePassword(word: "ruw445ue5u")

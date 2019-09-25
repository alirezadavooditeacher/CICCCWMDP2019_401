import UIKit

protocol SpecialStringProtocol{
    func verifiableStringForACondition(_ conditionPredicate:(String)-> Bool)-> Bool
    func repeatedString()->Bool
}

extension String: SpecialStringProtocol{
    func check(str:String)-> Bool{
        return str.repeatedString()
    }
    func verifiableStringForACondition(_ conditionPredicate:(String)-> Bool)-> Bool{
        return conditionPredicate(self)
    }
    func repeatedString()->Bool{
        var front = ""
        var back = ""
        var counting = 0
        let length = self.count
        if length % 2 != 0 {return false}
        else{
            for char in self{
                if counting < (length/2){
                    front.insert(char, at: self.firstIndex(of: char)!)
                }
                else{
                    back.insert(char, at: self.firstIndex(of: char)!)
                }
                counting += 1
            }
            if front == back{return true}
            else{return false}
        }
    }
}
var str1 = "ababc"
str1.repeatedString()
str1.verifiableStringForACondition(str1.check(str:))

str1 = "AliAli"
str1.repeatedString()
str1.verifiableStringForACondition(str1.check(str:))

import Cocoa

var str = "Hello, playground"

protocol SpecialStringProtocol {
    //it checks whether a given condition is met on the current string
    func verifiableStringForACondition( _ conditionPredicate: (String)->Bool ) -> Bool
    /*it checks whether the string is a double repeated string. For instance abab is a double
    repeated because the ab is repeated 2 times. Or AliAli is also double repeated.*/
    func repeatedString()-> Bool
}

class extendSpecialStringProtocol: SpecialStringProtocol {
    func verifiableStringForACondition(_ conditionPredicate: (String) -> Bool) -> Bool {
        let isTrue = conditionPredicate("lafjlaRoseasflka")
        if isTrue {
            print(isTrue)
            return isTrue
        } else {
            print(false)
            return false
        }
    
    }
    
    var originString = "aliali"
    
    func repeatedString() -> Bool {
        
        let middle = originString.count / 2
        var prefix = ""
        var suffix = ""
        for (index, value) in originString.enumerated() {
            if index < middle {
                prefix.append(value)
            } else {
                suffix.append(value)
            }
        }
        
        if prefix == suffix {
            print(true)
            return true
        } else{
            print(false)
            return false
        }
    }
}

let ExtendSpecialStringProtocol = extendSpecialStringProtocol()
ExtendSpecialStringProtocol.verifiableStringForACondition({ (_ s1) in return s1.contains("R")})
ExtendSpecialStringProtocol.repeatedString()



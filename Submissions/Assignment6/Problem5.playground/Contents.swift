import UIKit

protocol SpecialStringProtocol {
    //it checks whether a given condition is met on the current string
    func verifiableStringForACondition( _ conditionPredicate: (String)->Bool) -> Bool
    
    /*it checks whether the string is a double repeated string. For instance abab is a double
    repeated because the ab is repeated 2 times. Or AliAli is also double repeated.*/
    func repeatedString()-> Bool
}

extension String:SpecialStringProtocol {
    func verifiableStringForACondition(_ conditionPredicate: (String) -> Bool) -> Bool {
        return conditionPredicate(self)
    }
    
    func repeatedString() -> Bool {
        let length = self.count
        
        guard length % 2 == 0 else {
            return false
        }
        
        let prefixStr = self.prefix(length/2) // 先頭３文字の「ABC」
        let suffixStr = self.suffix(length/2) // 末尾2文字の「FG」
        
        return prefixStr == suffixStr
    }
    func check(str:String)-> Bool{
        return str.repeatedString()
    }
}
let str = "AliAli"
str.verifiableStringForACondition(str.check(str:))

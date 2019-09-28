import UIKit

/* Problem5
 Consider the following protocol: protocol SpecialStringProtocol {
 it checks whether a given condition is met on the current string
 func verifiableStringForACondition( _ conditionPredicate: String->Bool) -> Bool
 it checks whether the string is a double repeated string. For instance abab is a double repeated because the ab is repeated 2 times. Or AliAli is also double repeated.
 func repeatedString()-> Bool }
 Now, extend the String type to have the above requirements defined in the above protocol and also write some test scenarios to show how it works.
 */

protocol SpecialStringProtocol {
    //it checks whether a given condition is met on the current string
    func verifiableStringForACondition(_ conditionPredicate: () -> Bool) -> Bool
    /*it checks whether the string is a double repeated string. For instance abab is a double repeated because
     the ab is repeated 2 times. Or AliAli is also double repeated.*/
    func repeatedString() -> Bool
}

extension String: SpecialStringProtocol {
    func verifiableStringForACondition(_ conditionPredicate: () -> Bool) -> Bool {
        return conditionPredicate()
    }
    func repeatedString() -> Bool {
        if self.count % 2 > 0 {
            return false
        } else {
            if self.prefix(self.count / 2) == self.suffix(self.count / 2){
                return true
            } else {
                return false
            }
        }
    }
}

let str1 = "abcabc"
let str2 = "abcab"
let str3 = "abcdef"


print("\(str1) is \(str1.verifiableStringForACondition(str1.repeatedString))")
print("\(str2) is \(str2.verifiableStringForACondition(str2.repeatedString))")
print("\(str3) is \(str3.verifiableStringForACondition(str3.repeatedString))")

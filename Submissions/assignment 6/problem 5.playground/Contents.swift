import UIKit

protocol SpecialStringProtocol {
    func verifiableStringForACondition(_ conditionPredicate: ()->Bool) -> Bool
    func repeatedString() -> Bool
}

extension String: SpecialStringProtocol {
    func verifiableStringForACondition(_ conditionPredicate: () -> Bool) -> Bool {
        return conditionPredicate()
    }
    
    func repeatedString() -> Bool {
        if self.count % 2 != 0 {
            return false
        }
        let start = self.prefix(self.count / 2)
        let end = self.suffix(self.count / 2)
        return start == end
    }
}

let s1 = "abab"
print(s1.verifiableStringForACondition(s1.repeatedString))

let s2 = "abcab"
print(s2.verifiableStringForACondition(s2.repeatedString))

let s3 = "abad"
print(s3.verifiableStringForACondition(s3.repeatedString))

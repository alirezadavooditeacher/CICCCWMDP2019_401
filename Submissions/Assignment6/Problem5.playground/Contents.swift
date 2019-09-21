import UIKit

protocol SpecialStringProtocol {
    func verifiableStringForACondition(_ conditionPredicate: () -> Bool) -> Bool
    func repeatedString() -> Bool
}

extension String: SpecialStringProtocol {
    func verifiableStringForACondition(_ conditionPredicate: () -> Bool) -> Bool {
        return conditionPredicate()
    }
    
    func repeatedString() -> Bool {
        let length = self.count
        let middle = length / 2
        
        let firstWord = self.prefix(middle)
        let secondWord = self.suffix(middle)
    
        return firstWord == secondWord
    }
    
    
}

let predicate1 = {(word: String) -> Bool in return word.count > 1}

var word = "LucasLucas"
word.verifiableStringForACondition(word.repeatedString)
word.repeatedString()


import UIKit

var s = "dad"
func palindromeIndex(s: String) -> Int {
    let reversed = String(s.reversed())
    
    if s == reversed {
        return -1
    }
    
    var newString = ""
    var removedIndex:Int? = nil
    for (index, character) in reversed.enumerated() {
        if removedIndex == nil && character != s[s.index(s.startIndex, offsetBy:index)] {
            removedIndex = index
        } else {
            newString.append(character)
        }
    }
    
    let newReversed = String(newString.reversed())
    if newString != newReversed {
        return -1
    } else {
        return removedIndex!
    }
}
print(palindromeIndex(s: s))

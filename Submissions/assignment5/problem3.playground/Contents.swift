import UIKit

/* Problem 3: Extensions
 Write two extensions for String
 • Extension1:
 o Add an instance method which checks whether the string is palindrome or not.
   The signature is: func isPalindrome () -> Bool
 o Add an instance method which returns the reverse of the string func reverseIt()-> String
 
 • Extension2:
 o Add an instance computed property which represents number of digits in the string
 o add an instance computed property which represents the uppercase version of the string
*/


extension String {
    func reverseInt() -> String {
        return String(self.reversed())
    }
    
    func isPalindrome() -> Bool {
        if self == reverseInt() {
            return true
        } else {
            return false
        }
    }
    
}

extension String {
    var length: Int {
        return self.count
    }
    
    var uppercaseL: String {
        return self.uppercased()
    }
}

let word = "banana"
let r = word.reverseInt()
print("\(word)\npalindrome? \(word.isPalindrome())\nlength: \(word.length)\nuppercase letter: \(word.uppercaseL)")



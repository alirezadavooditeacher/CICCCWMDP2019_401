import UIKit

extension String {
    func isPalindrome() -> Bool {
        return self == String(self.reversed())
    }
    func reverseIt() -> String {
        return String(self.reversed())
    }
}

extension String {
    var numberOfDigits: String { return String(self.count)}
    var toUppercase: String { return self.toUppercase }
}

var str = "abba"
print(str.isPalindrome())
print(str.reverseIt())
print(str.numberOfDigits)
print(str.toUppercase)

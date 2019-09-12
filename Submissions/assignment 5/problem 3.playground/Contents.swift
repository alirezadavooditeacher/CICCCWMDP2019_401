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
    var lenth: Int {
        return self.count
    }
    var upper: String {
        return self.uppercased()
    }
}

var s = "adad"
print(s.isPalindrome())
print(s.reverseIt())
print(s.lenth)
print(s.upper)
